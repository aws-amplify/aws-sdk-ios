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
#import "AWSService.h"
#import "AWSMobileAnalyticsERSModel.h"

@class BFTask;

/**
 * A service which is used to record Amazon Mobile Analytics events
 */
@interface AWSMobileAnalyticsERS : AWSService

@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

+ (instancetype)defaultMobileAnalyticsERS;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

/**
 * Record a batch of events
 *
 * @param request A container for the necessary parameters to execute the PutEvents service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSMobileAnalyticsERSErrorDomain domian and the following error code: AWSMobileAnalyticsERSErrorBadRequest.
 *
 * @see AWSMobileAnalyticsERSPutEventsInput
 */
- (BFTask *)putEvents:(AWSMobileAnalyticsERSPutEventsInput *)request;

@end
