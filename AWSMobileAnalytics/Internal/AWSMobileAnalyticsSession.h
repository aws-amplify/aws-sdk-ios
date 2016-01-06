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

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsContext.h"

FOUNDATION_EXPORT NSString *const AWSMobileAnalyticsSessionIDDateFormat;
FOUNDATION_EXPORT NSString *const AWSMobileAnalyticsSessionIDTimeFormat;
FOUNDATION_EXPORT char const AWSMobileAnalyticsSessionIDDelimiter;
FOUNDATION_EXPORT char const AWSMobileAnalyticsSessionIDPadChar;
FOUNDATION_EXPORT NSUInteger const AWSMobileAnalyticsSessionIDAppKeyLength;
FOUNDATION_EXPORT NSUInteger const AWSMobileAnalyticsSessionIDUniqIDLength;

/**
 * An Immutable Session Object

 * Represents a developer-defined session in the Mobile Analytics SDK.
 *
 * Is (presently) only used by the Default Session Client [AWSMobileAnalyticsDefaultSessionClient]
 *   as an immutable object. It either exists - and is considered "active" - or it does
 *   not.
 *
 * @author Dirk Hortensius [hortensi@amazon.com]
 */
@interface AWSMobileAnalyticsSession : NSObject

@property (nonatomic, strong, readonly) NSDate *startTime;
@property (nonatomic, strong, readonly) NSDate *stopTime;
@property (nonatomic, strong, readonly) NSString *sessionId;

/**
 * Requires Insights context for unique session id generation.
 */
- (instancetype)initWithContext:(id <AWSMobileAnalyticsContext>)context;

- (instancetype)initWithSessionId:(NSString *)sessionId
                    withStartTime:(NSDate *)startTime
                     withStopTime:(NSDate *)stopTime;

/**
 *
 */
- (UTCTimeMillis) timeDurationInMillis;

/**
 *
 */
- (void)stop;

- (BOOL)isPaused;

- (void)pause;

- (void)resume;

@end
