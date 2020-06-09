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

#import "AWSTransferModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSTransferErrorDomain = @"com.amazonaws.AWSTransferErrorDomain";

@implementation AWSTransferCreateServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             @"endpointDetails" : @"EndpointDetails",
             @"endpointType" : @"EndpointType",
             @"hostKey" : @"HostKey",
             @"identityProviderDetails" : @"IdentityProviderDetails",
             @"identityProviderType" : @"IdentityProviderType",
             @"loggingRole" : @"LoggingRole",
             @"protocols" : @"Protocols",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)endpointDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTransferEndpointDetails class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypePublic);
        }
        if ([value caseInsensitiveCompare:@"VPC"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypeVpc);
        }
        if ([value caseInsensitiveCompare:@"VPC_ENDPOINT"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypeVpcEndpoint);
        }
        return @(AWSTransferEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferEndpointTypePublic:
                return @"PUBLIC";
            case AWSTransferEndpointTypeVpc:
                return @"VPC";
            case AWSTransferEndpointTypeVpcEndpoint:
                return @"VPC_ENDPOINT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)identityProviderDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTransferIdentityProviderDetails class]];
}

+ (NSValueTransformer *)identityProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_MANAGED"] == NSOrderedSame) {
            return @(AWSTransferIdentityProviderTypeServiceManaged);
        }
        if ([value caseInsensitiveCompare:@"API_GATEWAY"] == NSOrderedSame) {
            return @(AWSTransferIdentityProviderTypeApiGateway);
        }
        return @(AWSTransferIdentityProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferIdentityProviderTypeServiceManaged:
                return @"SERVICE_MANAGED";
            case AWSTransferIdentityProviderTypeApiGateway:
                return @"API_GATEWAY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferTag class]];
}

@end

@implementation AWSTransferCreateServerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWSTransferCreateUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"homeDirectory" : @"HomeDirectory",
             @"homeDirectoryMappings" : @"HomeDirectoryMappings",
             @"homeDirectoryType" : @"HomeDirectoryType",
             @"policy" : @"Policy",
             @"role" : @"Role",
             @"serverId" : @"ServerId",
             @"sshPublicKeyBody" : @"SshPublicKeyBody",
             @"tags" : @"Tags",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)homeDirectoryMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferHomeDirectoryMapEntry class]];
}

+ (NSValueTransformer *)homeDirectoryTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PATH"] == NSOrderedSame) {
            return @(AWSTransferHomeDirectoryTypePath);
        }
        if ([value caseInsensitiveCompare:@"LOGICAL"] == NSOrderedSame) {
            return @(AWSTransferHomeDirectoryTypeLogical);
        }
        return @(AWSTransferHomeDirectoryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferHomeDirectoryTypePath:
                return @"PATH";
            case AWSTransferHomeDirectoryTypeLogical:
                return @"LOGICAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferTag class]];
}

@end

@implementation AWSTransferCreateUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSTransferDeleteServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWSTransferDeleteSshPublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"sshPublicKeyId" : @"SshPublicKeyId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSTransferDeleteUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSTransferDescribeServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWSTransferDescribeServerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"server" : @"Server",
             };
}

+ (NSValueTransformer *)serverJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTransferDescribedServer class]];
}

@end

@implementation AWSTransferDescribeUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSTransferDescribeUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTransferDescribedUser class]];
}

@end

@implementation AWSTransferDescribedServer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"certificate" : @"Certificate",
             @"endpointDetails" : @"EndpointDetails",
             @"endpointType" : @"EndpointType",
             @"hostKeyFingerprint" : @"HostKeyFingerprint",
             @"identityProviderDetails" : @"IdentityProviderDetails",
             @"identityProviderType" : @"IdentityProviderType",
             @"loggingRole" : @"LoggingRole",
             @"protocols" : @"Protocols",
             @"serverId" : @"ServerId",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"userCount" : @"UserCount",
             };
}

+ (NSValueTransformer *)endpointDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTransferEndpointDetails class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypePublic);
        }
        if ([value caseInsensitiveCompare:@"VPC"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypeVpc);
        }
        if ([value caseInsensitiveCompare:@"VPC_ENDPOINT"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypeVpcEndpoint);
        }
        return @(AWSTransferEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferEndpointTypePublic:
                return @"PUBLIC";
            case AWSTransferEndpointTypeVpc:
                return @"VPC";
            case AWSTransferEndpointTypeVpcEndpoint:
                return @"VPC_ENDPOINT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)identityProviderDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTransferIdentityProviderDetails class]];
}

+ (NSValueTransformer *)identityProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_MANAGED"] == NSOrderedSame) {
            return @(AWSTransferIdentityProviderTypeServiceManaged);
        }
        if ([value caseInsensitiveCompare:@"API_GATEWAY"] == NSOrderedSame) {
            return @(AWSTransferIdentityProviderTypeApiGateway);
        }
        return @(AWSTransferIdentityProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferIdentityProviderTypeServiceManaged:
                return @"SERVICE_MANAGED";
            case AWSTransferIdentityProviderTypeApiGateway:
                return @"API_GATEWAY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFFLINE"] == NSOrderedSame) {
            return @(AWSTransferStateOffline);
        }
        if ([value caseInsensitiveCompare:@"ONLINE"] == NSOrderedSame) {
            return @(AWSTransferStateOnline);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSTransferStateStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSTransferStateStopping);
        }
        if ([value caseInsensitiveCompare:@"START_FAILED"] == NSOrderedSame) {
            return @(AWSTransferStateStartFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_FAILED"] == NSOrderedSame) {
            return @(AWSTransferStateStopFailed);
        }
        return @(AWSTransferStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferStateOffline:
                return @"OFFLINE";
            case AWSTransferStateOnline:
                return @"ONLINE";
            case AWSTransferStateStarting:
                return @"STARTING";
            case AWSTransferStateStopping:
                return @"STOPPING";
            case AWSTransferStateStartFailed:
                return @"START_FAILED";
            case AWSTransferStateStopFailed:
                return @"STOP_FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferTag class]];
}

@end

@implementation AWSTransferDescribedUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"homeDirectory" : @"HomeDirectory",
             @"homeDirectoryMappings" : @"HomeDirectoryMappings",
             @"homeDirectoryType" : @"HomeDirectoryType",
             @"policy" : @"Policy",
             @"role" : @"Role",
             @"sshPublicKeys" : @"SshPublicKeys",
             @"tags" : @"Tags",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)homeDirectoryMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferHomeDirectoryMapEntry class]];
}

+ (NSValueTransformer *)homeDirectoryTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PATH"] == NSOrderedSame) {
            return @(AWSTransferHomeDirectoryTypePath);
        }
        if ([value caseInsensitiveCompare:@"LOGICAL"] == NSOrderedSame) {
            return @(AWSTransferHomeDirectoryTypeLogical);
        }
        return @(AWSTransferHomeDirectoryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferHomeDirectoryTypePath:
                return @"PATH";
            case AWSTransferHomeDirectoryTypeLogical:
                return @"LOGICAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sshPublicKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferSshPublicKey class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferTag class]];
}

@end

@implementation AWSTransferEndpointDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressAllocationIds" : @"AddressAllocationIds",
             @"subnetIds" : @"SubnetIds",
             @"vpcEndpointId" : @"VpcEndpointId",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSTransferHomeDirectoryMapEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entry" : @"Entry",
             @"target" : @"Target",
             };
}

@end

@implementation AWSTransferIdentityProviderDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invocationRole" : @"InvocationRole",
             @"url" : @"Url",
             };
}

@end

@implementation AWSTransferImportSshPublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"sshPublicKeyBody" : @"SshPublicKeyBody",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSTransferImportSshPublicKeyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"sshPublicKeyId" : @"SshPublicKeyId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSTransferListServersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSTransferListServersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"servers" : @"Servers",
             };
}

+ (NSValueTransformer *)serversJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferListedServer class]];
}

@end

@implementation AWSTransferListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSTransferListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferTag class]];
}

@end

@implementation AWSTransferListUsersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWSTransferListUsersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"serverId" : @"ServerId",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferListedUser class]];
}

@end

@implementation AWSTransferListedServer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"endpointType" : @"EndpointType",
             @"identityProviderType" : @"IdentityProviderType",
             @"loggingRole" : @"LoggingRole",
             @"serverId" : @"ServerId",
             @"state" : @"State",
             @"userCount" : @"UserCount",
             };
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypePublic);
        }
        if ([value caseInsensitiveCompare:@"VPC"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypeVpc);
        }
        if ([value caseInsensitiveCompare:@"VPC_ENDPOINT"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypeVpcEndpoint);
        }
        return @(AWSTransferEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferEndpointTypePublic:
                return @"PUBLIC";
            case AWSTransferEndpointTypeVpc:
                return @"VPC";
            case AWSTransferEndpointTypeVpcEndpoint:
                return @"VPC_ENDPOINT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)identityProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_MANAGED"] == NSOrderedSame) {
            return @(AWSTransferIdentityProviderTypeServiceManaged);
        }
        if ([value caseInsensitiveCompare:@"API_GATEWAY"] == NSOrderedSame) {
            return @(AWSTransferIdentityProviderTypeApiGateway);
        }
        return @(AWSTransferIdentityProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferIdentityProviderTypeServiceManaged:
                return @"SERVICE_MANAGED";
            case AWSTransferIdentityProviderTypeApiGateway:
                return @"API_GATEWAY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFFLINE"] == NSOrderedSame) {
            return @(AWSTransferStateOffline);
        }
        if ([value caseInsensitiveCompare:@"ONLINE"] == NSOrderedSame) {
            return @(AWSTransferStateOnline);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSTransferStateStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSTransferStateStopping);
        }
        if ([value caseInsensitiveCompare:@"START_FAILED"] == NSOrderedSame) {
            return @(AWSTransferStateStartFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_FAILED"] == NSOrderedSame) {
            return @(AWSTransferStateStopFailed);
        }
        return @(AWSTransferStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferStateOffline:
                return @"OFFLINE";
            case AWSTransferStateOnline:
                return @"ONLINE";
            case AWSTransferStateStarting:
                return @"STARTING";
            case AWSTransferStateStopping:
                return @"STOPPING";
            case AWSTransferStateStartFailed:
                return @"START_FAILED";
            case AWSTransferStateStopFailed:
                return @"STOP_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTransferListedUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"homeDirectory" : @"HomeDirectory",
             @"homeDirectoryType" : @"HomeDirectoryType",
             @"role" : @"Role",
             @"sshPublicKeyCount" : @"SshPublicKeyCount",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)homeDirectoryTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PATH"] == NSOrderedSame) {
            return @(AWSTransferHomeDirectoryTypePath);
        }
        if ([value caseInsensitiveCompare:@"LOGICAL"] == NSOrderedSame) {
            return @(AWSTransferHomeDirectoryTypeLogical);
        }
        return @(AWSTransferHomeDirectoryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferHomeDirectoryTypePath:
                return @"PATH";
            case AWSTransferHomeDirectoryTypeLogical:
                return @"LOGICAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTransferSshPublicKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dateImported" : @"DateImported",
             @"sshPublicKeyBody" : @"SshPublicKeyBody",
             @"sshPublicKeyId" : @"SshPublicKeyId",
             };
}

+ (NSValueTransformer *)dateImportedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTransferStartServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWSTransferStopServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWSTransferTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSTransferTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferTag class]];
}

@end

@implementation AWSTransferTestIdentityProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"serverProtocol" : @"ServerProtocol",
             @"sourceIp" : @"SourceIp",
             @"userName" : @"UserName",
             @"userPassword" : @"UserPassword",
             };
}

+ (NSValueTransformer *)serverProtocolJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SFTP"] == NSOrderedSame) {
            return @(AWSTransferProtocolsSftp);
        }
        if ([value caseInsensitiveCompare:@"FTP"] == NSOrderedSame) {
            return @(AWSTransferProtocolsFtp);
        }
        if ([value caseInsensitiveCompare:@"FTPS"] == NSOrderedSame) {
            return @(AWSTransferProtocolsFtps);
        }
        return @(AWSTransferProtocolsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferProtocolsSftp:
                return @"SFTP";
            case AWSTransferProtocolsFtp:
                return @"FTP";
            case AWSTransferProtocolsFtps:
                return @"FTPS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTransferTestIdentityProviderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"response" : @"Response",
             @"statusCode" : @"StatusCode",
             @"url" : @"Url",
             };
}

@end

@implementation AWSTransferUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSTransferUpdateServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             @"endpointDetails" : @"EndpointDetails",
             @"endpointType" : @"EndpointType",
             @"hostKey" : @"HostKey",
             @"identityProviderDetails" : @"IdentityProviderDetails",
             @"loggingRole" : @"LoggingRole",
             @"protocols" : @"Protocols",
             @"serverId" : @"ServerId",
             };
}

+ (NSValueTransformer *)endpointDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTransferEndpointDetails class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypePublic);
        }
        if ([value caseInsensitiveCompare:@"VPC"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypeVpc);
        }
        if ([value caseInsensitiveCompare:@"VPC_ENDPOINT"] == NSOrderedSame) {
            return @(AWSTransferEndpointTypeVpcEndpoint);
        }
        return @(AWSTransferEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferEndpointTypePublic:
                return @"PUBLIC";
            case AWSTransferEndpointTypeVpc:
                return @"VPC";
            case AWSTransferEndpointTypeVpcEndpoint:
                return @"VPC_ENDPOINT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)identityProviderDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTransferIdentityProviderDetails class]];
}

@end

@implementation AWSTransferUpdateServerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWSTransferUpdateUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"homeDirectory" : @"HomeDirectory",
             @"homeDirectoryMappings" : @"HomeDirectoryMappings",
             @"homeDirectoryType" : @"HomeDirectoryType",
             @"policy" : @"Policy",
             @"role" : @"Role",
             @"serverId" : @"ServerId",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)homeDirectoryMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTransferHomeDirectoryMapEntry class]];
}

+ (NSValueTransformer *)homeDirectoryTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PATH"] == NSOrderedSame) {
            return @(AWSTransferHomeDirectoryTypePath);
        }
        if ([value caseInsensitiveCompare:@"LOGICAL"] == NSOrderedSame) {
            return @(AWSTransferHomeDirectoryTypeLogical);
        }
        return @(AWSTransferHomeDirectoryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTransferHomeDirectoryTypePath:
                return @"PATH";
            case AWSTransferHomeDirectoryTypeLogical:
                return @"LOGICAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTransferUpdateUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"userName" : @"UserName",
             };
}

@end
