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

#import "AWStransferModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWStransferErrorDomain = @"com.amazonaws.AWStransferErrorDomain";

@implementation AWStransferCreateServerRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStransferEndpointDetails class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWStransferEndpointTypePublic);
        }
        if ([value caseInsensitiveCompare:@"VPC"] == NSOrderedSame) {
            return @(AWStransferEndpointTypeVpc);
        }
        if ([value caseInsensitiveCompare:@"VPC_ENDPOINT"] == NSOrderedSame) {
            return @(AWStransferEndpointTypeVpcEndpoint);
        }
        return @(AWStransferEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferEndpointTypePublic:
                return @"PUBLIC";
            case AWStransferEndpointTypeVpc:
                return @"VPC";
            case AWStransferEndpointTypeVpcEndpoint:
                return @"VPC_ENDPOINT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)identityProviderDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStransferIdentityProviderDetails class]];
}

+ (NSValueTransformer *)identityProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_MANAGED"] == NSOrderedSame) {
            return @(AWStransferIdentityProviderTypeServiceManaged);
        }
        if ([value caseInsensitiveCompare:@"API_GATEWAY"] == NSOrderedSame) {
            return @(AWStransferIdentityProviderTypeApiGateway);
        }
        return @(AWStransferIdentityProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferIdentityProviderTypeServiceManaged:
                return @"SERVICE_MANAGED";
            case AWStransferIdentityProviderTypeApiGateway:
                return @"API_GATEWAY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferTag class]];
}

@end

@implementation AWStransferCreateServerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWStransferCreateUserRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferHomeDirectoryMapEntry class]];
}

+ (NSValueTransformer *)homeDirectoryTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PATH"] == NSOrderedSame) {
            return @(AWStransferHomeDirectoryTypePath);
        }
        if ([value caseInsensitiveCompare:@"LOGICAL"] == NSOrderedSame) {
            return @(AWStransferHomeDirectoryTypeLogical);
        }
        return @(AWStransferHomeDirectoryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferHomeDirectoryTypePath:
                return @"PATH";
            case AWStransferHomeDirectoryTypeLogical:
                return @"LOGICAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferTag class]];
}

@end

@implementation AWStransferCreateUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWStransferDeleteServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWStransferDeleteSshPublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"sshPublicKeyId" : @"SshPublicKeyId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWStransferDeleteUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWStransferDescribeServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWStransferDescribeServerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"server" : @"Server",
             };
}

+ (NSValueTransformer *)serverJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStransferDescribedServer class]];
}

@end

@implementation AWStransferDescribeUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWStransferDescribeUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStransferDescribedUser class]];
}

@end

@implementation AWStransferDescribedServer

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStransferEndpointDetails class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWStransferEndpointTypePublic);
        }
        if ([value caseInsensitiveCompare:@"VPC"] == NSOrderedSame) {
            return @(AWStransferEndpointTypeVpc);
        }
        if ([value caseInsensitiveCompare:@"VPC_ENDPOINT"] == NSOrderedSame) {
            return @(AWStransferEndpointTypeVpcEndpoint);
        }
        return @(AWStransferEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferEndpointTypePublic:
                return @"PUBLIC";
            case AWStransferEndpointTypeVpc:
                return @"VPC";
            case AWStransferEndpointTypeVpcEndpoint:
                return @"VPC_ENDPOINT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)identityProviderDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStransferIdentityProviderDetails class]];
}

+ (NSValueTransformer *)identityProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_MANAGED"] == NSOrderedSame) {
            return @(AWStransferIdentityProviderTypeServiceManaged);
        }
        if ([value caseInsensitiveCompare:@"API_GATEWAY"] == NSOrderedSame) {
            return @(AWStransferIdentityProviderTypeApiGateway);
        }
        return @(AWStransferIdentityProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferIdentityProviderTypeServiceManaged:
                return @"SERVICE_MANAGED";
            case AWStransferIdentityProviderTypeApiGateway:
                return @"API_GATEWAY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFFLINE"] == NSOrderedSame) {
            return @(AWStransferStateOffline);
        }
        if ([value caseInsensitiveCompare:@"ONLINE"] == NSOrderedSame) {
            return @(AWStransferStateOnline);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWStransferStateStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWStransferStateStopping);
        }
        if ([value caseInsensitiveCompare:@"START_FAILED"] == NSOrderedSame) {
            return @(AWStransferStateStartFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_FAILED"] == NSOrderedSame) {
            return @(AWStransferStateStopFailed);
        }
        return @(AWStransferStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferStateOffline:
                return @"OFFLINE";
            case AWStransferStateOnline:
                return @"ONLINE";
            case AWStransferStateStarting:
                return @"STARTING";
            case AWStransferStateStopping:
                return @"STOPPING";
            case AWStransferStateStartFailed:
                return @"START_FAILED";
            case AWStransferStateStopFailed:
                return @"STOP_FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferTag class]];
}

@end

@implementation AWStransferDescribedUser

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferHomeDirectoryMapEntry class]];
}

+ (NSValueTransformer *)homeDirectoryTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PATH"] == NSOrderedSame) {
            return @(AWStransferHomeDirectoryTypePath);
        }
        if ([value caseInsensitiveCompare:@"LOGICAL"] == NSOrderedSame) {
            return @(AWStransferHomeDirectoryTypeLogical);
        }
        return @(AWStransferHomeDirectoryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferHomeDirectoryTypePath:
                return @"PATH";
            case AWStransferHomeDirectoryTypeLogical:
                return @"LOGICAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sshPublicKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferSshPublicKey class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferTag class]];
}

@end

@implementation AWStransferEndpointDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressAllocationIds" : @"AddressAllocationIds",
             @"subnetIds" : @"SubnetIds",
             @"vpcEndpointId" : @"VpcEndpointId",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWStransferHomeDirectoryMapEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entry" : @"Entry",
             @"target" : @"Target",
             };
}

@end

@implementation AWStransferIdentityProviderDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invocationRole" : @"InvocationRole",
             @"url" : @"Url",
             };
}

@end

@implementation AWStransferImportSshPublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"sshPublicKeyBody" : @"SshPublicKeyBody",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWStransferImportSshPublicKeyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"sshPublicKeyId" : @"SshPublicKeyId",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWStransferListServersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWStransferListServersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"servers" : @"Servers",
             };
}

+ (NSValueTransformer *)serversJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferListedServer class]];
}

@end

@implementation AWStransferListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWStransferListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferTag class]];
}

@end

@implementation AWStransferListUsersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWStransferListUsersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"serverId" : @"ServerId",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferListedUser class]];
}

@end

@implementation AWStransferListedServer

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
            return @(AWStransferEndpointTypePublic);
        }
        if ([value caseInsensitiveCompare:@"VPC"] == NSOrderedSame) {
            return @(AWStransferEndpointTypeVpc);
        }
        if ([value caseInsensitiveCompare:@"VPC_ENDPOINT"] == NSOrderedSame) {
            return @(AWStransferEndpointTypeVpcEndpoint);
        }
        return @(AWStransferEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferEndpointTypePublic:
                return @"PUBLIC";
            case AWStransferEndpointTypeVpc:
                return @"VPC";
            case AWStransferEndpointTypeVpcEndpoint:
                return @"VPC_ENDPOINT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)identityProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_MANAGED"] == NSOrderedSame) {
            return @(AWStransferIdentityProviderTypeServiceManaged);
        }
        if ([value caseInsensitiveCompare:@"API_GATEWAY"] == NSOrderedSame) {
            return @(AWStransferIdentityProviderTypeApiGateway);
        }
        return @(AWStransferIdentityProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferIdentityProviderTypeServiceManaged:
                return @"SERVICE_MANAGED";
            case AWStransferIdentityProviderTypeApiGateway:
                return @"API_GATEWAY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFFLINE"] == NSOrderedSame) {
            return @(AWStransferStateOffline);
        }
        if ([value caseInsensitiveCompare:@"ONLINE"] == NSOrderedSame) {
            return @(AWStransferStateOnline);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWStransferStateStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWStransferStateStopping);
        }
        if ([value caseInsensitiveCompare:@"START_FAILED"] == NSOrderedSame) {
            return @(AWStransferStateStartFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_FAILED"] == NSOrderedSame) {
            return @(AWStransferStateStopFailed);
        }
        return @(AWStransferStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferStateOffline:
                return @"OFFLINE";
            case AWStransferStateOnline:
                return @"ONLINE";
            case AWStransferStateStarting:
                return @"STARTING";
            case AWStransferStateStopping:
                return @"STOPPING";
            case AWStransferStateStartFailed:
                return @"START_FAILED";
            case AWStransferStateStopFailed:
                return @"STOP_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWStransferListedUser

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
            return @(AWStransferHomeDirectoryTypePath);
        }
        if ([value caseInsensitiveCompare:@"LOGICAL"] == NSOrderedSame) {
            return @(AWStransferHomeDirectoryTypeLogical);
        }
        return @(AWStransferHomeDirectoryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferHomeDirectoryTypePath:
                return @"PATH";
            case AWStransferHomeDirectoryTypeLogical:
                return @"LOGICAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWStransferSshPublicKey

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

@implementation AWStransferStartServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWStransferStopServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWStransferTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWStransferTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferTag class]];
}

@end

@implementation AWStransferTestIdentityProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"serverProtocol" : @"ServerProtocol",
             @"userName" : @"UserName",
             @"userPassword" : @"UserPassword",
             };
}

+ (NSValueTransformer *)serverProtocolJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SFTP"] == NSOrderedSame) {
            return @(AWStransferProtocolsSftp);
        }
        if ([value caseInsensitiveCompare:@"FTP"] == NSOrderedSame) {
            return @(AWStransferProtocolsFtp);
        }
        if ([value caseInsensitiveCompare:@"FTPS"] == NSOrderedSame) {
            return @(AWStransferProtocolsFtps);
        }
        return @(AWStransferProtocolsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferProtocolsSftp:
                return @"SFTP";
            case AWStransferProtocolsFtp:
                return @"FTP";
            case AWStransferProtocolsFtps:
                return @"FTPS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWStransferTestIdentityProviderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"response" : @"Response",
             @"statusCode" : @"StatusCode",
             @"url" : @"Url",
             };
}

@end

@implementation AWStransferUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWStransferUpdateServerRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStransferEndpointDetails class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWStransferEndpointTypePublic);
        }
        if ([value caseInsensitiveCompare:@"VPC"] == NSOrderedSame) {
            return @(AWStransferEndpointTypeVpc);
        }
        if ([value caseInsensitiveCompare:@"VPC_ENDPOINT"] == NSOrderedSame) {
            return @(AWStransferEndpointTypeVpcEndpoint);
        }
        return @(AWStransferEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferEndpointTypePublic:
                return @"PUBLIC";
            case AWStransferEndpointTypeVpc:
                return @"VPC";
            case AWStransferEndpointTypeVpcEndpoint:
                return @"VPC_ENDPOINT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)identityProviderDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStransferIdentityProviderDetails class]];
}

@end

@implementation AWStransferUpdateServerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             };
}

@end

@implementation AWStransferUpdateUserRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStransferHomeDirectoryMapEntry class]];
}

+ (NSValueTransformer *)homeDirectoryTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PATH"] == NSOrderedSame) {
            return @(AWStransferHomeDirectoryTypePath);
        }
        if ([value caseInsensitiveCompare:@"LOGICAL"] == NSOrderedSame) {
            return @(AWStransferHomeDirectoryTypeLogical);
        }
        return @(AWStransferHomeDirectoryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStransferHomeDirectoryTypePath:
                return @"PATH";
            case AWStransferHomeDirectoryTypeLogical:
                return @"LOGICAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWStransferUpdateUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverId" : @"ServerId",
             @"userName" : @"UserName",
             };
}

@end
