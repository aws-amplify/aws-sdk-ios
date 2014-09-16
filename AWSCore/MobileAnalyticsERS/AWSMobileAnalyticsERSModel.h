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
#import "AWSNetworking.h"
#import "AWSModel.h"

FOUNDATION_EXPORT NSString *const AWSMobileAnalyticsERSErrorDomain;

typedef NS_ENUM(NSInteger, AWSMobileAnalyticsERSErrorType) {
    AWSMobileAnalyticsERSErrorUnknown,
    AWSMobileAnalyticsERSErrorIncompleteSignature,
    AWSMobileAnalyticsERSErrorInvalidClientTokenId,
    AWSMobileAnalyticsERSErrorMissingAuthenticationToken,
    AWSMobileAnalyticsERSErrorBadRequest,
};

@class AWSMobileAnalyticsERSEvent;
@class AWSMobileAnalyticsERSPutEventsInput;
@class AWSMobileAnalyticsERSSession;

/**
 * Represents a single event that happened on a client device. Attributes and metrics are optional.
 * Required parameters: [eventType, timestamp, session]
 */
@interface AWSMobileAnalyticsERSEvent : AWSModel

@property (nonatomic, strong) NSDictionary *attributes;
@property (nonatomic, strong) NSString *eventType;
@property (nonatomic, strong) NSDictionary *metrics;
@property (nonatomic, strong) AWSMobileAnalyticsERSSession *session;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *version;

@end

/**
 * Describes a set of events
 * Required parameters: [events, clientContext]
 */
@interface AWSMobileAnalyticsERSPutEventsInput : AWSRequest

@property (nonatomic, strong) NSString *clientContext;
@property (nonatomic, strong) NSArray *events;

@end

@interface AWSMobileAnalyticsERSSession : AWSModel

@property (nonatomic, strong) NSNumber *duration;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *startTimestamp;
@property (nonatomic, strong) NSString *stopTimestamp;

@end
