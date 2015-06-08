/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */


#import "AWSMobileAnalyticsDefaultHttpClient.h"

#import <Bolts/Bolts.h>
#import <GZIP/GZIP.h>
#import "AWSCore.h"
#import "AWSMobileAnalyticsInstanceIdInterceptor.h"
#import "AWSMobileAnalyticsClientContextInterceptor.h"
#import "AWSMobileAnalyticsDefaultSessionClient.h"
#import "AWSLogging.h"
#import "AWSMobileAnalyticsERS.h"
#import "AWSClientContext.h"

@interface AWSMobileAnalyticsDefaultHttpClient()

@property (nonatomic, strong) NSMutableArray *interceptors;

@end

@implementation AWSMobileAnalyticsDefaultHttpClient

+ (AWSMobileAnalyticsDefaultHttpClient *)httpClient {
    return [[AWSMobileAnalyticsDefaultHttpClient alloc] init];
}

- (id)init {
    if(self = [super init]) {
        _interceptors = [NSMutableArray array];
    }
    return self;
}

- (void)addInterceptor:(id<AWSMobileAnalyticsInterceptor>)theInterceptor {
    if(theInterceptor == nil) {
        return;
    }

    [self.interceptors addObject:theInterceptor];
}

- (id<AWSMobileAnalyticsRequest>)freshRequest {
    return [[AWSMobileAnalyticsDefaultRequest alloc] init];
}

- (id<AWSMobileAnalyticsResponse>)execute:(id<AWSMobileAnalyticsRequest>)request
                              withRetries:(int)retries
                              withTimeout:(NSTimeInterval)timeout {
    return [self execute:request
             withRetries:retries
             withTimeout:timeout
        withRetryHandler:nil];
}

- (id<AWSMobileAnalyticsResponse>)execute:(id<AWSMobileAnalyticsRequest>)theRequest
                              withRetries:(int)theRetries
                              withTimeout:(NSTimeInterval)theTimeout
                         withRetryHandler:(RetryHandler)theRetryHandler {
    __block AWSMobileAnalyticsDefaultResponse *response = [[AWSMobileAnalyticsDefaultResponse alloc] init];
    if(theRequest == nil) {
        response.originatingRequest = theRequest;
        response.code = 0;
        response.message = @"Nil request";
        return response;
    }

    //Apply the interceptors to the built request
    for(id<AWSMobileAnalyticsInterceptor> interceptor in self.interceptors) {
        [interceptor before:theRequest];
    }

    AWSMobileAnalyticsERS *ers = self.ers;
    if (ers == nil){
        AWSLogError( @"AWSMobileAnalyticsERS is nil.");
    }

    AWSMobileAnalyticsERSPutEventsInput *putEventInput = [AWSMobileAnalyticsERSPutEventsInput new];

    //The client-Context-id in the header. Should be moved to ClientContext.
    NSString *clientContextString = [[theRequest headers] objectForKey:AWSClientContextHeader];
    NSMutableDictionary *clientContextDic = [[NSJSONSerialization JSONObjectWithData: [clientContextString dataUsingEncoding:NSUTF8StringEncoding]
                                                                             options:kNilOptions
                                                                               error:NULL] mutableCopy];
    if (clientContextDic
        && [clientContextDic isKindOfClass:[NSDictionary class]]
        && [[theRequest headers] objectForKey:INSTANCE_ID_HEADER_KEY]) {
        NSMutableDictionary *mutableClientDic = [clientContextDic[@"client"] mutableCopy];
        [mutableClientDic setObject:[[theRequest headers] objectForKey:INSTANCE_ID_HEADER_KEY] forKey:@"client_id"];
        [clientContextDic setObject:mutableClientDic forKey:@"client"];
    }

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:clientContextDic
                                                       options:kNilOptions
                                                         error:NULL];
    if (jsonData) {
        putEventInput.clientContext = [[NSString alloc] initWithData:jsonData
                                                            encoding:NSUTF8StringEncoding];
    }

    //adapt the body
    if ([theRequest postBody]) {
        NSData *unzippedBody = [[theRequest postBody] gunzippedData];
        NSArray *sourceEventsArray = [NSJSONSerialization JSONObjectWithData:unzippedBody options:kNilOptions error:NULL];
        NSAssert([sourceEventsArray isKindOfClass:[NSArray class]] , @"invalid postBody: postBody should be an array");

        NSMutableArray *parsedEventsArray = [NSMutableArray new];
        for (NSDictionary *event in sourceEventsArray) {

            AWSMobileAnalyticsERSEvent *serviceEvent = [AWSMobileAnalyticsERSEvent new];
            AWSMobileAnalyticsERSSession *serviceSession = [AWSMobileAnalyticsERSSession new];

            //process the attributes
            NSMutableDictionary *mutableAttributesDic = [event[@"attributes"] mutableCopy];
            NSMutableDictionary *mutableMetricsDic = [event[@"metrics"] mutableCopy];
            serviceEvent.version = mutableAttributesDic[@"ver"];
            [mutableAttributesDic removeObjectForKey:@"ver"];

            serviceSession.identifier = mutableAttributesDic[AWSSessionIDAttributeKey];
            [mutableAttributesDic removeObjectForKey:AWSSessionIDAttributeKey];

            serviceSession.startTimestamp = mutableAttributesDic[AWSSessionStartTimeAttributeKey];
            [mutableAttributesDic removeObjectForKey:AWSSessionStartTimeAttributeKey];

            //move sessionStop time attribute session section
            serviceSession.stopTimestamp = mutableAttributesDic[AWSSessionEndTimeAttributeKey];
            [mutableAttributesDic removeObjectForKey:AWSSessionEndTimeAttributeKey];

            //move session duration Time metrics to session section
            serviceSession.duration = mutableMetricsDic[AWSSessionDurationMetricKey];
            [mutableMetricsDic removeObjectForKey:AWSSessionDurationMetricKey];

            serviceEvent.session = serviceSession;
            serviceEvent.attributes = mutableAttributesDic;
            serviceEvent.metrics = mutableMetricsDic;

            //process others
            serviceEvent.eventType = event[@"event_type"];
            serviceEvent.timestamp = event[@"timestamp"];

            [parsedEventsArray addObject:serviceEvent];
        }
        putEventInput.events = parsedEventsArray;
    }

    //Attach the request to the response
    id<AWSMobileAnalyticsRequest> request = [[AWSMobileAnalyticsDefaultRequest alloc] init];
    [request setUrl:ers.configuration.URL];
    response.originatingRequest = request;

    NSDate* requestStartDate = [NSDate date];
    [[[ers putEvents:putEventInput] continueWithBlock:^id(BFTask *task) {

        NSDictionary *resultDictionary = nil;
        if (task.error) {
            response.error = task.error;
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

    }] waitUntilFinished];

    for(id<AWSMobileAnalyticsInterceptor> interceptor in self.interceptors) {
        [interceptor after:response];
    }

    return response;
}

- (NSMutableURLRequest *)buildRequest:(id<AWSMobileAnalyticsRequest>)theOriginalRequest
                          withTimeout:(NSTimeInterval)theTimeout {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:theOriginalRequest.url
                                                                cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                            timeoutInterval:theTimeout];
    if(theOriginalRequest.method == GET) {
        [request setHTTPMethod:@"GET"];
    } else if(theOriginalRequest.method == POST) {
        [request setHTTPMethod:@"POST"];
    }
    
    [request setHTTPBody:theOriginalRequest.postBody];
    [request setAllHTTPHeaderFields:theOriginalRequest.headers];
    
    return request;
}

@end
