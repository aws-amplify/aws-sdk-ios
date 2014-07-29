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
#import "TMCache.h"

FOUNDATION_EXPORT NSString *const AZDateISO8601DateFormat1;
FOUNDATION_EXPORT NSString *const AZDateISO8601DateFormat2;
FOUNDATION_EXPORT NSString *const AZDateISO8601DateFormat3;
FOUNDATION_EXPORT NSString *const AZDateShortDateFormat1;

@interface NSData (AZ)

- (NSString *)az_base64EncodedString;

@end

@interface NSDate (AZ)

+ (NSDate *)az_dateFromString:(NSString *)string;
+ (NSDate *)az_dateFromString:(NSString *)string format:(NSString *)dateFormat;
- (NSString *)az_stringValue:(NSString *)dateFormat;

/**
 * Set the clock skew for the current device.  This clock skew will be used for calculating
 * signatures to AWS signatures and for parsing/converting date values from responses.
 *
 * @param clockskew the skew (in seconds) for this device.  If the clock on the device is fast, pass positive skew to correct.  If the clock on the device is slow, pass negative skew to correct.
 */
+(void)az_setRuntimeClockSkew:(NSTimeInterval)clockskew;

/**
 * Get the clock skew for the current device.
 *
 * @return the skew (in seconds) currently set for this device.  Positive clock skew implies the device is fast, negative implies the device is slow.
 */
+(NSTimeInterval)az_getRuntimeClockSkew;

+ (NSDate *)az_getDateFromMessageBody:(NSString *)messageBody;
@end

@interface NSDictionary(AZ)

- (NSDictionary *)az_removeNullValues;

@end

@interface NSObject (AZ)

- (NSDictionary *)az_properties;

- (void)az_copyPropertiesFromObject:(NSObject *)object;

@end

@interface NSString (AZ)

+ (NSString *)az_randomStringWithLength:(NSUInteger)length;
- (BOOL)az_isBase64Data;
- (NSString *)az_stringWithURLEncoding;
- (NSString *)az_stringWithURLEncodingPath;

@end

@interface NSURL (AZ)

- (NSURL *)az_URLByAppendingQuery:(NSDictionary *)query;

@end
