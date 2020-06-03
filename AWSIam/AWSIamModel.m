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

#import "AWSIamModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSIamErrorDomain = @"com.amazonaws.AWSIamErrorDomain";

@implementation AWSIamAccessDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityPath" : @"EntityPath",
             @"lastAuthenticatedTime" : @"LastAuthenticatedTime",
             @"region" : @"Region",
             @"serviceName" : @"ServiceName",
             @"serviceNamespace" : @"ServiceNamespace",
             @"totalAuthenticatedEntities" : @"TotalAuthenticatedEntities",
             };
}

+ (NSValueTransformer *)lastAuthenticatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamAccessKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyId" : @"AccessKeyId",
             @"createDate" : @"CreateDate",
             @"secretAccessKey" : @"SecretAccessKey",
             @"status" : @"Status",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSIamstatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSIamstatusTypeInactive);
        }
        return @(AWSIamstatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamstatusTypeActive:
                return @"Active";
            case AWSIamstatusTypeInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamAccessKeyLastUsed

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastUsedDate" : @"LastUsedDate",
             @"region" : @"Region",
             @"serviceName" : @"ServiceName",
             };
}

+ (NSValueTransformer *)lastUsedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamAccessKeyMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyId" : @"AccessKeyId",
             @"createDate" : @"CreateDate",
             @"status" : @"Status",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSIamstatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSIamstatusTypeInactive);
        }
        return @(AWSIamstatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamstatusTypeActive:
                return @"Active";
            case AWSIamstatusTypeInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamAddClientIDToOpenIDConnectProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientID" : @"ClientID",
             @"openIDConnectProviderArn" : @"OpenIDConnectProviderArn",
             };
}

@end

@implementation AWSIamAddRoleToInstanceProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceProfileName" : @"InstanceProfileName",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamAddUserToGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamAttachGroupPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"policyArn" : @"PolicyArn",
             };
}

@end

@implementation AWSIamAttachRolePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamAttachUserPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamAttachedPermissionsBoundary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"permissionsBoundaryArn" : @"PermissionsBoundaryArn",
             @"permissionsBoundaryType" : @"PermissionsBoundaryType",
             };
}

+ (NSValueTransformer *)permissionsBoundaryTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PermissionsBoundaryPolicy"] == NSOrderedSame) {
            return @(AWSIamPermissionsBoundaryAttachmentTypePermissionsBoundaryPolicy);
        }
        return @(AWSIamPermissionsBoundaryAttachmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamPermissionsBoundaryAttachmentTypePermissionsBoundaryPolicy:
                return @"PermissionsBoundaryPolicy";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamAttachedPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSIamChangePasswordRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestPassword" : @"NewPassword",
             @"oldPassword" : @"OldPassword",
             };
}

@end

@implementation AWSIamContextEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contextKeyName" : @"ContextKeyName",
             @"contextKeyType" : @"ContextKeyType",
             @"contextKeyValues" : @"ContextKeyValues",
             };
}

+ (NSValueTransformer *)contextKeyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"string"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumString);
        }
        if ([value caseInsensitiveCompare:@"stringList"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumStringList);
        }
        if ([value caseInsensitiveCompare:@"numeric"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumNumeric);
        }
        if ([value caseInsensitiveCompare:@"numericList"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumNumericList);
        }
        if ([value caseInsensitiveCompare:@"boolean"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumBoolean);
        }
        if ([value caseInsensitiveCompare:@"booleanList"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumBooleanList);
        }
        if ([value caseInsensitiveCompare:@"ip"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumIp);
        }
        if ([value caseInsensitiveCompare:@"ipList"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumIpList);
        }
        if ([value caseInsensitiveCompare:@"binary"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumBinary);
        }
        if ([value caseInsensitiveCompare:@"binaryList"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumBinaryList);
        }
        if ([value caseInsensitiveCompare:@"date"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumDate);
        }
        if ([value caseInsensitiveCompare:@"dateList"] == NSOrderedSame) {
            return @(AWSIamContextKeyTypeEnumDateList);
        }
        return @(AWSIamContextKeyTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamContextKeyTypeEnumString:
                return @"string";
            case AWSIamContextKeyTypeEnumStringList:
                return @"stringList";
            case AWSIamContextKeyTypeEnumNumeric:
                return @"numeric";
            case AWSIamContextKeyTypeEnumNumericList:
                return @"numericList";
            case AWSIamContextKeyTypeEnumBoolean:
                return @"boolean";
            case AWSIamContextKeyTypeEnumBooleanList:
                return @"booleanList";
            case AWSIamContextKeyTypeEnumIp:
                return @"ip";
            case AWSIamContextKeyTypeEnumIpList:
                return @"ipList";
            case AWSIamContextKeyTypeEnumBinary:
                return @"binary";
            case AWSIamContextKeyTypeEnumBinaryList:
                return @"binaryList";
            case AWSIamContextKeyTypeEnumDate:
                return @"date";
            case AWSIamContextKeyTypeEnumDateList:
                return @"dateList";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamCreateAccessKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamCreateAccessKeyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKey" : @"AccessKey",
             };
}

+ (NSValueTransformer *)accessKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamAccessKey class]];
}

@end

@implementation AWSIamCreateAccountAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountAlias" : @"AccountAlias",
             };
}

@end

@implementation AWSIamCreateGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"path" : @"Path",
             };
}

@end

@implementation AWSIamCreateGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"Group",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamGroup class]];
}

@end

@implementation AWSIamCreateInstanceProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceProfileName" : @"InstanceProfileName",
             @"path" : @"Path",
             };
}

@end

@implementation AWSIamCreateInstanceProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceProfile" : @"InstanceProfile",
             };
}

+ (NSValueTransformer *)instanceProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamInstanceProfile class]];
}

@end

@implementation AWSIamCreateLoginProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"password" : @"Password",
             @"passwordResetRequired" : @"PasswordResetRequired",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamCreateLoginProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loginProfile" : @"LoginProfile",
             };
}

+ (NSValueTransformer *)loginProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamLoginProfile class]];
}

@end

@implementation AWSIamCreateOpenIDConnectProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientIDList" : @"ClientIDList",
             @"thumbprintList" : @"ThumbprintList",
             @"url" : @"Url",
             };
}

@end

@implementation AWSIamCreateOpenIDConnectProviderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"openIDConnectProviderArn" : @"OpenIDConnectProviderArn",
             };
}

@end

@implementation AWSIamCreatePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"path" : @"Path",
             @"policyDocument" : @"PolicyDocument",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSIamCreatePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamPolicy class]];
}

@end

@implementation AWSIamCreatePolicyVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             @"policyDocument" : @"PolicyDocument",
             @"setAsDefault" : @"SetAsDefault",
             };
}

@end

@implementation AWSIamCreatePolicyVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyVersion" : @"PolicyVersion",
             };
}

+ (NSValueTransformer *)policyVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamPolicyVersion class]];
}

@end

@implementation AWSIamCreateRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assumeRolePolicyDocument" : @"AssumeRolePolicyDocument",
             @"detail" : @"Description",
             @"maxSessionDuration" : @"MaxSessionDuration",
             @"path" : @"Path",
             @"permissionsBoundary" : @"PermissionsBoundary",
             @"roleName" : @"RoleName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamTag class]];
}

@end

@implementation AWSIamCreateRoleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"role" : @"Role",
             };
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamRole class]];
}

@end

@implementation AWSIamCreateSAMLProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"SAMLMetadataDocument" : @"SAMLMetadataDocument",
             };
}

@end

@implementation AWSIamCreateSAMLProviderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SAMLProviderArn" : @"SAMLProviderArn",
             };
}

@end

@implementation AWSIamCreateServiceLinkedRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSServiceName" : @"AWSServiceName",
             @"customSuffix" : @"CustomSuffix",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSIamCreateServiceLinkedRoleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"role" : @"Role",
             };
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamRole class]];
}

@end

@implementation AWSIamCreateServiceSpecificCredentialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceName" : @"ServiceName",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamCreateServiceSpecificCredentialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSpecificCredential" : @"ServiceSpecificCredential",
             };
}

+ (NSValueTransformer *)serviceSpecificCredentialJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamServiceSpecificCredential class]];
}

@end

@implementation AWSIamCreateUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"path" : @"Path",
             @"permissionsBoundary" : @"PermissionsBoundary",
             @"tags" : @"Tags",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamTag class]];
}

@end

@implementation AWSIamCreateUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamUser class]];
}

@end

@implementation AWSIamCreateVirtualMFADeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"path" : @"Path",
             @"virtualMFADeviceName" : @"VirtualMFADeviceName",
             };
}

@end

@implementation AWSIamCreateVirtualMFADeviceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualMFADevice" : @"VirtualMFADevice",
             };
}

+ (NSValueTransformer *)virtualMFADeviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamVirtualMFADevice class]];
}

@end

@implementation AWSIamDeactivateMFADeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serialNumber" : @"SerialNumber",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamDeleteAccessKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyId" : @"AccessKeyId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamDeleteAccountAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountAlias" : @"AccountAlias",
             };
}

@end

@implementation AWSIamDeleteGroupPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSIamDeleteGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSIamDeleteInstanceProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceProfileName" : @"InstanceProfileName",
             };
}

@end

@implementation AWSIamDeleteLoginProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamDeleteOpenIDConnectProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"openIDConnectProviderArn" : @"OpenIDConnectProviderArn",
             };
}

@end

@implementation AWSIamDeletePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             };
}

@end

@implementation AWSIamDeletePolicyVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSIamDeleteRolePermissionsBoundaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamDeleteRolePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"PolicyName",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamDeleteRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamDeleteSAMLProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SAMLProviderArn" : @"SAMLProviderArn",
             };
}

@end

@implementation AWSIamDeleteSSHPublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SSHPublicKeyId" : @"SSHPublicKeyId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamDeleteServerCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverCertificateName" : @"ServerCertificateName",
             };
}

@end

@implementation AWSIamDeleteServiceLinkedRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamDeleteServiceLinkedRoleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionTaskId" : @"DeletionTaskId",
             };
}

@end

@implementation AWSIamDeleteServiceSpecificCredentialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSpecificCredentialId" : @"ServiceSpecificCredentialId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamDeleteSigningCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"CertificateId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamDeleteUserPermissionsBoundaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamDeleteUserPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"PolicyName",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamDeleteUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamDeleteVirtualMFADeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serialNumber" : @"SerialNumber",
             };
}

@end

@implementation AWSIamDeletionTaskFailureReasonType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reason" : @"Reason",
             @"roleUsageList" : @"RoleUsageList",
             };
}

+ (NSValueTransformer *)roleUsageListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamRoleUsageType class]];
}

@end

@implementation AWSIamDetachGroupPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"policyArn" : @"PolicyArn",
             };
}

@end

@implementation AWSIamDetachRolePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamDetachUserPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamEnableMFADeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationCode1" : @"AuthenticationCode1",
             @"authenticationCode2" : @"AuthenticationCode2",
             @"serialNumber" : @"SerialNumber",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamEntityDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityInfo" : @"EntityInfo",
             @"lastAuthenticated" : @"LastAuthenticated",
             };
}

+ (NSValueTransformer *)entityInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamEntityInfo class]];
}

+ (NSValueTransformer *)lastAuthenticatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamEntityInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"path" : @"Path",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSIampolicyOwnerEntityTypeUser);
        }
        if ([value caseInsensitiveCompare:@"ROLE"] == NSOrderedSame) {
            return @(AWSIampolicyOwnerEntityTypeRole);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSIampolicyOwnerEntityTypeGroup);
        }
        return @(AWSIampolicyOwnerEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIampolicyOwnerEntityTypeUser:
                return @"USER";
            case AWSIampolicyOwnerEntityTypeRole:
                return @"ROLE";
            case AWSIampolicyOwnerEntityTypeGroup:
                return @"GROUP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamErrorDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

@end

@implementation AWSIamEvaluationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evalActionName" : @"EvalActionName",
             @"evalDecision" : @"EvalDecision",
             @"evalDecisionDetails" : @"EvalDecisionDetails",
             @"evalResourceName" : @"EvalResourceName",
             @"matchedStatements" : @"MatchedStatements",
             @"missingContextValues" : @"MissingContextValues",
             @"organizationsDecisionDetail" : @"OrganizationsDecisionDetail",
             @"permissionsBoundaryDecisionDetail" : @"PermissionsBoundaryDecisionDetail",
             @"resourceSpecificResults" : @"ResourceSpecificResults",
             };
}

+ (NSValueTransformer *)evalDecisionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"allowed"] == NSOrderedSame) {
            return @(AWSIamPolicyEvaluationDecisionTypeAllowed);
        }
        if ([value caseInsensitiveCompare:@"explicitDeny"] == NSOrderedSame) {
            return @(AWSIamPolicyEvaluationDecisionTypeExplicitDeny);
        }
        if ([value caseInsensitiveCompare:@"implicitDeny"] == NSOrderedSame) {
            return @(AWSIamPolicyEvaluationDecisionTypeImplicitDeny);
        }
        return @(AWSIamPolicyEvaluationDecisionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamPolicyEvaluationDecisionTypeAllowed:
                return @"allowed";
            case AWSIamPolicyEvaluationDecisionTypeExplicitDeny:
                return @"explicitDeny";
            case AWSIamPolicyEvaluationDecisionTypeImplicitDeny:
                return @"implicitDeny";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)matchedStatementsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamStatement class]];
}

+ (NSValueTransformer *)organizationsDecisionDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamOrganizationsDecisionDetail class]];
}

+ (NSValueTransformer *)permissionsBoundaryDecisionDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamPermissionsBoundaryDecisionDetail class]];
}

+ (NSValueTransformer *)resourceSpecificResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamResourceSpecificResult class]];
}

@end

@implementation AWSIamGenerateCredentialReportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTED"] == NSOrderedSame) {
            return @(AWSIamReportStateTypeStarted);
        }
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSIamReportStateTypeInprogress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSIamReportStateTypeComplete);
        }
        return @(AWSIamReportStateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamReportStateTypeStarted:
                return @"STARTED";
            case AWSIamReportStateTypeInprogress:
                return @"INPROGRESS";
            case AWSIamReportStateTypeComplete:
                return @"COMPLETE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamGenerateOrganizationsAccessReportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityPath" : @"EntityPath",
             @"organizationsPolicyId" : @"OrganizationsPolicyId",
             };
}

@end

@implementation AWSIamGenerateOrganizationsAccessReportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSIamGenerateServiceLastAccessedDetailsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"granularity" : @"Granularity",
             };
}

+ (NSValueTransformer *)granularityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_LEVEL"] == NSOrderedSame) {
            return @(AWSIamAccessAdvisorUsageGranularityTypeServiceLevel);
        }
        if ([value caseInsensitiveCompare:@"ACTION_LEVEL"] == NSOrderedSame) {
            return @(AWSIamAccessAdvisorUsageGranularityTypeActionLevel);
        }
        return @(AWSIamAccessAdvisorUsageGranularityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamAccessAdvisorUsageGranularityTypeServiceLevel:
                return @"SERVICE_LEVEL";
            case AWSIamAccessAdvisorUsageGranularityTypeActionLevel:
                return @"ACTION_LEVEL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamGenerateServiceLastAccessedDetailsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSIamGetAccessKeyLastUsedRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyId" : @"AccessKeyId",
             };
}

@end

@implementation AWSIamGetAccessKeyLastUsedResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyLastUsed" : @"AccessKeyLastUsed",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)accessKeyLastUsedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamAccessKeyLastUsed class]];
}

@end

@implementation AWSIamGetAccountAuthorizationDetailsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSIamGetAccountAuthorizationDetailsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupDetailList" : @"GroupDetailList",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"policies" : @"Policies",
             @"roleDetailList" : @"RoleDetailList",
             @"userDetailList" : @"UserDetailList",
             };
}

+ (NSValueTransformer *)groupDetailListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamGroupDetail class]];
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamManagedPolicyDetail class]];
}

+ (NSValueTransformer *)roleDetailListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamRoleDetail class]];
}

+ (NSValueTransformer *)userDetailListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamUserDetail class]];
}

@end

@implementation AWSIamGetAccountPasswordPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordPolicy" : @"PasswordPolicy",
             };
}

+ (NSValueTransformer *)passwordPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamPasswordPolicy class]];
}

@end

@implementation AWSIamGetAccountSummaryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"summaryMap" : @"SummaryMap",
             };
}

@end

@implementation AWSIamGetContextKeysForCustomPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyInputList" : @"PolicyInputList",
             };
}

@end

@implementation AWSIamGetContextKeysForPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contextKeyNames" : @"ContextKeyNames",
             };
}

@end

@implementation AWSIamGetContextKeysForPrincipalPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyInputList" : @"PolicyInputList",
             @"policySourceArn" : @"PolicySourceArn",
             };
}

@end

@implementation AWSIamGetCredentialReportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"generatedTime" : @"GeneratedTime",
             @"reportFormat" : @"ReportFormat",
             };
}

+ (NSValueTransformer *)generatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)reportFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"text/csv"] == NSOrderedSame) {
            return @(AWSIamReportFormatTypeTextCsv);
        }
        return @(AWSIamReportFormatTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamReportFormatTypeTextCsv:
                return @"text/csv";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamGetGroupPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSIamGetGroupPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"policyDocument" : @"PolicyDocument",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSIamGetGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSIamGetGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"Group",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamGroup class]];
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamUser class]];
}

@end

@implementation AWSIamGetInstanceProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceProfileName" : @"InstanceProfileName",
             };
}

@end

@implementation AWSIamGetInstanceProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceProfile" : @"InstanceProfile",
             };
}

+ (NSValueTransformer *)instanceProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamInstanceProfile class]];
}

@end

@implementation AWSIamGetLoginProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamGetLoginProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loginProfile" : @"LoginProfile",
             };
}

+ (NSValueTransformer *)loginProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamLoginProfile class]];
}

@end

@implementation AWSIamGetOpenIDConnectProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"openIDConnectProviderArn" : @"OpenIDConnectProviderArn",
             };
}

@end

@implementation AWSIamGetOpenIDConnectProviderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientIDList" : @"ClientIDList",
             @"createDate" : @"CreateDate",
             @"thumbprintList" : @"ThumbprintList",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamGetOrganizationsAccessReportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"sortKey" : @"SortKey",
             };
}

+ (NSValueTransformer *)sortKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_NAMESPACE_ASCENDING"] == NSOrderedSame) {
            return @(AWSIamsortKeyTypeServiceNamespaceAscending);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_NAMESPACE_DESCENDING"] == NSOrderedSame) {
            return @(AWSIamsortKeyTypeServiceNamespaceDescending);
        }
        if ([value caseInsensitiveCompare:@"LAST_AUTHENTICATED_TIME_ASCENDING"] == NSOrderedSame) {
            return @(AWSIamsortKeyTypeLastAuthenticatedTimeAscending);
        }
        if ([value caseInsensitiveCompare:@"LAST_AUTHENTICATED_TIME_DESCENDING"] == NSOrderedSame) {
            return @(AWSIamsortKeyTypeLastAuthenticatedTimeDescending);
        }
        return @(AWSIamsortKeyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamsortKeyTypeServiceNamespaceAscending:
                return @"SERVICE_NAMESPACE_ASCENDING";
            case AWSIamsortKeyTypeServiceNamespaceDescending:
                return @"SERVICE_NAMESPACE_DESCENDING";
            case AWSIamsortKeyTypeLastAuthenticatedTimeAscending:
                return @"LAST_AUTHENTICATED_TIME_ASCENDING";
            case AWSIamsortKeyTypeLastAuthenticatedTimeDescending:
                return @"LAST_AUTHENTICATED_TIME_DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamGetOrganizationsAccessReportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessDetails" : @"AccessDetails",
             @"errorDetails" : @"ErrorDetails",
             @"isTruncated" : @"IsTruncated",
             @"jobCompletionDate" : @"JobCompletionDate",
             @"jobCreationDate" : @"JobCreationDate",
             @"jobStatus" : @"JobStatus",
             @"marker" : @"Marker",
             @"numberOfServicesAccessible" : @"NumberOfServicesAccessible",
             @"numberOfServicesNotAccessed" : @"NumberOfServicesNotAccessed",
             };
}

+ (NSValueTransformer *)accessDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamAccessDetail class]];
}

+ (NSValueTransformer *)errorDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamErrorDetails class]];
}

+ (NSValueTransformer *)jobCompletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)jobCreationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIamjobStatusTypeInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIamjobStatusTypeCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIamjobStatusTypeFailed);
        }
        return @(AWSIamjobStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamjobStatusTypeInProgress:
                return @"IN_PROGRESS";
            case AWSIamjobStatusTypeCompleted:
                return @"COMPLETED";
            case AWSIamjobStatusTypeFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamGetPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             };
}

@end

@implementation AWSIamGetPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamPolicy class]];
}

@end

@implementation AWSIamGetPolicyVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSIamGetPolicyVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyVersion" : @"PolicyVersion",
             };
}

+ (NSValueTransformer *)policyVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamPolicyVersion class]];
}

@end

@implementation AWSIamGetRolePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"PolicyName",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamGetRolePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"PolicyDocument",
             @"policyName" : @"PolicyName",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamGetRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamGetRoleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"role" : @"Role",
             };
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamRole class]];
}

@end

@implementation AWSIamGetSAMLProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SAMLProviderArn" : @"SAMLProviderArn",
             };
}

@end

@implementation AWSIamGetSAMLProviderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createDate" : @"CreateDate",
             @"SAMLMetadataDocument" : @"SAMLMetadataDocument",
             @"validUntil" : @"ValidUntil",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)validUntilJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamGetSSHPublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encoding" : @"Encoding",
             @"SSHPublicKeyId" : @"SSHPublicKeyId",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)encodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SSH"] == NSOrderedSame) {
            return @(AWSIamencodingTypeSsh);
        }
        if ([value caseInsensitiveCompare:@"PEM"] == NSOrderedSame) {
            return @(AWSIamencodingTypePem);
        }
        return @(AWSIamencodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamencodingTypeSsh:
                return @"SSH";
            case AWSIamencodingTypePem:
                return @"PEM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamGetSSHPublicKeyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SSHPublicKey" : @"SSHPublicKey",
             };
}

+ (NSValueTransformer *)SSHPublicKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamSSHPublicKey class]];
}

@end

@implementation AWSIamGetServerCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverCertificateName" : @"ServerCertificateName",
             };
}

@end

@implementation AWSIamGetServerCertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverCertificate" : @"ServerCertificate",
             };
}

+ (NSValueTransformer *)serverCertificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamServerCertificate class]];
}

@end

@implementation AWSIamGetServiceLastAccessedDetailsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSIamGetServiceLastAccessedDetailsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"isTruncated" : @"IsTruncated",
             @"jobCompletionDate" : @"JobCompletionDate",
             @"jobCreationDate" : @"JobCreationDate",
             @"jobStatus" : @"JobStatus",
             @"jobType" : @"JobType",
             @"marker" : @"Marker",
             @"servicesLastAccessed" : @"ServicesLastAccessed",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamErrorDetails class]];
}

+ (NSValueTransformer *)jobCompletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)jobCreationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIamjobStatusTypeInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIamjobStatusTypeCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIamjobStatusTypeFailed);
        }
        return @(AWSIamjobStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamjobStatusTypeInProgress:
                return @"IN_PROGRESS";
            case AWSIamjobStatusTypeCompleted:
                return @"COMPLETED";
            case AWSIamjobStatusTypeFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jobTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_LEVEL"] == NSOrderedSame) {
            return @(AWSIamAccessAdvisorUsageGranularityTypeServiceLevel);
        }
        if ([value caseInsensitiveCompare:@"ACTION_LEVEL"] == NSOrderedSame) {
            return @(AWSIamAccessAdvisorUsageGranularityTypeActionLevel);
        }
        return @(AWSIamAccessAdvisorUsageGranularityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamAccessAdvisorUsageGranularityTypeServiceLevel:
                return @"SERVICE_LEVEL";
            case AWSIamAccessAdvisorUsageGranularityTypeActionLevel:
                return @"ACTION_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)servicesLastAccessedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamServiceLastAccessed class]];
}

@end

@implementation AWSIamGetServiceLastAccessedDetailsWithEntitiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"serviceNamespace" : @"ServiceNamespace",
             };
}

@end

@implementation AWSIamGetServiceLastAccessedDetailsWithEntitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityDetailsList" : @"EntityDetailsList",
             @"error" : @"Error",
             @"isTruncated" : @"IsTruncated",
             @"jobCompletionDate" : @"JobCompletionDate",
             @"jobCreationDate" : @"JobCreationDate",
             @"jobStatus" : @"JobStatus",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)entityDetailsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamEntityDetails class]];
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamErrorDetails class]];
}

+ (NSValueTransformer *)jobCompletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)jobCreationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIamjobStatusTypeInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIamjobStatusTypeCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIamjobStatusTypeFailed);
        }
        return @(AWSIamjobStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamjobStatusTypeInProgress:
                return @"IN_PROGRESS";
            case AWSIamjobStatusTypeCompleted:
                return @"COMPLETED";
            case AWSIamjobStatusTypeFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamGetServiceLinkedRoleDeletionStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionTaskId" : @"DeletionTaskId",
             };
}

@end

@implementation AWSIamGetServiceLinkedRoleDeletionStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reason" : @"Reason",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)reasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamDeletionTaskFailureReasonType class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSIamDeletionTaskStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIamDeletionTaskStatusTypeInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIamDeletionTaskStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"NOT_STARTED"] == NSOrderedSame) {
            return @(AWSIamDeletionTaskStatusTypeNotStarted);
        }
        return @(AWSIamDeletionTaskStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamDeletionTaskStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSIamDeletionTaskStatusTypeInProgress:
                return @"IN_PROGRESS";
            case AWSIamDeletionTaskStatusTypeFailed:
                return @"FAILED";
            case AWSIamDeletionTaskStatusTypeNotStarted:
                return @"NOT_STARTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamGetUserPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"PolicyName",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamGetUserPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"PolicyDocument",
             @"policyName" : @"PolicyName",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamGetUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamGetUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamUser class]];
}

@end

@implementation AWSIamGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createDate" : @"CreateDate",
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             @"path" : @"Path",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamGroupDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"attachedManagedPolicies" : @"AttachedManagedPolicies",
             @"createDate" : @"CreateDate",
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             @"groupPolicyList" : @"GroupPolicyList",
             @"path" : @"Path",
             };
}

+ (NSValueTransformer *)attachedManagedPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamAttachedPolicy class]];
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)groupPolicyListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamPolicyDetail class]];
}

@end

@implementation AWSIamInstanceProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createDate" : @"CreateDate",
             @"instanceProfileId" : @"InstanceProfileId",
             @"instanceProfileName" : @"InstanceProfileName",
             @"path" : @"Path",
             @"roles" : @"Roles",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)rolesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamRole class]];
}

@end

@implementation AWSIamListAccessKeysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamListAccessKeysResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyMetadata" : @"AccessKeyMetadata",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)accessKeyMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamAccessKeyMetadata class]];
}

@end

@implementation AWSIamListAccountAliasesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSIamListAccountAliasesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountAliases" : @"AccountAliases",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSIamListAttachedGroupPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"pathPrefix" : @"PathPrefix",
             };
}

@end

@implementation AWSIamListAttachedGroupPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachedPolicies" : @"AttachedPolicies",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)attachedPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamAttachedPolicy class]];
}

@end

@implementation AWSIamListAttachedRolePoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"pathPrefix" : @"PathPrefix",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamListAttachedRolePoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachedPolicies" : @"AttachedPolicies",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)attachedPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamAttachedPolicy class]];
}

@end

@implementation AWSIamListAttachedUserPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"pathPrefix" : @"PathPrefix",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamListAttachedUserPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachedPolicies" : @"AttachedPolicies",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)attachedPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamAttachedPolicy class]];
}

@end

@implementation AWSIamListEntitiesForPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityFilter" : @"EntityFilter",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"pathPrefix" : @"PathPrefix",
             @"policyArn" : @"PolicyArn",
             @"policyUsageFilter" : @"PolicyUsageFilter",
             };
}

+ (NSValueTransformer *)entityFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"User"] == NSOrderedSame) {
            return @(AWSIamEntityTypeUser);
        }
        if ([value caseInsensitiveCompare:@"Role"] == NSOrderedSame) {
            return @(AWSIamEntityTypeRole);
        }
        if ([value caseInsensitiveCompare:@"Group"] == NSOrderedSame) {
            return @(AWSIamEntityTypeGroup);
        }
        if ([value caseInsensitiveCompare:@"LocalManagedPolicy"] == NSOrderedSame) {
            return @(AWSIamEntityTypeLocalManagedPolicy);
        }
        if ([value caseInsensitiveCompare:@"AWSManagedPolicy"] == NSOrderedSame) {
            return @(AWSIamEntityTypeAWSManagedPolicy);
        }
        return @(AWSIamEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamEntityTypeUser:
                return @"User";
            case AWSIamEntityTypeRole:
                return @"Role";
            case AWSIamEntityTypeGroup:
                return @"Group";
            case AWSIamEntityTypeLocalManagedPolicy:
                return @"LocalManagedPolicy";
            case AWSIamEntityTypeAWSManagedPolicy:
                return @"AWSManagedPolicy";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)policyUsageFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PermissionsPolicy"] == NSOrderedSame) {
            return @(AWSIamPolicyUsageTypePermissionsPolicy);
        }
        if ([value caseInsensitiveCompare:@"PermissionsBoundary"] == NSOrderedSame) {
            return @(AWSIamPolicyUsageTypePermissionsBoundary);
        }
        return @(AWSIamPolicyUsageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamPolicyUsageTypePermissionsPolicy:
                return @"PermissionsPolicy";
            case AWSIamPolicyUsageTypePermissionsBoundary:
                return @"PermissionsBoundary";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamListEntitiesForPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"policyGroups" : @"PolicyGroups",
             @"policyRoles" : @"PolicyRoles",
             @"policyUsers" : @"PolicyUsers",
             };
}

+ (NSValueTransformer *)policyGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamPolicyGroup class]];
}

+ (NSValueTransformer *)policyRolesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamPolicyRole class]];
}

+ (NSValueTransformer *)policyUsersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamPolicyUser class]];
}

@end

@implementation AWSIamListGroupPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSIamListGroupPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSIamListGroupsForUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamListGroupsForUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groups" : @"Groups",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamGroup class]];
}

@end

@implementation AWSIamListGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"pathPrefix" : @"PathPrefix",
             };
}

@end

@implementation AWSIamListGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groups" : @"Groups",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamGroup class]];
}

@end

@implementation AWSIamListInstanceProfilesForRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamListInstanceProfilesForRoleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceProfiles" : @"InstanceProfiles",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)instanceProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamInstanceProfile class]];
}

@end

@implementation AWSIamListInstanceProfilesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"pathPrefix" : @"PathPrefix",
             };
}

@end

@implementation AWSIamListInstanceProfilesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceProfiles" : @"InstanceProfiles",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)instanceProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamInstanceProfile class]];
}

@end

@implementation AWSIamListMFADevicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamListMFADevicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"MFADevices" : @"MFADevices",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)MFADevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamMFADevice class]];
}

@end

@implementation AWSIamListOpenIDConnectProvidersRequest

@end

@implementation AWSIamListOpenIDConnectProvidersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"openIDConnectProviderList" : @"OpenIDConnectProviderList",
             };
}

+ (NSValueTransformer *)openIDConnectProviderListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamOpenIDConnectProviderListEntry class]];
}

@end

@implementation AWSIamListPoliciesGrantingServiceAccessEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policies" : @"Policies",
             @"serviceNamespace" : @"ServiceNamespace",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamPolicyGrantingServiceAccess class]];
}

@end

@implementation AWSIamListPoliciesGrantingServiceAccessRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"marker" : @"Marker",
             @"serviceNamespaces" : @"ServiceNamespaces",
             };
}

@end

@implementation AWSIamListPoliciesGrantingServiceAccessResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"policiesGrantingServiceAccess" : @"PoliciesGrantingServiceAccess",
             };
}

+ (NSValueTransformer *)policiesGrantingServiceAccessJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamListPoliciesGrantingServiceAccessEntry class]];
}

@end

@implementation AWSIamListPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"onlyAttached" : @"OnlyAttached",
             @"pathPrefix" : @"PathPrefix",
             @"policyUsageFilter" : @"PolicyUsageFilter",
             @"scope" : @"Scope",
             };
}

+ (NSValueTransformer *)policyUsageFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PermissionsPolicy"] == NSOrderedSame) {
            return @(AWSIamPolicyUsageTypePermissionsPolicy);
        }
        if ([value caseInsensitiveCompare:@"PermissionsBoundary"] == NSOrderedSame) {
            return @(AWSIamPolicyUsageTypePermissionsBoundary);
        }
        return @(AWSIamPolicyUsageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamPolicyUsageTypePermissionsPolicy:
                return @"PermissionsPolicy";
            case AWSIamPolicyUsageTypePermissionsBoundary:
                return @"PermissionsBoundary";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scopeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"All"] == NSOrderedSame) {
            return @(AWSIampolicyScopeTypeAll);
        }
        if ([value caseInsensitiveCompare:@"AWS"] == NSOrderedSame) {
            return @(AWSIampolicyScopeTypeAws);
        }
        if ([value caseInsensitiveCompare:@"Local"] == NSOrderedSame) {
            return @(AWSIampolicyScopeTypeLocal);
        }
        return @(AWSIampolicyScopeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIampolicyScopeTypeAll:
                return @"All";
            case AWSIampolicyScopeTypeAws:
                return @"AWS";
            case AWSIampolicyScopeTypeLocal:
                return @"Local";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamListPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"policies" : @"Policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamPolicy class]];
}

@end

@implementation AWSIamListPolicyVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"policyArn" : @"PolicyArn",
             };
}

@end

@implementation AWSIamListPolicyVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"versions" : @"Versions",
             };
}

+ (NSValueTransformer *)versionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamPolicyVersion class]];
}

@end

@implementation AWSIamListRolePoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamListRolePoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSIamListRoleTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamListRoleTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamTag class]];
}

@end

@implementation AWSIamListRolesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"pathPrefix" : @"PathPrefix",
             };
}

@end

@implementation AWSIamListRolesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"roles" : @"Roles",
             };
}

+ (NSValueTransformer *)rolesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamRole class]];
}

@end

@implementation AWSIamListSAMLProvidersRequest

@end

@implementation AWSIamListSAMLProvidersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SAMLProviderList" : @"SAMLProviderList",
             };
}

+ (NSValueTransformer *)SAMLProviderListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamSAMLProviderListEntry class]];
}

@end

@implementation AWSIamListSSHPublicKeysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamListSSHPublicKeysResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"SSHPublicKeys" : @"SSHPublicKeys",
             };
}

+ (NSValueTransformer *)SSHPublicKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamSSHPublicKeyMetadata class]];
}

@end

@implementation AWSIamListServerCertificatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"pathPrefix" : @"PathPrefix",
             };
}

@end

@implementation AWSIamListServerCertificatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"serverCertificateMetadataList" : @"ServerCertificateMetadataList",
             };
}

+ (NSValueTransformer *)serverCertificateMetadataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamServerCertificateMetadata class]];
}

@end

@implementation AWSIamListServiceSpecificCredentialsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceName" : @"ServiceName",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamListServiceSpecificCredentialsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSpecificCredentials" : @"ServiceSpecificCredentials",
             };
}

+ (NSValueTransformer *)serviceSpecificCredentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamServiceSpecificCredentialMetadata class]];
}

@end

@implementation AWSIamListSigningCertificatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamListSigningCertificatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificates" : @"Certificates",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamSigningCertificate class]];
}

@end

@implementation AWSIamListUserPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamListUserPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSIamListUserTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamListUserTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamTag class]];
}

@end

@implementation AWSIamListUsersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"pathPrefix" : @"PathPrefix",
             };
}

@end

@implementation AWSIamListUsersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamUser class]];
}

@end

@implementation AWSIamListVirtualMFADevicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentStatus" : @"AssignmentStatus",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

+ (NSValueTransformer *)assignmentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Assigned"] == NSOrderedSame) {
            return @(AWSIamassignmentStatusTypeAssigned);
        }
        if ([value caseInsensitiveCompare:@"Unassigned"] == NSOrderedSame) {
            return @(AWSIamassignmentStatusTypeUnassigned);
        }
        if ([value caseInsensitiveCompare:@"Any"] == NSOrderedSame) {
            return @(AWSIamassignmentStatusTypeAny);
        }
        return @(AWSIamassignmentStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamassignmentStatusTypeAssigned:
                return @"Assigned";
            case AWSIamassignmentStatusTypeUnassigned:
                return @"Unassigned";
            case AWSIamassignmentStatusTypeAny:
                return @"Any";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamListVirtualMFADevicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"virtualMFADevices" : @"VirtualMFADevices",
             };
}

+ (NSValueTransformer *)virtualMFADevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamVirtualMFADevice class]];
}

@end

@implementation AWSIamLoginProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createDate" : @"CreateDate",
             @"passwordResetRequired" : @"PasswordResetRequired",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamMFADevice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableDate" : @"EnableDate",
             @"serialNumber" : @"SerialNumber",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)enableDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamManagedPolicyDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"attachmentCount" : @"AttachmentCount",
             @"createDate" : @"CreateDate",
             @"defaultVersionId" : @"DefaultVersionId",
             @"detail" : @"Description",
             @"isAttachable" : @"IsAttachable",
             @"path" : @"Path",
             @"permissionsBoundaryUsageCount" : @"PermissionsBoundaryUsageCount",
             @"policyId" : @"PolicyId",
             @"policyName" : @"PolicyName",
             @"policyVersionList" : @"PolicyVersionList",
             @"updateDate" : @"UpdateDate",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)policyVersionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamPolicyVersion class]];
}

+ (NSValueTransformer *)updateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamOpenIDConnectProviderListEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSIamOrganizationsDecisionDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedByOrganizations" : @"AllowedByOrganizations",
             };
}

@end

@implementation AWSIamPasswordPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUsersToChangePassword" : @"AllowUsersToChangePassword",
             @"expirePasswords" : @"ExpirePasswords",
             @"hardExpiry" : @"HardExpiry",
             @"maxPasswordAge" : @"MaxPasswordAge",
             @"minimumPasswordLength" : @"MinimumPasswordLength",
             @"passwordReusePrevention" : @"PasswordReusePrevention",
             @"requireLowercaseCharacters" : @"RequireLowercaseCharacters",
             @"requireNumbers" : @"RequireNumbers",
             @"requireSymbols" : @"RequireSymbols",
             @"requireUppercaseCharacters" : @"RequireUppercaseCharacters",
             };
}

@end

@implementation AWSIamPermissionsBoundaryDecisionDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedByPermissionsBoundary" : @"AllowedByPermissionsBoundary",
             };
}

@end

@implementation AWSIamPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"attachmentCount" : @"AttachmentCount",
             @"createDate" : @"CreateDate",
             @"defaultVersionId" : @"DefaultVersionId",
             @"detail" : @"Description",
             @"isAttachable" : @"IsAttachable",
             @"path" : @"Path",
             @"permissionsBoundaryUsageCount" : @"PermissionsBoundaryUsageCount",
             @"policyId" : @"PolicyId",
             @"policyName" : @"PolicyName",
             @"updateDate" : @"UpdateDate",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)updateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamPolicyDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"PolicyDocument",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSIamPolicyGrantingServiceAccess

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityName" : @"EntityName",
             @"entityType" : @"EntityType",
             @"policyArn" : @"PolicyArn",
             @"policyName" : @"PolicyName",
             @"policyType" : @"PolicyType",
             };
}

+ (NSValueTransformer *)entityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSIampolicyOwnerEntityTypeUser);
        }
        if ([value caseInsensitiveCompare:@"ROLE"] == NSOrderedSame) {
            return @(AWSIampolicyOwnerEntityTypeRole);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSIampolicyOwnerEntityTypeGroup);
        }
        return @(AWSIampolicyOwnerEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIampolicyOwnerEntityTypeUser:
                return @"USER";
            case AWSIampolicyOwnerEntityTypeRole:
                return @"ROLE";
            case AWSIampolicyOwnerEntityTypeGroup:
                return @"GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INLINE"] == NSOrderedSame) {
            return @(AWSIampolicyTypeInline);
        }
        if ([value caseInsensitiveCompare:@"MANAGED"] == NSOrderedSame) {
            return @(AWSIampolicyTypeManaged);
        }
        return @(AWSIampolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIampolicyTypeInline:
                return @"INLINE";
            case AWSIampolicyTypeManaged:
                return @"MANAGED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamPolicyGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSIamPolicyRole

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleId" : @"RoleId",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamPolicyUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userId" : @"UserId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamPolicyVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createDate" : @"CreateDate",
             @"document" : @"Document",
             @"isDefaultVersion" : @"IsDefaultVersion",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamPosition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"column" : @"Column",
             @"line" : @"Line",
             };
}

@end

@implementation AWSIamPutGroupPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"policyDocument" : @"PolicyDocument",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSIamPutRolePermissionsBoundaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"permissionsBoundary" : @"PermissionsBoundary",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamPutRolePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"PolicyDocument",
             @"policyName" : @"PolicyName",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamPutUserPermissionsBoundaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"permissionsBoundary" : @"PermissionsBoundary",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamPutUserPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"PolicyDocument",
             @"policyName" : @"PolicyName",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamRemoveClientIDFromOpenIDConnectProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientID" : @"ClientID",
             @"openIDConnectProviderArn" : @"OpenIDConnectProviderArn",
             };
}

@end

@implementation AWSIamRemoveRoleFromInstanceProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceProfileName" : @"InstanceProfileName",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamRemoveUserFromGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamResetServiceSpecificCredentialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSpecificCredentialId" : @"ServiceSpecificCredentialId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamResetServiceSpecificCredentialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSpecificCredential" : @"ServiceSpecificCredential",
             };
}

+ (NSValueTransformer *)serviceSpecificCredentialJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamServiceSpecificCredential class]];
}

@end

@implementation AWSIamResourceSpecificResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evalDecisionDetails" : @"EvalDecisionDetails",
             @"evalResourceDecision" : @"EvalResourceDecision",
             @"evalResourceName" : @"EvalResourceName",
             @"matchedStatements" : @"MatchedStatements",
             @"missingContextValues" : @"MissingContextValues",
             @"permissionsBoundaryDecisionDetail" : @"PermissionsBoundaryDecisionDetail",
             };
}

+ (NSValueTransformer *)evalResourceDecisionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"allowed"] == NSOrderedSame) {
            return @(AWSIamPolicyEvaluationDecisionTypeAllowed);
        }
        if ([value caseInsensitiveCompare:@"explicitDeny"] == NSOrderedSame) {
            return @(AWSIamPolicyEvaluationDecisionTypeExplicitDeny);
        }
        if ([value caseInsensitiveCompare:@"implicitDeny"] == NSOrderedSame) {
            return @(AWSIamPolicyEvaluationDecisionTypeImplicitDeny);
        }
        return @(AWSIamPolicyEvaluationDecisionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamPolicyEvaluationDecisionTypeAllowed:
                return @"allowed";
            case AWSIamPolicyEvaluationDecisionTypeExplicitDeny:
                return @"explicitDeny";
            case AWSIamPolicyEvaluationDecisionTypeImplicitDeny:
                return @"implicitDeny";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)matchedStatementsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamStatement class]];
}

+ (NSValueTransformer *)permissionsBoundaryDecisionDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamPermissionsBoundaryDecisionDetail class]];
}

@end

@implementation AWSIamResyncMFADeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationCode1" : @"AuthenticationCode1",
             @"authenticationCode2" : @"AuthenticationCode2",
             @"serialNumber" : @"SerialNumber",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamRole

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"assumeRolePolicyDocument" : @"AssumeRolePolicyDocument",
             @"createDate" : @"CreateDate",
             @"detail" : @"Description",
             @"maxSessionDuration" : @"MaxSessionDuration",
             @"path" : @"Path",
             @"permissionsBoundary" : @"PermissionsBoundary",
             @"roleId" : @"RoleId",
             @"roleLastUsed" : @"RoleLastUsed",
             @"roleName" : @"RoleName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)permissionsBoundaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamAttachedPermissionsBoundary class]];
}

+ (NSValueTransformer *)roleLastUsedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamRoleLastUsed class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamTag class]];
}

@end

@implementation AWSIamRoleDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"assumeRolePolicyDocument" : @"AssumeRolePolicyDocument",
             @"attachedManagedPolicies" : @"AttachedManagedPolicies",
             @"createDate" : @"CreateDate",
             @"instanceProfileList" : @"InstanceProfileList",
             @"path" : @"Path",
             @"permissionsBoundary" : @"PermissionsBoundary",
             @"roleId" : @"RoleId",
             @"roleLastUsed" : @"RoleLastUsed",
             @"roleName" : @"RoleName",
             @"rolePolicyList" : @"RolePolicyList",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)attachedManagedPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamAttachedPolicy class]];
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)instanceProfileListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamInstanceProfile class]];
}

+ (NSValueTransformer *)permissionsBoundaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamAttachedPermissionsBoundary class]];
}

+ (NSValueTransformer *)roleLastUsedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamRoleLastUsed class]];
}

+ (NSValueTransformer *)rolePolicyListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamPolicyDetail class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamTag class]];
}

@end

@implementation AWSIamRoleLastUsed

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastUsedDate" : @"LastUsedDate",
             @"region" : @"Region",
             };
}

+ (NSValueTransformer *)lastUsedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamRoleUsageType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"region" : @"Region",
             @"resources" : @"Resources",
             };
}

@end

@implementation AWSIamSAMLProviderListEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createDate" : @"CreateDate",
             @"validUntil" : @"ValidUntil",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)validUntilJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamSSHPublicKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fingerprint" : @"Fingerprint",
             @"SSHPublicKeyBody" : @"SSHPublicKeyBody",
             @"SSHPublicKeyId" : @"SSHPublicKeyId",
             @"status" : @"Status",
             @"uploadDate" : @"UploadDate",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSIamstatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSIamstatusTypeInactive);
        }
        return @(AWSIamstatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamstatusTypeActive:
                return @"Active";
            case AWSIamstatusTypeInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)uploadDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamSSHPublicKeyMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SSHPublicKeyId" : @"SSHPublicKeyId",
             @"status" : @"Status",
             @"uploadDate" : @"UploadDate",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSIamstatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSIamstatusTypeInactive);
        }
        return @(AWSIamstatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamstatusTypeActive:
                return @"Active";
            case AWSIamstatusTypeInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)uploadDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamServerCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateBody" : @"CertificateBody",
             @"certificateChain" : @"CertificateChain",
             @"serverCertificateMetadata" : @"ServerCertificateMetadata",
             };
}

+ (NSValueTransformer *)serverCertificateMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamServerCertificateMetadata class]];
}

@end

@implementation AWSIamServerCertificateMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"expiration" : @"Expiration",
             @"path" : @"Path",
             @"serverCertificateId" : @"ServerCertificateId",
             @"serverCertificateName" : @"ServerCertificateName",
             @"uploadDate" : @"UploadDate",
             };
}

+ (NSValueTransformer *)expirationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)uploadDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamServiceLastAccessed

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastAuthenticated" : @"LastAuthenticated",
             @"lastAuthenticatedEntity" : @"LastAuthenticatedEntity",
             @"lastAuthenticatedRegion" : @"LastAuthenticatedRegion",
             @"serviceName" : @"ServiceName",
             @"serviceNamespace" : @"ServiceNamespace",
             @"totalAuthenticatedEntities" : @"TotalAuthenticatedEntities",
             @"trackedActionsLastAccessed" : @"TrackedActionsLastAccessed",
             };
}

+ (NSValueTransformer *)lastAuthenticatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)trackedActionsLastAccessedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamTrackedActionLastAccessed class]];
}

@end

@implementation AWSIamServiceSpecificCredential

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createDate" : @"CreateDate",
             @"serviceName" : @"ServiceName",
             @"servicePassword" : @"ServicePassword",
             @"serviceSpecificCredentialId" : @"ServiceSpecificCredentialId",
             @"serviceUserName" : @"ServiceUserName",
             @"status" : @"Status",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSIamstatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSIamstatusTypeInactive);
        }
        return @(AWSIamstatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamstatusTypeActive:
                return @"Active";
            case AWSIamstatusTypeInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamServiceSpecificCredentialMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createDate" : @"CreateDate",
             @"serviceName" : @"ServiceName",
             @"serviceSpecificCredentialId" : @"ServiceSpecificCredentialId",
             @"serviceUserName" : @"ServiceUserName",
             @"status" : @"Status",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSIamstatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSIamstatusTypeInactive);
        }
        return @(AWSIamstatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamstatusTypeActive:
                return @"Active";
            case AWSIamstatusTypeInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamSetDefaultPolicyVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSIamSetSecurityTokenServicePreferencesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalEndpointTokenVersion" : @"GlobalEndpointTokenVersion",
             };
}

+ (NSValueTransformer *)globalEndpointTokenVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"v1Token"] == NSOrderedSame) {
            return @(AWSIamglobalEndpointTokenVersionV1Token);
        }
        if ([value caseInsensitiveCompare:@"v2Token"] == NSOrderedSame) {
            return @(AWSIamglobalEndpointTokenVersionV2Token);
        }
        return @(AWSIamglobalEndpointTokenVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamglobalEndpointTokenVersionV1Token:
                return @"v1Token";
            case AWSIamglobalEndpointTokenVersionV2Token:
                return @"v2Token";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamSigningCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateBody" : @"CertificateBody",
             @"certificateId" : @"CertificateId",
             @"status" : @"Status",
             @"uploadDate" : @"UploadDate",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSIamstatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSIamstatusTypeInactive);
        }
        return @(AWSIamstatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamstatusTypeActive:
                return @"Active";
            case AWSIamstatusTypeInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)uploadDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamSimulateCustomPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionNames" : @"ActionNames",
             @"callerArn" : @"CallerArn",
             @"contextEntries" : @"ContextEntries",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"permissionsBoundaryPolicyInputList" : @"PermissionsBoundaryPolicyInputList",
             @"policyInputList" : @"PolicyInputList",
             @"resourceArns" : @"ResourceArns",
             @"resourceHandlingOption" : @"ResourceHandlingOption",
             @"resourceOwner" : @"ResourceOwner",
             @"resourcePolicy" : @"ResourcePolicy",
             };
}

+ (NSValueTransformer *)contextEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamContextEntry class]];
}

@end

@implementation AWSIamSimulatePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationResults" : @"EvaluationResults",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)evaluationResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamEvaluationResult class]];
}

@end

@implementation AWSIamSimulatePrincipalPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionNames" : @"ActionNames",
             @"callerArn" : @"CallerArn",
             @"contextEntries" : @"ContextEntries",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"permissionsBoundaryPolicyInputList" : @"PermissionsBoundaryPolicyInputList",
             @"policyInputList" : @"PolicyInputList",
             @"policySourceArn" : @"PolicySourceArn",
             @"resourceArns" : @"ResourceArns",
             @"resourceHandlingOption" : @"ResourceHandlingOption",
             @"resourceOwner" : @"ResourceOwner",
             @"resourcePolicy" : @"ResourcePolicy",
             };
}

+ (NSValueTransformer *)contextEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamContextEntry class]];
}

@end

@implementation AWSIamStatement

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endPosition" : @"EndPosition",
             @"sourcePolicyId" : @"SourcePolicyId",
             @"sourcePolicyType" : @"SourcePolicyType",
             @"startPosition" : @"StartPosition",
             };
}

+ (NSValueTransformer *)endPositionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamPosition class]];
}

+ (NSValueTransformer *)sourcePolicyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"user"] == NSOrderedSame) {
            return @(AWSIamPolicySourceTypeUser);
        }
        if ([value caseInsensitiveCompare:@"group"] == NSOrderedSame) {
            return @(AWSIamPolicySourceTypeGroup);
        }
        if ([value caseInsensitiveCompare:@"role"] == NSOrderedSame) {
            return @(AWSIamPolicySourceTypeRole);
        }
        if ([value caseInsensitiveCompare:@"aws-managed"] == NSOrderedSame) {
            return @(AWSIamPolicySourceTypeAwsManaged);
        }
        if ([value caseInsensitiveCompare:@"user-managed"] == NSOrderedSame) {
            return @(AWSIamPolicySourceTypeUserManaged);
        }
        if ([value caseInsensitiveCompare:@"resource"] == NSOrderedSame) {
            return @(AWSIamPolicySourceTypeResource);
        }
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSIamPolicySourceTypeNone);
        }
        return @(AWSIamPolicySourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamPolicySourceTypeUser:
                return @"user";
            case AWSIamPolicySourceTypeGroup:
                return @"group";
            case AWSIamPolicySourceTypeRole:
                return @"role";
            case AWSIamPolicySourceTypeAwsManaged:
                return @"aws-managed";
            case AWSIamPolicySourceTypeUserManaged:
                return @"user-managed";
            case AWSIamPolicySourceTypeResource:
                return @"resource";
            case AWSIamPolicySourceTypeNone:
                return @"none";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startPositionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamPosition class]];
}

@end

@implementation AWSIamTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSIamTagRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleName" : @"RoleName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamTag class]];
}

@end

@implementation AWSIamTagUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamTag class]];
}

@end

@implementation AWSIamTrackedActionLastAccessed

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionName" : @"ActionName",
             @"lastAccessedEntity" : @"LastAccessedEntity",
             @"lastAccessedRegion" : @"LastAccessedRegion",
             @"lastAccessedTime" : @"LastAccessedTime",
             };
}

+ (NSValueTransformer *)lastAccessedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIamUntagRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleName" : @"RoleName",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSIamUntagUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagKeys" : @"TagKeys",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamUpdateAccessKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyId" : @"AccessKeyId",
             @"status" : @"Status",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSIamstatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSIamstatusTypeInactive);
        }
        return @(AWSIamstatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamstatusTypeActive:
                return @"Active";
            case AWSIamstatusTypeInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamUpdateAccountPasswordPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUsersToChangePassword" : @"AllowUsersToChangePassword",
             @"hardExpiry" : @"HardExpiry",
             @"maxPasswordAge" : @"MaxPasswordAge",
             @"minimumPasswordLength" : @"MinimumPasswordLength",
             @"passwordReusePrevention" : @"PasswordReusePrevention",
             @"requireLowercaseCharacters" : @"RequireLowercaseCharacters",
             @"requireNumbers" : @"RequireNumbers",
             @"requireSymbols" : @"RequireSymbols",
             @"requireUppercaseCharacters" : @"RequireUppercaseCharacters",
             };
}

@end

@implementation AWSIamUpdateAssumeRolePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"PolicyDocument",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamUpdateGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"latestGroupName" : @"NewGroupName",
             @"latestPath" : @"NewPath",
             };
}

@end

@implementation AWSIamUpdateLoginProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"password" : @"Password",
             @"passwordResetRequired" : @"PasswordResetRequired",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamUpdateOpenIDConnectProviderThumbprintRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"openIDConnectProviderArn" : @"OpenIDConnectProviderArn",
             @"thumbprintList" : @"ThumbprintList",
             };
}

@end

@implementation AWSIamUpdateRoleDescriptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamUpdateRoleDescriptionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"role" : @"Role",
             };
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamRole class]];
}

@end

@implementation AWSIamUpdateRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"maxSessionDuration" : @"MaxSessionDuration",
             @"roleName" : @"RoleName",
             };
}

@end

@implementation AWSIamUpdateRoleResponse

@end

@implementation AWSIamUpdateSAMLProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SAMLMetadataDocument" : @"SAMLMetadataDocument",
             @"SAMLProviderArn" : @"SAMLProviderArn",
             };
}

@end

@implementation AWSIamUpdateSAMLProviderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SAMLProviderArn" : @"SAMLProviderArn",
             };
}

@end

@implementation AWSIamUpdateSSHPublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SSHPublicKeyId" : @"SSHPublicKeyId",
             @"status" : @"Status",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSIamstatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSIamstatusTypeInactive);
        }
        return @(AWSIamstatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamstatusTypeActive:
                return @"Active";
            case AWSIamstatusTypeInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamUpdateServerCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestPath" : @"NewPath",
             @"latestServerCertificateName" : @"NewServerCertificateName",
             @"serverCertificateName" : @"ServerCertificateName",
             };
}

@end

@implementation AWSIamUpdateServiceSpecificCredentialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSpecificCredentialId" : @"ServiceSpecificCredentialId",
             @"status" : @"Status",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSIamstatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSIamstatusTypeInactive);
        }
        return @(AWSIamstatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamstatusTypeActive:
                return @"Active";
            case AWSIamstatusTypeInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamUpdateSigningCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"CertificateId",
             @"status" : @"Status",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSIamstatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSIamstatusTypeInactive);
        }
        return @(AWSIamstatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIamstatusTypeActive:
                return @"Active";
            case AWSIamstatusTypeInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIamUpdateUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestPath" : @"NewPath",
             @"latestUserName" : @"NewUserName",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamUploadSSHPublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SSHPublicKeyBody" : @"SSHPublicKeyBody",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamUploadSSHPublicKeyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SSHPublicKey" : @"SSHPublicKey",
             };
}

+ (NSValueTransformer *)SSHPublicKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamSSHPublicKey class]];
}

@end

@implementation AWSIamUploadServerCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateBody" : @"CertificateBody",
             @"certificateChain" : @"CertificateChain",
             @"path" : @"Path",
             @"privateKey" : @"PrivateKey",
             @"serverCertificateName" : @"ServerCertificateName",
             };
}

@end

@implementation AWSIamUploadServerCertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverCertificateMetadata" : @"ServerCertificateMetadata",
             };
}

+ (NSValueTransformer *)serverCertificateMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamServerCertificateMetadata class]];
}

@end

@implementation AWSIamUploadSigningCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateBody" : @"CertificateBody",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSIamUploadSigningCertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             };
}

+ (NSValueTransformer *)certificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamSigningCertificate class]];
}

@end

@implementation AWSIamUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createDate" : @"CreateDate",
             @"passwordLastUsed" : @"PasswordLastUsed",
             @"path" : @"Path",
             @"permissionsBoundary" : @"PermissionsBoundary",
             @"tags" : @"Tags",
             @"userId" : @"UserId",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)passwordLastUsedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)permissionsBoundaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamAttachedPermissionsBoundary class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamTag class]];
}

@end

@implementation AWSIamUserDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"attachedManagedPolicies" : @"AttachedManagedPolicies",
             @"createDate" : @"CreateDate",
             @"groupList" : @"GroupList",
             @"path" : @"Path",
             @"permissionsBoundary" : @"PermissionsBoundary",
             @"tags" : @"Tags",
             @"userId" : @"UserId",
             @"userName" : @"UserName",
             @"userPolicyList" : @"UserPolicyList",
             };
}

+ (NSValueTransformer *)attachedManagedPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamAttachedPolicy class]];
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)permissionsBoundaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamAttachedPermissionsBoundary class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamTag class]];
}

+ (NSValueTransformer *)userPolicyListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIamPolicyDetail class]];
}

@end

@implementation AWSIamVirtualMFADevice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"base32StringSeed" : @"Base32StringSeed",
             @"enableDate" : @"EnableDate",
             @"QRCodePNG" : @"QRCodePNG",
             @"serialNumber" : @"SerialNumber",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)enableDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIamUser class]];
}

@end
