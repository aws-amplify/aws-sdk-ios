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
#import "AWSPinpointEvent.h"

@interface AWSPinpointDateUtils : NSObject

+ (NSString *)isoDateTimeWithTimestamp:(UTCTimeMillis)theTimeStamp;
+ (NSString *)isoDateTime:(NSDate *)theDate;
+ (UTCTimeMillis)utcTimeMillisNow;
+ (UTCTimeMillis)utcTimeMillisFromDate:(NSDate*)theDate;
+ (UTCTimeMillis)utcTimeMillisFromISO8061String:(NSString*)dateString;
+ (NSDate*)dateFromutcTimeMillis:(UTCTimeMillis)utcMillis;
+ (NSString *)iso8061FormatDateStamp:(NSDate *)theDate;
+ (NSString *)iso8061FormatDateTime:(NSDate *)theDate;
+ (NSDate*) dateFromISO8061String:(NSString*)dateString;

@end
