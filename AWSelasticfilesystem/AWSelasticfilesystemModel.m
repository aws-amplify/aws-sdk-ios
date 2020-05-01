//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSelasticfilesystemModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSelasticfilesystemErrorDomain = @"com.amazonaws.AWSelasticfilesystemErrorDomain";

@implementation AWSelasticfilesystemAccessPointDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPointArn" : @"AccessPointArn",
             @"accessPointId" : @"AccessPointId",
             @"clientToken" : @"ClientToken",
             @"fileSystemId" : @"FileSystemId",
             @"lifeCycleState" : @"LifeCycleState",
             @"name" : @"Name",
             @"ownerId" : @"OwnerId",
             @"posixUser" : @"PosixUser",
             @"rootDirectory" : @"RootDirectory",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)lifeCycleStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"creating"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateCreating);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"updating"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateDeleted);
        }
        return @(AWSelasticfilesystemLifeCycleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticfilesystemLifeCycleStateCreating:
                return @"creating";
            case AWSelasticfilesystemLifeCycleStateAvailable:
                return @"available";
            case AWSelasticfilesystemLifeCycleStateUpdating:
                return @"updating";
            case AWSelasticfilesystemLifeCycleStateDeleting:
                return @"deleting";
            case AWSelasticfilesystemLifeCycleStateDeleted:
                return @"deleted";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)posixUserJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticfilesystemPosixUser class]];
}

+ (NSValueTransformer *)rootDirectoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticfilesystemRootDirectory class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemTag class]];
}

@end

@implementation AWSelasticfilesystemCreateAccessPointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"fileSystemId" : @"FileSystemId",
             @"posixUser" : @"PosixUser",
             @"rootDirectory" : @"RootDirectory",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)posixUserJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticfilesystemPosixUser class]];
}

+ (NSValueTransformer *)rootDirectoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticfilesystemRootDirectory class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemTag class]];
}

@end

@implementation AWSelasticfilesystemCreateFileSystemRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationToken" : @"CreationToken",
             @"encrypted" : @"Encrypted",
             @"kmsKeyId" : @"KmsKeyId",
             @"performanceMode" : @"PerformanceMode",
             @"provisionedThroughputInMibps" : @"ProvisionedThroughputInMibps",
             @"tags" : @"Tags",
             @"throughputMode" : @"ThroughputMode",
             };
}

+ (NSValueTransformer *)performanceModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"generalPurpose"] == NSOrderedSame) {
            return @(AWSelasticfilesystemPerformanceModeGeneralPurpose);
        }
        if ([value caseInsensitiveCompare:@"maxIO"] == NSOrderedSame) {
            return @(AWSelasticfilesystemPerformanceModeMaxIO);
        }
        return @(AWSelasticfilesystemPerformanceModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticfilesystemPerformanceModeGeneralPurpose:
                return @"generalPurpose";
            case AWSelasticfilesystemPerformanceModeMaxIO:
                return @"maxIO";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemTag class]];
}

+ (NSValueTransformer *)throughputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"bursting"] == NSOrderedSame) {
            return @(AWSelasticfilesystemThroughputModeBursting);
        }
        if ([value caseInsensitiveCompare:@"provisioned"] == NSOrderedSame) {
            return @(AWSelasticfilesystemThroughputModeProvisioned);
        }
        return @(AWSelasticfilesystemThroughputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticfilesystemThroughputModeBursting:
                return @"bursting";
            case AWSelasticfilesystemThroughputModeProvisioned:
                return @"provisioned";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticfilesystemCreateMountTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             @"ipAddress" : @"IpAddress",
             @"securityGroups" : @"SecurityGroups",
             @"subnetId" : @"SubnetId",
             };
}

@end

@implementation AWSelasticfilesystemCreateTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemTag class]];
}

@end

@implementation AWSelasticfilesystemCreationInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ownerGid" : @"OwnerGid",
             @"ownerUid" : @"OwnerUid",
             @"permissions" : @"Permissions",
             };
}

@end

@implementation AWSelasticfilesystemDeleteAccessPointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPointId" : @"AccessPointId",
             };
}

@end

@implementation AWSelasticfilesystemDeleteFileSystemPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             };
}

@end

@implementation AWSelasticfilesystemDeleteFileSystemRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             };
}

@end

@implementation AWSelasticfilesystemDeleteMountTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mountTargetId" : @"MountTargetId",
             };
}

@end

@implementation AWSelasticfilesystemDeleteTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSelasticfilesystemDescribeAccessPointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPointId" : @"AccessPointId",
             @"fileSystemId" : @"FileSystemId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSelasticfilesystemDescribeAccessPointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPoints" : @"AccessPoints",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)accessPointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemAccessPointDescription class]];
}

@end

@implementation AWSelasticfilesystemDescribeFileSystemPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             };
}

@end

@implementation AWSelasticfilesystemDescribeFileSystemsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationToken" : @"CreationToken",
             @"fileSystemId" : @"FileSystemId",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSelasticfilesystemDescribeFileSystemsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystems" : @"FileSystems",
             @"marker" : @"Marker",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)fileSystemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemFileSystemDescription class]];
}

@end

@implementation AWSelasticfilesystemDescribeLifecycleConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             };
}

@end

@implementation AWSelasticfilesystemDescribeMountTargetSecurityGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mountTargetId" : @"MountTargetId",
             };
}

@end

@implementation AWSelasticfilesystemDescribeMountTargetSecurityGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroups" : @"SecurityGroups",
             };
}

@end

@implementation AWSelasticfilesystemDescribeMountTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPointId" : @"AccessPointId",
             @"fileSystemId" : @"FileSystemId",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"mountTargetId" : @"MountTargetId",
             };
}

@end

@implementation AWSelasticfilesystemDescribeMountTargetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"mountTargets" : @"MountTargets",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)mountTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemMountTargetDescription class]];
}

@end

@implementation AWSelasticfilesystemDescribeTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSelasticfilesystemDescribeTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"nextMarker" : @"NextMarker",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemTag class]];
}

@end

@implementation AWSelasticfilesystemFileSystemDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"creationToken" : @"CreationToken",
             @"encrypted" : @"Encrypted",
             @"fileSystemId" : @"FileSystemId",
             @"kmsKeyId" : @"KmsKeyId",
             @"lifeCycleState" : @"LifeCycleState",
             @"name" : @"Name",
             @"numberOfMountTargets" : @"NumberOfMountTargets",
             @"ownerId" : @"OwnerId",
             @"performanceMode" : @"PerformanceMode",
             @"provisionedThroughputInMibps" : @"ProvisionedThroughputInMibps",
             @"sizeInBytes" : @"SizeInBytes",
             @"tags" : @"Tags",
             @"throughputMode" : @"ThroughputMode",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lifeCycleStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"creating"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateCreating);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"updating"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateDeleted);
        }
        return @(AWSelasticfilesystemLifeCycleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticfilesystemLifeCycleStateCreating:
                return @"creating";
            case AWSelasticfilesystemLifeCycleStateAvailable:
                return @"available";
            case AWSelasticfilesystemLifeCycleStateUpdating:
                return @"updating";
            case AWSelasticfilesystemLifeCycleStateDeleting:
                return @"deleting";
            case AWSelasticfilesystemLifeCycleStateDeleted:
                return @"deleted";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)performanceModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"generalPurpose"] == NSOrderedSame) {
            return @(AWSelasticfilesystemPerformanceModeGeneralPurpose);
        }
        if ([value caseInsensitiveCompare:@"maxIO"] == NSOrderedSame) {
            return @(AWSelasticfilesystemPerformanceModeMaxIO);
        }
        return @(AWSelasticfilesystemPerformanceModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticfilesystemPerformanceModeGeneralPurpose:
                return @"generalPurpose";
            case AWSelasticfilesystemPerformanceModeMaxIO:
                return @"maxIO";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sizeInBytesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticfilesystemFileSystemSize class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemTag class]];
}

+ (NSValueTransformer *)throughputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"bursting"] == NSOrderedSame) {
            return @(AWSelasticfilesystemThroughputModeBursting);
        }
        if ([value caseInsensitiveCompare:@"provisioned"] == NSOrderedSame) {
            return @(AWSelasticfilesystemThroughputModeProvisioned);
        }
        return @(AWSelasticfilesystemThroughputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticfilesystemThroughputModeBursting:
                return @"bursting";
            case AWSelasticfilesystemThroughputModeProvisioned:
                return @"provisioned";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticfilesystemFileSystemPolicyDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSelasticfilesystemFileSystemSize

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timestamp" : @"Timestamp",
             @"value" : @"Value",
             @"valueInIA" : @"ValueInIA",
             @"valueInStandard" : @"ValueInStandard",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticfilesystemLifecycleConfigurationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecyclePolicies" : @"LifecyclePolicies",
             };
}

+ (NSValueTransformer *)lifecyclePoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemLifecyclePolicy class]];
}

@end

@implementation AWSelasticfilesystemLifecyclePolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transitionToIA" : @"TransitionToIA",
             };
}

+ (NSValueTransformer *)transitionToIAJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AFTER_7_DAYS"] == NSOrderedSame) {
            return @(AWSelasticfilesystemTransitionToIARulesAfter7Days);
        }
        if ([value caseInsensitiveCompare:@"AFTER_14_DAYS"] == NSOrderedSame) {
            return @(AWSelasticfilesystemTransitionToIARulesAfter14Days);
        }
        if ([value caseInsensitiveCompare:@"AFTER_30_DAYS"] == NSOrderedSame) {
            return @(AWSelasticfilesystemTransitionToIARulesAfter30Days);
        }
        if ([value caseInsensitiveCompare:@"AFTER_60_DAYS"] == NSOrderedSame) {
            return @(AWSelasticfilesystemTransitionToIARulesAfter60Days);
        }
        if ([value caseInsensitiveCompare:@"AFTER_90_DAYS"] == NSOrderedSame) {
            return @(AWSelasticfilesystemTransitionToIARulesAfter90Days);
        }
        return @(AWSelasticfilesystemTransitionToIARulesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticfilesystemTransitionToIARulesAfter7Days:
                return @"AFTER_7_DAYS";
            case AWSelasticfilesystemTransitionToIARulesAfter14Days:
                return @"AFTER_14_DAYS";
            case AWSelasticfilesystemTransitionToIARulesAfter30Days:
                return @"AFTER_30_DAYS";
            case AWSelasticfilesystemTransitionToIARulesAfter60Days:
                return @"AFTER_60_DAYS";
            case AWSelasticfilesystemTransitionToIARulesAfter90Days:
                return @"AFTER_90_DAYS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticfilesystemListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceId" : @"ResourceId",
             };
}

@end

@implementation AWSelasticfilesystemListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemTag class]];
}

@end

@implementation AWSelasticfilesystemModifyMountTargetSecurityGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mountTargetId" : @"MountTargetId",
             @"securityGroups" : @"SecurityGroups",
             };
}

@end

@implementation AWSelasticfilesystemMountTargetDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZoneId" : @"AvailabilityZoneId",
             @"availabilityZoneName" : @"AvailabilityZoneName",
             @"fileSystemId" : @"FileSystemId",
             @"ipAddress" : @"IpAddress",
             @"lifeCycleState" : @"LifeCycleState",
             @"mountTargetId" : @"MountTargetId",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"ownerId" : @"OwnerId",
             @"subnetId" : @"SubnetId",
             };
}

+ (NSValueTransformer *)lifeCycleStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"creating"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateCreating);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"updating"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSelasticfilesystemLifeCycleStateDeleted);
        }
        return @(AWSelasticfilesystemLifeCycleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticfilesystemLifeCycleStateCreating:
                return @"creating";
            case AWSelasticfilesystemLifeCycleStateAvailable:
                return @"available";
            case AWSelasticfilesystemLifeCycleStateUpdating:
                return @"updating";
            case AWSelasticfilesystemLifeCycleStateDeleting:
                return @"deleting";
            case AWSelasticfilesystemLifeCycleStateDeleted:
                return @"deleted";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticfilesystemPosixUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gid" : @"Gid",
             @"secondaryGids" : @"SecondaryGids",
             @"uid" : @"Uid",
             };
}

@end

@implementation AWSelasticfilesystemPutFileSystemPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bypassPolicyLockoutSafetyCheck" : @"BypassPolicyLockoutSafetyCheck",
             @"fileSystemId" : @"FileSystemId",
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSelasticfilesystemPutLifecycleConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             @"lifecyclePolicies" : @"LifecyclePolicies",
             };
}

+ (NSValueTransformer *)lifecyclePoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemLifecyclePolicy class]];
}

@end

@implementation AWSelasticfilesystemRootDirectory

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationInfo" : @"CreationInfo",
             @"path" : @"Path",
             };
}

+ (NSValueTransformer *)creationInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticfilesystemCreationInfo class]];
}

@end

@implementation AWSelasticfilesystemTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSelasticfilesystemTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticfilesystemTag class]];
}

@end

@implementation AWSelasticfilesystemUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSelasticfilesystemUpdateFileSystemRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             @"provisionedThroughputInMibps" : @"ProvisionedThroughputInMibps",
             @"throughputMode" : @"ThroughputMode",
             };
}

+ (NSValueTransformer *)throughputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"bursting"] == NSOrderedSame) {
            return @(AWSelasticfilesystemThroughputModeBursting);
        }
        if ([value caseInsensitiveCompare:@"provisioned"] == NSOrderedSame) {
            return @(AWSelasticfilesystemThroughputModeProvisioned);
        }
        return @(AWSelasticfilesystemThroughputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticfilesystemThroughputModeBursting:
                return @"bursting";
            case AWSelasticfilesystemThroughputModeProvisioned:
                return @"provisioned";
            default:
                return nil;
        }
    }];
}

@end
