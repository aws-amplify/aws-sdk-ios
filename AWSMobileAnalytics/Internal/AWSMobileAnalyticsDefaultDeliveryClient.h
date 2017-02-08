//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsDeliveryClient.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsDeliveryPolicy.h"
#import "AWSMobileAnalyticsEventStore.h"
#import "AWSMobileAnalyticsFileEventStore.h"
#import "AWSMobileAnalyticsSerializable.h"

@class AWSMobileAnalyticsDeliveryPolicyFactory;
@class AWSMobileAnalyticsERSRequestBuilder;

@interface AWSMobileAnalyticsDefaultDeliveryClient : NSObject <AWSMobileAnalyticsDeliveryClient>

+ (instancetype)deliveryClientWithContext:(id<AWSMobileAnalyticsContext>)context
                          withWanDelivery:(BOOL)allowWANDelivery;

+ (instancetype)deliveryClientWithContext:(id<AWSMobileAnalyticsContext>)context
                          withWanDelivery:(BOOL)allowWANDelivery
                       withOperationQueue:(NSOperationQueue*)operationQueue;

- (id)initWithConfiguration:(id<AWSMobileAnalyticsConfiguring>)configuration
       withLifeCycleManager:(id<AWSMobileAnalyticsLifeCycleManager>)lifeCycleManager
          withPolicyFactory:(AWSMobileAnalyticsDeliveryPolicyFactory *)factory
         withOperationQueue:(NSOperationQueue*)operationQueue
             withEventStore:(id<AWSMobileAnalyticsEventStore>)eventStore
             withSerializer:(id<AWSMobileAnalyticsSerializer>)serializer
          withClientContext:(AWSMobileAnalyticsClientContext *) clientContext
             withERSService:(AWSMobileAnalyticsERS*)ers;

- (void)notify:(id<AWSMobileAnalyticsInternalEvent>)event;
- (void)enqueueEventForDelivery:(id<AWSMobileAnalyticsInternalEvent>)event;
- (void)attemptDelivery;
- (void)forceDeliveryAndWaitForCompletion:(BOOL)shouldWait;
- (NSArray *)batchedEvents;

@end
