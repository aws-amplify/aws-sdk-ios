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

#import "AWSSecurityhubModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSecurityhubErrorDomain = @"com.amazonaws.AWSSecurityhubErrorDomain";

@implementation AWSSecurityhubAcceptInvitationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitationId" : @"InvitationId",
             @"masterId" : @"MasterId",
             };
}

@end

@implementation AWSSecurityhubAcceptInvitationResponse

@end

@implementation AWSSecurityhubAccountDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"email" : @"Email",
             };
}

@end

@implementation AWSSecurityhubActionTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArn" : @"ActionTargetArn",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSecurityhubAvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnetId" : @"SubnetId",
             @"zoneName" : @"ZoneName",
             };
}

@end

@implementation AWSSecurityhubAwsCloudFrontDistributionDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"ETag" : @"ETag",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"logging" : @"Logging",
             @"origins" : @"Origins",
             @"status" : @"Status",
             @"webAclId" : @"WebAclId",
             };
}

+ (NSValueTransformer *)loggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsCloudFrontDistributionLogging class]];
}

+ (NSValueTransformer *)originsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsCloudFrontDistributionOrigins class]];
}

@end

@implementation AWSSecurityhubAwsCloudFrontDistributionLogging

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"enabled" : @"Enabled",
             @"includeCookies" : @"IncludeCookies",
             @"prefix" : @"Prefix",
             };
}

@end

@implementation AWSSecurityhubAwsCloudFrontDistributionOriginItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"originPath" : @"OriginPath",
             };
}

@end

@implementation AWSSecurityhubAwsCloudFrontDistributionOrigins

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsCloudFrontDistributionOriginItem class]];
}

@end

@implementation AWSSecurityhubAwsCodeBuildProjectDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionKey" : @"EncryptionKey",
             @"environment" : @"Environment",
             @"name" : @"Name",
             @"serviceRole" : @"ServiceRole",
             @"source" : @"Source",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsCodeBuildProjectEnvironment class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsCodeBuildProjectSource class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsCodeBuildProjectVpcConfig class]];
}

@end

@implementation AWSSecurityhubAwsCodeBuildProjectEnvironment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             @"imagePullCredentialsType" : @"ImagePullCredentialsType",
             @"registryCredential" : @"RegistryCredential",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)registryCredentialJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsCodeBuildProjectEnvironmentRegistryCredential class]];
}

@end

@implementation AWSSecurityhubAwsCodeBuildProjectEnvironmentRegistryCredential

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credential" : @"Credential",
             @"credentialProvider" : @"CredentialProvider",
             };
}

@end

@implementation AWSSecurityhubAwsCodeBuildProjectSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gitCloneDepth" : @"GitCloneDepth",
             @"insecureSsl" : @"InsecureSsl",
             @"location" : @"Location",
             @"types" : @"Type",
             };
}

@end

@implementation AWSSecurityhubAwsCodeBuildProjectVpcConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnets" : @"Subnets",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSSecurityhubAwsEc2InstanceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iamInstanceProfileArn" : @"IamInstanceProfileArn",
             @"imageId" : @"ImageId",
             @"ipV4Addresses" : @"IpV4Addresses",
             @"ipV6Addresses" : @"IpV6Addresses",
             @"keyName" : @"KeyName",
             @"launchedAt" : @"LaunchedAt",
             @"subnetId" : @"SubnetId",
             @"types" : @"Type",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSSecurityhubAwsEc2NetworkInterfaceAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachTime" : @"AttachTime",
             @"attachmentId" : @"AttachmentId",
             @"deleteOnTermination" : @"DeleteOnTermination",
             @"deviceIndex" : @"DeviceIndex",
             @"instanceId" : @"InstanceId",
             @"instanceOwnerId" : @"InstanceOwnerId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSSecurityhubAwsEc2NetworkInterfaceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachment" : @"Attachment",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"securityGroups" : @"SecurityGroups",
             @"sourceDestCheck" : @"SourceDestCheck",
             };
}

+ (NSValueTransformer *)attachmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsEc2NetworkInterfaceAttachment class]];
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsEc2NetworkInterfaceSecurityGroup class]];
}

@end

@implementation AWSSecurityhubAwsEc2NetworkInterfaceSecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSSecurityhubAwsEc2SecurityGroupDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             @"ipPermissions" : @"IpPermissions",
             @"ipPermissionsEgress" : @"IpPermissionsEgress",
             @"ownerId" : @"OwnerId",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)ipPermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsEc2SecurityGroupIpPermission class]];
}

+ (NSValueTransformer *)ipPermissionsEgressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsEc2SecurityGroupIpPermission class]];
}

@end

@implementation AWSSecurityhubAwsEc2SecurityGroupIpPermission

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fromPort" : @"FromPort",
             @"ipProtocol" : @"IpProtocol",
             @"ipRanges" : @"IpRanges",
             @"ipv6Ranges" : @"Ipv6Ranges",
             @"prefixListIds" : @"PrefixListIds",
             @"toPort" : @"ToPort",
             @"userIdGroupPairs" : @"UserIdGroupPairs",
             };
}

+ (NSValueTransformer *)ipRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsEc2SecurityGroupIpRange class]];
}

+ (NSValueTransformer *)ipv6RangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsEc2SecurityGroupIpv6Range class]];
}

+ (NSValueTransformer *)prefixListIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsEc2SecurityGroupPrefixListId class]];
}

+ (NSValueTransformer *)userIdGroupPairsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsEc2SecurityGroupUserIdGroupPair class]];
}

@end

@implementation AWSSecurityhubAwsEc2SecurityGroupIpRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrIp" : @"CidrIp",
             };
}

@end

@implementation AWSSecurityhubAwsEc2SecurityGroupIpv6Range

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrIpv6" : @"CidrIpv6",
             };
}

@end

@implementation AWSSecurityhubAwsEc2SecurityGroupPrefixListId

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prefixListId" : @"PrefixListId",
             };
}

@end

@implementation AWSSecurityhubAwsEc2SecurityGroupUserIdGroupPair

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             @"peeringStatus" : @"PeeringStatus",
             @"userId" : @"UserId",
             @"vpcId" : @"VpcId",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

@end

@implementation AWSSecurityhubAwsElasticsearchDomainDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicies" : @"AccessPolicies",
             @"domainEndpointOptions" : @"DomainEndpointOptions",
             @"domainId" : @"DomainId",
             @"domainName" : @"DomainName",
             @"elasticsearchVersion" : @"ElasticsearchVersion",
             @"encryptionAtRestOptions" : @"EncryptionAtRestOptions",
             @"endpoint" : @"Endpoint",
             @"endpoints" : @"Endpoints",
             @"nodeToNodeEncryptionOptions" : @"NodeToNodeEncryptionOptions",
             @"VPCOptions" : @"VPCOptions",
             };
}

+ (NSValueTransformer *)domainEndpointOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsElasticsearchDomainDomainEndpointOptions class]];
}

+ (NSValueTransformer *)encryptionAtRestOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsElasticsearchDomainEncryptionAtRestOptions class]];
}

+ (NSValueTransformer *)nodeToNodeEncryptionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsElasticsearchDomainNodeToNodeEncryptionOptions class]];
}

+ (NSValueTransformer *)VPCOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsElasticsearchDomainVPCOptions class]];
}

@end

@implementation AWSSecurityhubAwsElasticsearchDomainDomainEndpointOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enforceHTTPS" : @"EnforceHTTPS",
             @"TLSSecurityPolicy" : @"TLSSecurityPolicy",
             };
}

@end

@implementation AWSSecurityhubAwsElasticsearchDomainEncryptionAtRestOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"kmsKeyId" : @"KmsKeyId",
             };
}

@end

@implementation AWSSecurityhubAwsElasticsearchDomainNodeToNodeEncryptionOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSSecurityhubAwsElasticsearchDomainVPCOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"VPCId" : @"VPCId",
             };
}

@end

@implementation AWSSecurityhubAwsElbv2LoadBalancerDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"canonicalHostedZoneId" : @"CanonicalHostedZoneId",
             @"createdTime" : @"CreatedTime",
             @"DNSName" : @"DNSName",
             @"ipAddressType" : @"IpAddressType",
             @"scheme" : @"Scheme",
             @"securityGroups" : @"SecurityGroups",
             @"state" : @"State",
             @"types" : @"Type",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)availabilityZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAvailabilityZone class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubLoadBalancerState class]];
}

@end

@implementation AWSSecurityhubAwsIamAccessKeyDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"principalId" : @"PrincipalId",
             @"principalName" : @"PrincipalName",
             @"principalType" : @"PrincipalType",
             @"status" : @"Status",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSecurityhubAwsIamAccessKeyStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSSecurityhubAwsIamAccessKeyStatusInactive);
        }
        return @(AWSSecurityhubAwsIamAccessKeyStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubAwsIamAccessKeyStatusActive:
                return @"Active";
            case AWSSecurityhubAwsIamAccessKeyStatusInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubAwsIamRoleDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assumeRolePolicyDocument" : @"AssumeRolePolicyDocument",
             @"createDate" : @"CreateDate",
             @"maxSessionDuration" : @"MaxSessionDuration",
             @"path" : @"Path",
             @"roleId" : @"RoleId",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSSecurityhubAwsKmsKeyDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSAccountId" : @"AWSAccountId",
             @"creationDate" : @"CreationDate",
             @"keyId" : @"KeyId",
             @"keyManager" : @"KeyManager",
             @"keyState" : @"KeyState",
             @"origin" : @"Origin",
             };
}

@end

@implementation AWSSecurityhubAwsLambdaFunctionCode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             @"s3ObjectVersion" : @"S3ObjectVersion",
             @"zipFile" : @"ZipFile",
             };
}

@end

@implementation AWSSecurityhubAwsLambdaFunctionDeadLetterConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetArn" : @"TargetArn",
             };
}

@end

@implementation AWSSecurityhubAwsLambdaFunctionDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"codeSha256" : @"CodeSha256",
             @"deadLetterConfig" : @"DeadLetterConfig",
             @"environment" : @"Environment",
             @"functionName" : @"FunctionName",
             @"handler" : @"Handler",
             @"kmsKeyArn" : @"KmsKeyArn",
             @"lastModified" : @"LastModified",
             @"layers" : @"Layers",
             @"masterArn" : @"MasterArn",
             @"memorySize" : @"MemorySize",
             @"revisionId" : @"RevisionId",
             @"role" : @"Role",
             @"runtime" : @"Runtime",
             @"timeout" : @"Timeout",
             @"tracingConfig" : @"TracingConfig",
             @"version" : @"Version",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsLambdaFunctionCode class]];
}

+ (NSValueTransformer *)deadLetterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsLambdaFunctionDeadLetterConfig class]];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsLambdaFunctionEnvironment class]];
}

+ (NSValueTransformer *)layersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsLambdaFunctionLayer class]];
}

+ (NSValueTransformer *)tracingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsLambdaFunctionTracingConfig class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsLambdaFunctionVpcConfig class]];
}

@end

@implementation AWSSecurityhubAwsLambdaFunctionEnvironment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"variables" : @"Variables",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsLambdaFunctionEnvironmentError class]];
}

@end

@implementation AWSSecurityhubAwsLambdaFunctionEnvironmentError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"message" : @"Message",
             };
}

@end

@implementation AWSSecurityhubAwsLambdaFunctionLayer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"codeSize" : @"CodeSize",
             };
}

@end

@implementation AWSSecurityhubAwsLambdaFunctionTracingConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mode" : @"Mode",
             };
}

@end

@implementation AWSSecurityhubAwsLambdaFunctionVpcConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSSecurityhubAwsLambdaLayerVersionDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleRuntimes" : @"CompatibleRuntimes",
             @"createdDate" : @"CreatedDate",
             @"version" : @"Version",
             };
}

@end

@implementation AWSSecurityhubAwsRdsDbInstanceAssociatedRole

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             @"status" : @"Status",
             };
}

@end

@implementation AWSSecurityhubAwsRdsDbInstanceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatedRoles" : @"AssociatedRoles",
             @"CACertificateIdentifier" : @"CACertificateIdentifier",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBName" : @"DBName",
             @"dbInstancePort" : @"DbInstancePort",
             @"dbiResourceId" : @"DbiResourceId",
             @"deletionProtection" : @"DeletionProtection",
             @"endpoint" : @"Endpoint",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"IAMDatabaseAuthenticationEnabled" : @"IAMDatabaseAuthenticationEnabled",
             @"instanceCreateTime" : @"InstanceCreateTime",
             @"kmsKeyId" : @"KmsKeyId",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"storageEncrypted" : @"StorageEncrypted",
             @"tdeCredentialArn" : @"TdeCredentialArn",
             @"vpcSecurityGroups" : @"VpcSecurityGroups",
             };
}

+ (NSValueTransformer *)associatedRolesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsRdsDbInstanceAssociatedRole class]];
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsRdsDbInstanceEndpoint class]];
}

+ (NSValueTransformer *)vpcSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsRdsDbInstanceVpcSecurityGroup class]];
}

@end

@implementation AWSSecurityhubAwsRdsDbInstanceEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"hostedZoneId" : @"HostedZoneId",
             @"port" : @"Port",
             };
}

@end

@implementation AWSSecurityhubAwsRdsDbInstanceVpcSecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"vpcSecurityGroupId" : @"VpcSecurityGroupId",
             };
}

@end

@implementation AWSSecurityhubAwsS3BucketDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"ownerId" : @"OwnerId",
             @"ownerName" : @"OwnerName",
             @"serverSideEncryptionConfiguration" : @"ServerSideEncryptionConfiguration",
             };
}

+ (NSValueTransformer *)serverSideEncryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsS3BucketServerSideEncryptionConfiguration class]];
}

@end

@implementation AWSSecurityhubAwsS3BucketServerSideEncryptionByDefault

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"KMSMasterKeyID" : @"KMSMasterKeyID",
             @"SSEAlgorithm" : @"SSEAlgorithm",
             };
}

@end

@implementation AWSSecurityhubAwsS3BucketServerSideEncryptionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsS3BucketServerSideEncryptionRule class]];
}

@end

@implementation AWSSecurityhubAwsS3BucketServerSideEncryptionRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyServerSideEncryptionByDefault" : @"ApplyServerSideEncryptionByDefault",
             };
}

+ (NSValueTransformer *)applyServerSideEncryptionByDefaultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsS3BucketServerSideEncryptionByDefault class]];
}

@end

@implementation AWSSecurityhubAwsS3ObjectDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"ETag" : @"ETag",
             @"lastModified" : @"LastModified",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSSecurityhubAwsSecurityFinding

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"compliance" : @"Compliance",
             @"confidence" : @"Confidence",
             @"createdAt" : @"CreatedAt",
             @"criticality" : @"Criticality",
             @"detail" : @"Description",
             @"firstObservedAt" : @"FirstObservedAt",
             @"generatorId" : @"GeneratorId",
             @"identifier" : @"Id",
             @"lastObservedAt" : @"LastObservedAt",
             @"malware" : @"Malware",
             @"network" : @"Network",
             @"note" : @"Note",
             @"process" : @"Process",
             @"productArn" : @"ProductArn",
             @"productFields" : @"ProductFields",
             @"recordState" : @"RecordState",
             @"relatedFindings" : @"RelatedFindings",
             @"remediation" : @"Remediation",
             @"resources" : @"Resources",
             @"schemaVersion" : @"SchemaVersion",
             @"severity" : @"Severity",
             @"sourceUrl" : @"SourceUrl",
             @"threatIntelIndicators" : @"ThreatIntelIndicators",
             @"title" : @"Title",
             @"types" : @"Types",
             @"updatedAt" : @"UpdatedAt",
             @"userDefinedFields" : @"UserDefinedFields",
             @"verificationState" : @"VerificationState",
             @"workflow" : @"Workflow",
             @"workflowState" : @"WorkflowState",
             };
}

+ (NSValueTransformer *)complianceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubCompliance class]];
}

+ (NSValueTransformer *)malwareJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubMalware class]];
}

+ (NSValueTransformer *)networkJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubNetwork class]];
}

+ (NSValueTransformer *)noteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubNote class]];
}

+ (NSValueTransformer *)processJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubProcessDetails class]];
}

+ (NSValueTransformer *)recordStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSSecurityhubRecordStateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSSecurityhubRecordStateArchived);
        }
        return @(AWSSecurityhubRecordStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubRecordStateActive:
                return @"ACTIVE";
            case AWSSecurityhubRecordStateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)relatedFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubRelatedFinding class]];
}

+ (NSValueTransformer *)remediationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubRemediation class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubResource class]];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubSeverity class]];
}

+ (NSValueTransformer *)threatIntelIndicatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubThreatIntelIndicator class]];
}

+ (NSValueTransformer *)verificationStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSSecurityhubVerificationStateUnknown);
        }
        if ([value caseInsensitiveCompare:@"TRUE_POSITIVE"] == NSOrderedSame) {
            return @(AWSSecurityhubVerificationStateTruePositive);
        }
        if ([value caseInsensitiveCompare:@"FALSE_POSITIVE"] == NSOrderedSame) {
            return @(AWSSecurityhubVerificationStateFalsePositive);
        }
        if ([value caseInsensitiveCompare:@"BENIGN_POSITIVE"] == NSOrderedSame) {
            return @(AWSSecurityhubVerificationStateBenignPositive);
        }
        return @(AWSSecurityhubVerificationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubVerificationStateUnknown:
                return @"UNKNOWN";
            case AWSSecurityhubVerificationStateTruePositive:
                return @"TRUE_POSITIVE";
            case AWSSecurityhubVerificationStateFalsePositive:
                return @"FALSE_POSITIVE";
            case AWSSecurityhubVerificationStateBenignPositive:
                return @"BENIGN_POSITIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)workflowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubWorkflow class]];
}

+ (NSValueTransformer *)workflowStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEW"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStateNew);
        }
        if ([value caseInsensitiveCompare:@"ASSIGNED"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStateAssigned);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"DEFERRED"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStateDeferred);
        }
        if ([value caseInsensitiveCompare:@"RESOLVED"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStateResolved);
        }
        return @(AWSSecurityhubWorkflowStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubWorkflowStateNew:
                return @"NEW";
            case AWSSecurityhubWorkflowStateAssigned:
                return @"ASSIGNED";
            case AWSSecurityhubWorkflowStateInProgress:
                return @"IN_PROGRESS";
            case AWSSecurityhubWorkflowStateDeferred:
                return @"DEFERRED";
            case AWSSecurityhubWorkflowStateResolved:
                return @"RESOLVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubAwsSecurityFindingFilters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"companyName" : @"CompanyName",
             @"complianceStatus" : @"ComplianceStatus",
             @"confidence" : @"Confidence",
             @"createdAt" : @"CreatedAt",
             @"criticality" : @"Criticality",
             @"detail" : @"Description",
             @"firstObservedAt" : @"FirstObservedAt",
             @"generatorId" : @"GeneratorId",
             @"identifier" : @"Id",
             @"keyword" : @"Keyword",
             @"lastObservedAt" : @"LastObservedAt",
             @"malwareName" : @"MalwareName",
             @"malwarePath" : @"MalwarePath",
             @"malwareState" : @"MalwareState",
             @"malwareType" : @"MalwareType",
             @"networkDestinationDomain" : @"NetworkDestinationDomain",
             @"networkDestinationIpV4" : @"NetworkDestinationIpV4",
             @"networkDestinationIpV6" : @"NetworkDestinationIpV6",
             @"networkDestinationPort" : @"NetworkDestinationPort",
             @"networkDirection" : @"NetworkDirection",
             @"networkProtocol" : @"NetworkProtocol",
             @"networkSourceDomain" : @"NetworkSourceDomain",
             @"networkSourceIpV4" : @"NetworkSourceIpV4",
             @"networkSourceIpV6" : @"NetworkSourceIpV6",
             @"networkSourceMac" : @"NetworkSourceMac",
             @"networkSourcePort" : @"NetworkSourcePort",
             @"noteText" : @"NoteText",
             @"noteUpdatedAt" : @"NoteUpdatedAt",
             @"noteUpdatedBy" : @"NoteUpdatedBy",
             @"processLaunchedAt" : @"ProcessLaunchedAt",
             @"processName" : @"ProcessName",
             @"processParentPid" : @"ProcessParentPid",
             @"processPath" : @"ProcessPath",
             @"processPid" : @"ProcessPid",
             @"processTerminatedAt" : @"ProcessTerminatedAt",
             @"productArn" : @"ProductArn",
             @"productFields" : @"ProductFields",
             @"productName" : @"ProductName",
             @"recommendationText" : @"RecommendationText",
             @"recordState" : @"RecordState",
             @"relatedFindingsId" : @"RelatedFindingsId",
             @"relatedFindingsProductArn" : @"RelatedFindingsProductArn",
             @"resourceAwsEc2InstanceIamInstanceProfileArn" : @"ResourceAwsEc2InstanceIamInstanceProfileArn",
             @"resourceAwsEc2InstanceImageId" : @"ResourceAwsEc2InstanceImageId",
             @"resourceAwsEc2InstanceIpV4Addresses" : @"ResourceAwsEc2InstanceIpV4Addresses",
             @"resourceAwsEc2InstanceIpV6Addresses" : @"ResourceAwsEc2InstanceIpV6Addresses",
             @"resourceAwsEc2InstanceKeyName" : @"ResourceAwsEc2InstanceKeyName",
             @"resourceAwsEc2InstanceLaunchedAt" : @"ResourceAwsEc2InstanceLaunchedAt",
             @"resourceAwsEc2InstanceSubnetId" : @"ResourceAwsEc2InstanceSubnetId",
             @"resourceAwsEc2InstanceType" : @"ResourceAwsEc2InstanceType",
             @"resourceAwsEc2InstanceVpcId" : @"ResourceAwsEc2InstanceVpcId",
             @"resourceAwsIamAccessKeyCreatedAt" : @"ResourceAwsIamAccessKeyCreatedAt",
             @"resourceAwsIamAccessKeyStatus" : @"ResourceAwsIamAccessKeyStatus",
             @"resourceAwsIamAccessKeyUserName" : @"ResourceAwsIamAccessKeyUserName",
             @"resourceAwsS3BucketOwnerId" : @"ResourceAwsS3BucketOwnerId",
             @"resourceAwsS3BucketOwnerName" : @"ResourceAwsS3BucketOwnerName",
             @"resourceContainerImageId" : @"ResourceContainerImageId",
             @"resourceContainerImageName" : @"ResourceContainerImageName",
             @"resourceContainerLaunchedAt" : @"ResourceContainerLaunchedAt",
             @"resourceContainerName" : @"ResourceContainerName",
             @"resourceDetailsOther" : @"ResourceDetailsOther",
             @"resourceId" : @"ResourceId",
             @"resourcePartition" : @"ResourcePartition",
             @"resourceRegion" : @"ResourceRegion",
             @"resourceTags" : @"ResourceTags",
             @"resourceType" : @"ResourceType",
             @"severityLabel" : @"SeverityLabel",
             @"severityNormalized" : @"SeverityNormalized",
             @"severityProduct" : @"SeverityProduct",
             @"sourceUrl" : @"SourceUrl",
             @"threatIntelIndicatorCategory" : @"ThreatIntelIndicatorCategory",
             @"threatIntelIndicatorLastObservedAt" : @"ThreatIntelIndicatorLastObservedAt",
             @"threatIntelIndicatorSource" : @"ThreatIntelIndicatorSource",
             @"threatIntelIndicatorSourceUrl" : @"ThreatIntelIndicatorSourceUrl",
             @"threatIntelIndicatorType" : @"ThreatIntelIndicatorType",
             @"threatIntelIndicatorValue" : @"ThreatIntelIndicatorValue",
             @"title" : @"Title",
             @"types" : @"Type",
             @"updatedAt" : @"UpdatedAt",
             @"userDefinedFields" : @"UserDefinedFields",
             @"verificationState" : @"VerificationState",
             @"workflowState" : @"WorkflowState",
             @"workflowStatus" : @"WorkflowStatus",
             };
}

+ (NSValueTransformer *)awsAccountIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)companyNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)complianceStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)confidenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubDateFilter class]];
}

+ (NSValueTransformer *)criticalityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)detailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)firstObservedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubDateFilter class]];
}

+ (NSValueTransformer *)generatorIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)identifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)keywordJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubKeywordFilter class]];
}

+ (NSValueTransformer *)lastObservedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubDateFilter class]];
}

+ (NSValueTransformer *)malwareNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)malwarePathJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)malwareStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)malwareTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkDestinationDomainJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkDestinationIpV4JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubIpFilter class]];
}

+ (NSValueTransformer *)networkDestinationIpV6JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubIpFilter class]];
}

+ (NSValueTransformer *)networkDestinationPortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)networkDirectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkProtocolJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkSourceDomainJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkSourceIpV4JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubIpFilter class]];
}

+ (NSValueTransformer *)networkSourceIpV6JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubIpFilter class]];
}

+ (NSValueTransformer *)networkSourceMacJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkSourcePortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)noteTextJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)noteUpdatedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubDateFilter class]];
}

+ (NSValueTransformer *)noteUpdatedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)processLaunchedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubDateFilter class]];
}

+ (NSValueTransformer *)processNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)processParentPidJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)processPathJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)processPidJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)processTerminatedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubDateFilter class]];
}

+ (NSValueTransformer *)productArnJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)productFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubMapFilter class]];
}

+ (NSValueTransformer *)productNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)recommendationTextJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)recordStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)relatedFindingsIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)relatedFindingsProductArnJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceIamInstanceProfileArnJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceImageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceIpV4AddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubIpFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceIpV6AddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubIpFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceKeyNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceLaunchedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubDateFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceSubnetIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceVpcIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsIamAccessKeyCreatedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubDateFilter class]];
}

+ (NSValueTransformer *)resourceAwsIamAccessKeyStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsIamAccessKeyUserNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsS3BucketOwnerIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsS3BucketOwnerNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceContainerImageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceContainerImageNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceContainerLaunchedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubDateFilter class]];
}

+ (NSValueTransformer *)resourceContainerNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceDetailsOtherJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubMapFilter class]];
}

+ (NSValueTransformer *)resourceIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourcePartitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceRegionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubMapFilter class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)severityLabelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)severityNormalizedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)severityProductJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)sourceUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorCategoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorLastObservedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubDateFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorSourceUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)titleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubDateFilter class]];
}

+ (NSValueTransformer *)userDefinedFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubMapFilter class]];
}

+ (NSValueTransformer *)verificationStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)workflowStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

+ (NSValueTransformer *)workflowStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStringFilter class]];
}

@end

@implementation AWSSecurityhubAwsSecurityFindingIdentifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"productArn" : @"ProductArn",
             };
}

@end

@implementation AWSSecurityhubAwsSnsTopicDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsMasterKeyId" : @"KmsMasterKeyId",
             @"owner" : @"Owner",
             @"subscription" : @"Subscription",
             @"topicName" : @"TopicName",
             };
}

+ (NSValueTransformer *)subscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsSnsTopicSubscription class]];
}

@end

@implementation AWSSecurityhubAwsSnsTopicSubscription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             @"protocols" : @"Protocol",
             };
}

@end

@implementation AWSSecurityhubAwsSqsQueueDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deadLetterTargetArn" : @"DeadLetterTargetArn",
             @"kmsDataKeyReusePeriodSeconds" : @"KmsDataKeyReusePeriodSeconds",
             @"kmsMasterKeyId" : @"KmsMasterKeyId",
             @"queueName" : @"QueueName",
             };
}

@end

@implementation AWSSecurityhubAwsWafWebAclDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultAction" : @"DefaultAction",
             @"name" : @"Name",
             @"rules" : @"Rules",
             @"webAclId" : @"WebAclId",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsWafWebAclRule class]];
}

@end

@implementation AWSSecurityhubAwsWafWebAclRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"excludedRules" : @"ExcludedRules",
             @"overrideAction" : @"OverrideAction",
             @"priority" : @"Priority",
             @"ruleId" : @"RuleId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubWafAction class]];
}

+ (NSValueTransformer *)excludedRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubWafExcludedRule class]];
}

+ (NSValueTransformer *)overrideActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubWafOverrideAction class]];
}

@end

@implementation AWSSecurityhubBatchDisableStandardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"standardsSubscriptionArns" : @"StandardsSubscriptionArns",
             };
}

@end

@implementation AWSSecurityhubBatchDisableStandardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"standardsSubscriptions" : @"StandardsSubscriptions",
             };
}

+ (NSValueTransformer *)standardsSubscriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStandardsSubscription class]];
}

@end

@implementation AWSSecurityhubBatchEnableStandardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"standardsSubscriptionRequests" : @"StandardsSubscriptionRequests",
             };
}

+ (NSValueTransformer *)standardsSubscriptionRequestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStandardsSubscriptionRequest class]];
}

@end

@implementation AWSSecurityhubBatchEnableStandardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"standardsSubscriptions" : @"StandardsSubscriptions",
             };
}

+ (NSValueTransformer *)standardsSubscriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStandardsSubscription class]];
}

@end

@implementation AWSSecurityhubBatchImportFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findings" : @"Findings",
             };
}

+ (NSValueTransformer *)findingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsSecurityFinding class]];
}

@end

@implementation AWSSecurityhubBatchImportFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedCount" : @"FailedCount",
             @"failedFindings" : @"FailedFindings",
             @"successCount" : @"SuccessCount",
             };
}

+ (NSValueTransformer *)failedFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubImportFindingsError class]];
}

@end

@implementation AWSSecurityhubBatchUpdateFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"criticality" : @"Criticality",
             @"findingIdentifiers" : @"FindingIdentifiers",
             @"note" : @"Note",
             @"relatedFindings" : @"RelatedFindings",
             @"severity" : @"Severity",
             @"types" : @"Types",
             @"userDefinedFields" : @"UserDefinedFields",
             @"verificationState" : @"VerificationState",
             @"workflow" : @"Workflow",
             };
}

+ (NSValueTransformer *)findingIdentifiersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsSecurityFindingIdentifier class]];
}

+ (NSValueTransformer *)noteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubNoteUpdate class]];
}

+ (NSValueTransformer *)relatedFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubRelatedFinding class]];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubSeverityUpdate class]];
}

+ (NSValueTransformer *)verificationStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSSecurityhubVerificationStateUnknown);
        }
        if ([value caseInsensitiveCompare:@"TRUE_POSITIVE"] == NSOrderedSame) {
            return @(AWSSecurityhubVerificationStateTruePositive);
        }
        if ([value caseInsensitiveCompare:@"FALSE_POSITIVE"] == NSOrderedSame) {
            return @(AWSSecurityhubVerificationStateFalsePositive);
        }
        if ([value caseInsensitiveCompare:@"BENIGN_POSITIVE"] == NSOrderedSame) {
            return @(AWSSecurityhubVerificationStateBenignPositive);
        }
        return @(AWSSecurityhubVerificationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubVerificationStateUnknown:
                return @"UNKNOWN";
            case AWSSecurityhubVerificationStateTruePositive:
                return @"TRUE_POSITIVE";
            case AWSSecurityhubVerificationStateFalsePositive:
                return @"FALSE_POSITIVE";
            case AWSSecurityhubVerificationStateBenignPositive:
                return @"BENIGN_POSITIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)workflowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubWorkflowUpdate class]];
}

@end

@implementation AWSSecurityhubBatchUpdateFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processedFindings" : @"ProcessedFindings",
             @"unprocessedFindings" : @"UnprocessedFindings",
             };
}

+ (NSValueTransformer *)processedFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsSecurityFindingIdentifier class]];
}

+ (NSValueTransformer *)unprocessedFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubBatchUpdateFindingsUnprocessedFinding class]];
}

@end

@implementation AWSSecurityhubBatchUpdateFindingsUnprocessedFinding

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"findingIdentifier" : @"FindingIdentifier",
             };
}

+ (NSValueTransformer *)findingIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsSecurityFindingIdentifier class]];
}

@end

@implementation AWSSecurityhubCompliance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relatedRequirements" : @"RelatedRequirements",
             @"status" : @"Status",
             @"statusReasons" : @"StatusReasons",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSED"] == NSOrderedSame) {
            return @(AWSSecurityhubComplianceStatusPassed);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSSecurityhubComplianceStatusWarning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSecurityhubComplianceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"NOT_AVAILABLE"] == NSOrderedSame) {
            return @(AWSSecurityhubComplianceStatusNotAvailable);
        }
        return @(AWSSecurityhubComplianceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubComplianceStatusPassed:
                return @"PASSED";
            case AWSSecurityhubComplianceStatusWarning:
                return @"WARNING";
            case AWSSecurityhubComplianceStatusFailed:
                return @"FAILED";
            case AWSSecurityhubComplianceStatusNotAvailable:
                return @"NOT_AVAILABLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusReasonsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStatusReason class]];
}

@end

@implementation AWSSecurityhubContainerDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"ImageId",
             @"imageName" : @"ImageName",
             @"launchedAt" : @"LaunchedAt",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSecurityhubCreateActionTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSecurityhubCreateActionTargetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArn" : @"ActionTargetArn",
             };
}

@end

@implementation AWSSecurityhubCreateInsightRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"groupByAttribute" : @"GroupByAttribute",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsSecurityFindingFilters class]];
}

@end

@implementation AWSSecurityhubCreateInsightResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightArn" : @"InsightArn",
             };
}

@end

@implementation AWSSecurityhubCreateMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountDetails" : @"AccountDetails",
             };
}

+ (NSValueTransformer *)accountDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAccountDetails class]];
}

@end

@implementation AWSSecurityhubCreateMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubResult class]];
}

@end

@implementation AWSSecurityhubDateFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dateRange" : @"DateRange",
             @"end" : @"End",
             @"start" : @"Start",
             };
}

+ (NSValueTransformer *)dateRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubDateRange class]];
}

@end

@implementation AWSSecurityhubDateRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unit" : @"Unit",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAYS"] == NSOrderedSame) {
            return @(AWSSecurityhubDateRangeUnitDays);
        }
        return @(AWSSecurityhubDateRangeUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubDateRangeUnitDays:
                return @"DAYS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubDeclineInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSSecurityhubDeclineInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubResult class]];
}

@end

@implementation AWSSecurityhubDeleteActionTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArn" : @"ActionTargetArn",
             };
}

@end

@implementation AWSSecurityhubDeleteActionTargetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArn" : @"ActionTargetArn",
             };
}

@end

@implementation AWSSecurityhubDeleteInsightRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightArn" : @"InsightArn",
             };
}

@end

@implementation AWSSecurityhubDeleteInsightResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightArn" : @"InsightArn",
             };
}

@end

@implementation AWSSecurityhubDeleteInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSSecurityhubDeleteInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubResult class]];
}

@end

@implementation AWSSecurityhubDeleteMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSSecurityhubDeleteMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubResult class]];
}

@end

@implementation AWSSecurityhubDescribeActionTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArns" : @"ActionTargetArns",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSecurityhubDescribeActionTargetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargets" : @"ActionTargets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)actionTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubActionTarget class]];
}

@end

@implementation AWSSecurityhubDescribeHubRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hubArn" : @"HubArn",
             };
}

@end

@implementation AWSSecurityhubDescribeHubResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hubArn" : @"HubArn",
             @"subscribedAt" : @"SubscribedAt",
             };
}

@end

@implementation AWSSecurityhubDescribeProductsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSecurityhubDescribeProductsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"products" : @"Products",
             };
}

+ (NSValueTransformer *)productsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubProduct class]];
}

@end

@implementation AWSSecurityhubDescribeStandardsControlsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"standardsSubscriptionArn" : @"StandardsSubscriptionArn",
             };
}

@end

@implementation AWSSecurityhubDescribeStandardsControlsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"controls" : @"Controls",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)controlsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStandardsControl class]];
}

@end

@implementation AWSSecurityhubDescribeStandardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSecurityhubDescribeStandardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"standards" : @"Standards",
             };
}

+ (NSValueTransformer *)standardsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStandard class]];
}

@end

@implementation AWSSecurityhubDisableImportFindingsForProductRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productSubscriptionArn" : @"ProductSubscriptionArn",
             };
}

@end

@implementation AWSSecurityhubDisableImportFindingsForProductResponse

@end

@implementation AWSSecurityhubDisableSecurityHubRequest

@end

@implementation AWSSecurityhubDisableSecurityHubResponse

@end

@implementation AWSSecurityhubDisassociateFromMasterAccountRequest

@end

@implementation AWSSecurityhubDisassociateFromMasterAccountResponse

@end

@implementation AWSSecurityhubDisassociateMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSSecurityhubDisassociateMembersResponse

@end

@implementation AWSSecurityhubEnableImportFindingsForProductRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productArn" : @"ProductArn",
             };
}

@end

@implementation AWSSecurityhubEnableImportFindingsForProductResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productSubscriptionArn" : @"ProductSubscriptionArn",
             };
}

@end

@implementation AWSSecurityhubEnableSecurityHubRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableDefaultStandards" : @"EnableDefaultStandards",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSSecurityhubEnableSecurityHubResponse

@end

@implementation AWSSecurityhubGetEnabledStandardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"standardsSubscriptionArns" : @"StandardsSubscriptionArns",
             };
}

@end

@implementation AWSSecurityhubGetEnabledStandardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"standardsSubscriptions" : @"StandardsSubscriptions",
             };
}

+ (NSValueTransformer *)standardsSubscriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubStandardsSubscription class]];
}

@end

@implementation AWSSecurityhubGetFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsSecurityFindingFilters class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubSortCriterion class]];
}

@end

@implementation AWSSecurityhubGetFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findings" : @"Findings",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)findingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubAwsSecurityFinding class]];
}

@end

@implementation AWSSecurityhubGetInsightResultsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightArn" : @"InsightArn",
             };
}

@end

@implementation AWSSecurityhubGetInsightResultsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightResults" : @"InsightResults",
             };
}

+ (NSValueTransformer *)insightResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubInsightResults class]];
}

@end

@implementation AWSSecurityhubGetInsightsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightArns" : @"InsightArns",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSecurityhubGetInsightsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insights" : @"Insights",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)insightsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubInsight class]];
}

@end

@implementation AWSSecurityhubGetInvitationsCountRequest

@end

@implementation AWSSecurityhubGetInvitationsCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitationsCount" : @"InvitationsCount",
             };
}

@end

@implementation AWSSecurityhubGetMasterAccountRequest

@end

@implementation AWSSecurityhubGetMasterAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"master" : @"Master",
             };
}

+ (NSValueTransformer *)masterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubInvitation class]];
}

@end

@implementation AWSSecurityhubGetMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSSecurityhubGetMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"members" : @"Members",
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubMember class]];
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubResult class]];
}

@end

@implementation AWSSecurityhubImportFindingsError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSSecurityhubInsight

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"groupByAttribute" : @"GroupByAttribute",
             @"insightArn" : @"InsightArn",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsSecurityFindingFilters class]];
}

@end

@implementation AWSSecurityhubInsightResultValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"groupByAttributeValue" : @"GroupByAttributeValue",
             };
}

@end

@implementation AWSSecurityhubInsightResults

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupByAttribute" : @"GroupByAttribute",
             @"insightArn" : @"InsightArn",
             @"resultValues" : @"ResultValues",
             };
}

+ (NSValueTransformer *)resultValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubInsightResultValue class]];
}

@end

@implementation AWSSecurityhubInvitation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"invitationId" : @"InvitationId",
             @"invitedAt" : @"InvitedAt",
             @"memberStatus" : @"MemberStatus",
             };
}

+ (NSValueTransformer *)invitedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSecurityhubInviteMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSSecurityhubInviteMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubResult class]];
}

@end

@implementation AWSSecurityhubIpFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidr" : @"Cidr",
             };
}

@end

@implementation AWSSecurityhubKeywordFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"value" : @"Value",
             };
}

@end

@implementation AWSSecurityhubListEnabledProductsForImportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSecurityhubListEnabledProductsForImportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"productSubscriptions" : @"ProductSubscriptions",
             };
}

@end

@implementation AWSSecurityhubListInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSecurityhubListInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitations" : @"Invitations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)invitationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubInvitation class]];
}

@end

@implementation AWSSecurityhubListMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"onlyAssociated" : @"OnlyAssociated",
             };
}

@end

@implementation AWSSecurityhubListMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"members" : @"Members",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecurityhubMember class]];
}

@end

@implementation AWSSecurityhubListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSSecurityhubListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSSecurityhubLoadBalancerState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"reason" : @"Reason",
             };
}

@end

@implementation AWSSecurityhubMalware

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"path" : @"Path",
             @"state" : @"State",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OBSERVED"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareStateObserved);
        }
        if ([value caseInsensitiveCompare:@"REMOVAL_FAILED"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareStateRemovalFailed);
        }
        if ([value caseInsensitiveCompare:@"REMOVED"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareStateRemoved);
        }
        return @(AWSSecurityhubMalwareStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubMalwareStateObserved:
                return @"OBSERVED";
            case AWSSecurityhubMalwareStateRemovalFailed:
                return @"REMOVAL_FAILED";
            case AWSSecurityhubMalwareStateRemoved:
                return @"REMOVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADWARE"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeAdware);
        }
        if ([value caseInsensitiveCompare:@"BLENDED_THREAT"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeBlendedThreat);
        }
        if ([value caseInsensitiveCompare:@"BOTNET_AGENT"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeBotnetAgent);
        }
        if ([value caseInsensitiveCompare:@"COIN_MINER"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeCoinMiner);
        }
        if ([value caseInsensitiveCompare:@"EXPLOIT_KIT"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeExploitKit);
        }
        if ([value caseInsensitiveCompare:@"KEYLOGGER"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeKeylogger);
        }
        if ([value caseInsensitiveCompare:@"MACRO"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeMacro);
        }
        if ([value caseInsensitiveCompare:@"POTENTIALLY_UNWANTED"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypePotentiallyUnwanted);
        }
        if ([value caseInsensitiveCompare:@"SPYWARE"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeSpyware);
        }
        if ([value caseInsensitiveCompare:@"RANSOMWARE"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeRansomware);
        }
        if ([value caseInsensitiveCompare:@"REMOTE_ACCESS"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeRemoteAccess);
        }
        if ([value caseInsensitiveCompare:@"ROOTKIT"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeRootkit);
        }
        if ([value caseInsensitiveCompare:@"TROJAN"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeTrojan);
        }
        if ([value caseInsensitiveCompare:@"VIRUS"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeVirus);
        }
        if ([value caseInsensitiveCompare:@"WORM"] == NSOrderedSame) {
            return @(AWSSecurityhubMalwareTypeWorm);
        }
        return @(AWSSecurityhubMalwareTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubMalwareTypeAdware:
                return @"ADWARE";
            case AWSSecurityhubMalwareTypeBlendedThreat:
                return @"BLENDED_THREAT";
            case AWSSecurityhubMalwareTypeBotnetAgent:
                return @"BOTNET_AGENT";
            case AWSSecurityhubMalwareTypeCoinMiner:
                return @"COIN_MINER";
            case AWSSecurityhubMalwareTypeExploitKit:
                return @"EXPLOIT_KIT";
            case AWSSecurityhubMalwareTypeKeylogger:
                return @"KEYLOGGER";
            case AWSSecurityhubMalwareTypeMacro:
                return @"MACRO";
            case AWSSecurityhubMalwareTypePotentiallyUnwanted:
                return @"POTENTIALLY_UNWANTED";
            case AWSSecurityhubMalwareTypeSpyware:
                return @"SPYWARE";
            case AWSSecurityhubMalwareTypeRansomware:
                return @"RANSOMWARE";
            case AWSSecurityhubMalwareTypeRemoteAccess:
                return @"REMOTE_ACCESS";
            case AWSSecurityhubMalwareTypeRootkit:
                return @"ROOTKIT";
            case AWSSecurityhubMalwareTypeTrojan:
                return @"TROJAN";
            case AWSSecurityhubMalwareTypeVirus:
                return @"VIRUS";
            case AWSSecurityhubMalwareTypeWorm:
                return @"WORM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubMapFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparison" : @"Comparison",
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)comparisonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUALS"] == NSOrderedSame) {
            return @(AWSSecurityhubMapFilterComparisonEquals);
        }
        return @(AWSSecurityhubMapFilterComparisonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubMapFilterComparisonEquals:
                return @"EQUALS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"email" : @"Email",
             @"invitedAt" : @"InvitedAt",
             @"masterId" : @"MasterId",
             @"memberStatus" : @"MemberStatus",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)invitedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSecurityhubNetwork

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationDomain" : @"DestinationDomain",
             @"destinationIpV4" : @"DestinationIpV4",
             @"destinationIpV6" : @"DestinationIpV6",
             @"destinationPort" : @"DestinationPort",
             @"direction" : @"Direction",
             @"protocols" : @"Protocol",
             @"sourceDomain" : @"SourceDomain",
             @"sourceIpV4" : @"SourceIpV4",
             @"sourceIpV6" : @"SourceIpV6",
             @"sourceMac" : @"SourceMac",
             @"sourcePort" : @"SourcePort",
             };
}

+ (NSValueTransformer *)directionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSSecurityhubNetworkDirectionIN);
        }
        if ([value caseInsensitiveCompare:@"OUT"] == NSOrderedSame) {
            return @(AWSSecurityhubNetworkDirectionOut);
        }
        return @(AWSSecurityhubNetworkDirectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubNetworkDirectionIN:
                return @"IN";
            case AWSSecurityhubNetworkDirectionOut:
                return @"OUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubNote

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             @"updatedAt" : @"UpdatedAt",
             @"updatedBy" : @"UpdatedBy",
             };
}

@end

@implementation AWSSecurityhubNoteUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             @"updatedBy" : @"UpdatedBy",
             };
}

@end

@implementation AWSSecurityhubNumberFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eq" : @"Eq",
             @"gte" : @"Gte",
             @"lte" : @"Lte",
             };
}

@end

@implementation AWSSecurityhubProcessDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"launchedAt" : @"LaunchedAt",
             @"name" : @"Name",
             @"parentPid" : @"ParentPid",
             @"path" : @"Path",
             @"pid" : @"Pid",
             @"terminatedAt" : @"TerminatedAt",
             };
}

@end

@implementation AWSSecurityhubProduct

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationUrl" : @"ActivationUrl",
             @"categories" : @"Categories",
             @"companyName" : @"CompanyName",
             @"detail" : @"Description",
             @"integrationTypes" : @"IntegrationTypes",
             @"marketplaceUrl" : @"MarketplaceUrl",
             @"productArn" : @"ProductArn",
             @"productName" : @"ProductName",
             @"productSubscriptionResourcePolicy" : @"ProductSubscriptionResourcePolicy",
             };
}

@end

@implementation AWSSecurityhubRecommendation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             @"url" : @"Url",
             };
}

@end

@implementation AWSSecurityhubRelatedFinding

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"productArn" : @"ProductArn",
             };
}

@end

@implementation AWSSecurityhubRemediation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommendation" : @"Recommendation",
             };
}

+ (NSValueTransformer *)recommendationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubRecommendation class]];
}

@end

@implementation AWSSecurityhubResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"identifier" : @"Id",
             @"partition" : @"Partition",
             @"region" : @"Region",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubResourceDetails class]];
}

+ (NSValueTransformer *)partitionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"aws"] == NSOrderedSame) {
            return @(AWSSecurityhubPartitionAws);
        }
        if ([value caseInsensitiveCompare:@"aws-cn"] == NSOrderedSame) {
            return @(AWSSecurityhubPartitionAwsCn);
        }
        if ([value caseInsensitiveCompare:@"aws-us-gov"] == NSOrderedSame) {
            return @(AWSSecurityhubPartitionAwsUsGov);
        }
        return @(AWSSecurityhubPartitionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubPartitionAws:
                return @"aws";
            case AWSSecurityhubPartitionAwsCn:
                return @"aws-cn";
            case AWSSecurityhubPartitionAwsUsGov:
                return @"aws-us-gov";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubResourceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsCloudFrontDistribution" : @"AwsCloudFrontDistribution",
             @"awsCodeBuildProject" : @"AwsCodeBuildProject",
             @"awsEc2Instance" : @"AwsEc2Instance",
             @"awsEc2NetworkInterface" : @"AwsEc2NetworkInterface",
             @"awsEc2SecurityGroup" : @"AwsEc2SecurityGroup",
             @"awsElasticsearchDomain" : @"AwsElasticsearchDomain",
             @"awsElbv2LoadBalancer" : @"AwsElbv2LoadBalancer",
             @"awsIamAccessKey" : @"AwsIamAccessKey",
             @"awsIamRole" : @"AwsIamRole",
             @"awsKmsKey" : @"AwsKmsKey",
             @"awsLambdaFunction" : @"AwsLambdaFunction",
             @"awsLambdaLayerVersion" : @"AwsLambdaLayerVersion",
             @"awsRdsDbInstance" : @"AwsRdsDbInstance",
             @"awsS3Bucket" : @"AwsS3Bucket",
             @"awsS3Object" : @"AwsS3Object",
             @"awsSnsTopic" : @"AwsSnsTopic",
             @"awsSqsQueue" : @"AwsSqsQueue",
             @"awsWafWebAcl" : @"AwsWafWebAcl",
             @"container" : @"Container",
             @"other" : @"Other",
             };
}

+ (NSValueTransformer *)awsCloudFrontDistributionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsCloudFrontDistributionDetails class]];
}

+ (NSValueTransformer *)awsCodeBuildProjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsCodeBuildProjectDetails class]];
}

+ (NSValueTransformer *)awsEc2InstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsEc2InstanceDetails class]];
}

+ (NSValueTransformer *)awsEc2NetworkInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsEc2NetworkInterfaceDetails class]];
}

+ (NSValueTransformer *)awsEc2SecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsEc2SecurityGroupDetails class]];
}

+ (NSValueTransformer *)awsElasticsearchDomainJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsElasticsearchDomainDetails class]];
}

+ (NSValueTransformer *)awsElbv2LoadBalancerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsElbv2LoadBalancerDetails class]];
}

+ (NSValueTransformer *)awsIamAccessKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsIamAccessKeyDetails class]];
}

+ (NSValueTransformer *)awsIamRoleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsIamRoleDetails class]];
}

+ (NSValueTransformer *)awsKmsKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsKmsKeyDetails class]];
}

+ (NSValueTransformer *)awsLambdaFunctionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsLambdaFunctionDetails class]];
}

+ (NSValueTransformer *)awsLambdaLayerVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsLambdaLayerVersionDetails class]];
}

+ (NSValueTransformer *)awsRdsDbInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsRdsDbInstanceDetails class]];
}

+ (NSValueTransformer *)awsS3BucketJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsS3BucketDetails class]];
}

+ (NSValueTransformer *)awsS3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsS3ObjectDetails class]];
}

+ (NSValueTransformer *)awsSnsTopicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsSnsTopicDetails class]];
}

+ (NSValueTransformer *)awsSqsQueueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsSqsQueueDetails class]];
}

+ (NSValueTransformer *)awsWafWebAclJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsWafWebAclDetails class]];
}

+ (NSValueTransformer *)containerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubContainerDetails class]];
}

@end

@implementation AWSSecurityhubResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"processingResult" : @"ProcessingResult",
             };
}

@end

@implementation AWSSecurityhubSeverity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"label" : @"Label",
             @"normalized" : @"Normalized",
             @"original" : @"Original",
             @"product" : @"Product",
             };
}

+ (NSValueTransformer *)labelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityLabelInformational);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityLabelLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityLabelMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityLabelHigh);
        }
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityLabelCritical);
        }
        return @(AWSSecurityhubSeverityLabelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubSeverityLabelInformational:
                return @"INFORMATIONAL";
            case AWSSecurityhubSeverityLabelLow:
                return @"LOW";
            case AWSSecurityhubSeverityLabelMedium:
                return @"MEDIUM";
            case AWSSecurityhubSeverityLabelHigh:
                return @"HIGH";
            case AWSSecurityhubSeverityLabelCritical:
                return @"CRITICAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubSeverityUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"label" : @"Label",
             @"normalized" : @"Normalized",
             @"product" : @"Product",
             };
}

+ (NSValueTransformer *)labelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityLabelInformational);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityLabelLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityLabelMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityLabelHigh);
        }
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityLabelCritical);
        }
        return @(AWSSecurityhubSeverityLabelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubSeverityLabelInformational:
                return @"INFORMATIONAL";
            case AWSSecurityhubSeverityLabelLow:
                return @"LOW";
            case AWSSecurityhubSeverityLabelMedium:
                return @"MEDIUM";
            case AWSSecurityhubSeverityLabelHigh:
                return @"HIGH";
            case AWSSecurityhubSeverityLabelCritical:
                return @"CRITICAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubSortCriterion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"field" : @"Field",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"asc"] == NSOrderedSame) {
            return @(AWSSecurityhubSortOrderAsc);
        }
        if ([value caseInsensitiveCompare:@"desc"] == NSOrderedSame) {
            return @(AWSSecurityhubSortOrderDesc);
        }
        return @(AWSSecurityhubSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubSortOrderAsc:
                return @"asc";
            case AWSSecurityhubSortOrderDesc:
                return @"desc";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubStandard

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"enabledByDefault" : @"EnabledByDefault",
             @"name" : @"Name",
             @"standardsArn" : @"StandardsArn",
             };
}

@end

@implementation AWSSecurityhubStandardsControl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"controlId" : @"ControlId",
             @"controlStatus" : @"ControlStatus",
             @"controlStatusUpdatedAt" : @"ControlStatusUpdatedAt",
             @"detail" : @"Description",
             @"disabledReason" : @"DisabledReason",
             @"relatedRequirements" : @"RelatedRequirements",
             @"remediationUrl" : @"RemediationUrl",
             @"severityRating" : @"SeverityRating",
             @"standardsControlArn" : @"StandardsControlArn",
             @"title" : @"Title",
             };
}

+ (NSValueTransformer *)controlStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSSecurityhubControlStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSSecurityhubControlStatusDisabled);
        }
        return @(AWSSecurityhubControlStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubControlStatusEnabled:
                return @"ENABLED";
            case AWSSecurityhubControlStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)controlStatusUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)severityRatingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityRatingLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityRatingMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityRatingHigh);
        }
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSecurityhubSeverityRatingCritical);
        }
        return @(AWSSecurityhubSeverityRatingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubSeverityRatingLow:
                return @"LOW";
            case AWSSecurityhubSeverityRatingMedium:
                return @"MEDIUM";
            case AWSSecurityhubSeverityRatingHigh:
                return @"HIGH";
            case AWSSecurityhubSeverityRatingCritical:
                return @"CRITICAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubStandardsSubscription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"standardsArn" : @"StandardsArn",
             @"standardsInput" : @"StandardsInput",
             @"standardsStatus" : @"StandardsStatus",
             @"standardsSubscriptionArn" : @"StandardsSubscriptionArn",
             };
}

+ (NSValueTransformer *)standardsStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSSecurityhubStandardsStatusPending);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSSecurityhubStandardsStatusReady);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSecurityhubStandardsStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSSecurityhubStandardsStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"INCOMPLETE"] == NSOrderedSame) {
            return @(AWSSecurityhubStandardsStatusIncomplete);
        }
        return @(AWSSecurityhubStandardsStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubStandardsStatusPending:
                return @"PENDING";
            case AWSSecurityhubStandardsStatusReady:
                return @"READY";
            case AWSSecurityhubStandardsStatusFailed:
                return @"FAILED";
            case AWSSecurityhubStandardsStatusDeleting:
                return @"DELETING";
            case AWSSecurityhubStandardsStatusIncomplete:
                return @"INCOMPLETE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubStandardsSubscriptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"standardsArn" : @"StandardsArn",
             @"standardsInput" : @"StandardsInput",
             };
}

@end

@implementation AWSSecurityhubStatusReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"reasonCode" : @"ReasonCode",
             };
}

@end

@implementation AWSSecurityhubStringFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparison" : @"Comparison",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)comparisonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUALS"] == NSOrderedSame) {
            return @(AWSSecurityhubStringFilterComparisonEquals);
        }
        if ([value caseInsensitiveCompare:@"PREFIX"] == NSOrderedSame) {
            return @(AWSSecurityhubStringFilterComparisonPrefix);
        }
        return @(AWSSecurityhubStringFilterComparisonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubStringFilterComparisonEquals:
                return @"EQUALS";
            case AWSSecurityhubStringFilterComparisonPrefix:
                return @"PREFIX";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSSecurityhubTagResourceResponse

@end

@implementation AWSSecurityhubThreatIntelIndicator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"Category",
             @"lastObservedAt" : @"LastObservedAt",
             @"source" : @"Source",
             @"sourceUrl" : @"SourceUrl",
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)categoryJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BACKDOOR"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorCategoryBackdoor);
        }
        if ([value caseInsensitiveCompare:@"CARD_STEALER"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorCategoryCardStealer);
        }
        if ([value caseInsensitiveCompare:@"COMMAND_AND_CONTROL"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorCategoryCommandAndControl);
        }
        if ([value caseInsensitiveCompare:@"DROP_SITE"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorCategoryDropSite);
        }
        if ([value caseInsensitiveCompare:@"EXPLOIT_SITE"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorCategoryExploitSite);
        }
        if ([value caseInsensitiveCompare:@"KEYLOGGER"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorCategoryKeylogger);
        }
        return @(AWSSecurityhubThreatIntelIndicatorCategoryUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubThreatIntelIndicatorCategoryBackdoor:
                return @"BACKDOOR";
            case AWSSecurityhubThreatIntelIndicatorCategoryCardStealer:
                return @"CARD_STEALER";
            case AWSSecurityhubThreatIntelIndicatorCategoryCommandAndControl:
                return @"COMMAND_AND_CONTROL";
            case AWSSecurityhubThreatIntelIndicatorCategoryDropSite:
                return @"DROP_SITE";
            case AWSSecurityhubThreatIntelIndicatorCategoryExploitSite:
                return @"EXPLOIT_SITE";
            case AWSSecurityhubThreatIntelIndicatorCategoryKeylogger:
                return @"KEYLOGGER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DOMAIN"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"EMAIL_ADDRESS"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorTypeEmailAddress);
        }
        if ([value caseInsensitiveCompare:@"HASH_MD5"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorTypeHashMd5);
        }
        if ([value caseInsensitiveCompare:@"HASH_SHA1"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorTypeHashSha1);
        }
        if ([value caseInsensitiveCompare:@"HASH_SHA256"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorTypeHashSha256);
        }
        if ([value caseInsensitiveCompare:@"HASH_SHA512"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorTypeHashSha512);
        }
        if ([value caseInsensitiveCompare:@"IPV4_ADDRESS"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorTypeIpv4Address);
        }
        if ([value caseInsensitiveCompare:@"IPV6_ADDRESS"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorTypeIpv6Address);
        }
        if ([value caseInsensitiveCompare:@"MUTEX"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorTypeMutex);
        }
        if ([value caseInsensitiveCompare:@"PROCESS"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorTypeProcess);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSSecurityhubThreatIntelIndicatorTypeUrl);
        }
        return @(AWSSecurityhubThreatIntelIndicatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubThreatIntelIndicatorTypeDomain:
                return @"DOMAIN";
            case AWSSecurityhubThreatIntelIndicatorTypeEmailAddress:
                return @"EMAIL_ADDRESS";
            case AWSSecurityhubThreatIntelIndicatorTypeHashMd5:
                return @"HASH_MD5";
            case AWSSecurityhubThreatIntelIndicatorTypeHashSha1:
                return @"HASH_SHA1";
            case AWSSecurityhubThreatIntelIndicatorTypeHashSha256:
                return @"HASH_SHA256";
            case AWSSecurityhubThreatIntelIndicatorTypeHashSha512:
                return @"HASH_SHA512";
            case AWSSecurityhubThreatIntelIndicatorTypeIpv4Address:
                return @"IPV4_ADDRESS";
            case AWSSecurityhubThreatIntelIndicatorTypeIpv6Address:
                return @"IPV6_ADDRESS";
            case AWSSecurityhubThreatIntelIndicatorTypeMutex:
                return @"MUTEX";
            case AWSSecurityhubThreatIntelIndicatorTypeProcess:
                return @"PROCESS";
            case AWSSecurityhubThreatIntelIndicatorTypeUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSSecurityhubUntagResourceResponse

@end

@implementation AWSSecurityhubUpdateActionTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArn" : @"ActionTargetArn",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSecurityhubUpdateActionTargetResponse

@end

@implementation AWSSecurityhubUpdateFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"note" : @"Note",
             @"recordState" : @"RecordState",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsSecurityFindingFilters class]];
}

+ (NSValueTransformer *)noteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubNoteUpdate class]];
}

+ (NSValueTransformer *)recordStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSSecurityhubRecordStateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSSecurityhubRecordStateArchived);
        }
        return @(AWSSecurityhubRecordStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubRecordStateActive:
                return @"ACTIVE";
            case AWSSecurityhubRecordStateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubUpdateFindingsResponse

@end

@implementation AWSSecurityhubUpdateInsightRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"groupByAttribute" : @"GroupByAttribute",
             @"insightArn" : @"InsightArn",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecurityhubAwsSecurityFindingFilters class]];
}

@end

@implementation AWSSecurityhubUpdateInsightResponse

@end

@implementation AWSSecurityhubUpdateStandardsControlRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"controlStatus" : @"ControlStatus",
             @"disabledReason" : @"DisabledReason",
             @"standardsControlArn" : @"StandardsControlArn",
             };
}

+ (NSValueTransformer *)controlStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSSecurityhubControlStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSSecurityhubControlStatusDisabled);
        }
        return @(AWSSecurityhubControlStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubControlStatusEnabled:
                return @"ENABLED";
            case AWSSecurityhubControlStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubUpdateStandardsControlResponse

@end

@implementation AWSSecurityhubWafAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

@end

@implementation AWSSecurityhubWafExcludedRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSSecurityhubWafOverrideAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

@end

@implementation AWSSecurityhubWorkflow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEW"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStatusNew);
        }
        if ([value caseInsensitiveCompare:@"NOTIFIED"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStatusNotified);
        }
        if ([value caseInsensitiveCompare:@"RESOLVED"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStatusResolved);
        }
        if ([value caseInsensitiveCompare:@"SUPPRESSED"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStatusSuppressed);
        }
        return @(AWSSecurityhubWorkflowStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubWorkflowStatusNew:
                return @"NEW";
            case AWSSecurityhubWorkflowStatusNotified:
                return @"NOTIFIED";
            case AWSSecurityhubWorkflowStatusResolved:
                return @"RESOLVED";
            case AWSSecurityhubWorkflowStatusSuppressed:
                return @"SUPPRESSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecurityhubWorkflowUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEW"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStatusNew);
        }
        if ([value caseInsensitiveCompare:@"NOTIFIED"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStatusNotified);
        }
        if ([value caseInsensitiveCompare:@"RESOLVED"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStatusResolved);
        }
        if ([value caseInsensitiveCompare:@"SUPPRESSED"] == NSOrderedSame) {
            return @(AWSSecurityhubWorkflowStatusSuppressed);
        }
        return @(AWSSecurityhubWorkflowStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecurityhubWorkflowStatusNew:
                return @"NEW";
            case AWSSecurityhubWorkflowStatusNotified:
                return @"NOTIFIED";
            case AWSSecurityhubWorkflowStatusResolved:
                return @"RESOLVED";
            case AWSSecurityhubWorkflowStatusSuppressed:
                return @"SUPPRESSED";
            default:
                return nil;
        }
    }];
}

@end
