//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License").
// You may not use this file except in compliance with the
// License. A copy of the License is located at
//
//     http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, express or implied. See the License
// for the specific language governing permissions and
// limitations under the License.
//

#import "AWSCognitoService.h"
#import "AWSCognitoUtil.h"

#import <sqlite3.h>
#import "AWSCognitoConstants.h"
#import "AWSCognitoRecord_Internal.h"

@implementation AWSCognitoUtil

+(NSDate *)millisSinceEpochToDate:(NSNumber *)millisSinceEpoch
{
    return [NSDate dateWithTimeIntervalSince1970:([millisSinceEpoch doubleValue] / 1000)];
}

+(NSDate *)secondsSinceEpochToDate:(NSNumber *)secondsSinceEpoch
{
    return [NSDate dateWithTimeIntervalSince1970:([secondsSinceEpoch doubleValue])];
}


+ (long long)getTimeMillisForDate:(NSDate *)date
{
    if (date == nil)
    {
        date = [NSDate date];
    }
    NSTimeInterval epochSeconds = [date timeIntervalSince1970];
    NSTimeInterval adjustedSeconds = [[AWSCognitoUtil secondsSinceEpochToDate:[NSNumber numberWithDouble:epochSeconds]] timeIntervalSince1970];
    long long adjustedMilliseconds = round(adjustedSeconds * 1000);

    return adjustedMilliseconds;
}

+ (NSString *)hexEncode:(NSString *)string
{
    NSUInteger len    = [string length];
    unichar    *chars = malloc(len * sizeof(unichar));

    [string getCharacters:chars];

    NSMutableString *hexString = [[NSMutableString alloc] init];
    for (NSUInteger i = 0; i < len; i++) {
        if ((int)chars[i] < 16) {
            [hexString appendString:@"0"];
        }
        [hexString appendString:[NSString stringWithFormat:@"%x", chars[i]]];
    }
    free(chars);

    return hexString;
}

#pragma mark - Error object generations

+ (NSError *)errorRemoteDataStorageFailed:(NSString *)failureReason
{
    NSDictionary *userInfo = nil;
    if(failureReason)
    {
        userInfo = @{NSLocalizedDescriptionKey : AWSCognitoErrorRemoteDataStorageFailedDescription,
                     NSLocalizedFailureReasonErrorKey : failureReason,
                     NSLocalizedRecoverySuggestionErrorKey : AWSCognitoErrorRemoteDataStorageFailedRecoverySuggestion};
    }
    else
    {
        userInfo = @{NSLocalizedDescriptionKey : AWSCognitoErrorRemoteDataStorageFailedDescription,
                     NSLocalizedRecoverySuggestionErrorKey : AWSCognitoErrorRemoteDataStorageFailedRecoverySuggestion};
    }

    return [NSError errorWithDomain:AWSCognitoErrorDomain
                               code:AWSCognitoErrorRemoteDataStorageFailed
                           userInfo:userInfo];
}

+ (NSError *)errorInvalidDataValue:(NSString *)failureReason key:(NSString *)key value:(id)value
{
    NSDictionary *userInfo = nil;
    if(failureReason)
    {
        userInfo = @{NSLocalizedDescriptionKey : AWSCognitoErrorInvalidDataValueDescription,
                     NSLocalizedFailureReasonErrorKey : failureReason,
                     NSLocalizedRecoverySuggestionErrorKey : AWSCognitoErrorInvalidDataValueRecoverySuggestion,
                     @"key" : key,
                     @"value" : value};
    }
    else
    {
        userInfo = @{NSLocalizedDescriptionKey : AWSCognitoErrorInvalidDataValueDescription,
                     NSLocalizedRecoverySuggestionErrorKey : AWSCognitoErrorInvalidDataValueRecoverySuggestion};
    }

    return [NSError errorWithDomain:AWSCognitoErrorDomain
                               code:AWSCognitoErrorInvalidDataValue
                           userInfo:userInfo];
}

+ (NSError *)errorUserDataSizeLimitExceeded:(NSString *)failureReason
{
    NSDictionary *userInfo = nil;
    if(failureReason)
    {
        userInfo = @{NSLocalizedDescriptionKey : AWSCognitoErrorUserDataSizeLimitExceededDescription,
                     NSLocalizedFailureReasonErrorKey : failureReason,
                     NSLocalizedRecoverySuggestionErrorKey : AWSCognitoErrorUserDataSizeLimitExceededRecoverySuggestion};
    }
    else
    {
        userInfo = @{NSLocalizedDescriptionKey : AWSCognitoErrorUserDataSizeLimitExceededDescription,
                     NSLocalizedRecoverySuggestionErrorKey : AWSCognitoErrorUserDataSizeLimitExceededRecoverySuggestion};
    }

    return [NSError errorWithDomain:AWSCognitoErrorDomain
                               code:AWSCognitoErrorUserDataSizeLimitExceeded
                           userInfo:userInfo];
}

+ (NSError *)errorLocalDataStorageFailed:(NSString *)failureReason
{
    NSDictionary *userInfo = nil;
    if(failureReason)
    {
        userInfo = @{NSLocalizedDescriptionKey : AWSCognitoErrorLocalDataStorageFailedDescription,
                     NSLocalizedFailureReasonErrorKey : failureReason,
                     NSLocalizedRecoverySuggestionErrorKey : AWSCognitoErrorLocalDataStorageFailedRecoverySuggestion};
    }
    else
    {
        userInfo = @{NSLocalizedDescriptionKey : AWSCognitoErrorLocalDataStorageFailedDescription,
                     NSLocalizedRecoverySuggestionErrorKey : AWSCognitoErrorLocalDataStorageFailedRecoverySuggestion};
    }

    return [NSError errorWithDomain:AWSCognitoErrorDomain
                               code:AWSCognitoErrorLocalDataStorageFailed
                           userInfo:userInfo];
}

+ (NSError *)errorIllegalArgument:(NSString *)failureReason
{
    NSDictionary *userInfo = nil;
    if(failureReason)
    {
        userInfo = @{NSLocalizedDescriptionKey : AWSCognitoErrorIllegalArgumentDescription,
                     NSLocalizedFailureReasonErrorKey : failureReason,
                     NSLocalizedRecoverySuggestionErrorKey : AWSCognitoErrorIllegalArgumentRecoverySuggestion};
    }
    else
    {
        userInfo = @{NSLocalizedDescriptionKey : AWSCognitoErrorIllegalArgumentDescription,
                     NSLocalizedRecoverySuggestionErrorKey : AWSCognitoErrorIllegalArgumentRecoverySuggestion};
    }

    return [NSError errorWithDomain:AWSCognitoErrorDomain
                               code:AWSCognitoErrorIllegalArgument
                           userInfo:userInfo];
}

#pragma mark - Sets and array conversion helpers

+ (id)retrieveValue:(AWSCognitoRecordValue *)value {
    if(value.type == AWSCognitoRecordValueTypeString) {
        return value.string;
    }

    return nil;
}

#pragma mark Type validation
+ (BOOL)isValidRecordValueType:(AWSCognitoRecordValueType)type {
    return type >= AWSCognitoRecordValueTypeUnknown && type <= AWSCognitoRecordValueTypeDeleted;
}


#pragma mark Push notifications
+ (NSString *) pushPlatformString: (AWSCognitoSyncPlatform) pushPlatform {
    return (AWSCognitoSyncPlatformApns == pushPlatform)? AWSCognitoSyncPushApns : AWSCognitoSyncPushApnsSandbox;
}

+ (AWSCognitoSyncPlatform) pushPlatform {
 #ifdef DEBUG
    return AWSCognitoSyncPlatformApnsSandbox;
 #else
    return AWSCognitoSyncPlatformApns;
 #endif
}

+ (NSString *) deviceIdKey:(AWSCognitoSyncPlatform) pushPlatform {
    return [NSString stringWithFormat:@"Cognito-%@-DeviceId", [AWSCognitoUtil pushPlatformString:pushPlatform]];
}

+ (NSString *) deviceIdentityKey:(AWSCognitoSyncPlatform) pushPlatform {
    return [NSString stringWithFormat:@"Cognito-%@-DeviceIdentity", [AWSCognitoUtil pushPlatformString:pushPlatform]];
}

@end
