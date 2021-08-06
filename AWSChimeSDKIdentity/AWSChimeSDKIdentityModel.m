//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSChimeSDKIdentityModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSChimeSDKIdentityErrorDomain = @"com.amazonaws.AWSChimeSDKIdentityErrorDomain";

@implementation AWSChimeSDKIdentityAppInstance

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceAdmin

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"admin" : @"Admin",
             @"appInstanceArn" : @"AppInstanceArn",
             @"createdTimestamp" : @"CreatedTimestamp",
             };
}

+ (NSValueTransformer *)adminJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityIdentity class]];
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceAdminSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"admin" : @"Admin",
             };
}

+ (NSValueTransformer *)adminJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityIdentity class]];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceRetentionSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelRetentionSettings" : @"ChannelRetentionSettings",
             };
}

+ (NSValueTransformer *)channelRetentionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityChannelRetentionSettings class]];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityAppInstanceUser

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceUserSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityChannelRetentionSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"retentionDays" : @"RetentionDays",
             };
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceAdminRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdminArn" : @"AppInstanceAdminArn",
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceAdminResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdmin" : @"AppInstanceAdmin",
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

+ (NSValueTransformer *)appInstanceAdminJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityIdentity class]];
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityTag class]];
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"appInstanceUserId" : @"AppInstanceUserId",
             @"clientRequestToken" : @"ClientRequestToken",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityTag class]];
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDeleteAppInstanceAdminRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdminArn" : @"AppInstanceAdminArn",
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDeleteAppInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDeleteAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceAdminRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdminArn" : @"AppInstanceAdminArn",
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceAdminResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdmin" : @"AppInstanceAdmin",
             };
}

+ (NSValueTransformer *)appInstanceAdminJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceAdmin class]];
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstance" : @"AppInstance",
             };
}

+ (NSValueTransformer *)appInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstance class]];
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUser" : @"AppInstanceUser",
             };
}

+ (NSValueTransformer *)appInstanceUserJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceUser class]];
}

@end

@implementation AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceRetentionSettings" : @"AppInstanceRetentionSettings",
             @"initiateDeletionTimestamp" : @"InitiateDeletionTimestamp",
             };
}

+ (NSValueTransformer *)appInstanceRetentionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceRetentionSettings class]];
}

+ (NSValueTransformer *)initiateDeletionTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSDKIdentityIdentity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceAdminsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceAdminsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdmins" : @"AppInstanceAdmins",
             @"appInstanceArn" : @"AppInstanceArn",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)appInstanceAdminsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceAdminSummary class]];
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceUsersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceUsersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"appInstanceUsers" : @"AppInstanceUsers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)appInstanceUsersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceUserSummary class]];
}

@end

@implementation AWSChimeSDKIdentityListAppInstancesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKIdentityListAppInstancesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstances" : @"AppInstances",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)appInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceSummary class]];
}

@end

@implementation AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"appInstanceRetentionSettings" : @"AppInstanceRetentionSettings",
             };
}

+ (NSValueTransformer *)appInstanceRetentionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceRetentionSettings class]];
}

@end

@implementation AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceRetentionSettings" : @"AppInstanceRetentionSettings",
             @"initiateDeletionTimestamp" : @"InitiateDeletionTimestamp",
             };
}

+ (NSValueTransformer *)appInstanceRetentionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceRetentionSettings class]];
}

+ (NSValueTransformer *)initiateDeletionTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSDKIdentityTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             };
}

@end
