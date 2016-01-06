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

#import "AWSMobileAnalyticsSession.h"
#import "AWSMobileAnalyticsDateUtils.h"
#import "AWSMobileAnalyticsStringUtils.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSLogging.h"

NSString *const AWSMobileAnalyticsSessionIDDateFormat = @"yyyyMMdd";
NSString *const AWSMobileAnalyticsSessionIDTimeFormat = @"HHmmssSSS";
char const AWSMobileAnalyticsSessionIDDelimiter = '-';
char const AWSMobileAnalyticsSessionIDPadChar = '_';
NSUInteger const AWSMobileAnalyticsSessionIDAppKeyLength = 8;
NSUInteger const AWSMobileAnalyticsSessionIDUniqIDLength = 8;

@interface AWSMobileAnalyticsSession()

@property (nonatomic, strong, readwrite) NSDate*   stopTime;

@end

/**
 * AWSMobileAnalyticsSession Implementation
 *
 * @author Dirk Hortensius [hortensi@amazon.com]
 */
@implementation AWSMobileAnalyticsSession

//~ CONSTRUCTORS =============================================================== ~\\ =

/**
 * Constructor
 */
- (instancetype)initWithContext:(id <AWSMobileAnalyticsContext>)context {
    if(self = [super init]) {
        _sessionId = [AWSMobileAnalyticsSession generateSessionIdWithContext:context];
        _startTime = [NSDate date];
        _stopTime  = nil;
    }
    return self;
}

- (instancetype)initWithSessionId:(NSString *)sessionId
                    withStartTime:(NSDate *)startTime
                     withStopTime:(NSDate *)stopTime {
    if(self = [super init]) {
        _sessionId = sessionId;
        _startTime = startTime;
        _stopTime  = stopTime;
    }
    return self;
}

//~ ============================================================================ ~// =

/**
 * Calculates session's duration in milliseconds
 */
- (UTCTimeMillis) timeDurationInMillis
{

    UTCTimeMillis start = [AWSMobileAnalyticsDateUtils utcTimeMillisFromDate:self.startTime];
    UTCTimeMillis end = self.stopTime != nil ? [AWSMobileAnalyticsDateUtils utcTimeMillisFromDate:self.stopTime] : [AWSMobileAnalyticsDateUtils utcTimeMillisNow];

    UTCTimeMillis duration = end - start;

    AWSLogVerbose( "start: %llu", start);
    AWSLogVerbose( "end: %llu", end);
    AWSLogVerbose( "duration: %llu", duration);

    return duration;
}

/**
 * Sets the session stop to now. If the session is already stopped,
 * this call is ignored
 */
- (void) stop
{
    if(!self.stopTime)
    {
        self.stopTime = [NSDate date];
    }
}

- (BOOL) isPaused{
    return (self.stopTime != nil);
}

- (void) pause{
    if(![self isPaused]){
        self.stopTime = [NSDate date];
    }
}

- (void) resume{
    self.stopTime = nil;
}

/**
 * Generates Session ID by concatenating present AppKey, UniqueID, and Timestamp
 *
 * More Detail:
 * < https://w.amazon.com/index.php/GameLab:SessionEvents#Session_ID >
 */
+ (NSString *) generateSessionIdWithContext:(id<AWSMobileAnalyticsContext>) context
{
    // Prep Date and Formatter Objects
    NSDate *tDate = [NSDate date]; // now
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]]; // Universal Time Zone
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]]; // Assert Locale Format

    // Trimmed Application Key
    NSString * appKey = [AWSMobileAnalyticsStringUtils trimString:[context identifier]
                                                         toLength:AWSMobileAnalyticsSessionIDAppKeyLength
                                                        orPadWith:AWSMobileAnalyticsSessionIDPadChar];

    // Trimmed Unique ID
    NSString * uniqID = [AWSMobileAnalyticsStringUtils trimString:[context uniqueId]
                                                         toLength:AWSMobileAnalyticsSessionIDUniqIDLength
                                                        orPadWith:AWSMobileAnalyticsSessionIDPadChar];

    // Modified Timestamp: Day
    [dateFormatter setDateFormat:AWSMobileAnalyticsSessionIDDateFormat];
    NSString *timestamp_day = [dateFormatter stringFromDate:tDate];

    // Modified Timestamp: Time
    [dateFormatter setDateFormat:AWSMobileAnalyticsSessionIDTimeFormat];
    NSString *timestamp_time = [dateFormatter stringFromDate:tDate];

    // Assemble and return
    // <AppKey> - <UniqueID> - <Day> - <Time>
    return [NSString stringWithFormat:@"%@%c%@%c%@%c%@", appKey, AWSMobileAnalyticsSessionIDDelimiter, uniqID, AWSMobileAnalyticsSessionIDDelimiter, timestamp_day, AWSMobileAnalyticsSessionIDDelimiter, timestamp_time];
    
};

@end
