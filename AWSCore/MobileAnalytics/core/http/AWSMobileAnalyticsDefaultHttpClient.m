/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AWSMobileAnalyticsDefaultHttpClient.h"
#import "AWSCore.h"
#import "AWSCategory.h"
#import "AWSMobileAnalyticsInstanceIdInterceptor.h"
#import "AWSMobileAnalyticsClientContextInterceptor.h"
#import "GZIP.h"
#import "AWSMobileAnalyticsDefaultSessionClient.h"
#import "AWSLogging.h"
#import "AWSEventRecorderService.h"

NSString *const insightsDefaultRunLoopMode = @"com.amazon.insights.DefaultRunLoopMode";

@implementation AWSMobileAnalyticsDefaultHttpClient

+(AWSMobileAnalyticsDefaultHttpClient *) httpClient
{
    return [[AWSMobileAnalyticsDefaultHttpClient alloc] init];
}

-(id) init
{
    if(self = [super init])
    {
        self->_interceptors = [NSMutableArray array];
    }
    return self;
}

-(void) addInterceptor: (id<AWSMobileAnalyticsInterceptor>) theInterceptor
{
    if(theInterceptor == nil)
    {
        return;
    }
    
    [self->_interceptors addObject:theInterceptor];
}

-(id<AWSMobileAnalyticsRequest>) newRequest
{
    return [[AWSMobileAnalyticsDefaultRequest alloc] init];
}

-(id<AWSMobileAnalyticsResponse>) execute:(id<AWSMobileAnalyticsRequest>) theRequest withRetries:(int) theRetries withTimeout:(NSTimeInterval) theTimeout
{
    return [self execute:theRequest withRetries:theRetries withTimeout:theTimeout withRetryHandler:nil];
}

-(id<AWSMobileAnalyticsResponse>) execute:(id<AWSMobileAnalyticsRequest>) theRequest withRetries:(int) theRetries withTimeout:(NSTimeInterval) theTimeout withRetryHandler:(RetryHandler) theRetryHandler
{
    __block AWSMobileAnalyticsDefaultResponse *response = [[AWSMobileAnalyticsDefaultResponse alloc] init];
    if(theRequest == nil)
    {
        response.originatingRequest = theRequest;
        response.code = 0;
        response.message = @"Nil request";
        return response;
    }
    
    //Apply the interceptors to the built request
    for(id<AWSMobileAnalyticsInterceptor> interceptor in self->_interceptors)
    {
        [interceptor before:theRequest];
    }
    
    AWSEventRecorderService *ers = self.eventRecorderService;
    if (ers == nil) {
        AWSLogError( @"AWSEventRecorderService is nil! ");
    }
    
    AWSEventRecorderServicePutEventsInput *putEventInput = [AWSEventRecorderServicePutEventsInput new];
    
    //the client-Context-id in the header  should be moved to Client-Context
    NSString *clientContextString = [[theRequest headers] objectForKey:CLIENT_CONTEXT_HEADER];
    NSMutableDictionary *clientContextDic = [[NSJSONSerialization JSONObjectWithData: [clientContextString dataUsingEncoding:NSUTF8StringEncoding]
                                                                             options:kNilOptions
                                                                               error:NULL] mutableCopy];
    if (clientContextDic && [clientContextDic isKindOfClass:[NSDictionary class]] && [[theRequest headers] objectForKey:INSTANCE_ID_HEADER_KEY]) {
        NSMutableDictionary *mutableClientDic = [clientContextDic[@"client"] mutableCopy];
        [mutableClientDic setObject:[[theRequest headers] objectForKey:INSTANCE_ID_HEADER_KEY] forKey:@"client_id"];
        [clientContextDic setObject:mutableClientDic forKey:@"client"];
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:clientContextDic options:kNilOptions error:NULL];
    if (jsonData) {
        putEventInput.clientContext = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    
    //adapt the body
    if ([theRequest postBody]) {
        NSData *unzippedBody = [[theRequest postBody] gunzippedData];
        NSArray *sourceEventsArray = [NSJSONSerialization JSONObjectWithData:unzippedBody options:kNilOptions error:NULL];
        NSAssert([sourceEventsArray isKindOfClass:[NSArray class]] , @"invalid postBody: postBody should be an array");
        
        NSMutableArray *parsedEventsArray = [NSMutableArray new];
        for (NSDictionary *event in sourceEventsArray) {
            
            AWSEventRecorderServiceEvent *serviceEvent = [AWSEventRecorderServiceEvent new];
            AWSEventRecorderServiceSession *serviceSession = [AWSEventRecorderServiceSession new];
            
            //process the attributes
            NSMutableDictionary *mutableAttributesDic = [event[@"attributes"] mutableCopy];
            NSMutableDictionary *mutableMetricsDic = [event[@"metrics"] mutableCopy];
            serviceEvent.version = mutableAttributesDic[@"ver"];
            [mutableAttributesDic removeObjectForKey:@"ver"];
            
            serviceSession.id = mutableAttributesDic[SESSION_ID_ATTRIBUTE_KEY];
            [mutableAttributesDic removeObjectForKey:SESSION_ID_ATTRIBUTE_KEY];
            
            serviceSession.startTimestamp = mutableAttributesDic[SESSION_START_TIME_ATTRIBUTE_KEY];
            [mutableAttributesDic removeObjectForKey:SESSION_START_TIME_ATTRIBUTE_KEY];
            
            //move sessionStop time attribute session section
            serviceSession.stopTimestamp = mutableAttributesDic[SESSION_END_TIME_ATTRIBUTE_KEY];
            [mutableAttributesDic removeObjectForKey:SESSION_END_TIME_ATTRIBUTE_KEY];
            
            //move session duration Time metrics to session section
            serviceSession.duration = mutableMetricsDic[SESSION_DURATION_METRIC_KEY];
            [mutableMetricsDic removeObjectForKey:SESSION_DURATION_METRIC_KEY];
            
            serviceEvent.session = serviceSession;
            serviceEvent.attributes = mutableAttributesDic;
            serviceEvent.metrics = mutableMetricsDic;
            
            //process others
            serviceEvent.eventType = event[@"event_type"];
            serviceEvent.timestamp = [[NSDate date] aws_stringValue:AWSDateISO8601DateFormat3];
        
            
            
            [parsedEventsArray addObject:serviceEvent];
        }
        putEventInput.events = parsedEventsArray;
    }
    
    
    NSDate* requestStartDate = [NSDate date];
    [[[ers putEvents:putEventInput] continueWithBlock:^id(BFTask *task) {
        
        NSDictionary *resultDictionary = nil;
        if (task.error) {
            if (task.error.domain != AWSEventRecorderServiceErrorDomain || task.error.domain != AWSGeneralErrorDomain) {
                //It is client side error, assign the error and return immediately
                response.error = task.error;
                return nil;
            }
            resultDictionary = task.error.userInfo;
        } else {
            if ([task.result isKindOfClass:[NSDictionary class]]) {
                resultDictionary = task.result;
            }
        }
        
        if (resultDictionary) {
            [[resultDictionary objectForKey:@"responseHeaders"] enumerateKeysAndObjectsUsingBlock:^(NSString *headerName, id headerValue, BOOL *stop) {
                [response addHeader:headerValue withName:headerName];
            }];
            response.responseSize = [resultDictionary[@"responseDataSize"] longValue];
            response.code = [resultDictionary[@"responseStatusCode"] intValue];
        }
        
        response.isFinishedLoading = YES;
        
        // it may be possible for the timer that controls the connectionTimeout
        // to fire at the exact same as this method. To ensure a correct state,
        // reset the connection timeout since we truly did succeed if this method is
        // called. We do not process the connectionTimeout if this method
        // is called before the timer
        response.didConnectionTimeout = NO;
        
        NSTimeInterval elapsedTime = [[NSDate date] timeIntervalSinceDate:requestStartDate];
        response.timeToComplete = elapsedTime;
        
        response.requiredAttempts = 1;
        response.connectionTimeout = theTimeout;
        
        return nil;
        
    }] waitUntilFinished ];

    
//    NSMutableURLRequest *request = [self buildRequest:theRequest withTimeout:theTimeout];
//    
//    int attempts = 1;
//    int maxAttempts = (theRetries > 0) ? theRetries + 1 : 1;
//    
//    AWSLogDebug( @"Will attempt the request a maximum of %d times", maxAttempts);
//    NSTimeInterval totalRequestTime = 0.0;
//    while (attempts <= maxAttempts) {
//        
//        NSDate* requestStartDate = [NSDate date];
//        AWSLogDebug( @"Attempt %d of %d", attempts, maxAttempts);
//        
//        //Attach the request to the response
//        response.originatingRequest = theRequest;
//        
//        NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request
//                                                                         delegate:response
//                                                                 startImmediately:NO];
//        //Schedule the urlConnection to run in the currentRunLoop
//        [urlConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:insightsDefaultRunLoopMode];
//        
//        //Start the request execution
//        [urlConnection start];
//        
//        NSTimer *connectionTimeoutTimer = [NSTimer timerWithTimeInterval:theTimeout
//                                                                  target:response
//                                                                selector:@selector(processConnectionTimeout)
//                                                                userInfo:nil
//                                                                 repeats:NO];
//        
//        //Attach a timer to the currentRunLoop to timeout the execution of the request if necessary
//        [[NSRunLoop currentRunLoop] addTimer:connectionTimeoutTimer forMode:insightsDefaultRunLoopMode];
//        
//        //Block while the request has not been completed. Do not block longer
//        //than the timeout interval since a timer tick will not cause the
//        //run loop blocking call to wake up
//        NSDate* timeoutDate = [NSDate dateWithTimeIntervalSinceNow:theTimeout];
//        while (!response.isFinishedLoading) {
//            [[NSRunLoop currentRunLoop] runMode:insightsDefaultRunLoopMode beforeDate:timeoutDate];
//        }
//        
//        NSTimeInterval elapsedTime = [[NSDate date] timeIntervalSinceDate:requestStartDate];
//        AWSLogDebug( @"Time of request %f", elapsedTime);
//        totalRequestTime += elapsedTime;
//        
//        if (response.didTimeout) {
//            // cancel current connection to ensure all resources are freed
//            [urlConnection cancel];
//        }
//        
//        // always invalidate the timer so that it is removed from the run loop
//        [connectionTimeoutTimer invalidate];
//        
//        if (theRetryHandler != nil && theRetryHandler(response.code)) {
//            attempts++;
//        }
//        else {
//            break;
//        }
//        //If the request is going to be reattempted then create a new response object
//        response = [[AWSMobileAnalyticsDefaultResponse alloc] init];
//    }
//    
//    response.timeToComplete = totalRequestTime;
//    response.requiredAttempts = attempts <= maxAttempts ? attempts : maxAttempts;
//    response.connectionTimeout = theTimeout;
    
    for(id<AWSMobileAnalyticsInterceptor> interceptor in self->_interceptors)
    {
        [interceptor after:response];
    }
    
    return response;
}

-(NSMutableURLRequest *) buildRequest:(id<AWSMobileAnalyticsRequest>) theOriginalRequest withTimeout:(NSTimeInterval) theTimeout
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:theOriginalRequest.url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:theTimeout];
    if(theOriginalRequest.method == GET)
    {
        [request setHTTPMethod:@"GET"];
    }
    else if(theOriginalRequest.method == POST)
    {
        [request setHTTPMethod:@"POST"];
    }
    
    [request setHTTPBody:theOriginalRequest.postBody];
    [request setAllHTTPHeaderFields:theOriginalRequest.headers];
    return request;
}

@end
