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

#import "AWSAppmeshModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSAppmeshErrorDomain = @"com.amazonaws.AWSAppmeshErrorDomain";

@implementation AWSAppmeshVirtualRouterListener

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portMapping" : @"portMapping",
             };
}

+ (NSValueTransformer *)portMappingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshPortMapping class]];
}

@end

@implementation AWSAppmeshGrpcRetryPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grpcRetryEvents" : @"grpcRetryEvents",
             @"httpRetryEvents" : @"httpRetryEvents",
             @"maxRetries" : @"maxRetries",
             @"perRetryTimeout" : @"perRetryTimeout",
             @"tcpRetryEvents" : @"tcpRetryEvents",
             };
}

+ (NSValueTransformer *)perRetryTimeoutJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshDuration class]];
}

@end

@implementation AWSAppmeshCreateVirtualNodeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualNode" : @"virtualNode",
             };
}

+ (NSValueTransformer *)virtualNodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualNodeData class]];
}

@end

@implementation AWSAppmeshLogging

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessLog" : @"accessLog",
             };
}

+ (NSValueTransformer *)accessLogJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshAccessLog class]];
}

@end

@implementation AWSAppmeshUpdateVirtualRouterOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualRouter" : @"virtualRouter",
             };
}

+ (NSValueTransformer *)virtualRouterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualRouterData class]];
}

@end

@implementation AWSAppmeshListVirtualRoutersOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"virtualRouters" : @"virtualRouters",
             };
}

+ (NSValueTransformer *)virtualRoutersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshVirtualRouterRef class]];
}

@end

@implementation AWSAppmeshResourceMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"meshOwner" : @"meshOwner",
             @"resourceOwner" : @"resourceOwner",
             @"uid" : @"uid",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAppmeshUpdateVirtualNodeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualNode" : @"virtualNode",
             };
}

+ (NSValueTransformer *)virtualNodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualNodeData class]];
}

@end

@implementation AWSAppmeshListRoutesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"routes" : @"routes",
             };
}

+ (NSValueTransformer *)routesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshRouteRef class]];
}

@end

@implementation AWSAppmeshVirtualServiceBackend

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientPolicy" : @"clientPolicy",
             @"virtualServiceName" : @"virtualServiceName",
             };
}

+ (NSValueTransformer *)clientPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshClientPolicy class]];
}

@end

@implementation AWSAppmeshHealthCheckPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthyThreshold" : @"healthyThreshold",
             @"intervalMillis" : @"intervalMillis",
             @"path" : @"path",
             @"port" : @"port",
             @"protocols" : @"protocol",
             @"timeoutMillis" : @"timeoutMillis",
             @"unhealthyThreshold" : @"unhealthyThreshold",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"grpc"] == NSOrderedSame) {
            return @(AWSAppmeshPortProtocolGrpc);
        }
        if ([value caseInsensitiveCompare:@"http"] == NSOrderedSame) {
            return @(AWSAppmeshPortProtocolHTTP);
        }
        if ([value caseInsensitiveCompare:@"http2"] == NSOrderedSame) {
            return @(AWSAppmeshPortProtocolHttp2);
        }
        if ([value caseInsensitiveCompare:@"tcp"] == NSOrderedSame) {
            return @(AWSAppmeshPortProtocolTcp);
        }
        return @(AWSAppmeshPortProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshPortProtocolGrpc:
                return @"grpc";
            case AWSAppmeshPortProtocolHTTP:
                return @"http";
            case AWSAppmeshPortProtocolHttp2:
                return @"http2";
            case AWSAppmeshPortProtocolTcp:
                return @"tcp";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppmeshEgressFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_ALL"] == NSOrderedSame) {
            return @(AWSAppmeshEgressFilterTypeAllowAll);
        }
        if ([value caseInsensitiveCompare:@"DROP_ALL"] == NSOrderedSame) {
            return @(AWSAppmeshEgressFilterTypeDropAll);
        }
        return @(AWSAppmeshEgressFilterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshEgressFilterTypeAllowAll:
                return @"ALLOW_ALL";
            case AWSAppmeshEgressFilterTypeDropAll:
                return @"DROP_ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppmeshClientPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tls" : @"tls",
             };
}

+ (NSValueTransformer *)tlsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshClientPolicyTls class]];
}

@end

@implementation AWSAppmeshDescribeVirtualServiceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualService" : @"virtualService",
             };
}

+ (NSValueTransformer *)virtualServiceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualServiceData class]];
}

@end

@implementation AWSAppmeshDescribeVirtualNodeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualNode" : @"virtualNode",
             };
}

+ (NSValueTransformer *)virtualNodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualNodeData class]];
}

@end

@implementation AWSAppmeshCreateRouteOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"route" : @"route",
             };
}

+ (NSValueTransformer *)routeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshRouteData class]];
}

@end

@implementation AWSAppmeshDnsServiceDiscovery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostname" : @"hostname",
             };
}

@end

@implementation AWSAppmeshDeleteRouteInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"routeName" : @"routeName",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

@end

@implementation AWSAppmeshVirtualNodeData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"metadata" : @"metadata",
             @"spec" : @"spec",
             @"status" : @"status",
             @"virtualNodeName" : @"virtualNodeName",
             };
}

+ (NSValueTransformer *)metadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshResourceMetadata class]];
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualNodeSpec class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualNodeStatus class]];
}

@end

@implementation AWSAppmeshUntagResourceOutput

@end

@implementation AWSAppmeshBackend

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualService" : @"virtualService",
             };
}

+ (NSValueTransformer *)virtualServiceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualServiceBackend class]];
}

@end

@implementation AWSAppmeshListMeshesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAppmeshVirtualRouterData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"metadata" : @"metadata",
             @"spec" : @"spec",
             @"status" : @"status",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

+ (NSValueTransformer *)metadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshResourceMetadata class]];
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualRouterSpec class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualRouterStatus class]];
}

@end

@implementation AWSAppmeshUpdateMeshInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"meshName" : @"meshName",
             @"spec" : @"spec",
             };
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshMeshSpec class]];
}

@end

@implementation AWSAppmeshCreateVirtualRouterInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"spec" : @"spec",
             @"tags" : @"tags",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualRouterSpec class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshTagRef class]];
}

@end

@implementation AWSAppmeshDescribeVirtualRouterOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualRouter" : @"virtualRouter",
             };
}

+ (NSValueTransformer *)virtualRouterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualRouterData class]];
}

@end

@implementation AWSAppmeshCreateMeshOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mesh" : @"mesh",
             };
}

+ (NSValueTransformer *)meshJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshMeshData class]];
}

@end

@implementation AWSAppmeshCreateVirtualRouterOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualRouter" : @"virtualRouter",
             };
}

+ (NSValueTransformer *)virtualRouterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualRouterData class]];
}

@end

@implementation AWSAppmeshVirtualServiceStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSAppmeshVirtualServiceStatusCodeActive);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSAppmeshVirtualServiceStatusCodeDeleted);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSAppmeshVirtualServiceStatusCodeInactive);
        }
        return @(AWSAppmeshVirtualServiceStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshVirtualServiceStatusCodeActive:
                return @"ACTIVE";
            case AWSAppmeshVirtualServiceStatusCodeDeleted:
                return @"DELETED";
            case AWSAppmeshVirtualServiceStatusCodeInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppmeshListenerTlsCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acm" : @"acm",
             @"file" : @"file",
             };
}

+ (NSValueTransformer *)acmJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshListenerTlsAcmCertificate class]];
}

+ (NSValueTransformer *)fileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshListenerTlsFileCertificate class]];
}

@end

@implementation AWSAppmeshVirtualRouterSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listeners" : @"listeners",
             };
}

+ (NSValueTransformer *)listenersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshVirtualRouterListener class]];
}

@end

@implementation AWSAppmeshVirtualNodeSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backendDefaults" : @"backendDefaults",
             @"backends" : @"backends",
             @"listeners" : @"listeners",
             @"logging" : @"logging",
             @"serviceDiscovery" : @"serviceDiscovery",
             };
}

+ (NSValueTransformer *)backendDefaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshBackendDefaults class]];
}

+ (NSValueTransformer *)backendsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshBackend class]];
}

+ (NSValueTransformer *)listenersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshListener class]];
}

+ (NSValueTransformer *)loggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshLogging class]];
}

+ (NSValueTransformer *)serviceDiscoveryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshServiceDiscovery class]];
}

@end

@implementation AWSAppmeshListMeshesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshes" : @"meshes",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)meshesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshMeshRef class]];
}

@end

@implementation AWSAppmeshListenerTimeout

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grpc" : @"grpc",
             @"http" : @"http",
             @"http2" : @"http2",
             @"tcp" : @"tcp",
             };
}

+ (NSValueTransformer *)grpcJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshGrpcTimeout class]];
}

+ (NSValueTransformer *)httpJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshHttpTimeout class]];
}

+ (NSValueTransformer *)http2JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshHttpTimeout class]];
}

+ (NSValueTransformer *)tcpJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshTcpTimeout class]];
}

@end

@implementation AWSAppmeshTlsValidationContextTrust

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acm" : @"acm",
             @"file" : @"file",
             };
}

+ (NSValueTransformer *)acmJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshTlsValidationContextAcmTrust class]];
}

+ (NSValueTransformer *)fileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshTlsValidationContextFileTrust class]];
}

@end

@implementation AWSAppmeshPortMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"port" : @"port",
             @"protocols" : @"protocol",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"grpc"] == NSOrderedSame) {
            return @(AWSAppmeshPortProtocolGrpc);
        }
        if ([value caseInsensitiveCompare:@"http"] == NSOrderedSame) {
            return @(AWSAppmeshPortProtocolHTTP);
        }
        if ([value caseInsensitiveCompare:@"http2"] == NSOrderedSame) {
            return @(AWSAppmeshPortProtocolHttp2);
        }
        if ([value caseInsensitiveCompare:@"tcp"] == NSOrderedSame) {
            return @(AWSAppmeshPortProtocolTcp);
        }
        return @(AWSAppmeshPortProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshPortProtocolGrpc:
                return @"grpc";
            case AWSAppmeshPortProtocolHTTP:
                return @"http";
            case AWSAppmeshPortProtocolHttp2:
                return @"http2";
            case AWSAppmeshPortProtocolTcp:
                return @"tcp";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppmeshListVirtualServicesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"virtualServices" : @"virtualServices",
             };
}

+ (NSValueTransformer *)virtualServicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshVirtualServiceRef class]];
}

@end

@implementation AWSAppmeshWeightedTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualNode" : @"virtualNode",
             @"weight" : @"weight",
             };
}

@end

@implementation AWSAppmeshRouteRef

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"resourceOwner" : @"resourceOwner",
             @"routeName" : @"routeName",
             @"version" : @"version",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAppmeshDeleteVirtualNodeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"virtualNodeName" : @"virtualNodeName",
             };
}

@end

@implementation AWSAppmeshRouteData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"metadata" : @"metadata",
             @"routeName" : @"routeName",
             @"spec" : @"spec",
             @"status" : @"status",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

+ (NSValueTransformer *)metadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshResourceMetadata class]];
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshRouteSpec class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshRouteStatus class]];
}

@end

@implementation AWSAppmeshTlsValidationContextAcmTrust

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateAuthorityArns" : @"certificateAuthorityArns",
             };
}

@end

@implementation AWSAppmeshHeaderMatchMethod

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exact" : @"exact",
             @"prefix" : @"prefix",
             @"range" : @"range",
             @"regex" : @"regex",
             @"suffix" : @"suffix",
             };
}

+ (NSValueTransformer *)rangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshMatchRange class]];
}

@end

@implementation AWSAppmeshDeleteMeshOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mesh" : @"mesh",
             };
}

+ (NSValueTransformer *)meshJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshMeshData class]];
}

@end

@implementation AWSAppmeshTagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshTagRef class]];
}

@end

@implementation AWSAppmeshVirtualServiceProvider

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualNode" : @"virtualNode",
             @"virtualRouter" : @"virtualRouter",
             };
}

+ (NSValueTransformer *)virtualNodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualNodeServiceProvider class]];
}

+ (NSValueTransformer *)virtualRouterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualRouterServiceProvider class]];
}

@end

@implementation AWSAppmeshGrpcRouteMatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metadata" : @"metadata",
             @"methodName" : @"methodName",
             @"serviceName" : @"serviceName",
             };
}

+ (NSValueTransformer *)metadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshGrpcRouteMetadata class]];
}

@end

@implementation AWSAppmeshAwsCloudMapServiceDiscovery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"namespaceName" : @"namespaceName",
             @"serviceName" : @"serviceName",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshAwsCloudMapInstanceAttribute class]];
}

@end

@implementation AWSAppmeshUpdateVirtualServiceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualService" : @"virtualService",
             };
}

+ (NSValueTransformer *)virtualServiceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualServiceData class]];
}

@end

@implementation AWSAppmeshMeshStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSAppmeshMeshStatusCodeActive);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSAppmeshMeshStatusCodeDeleted);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSAppmeshMeshStatusCodeInactive);
        }
        return @(AWSAppmeshMeshStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshMeshStatusCodeActive:
                return @"ACTIVE";
            case AWSAppmeshMeshStatusCodeDeleted:
                return @"DELETED";
            case AWSAppmeshMeshStatusCodeInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppmeshCreateVirtualNodeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"spec" : @"spec",
             @"tags" : @"tags",
             @"virtualNodeName" : @"virtualNodeName",
             };
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualNodeSpec class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshTagRef class]];
}

@end

@implementation AWSAppmeshRouteSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grpcRoute" : @"grpcRoute",
             @"http2Route" : @"http2Route",
             @"httpRoute" : @"httpRoute",
             @"priority" : @"priority",
             @"tcpRoute" : @"tcpRoute",
             };
}

+ (NSValueTransformer *)grpcRouteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshGrpcRoute class]];
}

+ (NSValueTransformer *)http2RouteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshHttpRoute class]];
}

+ (NSValueTransformer *)httpRouteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshHttpRoute class]];
}

+ (NSValueTransformer *)tcpRouteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshTcpRoute class]];
}

@end

@implementation AWSAppmeshCreateVirtualServiceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualService" : @"virtualService",
             };
}

+ (NSValueTransformer *)virtualServiceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualServiceData class]];
}

@end

@implementation AWSAppmeshFileAccessLog

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"path" : @"path",
             };
}

@end

@implementation AWSAppmeshVirtualRouterServiceProvider

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualRouterName" : @"virtualRouterName",
             };
}

@end

@implementation AWSAppmeshHttpTimeout

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"idle" : @"idle",
             @"perRequest" : @"perRequest",
             };
}

+ (NSValueTransformer *)idleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshDuration class]];
}

+ (NSValueTransformer *)perRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshDuration class]];
}

@end

@implementation AWSAppmeshDeleteVirtualServiceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"virtualServiceName" : @"virtualServiceName",
             };
}

@end

@implementation AWSAppmeshTlsValidationContext

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trust" : @"trust",
             };
}

+ (NSValueTransformer *)trustJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshTlsValidationContextTrust class]];
}

@end

@implementation AWSAppmeshDeleteVirtualRouterOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualRouter" : @"virtualRouter",
             };
}

+ (NSValueTransformer *)virtualRouterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualRouterData class]];
}

@end

@implementation AWSAppmeshDeleteVirtualNodeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualNode" : @"virtualNode",
             };
}

+ (NSValueTransformer *)virtualNodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualNodeData class]];
}

@end

@implementation AWSAppmeshUpdateVirtualNodeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"spec" : @"spec",
             @"virtualNodeName" : @"virtualNodeName",
             };
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualNodeSpec class]];
}

@end

@implementation AWSAppmeshListenerTls

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"certificate",
             @"mode" : @"mode",
             };
}

+ (NSValueTransformer *)certificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshListenerTlsCertificate class]];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSAppmeshListenerTlsModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"PERMISSIVE"] == NSOrderedSame) {
            return @(AWSAppmeshListenerTlsModePermissive);
        }
        if ([value caseInsensitiveCompare:@"STRICT"] == NSOrderedSame) {
            return @(AWSAppmeshListenerTlsModeStrict);
        }
        return @(AWSAppmeshListenerTlsModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshListenerTlsModeDisabled:
                return @"DISABLED";
            case AWSAppmeshListenerTlsModePermissive:
                return @"PERMISSIVE";
            case AWSAppmeshListenerTlsModeStrict:
                return @"STRICT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppmeshDeleteMeshInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             };
}

@end

@implementation AWSAppmeshCreateVirtualServiceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"spec" : @"spec",
             @"tags" : @"tags",
             @"virtualServiceName" : @"virtualServiceName",
             };
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualServiceSpec class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshTagRef class]];
}

@end

@implementation AWSAppmeshUpdateVirtualRouterInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"spec" : @"spec",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualRouterSpec class]];
}

@end

@implementation AWSAppmeshListTagsForResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSAppmeshDescribeMeshOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mesh" : @"mesh",
             };
}

+ (NSValueTransformer *)meshJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshMeshData class]];
}

@end

@implementation AWSAppmeshDeleteVirtualRouterInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

@end

@implementation AWSAppmeshDescribeRouteInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"routeName" : @"routeName",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

@end

@implementation AWSAppmeshDeleteRouteOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"route" : @"route",
             };
}

+ (NSValueTransformer *)routeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshRouteData class]];
}

@end

@implementation AWSAppmeshUpdateVirtualServiceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"spec" : @"spec",
             @"virtualServiceName" : @"virtualServiceName",
             };
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualServiceSpec class]];
}

@end

@implementation AWSAppmeshUpdateRouteOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"route" : @"route",
             };
}

+ (NSValueTransformer *)routeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshRouteData class]];
}

@end

@implementation AWSAppmeshHttpRouteAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"weightedTargets" : @"weightedTargets",
             };
}

+ (NSValueTransformer *)weightedTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshWeightedTarget class]];
}

@end

@implementation AWSAppmeshListRoutesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"nextToken" : @"nextToken",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

@end

@implementation AWSAppmeshVirtualServiceRef

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"resourceOwner" : @"resourceOwner",
             @"version" : @"version",
             @"virtualServiceName" : @"virtualServiceName",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAppmeshGrpcTimeout

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"idle" : @"idle",
             @"perRequest" : @"perRequest",
             };
}

+ (NSValueTransformer *)idleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshDuration class]];
}

+ (NSValueTransformer *)perRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshDuration class]];
}

@end

@implementation AWSAppmeshVirtualNodeStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSAppmeshVirtualNodeStatusCodeActive);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSAppmeshVirtualNodeStatusCodeDeleted);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSAppmeshVirtualNodeStatusCodeInactive);
        }
        return @(AWSAppmeshVirtualNodeStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshVirtualNodeStatusCodeActive:
                return @"ACTIVE";
            case AWSAppmeshVirtualNodeStatusCodeDeleted:
                return @"DELETED";
            case AWSAppmeshVirtualNodeStatusCodeInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppmeshVirtualRouterRef

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"resourceOwner" : @"resourceOwner",
             @"version" : @"version",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAppmeshVirtualServiceData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"metadata" : @"metadata",
             @"spec" : @"spec",
             @"status" : @"status",
             @"virtualServiceName" : @"virtualServiceName",
             };
}

+ (NSValueTransformer *)metadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshResourceMetadata class]];
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualServiceSpec class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualServiceStatus class]];
}

@end

@implementation AWSAppmeshHttpRouteHeader

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invert" : @"invert",
             @"match" : @"match",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)matchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshHeaderMatchMethod class]];
}

@end

@implementation AWSAppmeshVirtualNodeRef

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"resourceOwner" : @"resourceOwner",
             @"version" : @"version",
             @"virtualNodeName" : @"virtualNodeName",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAppmeshCreateMeshInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"meshName" : @"meshName",
             @"spec" : @"spec",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshMeshSpec class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshTagRef class]];
}

@end

@implementation AWSAppmeshGrpcRouteAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"weightedTargets" : @"weightedTargets",
             };
}

+ (NSValueTransformer *)weightedTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshWeightedTarget class]];
}

@end

@implementation AWSAppmeshUpdateMeshOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mesh" : @"mesh",
             };
}

+ (NSValueTransformer *)meshJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshMeshData class]];
}

@end

@implementation AWSAppmeshGrpcRouteMetadataMatchMethod

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exact" : @"exact",
             @"prefix" : @"prefix",
             @"range" : @"range",
             @"regex" : @"regex",
             @"suffix" : @"suffix",
             };
}

+ (NSValueTransformer *)rangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshMatchRange class]];
}

@end

@implementation AWSAppmeshDescribeVirtualServiceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"virtualServiceName" : @"virtualServiceName",
             };
}

@end

@implementation AWSAppmeshAwsCloudMapInstanceAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSAppmeshVirtualServiceSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"provider" : @"provider",
             };
}

+ (NSValueTransformer *)providerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualServiceProvider class]];
}

@end

@implementation AWSAppmeshMatchRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"end" : @"end",
             @"start" : @"start",
             };
}

@end

@implementation AWSAppmeshTcpRoute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             @"timeout" : @"timeout",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshTcpRouteAction class]];
}

+ (NSValueTransformer *)timeoutJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshTcpTimeout class]];
}

@end

@implementation AWSAppmeshListVirtualRoutersInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAppmeshListVirtualServicesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAppmeshAccessLog

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"file" : @"file",
             };
}

+ (NSValueTransformer *)fileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshFileAccessLog class]];
}

@end

@implementation AWSAppmeshListVirtualNodesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAppmeshDuration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unit" : @"unit",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ms"] == NSOrderedSame) {
            return @(AWSAppmeshDurationUnitMs);
        }
        if ([value caseInsensitiveCompare:@"s"] == NSOrderedSame) {
            return @(AWSAppmeshDurationUnitS);
        }
        return @(AWSAppmeshDurationUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshDurationUnitMs:
                return @"ms";
            case AWSAppmeshDurationUnitS:
                return @"s";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppmeshDescribeRouteOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"route" : @"route",
             };
}

+ (NSValueTransformer *)routeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshRouteData class]];
}

@end

@implementation AWSAppmeshHttpRouteMatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"headers" : @"headers",
             @"method" : @"method",
             @"prefix" : @"prefix",
             @"scheme" : @"scheme",
             };
}

+ (NSValueTransformer *)headersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshHttpRouteHeader class]];
}

+ (NSValueTransformer *)methodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONNECT"] == NSOrderedSame) {
            return @(AWSAppmeshHttpMethodConnect);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSAppmeshHttpMethodDelete);
        }
        if ([value caseInsensitiveCompare:@"GET"] == NSOrderedSame) {
            return @(AWSAppmeshHttpMethodGet);
        }
        if ([value caseInsensitiveCompare:@"HEAD"] == NSOrderedSame) {
            return @(AWSAppmeshHttpMethodHead);
        }
        if ([value caseInsensitiveCompare:@"OPTIONS"] == NSOrderedSame) {
            return @(AWSAppmeshHttpMethodOptions);
        }
        if ([value caseInsensitiveCompare:@"PATCH"] == NSOrderedSame) {
            return @(AWSAppmeshHttpMethodPatch);
        }
        if ([value caseInsensitiveCompare:@"POST"] == NSOrderedSame) {
            return @(AWSAppmeshHttpMethodPost);
        }
        if ([value caseInsensitiveCompare:@"PUT"] == NSOrderedSame) {
            return @(AWSAppmeshHttpMethodPut);
        }
        if ([value caseInsensitiveCompare:@"TRACE"] == NSOrderedSame) {
            return @(AWSAppmeshHttpMethodTrace);
        }
        return @(AWSAppmeshHttpMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshHttpMethodConnect:
                return @"CONNECT";
            case AWSAppmeshHttpMethodDelete:
                return @"DELETE";
            case AWSAppmeshHttpMethodGet:
                return @"GET";
            case AWSAppmeshHttpMethodHead:
                return @"HEAD";
            case AWSAppmeshHttpMethodOptions:
                return @"OPTIONS";
            case AWSAppmeshHttpMethodPatch:
                return @"PATCH";
            case AWSAppmeshHttpMethodPost:
                return @"POST";
            case AWSAppmeshHttpMethodPut:
                return @"PUT";
            case AWSAppmeshHttpMethodTrace:
                return @"TRACE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)schemeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"http"] == NSOrderedSame) {
            return @(AWSAppmeshHttpSchemeHTTP);
        }
        if ([value caseInsensitiveCompare:@"https"] == NSOrderedSame) {
            return @(AWSAppmeshHttpSchemeHTTPS);
        }
        return @(AWSAppmeshHttpSchemeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshHttpSchemeHTTP:
                return @"http";
            case AWSAppmeshHttpSchemeHTTPS:
                return @"https";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppmeshTagRef

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSAppmeshMeshRef

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"resourceOwner" : @"resourceOwner",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAppmeshMeshData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"metadata" : @"metadata",
             @"spec" : @"spec",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)metadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshResourceMetadata class]];
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshMeshSpec class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshMeshStatus class]];
}

@end

@implementation AWSAppmeshVirtualRouterStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSAppmeshVirtualRouterStatusCodeActive);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSAppmeshVirtualRouterStatusCodeDeleted);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSAppmeshVirtualRouterStatusCodeInactive);
        }
        return @(AWSAppmeshVirtualRouterStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshVirtualRouterStatusCodeActive:
                return @"ACTIVE";
            case AWSAppmeshVirtualRouterStatusCodeDeleted:
                return @"DELETED";
            case AWSAppmeshVirtualRouterStatusCodeInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppmeshTcpRouteAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"weightedTargets" : @"weightedTargets",
             };
}

+ (NSValueTransformer *)weightedTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshWeightedTarget class]];
}

@end

@implementation AWSAppmeshDescribeVirtualNodeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"virtualNodeName" : @"virtualNodeName",
             };
}

@end

@implementation AWSAppmeshRouteStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSAppmeshRouteStatusCodeActive);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSAppmeshRouteStatusCodeDeleted);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSAppmeshRouteStatusCodeInactive);
        }
        return @(AWSAppmeshRouteStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppmeshRouteStatusCodeActive:
                return @"ACTIVE";
            case AWSAppmeshRouteStatusCodeDeleted:
                return @"DELETED";
            case AWSAppmeshRouteStatusCodeInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppmeshListener

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheck" : @"healthCheck",
             @"portMapping" : @"portMapping",
             @"timeout" : @"timeout",
             @"tls" : @"tls",
             };
}

+ (NSValueTransformer *)healthCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshHealthCheckPolicy class]];
}

+ (NSValueTransformer *)portMappingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshPortMapping class]];
}

+ (NSValueTransformer *)timeoutJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshListenerTimeout class]];
}

+ (NSValueTransformer *)tlsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshListenerTls class]];
}

@end

@implementation AWSAppmeshGrpcRoute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             @"match" : @"match",
             @"retryPolicy" : @"retryPolicy",
             @"timeout" : @"timeout",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshGrpcRouteAction class]];
}

+ (NSValueTransformer *)matchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshGrpcRouteMatch class]];
}

+ (NSValueTransformer *)retryPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshGrpcRetryPolicy class]];
}

+ (NSValueTransformer *)timeoutJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshGrpcTimeout class]];
}

@end

@implementation AWSAppmeshClientPolicyTls

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enforce" : @"enforce",
             @"ports" : @"ports",
             @"validation" : @"validation",
             };
}

+ (NSValueTransformer *)validationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshTlsValidationContext class]];
}

@end

@implementation AWSAppmeshDeleteVirtualServiceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualService" : @"virtualService",
             };
}

+ (NSValueTransformer *)virtualServiceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshVirtualServiceData class]];
}

@end

@implementation AWSAppmeshVirtualNodeServiceProvider

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualNodeName" : @"virtualNodeName",
             };
}

@end

@implementation AWSAppmeshBackendDefaults

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientPolicy" : @"clientPolicy",
             };
}

+ (NSValueTransformer *)clientPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshClientPolicy class]];
}

@end

@implementation AWSAppmeshListenerTlsFileCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateChain" : @"certificateChain",
             @"privateKey" : @"privateKey",
             };
}

@end

@implementation AWSAppmeshHttpRetryPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"httpRetryEvents" : @"httpRetryEvents",
             @"maxRetries" : @"maxRetries",
             @"perRetryTimeout" : @"perRetryTimeout",
             @"tcpRetryEvents" : @"tcpRetryEvents",
             };
}

+ (NSValueTransformer *)perRetryTimeoutJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshDuration class]];
}

@end

@implementation AWSAppmeshDescribeVirtualRouterInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

@end

@implementation AWSAppmeshTagResourceOutput

@end

@implementation AWSAppmeshTlsValidationContextFileTrust

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateChain" : @"certificateChain",
             };
}

@end

@implementation AWSAppmeshGrpcRouteMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invert" : @"invert",
             @"match" : @"match",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)matchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshGrpcRouteMetadataMatchMethod class]];
}

@end

@implementation AWSAppmeshCreateRouteInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"routeName" : @"routeName",
             @"spec" : @"spec",
             @"tags" : @"tags",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshRouteSpec class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshTagRef class]];
}

@end

@implementation AWSAppmeshTcpTimeout

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"idle" : @"idle",
             };
}

+ (NSValueTransformer *)idleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshDuration class]];
}

@end

@implementation AWSAppmeshUpdateRouteInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             @"routeName" : @"routeName",
             @"spec" : @"spec",
             @"virtualRouterName" : @"virtualRouterName",
             };
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshRouteSpec class]];
}

@end

@implementation AWSAppmeshHttpRoute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             @"match" : @"match",
             @"retryPolicy" : @"retryPolicy",
             @"timeout" : @"timeout",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshHttpRouteAction class]];
}

+ (NSValueTransformer *)matchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshHttpRouteMatch class]];
}

+ (NSValueTransformer *)retryPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshHttpRetryPolicy class]];
}

+ (NSValueTransformer *)timeoutJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshHttpTimeout class]];
}

@end

@implementation AWSAppmeshDescribeMeshInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meshName" : @"meshName",
             @"meshOwner" : @"meshOwner",
             };
}

@end

@implementation AWSAppmeshMeshSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"egressFilter" : @"egressFilter",
             };
}

+ (NSValueTransformer *)egressFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshEgressFilter class]];
}

@end

@implementation AWSAppmeshListTagsForResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshTagRef class]];
}

@end

@implementation AWSAppmeshServiceDiscovery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsCloudMap" : @"awsCloudMap",
             @"dns" : @"dns",
             };
}

+ (NSValueTransformer *)awsCloudMapJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshAwsCloudMapServiceDiscovery class]];
}

+ (NSValueTransformer *)dnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAppmeshDnsServiceDiscovery class]];
}

@end

@implementation AWSAppmeshListVirtualNodesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"virtualNodes" : @"virtualNodes",
             };
}

+ (NSValueTransformer *)virtualNodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppmeshVirtualNodeRef class]];
}

@end

@implementation AWSAppmeshUntagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSAppmeshListenerTlsAcmCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             };
}

@end
