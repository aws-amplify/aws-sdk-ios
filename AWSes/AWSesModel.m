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

#import "AWSesModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSesErrorDomain = @"com.amazonaws.AWSesErrorDomain";

@implementation AWSesAccessPoliciesStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesAddTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesTag class]];
}

@end

@implementation AWSesAdditionalLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limitName" : @"LimitName",
             @"limitValues" : @"LimitValues",
             };
}

@end

@implementation AWSesAdvancedOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesAdvancedSecurityOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"internalUserDatabaseEnabled" : @"InternalUserDatabaseEnabled",
             };
}

@end

@implementation AWSesAdvancedSecurityOptionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"internalUserDatabaseEnabled" : @"InternalUserDatabaseEnabled",
             @"masterUserOptions" : @"MasterUserOptions",
             };
}

+ (NSValueTransformer *)masterUserOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesMasterUserOptions class]];
}

@end

@implementation AWSesAdvancedSecurityOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesAdvancedSecurityOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesAssociatePackageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"packageID" : @"PackageID",
             };
}

@end

@implementation AWSesAssociatePackageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainPackageDetails" : @"DomainPackageDetails",
             };
}

+ (NSValueTransformer *)domainPackageDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesDomainPackageDetails class]];
}

@end

@implementation AWSesCancelElasticsearchServiceSoftwareUpdateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSesCancelElasticsearchServiceSoftwareUpdateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSoftwareOptions" : @"ServiceSoftwareOptions",
             };
}

+ (NSValueTransformer *)serviceSoftwareOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesServiceSoftwareOptions class]];
}

@end

@implementation AWSesCognitoOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"identityPoolId" : @"IdentityPoolId",
             @"roleArn" : @"RoleArn",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSesCognitoOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesCognitoOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesCompatibleVersionsMap

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceVersion" : @"SourceVersion",
             @"targetVersions" : @"TargetVersions",
             };
}

@end

@implementation AWSesCreateElasticsearchDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicies" : @"AccessPolicies",
             @"advancedOptions" : @"AdvancedOptions",
             @"advancedSecurityOptions" : @"AdvancedSecurityOptions",
             @"cognitoOptions" : @"CognitoOptions",
             @"domainEndpointOptions" : @"DomainEndpointOptions",
             @"domainName" : @"DomainName",
             @"EBSOptions" : @"EBSOptions",
             @"elasticsearchClusterConfig" : @"ElasticsearchClusterConfig",
             @"elasticsearchVersion" : @"ElasticsearchVersion",
             @"encryptionAtRestOptions" : @"EncryptionAtRestOptions",
             @"logPublishingOptions" : @"LogPublishingOptions",
             @"nodeToNodeEncryptionOptions" : @"NodeToNodeEncryptionOptions",
             @"snapshotOptions" : @"SnapshotOptions",
             @"VPCOptions" : @"VPCOptions",
             };
}

+ (NSValueTransformer *)advancedSecurityOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesAdvancedSecurityOptionsInput class]];
}

+ (NSValueTransformer *)cognitoOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesCognitoOptions class]];
}

+ (NSValueTransformer *)domainEndpointOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesDomainEndpointOptions class]];
}

+ (NSValueTransformer *)EBSOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesEBSOptions class]];
}

+ (NSValueTransformer *)elasticsearchClusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesElasticsearchClusterConfig class]];
}

+ (NSValueTransformer *)encryptionAtRestOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesEncryptionAtRestOptions class]];
}

+ (NSValueTransformer *)logPublishingOptionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSesLogPublishingOption class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)nodeToNodeEncryptionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesNodeToNodeEncryptionOptions class]];
}

+ (NSValueTransformer *)snapshotOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesSnapshotOptions class]];
}

+ (NSValueTransformer *)VPCOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesVPCOptions class]];
}

@end

@implementation AWSesCreateElasticsearchDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainStatus" : @"DomainStatus",
             };
}

+ (NSValueTransformer *)domainStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesElasticsearchDomainStatus class]];
}

@end

@implementation AWSesCreatePackageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"packageDescription" : @"PackageDescription",
             @"packageName" : @"PackageName",
             @"packageSource" : @"PackageSource",
             @"packageType" : @"PackageType",
             };
}

+ (NSValueTransformer *)packageSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesPackageSource class]];
}

+ (NSValueTransformer *)packageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TXT-DICTIONARY"] == NSOrderedSame) {
            return @(AWSesPackageTypeTxtDictionary);
        }
        return @(AWSesPackageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesPackageTypeTxtDictionary:
                return @"TXT-DICTIONARY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSesCreatePackageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"packageDetails" : @"PackageDetails",
             };
}

+ (NSValueTransformer *)packageDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesPackageDetails class]];
}

@end

@implementation AWSesDeleteElasticsearchDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSesDeleteElasticsearchDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainStatus" : @"DomainStatus",
             };
}

+ (NSValueTransformer *)domainStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesElasticsearchDomainStatus class]];
}

@end

@implementation AWSesDeletePackageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"packageID" : @"PackageID",
             };
}

@end

@implementation AWSesDeletePackageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"packageDetails" : @"PackageDetails",
             };
}

+ (NSValueTransformer *)packageDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesPackageDetails class]];
}

@end

@implementation AWSesDescribeElasticsearchDomainConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSesDescribeElasticsearchDomainConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainConfig" : @"DomainConfig",
             };
}

+ (NSValueTransformer *)domainConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesElasticsearchDomainConfig class]];
}

@end

@implementation AWSesDescribeElasticsearchDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSesDescribeElasticsearchDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainStatus" : @"DomainStatus",
             };
}

+ (NSValueTransformer *)domainStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesElasticsearchDomainStatus class]];
}

@end

@implementation AWSesDescribeElasticsearchDomainsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainNames" : @"DomainNames",
             };
}

@end

@implementation AWSesDescribeElasticsearchDomainsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainStatusList" : @"DomainStatusList",
             };
}

+ (NSValueTransformer *)domainStatusListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesElasticsearchDomainStatus class]];
}

@end

@implementation AWSesDescribeElasticsearchInstanceTypeLimitsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"elasticsearchVersion" : @"ElasticsearchVersion",
             @"instanceType" : @"InstanceType",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"m3.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM410xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.9xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC59xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.18xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC518xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.micro.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2MicroElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.small.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2SmallElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD24xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD28xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR416xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI316xlargeElasticsearch);
        }
        return @(AWSesESPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesESPartitionInstanceTypeM3MediumElasticsearch:
                return @"m3.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeM3LargeElasticsearch:
                return @"m3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM3XlargeElasticsearch:
                return @"m3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM32xlargeElasticsearch:
                return @"m3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM4LargeElasticsearch:
                return @"m4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM4XlargeElasticsearch:
                return @"m4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM42xlargeElasticsearch:
                return @"m4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM44xlargeElasticsearch:
                return @"m4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM410xlargeElasticsearch:
                return @"m4.10xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM5LargeElasticsearch:
                return @"m5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM5XlargeElasticsearch:
                return @"m5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM52xlargeElasticsearch:
                return @"m5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM54xlargeElasticsearch:
                return @"m5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM512xlargeElasticsearch:
                return @"m5.12xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR5LargeElasticsearch:
                return @"r5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR5XlargeElasticsearch:
                return @"r5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR52xlargeElasticsearch:
                return @"r5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR54xlargeElasticsearch:
                return @"r5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR512xlargeElasticsearch:
                return @"r5.12xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC5LargeElasticsearch:
                return @"c5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeC5XlargeElasticsearch:
                return @"c5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC52xlargeElasticsearch:
                return @"c5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC54xlargeElasticsearch:
                return @"c5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC59xlargeElasticsearch:
                return @"c5.9xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC518xlargeElasticsearch:
                return @"c5.18xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            case AWSesESPartitionInstanceTypeT2MicroElasticsearch:
                return @"t2.micro.elasticsearch";
            case AWSesESPartitionInstanceTypeT2SmallElasticsearch:
                return @"t2.small.elasticsearch";
            case AWSesESPartitionInstanceTypeT2MediumElasticsearch:
                return @"t2.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeR3LargeElasticsearch:
                return @"r3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR3XlargeElasticsearch:
                return @"r3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR32xlargeElasticsearch:
                return @"r3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR34xlargeElasticsearch:
                return @"r3.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR38xlargeElasticsearch:
                return @"r3.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI2XlargeElasticsearch:
                return @"i2.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI22xlargeElasticsearch:
                return @"i2.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD2XlargeElasticsearch:
                return @"d2.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD22xlargeElasticsearch:
                return @"d2.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD24xlargeElasticsearch:
                return @"d2.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD28xlargeElasticsearch:
                return @"d2.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC4LargeElasticsearch:
                return @"c4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeC4XlargeElasticsearch:
                return @"c4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC42xlargeElasticsearch:
                return @"c4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC44xlargeElasticsearch:
                return @"c4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC48xlargeElasticsearch:
                return @"c4.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR4LargeElasticsearch:
                return @"r4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR4XlargeElasticsearch:
                return @"r4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR42xlargeElasticsearch:
                return @"r4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR44xlargeElasticsearch:
                return @"r4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR48xlargeElasticsearch:
                return @"r4.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR416xlargeElasticsearch:
                return @"r4.16xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI3LargeElasticsearch:
                return @"i3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeI3XlargeElasticsearch:
                return @"i3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI32xlargeElasticsearch:
                return @"i3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI34xlargeElasticsearch:
                return @"i3.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI38xlargeElasticsearch:
                return @"i3.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI316xlargeElasticsearch:
                return @"i3.16xlarge.elasticsearch";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSesDescribeElasticsearchInstanceTypeLimitsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limitsByRole" : @"LimitsByRole",
             };
}

+ (NSValueTransformer *)limitsByRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSesLimits class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSesDescribePackagesFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PackageID"] == NSOrderedSame) {
            return @(AWSesDescribePackagesFilterNamePackageID);
        }
        if ([value caseInsensitiveCompare:@"PackageName"] == NSOrderedSame) {
            return @(AWSesDescribePackagesFilterNamePackageName);
        }
        if ([value caseInsensitiveCompare:@"PackageStatus"] == NSOrderedSame) {
            return @(AWSesDescribePackagesFilterNamePackageStatus);
        }
        return @(AWSesDescribePackagesFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesDescribePackagesFilterNamePackageID:
                return @"PackageID";
            case AWSesDescribePackagesFilterNamePackageName:
                return @"PackageName";
            case AWSesDescribePackagesFilterNamePackageStatus:
                return @"PackageStatus";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSesDescribePackagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesDescribePackagesFilter class]];
}

@end

@implementation AWSesDescribePackagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"packageDetailsList" : @"PackageDetailsList",
             };
}

+ (NSValueTransformer *)packageDetailsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesPackageDetails class]];
}

@end

@implementation AWSesDescribeReservedElasticsearchInstanceOfferingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"reservedElasticsearchInstanceOfferingId" : @"ReservedElasticsearchInstanceOfferingId",
             };
}

@end

@implementation AWSesDescribeReservedElasticsearchInstanceOfferingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"reservedElasticsearchInstanceOfferings" : @"ReservedElasticsearchInstanceOfferings",
             };
}

+ (NSValueTransformer *)reservedElasticsearchInstanceOfferingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesReservedElasticsearchInstanceOffering class]];
}

@end

@implementation AWSesDescribeReservedElasticsearchInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"reservedElasticsearchInstanceId" : @"ReservedElasticsearchInstanceId",
             };
}

@end

@implementation AWSesDescribeReservedElasticsearchInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"reservedElasticsearchInstances" : @"ReservedElasticsearchInstances",
             };
}

+ (NSValueTransformer *)reservedElasticsearchInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesReservedElasticsearchInstance class]];
}

@end

@implementation AWSesDissociatePackageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"packageID" : @"PackageID",
             };
}

@end

@implementation AWSesDissociatePackageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainPackageDetails" : @"DomainPackageDetails",
             };
}

+ (NSValueTransformer *)domainPackageDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesDomainPackageDetails class]];
}

@end

@implementation AWSesDomainEndpointOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enforceHTTPS" : @"EnforceHTTPS",
             @"TLSSecurityPolicy" : @"TLSSecurityPolicy",
             };
}

+ (NSValueTransformer *)TLSSecurityPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Policy-Min-TLS-1-0-2019-07"] == NSOrderedSame) {
            return @(AWSesTLSSecurityPolicyPolicyMinTLS10201907);
        }
        if ([value caseInsensitiveCompare:@"Policy-Min-TLS-1-2-2019-07"] == NSOrderedSame) {
            return @(AWSesTLSSecurityPolicyPolicyMinTLS12201907);
        }
        return @(AWSesTLSSecurityPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesTLSSecurityPolicyPolicyMinTLS10201907:
                return @"Policy-Min-TLS-1-0-2019-07";
            case AWSesTLSSecurityPolicyPolicyMinTLS12201907:
                return @"Policy-Min-TLS-1-2-2019-07";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSesDomainEndpointOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesDomainEndpointOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesDomainInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSesDomainPackageDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"domainPackageStatus" : @"DomainPackageStatus",
             @"errorDetails" : @"ErrorDetails",
             @"lastUpdated" : @"LastUpdated",
             @"packageID" : @"PackageID",
             @"packageName" : @"PackageName",
             @"packageType" : @"PackageType",
             @"referencePath" : @"ReferencePath",
             };
}

+ (NSValueTransformer *)domainPackageStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASSOCIATING"] == NSOrderedSame) {
            return @(AWSesDomainPackageStatusAssociating);
        }
        if ([value caseInsensitiveCompare:@"ASSOCIATION_FAILED"] == NSOrderedSame) {
            return @(AWSesDomainPackageStatusAssociationFailed);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSesDomainPackageStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DISSOCIATING"] == NSOrderedSame) {
            return @(AWSesDomainPackageStatusDissociating);
        }
        if ([value caseInsensitiveCompare:@"DISSOCIATION_FAILED"] == NSOrderedSame) {
            return @(AWSesDomainPackageStatusDissociationFailed);
        }
        return @(AWSesDomainPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesDomainPackageStatusAssociating:
                return @"ASSOCIATING";
            case AWSesDomainPackageStatusAssociationFailed:
                return @"ASSOCIATION_FAILED";
            case AWSesDomainPackageStatusActive:
                return @"ACTIVE";
            case AWSesDomainPackageStatusDissociating:
                return @"DISSOCIATING";
            case AWSesDomainPackageStatusDissociationFailed:
                return @"DISSOCIATION_FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)errorDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesErrorDetails class]];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)packageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TXT-DICTIONARY"] == NSOrderedSame) {
            return @(AWSesPackageTypeTxtDictionary);
        }
        return @(AWSesPackageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesPackageTypeTxtDictionary:
                return @"TXT-DICTIONARY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSesEBSOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EBSEnabled" : @"EBSEnabled",
             @"iops" : @"Iops",
             @"volumeSize" : @"VolumeSize",
             @"volumeType" : @"VolumeType",
             };
}

+ (NSValueTransformer *)volumeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSesVolumeTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"gp2"] == NSOrderedSame) {
            return @(AWSesVolumeTypeGp2);
        }
        if ([value caseInsensitiveCompare:@"io1"] == NSOrderedSame) {
            return @(AWSesVolumeTypeIO1);
        }
        return @(AWSesVolumeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesVolumeTypeStandard:
                return @"standard";
            case AWSesVolumeTypeGp2:
                return @"gp2";
            case AWSesVolumeTypeIO1:
                return @"io1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSesEBSOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesEBSOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesElasticsearchClusterConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dedicatedMasterCount" : @"DedicatedMasterCount",
             @"dedicatedMasterEnabled" : @"DedicatedMasterEnabled",
             @"dedicatedMasterType" : @"DedicatedMasterType",
             @"instanceCount" : @"InstanceCount",
             @"instanceType" : @"InstanceType",
             @"warmCount" : @"WarmCount",
             @"warmEnabled" : @"WarmEnabled",
             @"warmType" : @"WarmType",
             @"zoneAwarenessConfig" : @"ZoneAwarenessConfig",
             @"zoneAwarenessEnabled" : @"ZoneAwarenessEnabled",
             };
}

+ (NSValueTransformer *)dedicatedMasterTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"m3.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM410xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.9xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC59xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.18xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC518xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.micro.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2MicroElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.small.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2SmallElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD24xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD28xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR416xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI316xlargeElasticsearch);
        }
        return @(AWSesESPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesESPartitionInstanceTypeM3MediumElasticsearch:
                return @"m3.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeM3LargeElasticsearch:
                return @"m3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM3XlargeElasticsearch:
                return @"m3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM32xlargeElasticsearch:
                return @"m3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM4LargeElasticsearch:
                return @"m4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM4XlargeElasticsearch:
                return @"m4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM42xlargeElasticsearch:
                return @"m4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM44xlargeElasticsearch:
                return @"m4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM410xlargeElasticsearch:
                return @"m4.10xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM5LargeElasticsearch:
                return @"m5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM5XlargeElasticsearch:
                return @"m5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM52xlargeElasticsearch:
                return @"m5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM54xlargeElasticsearch:
                return @"m5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM512xlargeElasticsearch:
                return @"m5.12xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR5LargeElasticsearch:
                return @"r5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR5XlargeElasticsearch:
                return @"r5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR52xlargeElasticsearch:
                return @"r5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR54xlargeElasticsearch:
                return @"r5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR512xlargeElasticsearch:
                return @"r5.12xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC5LargeElasticsearch:
                return @"c5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeC5XlargeElasticsearch:
                return @"c5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC52xlargeElasticsearch:
                return @"c5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC54xlargeElasticsearch:
                return @"c5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC59xlargeElasticsearch:
                return @"c5.9xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC518xlargeElasticsearch:
                return @"c5.18xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            case AWSesESPartitionInstanceTypeT2MicroElasticsearch:
                return @"t2.micro.elasticsearch";
            case AWSesESPartitionInstanceTypeT2SmallElasticsearch:
                return @"t2.small.elasticsearch";
            case AWSesESPartitionInstanceTypeT2MediumElasticsearch:
                return @"t2.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeR3LargeElasticsearch:
                return @"r3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR3XlargeElasticsearch:
                return @"r3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR32xlargeElasticsearch:
                return @"r3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR34xlargeElasticsearch:
                return @"r3.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR38xlargeElasticsearch:
                return @"r3.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI2XlargeElasticsearch:
                return @"i2.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI22xlargeElasticsearch:
                return @"i2.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD2XlargeElasticsearch:
                return @"d2.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD22xlargeElasticsearch:
                return @"d2.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD24xlargeElasticsearch:
                return @"d2.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD28xlargeElasticsearch:
                return @"d2.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC4LargeElasticsearch:
                return @"c4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeC4XlargeElasticsearch:
                return @"c4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC42xlargeElasticsearch:
                return @"c4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC44xlargeElasticsearch:
                return @"c4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC48xlargeElasticsearch:
                return @"c4.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR4LargeElasticsearch:
                return @"r4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR4XlargeElasticsearch:
                return @"r4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR42xlargeElasticsearch:
                return @"r4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR44xlargeElasticsearch:
                return @"r4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR48xlargeElasticsearch:
                return @"r4.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR416xlargeElasticsearch:
                return @"r4.16xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI3LargeElasticsearch:
                return @"i3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeI3XlargeElasticsearch:
                return @"i3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI32xlargeElasticsearch:
                return @"i3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI34xlargeElasticsearch:
                return @"i3.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI38xlargeElasticsearch:
                return @"i3.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI316xlargeElasticsearch:
                return @"i3.16xlarge.elasticsearch";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"m3.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM410xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.9xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC59xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.18xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC518xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.micro.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2MicroElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.small.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2SmallElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD24xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD28xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR416xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI316xlargeElasticsearch);
        }
        return @(AWSesESPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesESPartitionInstanceTypeM3MediumElasticsearch:
                return @"m3.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeM3LargeElasticsearch:
                return @"m3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM3XlargeElasticsearch:
                return @"m3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM32xlargeElasticsearch:
                return @"m3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM4LargeElasticsearch:
                return @"m4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM4XlargeElasticsearch:
                return @"m4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM42xlargeElasticsearch:
                return @"m4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM44xlargeElasticsearch:
                return @"m4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM410xlargeElasticsearch:
                return @"m4.10xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM5LargeElasticsearch:
                return @"m5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM5XlargeElasticsearch:
                return @"m5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM52xlargeElasticsearch:
                return @"m5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM54xlargeElasticsearch:
                return @"m5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM512xlargeElasticsearch:
                return @"m5.12xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR5LargeElasticsearch:
                return @"r5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR5XlargeElasticsearch:
                return @"r5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR52xlargeElasticsearch:
                return @"r5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR54xlargeElasticsearch:
                return @"r5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR512xlargeElasticsearch:
                return @"r5.12xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC5LargeElasticsearch:
                return @"c5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeC5XlargeElasticsearch:
                return @"c5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC52xlargeElasticsearch:
                return @"c5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC54xlargeElasticsearch:
                return @"c5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC59xlargeElasticsearch:
                return @"c5.9xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC518xlargeElasticsearch:
                return @"c5.18xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            case AWSesESPartitionInstanceTypeT2MicroElasticsearch:
                return @"t2.micro.elasticsearch";
            case AWSesESPartitionInstanceTypeT2SmallElasticsearch:
                return @"t2.small.elasticsearch";
            case AWSesESPartitionInstanceTypeT2MediumElasticsearch:
                return @"t2.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeR3LargeElasticsearch:
                return @"r3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR3XlargeElasticsearch:
                return @"r3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR32xlargeElasticsearch:
                return @"r3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR34xlargeElasticsearch:
                return @"r3.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR38xlargeElasticsearch:
                return @"r3.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI2XlargeElasticsearch:
                return @"i2.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI22xlargeElasticsearch:
                return @"i2.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD2XlargeElasticsearch:
                return @"d2.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD22xlargeElasticsearch:
                return @"d2.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD24xlargeElasticsearch:
                return @"d2.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD28xlargeElasticsearch:
                return @"d2.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC4LargeElasticsearch:
                return @"c4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeC4XlargeElasticsearch:
                return @"c4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC42xlargeElasticsearch:
                return @"c4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC44xlargeElasticsearch:
                return @"c4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC48xlargeElasticsearch:
                return @"c4.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR4LargeElasticsearch:
                return @"r4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR4XlargeElasticsearch:
                return @"r4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR42xlargeElasticsearch:
                return @"r4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR44xlargeElasticsearch:
                return @"r4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR48xlargeElasticsearch:
                return @"r4.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR416xlargeElasticsearch:
                return @"r4.16xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI3LargeElasticsearch:
                return @"i3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeI3XlargeElasticsearch:
                return @"i3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI32xlargeElasticsearch:
                return @"i3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI34xlargeElasticsearch:
                return @"i3.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI38xlargeElasticsearch:
                return @"i3.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI316xlargeElasticsearch:
                return @"i3.16xlarge.elasticsearch";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)warmTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESWarmPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESWarmPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        return @(AWSesESWarmPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesESWarmPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSesESWarmPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)zoneAwarenessConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesZoneAwarenessConfig class]];
}

@end

@implementation AWSesElasticsearchClusterConfigStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesElasticsearchClusterConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesElasticsearchDomainConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicies" : @"AccessPolicies",
             @"advancedOptions" : @"AdvancedOptions",
             @"advancedSecurityOptions" : @"AdvancedSecurityOptions",
             @"cognitoOptions" : @"CognitoOptions",
             @"domainEndpointOptions" : @"DomainEndpointOptions",
             @"EBSOptions" : @"EBSOptions",
             @"elasticsearchClusterConfig" : @"ElasticsearchClusterConfig",
             @"elasticsearchVersion" : @"ElasticsearchVersion",
             @"encryptionAtRestOptions" : @"EncryptionAtRestOptions",
             @"logPublishingOptions" : @"LogPublishingOptions",
             @"nodeToNodeEncryptionOptions" : @"NodeToNodeEncryptionOptions",
             @"snapshotOptions" : @"SnapshotOptions",
             @"VPCOptions" : @"VPCOptions",
             };
}

+ (NSValueTransformer *)accessPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesAccessPoliciesStatus class]];
}

+ (NSValueTransformer *)advancedOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesAdvancedOptionsStatus class]];
}

+ (NSValueTransformer *)advancedSecurityOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesAdvancedSecurityOptionsStatus class]];
}

+ (NSValueTransformer *)cognitoOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesCognitoOptionsStatus class]];
}

+ (NSValueTransformer *)domainEndpointOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesDomainEndpointOptionsStatus class]];
}

+ (NSValueTransformer *)EBSOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesEBSOptionsStatus class]];
}

+ (NSValueTransformer *)elasticsearchClusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesElasticsearchClusterConfigStatus class]];
}

+ (NSValueTransformer *)elasticsearchVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesElasticsearchVersionStatus class]];
}

+ (NSValueTransformer *)encryptionAtRestOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesEncryptionAtRestOptionsStatus class]];
}

+ (NSValueTransformer *)logPublishingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesLogPublishingOptionsStatus class]];
}

+ (NSValueTransformer *)nodeToNodeEncryptionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesNodeToNodeEncryptionOptionsStatus class]];
}

+ (NSValueTransformer *)snapshotOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesSnapshotOptionsStatus class]];
}

+ (NSValueTransformer *)VPCOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesVPCDerivedInfoStatus class]];
}

@end

@implementation AWSesElasticsearchDomainStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"accessPolicies" : @"AccessPolicies",
             @"advancedOptions" : @"AdvancedOptions",
             @"advancedSecurityOptions" : @"AdvancedSecurityOptions",
             @"cognitoOptions" : @"CognitoOptions",
             @"created" : @"Created",
             @"deleted" : @"Deleted",
             @"domainEndpointOptions" : @"DomainEndpointOptions",
             @"domainId" : @"DomainId",
             @"domainName" : @"DomainName",
             @"EBSOptions" : @"EBSOptions",
             @"elasticsearchClusterConfig" : @"ElasticsearchClusterConfig",
             @"elasticsearchVersion" : @"ElasticsearchVersion",
             @"encryptionAtRestOptions" : @"EncryptionAtRestOptions",
             @"endpoint" : @"Endpoint",
             @"endpoints" : @"Endpoints",
             @"logPublishingOptions" : @"LogPublishingOptions",
             @"nodeToNodeEncryptionOptions" : @"NodeToNodeEncryptionOptions",
             @"processing" : @"Processing",
             @"serviceSoftwareOptions" : @"ServiceSoftwareOptions",
             @"snapshotOptions" : @"SnapshotOptions",
             @"upgradeProcessing" : @"UpgradeProcessing",
             @"VPCOptions" : @"VPCOptions",
             };
}

+ (NSValueTransformer *)advancedSecurityOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesAdvancedSecurityOptions class]];
}

+ (NSValueTransformer *)cognitoOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesCognitoOptions class]];
}

+ (NSValueTransformer *)domainEndpointOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesDomainEndpointOptions class]];
}

+ (NSValueTransformer *)EBSOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesEBSOptions class]];
}

+ (NSValueTransformer *)elasticsearchClusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesElasticsearchClusterConfig class]];
}

+ (NSValueTransformer *)encryptionAtRestOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesEncryptionAtRestOptions class]];
}

+ (NSValueTransformer *)logPublishingOptionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSesLogPublishingOption class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)nodeToNodeEncryptionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesNodeToNodeEncryptionOptions class]];
}

+ (NSValueTransformer *)serviceSoftwareOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesServiceSoftwareOptions class]];
}

+ (NSValueTransformer *)snapshotOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesSnapshotOptions class]];
}

+ (NSValueTransformer *)VPCOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesVPCDerivedInfo class]];
}

@end

@implementation AWSesElasticsearchVersionStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesEncryptionAtRestOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"kmsKeyId" : @"KmsKeyId",
             };
}

@end

@implementation AWSesEncryptionAtRestOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesEncryptionAtRestOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesErrorDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorMessage" : @"ErrorMessage",
             @"errorType" : @"ErrorType",
             };
}

@end

@implementation AWSesGetCompatibleElasticsearchVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSesGetCompatibleElasticsearchVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleElasticsearchVersions" : @"CompatibleElasticsearchVersions",
             };
}

+ (NSValueTransformer *)compatibleElasticsearchVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesCompatibleVersionsMap class]];
}

@end

@implementation AWSesGetUpgradeHistoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSesGetUpgradeHistoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"upgradeHistories" : @"UpgradeHistories",
             };
}

+ (NSValueTransformer *)upgradeHistoriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesUpgradeHistory class]];
}

@end

@implementation AWSesGetUpgradeStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSesGetUpgradeStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stepStatus" : @"StepStatus",
             @"upgradeName" : @"UpgradeName",
             @"upgradeStep" : @"UpgradeStep",
             };
}

+ (NSValueTransformer *)stepStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED_WITH_ISSUES"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusSucceededWithIssues);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusFailed);
        }
        return @(AWSesUpgradeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesUpgradeStatusInProgress:
                return @"IN_PROGRESS";
            case AWSesUpgradeStatusSucceeded:
                return @"SUCCEEDED";
            case AWSesUpgradeStatusSucceededWithIssues:
                return @"SUCCEEDED_WITH_ISSUES";
            case AWSesUpgradeStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)upgradeStepJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRE_UPGRADE_CHECK"] == NSOrderedSame) {
            return @(AWSesUpgradeStepPreUpgradeCheck);
        }
        if ([value caseInsensitiveCompare:@"SNAPSHOT"] == NSOrderedSame) {
            return @(AWSesUpgradeStepSnapshot);
        }
        if ([value caseInsensitiveCompare:@"UPGRADE"] == NSOrderedSame) {
            return @(AWSesUpgradeStepUpgrade);
        }
        return @(AWSesUpgradeStepUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesUpgradeStepPreUpgradeCheck:
                return @"PRE_UPGRADE_CHECK";
            case AWSesUpgradeStepSnapshot:
                return @"SNAPSHOT";
            case AWSesUpgradeStepUpgrade:
                return @"UPGRADE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSesInstanceCountLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximumInstanceCount" : @"MaximumInstanceCount",
             @"minimumInstanceCount" : @"MinimumInstanceCount",
             };
}

@end

@implementation AWSesInstanceLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceCountLimits" : @"InstanceCountLimits",
             };
}

+ (NSValueTransformer *)instanceCountLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesInstanceCountLimits class]];
}

@end

@implementation AWSesLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalLimits" : @"AdditionalLimits",
             @"instanceLimits" : @"InstanceLimits",
             @"storageTypes" : @"StorageTypes",
             };
}

+ (NSValueTransformer *)additionalLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesAdditionalLimit class]];
}

+ (NSValueTransformer *)instanceLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesInstanceLimits class]];
}

+ (NSValueTransformer *)storageTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesStorageType class]];
}

@end

@implementation AWSesListDomainNamesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainNames" : @"DomainNames",
             };
}

+ (NSValueTransformer *)domainNamesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesDomainInfo class]];
}

@end

@implementation AWSesListDomainsForPackageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"packageID" : @"PackageID",
             };
}

@end

@implementation AWSesListDomainsForPackageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainPackageDetailsList" : @"DomainPackageDetailsList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)domainPackageDetailsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesDomainPackageDetails class]];
}

@end

@implementation AWSesListElasticsearchInstanceTypesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"elasticsearchVersion" : @"ElasticsearchVersion",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSesListElasticsearchInstanceTypesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"elasticsearchInstanceTypes" : @"ElasticsearchInstanceTypes",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSesListElasticsearchVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSesListElasticsearchVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"elasticsearchVersions" : @"ElasticsearchVersions",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSesListPackagesForDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSesListPackagesForDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainPackageDetailsList" : @"DomainPackageDetailsList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)domainPackageDetailsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesDomainPackageDetails class]];
}

@end

@implementation AWSesListTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             };
}

@end

@implementation AWSesListTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesTag class]];
}

@end

@implementation AWSesLogPublishingOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogsLogGroupArn" : @"CloudWatchLogsLogGroupArn",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSesLogPublishingOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSesLogPublishingOption class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesMasterUserOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"masterUserARN" : @"MasterUserARN",
             @"masterUserName" : @"MasterUserName",
             @"masterUserPassword" : @"MasterUserPassword",
             };
}

@end

@implementation AWSesNodeToNodeEncryptionOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSesNodeToNodeEncryptionOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesNodeToNodeEncryptionOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesOptionStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"CreationDate",
             @"pendingDeletion" : @"PendingDeletion",
             @"state" : @"State",
             @"updateDate" : @"UpdateDate",
             @"updateVersion" : @"UpdateVersion",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RequiresIndexDocuments"] == NSOrderedSame) {
            return @(AWSesOptionStateRequiresIndexDocuments);
        }
        if ([value caseInsensitiveCompare:@"Processing"] == NSOrderedSame) {
            return @(AWSesOptionStateProcessing);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSesOptionStateActive);
        }
        return @(AWSesOptionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesOptionStateRequiresIndexDocuments:
                return @"RequiresIndexDocuments";
            case AWSesOptionStateProcessing:
                return @"Processing";
            case AWSesOptionStateActive:
                return @"Active";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSesPackageDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"errorDetails" : @"ErrorDetails",
             @"packageDescription" : @"PackageDescription",
             @"packageID" : @"PackageID",
             @"packageName" : @"PackageName",
             @"packageStatus" : @"PackageStatus",
             @"packageType" : @"PackageType",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)errorDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesErrorDetails class]];
}

+ (NSValueTransformer *)packageStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COPYING"] == NSOrderedSame) {
            return @(AWSesPackageStatusCopying);
        }
        if ([value caseInsensitiveCompare:@"COPY_FAILED"] == NSOrderedSame) {
            return @(AWSesPackageStatusCopyFailed);
        }
        if ([value caseInsensitiveCompare:@"VALIDATING"] == NSOrderedSame) {
            return @(AWSesPackageStatusValidating);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_FAILED"] == NSOrderedSame) {
            return @(AWSesPackageStatusValidationFailed);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSesPackageStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSesPackageStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSesPackageStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FAILED"] == NSOrderedSame) {
            return @(AWSesPackageStatusDeleteFailed);
        }
        return @(AWSesPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesPackageStatusCopying:
                return @"COPYING";
            case AWSesPackageStatusCopyFailed:
                return @"COPY_FAILED";
            case AWSesPackageStatusValidating:
                return @"VALIDATING";
            case AWSesPackageStatusValidationFailed:
                return @"VALIDATION_FAILED";
            case AWSesPackageStatusAvailable:
                return @"AVAILABLE";
            case AWSesPackageStatusDeleting:
                return @"DELETING";
            case AWSesPackageStatusDeleted:
                return @"DELETED";
            case AWSesPackageStatusDeleteFailed:
                return @"DELETE_FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)packageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TXT-DICTIONARY"] == NSOrderedSame) {
            return @(AWSesPackageTypeTxtDictionary);
        }
        return @(AWSesPackageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesPackageTypeTxtDictionary:
                return @"TXT-DICTIONARY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSesPackageSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3BucketName" : @"S3BucketName",
             @"s3Key" : @"S3Key",
             };
}

@end

@implementation AWSesPurchaseReservedElasticsearchInstanceOfferingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceCount" : @"InstanceCount",
             @"reservationName" : @"ReservationName",
             @"reservedElasticsearchInstanceOfferingId" : @"ReservedElasticsearchInstanceOfferingId",
             };
}

@end

@implementation AWSesPurchaseReservedElasticsearchInstanceOfferingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservationName" : @"ReservationName",
             @"reservedElasticsearchInstanceId" : @"ReservedElasticsearchInstanceId",
             };
}

@end

@implementation AWSesRecurringCharge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recurringChargeAmount" : @"RecurringChargeAmount",
             @"recurringChargeFrequency" : @"RecurringChargeFrequency",
             };
}

@end

@implementation AWSesRemoveTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSesReservedElasticsearchInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"duration" : @"Duration",
             @"elasticsearchInstanceCount" : @"ElasticsearchInstanceCount",
             @"elasticsearchInstanceType" : @"ElasticsearchInstanceType",
             @"fixedPrice" : @"FixedPrice",
             @"paymentOption" : @"PaymentOption",
             @"recurringCharges" : @"RecurringCharges",
             @"reservationName" : @"ReservationName",
             @"reservedElasticsearchInstanceId" : @"ReservedElasticsearchInstanceId",
             @"reservedElasticsearchInstanceOfferingId" : @"ReservedElasticsearchInstanceOfferingId",
             @"startTime" : @"StartTime",
             @"state" : @"State",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)elasticsearchInstanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"m3.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM410xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.9xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC59xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.18xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC518xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.micro.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2MicroElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.small.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2SmallElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD24xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD28xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR416xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI316xlargeElasticsearch);
        }
        return @(AWSesESPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesESPartitionInstanceTypeM3MediumElasticsearch:
                return @"m3.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeM3LargeElasticsearch:
                return @"m3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM3XlargeElasticsearch:
                return @"m3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM32xlargeElasticsearch:
                return @"m3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM4LargeElasticsearch:
                return @"m4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM4XlargeElasticsearch:
                return @"m4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM42xlargeElasticsearch:
                return @"m4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM44xlargeElasticsearch:
                return @"m4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM410xlargeElasticsearch:
                return @"m4.10xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM5LargeElasticsearch:
                return @"m5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM5XlargeElasticsearch:
                return @"m5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM52xlargeElasticsearch:
                return @"m5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM54xlargeElasticsearch:
                return @"m5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM512xlargeElasticsearch:
                return @"m5.12xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR5LargeElasticsearch:
                return @"r5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR5XlargeElasticsearch:
                return @"r5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR52xlargeElasticsearch:
                return @"r5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR54xlargeElasticsearch:
                return @"r5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR512xlargeElasticsearch:
                return @"r5.12xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC5LargeElasticsearch:
                return @"c5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeC5XlargeElasticsearch:
                return @"c5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC52xlargeElasticsearch:
                return @"c5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC54xlargeElasticsearch:
                return @"c5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC59xlargeElasticsearch:
                return @"c5.9xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC518xlargeElasticsearch:
                return @"c5.18xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            case AWSesESPartitionInstanceTypeT2MicroElasticsearch:
                return @"t2.micro.elasticsearch";
            case AWSesESPartitionInstanceTypeT2SmallElasticsearch:
                return @"t2.small.elasticsearch";
            case AWSesESPartitionInstanceTypeT2MediumElasticsearch:
                return @"t2.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeR3LargeElasticsearch:
                return @"r3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR3XlargeElasticsearch:
                return @"r3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR32xlargeElasticsearch:
                return @"r3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR34xlargeElasticsearch:
                return @"r3.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR38xlargeElasticsearch:
                return @"r3.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI2XlargeElasticsearch:
                return @"i2.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI22xlargeElasticsearch:
                return @"i2.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD2XlargeElasticsearch:
                return @"d2.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD22xlargeElasticsearch:
                return @"d2.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD24xlargeElasticsearch:
                return @"d2.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD28xlargeElasticsearch:
                return @"d2.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC4LargeElasticsearch:
                return @"c4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeC4XlargeElasticsearch:
                return @"c4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC42xlargeElasticsearch:
                return @"c4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC44xlargeElasticsearch:
                return @"c4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC48xlargeElasticsearch:
                return @"c4.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR4LargeElasticsearch:
                return @"r4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR4XlargeElasticsearch:
                return @"r4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR42xlargeElasticsearch:
                return @"r4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR44xlargeElasticsearch:
                return @"r4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR48xlargeElasticsearch:
                return @"r4.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR416xlargeElasticsearch:
                return @"r4.16xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI3LargeElasticsearch:
                return @"i3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeI3XlargeElasticsearch:
                return @"i3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI32xlargeElasticsearch:
                return @"i3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI34xlargeElasticsearch:
                return @"i3.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI38xlargeElasticsearch:
                return @"i3.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI316xlargeElasticsearch:
                return @"i3.16xlarge.elasticsearch";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)paymentOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_UPFRONT"] == NSOrderedSame) {
            return @(AWSesReservedElasticsearchInstancePaymentOptionAllUpfront);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_UPFRONT"] == NSOrderedSame) {
            return @(AWSesReservedElasticsearchInstancePaymentOptionPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSesReservedElasticsearchInstancePaymentOptionNoUpfront);
        }
        return @(AWSesReservedElasticsearchInstancePaymentOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesReservedElasticsearchInstancePaymentOptionAllUpfront:
                return @"ALL_UPFRONT";
            case AWSesReservedElasticsearchInstancePaymentOptionPartialUpfront:
                return @"PARTIAL_UPFRONT";
            case AWSesReservedElasticsearchInstancePaymentOptionNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesRecurringCharge class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSesReservedElasticsearchInstanceOffering

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"duration" : @"Duration",
             @"elasticsearchInstanceType" : @"ElasticsearchInstanceType",
             @"fixedPrice" : @"FixedPrice",
             @"paymentOption" : @"PaymentOption",
             @"recurringCharges" : @"RecurringCharges",
             @"reservedElasticsearchInstanceOfferingId" : @"ReservedElasticsearchInstanceOfferingId",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)elasticsearchInstanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"m3.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM410xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeM512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.9xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC59xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.18xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC518xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.micro.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2MicroElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.small.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2SmallElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeT2MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD24xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeD28xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeC48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeR416xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSesESPartitionInstanceTypeI316xlargeElasticsearch);
        }
        return @(AWSesESPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesESPartitionInstanceTypeM3MediumElasticsearch:
                return @"m3.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeM3LargeElasticsearch:
                return @"m3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM3XlargeElasticsearch:
                return @"m3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM32xlargeElasticsearch:
                return @"m3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM4LargeElasticsearch:
                return @"m4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM4XlargeElasticsearch:
                return @"m4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM42xlargeElasticsearch:
                return @"m4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM44xlargeElasticsearch:
                return @"m4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM410xlargeElasticsearch:
                return @"m4.10xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM5LargeElasticsearch:
                return @"m5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeM5XlargeElasticsearch:
                return @"m5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM52xlargeElasticsearch:
                return @"m5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM54xlargeElasticsearch:
                return @"m5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeM512xlargeElasticsearch:
                return @"m5.12xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR5LargeElasticsearch:
                return @"r5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR5XlargeElasticsearch:
                return @"r5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR52xlargeElasticsearch:
                return @"r5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR54xlargeElasticsearch:
                return @"r5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR512xlargeElasticsearch:
                return @"r5.12xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC5LargeElasticsearch:
                return @"c5.large.elasticsearch";
            case AWSesESPartitionInstanceTypeC5XlargeElasticsearch:
                return @"c5.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC52xlargeElasticsearch:
                return @"c5.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC54xlargeElasticsearch:
                return @"c5.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC59xlargeElasticsearch:
                return @"c5.9xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC518xlargeElasticsearch:
                return @"c5.18xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            case AWSesESPartitionInstanceTypeT2MicroElasticsearch:
                return @"t2.micro.elasticsearch";
            case AWSesESPartitionInstanceTypeT2SmallElasticsearch:
                return @"t2.small.elasticsearch";
            case AWSesESPartitionInstanceTypeT2MediumElasticsearch:
                return @"t2.medium.elasticsearch";
            case AWSesESPartitionInstanceTypeR3LargeElasticsearch:
                return @"r3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR3XlargeElasticsearch:
                return @"r3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR32xlargeElasticsearch:
                return @"r3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR34xlargeElasticsearch:
                return @"r3.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR38xlargeElasticsearch:
                return @"r3.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI2XlargeElasticsearch:
                return @"i2.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI22xlargeElasticsearch:
                return @"i2.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD2XlargeElasticsearch:
                return @"d2.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD22xlargeElasticsearch:
                return @"d2.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD24xlargeElasticsearch:
                return @"d2.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeD28xlargeElasticsearch:
                return @"d2.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC4LargeElasticsearch:
                return @"c4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeC4XlargeElasticsearch:
                return @"c4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC42xlargeElasticsearch:
                return @"c4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC44xlargeElasticsearch:
                return @"c4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeC48xlargeElasticsearch:
                return @"c4.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR4LargeElasticsearch:
                return @"r4.large.elasticsearch";
            case AWSesESPartitionInstanceTypeR4XlargeElasticsearch:
                return @"r4.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR42xlargeElasticsearch:
                return @"r4.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR44xlargeElasticsearch:
                return @"r4.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR48xlargeElasticsearch:
                return @"r4.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeR416xlargeElasticsearch:
                return @"r4.16xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI3LargeElasticsearch:
                return @"i3.large.elasticsearch";
            case AWSesESPartitionInstanceTypeI3XlargeElasticsearch:
                return @"i3.xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI32xlargeElasticsearch:
                return @"i3.2xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI34xlargeElasticsearch:
                return @"i3.4xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI38xlargeElasticsearch:
                return @"i3.8xlarge.elasticsearch";
            case AWSesESPartitionInstanceTypeI316xlargeElasticsearch:
                return @"i3.16xlarge.elasticsearch";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)paymentOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_UPFRONT"] == NSOrderedSame) {
            return @(AWSesReservedElasticsearchInstancePaymentOptionAllUpfront);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_UPFRONT"] == NSOrderedSame) {
            return @(AWSesReservedElasticsearchInstancePaymentOptionPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSesReservedElasticsearchInstancePaymentOptionNoUpfront);
        }
        return @(AWSesReservedElasticsearchInstancePaymentOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesReservedElasticsearchInstancePaymentOptionAllUpfront:
                return @"ALL_UPFRONT";
            case AWSesReservedElasticsearchInstancePaymentOptionPartialUpfront:
                return @"PARTIAL_UPFRONT";
            case AWSesReservedElasticsearchInstancePaymentOptionNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesRecurringCharge class]];
}

@end

@implementation AWSesServiceSoftwareOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automatedUpdateDate" : @"AutomatedUpdateDate",
             @"cancellable" : @"Cancellable",
             @"currentVersion" : @"CurrentVersion",
             @"detail" : @"Description",
             @"latestVersion" : @"NewVersion",
             @"optionalDeployment" : @"OptionalDeployment",
             @"updateAvailable" : @"UpdateAvailable",
             @"updateStatus" : @"UpdateStatus",
             };
}

+ (NSValueTransformer *)automatedUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_UPDATE"] == NSOrderedSame) {
            return @(AWSesDeploymentStatusPendingUpdate);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSesDeploymentStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSesDeploymentStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"NOT_ELIGIBLE"] == NSOrderedSame) {
            return @(AWSesDeploymentStatusNotEligible);
        }
        if ([value caseInsensitiveCompare:@"ELIGIBLE"] == NSOrderedSame) {
            return @(AWSesDeploymentStatusEligible);
        }
        return @(AWSesDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesDeploymentStatusPendingUpdate:
                return @"PENDING_UPDATE";
            case AWSesDeploymentStatusInProgress:
                return @"IN_PROGRESS";
            case AWSesDeploymentStatusCompleted:
                return @"COMPLETED";
            case AWSesDeploymentStatusNotEligible:
                return @"NOT_ELIGIBLE";
            case AWSesDeploymentStatusEligible:
                return @"ELIGIBLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSesSnapshotOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automatedSnapshotStartHour" : @"AutomatedSnapshotStartHour",
             };
}

@end

@implementation AWSesSnapshotOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesSnapshotOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesStartElasticsearchServiceSoftwareUpdateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSesStartElasticsearchServiceSoftwareUpdateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSoftwareOptions" : @"ServiceSoftwareOptions",
             };
}

+ (NSValueTransformer *)serviceSoftwareOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesServiceSoftwareOptions class]];
}

@end

@implementation AWSesStorageType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"storageSubTypeName" : @"StorageSubTypeName",
             @"storageTypeLimits" : @"StorageTypeLimits",
             @"storageTypeName" : @"StorageTypeName",
             };
}

+ (NSValueTransformer *)storageTypeLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesStorageTypeLimit class]];
}

@end

@implementation AWSesStorageTypeLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limitName" : @"LimitName",
             @"limitValues" : @"LimitValues",
             };
}

@end

@implementation AWSesTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSesUpdateElasticsearchDomainConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicies" : @"AccessPolicies",
             @"advancedOptions" : @"AdvancedOptions",
             @"advancedSecurityOptions" : @"AdvancedSecurityOptions",
             @"cognitoOptions" : @"CognitoOptions",
             @"domainEndpointOptions" : @"DomainEndpointOptions",
             @"domainName" : @"DomainName",
             @"EBSOptions" : @"EBSOptions",
             @"elasticsearchClusterConfig" : @"ElasticsearchClusterConfig",
             @"logPublishingOptions" : @"LogPublishingOptions",
             @"snapshotOptions" : @"SnapshotOptions",
             @"VPCOptions" : @"VPCOptions",
             };
}

+ (NSValueTransformer *)advancedSecurityOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesAdvancedSecurityOptionsInput class]];
}

+ (NSValueTransformer *)cognitoOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesCognitoOptions class]];
}

+ (NSValueTransformer *)domainEndpointOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesDomainEndpointOptions class]];
}

+ (NSValueTransformer *)EBSOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesEBSOptions class]];
}

+ (NSValueTransformer *)elasticsearchClusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesElasticsearchClusterConfig class]];
}

+ (NSValueTransformer *)logPublishingOptionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSesLogPublishingOption class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)snapshotOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesSnapshotOptions class]];
}

+ (NSValueTransformer *)VPCOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesVPCOptions class]];
}

@end

@implementation AWSesUpdateElasticsearchDomainConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainConfig" : @"DomainConfig",
             };
}

+ (NSValueTransformer *)domainConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesElasticsearchDomainConfig class]];
}

@end

@implementation AWSesUpgradeElasticsearchDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"performCheckOnly" : @"PerformCheckOnly",
             @"targetVersion" : @"TargetVersion",
             };
}

@end

@implementation AWSesUpgradeElasticsearchDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"performCheckOnly" : @"PerformCheckOnly",
             @"targetVersion" : @"TargetVersion",
             };
}

@end

@implementation AWSesUpgradeHistory

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"startTimestamp" : @"StartTimestamp",
             @"stepsList" : @"StepsList",
             @"upgradeName" : @"UpgradeName",
             @"upgradeStatus" : @"UpgradeStatus",
             };
}

+ (NSValueTransformer *)startTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stepsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSesUpgradeStepItem class]];
}

+ (NSValueTransformer *)upgradeStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED_WITH_ISSUES"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusSucceededWithIssues);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusFailed);
        }
        return @(AWSesUpgradeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesUpgradeStatusInProgress:
                return @"IN_PROGRESS";
            case AWSesUpgradeStatusSucceeded:
                return @"SUCCEEDED";
            case AWSesUpgradeStatusSucceededWithIssues:
                return @"SUCCEEDED_WITH_ISSUES";
            case AWSesUpgradeStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSesUpgradeStepItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"issues" : @"Issues",
             @"progressPercent" : @"ProgressPercent",
             @"upgradeStep" : @"UpgradeStep",
             @"upgradeStepStatus" : @"UpgradeStepStatus",
             };
}

+ (NSValueTransformer *)upgradeStepJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRE_UPGRADE_CHECK"] == NSOrderedSame) {
            return @(AWSesUpgradeStepPreUpgradeCheck);
        }
        if ([value caseInsensitiveCompare:@"SNAPSHOT"] == NSOrderedSame) {
            return @(AWSesUpgradeStepSnapshot);
        }
        if ([value caseInsensitiveCompare:@"UPGRADE"] == NSOrderedSame) {
            return @(AWSesUpgradeStepUpgrade);
        }
        return @(AWSesUpgradeStepUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesUpgradeStepPreUpgradeCheck:
                return @"PRE_UPGRADE_CHECK";
            case AWSesUpgradeStepSnapshot:
                return @"SNAPSHOT";
            case AWSesUpgradeStepUpgrade:
                return @"UPGRADE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)upgradeStepStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED_WITH_ISSUES"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusSucceededWithIssues);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSesUpgradeStatusFailed);
        }
        return @(AWSesUpgradeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSesUpgradeStatusInProgress:
                return @"IN_PROGRESS";
            case AWSesUpgradeStatusSucceeded:
                return @"SUCCEEDED";
            case AWSesUpgradeStatusSucceededWithIssues:
                return @"SUCCEEDED_WITH_ISSUES";
            case AWSesUpgradeStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSesVPCDerivedInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"VPCId" : @"VPCId",
             };
}

@end

@implementation AWSesVPCDerivedInfoStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesVPCDerivedInfo class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSesOptionStatus class]];
}

@end

@implementation AWSesVPCOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSesZoneAwarenessConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZoneCount" : @"AvailabilityZoneCount",
             };
}

@end
