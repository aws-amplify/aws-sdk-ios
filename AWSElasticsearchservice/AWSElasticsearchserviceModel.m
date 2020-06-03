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

#import "AWSElasticsearchserviceModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSElasticsearchserviceErrorDomain = @"com.amazonaws.AWSElasticsearchserviceErrorDomain";

@implementation AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crossClusterSearchConnectionId" : @"CrossClusterSearchConnectionId",
             };
}

@end

@implementation AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crossClusterSearchConnection" : @"CrossClusterSearchConnection",
             };
}

+ (NSValueTransformer *)crossClusterSearchConnectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceInboundCrossClusterSearchConnection class]];
}

@end

@implementation AWSElasticsearchserviceAccessPoliciesStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceAddTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceTag class]];
}

@end

@implementation AWSElasticsearchserviceAdditionalLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limitName" : @"LimitName",
             @"limitValues" : @"LimitValues",
             };
}

@end

@implementation AWSElasticsearchserviceAdvancedOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceAdvancedSecurityOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"internalUserDatabaseEnabled" : @"InternalUserDatabaseEnabled",
             };
}

@end

@implementation AWSElasticsearchserviceAdvancedSecurityOptionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"internalUserDatabaseEnabled" : @"InternalUserDatabaseEnabled",
             @"masterUserOptions" : @"MasterUserOptions",
             };
}

+ (NSValueTransformer *)masterUserOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceMasterUserOptions class]];
}

@end

@implementation AWSElasticsearchserviceAdvancedSecurityOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceAdvancedSecurityOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceAssociatePackageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"packageID" : @"PackageID",
             };
}

@end

@implementation AWSElasticsearchserviceAssociatePackageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainPackageDetails" : @"DomainPackageDetails",
             };
}

+ (NSValueTransformer *)domainPackageDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainPackageDetails class]];
}

@end

@implementation AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSoftwareOptions" : @"ServiceSoftwareOptions",
             };
}

+ (NSValueTransformer *)serviceSoftwareOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceServiceSoftwareOptions class]];
}

@end

@implementation AWSElasticsearchserviceCognitoOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"identityPoolId" : @"IdentityPoolId",
             @"roleArn" : @"RoleArn",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSElasticsearchserviceCognitoOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceCognitoOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceCompatibleVersionsMap

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceVersion" : @"SourceVersion",
             @"targetVersions" : @"TargetVersions",
             };
}

@end

@implementation AWSElasticsearchserviceCreateElasticsearchDomainRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceAdvancedSecurityOptionsInput class]];
}

+ (NSValueTransformer *)cognitoOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceCognitoOptions class]];
}

+ (NSValueTransformer *)domainEndpointOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainEndpointOptions class]];
}

+ (NSValueTransformer *)EBSOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceEBSOptions class]];
}

+ (NSValueTransformer *)elasticsearchClusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchClusterConfig class]];
}

+ (NSValueTransformer *)encryptionAtRestOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceEncryptionAtRestOptions class]];
}

+ (NSValueTransformer *)logPublishingOptionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSElasticsearchserviceLogPublishingOption class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)nodeToNodeEncryptionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceNodeToNodeEncryptionOptions class]];
}

+ (NSValueTransformer *)snapshotOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceSnapshotOptions class]];
}

+ (NSValueTransformer *)VPCOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceVPCOptions class]];
}

@end

@implementation AWSElasticsearchserviceCreateElasticsearchDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainStatus" : @"DomainStatus",
             };
}

+ (NSValueTransformer *)domainStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchDomainStatus class]];
}

@end

@implementation AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionAlias" : @"ConnectionAlias",
             @"destinationDomainInfo" : @"DestinationDomainInfo",
             @"sourceDomainInfo" : @"SourceDomainInfo",
             };
}

+ (NSValueTransformer *)destinationDomainInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainInformation class]];
}

+ (NSValueTransformer *)sourceDomainInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainInformation class]];
}

@end

@implementation AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionAlias" : @"ConnectionAlias",
             @"connectionStatus" : @"ConnectionStatus",
             @"crossClusterSearchConnectionId" : @"CrossClusterSearchConnectionId",
             @"destinationDomainInfo" : @"DestinationDomainInfo",
             @"sourceDomainInfo" : @"SourceDomainInfo",
             };
}

+ (NSValueTransformer *)connectionStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatus class]];
}

+ (NSValueTransformer *)destinationDomainInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainInformation class]];
}

+ (NSValueTransformer *)sourceDomainInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainInformation class]];
}

@end

@implementation AWSElasticsearchserviceCreatePackageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"packageDescription" : @"PackageDescription",
             @"packageName" : @"PackageName",
             @"packageSource" : @"PackageSource",
             @"packageType" : @"PackageType",
             };
}

+ (NSValueTransformer *)packageSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchservicePackageSource class]];
}

+ (NSValueTransformer *)packageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TXT-DICTIONARY"] == NSOrderedSame) {
            return @(AWSElasticsearchservicePackageTypeTxtDictionary);
        }
        return @(AWSElasticsearchservicePackageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchservicePackageTypeTxtDictionary:
                return @"TXT-DICTIONARY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchserviceCreatePackageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"packageDetails" : @"PackageDetails",
             };
}

+ (NSValueTransformer *)packageDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchservicePackageDetails class]];
}

@end

@implementation AWSElasticsearchserviceDeleteElasticsearchDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSElasticsearchserviceDeleteElasticsearchDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainStatus" : @"DomainStatus",
             };
}

+ (NSValueTransformer *)domainStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchDomainStatus class]];
}

@end

@implementation AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crossClusterSearchConnectionId" : @"CrossClusterSearchConnectionId",
             };
}

@end

@implementation AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crossClusterSearchConnection" : @"CrossClusterSearchConnection",
             };
}

+ (NSValueTransformer *)crossClusterSearchConnectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceInboundCrossClusterSearchConnection class]];
}

@end

@implementation AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crossClusterSearchConnectionId" : @"CrossClusterSearchConnectionId",
             };
}

@end

@implementation AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crossClusterSearchConnection" : @"CrossClusterSearchConnection",
             };
}

+ (NSValueTransformer *)crossClusterSearchConnectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOutboundCrossClusterSearchConnection class]];
}

@end

@implementation AWSElasticsearchserviceDeletePackageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"packageID" : @"PackageID",
             };
}

@end

@implementation AWSElasticsearchserviceDeletePackageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"packageDetails" : @"PackageDetails",
             };
}

+ (NSValueTransformer *)packageDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchservicePackageDetails class]];
}

@end

@implementation AWSElasticsearchserviceDescribeElasticsearchDomainConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainConfig" : @"DomainConfig",
             };
}

+ (NSValueTransformer *)domainConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchDomainConfig class]];
}

@end

@implementation AWSElasticsearchserviceDescribeElasticsearchDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSElasticsearchserviceDescribeElasticsearchDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainStatus" : @"DomainStatus",
             };
}

+ (NSValueTransformer *)domainStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchDomainStatus class]];
}

@end

@implementation AWSElasticsearchserviceDescribeElasticsearchDomainsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainNames" : @"DomainNames",
             };
}

@end

@implementation AWSElasticsearchserviceDescribeElasticsearchDomainsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainStatusList" : @"DomainStatusList",
             };
}

+ (NSValueTransformer *)domainStatusListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchDomainStatus class]];
}

@end

@implementation AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsRequest

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
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM410xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.9xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC59xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.18xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC518xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.micro.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2MicroElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.small.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2SmallElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD24xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD28xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR416xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI316xlargeElasticsearch);
        }
        return @(AWSElasticsearchserviceESPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceESPartitionInstanceTypeM3MediumElasticsearch:
                return @"m3.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM3LargeElasticsearch:
                return @"m3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM3XlargeElasticsearch:
                return @"m3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM32xlargeElasticsearch:
                return @"m3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM4LargeElasticsearch:
                return @"m4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM4XlargeElasticsearch:
                return @"m4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM42xlargeElasticsearch:
                return @"m4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM44xlargeElasticsearch:
                return @"m4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM410xlargeElasticsearch:
                return @"m4.10xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM5LargeElasticsearch:
                return @"m5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM5XlargeElasticsearch:
                return @"m5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM52xlargeElasticsearch:
                return @"m5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM54xlargeElasticsearch:
                return @"m5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM512xlargeElasticsearch:
                return @"m5.12xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR5LargeElasticsearch:
                return @"r5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR5XlargeElasticsearch:
                return @"r5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR52xlargeElasticsearch:
                return @"r5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR54xlargeElasticsearch:
                return @"r5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR512xlargeElasticsearch:
                return @"r5.12xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC5LargeElasticsearch:
                return @"c5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC5XlargeElasticsearch:
                return @"c5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC52xlargeElasticsearch:
                return @"c5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC54xlargeElasticsearch:
                return @"c5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC59xlargeElasticsearch:
                return @"c5.9xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC518xlargeElasticsearch:
                return @"c5.18xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2MicroElasticsearch:
                return @"t2.micro.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2SmallElasticsearch:
                return @"t2.small.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2MediumElasticsearch:
                return @"t2.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR3LargeElasticsearch:
                return @"r3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR3XlargeElasticsearch:
                return @"r3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR32xlargeElasticsearch:
                return @"r3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR34xlargeElasticsearch:
                return @"r3.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR38xlargeElasticsearch:
                return @"r3.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI2XlargeElasticsearch:
                return @"i2.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI22xlargeElasticsearch:
                return @"i2.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD2XlargeElasticsearch:
                return @"d2.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD22xlargeElasticsearch:
                return @"d2.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD24xlargeElasticsearch:
                return @"d2.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD28xlargeElasticsearch:
                return @"d2.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC4LargeElasticsearch:
                return @"c4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC4XlargeElasticsearch:
                return @"c4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC42xlargeElasticsearch:
                return @"c4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC44xlargeElasticsearch:
                return @"c4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC48xlargeElasticsearch:
                return @"c4.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR4LargeElasticsearch:
                return @"r4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR4XlargeElasticsearch:
                return @"r4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR42xlargeElasticsearch:
                return @"r4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR44xlargeElasticsearch:
                return @"r4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR48xlargeElasticsearch:
                return @"r4.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR416xlargeElasticsearch:
                return @"r4.16xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI3LargeElasticsearch:
                return @"i3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI3XlargeElasticsearch:
                return @"i3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI32xlargeElasticsearch:
                return @"i3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI34xlargeElasticsearch:
                return @"i3.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI38xlargeElasticsearch:
                return @"i3.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI316xlargeElasticsearch:
                return @"i3.16xlarge.elasticsearch";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limitsByRole" : @"LimitsByRole",
             };
}

+ (NSValueTransformer *)limitsByRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSElasticsearchserviceLimits class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceFilter class]];
}

@end

@implementation AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crossClusterSearchConnections" : @"CrossClusterSearchConnections",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)crossClusterSearchConnectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceInboundCrossClusterSearchConnection class]];
}

@end

@implementation AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceFilter class]];
}

@end

@implementation AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crossClusterSearchConnections" : @"CrossClusterSearchConnections",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)crossClusterSearchConnectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceOutboundCrossClusterSearchConnection class]];
}

@end

@implementation AWSElasticsearchserviceDescribePackagesFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PackageID"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceDescribePackagesFilterNamePackageID);
        }
        if ([value caseInsensitiveCompare:@"PackageName"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceDescribePackagesFilterNamePackageName);
        }
        if ([value caseInsensitiveCompare:@"PackageStatus"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceDescribePackagesFilterNamePackageStatus);
        }
        return @(AWSElasticsearchserviceDescribePackagesFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceDescribePackagesFilterNamePackageID:
                return @"PackageID";
            case AWSElasticsearchserviceDescribePackagesFilterNamePackageName:
                return @"PackageName";
            case AWSElasticsearchserviceDescribePackagesFilterNamePackageStatus:
                return @"PackageStatus";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchserviceDescribePackagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceDescribePackagesFilter class]];
}

@end

@implementation AWSElasticsearchserviceDescribePackagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"packageDetailsList" : @"PackageDetailsList",
             };
}

+ (NSValueTransformer *)packageDetailsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchservicePackageDetails class]];
}

@end

@implementation AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"reservedElasticsearchInstanceOfferingId" : @"ReservedElasticsearchInstanceOfferingId",
             };
}

@end

@implementation AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"reservedElasticsearchInstanceOfferings" : @"ReservedElasticsearchInstanceOfferings",
             };
}

+ (NSValueTransformer *)reservedElasticsearchInstanceOfferingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceReservedElasticsearchInstanceOffering class]];
}

@end

@implementation AWSElasticsearchserviceDescribeReservedElasticsearchInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"reservedElasticsearchInstanceId" : @"ReservedElasticsearchInstanceId",
             };
}

@end

@implementation AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"reservedElasticsearchInstances" : @"ReservedElasticsearchInstances",
             };
}

+ (NSValueTransformer *)reservedElasticsearchInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceReservedElasticsearchInstance class]];
}

@end

@implementation AWSElasticsearchserviceDissociatePackageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"packageID" : @"PackageID",
             };
}

@end

@implementation AWSElasticsearchserviceDissociatePackageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainPackageDetails" : @"DomainPackageDetails",
             };
}

+ (NSValueTransformer *)domainPackageDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainPackageDetails class]];
}

@end

@implementation AWSElasticsearchserviceDomainEndpointOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enforceHTTPS" : @"EnforceHTTPS",
             @"TLSSecurityPolicy" : @"TLSSecurityPolicy",
             };
}

+ (NSValueTransformer *)TLSSecurityPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Policy-Min-TLS-1-0-2019-07"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceTLSSecurityPolicyPolicyMinTLS10201907);
        }
        if ([value caseInsensitiveCompare:@"Policy-Min-TLS-1-2-2019-07"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceTLSSecurityPolicyPolicyMinTLS12201907);
        }
        return @(AWSElasticsearchserviceTLSSecurityPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceTLSSecurityPolicyPolicyMinTLS10201907:
                return @"Policy-Min-TLS-1-0-2019-07";
            case AWSElasticsearchserviceTLSSecurityPolicyPolicyMinTLS12201907:
                return @"Policy-Min-TLS-1-2-2019-07";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchserviceDomainEndpointOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainEndpointOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceDomainInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSElasticsearchserviceDomainInformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"ownerId" : @"OwnerId",
             @"region" : @"Region",
             };
}

@end

@implementation AWSElasticsearchserviceDomainPackageDetails

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
            return @(AWSElasticsearchserviceDomainPackageStatusAssociating);
        }
        if ([value caseInsensitiveCompare:@"ASSOCIATION_FAILED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceDomainPackageStatusAssociationFailed);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceDomainPackageStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DISSOCIATING"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceDomainPackageStatusDissociating);
        }
        if ([value caseInsensitiveCompare:@"DISSOCIATION_FAILED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceDomainPackageStatusDissociationFailed);
        }
        return @(AWSElasticsearchserviceDomainPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceDomainPackageStatusAssociating:
                return @"ASSOCIATING";
            case AWSElasticsearchserviceDomainPackageStatusAssociationFailed:
                return @"ASSOCIATION_FAILED";
            case AWSElasticsearchserviceDomainPackageStatusActive:
                return @"ACTIVE";
            case AWSElasticsearchserviceDomainPackageStatusDissociating:
                return @"DISSOCIATING";
            case AWSElasticsearchserviceDomainPackageStatusDissociationFailed:
                return @"DISSOCIATION_FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)errorDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceErrorDetails class]];
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
            return @(AWSElasticsearchservicePackageTypeTxtDictionary);
        }
        return @(AWSElasticsearchservicePackageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchservicePackageTypeTxtDictionary:
                return @"TXT-DICTIONARY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchserviceEBSOptions

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
            return @(AWSElasticsearchserviceVolumeTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"gp2"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceVolumeTypeGp2);
        }
        if ([value caseInsensitiveCompare:@"io1"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceVolumeTypeIO1);
        }
        return @(AWSElasticsearchserviceVolumeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceVolumeTypeStandard:
                return @"standard";
            case AWSElasticsearchserviceVolumeTypeGp2:
                return @"gp2";
            case AWSElasticsearchserviceVolumeTypeIO1:
                return @"io1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchserviceEBSOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceEBSOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceElasticsearchClusterConfig

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
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM410xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.9xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC59xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.18xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC518xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.micro.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2MicroElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.small.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2SmallElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD24xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD28xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR416xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI316xlargeElasticsearch);
        }
        return @(AWSElasticsearchserviceESPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceESPartitionInstanceTypeM3MediumElasticsearch:
                return @"m3.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM3LargeElasticsearch:
                return @"m3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM3XlargeElasticsearch:
                return @"m3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM32xlargeElasticsearch:
                return @"m3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM4LargeElasticsearch:
                return @"m4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM4XlargeElasticsearch:
                return @"m4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM42xlargeElasticsearch:
                return @"m4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM44xlargeElasticsearch:
                return @"m4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM410xlargeElasticsearch:
                return @"m4.10xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM5LargeElasticsearch:
                return @"m5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM5XlargeElasticsearch:
                return @"m5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM52xlargeElasticsearch:
                return @"m5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM54xlargeElasticsearch:
                return @"m5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM512xlargeElasticsearch:
                return @"m5.12xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR5LargeElasticsearch:
                return @"r5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR5XlargeElasticsearch:
                return @"r5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR52xlargeElasticsearch:
                return @"r5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR54xlargeElasticsearch:
                return @"r5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR512xlargeElasticsearch:
                return @"r5.12xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC5LargeElasticsearch:
                return @"c5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC5XlargeElasticsearch:
                return @"c5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC52xlargeElasticsearch:
                return @"c5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC54xlargeElasticsearch:
                return @"c5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC59xlargeElasticsearch:
                return @"c5.9xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC518xlargeElasticsearch:
                return @"c5.18xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2MicroElasticsearch:
                return @"t2.micro.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2SmallElasticsearch:
                return @"t2.small.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2MediumElasticsearch:
                return @"t2.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR3LargeElasticsearch:
                return @"r3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR3XlargeElasticsearch:
                return @"r3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR32xlargeElasticsearch:
                return @"r3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR34xlargeElasticsearch:
                return @"r3.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR38xlargeElasticsearch:
                return @"r3.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI2XlargeElasticsearch:
                return @"i2.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI22xlargeElasticsearch:
                return @"i2.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD2XlargeElasticsearch:
                return @"d2.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD22xlargeElasticsearch:
                return @"d2.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD24xlargeElasticsearch:
                return @"d2.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD28xlargeElasticsearch:
                return @"d2.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC4LargeElasticsearch:
                return @"c4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC4XlargeElasticsearch:
                return @"c4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC42xlargeElasticsearch:
                return @"c4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC44xlargeElasticsearch:
                return @"c4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC48xlargeElasticsearch:
                return @"c4.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR4LargeElasticsearch:
                return @"r4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR4XlargeElasticsearch:
                return @"r4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR42xlargeElasticsearch:
                return @"r4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR44xlargeElasticsearch:
                return @"r4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR48xlargeElasticsearch:
                return @"r4.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR416xlargeElasticsearch:
                return @"r4.16xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI3LargeElasticsearch:
                return @"i3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI3XlargeElasticsearch:
                return @"i3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI32xlargeElasticsearch:
                return @"i3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI34xlargeElasticsearch:
                return @"i3.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI38xlargeElasticsearch:
                return @"i3.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI316xlargeElasticsearch:
                return @"i3.16xlarge.elasticsearch";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"m3.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM410xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.9xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC59xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.18xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC518xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.micro.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2MicroElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.small.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2SmallElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD24xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD28xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR416xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI316xlargeElasticsearch);
        }
        return @(AWSElasticsearchserviceESPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceESPartitionInstanceTypeM3MediumElasticsearch:
                return @"m3.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM3LargeElasticsearch:
                return @"m3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM3XlargeElasticsearch:
                return @"m3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM32xlargeElasticsearch:
                return @"m3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM4LargeElasticsearch:
                return @"m4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM4XlargeElasticsearch:
                return @"m4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM42xlargeElasticsearch:
                return @"m4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM44xlargeElasticsearch:
                return @"m4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM410xlargeElasticsearch:
                return @"m4.10xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM5LargeElasticsearch:
                return @"m5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM5XlargeElasticsearch:
                return @"m5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM52xlargeElasticsearch:
                return @"m5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM54xlargeElasticsearch:
                return @"m5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM512xlargeElasticsearch:
                return @"m5.12xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR5LargeElasticsearch:
                return @"r5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR5XlargeElasticsearch:
                return @"r5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR52xlargeElasticsearch:
                return @"r5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR54xlargeElasticsearch:
                return @"r5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR512xlargeElasticsearch:
                return @"r5.12xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC5LargeElasticsearch:
                return @"c5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC5XlargeElasticsearch:
                return @"c5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC52xlargeElasticsearch:
                return @"c5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC54xlargeElasticsearch:
                return @"c5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC59xlargeElasticsearch:
                return @"c5.9xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC518xlargeElasticsearch:
                return @"c5.18xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2MicroElasticsearch:
                return @"t2.micro.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2SmallElasticsearch:
                return @"t2.small.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2MediumElasticsearch:
                return @"t2.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR3LargeElasticsearch:
                return @"r3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR3XlargeElasticsearch:
                return @"r3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR32xlargeElasticsearch:
                return @"r3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR34xlargeElasticsearch:
                return @"r3.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR38xlargeElasticsearch:
                return @"r3.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI2XlargeElasticsearch:
                return @"i2.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI22xlargeElasticsearch:
                return @"i2.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD2XlargeElasticsearch:
                return @"d2.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD22xlargeElasticsearch:
                return @"d2.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD24xlargeElasticsearch:
                return @"d2.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD28xlargeElasticsearch:
                return @"d2.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC4LargeElasticsearch:
                return @"c4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC4XlargeElasticsearch:
                return @"c4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC42xlargeElasticsearch:
                return @"c4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC44xlargeElasticsearch:
                return @"c4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC48xlargeElasticsearch:
                return @"c4.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR4LargeElasticsearch:
                return @"r4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR4XlargeElasticsearch:
                return @"r4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR42xlargeElasticsearch:
                return @"r4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR44xlargeElasticsearch:
                return @"r4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR48xlargeElasticsearch:
                return @"r4.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR416xlargeElasticsearch:
                return @"r4.16xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI3LargeElasticsearch:
                return @"i3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI3XlargeElasticsearch:
                return @"i3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI32xlargeElasticsearch:
                return @"i3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI34xlargeElasticsearch:
                return @"i3.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI38xlargeElasticsearch:
                return @"i3.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI316xlargeElasticsearch:
                return @"i3.16xlarge.elasticsearch";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)warmTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESWarmPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESWarmPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        return @(AWSElasticsearchserviceESWarmPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceESWarmPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSElasticsearchserviceESWarmPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)zoneAwarenessConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceZoneAwarenessConfig class]];
}

@end

@implementation AWSElasticsearchserviceElasticsearchClusterConfigStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchClusterConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceElasticsearchDomainConfig

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceAccessPoliciesStatus class]];
}

+ (NSValueTransformer *)advancedOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceAdvancedOptionsStatus class]];
}

+ (NSValueTransformer *)advancedSecurityOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceAdvancedSecurityOptionsStatus class]];
}

+ (NSValueTransformer *)cognitoOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceCognitoOptionsStatus class]];
}

+ (NSValueTransformer *)domainEndpointOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainEndpointOptionsStatus class]];
}

+ (NSValueTransformer *)EBSOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceEBSOptionsStatus class]];
}

+ (NSValueTransformer *)elasticsearchClusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchClusterConfigStatus class]];
}

+ (NSValueTransformer *)elasticsearchVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchVersionStatus class]];
}

+ (NSValueTransformer *)encryptionAtRestOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceEncryptionAtRestOptionsStatus class]];
}

+ (NSValueTransformer *)logPublishingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceLogPublishingOptionsStatus class]];
}

+ (NSValueTransformer *)nodeToNodeEncryptionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceNodeToNodeEncryptionOptionsStatus class]];
}

+ (NSValueTransformer *)snapshotOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceSnapshotOptionsStatus class]];
}

+ (NSValueTransformer *)VPCOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceVPCDerivedInfoStatus class]];
}

@end

@implementation AWSElasticsearchserviceElasticsearchDomainStatus

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceAdvancedSecurityOptions class]];
}

+ (NSValueTransformer *)cognitoOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceCognitoOptions class]];
}

+ (NSValueTransformer *)domainEndpointOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainEndpointOptions class]];
}

+ (NSValueTransformer *)EBSOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceEBSOptions class]];
}

+ (NSValueTransformer *)elasticsearchClusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchClusterConfig class]];
}

+ (NSValueTransformer *)encryptionAtRestOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceEncryptionAtRestOptions class]];
}

+ (NSValueTransformer *)logPublishingOptionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSElasticsearchserviceLogPublishingOption class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)nodeToNodeEncryptionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceNodeToNodeEncryptionOptions class]];
}

+ (NSValueTransformer *)serviceSoftwareOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceServiceSoftwareOptions class]];
}

+ (NSValueTransformer *)snapshotOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceSnapshotOptions class]];
}

+ (NSValueTransformer *)VPCOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceVPCDerivedInfo class]];
}

@end

@implementation AWSElasticsearchserviceElasticsearchVersionStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceEncryptionAtRestOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"kmsKeyId" : @"KmsKeyId",
             };
}

@end

@implementation AWSElasticsearchserviceEncryptionAtRestOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceEncryptionAtRestOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceErrorDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorMessage" : @"ErrorMessage",
             @"errorType" : @"ErrorType",
             };
}

@end

@implementation AWSElasticsearchserviceFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticsearchserviceGetCompatibleElasticsearchVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleElasticsearchVersions" : @"CompatibleElasticsearchVersions",
             };
}

+ (NSValueTransformer *)compatibleElasticsearchVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceCompatibleVersionsMap class]];
}

@end

@implementation AWSElasticsearchserviceGetUpgradeHistoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSElasticsearchserviceGetUpgradeHistoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"upgradeHistories" : @"UpgradeHistories",
             };
}

+ (NSValueTransformer *)upgradeHistoriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceUpgradeHistory class]];
}

@end

@implementation AWSElasticsearchserviceGetUpgradeStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSElasticsearchserviceGetUpgradeStatusResponse

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
            return @(AWSElasticsearchserviceUpgradeStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED_WITH_ISSUES"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStatusSucceededWithIssues);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStatusFailed);
        }
        return @(AWSElasticsearchserviceUpgradeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceUpgradeStatusInProgress:
                return @"IN_PROGRESS";
            case AWSElasticsearchserviceUpgradeStatusSucceeded:
                return @"SUCCEEDED";
            case AWSElasticsearchserviceUpgradeStatusSucceededWithIssues:
                return @"SUCCEEDED_WITH_ISSUES";
            case AWSElasticsearchserviceUpgradeStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)upgradeStepJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRE_UPGRADE_CHECK"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStepPreUpgradeCheck);
        }
        if ([value caseInsensitiveCompare:@"SNAPSHOT"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStepSnapshot);
        }
        if ([value caseInsensitiveCompare:@"UPGRADE"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStepUpgrade);
        }
        return @(AWSElasticsearchserviceUpgradeStepUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceUpgradeStepPreUpgradeCheck:
                return @"PRE_UPGRADE_CHECK";
            case AWSElasticsearchserviceUpgradeStepSnapshot:
                return @"SNAPSHOT";
            case AWSElasticsearchserviceUpgradeStepUpgrade:
                return @"UPGRADE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchserviceInboundCrossClusterSearchConnection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionStatus" : @"ConnectionStatus",
             @"crossClusterSearchConnectionId" : @"CrossClusterSearchConnectionId",
             @"destinationDomainInfo" : @"DestinationDomainInfo",
             @"sourceDomainInfo" : @"SourceDomainInfo",
             };
}

+ (NSValueTransformer *)connectionStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatus class]];
}

+ (NSValueTransformer *)destinationDomainInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainInformation class]];
}

+ (NSValueTransformer *)sourceDomainInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainInformation class]];
}

@end

@implementation AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"statusCode" : @"StatusCode",
             };
}

+ (NSValueTransformer *)statusCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_ACCEPTANCE"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodePendingAcceptance);
        }
        if ([value caseInsensitiveCompare:@"APPROVED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeApproved);
        }
        if ([value caseInsensitiveCompare:@"REJECTING"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeRejecting);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeRejected);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeDeleted);
        }
        return @(AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodePendingAcceptance:
                return @"PENDING_ACCEPTANCE";
            case AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeApproved:
                return @"APPROVED";
            case AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeRejecting:
                return @"REJECTING";
            case AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeRejected:
                return @"REJECTED";
            case AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeDeleting:
                return @"DELETING";
            case AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchserviceInstanceCountLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximumInstanceCount" : @"MaximumInstanceCount",
             @"minimumInstanceCount" : @"MinimumInstanceCount",
             };
}

@end

@implementation AWSElasticsearchserviceInstanceLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceCountLimits" : @"InstanceCountLimits",
             };
}

+ (NSValueTransformer *)instanceCountLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceInstanceCountLimits class]];
}

@end

@implementation AWSElasticsearchserviceLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalLimits" : @"AdditionalLimits",
             @"instanceLimits" : @"InstanceLimits",
             @"storageTypes" : @"StorageTypes",
             };
}

+ (NSValueTransformer *)additionalLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceAdditionalLimit class]];
}

+ (NSValueTransformer *)instanceLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceInstanceLimits class]];
}

+ (NSValueTransformer *)storageTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceStorageType class]];
}

@end

@implementation AWSElasticsearchserviceListDomainNamesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainNames" : @"DomainNames",
             };
}

+ (NSValueTransformer *)domainNamesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceDomainInfo class]];
}

@end

@implementation AWSElasticsearchserviceListDomainsForPackageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"packageID" : @"PackageID",
             };
}

@end

@implementation AWSElasticsearchserviceListDomainsForPackageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainPackageDetailsList" : @"DomainPackageDetailsList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)domainPackageDetailsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceDomainPackageDetails class]];
}

@end

@implementation AWSElasticsearchserviceListElasticsearchInstanceTypesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"elasticsearchVersion" : @"ElasticsearchVersion",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSElasticsearchserviceListElasticsearchInstanceTypesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"elasticsearchInstanceTypes" : @"ElasticsearchInstanceTypes",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSElasticsearchserviceListElasticsearchVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSElasticsearchserviceListElasticsearchVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"elasticsearchVersions" : @"ElasticsearchVersions",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSElasticsearchserviceListPackagesForDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSElasticsearchserviceListPackagesForDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainPackageDetailsList" : @"DomainPackageDetailsList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)domainPackageDetailsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceDomainPackageDetails class]];
}

@end

@implementation AWSElasticsearchserviceListTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             };
}

@end

@implementation AWSElasticsearchserviceListTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceTag class]];
}

@end

@implementation AWSElasticsearchserviceLogPublishingOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogsLogGroupArn" : @"CloudWatchLogsLogGroupArn",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSElasticsearchserviceLogPublishingOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSElasticsearchserviceLogPublishingOption class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceMasterUserOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"masterUserARN" : @"MasterUserARN",
             @"masterUserName" : @"MasterUserName",
             @"masterUserPassword" : @"MasterUserPassword",
             };
}

@end

@implementation AWSElasticsearchserviceNodeToNodeEncryptionOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSElasticsearchserviceNodeToNodeEncryptionOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceNodeToNodeEncryptionOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceOptionStatus

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
            return @(AWSElasticsearchserviceOptionStateRequiresIndexDocuments);
        }
        if ([value caseInsensitiveCompare:@"Processing"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceOptionStateProcessing);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceOptionStateActive);
        }
        return @(AWSElasticsearchserviceOptionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceOptionStateRequiresIndexDocuments:
                return @"RequiresIndexDocuments";
            case AWSElasticsearchserviceOptionStateProcessing:
                return @"Processing";
            case AWSElasticsearchserviceOptionStateActive:
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

@implementation AWSElasticsearchserviceOutboundCrossClusterSearchConnection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionAlias" : @"ConnectionAlias",
             @"connectionStatus" : @"ConnectionStatus",
             @"crossClusterSearchConnectionId" : @"CrossClusterSearchConnectionId",
             @"destinationDomainInfo" : @"DestinationDomainInfo",
             @"sourceDomainInfo" : @"SourceDomainInfo",
             };
}

+ (NSValueTransformer *)connectionStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatus class]];
}

+ (NSValueTransformer *)destinationDomainInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainInformation class]];
}

+ (NSValueTransformer *)sourceDomainInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainInformation class]];
}

@end

@implementation AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"statusCode" : @"StatusCode",
             };
}

+ (NSValueTransformer *)statusCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_ACCEPTANCE"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodePendingAcceptance);
        }
        if ([value caseInsensitiveCompare:@"VALIDATING"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeValidating);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_FAILED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeValidationFailed);
        }
        if ([value caseInsensitiveCompare:@"PROVISIONING"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeProvisioning);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeActive);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeRejected);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeDeleted);
        }
        return @(AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodePendingAcceptance:
                return @"PENDING_ACCEPTANCE";
            case AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeValidating:
                return @"VALIDATING";
            case AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeValidationFailed:
                return @"VALIDATION_FAILED";
            case AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeProvisioning:
                return @"PROVISIONING";
            case AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeActive:
                return @"ACTIVE";
            case AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeRejected:
                return @"REJECTED";
            case AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeDeleting:
                return @"DELETING";
            case AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchservicePackageDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceErrorDetails class]];
}

+ (NSValueTransformer *)packageStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COPYING"] == NSOrderedSame) {
            return @(AWSElasticsearchservicePackageStatusCopying);
        }
        if ([value caseInsensitiveCompare:@"COPY_FAILED"] == NSOrderedSame) {
            return @(AWSElasticsearchservicePackageStatusCopyFailed);
        }
        if ([value caseInsensitiveCompare:@"VALIDATING"] == NSOrderedSame) {
            return @(AWSElasticsearchservicePackageStatusValidating);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_FAILED"] == NSOrderedSame) {
            return @(AWSElasticsearchservicePackageStatusValidationFailed);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSElasticsearchservicePackageStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSElasticsearchservicePackageStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSElasticsearchservicePackageStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FAILED"] == NSOrderedSame) {
            return @(AWSElasticsearchservicePackageStatusDeleteFailed);
        }
        return @(AWSElasticsearchservicePackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchservicePackageStatusCopying:
                return @"COPYING";
            case AWSElasticsearchservicePackageStatusCopyFailed:
                return @"COPY_FAILED";
            case AWSElasticsearchservicePackageStatusValidating:
                return @"VALIDATING";
            case AWSElasticsearchservicePackageStatusValidationFailed:
                return @"VALIDATION_FAILED";
            case AWSElasticsearchservicePackageStatusAvailable:
                return @"AVAILABLE";
            case AWSElasticsearchservicePackageStatusDeleting:
                return @"DELETING";
            case AWSElasticsearchservicePackageStatusDeleted:
                return @"DELETED";
            case AWSElasticsearchservicePackageStatusDeleteFailed:
                return @"DELETE_FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)packageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TXT-DICTIONARY"] == NSOrderedSame) {
            return @(AWSElasticsearchservicePackageTypeTxtDictionary);
        }
        return @(AWSElasticsearchservicePackageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchservicePackageTypeTxtDictionary:
                return @"TXT-DICTIONARY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchservicePackageSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3BucketName" : @"S3BucketName",
             @"s3Key" : @"S3Key",
             };
}

@end

@implementation AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceCount" : @"InstanceCount",
             @"reservationName" : @"ReservationName",
             @"reservedElasticsearchInstanceOfferingId" : @"ReservedElasticsearchInstanceOfferingId",
             };
}

@end

@implementation AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservationName" : @"ReservationName",
             @"reservedElasticsearchInstanceId" : @"ReservedElasticsearchInstanceId",
             };
}

@end

@implementation AWSElasticsearchserviceRecurringCharge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recurringChargeAmount" : @"RecurringChargeAmount",
             @"recurringChargeFrequency" : @"RecurringChargeFrequency",
             };
}

@end

@implementation AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crossClusterSearchConnectionId" : @"CrossClusterSearchConnectionId",
             };
}

@end

@implementation AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crossClusterSearchConnection" : @"CrossClusterSearchConnection",
             };
}

+ (NSValueTransformer *)crossClusterSearchConnectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceInboundCrossClusterSearchConnection class]];
}

@end

@implementation AWSElasticsearchserviceRemoveTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSElasticsearchserviceReservedElasticsearchInstance

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
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM410xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.9xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC59xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.18xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC518xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.micro.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2MicroElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.small.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2SmallElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD24xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD28xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR416xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI316xlargeElasticsearch);
        }
        return @(AWSElasticsearchserviceESPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceESPartitionInstanceTypeM3MediumElasticsearch:
                return @"m3.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM3LargeElasticsearch:
                return @"m3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM3XlargeElasticsearch:
                return @"m3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM32xlargeElasticsearch:
                return @"m3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM4LargeElasticsearch:
                return @"m4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM4XlargeElasticsearch:
                return @"m4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM42xlargeElasticsearch:
                return @"m4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM44xlargeElasticsearch:
                return @"m4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM410xlargeElasticsearch:
                return @"m4.10xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM5LargeElasticsearch:
                return @"m5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM5XlargeElasticsearch:
                return @"m5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM52xlargeElasticsearch:
                return @"m5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM54xlargeElasticsearch:
                return @"m5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM512xlargeElasticsearch:
                return @"m5.12xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR5LargeElasticsearch:
                return @"r5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR5XlargeElasticsearch:
                return @"r5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR52xlargeElasticsearch:
                return @"r5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR54xlargeElasticsearch:
                return @"r5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR512xlargeElasticsearch:
                return @"r5.12xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC5LargeElasticsearch:
                return @"c5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC5XlargeElasticsearch:
                return @"c5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC52xlargeElasticsearch:
                return @"c5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC54xlargeElasticsearch:
                return @"c5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC59xlargeElasticsearch:
                return @"c5.9xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC518xlargeElasticsearch:
                return @"c5.18xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2MicroElasticsearch:
                return @"t2.micro.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2SmallElasticsearch:
                return @"t2.small.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2MediumElasticsearch:
                return @"t2.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR3LargeElasticsearch:
                return @"r3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR3XlargeElasticsearch:
                return @"r3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR32xlargeElasticsearch:
                return @"r3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR34xlargeElasticsearch:
                return @"r3.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR38xlargeElasticsearch:
                return @"r3.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI2XlargeElasticsearch:
                return @"i2.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI22xlargeElasticsearch:
                return @"i2.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD2XlargeElasticsearch:
                return @"d2.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD22xlargeElasticsearch:
                return @"d2.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD24xlargeElasticsearch:
                return @"d2.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD28xlargeElasticsearch:
                return @"d2.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC4LargeElasticsearch:
                return @"c4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC4XlargeElasticsearch:
                return @"c4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC42xlargeElasticsearch:
                return @"c4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC44xlargeElasticsearch:
                return @"c4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC48xlargeElasticsearch:
                return @"c4.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR4LargeElasticsearch:
                return @"r4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR4XlargeElasticsearch:
                return @"r4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR42xlargeElasticsearch:
                return @"r4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR44xlargeElasticsearch:
                return @"r4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR48xlargeElasticsearch:
                return @"r4.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR416xlargeElasticsearch:
                return @"r4.16xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI3LargeElasticsearch:
                return @"i3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI3XlargeElasticsearch:
                return @"i3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI32xlargeElasticsearch:
                return @"i3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI34xlargeElasticsearch:
                return @"i3.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI38xlargeElasticsearch:
                return @"i3.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI316xlargeElasticsearch:
                return @"i3.16xlarge.elasticsearch";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)paymentOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_UPFRONT"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionAllUpfront);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_UPFRONT"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionNoUpfront);
        }
        return @(AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionAllUpfront:
                return @"ALL_UPFRONT";
            case AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionPartialUpfront:
                return @"PARTIAL_UPFRONT";
            case AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceRecurringCharge class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSElasticsearchserviceReservedElasticsearchInstanceOffering

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
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM410xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"m5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeM512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r5.12xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR512xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC5LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC5XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC52xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC54xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.9xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC59xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c5.18xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC518xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ultrawarm1.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.micro.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2MicroElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.small.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2SmallElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"t2.medium.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeT2MediumElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD2XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD22xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD24xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeD28xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeC48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR4LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR4XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR42xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR44xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR48xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"r4.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeR416xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.large.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI3LargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI3XlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.2xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI32xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.4xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI34xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.8xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI38xlargeElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"i3.16xlarge.elasticsearch"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceESPartitionInstanceTypeI316xlargeElasticsearch);
        }
        return @(AWSElasticsearchserviceESPartitionInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceESPartitionInstanceTypeM3MediumElasticsearch:
                return @"m3.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM3LargeElasticsearch:
                return @"m3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM3XlargeElasticsearch:
                return @"m3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM32xlargeElasticsearch:
                return @"m3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM4LargeElasticsearch:
                return @"m4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM4XlargeElasticsearch:
                return @"m4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM42xlargeElasticsearch:
                return @"m4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM44xlargeElasticsearch:
                return @"m4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM410xlargeElasticsearch:
                return @"m4.10xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM5LargeElasticsearch:
                return @"m5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM5XlargeElasticsearch:
                return @"m5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM52xlargeElasticsearch:
                return @"m5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM54xlargeElasticsearch:
                return @"m5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeM512xlargeElasticsearch:
                return @"m5.12xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR5LargeElasticsearch:
                return @"r5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR5XlargeElasticsearch:
                return @"r5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR52xlargeElasticsearch:
                return @"r5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR54xlargeElasticsearch:
                return @"r5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR512xlargeElasticsearch:
                return @"r5.12xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC5LargeElasticsearch:
                return @"c5.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC5XlargeElasticsearch:
                return @"c5.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC52xlargeElasticsearch:
                return @"c5.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC54xlargeElasticsearch:
                return @"c5.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC59xlargeElasticsearch:
                return @"c5.9xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC518xlargeElasticsearch:
                return @"c5.18xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1MediumElasticsearch:
                return @"ultrawarm1.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1LargeElasticsearch:
                return @"ultrawarm1.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2MicroElasticsearch:
                return @"t2.micro.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2SmallElasticsearch:
                return @"t2.small.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeT2MediumElasticsearch:
                return @"t2.medium.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR3LargeElasticsearch:
                return @"r3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR3XlargeElasticsearch:
                return @"r3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR32xlargeElasticsearch:
                return @"r3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR34xlargeElasticsearch:
                return @"r3.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR38xlargeElasticsearch:
                return @"r3.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI2XlargeElasticsearch:
                return @"i2.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI22xlargeElasticsearch:
                return @"i2.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD2XlargeElasticsearch:
                return @"d2.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD22xlargeElasticsearch:
                return @"d2.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD24xlargeElasticsearch:
                return @"d2.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeD28xlargeElasticsearch:
                return @"d2.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC4LargeElasticsearch:
                return @"c4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC4XlargeElasticsearch:
                return @"c4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC42xlargeElasticsearch:
                return @"c4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC44xlargeElasticsearch:
                return @"c4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeC48xlargeElasticsearch:
                return @"c4.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR4LargeElasticsearch:
                return @"r4.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR4XlargeElasticsearch:
                return @"r4.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR42xlargeElasticsearch:
                return @"r4.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR44xlargeElasticsearch:
                return @"r4.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR48xlargeElasticsearch:
                return @"r4.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeR416xlargeElasticsearch:
                return @"r4.16xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI3LargeElasticsearch:
                return @"i3.large.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI3XlargeElasticsearch:
                return @"i3.xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI32xlargeElasticsearch:
                return @"i3.2xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI34xlargeElasticsearch:
                return @"i3.4xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI38xlargeElasticsearch:
                return @"i3.8xlarge.elasticsearch";
            case AWSElasticsearchserviceESPartitionInstanceTypeI316xlargeElasticsearch:
                return @"i3.16xlarge.elasticsearch";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)paymentOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_UPFRONT"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionAllUpfront);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_UPFRONT"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionNoUpfront);
        }
        return @(AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionAllUpfront:
                return @"ALL_UPFRONT";
            case AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionPartialUpfront:
                return @"PARTIAL_UPFRONT";
            case AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceRecurringCharge class]];
}

@end

@implementation AWSElasticsearchserviceServiceSoftwareOptions

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
            return @(AWSElasticsearchserviceDeploymentStatusPendingUpdate);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceDeploymentStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceDeploymentStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"NOT_ELIGIBLE"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceDeploymentStatusNotEligible);
        }
        if ([value caseInsensitiveCompare:@"ELIGIBLE"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceDeploymentStatusEligible);
        }
        return @(AWSElasticsearchserviceDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceDeploymentStatusPendingUpdate:
                return @"PENDING_UPDATE";
            case AWSElasticsearchserviceDeploymentStatusInProgress:
                return @"IN_PROGRESS";
            case AWSElasticsearchserviceDeploymentStatusCompleted:
                return @"COMPLETED";
            case AWSElasticsearchserviceDeploymentStatusNotEligible:
                return @"NOT_ELIGIBLE";
            case AWSElasticsearchserviceDeploymentStatusEligible:
                return @"ELIGIBLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchserviceSnapshotOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automatedSnapshotStartHour" : @"AutomatedSnapshotStartHour",
             };
}

@end

@implementation AWSElasticsearchserviceSnapshotOptionsStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceSnapshotOptions class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSoftwareOptions" : @"ServiceSoftwareOptions",
             };
}

+ (NSValueTransformer *)serviceSoftwareOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceServiceSoftwareOptions class]];
}

@end

@implementation AWSElasticsearchserviceStorageType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"storageSubTypeName" : @"StorageSubTypeName",
             @"storageTypeLimits" : @"StorageTypeLimits",
             @"storageTypeName" : @"StorageTypeName",
             };
}

+ (NSValueTransformer *)storageTypeLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceStorageTypeLimit class]];
}

@end

@implementation AWSElasticsearchserviceStorageTypeLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limitName" : @"LimitName",
             @"limitValues" : @"LimitValues",
             };
}

@end

@implementation AWSElasticsearchserviceTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticsearchserviceUpdateElasticsearchDomainConfigRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceAdvancedSecurityOptionsInput class]];
}

+ (NSValueTransformer *)cognitoOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceCognitoOptions class]];
}

+ (NSValueTransformer *)domainEndpointOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceDomainEndpointOptions class]];
}

+ (NSValueTransformer *)EBSOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceEBSOptions class]];
}

+ (NSValueTransformer *)elasticsearchClusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchClusterConfig class]];
}

+ (NSValueTransformer *)logPublishingOptionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSElasticsearchserviceLogPublishingOption class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)snapshotOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceSnapshotOptions class]];
}

+ (NSValueTransformer *)VPCOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceVPCOptions class]];
}

@end

@implementation AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainConfig" : @"DomainConfig",
             };
}

+ (NSValueTransformer *)domainConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceElasticsearchDomainConfig class]];
}

@end

@implementation AWSElasticsearchserviceUpgradeElasticsearchDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"performCheckOnly" : @"PerformCheckOnly",
             @"targetVersion" : @"TargetVersion",
             };
}

@end

@implementation AWSElasticsearchserviceUpgradeElasticsearchDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"performCheckOnly" : @"PerformCheckOnly",
             @"targetVersion" : @"TargetVersion",
             };
}

@end

@implementation AWSElasticsearchserviceUpgradeHistory

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticsearchserviceUpgradeStepItem class]];
}

+ (NSValueTransformer *)upgradeStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED_WITH_ISSUES"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStatusSucceededWithIssues);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStatusFailed);
        }
        return @(AWSElasticsearchserviceUpgradeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceUpgradeStatusInProgress:
                return @"IN_PROGRESS";
            case AWSElasticsearchserviceUpgradeStatusSucceeded:
                return @"SUCCEEDED";
            case AWSElasticsearchserviceUpgradeStatusSucceededWithIssues:
                return @"SUCCEEDED_WITH_ISSUES";
            case AWSElasticsearchserviceUpgradeStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchserviceUpgradeStepItem

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
            return @(AWSElasticsearchserviceUpgradeStepPreUpgradeCheck);
        }
        if ([value caseInsensitiveCompare:@"SNAPSHOT"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStepSnapshot);
        }
        if ([value caseInsensitiveCompare:@"UPGRADE"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStepUpgrade);
        }
        return @(AWSElasticsearchserviceUpgradeStepUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceUpgradeStepPreUpgradeCheck:
                return @"PRE_UPGRADE_CHECK";
            case AWSElasticsearchserviceUpgradeStepSnapshot:
                return @"SNAPSHOT";
            case AWSElasticsearchserviceUpgradeStepUpgrade:
                return @"UPGRADE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)upgradeStepStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED_WITH_ISSUES"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStatusSucceededWithIssues);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSElasticsearchserviceUpgradeStatusFailed);
        }
        return @(AWSElasticsearchserviceUpgradeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticsearchserviceUpgradeStatusInProgress:
                return @"IN_PROGRESS";
            case AWSElasticsearchserviceUpgradeStatusSucceeded:
                return @"SUCCEEDED";
            case AWSElasticsearchserviceUpgradeStatusSucceededWithIssues:
                return @"SUCCEEDED_WITH_ISSUES";
            case AWSElasticsearchserviceUpgradeStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticsearchserviceVPCDerivedInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"VPCId" : @"VPCId",
             };
}

@end

@implementation AWSElasticsearchserviceVPCDerivedInfoStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceVPCDerivedInfo class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticsearchserviceOptionStatus class]];
}

@end

@implementation AWSElasticsearchserviceVPCOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSElasticsearchserviceZoneAwarenessConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZoneCount" : @"AvailabilityZoneCount",
             };
}

@end
