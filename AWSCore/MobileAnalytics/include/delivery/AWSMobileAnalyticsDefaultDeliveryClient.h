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

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsDeliveryClient.h"
#import "../core/AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsDeliveryPolicyFactory.h"
#import "AWSMobileAnalyticsERSRequestBuilder.h"
#import "AWSMobileAnalyticsDeliveryPolicy.h"
#import "AWSMobileAnalyticsEventStore.h"
#import "AWSMobileAnalyticsFileEventStore.h"
#import "AWSMobileAnalyticsSerializable.h"

@interface AWSMobileAnalyticsDefaultDeliveryClient : NSObject <AWSMobileAnalyticsDeliveryClient>

+(AWSMobileAnalyticsDefaultDeliveryClient*)deliveryClientWithContext:(id<AWSMobileAnalyticsContext>)context
                                     withWanDelivery:(BOOL)allowWANDelivery;

+(AWSMobileAnalyticsDefaultDeliveryClient*)deliveryClientWithContext:(id<AWSMobileAnalyticsContext>)context
                                     withWanDelivery:(BOOL)allowWANDelivery
                                  withOperationQueue:(NSOperationQueue*)operationQueue;

-(id)initWithHttpClient:(id<AWSMobileAnalyticsHttpClient>)client
      withConfiguration:(id<AWSMobileAnalyticsConfiguring>)configuration
   withLifeCycleManager:(id<AWSMobileAnalyticsLifeCycleManager>)lifeCycleManager
      withPolicyFactory:(AWSMobileAnalyticsDeliveryPolicyFactory*)factory
     withRequestBuilder:(AWSMobileAnalyticsERSRequestBuilder*)builder
     withOperationQueue:(NSOperationQueue*)operationQueue
         withEventStore:(id<AWSMobileAnalyticsEventStore>)eventStore
         withSerializer:(id<AWSMobileAnalyticsSerializer>)serializer;

-(void) notify:(id<AWSMobileAnalyticsInternalEvent>) theEvent;
-(void) enqueueEventForDelivery:(id<AWSMobileAnalyticsInternalEvent>) theEvent;
-(void) attemptDelivery;
-(void) forceDeliveryAndWaitForCompletion:(BOOL)shouldWait;
-(NSArray*) batchedEvents;
@end
