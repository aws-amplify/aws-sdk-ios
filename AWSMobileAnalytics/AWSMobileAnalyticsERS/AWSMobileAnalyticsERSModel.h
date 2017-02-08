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
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSMobileAnalyticsERSErrorDomain;

typedef NS_ENUM(NSInteger, AWSMobileAnalyticsERSErrorType) {
    AWSMobileAnalyticsERSErrorUnknown,
    AWSMobileAnalyticsERSErrorBadRequest,
};

@class AWSMobileAnalyticsERSEvent;
@class AWSMobileAnalyticsERSPutEventsInput;
@class AWSMobileAnalyticsERSSession;

/**
 Represents a single event that happened on a client device. Attributes and metrics are optional.
 Required parameters: [eventType, timestamp, session]
 */
@interface AWSMobileAnalyticsERSEvent : AWSModel


/**
 
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable eventType;

/**
 
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable metrics;

/**
 
 */
@property (nonatomic, strong) AWSMobileAnalyticsERSSession * _Nullable session;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable timestamp;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 Describes a set of events
 Required parameters: [events, clientContext]
 */
@interface AWSMobileAnalyticsERSPutEventsInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientContext;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSMobileAnalyticsERSEvent *> * _Nullable events;

@end

/**
 
 */
@interface AWSMobileAnalyticsERSSession : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable startTimestamp;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable stopTimestamp;

@end

NS_ASSUME_NONNULL_END
