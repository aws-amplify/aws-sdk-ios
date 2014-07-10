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
#import "../core/AWSMobileAnalyticsContext.h"

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

@property (nonatomic, strong, readonly) NSDate*   startTime;
@property (nonatomic, strong, readonly) NSDate*   stopTime;
@property (nonatomic, strong, readonly) NSString* sessionId;

//- Static Constant Getters -------------- -\\ -
+ (NSString *) SESSION_ID_DATE_FORMAT;
+ (NSString *) SESSION_ID_TIME_FORMAT;
+ (char)       SESSION_ID_DELIMITER;
+ (char)       SESSION_ID_PAD_CHAR;
+ (unsigned int) SESSION_ID_APP_KEY_LENGTH;
+ (unsigned int) SESSION_ID_UNIQ_ID_LENGTH;
//---------------------------------------- -// -

/**
 * Static Constructor
 *
 * Requires Insights context for unique session id generation.
 */
+ (id) sessionWithContext: (id<AWSMobileAnalyticsContext>) context;

+ (id) sessionWithSessionId:(NSString *)sessionId withStartTime:(NSDate*)startTime withStopTime:(NSDate*)stopTime;

/**
 *
 */
- (UTCTimeMillis) timeDurationInMillis;

/**
 *
 */
- (void) stop;

- (BOOL) isPaused;

- (void) pause;

- (void) resume;

@end
