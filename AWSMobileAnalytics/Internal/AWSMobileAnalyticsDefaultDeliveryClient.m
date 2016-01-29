//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSMobileAnalyticsDefaultDeliveryClient.h"
#import "AWSMobileAnalyticsDeliveryPolicyFactory.h"
#import "AWSMobileAnalyticsDeliveryPolicy.h"
#import "AWSMobileAnalyticsEventStore.h"
#import "AWSMobileAnalyticsFileEventStore.h"
#import "AWSMobileAnalyticsSerializable.h"
#import "AWSMobileAnalyticsSerializerFactory.h"
#import "AWSMobileAnalyticsStringUtils.h"
#import "AWSLogging.h"
#import "AWSMObileAnalyticsDefaultSessionClient.h"
#import <UIKit/UIKit.h>
#import "AWSMobileAnalyticsClientContext.h"

static NSSet *AWSMobileAnalyticsDefaultDeliveryClientRetryRequestCodes = nil;
NSUInteger const AWSMobileAnalyticsDefaultDeliveryClientMaxOperations = 1000;

@interface AWSMobileAnalyticsDefaultDeliveryClient()

@property (nonatomic, strong) id<AWSMobileAnalyticsConfiguring> configuration;
@property (nonatomic, strong) AWSMobileAnalyticsDeliveryPolicyFactory *factory;
@property (nonatomic, strong) NSOperationQueue* operationQueue;
@property (nonatomic, strong) id<AWSMobileAnalyticsEventStore> eventStore;
@property (nonatomic, strong) id<AWSMobileAnalyticsSerializer> serializer;
@property (nonatomic, strong) id backgroundObserverHandle;
@property (nonatomic, strong) AWSMobileAnalyticsClientContext *clientContext;
@property (nonatomic, strong) AWSMobileAnalyticsERS *ers;

@end

@implementation AWSMobileAnalyticsDefaultDeliveryClient

+ (void)initialize {
    if (self == [AWSMobileAnalyticsDefaultDeliveryClient class]) {
        AWSMobileAnalyticsDefaultDeliveryClientRetryRequestCodes = [NSSet setWithObjects:@401, @404, @407, @408, nil];
    }
}

+ (AWSMobileAnalyticsDefaultDeliveryClient*)deliveryClientWithContext:(id<AWSMobileAnalyticsContext>)context
                                                      withWanDelivery:(BOOL)allowWANDelivery {
    NSOperationQueue* queue = [NSOperationQueue new];
    queue.maxConcurrentOperationCount = 1;

    return [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:context
                                                              withWanDelivery:allowWANDelivery
                                                           withOperationQueue:queue];
}

+ (AWSMobileAnalyticsDefaultDeliveryClient*)deliveryClientWithContext:(id<AWSMobileAnalyticsContext>)context
                                                      withWanDelivery:(BOOL)allowWANDelivery
                                                   withOperationQueue:(NSOperationQueue *)operationQueue {
    id<AWSMobileAnalyticsEventStore> eventStore = [AWSMobileAnalyticsFileEventStore fileStoreWithContext:context];

    AWSMobileAnalyticsDeliveryPolicyFactory* factory = [AWSMobileAnalyticsDeliveryPolicyFactory factoryWithSystem:context.system
                                                                                                  withPreferences:context.system.preferences
                                                                                                withConfiguration:context.configuration
                                                                                           withAllowWanSubmission:allowWANDelivery];
    
    return [[AWSMobileAnalyticsDefaultDeliveryClient alloc] initWithConfiguration:context.configuration
                                                             withLifeCycleManager:context.system.lifeCycleManager
                                                                withPolicyFactory:factory
                                                               withOperationQueue:operationQueue
                                                                   withEventStore:eventStore
                                                                   withSerializer:[AWSMobileAnalyticsSerializerFactory serializerFromFormatType:JSON]
                                                                withClientContext:context.clientContext
                                                                   withERSService:context.ers];
}

- (id)initWithConfiguration:(id<AWSMobileAnalyticsConfiguring>)configuration
       withLifeCycleManager:(id<AWSMobileAnalyticsLifeCycleManager>)lifeCycleManager
          withPolicyFactory:(AWSMobileAnalyticsDeliveryPolicyFactory *)factory
         withOperationQueue:(NSOperationQueue*)operationQueue
             withEventStore:(id<AWSMobileAnalyticsEventStore>)eventStore
             withSerializer:(id<AWSMobileAnalyticsSerializer>)serializer
          withClientContext:(AWSMobileAnalyticsClientContext *)clientContext
             withERSService:(AWSMobileAnalyticsERS*)ers
{
    if(self = [super init]) {
        _configuration = configuration;
        _factory = factory;
        _operationQueue = operationQueue;
        _eventStore = eventStore;
        _serializer = serializer;
        _clientContext = clientContext;
        _ers = ers;
    }
    return self;
}

- (void)forceDeliveryAndWaitForCompletion:(BOOL)shouldWait {
    // create policies for submitting in the background
    NSArray* policies = [NSArray arrayWithObjects:[self.factory createConnectivityPolicy],
                         [self.factory createBackgroundSubmissionTimePolicy],
                         nil];
    [self attemptDeliveryUsingPolicies:policies];

    if(shouldWait)
    {
        [self waitForDeliveryOperations];
    }
}

- (void)waitForDeliveryOperations {
    [self.operationQueue waitUntilAllOperationsAreFinished];
}

- (void)notify:(id<AWSMobileAnalyticsInternalEvent>)event {
    [self enqueueEventForDelivery:event];
}

/*
- (BOOL)validateEvent:(id<AWSMobileAnalyticsInternalEvent>)event {
    if (![event attributeForKey:AWSSessionIDAttributeKey]) {
        AWSLogError(@"Event: '%@' Validation Error: %@ is nil", event.eventType, AWSSessionIDAttributeKey);
        return NO;
    }

    if (![event attributeForKey:AWSSessionStartTimeAttributeKey]) {
        AWSLogError(@"Event '%@' Validation Error: %@ is nil", event.eventType, AWSSessionStartTimeAttributeKey);
        return NO;
    }

    return YES;
}
*/

- (void)enqueueEventForDelivery:(id<AWSMobileAnalyticsInternalEvent>) event {
    if(self.operationQueue.operationCount >= AWSMobileAnalyticsDefaultDeliveryClientMaxOperations) {
        AWSLogError(@"The event: '%@' is being dropped because too many operations enqueued.", event.eventType);
        return;
    }
/*
    if (![self validateEvent:event]) {
        AWSLogError(@"The event '%@'is being dropped because internal validation failed.", event.eventType);
        return;
    }
*/
    [self.operationQueue addOperationWithBlock:^(void) {
        NSData* serializedEventData = [self.serializer writeObject:event];
        NSString* serializedEvent = [[NSString alloc] initWithData:serializedEventData encoding:NSUTF8StringEncoding];

        if([[AWSLogger defaultLogger] logLevel] >=  AWSLogLevelDebug) {
            NSMutableString* output = [[NSMutableString alloc]init];
            [output appendString:@"\n==========Batch Object==========\n"];
            [output appendString:serializedEvent];
            AWSLogDebug( @"%@", output);
        }

        NSError* error = nil;
        [self.eventStore put:serializedEvent withError:&error];
        if(error) {
            AWSLogError( @"event was not stored: %@", [error localizedDescription]);
        } else {
            AWSLogInfo(@"Event: '%@' recorded to local filestore", [AWSMobileAnalyticsStringUtils clipString:event.eventType
                                                                                                  toMaxChars:5
                                                                                           andAppendEllipses:YES]);
        }
    }];
}

- (void)attemptDelivery {
    NSArray* policies = @[[self.factory createForceSubmissionTimePolicy], [self.factory createConnectivityPolicy]];
    [self attemptDeliveryUsingPolicies:policies];
}

- (void)attemptDeliveryUsingPolicies:(NSArray*)policies {
    if(self.operationQueue.operationCount >= AWSMobileAnalyticsDefaultDeliveryClientMaxOperations) {
        AWSLogWarn(@"Submission request being dropped because too many operations enqueued");
        return;
    }

    [self.operationQueue addOperationWithBlock:^(void) {
        NSDate* start = [NSDate date];

        // check if we're allowed to submit and return if any policy prevents us
        for(id<AWSMobileAnalyticsDeliveryPolicy> policy in policies) {
            if(![policy isAllowed]) {
                return;
            }
        }

        BOOL successful = YES;
        long maxRequestSize = [self.configuration longForKey:AWSKeyMaxSubmissionSize withOptValue:AWSValueMaxSubmissionSize];

        // get the batched items (they are stored in the event store as json strings
        NSMutableArray* eventArray = [NSMutableArray array];
        id<AWSMobileAnalyticsEventIterator> iterator = [self.eventStore iterator];

        long currentRequestLength = 0L;
        int submissions = 0;
        int maxAllowedSubmissions = [self.configuration intForKey:AWSKeyMaxSubmissionsAllowed withOptValue:AWSValueMaxSubmissionsAllowed];

        while([iterator hasNext] && submissions < maxAllowedSubmissions) {
            long eventLength = [[iterator peek] length];
            if(currentRequestLength + eventLength <= maxRequestSize) {
                currentRequestLength += eventLength;
                [eventArray addObject:[iterator next]];
            } else {
                successful = [self submitEvents:eventArray andUpdatePolicies:policies];
                if (successful) {
                    submissions++;
                    [iterator removeReadEvents];
                    eventArray = [NSMutableArray array];
                    currentRequestLength = 0;
                } else {
                    break;
                }
            }
        }

        //Send the remainder batch to the server if everything has been successful in the previous batches
        if(successful && [eventArray count] > 0) {
            if ([self submitEvents:eventArray andUpdatePolicies:policies]) {
                [iterator removeReadEvents];
            }
        }

        NSTimeInterval totalTime = [[NSDate date] timeIntervalSinceDate:start];
        AWSLogInfo( @"Time of attemptDelivery: %f", totalTime);
    }];
}

- (NSArray *)batchedEvents {
    NSMutableArray* events = [NSMutableArray array];
    id<AWSMobileAnalyticsEventIterator> iterator = [self.eventStore iterator];
    while([iterator hasNext]) {
        [events addObject:[iterator next]];
    }
    return events;
}

- (BOOL)submitEvents:(NSArray*)events
   andUpdatePolicies:(NSArray*)policies {
    __block BOOL submitted = NO;
    
    [[[self.ers putEvents:[self putEventsInputForEvents:events]] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            AWSLogError(@"Unable to successfully deliver events to server. Error Message:%@", task.error);
            submitted = NO;
        } else {
            int responseCode = [task.result[@"responseStatusCode"] intValue];
            AWSLogVerbose( @"The http response code is %d", responseCode);
            if(responseCode / 100 == 2) {
                AWSLogInfo(@"Successful submission of %lu events. Response code:%d", (unsigned long)[events count], responseCode);
                submitted = YES;
            } else if(responseCode / 100 == 4
                      && ![AWSMobileAnalyticsDefaultDeliveryClientRetryRequestCodes containsObject:@(responseCode)]) {
                AWSLogError(@"Server rejected submission of %lu events. (Pending events will be removed from queue.) Response code:%d, Error Message:%@", (unsigned long)[events count], responseCode, task.error);
                submitted = YES;
            } else {
                AWSLogError(@"Unable to successfully deliver events to server. Response code: %d. Error Message:%@", responseCode, task.error);
            }
        }
        return nil;
    }] waitUntilFinished];
    
    // inform the policies that we've attempted a submission
    for (id<AWSMobileAnalyticsDeliveryPolicy> policy in policies) {
        [policy handleDeliveryAttempt:submitted];
    }
    
    return submitted;
}

- (AWSMobileAnalyticsERSPutEventsInput*) putEventsInputForEvents:(NSArray*) events {
    AWSMobileAnalyticsERSPutEventsInput *putEventInput = [AWSMobileAnalyticsERSPutEventsInput new];
    
    putEventInput.clientContext = [self.clientContext JSONString];
    
    NSMutableArray *parsedEventsArray = [NSMutableArray new];
    for (NSString *event in events) {
        NSDictionary *sourceEventDict = [NSJSONSerialization JSONObjectWithData:[event dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:NULL];
        
        AWSMobileAnalyticsERSEvent *serviceEvent = [AWSMobileAnalyticsERSEvent new];
        AWSMobileAnalyticsERSSession *serviceSession = [AWSMobileAnalyticsERSSession new];
        
        //process the attributes
        NSMutableDictionary *mutableAttributesDic = [sourceEventDict[@"attributes"] mutableCopy];
        NSMutableDictionary *mutableMetricsDic = [sourceEventDict[@"metrics"] mutableCopy];
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
        serviceEvent.eventType = sourceEventDict[@"event_type"];
        serviceEvent.timestamp = sourceEventDict[@"timestamp"];
        
        [parsedEventsArray addObject:serviceEvent];
    }
    putEventInput.events = parsedEventsArray;
    
    return putEventInput;
}


@end
