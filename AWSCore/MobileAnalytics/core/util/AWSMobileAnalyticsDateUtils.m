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

#import "AWSMobileAnalyticsDateUtils.h"

#define kISODateTimeFormat @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
#define kDateTimeFormat @"yyyyMMdd'T'HHmmss'Z'"
#define kDateStampFormat @"yyyyMMdd"

@implementation AWSMobileAnalyticsDateUtils

+(NSLocale *)isoTimestampLocale
{
    static NSLocale *_tsLoc = nil;
    
    if (nil == _tsLoc) {
        _tsLoc = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    }
    return _tsLoc;
}

+ (NSString *)isoDateTimeWithTimestamp:(UTCTimeMillis) theTimeStamp
{
    return [AWSMobileAnalyticsDateUtils isoDateTime:[NSDate dateWithTimeIntervalSince1970:((NSTimeInterval)theTimeStamp)/1000]];
}

+ (NSString *)isoDateTime:(NSDate *)theDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [dateFormatter setDateFormat:kISODateTimeFormat];
    [dateFormatter setLocale:[AWSMobileAnalyticsDateUtils isoTimestampLocale]];
    
    NSString *formatted = [dateFormatter stringFromDate:theDate];
    
    return formatted;
}

+ (UTCTimeMillis)utcTimeMillisNow
{
    return [AWSMobileAnalyticsDateUtils utcTimeMillisFromDate:[NSDate date]];
}

+ (UTCTimeMillis)utcTimeMillisFromDate:(NSDate*)theDate
{
    return (UTCTimeMillis) ([theDate timeIntervalSince1970] * 1000);
}

+ (NSDate*)dateFromutcTimeMillis:(UTCTimeMillis)utcMillis
{
    return [NSDate dateWithTimeIntervalSince1970:(utcMillis/1000.0)];
}

+(NSLocale *)timestampLocale
{
    static NSLocale *_tsLoc = nil;
    
    if (nil == _tsLoc) {
        _tsLoc = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    }
    return _tsLoc;
}

+ (NSString *)iso8061FormatDateStamp:(NSDate *)theDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [dateFormatter setDateFormat:kDateStampFormat];
    [dateFormatter setLocale:[AWSMobileAnalyticsDateUtils timestampLocale]];
    
    NSString *formatted = [dateFormatter stringFromDate:theDate];
    
    return formatted;
}

+ (NSString *)iso8061FormatDateTime:(NSDate *)theDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [dateFormatter setDateFormat:kDateTimeFormat];
    [dateFormatter setLocale:[AWSMobileAnalyticsDateUtils timestampLocale]];
    
    NSString *formatted = [dateFormatter stringFromDate:theDate];
    
    return formatted;
}

@end
