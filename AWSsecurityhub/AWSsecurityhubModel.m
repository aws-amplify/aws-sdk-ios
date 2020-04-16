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

#import "AWSsecurityhubModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSsecurityhubErrorDomain = @"com.amazonaws.AWSsecurityhubErrorDomain";

@implementation AWSsecurityhubAcceptInvitationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitationId" : @"InvitationId",
             @"masterId" : @"MasterId",
             };
}

@end

@implementation AWSsecurityhubAcceptInvitationResponse

@end

@implementation AWSsecurityhubAccountDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"email" : @"Email",
             };
}

@end

@implementation AWSsecurityhubActionTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArn" : @"ActionTargetArn",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSsecurityhubAvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnetId" : @"SubnetId",
             @"zoneName" : @"ZoneName",
             };
}

@end

@implementation AWSsecurityhubAwsCloudFrontDistributionDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsCloudFrontDistributionLogging class]];
}

+ (NSValueTransformer *)originsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsCloudFrontDistributionOrigins class]];
}

@end

@implementation AWSsecurityhubAwsCloudFrontDistributionLogging

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"enabled" : @"Enabled",
             @"includeCookies" : @"IncludeCookies",
             @"prefix" : @"Prefix",
             };
}

@end

@implementation AWSsecurityhubAwsCloudFrontDistributionOriginItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"originPath" : @"OriginPath",
             };
}

@end

@implementation AWSsecurityhubAwsCloudFrontDistributionOrigins

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsCloudFrontDistributionOriginItem class]];
}

@end

@implementation AWSsecurityhubAwsCodeBuildProjectDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsCodeBuildProjectEnvironment class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsCodeBuildProjectSource class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsCodeBuildProjectVpcConfig class]];
}

@end

@implementation AWSsecurityhubAwsCodeBuildProjectEnvironment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             @"imagePullCredentialsType" : @"ImagePullCredentialsType",
             @"registryCredential" : @"RegistryCredential",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)registryCredentialJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsCodeBuildProjectEnvironmentRegistryCredential class]];
}

@end

@implementation AWSsecurityhubAwsCodeBuildProjectEnvironmentRegistryCredential

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credential" : @"Credential",
             @"credentialProvider" : @"CredentialProvider",
             };
}

@end

@implementation AWSsecurityhubAwsCodeBuildProjectSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gitCloneDepth" : @"GitCloneDepth",
             @"insecureSsl" : @"InsecureSsl",
             @"location" : @"Location",
             @"types" : @"Type",
             };
}

@end

@implementation AWSsecurityhubAwsCodeBuildProjectVpcConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnets" : @"Subnets",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSsecurityhubAwsEc2InstanceDetails

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

@implementation AWSsecurityhubAwsEc2NetworkInterfaceAttachment

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

@implementation AWSsecurityhubAwsEc2NetworkInterfaceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachment" : @"Attachment",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"securityGroups" : @"SecurityGroups",
             @"sourceDestCheck" : @"SourceDestCheck",
             };
}

+ (NSValueTransformer *)attachmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsEc2NetworkInterfaceAttachment class]];
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsEc2NetworkInterfaceSecurityGroup class]];
}

@end

@implementation AWSsecurityhubAwsEc2NetworkInterfaceSecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSsecurityhubAwsEc2SecurityGroupDetails

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsEc2SecurityGroupIpPermission class]];
}

+ (NSValueTransformer *)ipPermissionsEgressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsEc2SecurityGroupIpPermission class]];
}

@end

@implementation AWSsecurityhubAwsEc2SecurityGroupIpPermission

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsEc2SecurityGroupIpRange class]];
}

+ (NSValueTransformer *)ipv6RangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsEc2SecurityGroupIpv6Range class]];
}

+ (NSValueTransformer *)prefixListIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsEc2SecurityGroupPrefixListId class]];
}

+ (NSValueTransformer *)userIdGroupPairsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsEc2SecurityGroupUserIdGroupPair class]];
}

@end

@implementation AWSsecurityhubAwsEc2SecurityGroupIpRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrIp" : @"CidrIp",
             };
}

@end

@implementation AWSsecurityhubAwsEc2SecurityGroupIpv6Range

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrIpv6" : @"CidrIpv6",
             };
}

@end

@implementation AWSsecurityhubAwsEc2SecurityGroupPrefixListId

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prefixListId" : @"PrefixListId",
             };
}

@end

@implementation AWSsecurityhubAwsEc2SecurityGroupUserIdGroupPair

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

@implementation AWSsecurityhubAwsElasticsearchDomainDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsElasticsearchDomainDomainEndpointOptions class]];
}

+ (NSValueTransformer *)encryptionAtRestOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsElasticsearchDomainEncryptionAtRestOptions class]];
}

+ (NSValueTransformer *)nodeToNodeEncryptionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsElasticsearchDomainNodeToNodeEncryptionOptions class]];
}

+ (NSValueTransformer *)VPCOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsElasticsearchDomainVPCOptions class]];
}

@end

@implementation AWSsecurityhubAwsElasticsearchDomainDomainEndpointOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enforceHTTPS" : @"EnforceHTTPS",
             @"TLSSecurityPolicy" : @"TLSSecurityPolicy",
             };
}

@end

@implementation AWSsecurityhubAwsElasticsearchDomainEncryptionAtRestOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"kmsKeyId" : @"KmsKeyId",
             };
}

@end

@implementation AWSsecurityhubAwsElasticsearchDomainNodeToNodeEncryptionOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSsecurityhubAwsElasticsearchDomainVPCOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"VPCId" : @"VPCId",
             };
}

@end

@implementation AWSsecurityhubAwsElbv2LoadBalancerDetails

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAvailabilityZone class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubLoadBalancerState class]];
}

@end

@implementation AWSsecurityhubAwsIamAccessKeyDetails

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
            return @(AWSsecurityhubAwsIamAccessKeyStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSsecurityhubAwsIamAccessKeyStatusInactive);
        }
        return @(AWSsecurityhubAwsIamAccessKeyStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubAwsIamAccessKeyStatusActive:
                return @"Active";
            case AWSsecurityhubAwsIamAccessKeyStatusInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubAwsIamRoleDetails

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

@implementation AWSsecurityhubAwsKmsKeyDetails

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

@implementation AWSsecurityhubAwsLambdaFunctionCode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             @"s3ObjectVersion" : @"S3ObjectVersion",
             @"zipFile" : @"ZipFile",
             };
}

@end

@implementation AWSsecurityhubAwsLambdaFunctionDeadLetterConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetArn" : @"TargetArn",
             };
}

@end

@implementation AWSsecurityhubAwsLambdaFunctionDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsLambdaFunctionCode class]];
}

+ (NSValueTransformer *)deadLetterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsLambdaFunctionDeadLetterConfig class]];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsLambdaFunctionEnvironment class]];
}

+ (NSValueTransformer *)layersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsLambdaFunctionLayer class]];
}

+ (NSValueTransformer *)tracingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsLambdaFunctionTracingConfig class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsLambdaFunctionVpcConfig class]];
}

@end

@implementation AWSsecurityhubAwsLambdaFunctionEnvironment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"variables" : @"Variables",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsLambdaFunctionEnvironmentError class]];
}

@end

@implementation AWSsecurityhubAwsLambdaFunctionEnvironmentError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"message" : @"Message",
             };
}

@end

@implementation AWSsecurityhubAwsLambdaFunctionLayer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"codeSize" : @"CodeSize",
             };
}

@end

@implementation AWSsecurityhubAwsLambdaFunctionTracingConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mode" : @"Mode",
             };
}

@end

@implementation AWSsecurityhubAwsLambdaFunctionVpcConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSsecurityhubAwsLambdaLayerVersionDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleRuntimes" : @"CompatibleRuntimes",
             @"createdDate" : @"CreatedDate",
             @"version" : @"Version",
             };
}

@end

@implementation AWSsecurityhubAwsRdsDbInstanceAssociatedRole

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             @"status" : @"Status",
             };
}

@end

@implementation AWSsecurityhubAwsRdsDbInstanceDetails

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsRdsDbInstanceAssociatedRole class]];
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsRdsDbInstanceEndpoint class]];
}

+ (NSValueTransformer *)vpcSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsRdsDbInstanceVpcSecurityGroup class]];
}

@end

@implementation AWSsecurityhubAwsRdsDbInstanceEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"hostedZoneId" : @"HostedZoneId",
             @"port" : @"Port",
             };
}

@end

@implementation AWSsecurityhubAwsRdsDbInstanceVpcSecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"vpcSecurityGroupId" : @"VpcSecurityGroupId",
             };
}

@end

@implementation AWSsecurityhubAwsS3BucketDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"ownerId" : @"OwnerId",
             @"ownerName" : @"OwnerName",
             @"serverSideEncryptionConfiguration" : @"ServerSideEncryptionConfiguration",
             };
}

+ (NSValueTransformer *)serverSideEncryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsS3BucketServerSideEncryptionConfiguration class]];
}

@end

@implementation AWSsecurityhubAwsS3BucketServerSideEncryptionByDefault

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"KMSMasterKeyID" : @"KMSMasterKeyID",
             @"SSEAlgorithm" : @"SSEAlgorithm",
             };
}

@end

@implementation AWSsecurityhubAwsS3BucketServerSideEncryptionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsS3BucketServerSideEncryptionRule class]];
}

@end

@implementation AWSsecurityhubAwsS3BucketServerSideEncryptionRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyServerSideEncryptionByDefault" : @"ApplyServerSideEncryptionByDefault",
             };
}

+ (NSValueTransformer *)applyServerSideEncryptionByDefaultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsS3BucketServerSideEncryptionByDefault class]];
}

@end

@implementation AWSsecurityhubAwsS3ObjectDetails

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

@implementation AWSsecurityhubAwsSecurityFinding

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubCompliance class]];
}

+ (NSValueTransformer *)malwareJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubMalware class]];
}

+ (NSValueTransformer *)networkJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubNetwork class]];
}

+ (NSValueTransformer *)noteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubNote class]];
}

+ (NSValueTransformer *)processJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubProcessDetails class]];
}

+ (NSValueTransformer *)recordStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSsecurityhubRecordStateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSsecurityhubRecordStateArchived);
        }
        return @(AWSsecurityhubRecordStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubRecordStateActive:
                return @"ACTIVE";
            case AWSsecurityhubRecordStateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)relatedFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubRelatedFinding class]];
}

+ (NSValueTransformer *)remediationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubRemediation class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubResource class]];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubSeverity class]];
}

+ (NSValueTransformer *)threatIntelIndicatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubThreatIntelIndicator class]];
}

+ (NSValueTransformer *)verificationStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSsecurityhubVerificationStateUnknown);
        }
        if ([value caseInsensitiveCompare:@"TRUE_POSITIVE"] == NSOrderedSame) {
            return @(AWSsecurityhubVerificationStateTruePositive);
        }
        if ([value caseInsensitiveCompare:@"FALSE_POSITIVE"] == NSOrderedSame) {
            return @(AWSsecurityhubVerificationStateFalsePositive);
        }
        if ([value caseInsensitiveCompare:@"BENIGN_POSITIVE"] == NSOrderedSame) {
            return @(AWSsecurityhubVerificationStateBenignPositive);
        }
        return @(AWSsecurityhubVerificationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubVerificationStateUnknown:
                return @"UNKNOWN";
            case AWSsecurityhubVerificationStateTruePositive:
                return @"TRUE_POSITIVE";
            case AWSsecurityhubVerificationStateFalsePositive:
                return @"FALSE_POSITIVE";
            case AWSsecurityhubVerificationStateBenignPositive:
                return @"BENIGN_POSITIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)workflowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubWorkflow class]];
}

+ (NSValueTransformer *)workflowStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEW"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStateNew);
        }
        if ([value caseInsensitiveCompare:@"ASSIGNED"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStateAssigned);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"DEFERRED"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStateDeferred);
        }
        if ([value caseInsensitiveCompare:@"RESOLVED"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStateResolved);
        }
        return @(AWSsecurityhubWorkflowStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubWorkflowStateNew:
                return @"NEW";
            case AWSsecurityhubWorkflowStateAssigned:
                return @"ASSIGNED";
            case AWSsecurityhubWorkflowStateInProgress:
                return @"IN_PROGRESS";
            case AWSsecurityhubWorkflowStateDeferred:
                return @"DEFERRED";
            case AWSsecurityhubWorkflowStateResolved:
                return @"RESOLVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubAwsSecurityFindingFilters

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)companyNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)complianceStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)confidenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubDateFilter class]];
}

+ (NSValueTransformer *)criticalityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)detailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)firstObservedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubDateFilter class]];
}

+ (NSValueTransformer *)generatorIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)identifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)keywordJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubKeywordFilter class]];
}

+ (NSValueTransformer *)lastObservedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubDateFilter class]];
}

+ (NSValueTransformer *)malwareNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)malwarePathJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)malwareStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)malwareTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkDestinationDomainJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkDestinationIpV4JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubIpFilter class]];
}

+ (NSValueTransformer *)networkDestinationIpV6JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubIpFilter class]];
}

+ (NSValueTransformer *)networkDestinationPortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)networkDirectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkProtocolJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkSourceDomainJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkSourceIpV4JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubIpFilter class]];
}

+ (NSValueTransformer *)networkSourceIpV6JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubIpFilter class]];
}

+ (NSValueTransformer *)networkSourceMacJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)networkSourcePortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)noteTextJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)noteUpdatedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubDateFilter class]];
}

+ (NSValueTransformer *)noteUpdatedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)processLaunchedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubDateFilter class]];
}

+ (NSValueTransformer *)processNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)processParentPidJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)processPathJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)processPidJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)processTerminatedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubDateFilter class]];
}

+ (NSValueTransformer *)productArnJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)productFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubMapFilter class]];
}

+ (NSValueTransformer *)productNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)recommendationTextJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)recordStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)relatedFindingsIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)relatedFindingsProductArnJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceIamInstanceProfileArnJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceImageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceIpV4AddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubIpFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceIpV6AddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubIpFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceKeyNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceLaunchedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubDateFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceSubnetIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsEc2InstanceVpcIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsIamAccessKeyCreatedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubDateFilter class]];
}

+ (NSValueTransformer *)resourceAwsIamAccessKeyStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsIamAccessKeyUserNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsS3BucketOwnerIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceAwsS3BucketOwnerNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceContainerImageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceContainerImageNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceContainerLaunchedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubDateFilter class]];
}

+ (NSValueTransformer *)resourceContainerNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceDetailsOtherJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubMapFilter class]];
}

+ (NSValueTransformer *)resourceIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourcePartitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceRegionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)resourceTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubMapFilter class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)severityLabelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)severityNormalizedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)severityProductJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubNumberFilter class]];
}

+ (NSValueTransformer *)sourceUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorCategoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorLastObservedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubDateFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorSourceUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)threatIntelIndicatorValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)titleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubDateFilter class]];
}

+ (NSValueTransformer *)userDefinedFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubMapFilter class]];
}

+ (NSValueTransformer *)verificationStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)workflowStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

+ (NSValueTransformer *)workflowStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStringFilter class]];
}

@end

@implementation AWSsecurityhubAwsSecurityFindingIdentifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"productArn" : @"ProductArn",
             };
}

@end

@implementation AWSsecurityhubAwsSnsTopicDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsMasterKeyId" : @"KmsMasterKeyId",
             @"owner" : @"Owner",
             @"subscription" : @"Subscription",
             @"topicName" : @"TopicName",
             };
}

+ (NSValueTransformer *)subscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsSnsTopicSubscription class]];
}

@end

@implementation AWSsecurityhubAwsSnsTopicSubscription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             @"protocols" : @"Protocol",
             };
}

@end

@implementation AWSsecurityhubAwsSqsQueueDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deadLetterTargetArn" : @"DeadLetterTargetArn",
             @"kmsDataKeyReusePeriodSeconds" : @"KmsDataKeyReusePeriodSeconds",
             @"kmsMasterKeyId" : @"KmsMasterKeyId",
             @"queueName" : @"QueueName",
             };
}

@end

@implementation AWSsecurityhubAwsWafWebAclDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultAction" : @"DefaultAction",
             @"name" : @"Name",
             @"rules" : @"Rules",
             @"webAclId" : @"WebAclId",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsWafWebAclRule class]];
}

@end

@implementation AWSsecurityhubAwsWafWebAclRule

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubWafAction class]];
}

+ (NSValueTransformer *)excludedRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubWafExcludedRule class]];
}

+ (NSValueTransformer *)overrideActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubWafOverrideAction class]];
}

@end

@implementation AWSsecurityhubBatchDisableStandardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"standardsSubscriptionArns" : @"StandardsSubscriptionArns",
             };
}

@end

@implementation AWSsecurityhubBatchDisableStandardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"standardsSubscriptions" : @"StandardsSubscriptions",
             };
}

+ (NSValueTransformer *)standardsSubscriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStandardsSubscription class]];
}

@end

@implementation AWSsecurityhubBatchEnableStandardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"standardsSubscriptionRequests" : @"StandardsSubscriptionRequests",
             };
}

+ (NSValueTransformer *)standardsSubscriptionRequestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStandardsSubscriptionRequest class]];
}

@end

@implementation AWSsecurityhubBatchEnableStandardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"standardsSubscriptions" : @"StandardsSubscriptions",
             };
}

+ (NSValueTransformer *)standardsSubscriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStandardsSubscription class]];
}

@end

@implementation AWSsecurityhubBatchImportFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findings" : @"Findings",
             };
}

+ (NSValueTransformer *)findingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsSecurityFinding class]];
}

@end

@implementation AWSsecurityhubBatchImportFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedCount" : @"FailedCount",
             @"failedFindings" : @"FailedFindings",
             @"successCount" : @"SuccessCount",
             };
}

+ (NSValueTransformer *)failedFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubImportFindingsError class]];
}

@end

@implementation AWSsecurityhubBatchUpdateFindingsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsSecurityFindingIdentifier class]];
}

+ (NSValueTransformer *)noteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubNoteUpdate class]];
}

+ (NSValueTransformer *)relatedFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubRelatedFinding class]];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubSeverityUpdate class]];
}

+ (NSValueTransformer *)verificationStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSsecurityhubVerificationStateUnknown);
        }
        if ([value caseInsensitiveCompare:@"TRUE_POSITIVE"] == NSOrderedSame) {
            return @(AWSsecurityhubVerificationStateTruePositive);
        }
        if ([value caseInsensitiveCompare:@"FALSE_POSITIVE"] == NSOrderedSame) {
            return @(AWSsecurityhubVerificationStateFalsePositive);
        }
        if ([value caseInsensitiveCompare:@"BENIGN_POSITIVE"] == NSOrderedSame) {
            return @(AWSsecurityhubVerificationStateBenignPositive);
        }
        return @(AWSsecurityhubVerificationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubVerificationStateUnknown:
                return @"UNKNOWN";
            case AWSsecurityhubVerificationStateTruePositive:
                return @"TRUE_POSITIVE";
            case AWSsecurityhubVerificationStateFalsePositive:
                return @"FALSE_POSITIVE";
            case AWSsecurityhubVerificationStateBenignPositive:
                return @"BENIGN_POSITIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)workflowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubWorkflowUpdate class]];
}

@end

@implementation AWSsecurityhubBatchUpdateFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processedFindings" : @"ProcessedFindings",
             @"unprocessedFindings" : @"UnprocessedFindings",
             };
}

+ (NSValueTransformer *)processedFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsSecurityFindingIdentifier class]];
}

+ (NSValueTransformer *)unprocessedFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubBatchUpdateFindingsUnprocessedFinding class]];
}

@end

@implementation AWSsecurityhubBatchUpdateFindingsUnprocessedFinding

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"findingIdentifier" : @"FindingIdentifier",
             };
}

+ (NSValueTransformer *)findingIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsSecurityFindingIdentifier class]];
}

@end

@implementation AWSsecurityhubCompliance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relatedRequirements" : @"RelatedRequirements",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSED"] == NSOrderedSame) {
            return @(AWSsecurityhubComplianceStatusPassed);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSsecurityhubComplianceStatusWarning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSsecurityhubComplianceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"NOT_AVAILABLE"] == NSOrderedSame) {
            return @(AWSsecurityhubComplianceStatusNotAvailable);
        }
        return @(AWSsecurityhubComplianceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubComplianceStatusPassed:
                return @"PASSED";
            case AWSsecurityhubComplianceStatusWarning:
                return @"WARNING";
            case AWSsecurityhubComplianceStatusFailed:
                return @"FAILED";
            case AWSsecurityhubComplianceStatusNotAvailable:
                return @"NOT_AVAILABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubContainerDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"ImageId",
             @"imageName" : @"ImageName",
             @"launchedAt" : @"LaunchedAt",
             @"name" : @"Name",
             };
}

@end

@implementation AWSsecurityhubCreateActionTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSsecurityhubCreateActionTargetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArn" : @"ActionTargetArn",
             };
}

@end

@implementation AWSsecurityhubCreateInsightRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"groupByAttribute" : @"GroupByAttribute",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsSecurityFindingFilters class]];
}

@end

@implementation AWSsecurityhubCreateInsightResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightArn" : @"InsightArn",
             };
}

@end

@implementation AWSsecurityhubCreateMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountDetails" : @"AccountDetails",
             };
}

+ (NSValueTransformer *)accountDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAccountDetails class]];
}

@end

@implementation AWSsecurityhubCreateMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubResult class]];
}

@end

@implementation AWSsecurityhubDateFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dateRange" : @"DateRange",
             @"end" : @"End",
             @"start" : @"Start",
             };
}

+ (NSValueTransformer *)dateRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubDateRange class]];
}

@end

@implementation AWSsecurityhubDateRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unit" : @"Unit",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAYS"] == NSOrderedSame) {
            return @(AWSsecurityhubDateRangeUnitDays);
        }
        return @(AWSsecurityhubDateRangeUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubDateRangeUnitDays:
                return @"DAYS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubDeclineInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSsecurityhubDeclineInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubResult class]];
}

@end

@implementation AWSsecurityhubDeleteActionTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArn" : @"ActionTargetArn",
             };
}

@end

@implementation AWSsecurityhubDeleteActionTargetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArn" : @"ActionTargetArn",
             };
}

@end

@implementation AWSsecurityhubDeleteInsightRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightArn" : @"InsightArn",
             };
}

@end

@implementation AWSsecurityhubDeleteInsightResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightArn" : @"InsightArn",
             };
}

@end

@implementation AWSsecurityhubDeleteInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSsecurityhubDeleteInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubResult class]];
}

@end

@implementation AWSsecurityhubDeleteMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSsecurityhubDeleteMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubResult class]];
}

@end

@implementation AWSsecurityhubDescribeActionTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArns" : @"ActionTargetArns",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsecurityhubDescribeActionTargetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargets" : @"ActionTargets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)actionTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubActionTarget class]];
}

@end

@implementation AWSsecurityhubDescribeHubRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hubArn" : @"HubArn",
             };
}

@end

@implementation AWSsecurityhubDescribeHubResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hubArn" : @"HubArn",
             @"subscribedAt" : @"SubscribedAt",
             };
}

@end

@implementation AWSsecurityhubDescribeProductsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsecurityhubDescribeProductsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"products" : @"Products",
             };
}

+ (NSValueTransformer *)productsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubProduct class]];
}

@end

@implementation AWSsecurityhubDescribeStandardsControlsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"standardsSubscriptionArn" : @"StandardsSubscriptionArn",
             };
}

@end

@implementation AWSsecurityhubDescribeStandardsControlsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"controls" : @"Controls",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)controlsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStandardsControl class]];
}

@end

@implementation AWSsecurityhubDescribeStandardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsecurityhubDescribeStandardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"standards" : @"Standards",
             };
}

+ (NSValueTransformer *)standardsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStandard class]];
}

@end

@implementation AWSsecurityhubDisableImportFindingsForProductRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productSubscriptionArn" : @"ProductSubscriptionArn",
             };
}

@end

@implementation AWSsecurityhubDisableImportFindingsForProductResponse

@end

@implementation AWSsecurityhubDisableSecurityHubRequest

@end

@implementation AWSsecurityhubDisableSecurityHubResponse

@end

@implementation AWSsecurityhubDisassociateFromMasterAccountRequest

@end

@implementation AWSsecurityhubDisassociateFromMasterAccountResponse

@end

@implementation AWSsecurityhubDisassociateMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSsecurityhubDisassociateMembersResponse

@end

@implementation AWSsecurityhubEnableImportFindingsForProductRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productArn" : @"ProductArn",
             };
}

@end

@implementation AWSsecurityhubEnableImportFindingsForProductResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productSubscriptionArn" : @"ProductSubscriptionArn",
             };
}

@end

@implementation AWSsecurityhubEnableSecurityHubRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableDefaultStandards" : @"EnableDefaultStandards",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSsecurityhubEnableSecurityHubResponse

@end

@implementation AWSsecurityhubGetEnabledStandardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"standardsSubscriptionArns" : @"StandardsSubscriptionArns",
             };
}

@end

@implementation AWSsecurityhubGetEnabledStandardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"standardsSubscriptions" : @"StandardsSubscriptions",
             };
}

+ (NSValueTransformer *)standardsSubscriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubStandardsSubscription class]];
}

@end

@implementation AWSsecurityhubGetFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsSecurityFindingFilters class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubSortCriterion class]];
}

@end

@implementation AWSsecurityhubGetFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findings" : @"Findings",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)findingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubAwsSecurityFinding class]];
}

@end

@implementation AWSsecurityhubGetInsightResultsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightArn" : @"InsightArn",
             };
}

@end

@implementation AWSsecurityhubGetInsightResultsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightResults" : @"InsightResults",
             };
}

+ (NSValueTransformer *)insightResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubInsightResults class]];
}

@end

@implementation AWSsecurityhubGetInsightsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insightArns" : @"InsightArns",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsecurityhubGetInsightsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insights" : @"Insights",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)insightsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubInsight class]];
}

@end

@implementation AWSsecurityhubGetInvitationsCountRequest

@end

@implementation AWSsecurityhubGetInvitationsCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitationsCount" : @"InvitationsCount",
             };
}

@end

@implementation AWSsecurityhubGetMasterAccountRequest

@end

@implementation AWSsecurityhubGetMasterAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"master" : @"Master",
             };
}

+ (NSValueTransformer *)masterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubInvitation class]];
}

@end

@implementation AWSsecurityhubGetMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSsecurityhubGetMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"members" : @"Members",
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubMember class]];
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubResult class]];
}

@end

@implementation AWSsecurityhubImportFindingsError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSsecurityhubInsight

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"groupByAttribute" : @"GroupByAttribute",
             @"insightArn" : @"InsightArn",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsSecurityFindingFilters class]];
}

@end

@implementation AWSsecurityhubInsightResultValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"groupByAttributeValue" : @"GroupByAttributeValue",
             };
}

@end

@implementation AWSsecurityhubInsightResults

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupByAttribute" : @"GroupByAttribute",
             @"insightArn" : @"InsightArn",
             @"resultValues" : @"ResultValues",
             };
}

+ (NSValueTransformer *)resultValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubInsightResultValue class]];
}

@end

@implementation AWSsecurityhubInvitation

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

@implementation AWSsecurityhubInviteMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSsecurityhubInviteMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubResult class]];
}

@end

@implementation AWSsecurityhubIpFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidr" : @"Cidr",
             };
}

@end

@implementation AWSsecurityhubKeywordFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"value" : @"Value",
             };
}

@end

@implementation AWSsecurityhubListEnabledProductsForImportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsecurityhubListEnabledProductsForImportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"productSubscriptions" : @"ProductSubscriptions",
             };
}

@end

@implementation AWSsecurityhubListInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsecurityhubListInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitations" : @"Invitations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)invitationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubInvitation class]];
}

@end

@implementation AWSsecurityhubListMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"onlyAssociated" : @"OnlyAssociated",
             };
}

@end

@implementation AWSsecurityhubListMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"members" : @"Members",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsecurityhubMember class]];
}

@end

@implementation AWSsecurityhubListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSsecurityhubListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSsecurityhubLoadBalancerState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"reason" : @"Reason",
             };
}

@end

@implementation AWSsecurityhubMalware

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
            return @(AWSsecurityhubMalwareStateObserved);
        }
        if ([value caseInsensitiveCompare:@"REMOVAL_FAILED"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareStateRemovalFailed);
        }
        if ([value caseInsensitiveCompare:@"REMOVED"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareStateRemoved);
        }
        return @(AWSsecurityhubMalwareStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubMalwareStateObserved:
                return @"OBSERVED";
            case AWSsecurityhubMalwareStateRemovalFailed:
                return @"REMOVAL_FAILED";
            case AWSsecurityhubMalwareStateRemoved:
                return @"REMOVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADWARE"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeAdware);
        }
        if ([value caseInsensitiveCompare:@"BLENDED_THREAT"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeBlendedThreat);
        }
        if ([value caseInsensitiveCompare:@"BOTNET_AGENT"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeBotnetAgent);
        }
        if ([value caseInsensitiveCompare:@"COIN_MINER"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeCoinMiner);
        }
        if ([value caseInsensitiveCompare:@"EXPLOIT_KIT"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeExploitKit);
        }
        if ([value caseInsensitiveCompare:@"KEYLOGGER"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeKeylogger);
        }
        if ([value caseInsensitiveCompare:@"MACRO"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeMacro);
        }
        if ([value caseInsensitiveCompare:@"POTENTIALLY_UNWANTED"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypePotentiallyUnwanted);
        }
        if ([value caseInsensitiveCompare:@"SPYWARE"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeSpyware);
        }
        if ([value caseInsensitiveCompare:@"RANSOMWARE"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeRansomware);
        }
        if ([value caseInsensitiveCompare:@"REMOTE_ACCESS"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeRemoteAccess);
        }
        if ([value caseInsensitiveCompare:@"ROOTKIT"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeRootkit);
        }
        if ([value caseInsensitiveCompare:@"TROJAN"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeTrojan);
        }
        if ([value caseInsensitiveCompare:@"VIRUS"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeVirus);
        }
        if ([value caseInsensitiveCompare:@"WORM"] == NSOrderedSame) {
            return @(AWSsecurityhubMalwareTypeWorm);
        }
        return @(AWSsecurityhubMalwareTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubMalwareTypeAdware:
                return @"ADWARE";
            case AWSsecurityhubMalwareTypeBlendedThreat:
                return @"BLENDED_THREAT";
            case AWSsecurityhubMalwareTypeBotnetAgent:
                return @"BOTNET_AGENT";
            case AWSsecurityhubMalwareTypeCoinMiner:
                return @"COIN_MINER";
            case AWSsecurityhubMalwareTypeExploitKit:
                return @"EXPLOIT_KIT";
            case AWSsecurityhubMalwareTypeKeylogger:
                return @"KEYLOGGER";
            case AWSsecurityhubMalwareTypeMacro:
                return @"MACRO";
            case AWSsecurityhubMalwareTypePotentiallyUnwanted:
                return @"POTENTIALLY_UNWANTED";
            case AWSsecurityhubMalwareTypeSpyware:
                return @"SPYWARE";
            case AWSsecurityhubMalwareTypeRansomware:
                return @"RANSOMWARE";
            case AWSsecurityhubMalwareTypeRemoteAccess:
                return @"REMOTE_ACCESS";
            case AWSsecurityhubMalwareTypeRootkit:
                return @"ROOTKIT";
            case AWSsecurityhubMalwareTypeTrojan:
                return @"TROJAN";
            case AWSsecurityhubMalwareTypeVirus:
                return @"VIRUS";
            case AWSsecurityhubMalwareTypeWorm:
                return @"WORM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubMapFilter

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
            return @(AWSsecurityhubMapFilterComparisonEquals);
        }
        return @(AWSsecurityhubMapFilterComparisonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubMapFilterComparisonEquals:
                return @"EQUALS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubMember

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

@implementation AWSsecurityhubNetwork

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
            return @(AWSsecurityhubNetworkDirectionIN);
        }
        if ([value caseInsensitiveCompare:@"OUT"] == NSOrderedSame) {
            return @(AWSsecurityhubNetworkDirectionOut);
        }
        return @(AWSsecurityhubNetworkDirectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubNetworkDirectionIN:
                return @"IN";
            case AWSsecurityhubNetworkDirectionOut:
                return @"OUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubNote

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             @"updatedAt" : @"UpdatedAt",
             @"updatedBy" : @"UpdatedBy",
             };
}

@end

@implementation AWSsecurityhubNoteUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             @"updatedBy" : @"UpdatedBy",
             };
}

@end

@implementation AWSsecurityhubNumberFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eq" : @"Eq",
             @"gte" : @"Gte",
             @"lte" : @"Lte",
             };
}

@end

@implementation AWSsecurityhubProcessDetails

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

@implementation AWSsecurityhubProduct

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

@implementation AWSsecurityhubRecommendation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             @"url" : @"Url",
             };
}

@end

@implementation AWSsecurityhubRelatedFinding

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"productArn" : @"ProductArn",
             };
}

@end

@implementation AWSsecurityhubRemediation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommendation" : @"Recommendation",
             };
}

+ (NSValueTransformer *)recommendationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubRecommendation class]];
}

@end

@implementation AWSsecurityhubResource

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubResourceDetails class]];
}

+ (NSValueTransformer *)partitionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"aws"] == NSOrderedSame) {
            return @(AWSsecurityhubPartitionAws);
        }
        if ([value caseInsensitiveCompare:@"aws-cn"] == NSOrderedSame) {
            return @(AWSsecurityhubPartitionAwsCn);
        }
        if ([value caseInsensitiveCompare:@"aws-us-gov"] == NSOrderedSame) {
            return @(AWSsecurityhubPartitionAwsUsGov);
        }
        return @(AWSsecurityhubPartitionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubPartitionAws:
                return @"aws";
            case AWSsecurityhubPartitionAwsCn:
                return @"aws-cn";
            case AWSsecurityhubPartitionAwsUsGov:
                return @"aws-us-gov";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubResourceDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsCloudFrontDistributionDetails class]];
}

+ (NSValueTransformer *)awsCodeBuildProjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsCodeBuildProjectDetails class]];
}

+ (NSValueTransformer *)awsEc2InstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsEc2InstanceDetails class]];
}

+ (NSValueTransformer *)awsEc2NetworkInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsEc2NetworkInterfaceDetails class]];
}

+ (NSValueTransformer *)awsEc2SecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsEc2SecurityGroupDetails class]];
}

+ (NSValueTransformer *)awsElasticsearchDomainJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsElasticsearchDomainDetails class]];
}

+ (NSValueTransformer *)awsElbv2LoadBalancerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsElbv2LoadBalancerDetails class]];
}

+ (NSValueTransformer *)awsIamAccessKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsIamAccessKeyDetails class]];
}

+ (NSValueTransformer *)awsIamRoleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsIamRoleDetails class]];
}

+ (NSValueTransformer *)awsKmsKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsKmsKeyDetails class]];
}

+ (NSValueTransformer *)awsLambdaFunctionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsLambdaFunctionDetails class]];
}

+ (NSValueTransformer *)awsLambdaLayerVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsLambdaLayerVersionDetails class]];
}

+ (NSValueTransformer *)awsRdsDbInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsRdsDbInstanceDetails class]];
}

+ (NSValueTransformer *)awsS3BucketJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsS3BucketDetails class]];
}

+ (NSValueTransformer *)awsS3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsS3ObjectDetails class]];
}

+ (NSValueTransformer *)awsSnsTopicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsSnsTopicDetails class]];
}

+ (NSValueTransformer *)awsSqsQueueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsSqsQueueDetails class]];
}

+ (NSValueTransformer *)awsWafWebAclJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsWafWebAclDetails class]];
}

+ (NSValueTransformer *)containerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubContainerDetails class]];
}

@end

@implementation AWSsecurityhubResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"processingResult" : @"ProcessingResult",
             };
}

@end

@implementation AWSsecurityhubSeverity

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
            return @(AWSsecurityhubSeverityLabelInformational);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSsecurityhubSeverityLabelLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSsecurityhubSeverityLabelMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSsecurityhubSeverityLabelHigh);
        }
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSsecurityhubSeverityLabelCritical);
        }
        return @(AWSsecurityhubSeverityLabelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubSeverityLabelInformational:
                return @"INFORMATIONAL";
            case AWSsecurityhubSeverityLabelLow:
                return @"LOW";
            case AWSsecurityhubSeverityLabelMedium:
                return @"MEDIUM";
            case AWSsecurityhubSeverityLabelHigh:
                return @"HIGH";
            case AWSsecurityhubSeverityLabelCritical:
                return @"CRITICAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubSeverityUpdate

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
            return @(AWSsecurityhubSeverityLabelInformational);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSsecurityhubSeverityLabelLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSsecurityhubSeverityLabelMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSsecurityhubSeverityLabelHigh);
        }
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSsecurityhubSeverityLabelCritical);
        }
        return @(AWSsecurityhubSeverityLabelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubSeverityLabelInformational:
                return @"INFORMATIONAL";
            case AWSsecurityhubSeverityLabelLow:
                return @"LOW";
            case AWSsecurityhubSeverityLabelMedium:
                return @"MEDIUM";
            case AWSsecurityhubSeverityLabelHigh:
                return @"HIGH";
            case AWSsecurityhubSeverityLabelCritical:
                return @"CRITICAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubSortCriterion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"field" : @"Field",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"asc"] == NSOrderedSame) {
            return @(AWSsecurityhubSortOrderAsc);
        }
        if ([value caseInsensitiveCompare:@"desc"] == NSOrderedSame) {
            return @(AWSsecurityhubSortOrderDesc);
        }
        return @(AWSsecurityhubSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubSortOrderAsc:
                return @"asc";
            case AWSsecurityhubSortOrderDesc:
                return @"desc";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubStandard

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"enabledByDefault" : @"EnabledByDefault",
             @"name" : @"Name",
             @"standardsArn" : @"StandardsArn",
             };
}

@end

@implementation AWSsecurityhubStandardsControl

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
            return @(AWSsecurityhubControlStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSsecurityhubControlStatusDisabled);
        }
        return @(AWSsecurityhubControlStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubControlStatusEnabled:
                return @"ENABLED";
            case AWSsecurityhubControlStatusDisabled:
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
            return @(AWSsecurityhubSeverityRatingLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSsecurityhubSeverityRatingMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSsecurityhubSeverityRatingHigh);
        }
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSsecurityhubSeverityRatingCritical);
        }
        return @(AWSsecurityhubSeverityRatingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubSeverityRatingLow:
                return @"LOW";
            case AWSsecurityhubSeverityRatingMedium:
                return @"MEDIUM";
            case AWSsecurityhubSeverityRatingHigh:
                return @"HIGH";
            case AWSsecurityhubSeverityRatingCritical:
                return @"CRITICAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubStandardsSubscription

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
            return @(AWSsecurityhubStandardsStatusPending);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSsecurityhubStandardsStatusReady);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSsecurityhubStandardsStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSsecurityhubStandardsStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"INCOMPLETE"] == NSOrderedSame) {
            return @(AWSsecurityhubStandardsStatusIncomplete);
        }
        return @(AWSsecurityhubStandardsStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubStandardsStatusPending:
                return @"PENDING";
            case AWSsecurityhubStandardsStatusReady:
                return @"READY";
            case AWSsecurityhubStandardsStatusFailed:
                return @"FAILED";
            case AWSsecurityhubStandardsStatusDeleting:
                return @"DELETING";
            case AWSsecurityhubStandardsStatusIncomplete:
                return @"INCOMPLETE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubStandardsSubscriptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"standardsArn" : @"StandardsArn",
             @"standardsInput" : @"StandardsInput",
             };
}

@end

@implementation AWSsecurityhubStringFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparison" : @"Comparison",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)comparisonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUALS"] == NSOrderedSame) {
            return @(AWSsecurityhubStringFilterComparisonEquals);
        }
        if ([value caseInsensitiveCompare:@"PREFIX"] == NSOrderedSame) {
            return @(AWSsecurityhubStringFilterComparisonPrefix);
        }
        return @(AWSsecurityhubStringFilterComparisonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubStringFilterComparisonEquals:
                return @"EQUALS";
            case AWSsecurityhubStringFilterComparisonPrefix:
                return @"PREFIX";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSsecurityhubTagResourceResponse

@end

@implementation AWSsecurityhubThreatIntelIndicator

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
            return @(AWSsecurityhubThreatIntelIndicatorCategoryBackdoor);
        }
        if ([value caseInsensitiveCompare:@"CARD_STEALER"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorCategoryCardStealer);
        }
        if ([value caseInsensitiveCompare:@"COMMAND_AND_CONTROL"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorCategoryCommandAndControl);
        }
        if ([value caseInsensitiveCompare:@"DROP_SITE"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorCategoryDropSite);
        }
        if ([value caseInsensitiveCompare:@"EXPLOIT_SITE"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorCategoryExploitSite);
        }
        if ([value caseInsensitiveCompare:@"KEYLOGGER"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorCategoryKeylogger);
        }
        return @(AWSsecurityhubThreatIntelIndicatorCategoryUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubThreatIntelIndicatorCategoryBackdoor:
                return @"BACKDOOR";
            case AWSsecurityhubThreatIntelIndicatorCategoryCardStealer:
                return @"CARD_STEALER";
            case AWSsecurityhubThreatIntelIndicatorCategoryCommandAndControl:
                return @"COMMAND_AND_CONTROL";
            case AWSsecurityhubThreatIntelIndicatorCategoryDropSite:
                return @"DROP_SITE";
            case AWSsecurityhubThreatIntelIndicatorCategoryExploitSite:
                return @"EXPLOIT_SITE";
            case AWSsecurityhubThreatIntelIndicatorCategoryKeylogger:
                return @"KEYLOGGER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DOMAIN"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"EMAIL_ADDRESS"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorTypeEmailAddress);
        }
        if ([value caseInsensitiveCompare:@"HASH_MD5"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorTypeHashMd5);
        }
        if ([value caseInsensitiveCompare:@"HASH_SHA1"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorTypeHashSha1);
        }
        if ([value caseInsensitiveCompare:@"HASH_SHA256"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorTypeHashSha256);
        }
        if ([value caseInsensitiveCompare:@"HASH_SHA512"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorTypeHashSha512);
        }
        if ([value caseInsensitiveCompare:@"IPV4_ADDRESS"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorTypeIpv4Address);
        }
        if ([value caseInsensitiveCompare:@"IPV6_ADDRESS"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorTypeIpv6Address);
        }
        if ([value caseInsensitiveCompare:@"MUTEX"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorTypeMutex);
        }
        if ([value caseInsensitiveCompare:@"PROCESS"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorTypeProcess);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSsecurityhubThreatIntelIndicatorTypeUrl);
        }
        return @(AWSsecurityhubThreatIntelIndicatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubThreatIntelIndicatorTypeDomain:
                return @"DOMAIN";
            case AWSsecurityhubThreatIntelIndicatorTypeEmailAddress:
                return @"EMAIL_ADDRESS";
            case AWSsecurityhubThreatIntelIndicatorTypeHashMd5:
                return @"HASH_MD5";
            case AWSsecurityhubThreatIntelIndicatorTypeHashSha1:
                return @"HASH_SHA1";
            case AWSsecurityhubThreatIntelIndicatorTypeHashSha256:
                return @"HASH_SHA256";
            case AWSsecurityhubThreatIntelIndicatorTypeHashSha512:
                return @"HASH_SHA512";
            case AWSsecurityhubThreatIntelIndicatorTypeIpv4Address:
                return @"IPV4_ADDRESS";
            case AWSsecurityhubThreatIntelIndicatorTypeIpv6Address:
                return @"IPV6_ADDRESS";
            case AWSsecurityhubThreatIntelIndicatorTypeMutex:
                return @"MUTEX";
            case AWSsecurityhubThreatIntelIndicatorTypeProcess:
                return @"PROCESS";
            case AWSsecurityhubThreatIntelIndicatorTypeUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSsecurityhubUntagResourceResponse

@end

@implementation AWSsecurityhubUpdateActionTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionTargetArn" : @"ActionTargetArn",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSsecurityhubUpdateActionTargetResponse

@end

@implementation AWSsecurityhubUpdateFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"note" : @"Note",
             @"recordState" : @"RecordState",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsSecurityFindingFilters class]];
}

+ (NSValueTransformer *)noteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubNoteUpdate class]];
}

+ (NSValueTransformer *)recordStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSsecurityhubRecordStateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSsecurityhubRecordStateArchived);
        }
        return @(AWSsecurityhubRecordStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubRecordStateActive:
                return @"ACTIVE";
            case AWSsecurityhubRecordStateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubUpdateFindingsResponse

@end

@implementation AWSsecurityhubUpdateInsightRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"groupByAttribute" : @"GroupByAttribute",
             @"insightArn" : @"InsightArn",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsecurityhubAwsSecurityFindingFilters class]];
}

@end

@implementation AWSsecurityhubUpdateInsightResponse

@end

@implementation AWSsecurityhubUpdateStandardsControlRequest

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
            return @(AWSsecurityhubControlStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSsecurityhubControlStatusDisabled);
        }
        return @(AWSsecurityhubControlStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubControlStatusEnabled:
                return @"ENABLED";
            case AWSsecurityhubControlStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubUpdateStandardsControlResponse

@end

@implementation AWSsecurityhubWafAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

@end

@implementation AWSsecurityhubWafExcludedRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSsecurityhubWafOverrideAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

@end

@implementation AWSsecurityhubWorkflow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEW"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStatusNew);
        }
        if ([value caseInsensitiveCompare:@"NOTIFIED"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStatusNotified);
        }
        if ([value caseInsensitiveCompare:@"RESOLVED"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStatusResolved);
        }
        if ([value caseInsensitiveCompare:@"SUPPRESSED"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStatusSuppressed);
        }
        return @(AWSsecurityhubWorkflowStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubWorkflowStatusNew:
                return @"NEW";
            case AWSsecurityhubWorkflowStatusNotified:
                return @"NOTIFIED";
            case AWSsecurityhubWorkflowStatusResolved:
                return @"RESOLVED";
            case AWSsecurityhubWorkflowStatusSuppressed:
                return @"SUPPRESSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsecurityhubWorkflowUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEW"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStatusNew);
        }
        if ([value caseInsensitiveCompare:@"NOTIFIED"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStatusNotified);
        }
        if ([value caseInsensitiveCompare:@"RESOLVED"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStatusResolved);
        }
        if ([value caseInsensitiveCompare:@"SUPPRESSED"] == NSOrderedSame) {
            return @(AWSsecurityhubWorkflowStatusSuppressed);
        }
        return @(AWSsecurityhubWorkflowStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsecurityhubWorkflowStatusNew:
                return @"NEW";
            case AWSsecurityhubWorkflowStatusNotified:
                return @"NOTIFIED";
            case AWSsecurityhubWorkflowStatusResolved:
                return @"RESOLVED";
            case AWSsecurityhubWorkflowStatusSuppressed:
                return @"SUPPRESSED";
            default:
                return nil;
        }
    }];
}

@end
