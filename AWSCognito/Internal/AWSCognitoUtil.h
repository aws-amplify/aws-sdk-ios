//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import "AWSCognitoRecord.h"
#import "AWSCognitoSyncModel.h"

@interface AWSCognitoUtil : NSObject

/**
 * Convert milliseconds since epoch to NSDate, with clock skew adjustment for the given date.
 *
 * @param millisSinceEpoch number of milliseconds since epoch
 *
 * @return NSDate
 */
+ (NSDate *)millisSinceEpochToDate:(NSNumber *)millisSinceEpoch;

/**
 * Convert seconds since epoch to NSDate, with clock skew adjustment for the given date.
 *
 * @param secondsSinceEpoch number of seconds since epoch
 *
 * @return NSDate
 */
+ (NSDate *)secondsSinceEpochToDate:(NSNumber *)secondsSinceEpoch;


/**
 * Get the epoch time in milliseconds, with clock skew adjustment for the given date.
 *
 * @param date The date to be converted to milliseconds 
 * 
 * @return The epoch time in milliseconds as a long long
 */
+ (long long)getTimeMillisForDate:(NSDate *)date;

+ (NSError *)errorRemoteDataStorageFailed:(NSString *)failureReason;
+ (NSError *)errorInvalidDataValue:(NSString *)failureReason key:(NSString *)key value:(id)value;
+ (NSError *)errorUserDataSizeLimitExceeded:(NSString *)failureReason;
+ (NSError *)errorLocalDataStorageFailed:(NSString *)failureReason;
+ (NSError *)errorIllegalArgument:(NSString *)failureReason;

+ (id)retrieveValue:(AWSCognitoRecordValue *)value;

+ (BOOL)isValidRecordValueType:(AWSCognitoRecordValueType)type;

/**
 * Get the push platform string for this build target
 */
+ (NSString *) pushPlatformString:(AWSCognitoSyncPlatform) pushPlatform;

/**
 * Get the push platform for this build target
 */
+ (AWSCognitoSyncPlatform) pushPlatform;

/**
 * Get the device id key for this push platform string
 */
+ (NSString *) deviceIdKey:(AWSCognitoSyncPlatform) pushPlatformString;

/**
 * Get the device identity key for this push platform string
 */
+ (NSString *) deviceIdentityKey:(AWSCognitoSyncPlatform) pushPlatformString;
@end
