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

#import "AWSapigatewayModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSapigatewayErrorDomain = @"com.amazonaws.AWSapigatewayErrorDomain";

@implementation AWSapigatewayAccessLogSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationArn" : @"DestinationArn",
             @"format" : @"Format",
             };
}

@end

@implementation AWSapigatewayApi

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiEndpoint" : @"ApiEndpoint",
             @"apiId" : @"ApiId",
             @"apiKeySelectionExpression" : @"ApiKeySelectionExpression",
             @"corsConfiguration" : @"CorsConfiguration",
             @"createdDate" : @"CreatedDate",
             @"detail" : @"Description",
             @"disableSchemaValidation" : @"DisableSchemaValidation",
             @"importInfo" : @"ImportInfo",
             @"name" : @"Name",
             @"protocolType" : @"ProtocolType",
             @"routeSelectionExpression" : @"RouteSelectionExpression",
             @"tags" : @"Tags",
             @"version" : @"Version",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)corsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayCors class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)protocolTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEBSOCKET"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeWebsocket);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeHttp);
        }
        return @(AWSapigatewayProtocolTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayProtocolTypeWebsocket:
                return @"WEBSOCKET";
            case AWSapigatewayProtocolTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayApiMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"apiMappingId" : @"ApiMappingId",
             @"apiMappingKey" : @"ApiMappingKey",
             @"stage" : @"Stage",
             };
}

@end

@implementation AWSapigatewayApiMappings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayApiMapping class]];
}

@end

@implementation AWSapigatewayApis

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayApi class]];
}

@end

@implementation AWSapigatewayAuthorizer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerCredentialsArn" : @"AuthorizerCredentialsArn",
             @"authorizerId" : @"AuthorizerId",
             @"authorizerResultTtlInSeconds" : @"AuthorizerResultTtlInSeconds",
             @"authorizerType" : @"AuthorizerType",
             @"authorizerUri" : @"AuthorizerUri",
             @"identitySource" : @"IdentitySource",
             @"identityValidationExpression" : @"IdentityValidationExpression",
             @"jwtConfiguration" : @"JwtConfiguration",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)authorizerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REQUEST"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeRequest);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeJwt);
        }
        return @(AWSapigatewayAuthorizerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizerTypeRequest:
                return @"REQUEST";
            case AWSapigatewayAuthorizerTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jwtConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayJWTConfiguration class]];
}

@end

@implementation AWSapigatewayAuthorizers

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayAuthorizer class]];
}

@end

@implementation AWSapigatewayCors

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowCredentials" : @"AllowCredentials",
             @"allowHeaders" : @"AllowHeaders",
             @"allowMethods" : @"AllowMethods",
             @"allowOrigins" : @"AllowOrigins",
             @"exposeHeaders" : @"ExposeHeaders",
             @"maxAge" : @"MaxAge",
             };
}

@end

@implementation AWSapigatewayCreateApiInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKeySelectionExpression" : @"ApiKeySelectionExpression",
             @"corsConfiguration" : @"CorsConfiguration",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"disableSchemaValidation" : @"DisableSchemaValidation",
             @"name" : @"Name",
             @"protocolType" : @"ProtocolType",
             @"routeKey" : @"RouteKey",
             @"routeSelectionExpression" : @"RouteSelectionExpression",
             @"tags" : @"Tags",
             @"target" : @"Target",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)corsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayCors class]];
}

+ (NSValueTransformer *)protocolTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEBSOCKET"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeWebsocket);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeHttp);
        }
        return @(AWSapigatewayProtocolTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayProtocolTypeWebsocket:
                return @"WEBSOCKET";
            case AWSapigatewayProtocolTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayCreateApiMappingInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"apiMappingKey" : @"ApiMappingKey",
             @"stage" : @"Stage",
             };
}

@end

@implementation AWSapigatewayCreateApiMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"apiMappingKey" : @"ApiMappingKey",
             @"domainName" : @"DomainName",
             @"stage" : @"Stage",
             };
}

@end

@implementation AWSapigatewayCreateApiMappingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"apiMappingId" : @"ApiMappingId",
             @"apiMappingKey" : @"ApiMappingKey",
             @"stage" : @"Stage",
             };
}

@end

@implementation AWSapigatewayCreateApiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKeySelectionExpression" : @"ApiKeySelectionExpression",
             @"corsConfiguration" : @"CorsConfiguration",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"disableSchemaValidation" : @"DisableSchemaValidation",
             @"name" : @"Name",
             @"protocolType" : @"ProtocolType",
             @"routeKey" : @"RouteKey",
             @"routeSelectionExpression" : @"RouteSelectionExpression",
             @"tags" : @"Tags",
             @"target" : @"Target",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)corsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayCors class]];
}

+ (NSValueTransformer *)protocolTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEBSOCKET"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeWebsocket);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeHttp);
        }
        return @(AWSapigatewayProtocolTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayProtocolTypeWebsocket:
                return @"WEBSOCKET";
            case AWSapigatewayProtocolTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayCreateApiResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiEndpoint" : @"ApiEndpoint",
             @"apiId" : @"ApiId",
             @"apiKeySelectionExpression" : @"ApiKeySelectionExpression",
             @"corsConfiguration" : @"CorsConfiguration",
             @"createdDate" : @"CreatedDate",
             @"detail" : @"Description",
             @"disableSchemaValidation" : @"DisableSchemaValidation",
             @"importInfo" : @"ImportInfo",
             @"name" : @"Name",
             @"protocolType" : @"ProtocolType",
             @"routeSelectionExpression" : @"RouteSelectionExpression",
             @"tags" : @"Tags",
             @"version" : @"Version",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)corsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayCors class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)protocolTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEBSOCKET"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeWebsocket);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeHttp);
        }
        return @(AWSapigatewayProtocolTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayProtocolTypeWebsocket:
                return @"WEBSOCKET";
            case AWSapigatewayProtocolTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayCreateAuthorizerInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerCredentialsArn" : @"AuthorizerCredentialsArn",
             @"authorizerResultTtlInSeconds" : @"AuthorizerResultTtlInSeconds",
             @"authorizerType" : @"AuthorizerType",
             @"authorizerUri" : @"AuthorizerUri",
             @"identitySource" : @"IdentitySource",
             @"identityValidationExpression" : @"IdentityValidationExpression",
             @"jwtConfiguration" : @"JwtConfiguration",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)authorizerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REQUEST"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeRequest);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeJwt);
        }
        return @(AWSapigatewayAuthorizerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizerTypeRequest:
                return @"REQUEST";
            case AWSapigatewayAuthorizerTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jwtConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayJWTConfiguration class]];
}

@end

@implementation AWSapigatewayCreateAuthorizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"authorizerCredentialsArn" : @"AuthorizerCredentialsArn",
             @"authorizerResultTtlInSeconds" : @"AuthorizerResultTtlInSeconds",
             @"authorizerType" : @"AuthorizerType",
             @"authorizerUri" : @"AuthorizerUri",
             @"identitySource" : @"IdentitySource",
             @"identityValidationExpression" : @"IdentityValidationExpression",
             @"jwtConfiguration" : @"JwtConfiguration",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)authorizerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REQUEST"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeRequest);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeJwt);
        }
        return @(AWSapigatewayAuthorizerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizerTypeRequest:
                return @"REQUEST";
            case AWSapigatewayAuthorizerTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jwtConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayJWTConfiguration class]];
}

@end

@implementation AWSapigatewayCreateAuthorizerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerCredentialsArn" : @"AuthorizerCredentialsArn",
             @"authorizerId" : @"AuthorizerId",
             @"authorizerResultTtlInSeconds" : @"AuthorizerResultTtlInSeconds",
             @"authorizerType" : @"AuthorizerType",
             @"authorizerUri" : @"AuthorizerUri",
             @"identitySource" : @"IdentitySource",
             @"identityValidationExpression" : @"IdentityValidationExpression",
             @"jwtConfiguration" : @"JwtConfiguration",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)authorizerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REQUEST"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeRequest);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeJwt);
        }
        return @(AWSapigatewayAuthorizerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizerTypeRequest:
                return @"REQUEST";
            case AWSapigatewayAuthorizerTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jwtConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayJWTConfiguration class]];
}

@end

@implementation AWSapigatewayCreateDeploymentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"stageName" : @"StageName",
             };
}

@end

@implementation AWSapigatewayCreateDeploymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"detail" : @"Description",
             @"stageName" : @"StageName",
             };
}

@end

@implementation AWSapigatewayCreateDeploymentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoDeployed" : @"AutoDeployed",
             @"createdDate" : @"CreatedDate",
             @"deploymentId" : @"DeploymentId",
             @"deploymentStatus" : @"DeploymentStatus",
             @"deploymentStatusMessage" : @"DeploymentStatusMessage",
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deploymentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusPending);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYED"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusDeployed);
        }
        return @(AWSapigatewayDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayDeploymentStatusPending:
                return @"PENDING";
            case AWSapigatewayDeploymentStatusFailed:
                return @"FAILED";
            case AWSapigatewayDeploymentStatusDeployed:
                return @"DEPLOYED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayCreateDomainNameInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"domainNameConfigurations" : @"DomainNameConfigurations",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)domainNameConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDomainNameConfiguration class]];
}

@end

@implementation AWSapigatewayCreateDomainNameRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"domainNameConfigurations" : @"DomainNameConfigurations",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)domainNameConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDomainNameConfiguration class]];
}

@end

@implementation AWSapigatewayCreateDomainNameResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiMappingSelectionExpression" : @"ApiMappingSelectionExpression",
             @"domainName" : @"DomainName",
             @"domainNameConfigurations" : @"DomainNameConfigurations",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)domainNameConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDomainNameConfiguration class]];
}

@end

@implementation AWSapigatewayCreateIntegrationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"ConnectionId",
             @"connectionType" : @"ConnectionType",
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"integrationMethod" : @"IntegrationMethod",
             @"integrationType" : @"IntegrationType",
             @"integrationUri" : @"IntegrationUri",
             @"passthroughBehavior" : @"PassthroughBehavior",
             @"payloadFormatVersion" : @"PayloadFormatVersion",
             @"requestParameters" : @"RequestParameters",
             @"requestTemplates" : @"RequestTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             @"timeoutInMillis" : @"TimeoutInMillis",
             @"tlsConfig" : @"TlsConfig",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNET"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeInternet);
        }
        if ([value caseInsensitiveCompare:@"VPC_LINK"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeVpcLink);
        }
        return @(AWSapigatewayConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayConnectionTypeInternet:
                return @"INTERNET";
            case AWSapigatewayConnectionTypeVpcLink:
                return @"VPC_LINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAws);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"MOCK"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeMock);
        }
        if ([value caseInsensitiveCompare:@"HTTP_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttpProxy);
        }
        if ([value caseInsensitiveCompare:@"AWS_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAwsProxy);
        }
        return @(AWSapigatewayIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayIntegrationTypeAws:
                return @"AWS";
            case AWSapigatewayIntegrationTypeHttp:
                return @"HTTP";
            case AWSapigatewayIntegrationTypeMock:
                return @"MOCK";
            case AWSapigatewayIntegrationTypeHttpProxy:
                return @"HTTP_PROXY";
            case AWSapigatewayIntegrationTypeAwsProxy:
                return @"AWS_PROXY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHEN_NO_MATCH"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoMatch);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorNever);
        }
        if ([value caseInsensitiveCompare:@"WHEN_NO_TEMPLATES"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoTemplates);
        }
        return @(AWSapigatewayPassthroughBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayPassthroughBehaviorWhenNoMatch:
                return @"WHEN_NO_MATCH";
            case AWSapigatewayPassthroughBehaviorNever:
                return @"NEVER";
            case AWSapigatewayPassthroughBehaviorWhenNoTemplates:
                return @"WHEN_NO_TEMPLATES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tlsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayTlsConfigInput class]];
}

@end

@implementation AWSapigatewayCreateIntegrationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"connectionId" : @"ConnectionId",
             @"connectionType" : @"ConnectionType",
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"integrationMethod" : @"IntegrationMethod",
             @"integrationType" : @"IntegrationType",
             @"integrationUri" : @"IntegrationUri",
             @"passthroughBehavior" : @"PassthroughBehavior",
             @"payloadFormatVersion" : @"PayloadFormatVersion",
             @"requestParameters" : @"RequestParameters",
             @"requestTemplates" : @"RequestTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             @"timeoutInMillis" : @"TimeoutInMillis",
             @"tlsConfig" : @"TlsConfig",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNET"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeInternet);
        }
        if ([value caseInsensitiveCompare:@"VPC_LINK"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeVpcLink);
        }
        return @(AWSapigatewayConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayConnectionTypeInternet:
                return @"INTERNET";
            case AWSapigatewayConnectionTypeVpcLink:
                return @"VPC_LINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAws);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"MOCK"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeMock);
        }
        if ([value caseInsensitiveCompare:@"HTTP_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttpProxy);
        }
        if ([value caseInsensitiveCompare:@"AWS_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAwsProxy);
        }
        return @(AWSapigatewayIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayIntegrationTypeAws:
                return @"AWS";
            case AWSapigatewayIntegrationTypeHttp:
                return @"HTTP";
            case AWSapigatewayIntegrationTypeMock:
                return @"MOCK";
            case AWSapigatewayIntegrationTypeHttpProxy:
                return @"HTTP_PROXY";
            case AWSapigatewayIntegrationTypeAwsProxy:
                return @"AWS_PROXY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHEN_NO_MATCH"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoMatch);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorNever);
        }
        if ([value caseInsensitiveCompare:@"WHEN_NO_TEMPLATES"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoTemplates);
        }
        return @(AWSapigatewayPassthroughBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayPassthroughBehaviorWhenNoMatch:
                return @"WHEN_NO_MATCH";
            case AWSapigatewayPassthroughBehaviorNever:
                return @"NEVER";
            case AWSapigatewayPassthroughBehaviorWhenNoTemplates:
                return @"WHEN_NO_TEMPLATES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tlsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayTlsConfigInput class]];
}

@end

@implementation AWSapigatewayCreateIntegrationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"connectionId" : @"ConnectionId",
             @"connectionType" : @"ConnectionType",
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"integrationId" : @"IntegrationId",
             @"integrationMethod" : @"IntegrationMethod",
             @"integrationResponseSelectionExpression" : @"IntegrationResponseSelectionExpression",
             @"integrationType" : @"IntegrationType",
             @"integrationUri" : @"IntegrationUri",
             @"passthroughBehavior" : @"PassthroughBehavior",
             @"payloadFormatVersion" : @"PayloadFormatVersion",
             @"requestParameters" : @"RequestParameters",
             @"requestTemplates" : @"RequestTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             @"timeoutInMillis" : @"TimeoutInMillis",
             @"tlsConfig" : @"TlsConfig",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNET"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeInternet);
        }
        if ([value caseInsensitiveCompare:@"VPC_LINK"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeVpcLink);
        }
        return @(AWSapigatewayConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayConnectionTypeInternet:
                return @"INTERNET";
            case AWSapigatewayConnectionTypeVpcLink:
                return @"VPC_LINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAws);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"MOCK"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeMock);
        }
        if ([value caseInsensitiveCompare:@"HTTP_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttpProxy);
        }
        if ([value caseInsensitiveCompare:@"AWS_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAwsProxy);
        }
        return @(AWSapigatewayIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayIntegrationTypeAws:
                return @"AWS";
            case AWSapigatewayIntegrationTypeHttp:
                return @"HTTP";
            case AWSapigatewayIntegrationTypeMock:
                return @"MOCK";
            case AWSapigatewayIntegrationTypeHttpProxy:
                return @"HTTP_PROXY";
            case AWSapigatewayIntegrationTypeAwsProxy:
                return @"AWS_PROXY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHEN_NO_MATCH"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoMatch);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorNever);
        }
        if ([value caseInsensitiveCompare:@"WHEN_NO_TEMPLATES"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoTemplates);
        }
        return @(AWSapigatewayPassthroughBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayPassthroughBehaviorWhenNoMatch:
                return @"WHEN_NO_MATCH";
            case AWSapigatewayPassthroughBehaviorNever:
                return @"NEVER";
            case AWSapigatewayPassthroughBehaviorWhenNoTemplates:
                return @"WHEN_NO_TEMPLATES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tlsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayTlsConfig class]];
}

@end

@implementation AWSapigatewayCreateIntegrationResponseInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"integrationResponseKey" : @"IntegrationResponseKey",
             @"responseParameters" : @"ResponseParameters",
             @"responseTemplates" : @"ResponseTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             };
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayCreateIntegrationResponseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"integrationId" : @"IntegrationId",
             @"integrationResponseKey" : @"IntegrationResponseKey",
             @"responseParameters" : @"ResponseParameters",
             @"responseTemplates" : @"ResponseTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             };
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayCreateIntegrationResponseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"integrationResponseId" : @"IntegrationResponseId",
             @"integrationResponseKey" : @"IntegrationResponseKey",
             @"responseParameters" : @"ResponseParameters",
             @"responseTemplates" : @"ResponseTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             };
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayCreateModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"schema" : @"Schema",
             };
}

@end

@implementation AWSapigatewayCreateModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"contentType" : @"ContentType",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"schema" : @"Schema",
             };
}

@end

@implementation AWSapigatewayCreateModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"detail" : @"Description",
             @"modelId" : @"ModelId",
             @"name" : @"Name",
             @"schema" : @"Schema",
             };
}

@end

@implementation AWSapigatewayCreateRouteInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKeyRequired" : @"ApiKeyRequired",
             @"authorizationScopes" : @"AuthorizationScopes",
             @"authorizationType" : @"AuthorizationType",
             @"authorizerId" : @"AuthorizerId",
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"operationName" : @"OperationName",
             @"requestModels" : @"RequestModels",
             @"requestParameters" : @"RequestParameters",
             @"routeKey" : @"RouteKey",
             @"routeResponseSelectionExpression" : @"RouteResponseSelectionExpression",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)authorizationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeAwsIam);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeJwt);
        }
        return @(AWSapigatewayAuthorizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizationTypeNone:
                return @"NONE";
            case AWSapigatewayAuthorizationTypeAwsIam:
                return @"AWS_IAM";
            case AWSapigatewayAuthorizationTypeCustom:
                return @"CUSTOM";
            case AWSapigatewayAuthorizationTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayCreateRouteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"apiKeyRequired" : @"ApiKeyRequired",
             @"authorizationScopes" : @"AuthorizationScopes",
             @"authorizationType" : @"AuthorizationType",
             @"authorizerId" : @"AuthorizerId",
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"operationName" : @"OperationName",
             @"requestModels" : @"RequestModels",
             @"requestParameters" : @"RequestParameters",
             @"routeKey" : @"RouteKey",
             @"routeResponseSelectionExpression" : @"RouteResponseSelectionExpression",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)authorizationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeAwsIam);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeJwt);
        }
        return @(AWSapigatewayAuthorizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizationTypeNone:
                return @"NONE";
            case AWSapigatewayAuthorizationTypeAwsIam:
                return @"AWS_IAM";
            case AWSapigatewayAuthorizationTypeCustom:
                return @"CUSTOM";
            case AWSapigatewayAuthorizationTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayCreateRouteResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"apiKeyRequired" : @"ApiKeyRequired",
             @"authorizationScopes" : @"AuthorizationScopes",
             @"authorizationType" : @"AuthorizationType",
             @"authorizerId" : @"AuthorizerId",
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"operationName" : @"OperationName",
             @"requestModels" : @"RequestModels",
             @"requestParameters" : @"RequestParameters",
             @"routeId" : @"RouteId",
             @"routeKey" : @"RouteKey",
             @"routeResponseSelectionExpression" : @"RouteResponseSelectionExpression",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)authorizationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeAwsIam);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeJwt);
        }
        return @(AWSapigatewayAuthorizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizationTypeNone:
                return @"NONE";
            case AWSapigatewayAuthorizationTypeAwsIam:
                return @"AWS_IAM";
            case AWSapigatewayAuthorizationTypeCustom:
                return @"CUSTOM";
            case AWSapigatewayAuthorizationTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayCreateRouteResponseInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"responseModels" : @"ResponseModels",
             @"responseParameters" : @"ResponseParameters",
             @"routeResponseKey" : @"RouteResponseKey",
             };
}

+ (NSValueTransformer *)responseParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayCreateRouteResponseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"responseModels" : @"ResponseModels",
             @"responseParameters" : @"ResponseParameters",
             @"routeId" : @"RouteId",
             @"routeResponseKey" : @"RouteResponseKey",
             };
}

+ (NSValueTransformer *)responseParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayCreateRouteResponseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"responseModels" : @"ResponseModels",
             @"responseParameters" : @"ResponseParameters",
             @"routeResponseId" : @"RouteResponseId",
             @"routeResponseKey" : @"RouteResponseKey",
             };
}

+ (NSValueTransformer *)responseParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayCreateStageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessLogSettings" : @"AccessLogSettings",
             @"autoDeploy" : @"AutoDeploy",
             @"clientCertificateId" : @"ClientCertificateId",
             @"defaultRouteSettings" : @"DefaultRouteSettings",
             @"deploymentId" : @"DeploymentId",
             @"detail" : @"Description",
             @"routeSettings" : @"RouteSettings",
             @"stageName" : @"StageName",
             @"stageVariables" : @"StageVariables",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)accessLogSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayAccessLogSettings class]];
}

+ (NSValueTransformer *)defaultRouteSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayRouteSettings class]];
}

+ (NSValueTransformer *)routeSettingsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayRouteSettings class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayCreateStageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessLogSettings" : @"AccessLogSettings",
             @"apiId" : @"ApiId",
             @"autoDeploy" : @"AutoDeploy",
             @"clientCertificateId" : @"ClientCertificateId",
             @"defaultRouteSettings" : @"DefaultRouteSettings",
             @"deploymentId" : @"DeploymentId",
             @"detail" : @"Description",
             @"routeSettings" : @"RouteSettings",
             @"stageName" : @"StageName",
             @"stageVariables" : @"StageVariables",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)accessLogSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayAccessLogSettings class]];
}

+ (NSValueTransformer *)defaultRouteSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayRouteSettings class]];
}

+ (NSValueTransformer *)routeSettingsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayRouteSettings class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayCreateStageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessLogSettings" : @"AccessLogSettings",
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"autoDeploy" : @"AutoDeploy",
             @"clientCertificateId" : @"ClientCertificateId",
             @"createdDate" : @"CreatedDate",
             @"defaultRouteSettings" : @"DefaultRouteSettings",
             @"deploymentId" : @"DeploymentId",
             @"detail" : @"Description",
             @"lastDeploymentStatusMessage" : @"LastDeploymentStatusMessage",
             @"lastUpdatedDate" : @"LastUpdatedDate",
             @"routeSettings" : @"RouteSettings",
             @"stageName" : @"StageName",
             @"stageVariables" : @"StageVariables",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)accessLogSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayAccessLogSettings class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)defaultRouteSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayRouteSettings class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)routeSettingsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayRouteSettings class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayCreateVpcLinkInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSapigatewayCreateVpcLinkRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSapigatewayCreateVpcLinkResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"CreatedDate",
             @"name" : @"Name",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             @"vpcLinkId" : @"VpcLinkId",
             @"vpcLinkStatus" : @"VpcLinkStatus",
             @"vpcLinkStatusMessage" : @"VpcLinkStatusMessage",
             @"vpcLinkVersion" : @"VpcLinkVersion",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcLinkStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusPending);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusInactive);
        }
        return @(AWSapigatewayVpcLinkStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayVpcLinkStatusPending:
                return @"PENDING";
            case AWSapigatewayVpcLinkStatusAvailable:
                return @"AVAILABLE";
            case AWSapigatewayVpcLinkStatusDeleting:
                return @"DELETING";
            case AWSapigatewayVpcLinkStatusFailed:
                return @"FAILED";
            case AWSapigatewayVpcLinkStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcLinkVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"V2"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkVersionV2);
        }
        return @(AWSapigatewayVpcLinkVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayVpcLinkVersionV2:
                return @"V2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayDeleteAccessLogSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"stageName" : @"StageName",
             };
}

@end

@implementation AWSapigatewayDeleteApiMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiMappingId" : @"ApiMappingId",
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSapigatewayDeleteApiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             };
}

@end

@implementation AWSapigatewayDeleteAuthorizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"authorizerId" : @"AuthorizerId",
             };
}

@end

@implementation AWSapigatewayDeleteCorsConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             };
}

@end

@implementation AWSapigatewayDeleteDeploymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"deploymentId" : @"DeploymentId",
             };
}

@end

@implementation AWSapigatewayDeleteDomainNameRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSapigatewayDeleteIntegrationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"integrationId" : @"IntegrationId",
             };
}

@end

@implementation AWSapigatewayDeleteIntegrationResponseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"integrationId" : @"IntegrationId",
             @"integrationResponseId" : @"IntegrationResponseId",
             };
}

@end

@implementation AWSapigatewayDeleteModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"modelId" : @"ModelId",
             };
}

@end

@implementation AWSapigatewayDeleteRouteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"routeId" : @"RouteId",
             };
}

@end

@implementation AWSapigatewayDeleteRouteRequestParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"requestParameterKey" : @"RequestParameterKey",
             @"routeId" : @"RouteId",
             };
}

@end

@implementation AWSapigatewayDeleteRouteResponseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"routeId" : @"RouteId",
             @"routeResponseId" : @"RouteResponseId",
             };
}

@end

@implementation AWSapigatewayDeleteRouteSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"routeKey" : @"RouteKey",
             @"stageName" : @"StageName",
             };
}

@end

@implementation AWSapigatewayDeleteStageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"stageName" : @"StageName",
             };
}

@end

@implementation AWSapigatewayDeleteVpcLinkRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcLinkId" : @"VpcLinkId",
             };
}

@end

@implementation AWSapigatewayDeleteVpcLinkResponse

@end

@implementation AWSapigatewayDeployment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoDeployed" : @"AutoDeployed",
             @"createdDate" : @"CreatedDate",
             @"deploymentId" : @"DeploymentId",
             @"deploymentStatus" : @"DeploymentStatus",
             @"deploymentStatusMessage" : @"DeploymentStatusMessage",
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deploymentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusPending);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYED"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusDeployed);
        }
        return @(AWSapigatewayDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayDeploymentStatusPending:
                return @"PENDING";
            case AWSapigatewayDeploymentStatusFailed:
                return @"FAILED";
            case AWSapigatewayDeploymentStatusDeployed:
                return @"DEPLOYED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayDeployments

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDeployment class]];
}

@end

@implementation AWSapigatewayDomainName

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiMappingSelectionExpression" : @"ApiMappingSelectionExpression",
             @"domainName" : @"DomainName",
             @"domainNameConfigurations" : @"DomainNameConfigurations",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)domainNameConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDomainNameConfiguration class]];
}

@end

@implementation AWSapigatewayDomainNameConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiGatewayDomainName" : @"ApiGatewayDomainName",
             @"certificateArn" : @"CertificateArn",
             @"certificateName" : @"CertificateName",
             @"certificateUploadDate" : @"CertificateUploadDate",
             @"domainNameStatus" : @"DomainNameStatus",
             @"domainNameStatusMessage" : @"DomainNameStatusMessage",
             @"endpointType" : @"EndpointType",
             @"hostedZoneId" : @"HostedZoneId",
             @"securityPolicy" : @"SecurityPolicy",
             };
}

+ (NSValueTransformer *)certificateUploadDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)domainNameStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSapigatewayDomainNameStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSapigatewayDomainNameStatusUpdating);
        }
        return @(AWSapigatewayDomainNameStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayDomainNameStatusAvailable:
                return @"AVAILABLE";
            case AWSapigatewayDomainNameStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGIONAL"] == NSOrderedSame) {
            return @(AWSapigatewayEndpointTypeRegional);
        }
        if ([value caseInsensitiveCompare:@"EDGE"] == NSOrderedSame) {
            return @(AWSapigatewayEndpointTypeEdge);
        }
        return @(AWSapigatewayEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayEndpointTypeRegional:
                return @"REGIONAL";
            case AWSapigatewayEndpointTypeEdge:
                return @"EDGE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)securityPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TLS_1_0"] == NSOrderedSame) {
            return @(AWSapigatewaySecurityPolicyTls10);
        }
        if ([value caseInsensitiveCompare:@"TLS_1_2"] == NSOrderedSame) {
            return @(AWSapigatewaySecurityPolicyTls12);
        }
        return @(AWSapigatewaySecurityPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewaySecurityPolicyTls10:
                return @"TLS_1_0";
            case AWSapigatewaySecurityPolicyTls12:
                return @"TLS_1_2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayDomainNames

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDomainName class]];
}

@end

@implementation AWSapigatewayExportApiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"exportVersion" : @"ExportVersion",
             @"includeExtensions" : @"IncludeExtensions",
             @"outputType" : @"OutputType",
             @"specification" : @"Specification",
             @"stageName" : @"StageName",
             };
}

@end

@implementation AWSapigatewayExportApiResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"body",
             };
}

@end

@implementation AWSapigatewayGetApiMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiMappingId" : @"ApiMappingId",
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSapigatewayGetApiMappingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"apiMappingId" : @"ApiMappingId",
             @"apiMappingKey" : @"ApiMappingKey",
             @"stage" : @"Stage",
             };
}

@end

@implementation AWSapigatewayGetApiMappingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapigatewayGetApiMappingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayApiMapping class]];
}

@end

@implementation AWSapigatewayGetApiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             };
}

@end

@implementation AWSapigatewayGetApiResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiEndpoint" : @"ApiEndpoint",
             @"apiId" : @"ApiId",
             @"apiKeySelectionExpression" : @"ApiKeySelectionExpression",
             @"corsConfiguration" : @"CorsConfiguration",
             @"createdDate" : @"CreatedDate",
             @"detail" : @"Description",
             @"disableSchemaValidation" : @"DisableSchemaValidation",
             @"importInfo" : @"ImportInfo",
             @"name" : @"Name",
             @"protocolType" : @"ProtocolType",
             @"routeSelectionExpression" : @"RouteSelectionExpression",
             @"tags" : @"Tags",
             @"version" : @"Version",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)corsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayCors class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)protocolTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEBSOCKET"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeWebsocket);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeHttp);
        }
        return @(AWSapigatewayProtocolTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayProtocolTypeWebsocket:
                return @"WEBSOCKET";
            case AWSapigatewayProtocolTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayGetApisRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapigatewayGetApisResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayApi class]];
}

@end

@implementation AWSapigatewayGetAuthorizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"authorizerId" : @"AuthorizerId",
             };
}

@end

@implementation AWSapigatewayGetAuthorizerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerCredentialsArn" : @"AuthorizerCredentialsArn",
             @"authorizerId" : @"AuthorizerId",
             @"authorizerResultTtlInSeconds" : @"AuthorizerResultTtlInSeconds",
             @"authorizerType" : @"AuthorizerType",
             @"authorizerUri" : @"AuthorizerUri",
             @"identitySource" : @"IdentitySource",
             @"identityValidationExpression" : @"IdentityValidationExpression",
             @"jwtConfiguration" : @"JwtConfiguration",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)authorizerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REQUEST"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeRequest);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeJwt);
        }
        return @(AWSapigatewayAuthorizerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizerTypeRequest:
                return @"REQUEST";
            case AWSapigatewayAuthorizerTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jwtConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayJWTConfiguration class]];
}

@end

@implementation AWSapigatewayGetAuthorizersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapigatewayGetAuthorizersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayAuthorizer class]];
}

@end

@implementation AWSapigatewayGetDeploymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"deploymentId" : @"DeploymentId",
             };
}

@end

@implementation AWSapigatewayGetDeploymentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoDeployed" : @"AutoDeployed",
             @"createdDate" : @"CreatedDate",
             @"deploymentId" : @"DeploymentId",
             @"deploymentStatus" : @"DeploymentStatus",
             @"deploymentStatusMessage" : @"DeploymentStatusMessage",
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deploymentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusPending);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYED"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusDeployed);
        }
        return @(AWSapigatewayDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayDeploymentStatusPending:
                return @"PENDING";
            case AWSapigatewayDeploymentStatusFailed:
                return @"FAILED";
            case AWSapigatewayDeploymentStatusDeployed:
                return @"DEPLOYED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayGetDeploymentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapigatewayGetDeploymentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDeployment class]];
}

@end

@implementation AWSapigatewayGetDomainNameRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSapigatewayGetDomainNameResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiMappingSelectionExpression" : @"ApiMappingSelectionExpression",
             @"domainName" : @"DomainName",
             @"domainNameConfigurations" : @"DomainNameConfigurations",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)domainNameConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDomainNameConfiguration class]];
}

@end

@implementation AWSapigatewayGetDomainNamesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapigatewayGetDomainNamesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDomainName class]];
}

@end

@implementation AWSapigatewayGetIntegrationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"integrationId" : @"IntegrationId",
             };
}

@end

@implementation AWSapigatewayGetIntegrationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"connectionId" : @"ConnectionId",
             @"connectionType" : @"ConnectionType",
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"integrationId" : @"IntegrationId",
             @"integrationMethod" : @"IntegrationMethod",
             @"integrationResponseSelectionExpression" : @"IntegrationResponseSelectionExpression",
             @"integrationType" : @"IntegrationType",
             @"integrationUri" : @"IntegrationUri",
             @"passthroughBehavior" : @"PassthroughBehavior",
             @"payloadFormatVersion" : @"PayloadFormatVersion",
             @"requestParameters" : @"RequestParameters",
             @"requestTemplates" : @"RequestTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             @"timeoutInMillis" : @"TimeoutInMillis",
             @"tlsConfig" : @"TlsConfig",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNET"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeInternet);
        }
        if ([value caseInsensitiveCompare:@"VPC_LINK"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeVpcLink);
        }
        return @(AWSapigatewayConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayConnectionTypeInternet:
                return @"INTERNET";
            case AWSapigatewayConnectionTypeVpcLink:
                return @"VPC_LINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAws);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"MOCK"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeMock);
        }
        if ([value caseInsensitiveCompare:@"HTTP_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttpProxy);
        }
        if ([value caseInsensitiveCompare:@"AWS_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAwsProxy);
        }
        return @(AWSapigatewayIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayIntegrationTypeAws:
                return @"AWS";
            case AWSapigatewayIntegrationTypeHttp:
                return @"HTTP";
            case AWSapigatewayIntegrationTypeMock:
                return @"MOCK";
            case AWSapigatewayIntegrationTypeHttpProxy:
                return @"HTTP_PROXY";
            case AWSapigatewayIntegrationTypeAwsProxy:
                return @"AWS_PROXY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHEN_NO_MATCH"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoMatch);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorNever);
        }
        if ([value caseInsensitiveCompare:@"WHEN_NO_TEMPLATES"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoTemplates);
        }
        return @(AWSapigatewayPassthroughBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayPassthroughBehaviorWhenNoMatch:
                return @"WHEN_NO_MATCH";
            case AWSapigatewayPassthroughBehaviorNever:
                return @"NEVER";
            case AWSapigatewayPassthroughBehaviorWhenNoTemplates:
                return @"WHEN_NO_TEMPLATES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tlsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayTlsConfig class]];
}

@end

@implementation AWSapigatewayGetIntegrationResponseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"integrationId" : @"IntegrationId",
             @"integrationResponseId" : @"IntegrationResponseId",
             };
}

@end

@implementation AWSapigatewayGetIntegrationResponseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"integrationResponseId" : @"IntegrationResponseId",
             @"integrationResponseKey" : @"IntegrationResponseKey",
             @"responseParameters" : @"ResponseParameters",
             @"responseTemplates" : @"ResponseTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             };
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayGetIntegrationResponsesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"integrationId" : @"IntegrationId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapigatewayGetIntegrationResponsesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayIntegrationResponse class]];
}

@end

@implementation AWSapigatewayGetIntegrationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapigatewayGetIntegrationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayIntegration class]];
}

@end

@implementation AWSapigatewayGetModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"modelId" : @"ModelId",
             };
}

@end

@implementation AWSapigatewayGetModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"detail" : @"Description",
             @"modelId" : @"ModelId",
             @"name" : @"Name",
             @"schema" : @"Schema",
             };
}

@end

@implementation AWSapigatewayGetModelTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"modelId" : @"ModelId",
             };
}

@end

@implementation AWSapigatewayGetModelTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"value" : @"Value",
             };
}

@end

@implementation AWSapigatewayGetModelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapigatewayGetModelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayModel class]];
}

@end

@implementation AWSapigatewayGetRouteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"routeId" : @"RouteId",
             };
}

@end

@implementation AWSapigatewayGetRouteResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"apiKeyRequired" : @"ApiKeyRequired",
             @"authorizationScopes" : @"AuthorizationScopes",
             @"authorizationType" : @"AuthorizationType",
             @"authorizerId" : @"AuthorizerId",
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"operationName" : @"OperationName",
             @"requestModels" : @"RequestModels",
             @"requestParameters" : @"RequestParameters",
             @"routeId" : @"RouteId",
             @"routeKey" : @"RouteKey",
             @"routeResponseSelectionExpression" : @"RouteResponseSelectionExpression",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)authorizationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeAwsIam);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeJwt);
        }
        return @(AWSapigatewayAuthorizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizationTypeNone:
                return @"NONE";
            case AWSapigatewayAuthorizationTypeAwsIam:
                return @"AWS_IAM";
            case AWSapigatewayAuthorizationTypeCustom:
                return @"CUSTOM";
            case AWSapigatewayAuthorizationTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayGetRouteResponseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"routeId" : @"RouteId",
             @"routeResponseId" : @"RouteResponseId",
             };
}

@end

@implementation AWSapigatewayGetRouteResponseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"responseModels" : @"ResponseModels",
             @"responseParameters" : @"ResponseParameters",
             @"routeResponseId" : @"RouteResponseId",
             @"routeResponseKey" : @"RouteResponseKey",
             };
}

+ (NSValueTransformer *)responseParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayGetRouteResponsesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"routeId" : @"RouteId",
             };
}

@end

@implementation AWSapigatewayGetRouteResponsesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayRouteResponse class]];
}

@end

@implementation AWSapigatewayGetRoutesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapigatewayGetRoutesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayRoute class]];
}

@end

@implementation AWSapigatewayGetStageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"stageName" : @"StageName",
             };
}

@end

@implementation AWSapigatewayGetStageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessLogSettings" : @"AccessLogSettings",
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"autoDeploy" : @"AutoDeploy",
             @"clientCertificateId" : @"ClientCertificateId",
             @"createdDate" : @"CreatedDate",
             @"defaultRouteSettings" : @"DefaultRouteSettings",
             @"deploymentId" : @"DeploymentId",
             @"detail" : @"Description",
             @"lastDeploymentStatusMessage" : @"LastDeploymentStatusMessage",
             @"lastUpdatedDate" : @"LastUpdatedDate",
             @"routeSettings" : @"RouteSettings",
             @"stageName" : @"StageName",
             @"stageVariables" : @"StageVariables",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)accessLogSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayAccessLogSettings class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)defaultRouteSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayRouteSettings class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)routeSettingsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayRouteSettings class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayGetStagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapigatewayGetStagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayStage class]];
}

@end

@implementation AWSapigatewayGetTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSapigatewayGetTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSapigatewayGetVpcLinkRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcLinkId" : @"VpcLinkId",
             };
}

@end

@implementation AWSapigatewayGetVpcLinkResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"CreatedDate",
             @"name" : @"Name",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             @"vpcLinkId" : @"VpcLinkId",
             @"vpcLinkStatus" : @"VpcLinkStatus",
             @"vpcLinkStatusMessage" : @"VpcLinkStatusMessage",
             @"vpcLinkVersion" : @"VpcLinkVersion",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcLinkStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusPending);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusInactive);
        }
        return @(AWSapigatewayVpcLinkStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayVpcLinkStatusPending:
                return @"PENDING";
            case AWSapigatewayVpcLinkStatusAvailable:
                return @"AVAILABLE";
            case AWSapigatewayVpcLinkStatusDeleting:
                return @"DELETING";
            case AWSapigatewayVpcLinkStatusFailed:
                return @"FAILED";
            case AWSapigatewayVpcLinkStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcLinkVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"V2"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkVersionV2);
        }
        return @(AWSapigatewayVpcLinkVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayVpcLinkVersionV2:
                return @"V2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayGetVpcLinksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapigatewayGetVpcLinksResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayVpcLink class]];
}

@end

@implementation AWSapigatewayImportApiInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             };
}

@end

@implementation AWSapigatewayImportApiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"basepath" : @"Basepath",
             @"body" : @"Body",
             @"failOnWarnings" : @"FailOnWarnings",
             };
}

@end

@implementation AWSapigatewayImportApiResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiEndpoint" : @"ApiEndpoint",
             @"apiId" : @"ApiId",
             @"apiKeySelectionExpression" : @"ApiKeySelectionExpression",
             @"corsConfiguration" : @"CorsConfiguration",
             @"createdDate" : @"CreatedDate",
             @"detail" : @"Description",
             @"disableSchemaValidation" : @"DisableSchemaValidation",
             @"importInfo" : @"ImportInfo",
             @"name" : @"Name",
             @"protocolType" : @"ProtocolType",
             @"routeSelectionExpression" : @"RouteSelectionExpression",
             @"tags" : @"Tags",
             @"version" : @"Version",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)corsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayCors class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)protocolTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEBSOCKET"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeWebsocket);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeHttp);
        }
        return @(AWSapigatewayProtocolTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayProtocolTypeWebsocket:
                return @"WEBSOCKET";
            case AWSapigatewayProtocolTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayIntegration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"connectionId" : @"ConnectionId",
             @"connectionType" : @"ConnectionType",
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"integrationId" : @"IntegrationId",
             @"integrationMethod" : @"IntegrationMethod",
             @"integrationResponseSelectionExpression" : @"IntegrationResponseSelectionExpression",
             @"integrationType" : @"IntegrationType",
             @"integrationUri" : @"IntegrationUri",
             @"passthroughBehavior" : @"PassthroughBehavior",
             @"payloadFormatVersion" : @"PayloadFormatVersion",
             @"requestParameters" : @"RequestParameters",
             @"requestTemplates" : @"RequestTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             @"timeoutInMillis" : @"TimeoutInMillis",
             @"tlsConfig" : @"TlsConfig",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNET"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeInternet);
        }
        if ([value caseInsensitiveCompare:@"VPC_LINK"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeVpcLink);
        }
        return @(AWSapigatewayConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayConnectionTypeInternet:
                return @"INTERNET";
            case AWSapigatewayConnectionTypeVpcLink:
                return @"VPC_LINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAws);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"MOCK"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeMock);
        }
        if ([value caseInsensitiveCompare:@"HTTP_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttpProxy);
        }
        if ([value caseInsensitiveCompare:@"AWS_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAwsProxy);
        }
        return @(AWSapigatewayIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayIntegrationTypeAws:
                return @"AWS";
            case AWSapigatewayIntegrationTypeHttp:
                return @"HTTP";
            case AWSapigatewayIntegrationTypeMock:
                return @"MOCK";
            case AWSapigatewayIntegrationTypeHttpProxy:
                return @"HTTP_PROXY";
            case AWSapigatewayIntegrationTypeAwsProxy:
                return @"AWS_PROXY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHEN_NO_MATCH"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoMatch);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorNever);
        }
        if ([value caseInsensitiveCompare:@"WHEN_NO_TEMPLATES"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoTemplates);
        }
        return @(AWSapigatewayPassthroughBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayPassthroughBehaviorWhenNoMatch:
                return @"WHEN_NO_MATCH";
            case AWSapigatewayPassthroughBehaviorNever:
                return @"NEVER";
            case AWSapigatewayPassthroughBehaviorWhenNoTemplates:
                return @"WHEN_NO_TEMPLATES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tlsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayTlsConfig class]];
}

@end

@implementation AWSapigatewayIntegrationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"integrationResponseId" : @"IntegrationResponseId",
             @"integrationResponseKey" : @"IntegrationResponseKey",
             @"responseParameters" : @"ResponseParameters",
             @"responseTemplates" : @"ResponseTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             };
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayIntegrationResponses

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayIntegrationResponse class]];
}

@end

@implementation AWSapigatewayIntegrations

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayIntegration class]];
}

@end

@implementation AWSapigatewayJWTConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audience" : @"Audience",
             @"issuer" : @"Issuer",
             };
}

@end

@implementation AWSapigatewayLimitExceededException

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limitType" : @"LimitType",
             @"message" : @"Message",
             };
}

@end

@implementation AWSapigatewayModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"detail" : @"Description",
             @"modelId" : @"ModelId",
             @"name" : @"Name",
             @"schema" : @"Schema",
             };
}

@end

@implementation AWSapigatewayModels

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayModel class]];
}

@end

@implementation AWSapigatewayParameterConstraints

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"required" : @"Required",
             };
}

@end

@implementation AWSapigatewayReimportApiInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             };
}

@end

@implementation AWSapigatewayReimportApiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"basepath" : @"Basepath",
             @"body" : @"Body",
             @"failOnWarnings" : @"FailOnWarnings",
             };
}

@end

@implementation AWSapigatewayReimportApiResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiEndpoint" : @"ApiEndpoint",
             @"apiId" : @"ApiId",
             @"apiKeySelectionExpression" : @"ApiKeySelectionExpression",
             @"corsConfiguration" : @"CorsConfiguration",
             @"createdDate" : @"CreatedDate",
             @"detail" : @"Description",
             @"disableSchemaValidation" : @"DisableSchemaValidation",
             @"importInfo" : @"ImportInfo",
             @"name" : @"Name",
             @"protocolType" : @"ProtocolType",
             @"routeSelectionExpression" : @"RouteSelectionExpression",
             @"tags" : @"Tags",
             @"version" : @"Version",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)corsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayCors class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)protocolTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEBSOCKET"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeWebsocket);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeHttp);
        }
        return @(AWSapigatewayProtocolTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayProtocolTypeWebsocket:
                return @"WEBSOCKET";
            case AWSapigatewayProtocolTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayRoute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"apiKeyRequired" : @"ApiKeyRequired",
             @"authorizationScopes" : @"AuthorizationScopes",
             @"authorizationType" : @"AuthorizationType",
             @"authorizerId" : @"AuthorizerId",
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"operationName" : @"OperationName",
             @"requestModels" : @"RequestModels",
             @"requestParameters" : @"RequestParameters",
             @"routeId" : @"RouteId",
             @"routeKey" : @"RouteKey",
             @"routeResponseSelectionExpression" : @"RouteResponseSelectionExpression",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)authorizationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeAwsIam);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeJwt);
        }
        return @(AWSapigatewayAuthorizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizationTypeNone:
                return @"NONE";
            case AWSapigatewayAuthorizationTypeAwsIam:
                return @"AWS_IAM";
            case AWSapigatewayAuthorizationTypeCustom:
                return @"CUSTOM";
            case AWSapigatewayAuthorizationTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayRouteResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"responseModels" : @"ResponseModels",
             @"responseParameters" : @"ResponseParameters",
             @"routeResponseId" : @"RouteResponseId",
             @"routeResponseKey" : @"RouteResponseKey",
             };
}

+ (NSValueTransformer *)responseParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayRouteResponses

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayRouteResponse class]];
}

@end

@implementation AWSapigatewayRouteSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataTraceEnabled" : @"DataTraceEnabled",
             @"detailedMetricsEnabled" : @"DetailedMetricsEnabled",
             @"loggingLevel" : @"LoggingLevel",
             @"throttlingBurstLimit" : @"ThrottlingBurstLimit",
             @"throttlingRateLimit" : @"ThrottlingRateLimit",
             };
}

+ (NSValueTransformer *)loggingLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSapigatewayLoggingLevelError);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSapigatewayLoggingLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSapigatewayLoggingLevelOff);
        }
        return @(AWSapigatewayLoggingLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayLoggingLevelError:
                return @"ERROR";
            case AWSapigatewayLoggingLevelInfo:
                return @"INFO";
            case AWSapigatewayLoggingLevelOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayRoutes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayRoute class]];
}

@end

@implementation AWSapigatewayStage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessLogSettings" : @"AccessLogSettings",
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"autoDeploy" : @"AutoDeploy",
             @"clientCertificateId" : @"ClientCertificateId",
             @"createdDate" : @"CreatedDate",
             @"defaultRouteSettings" : @"DefaultRouteSettings",
             @"deploymentId" : @"DeploymentId",
             @"detail" : @"Description",
             @"lastDeploymentStatusMessage" : @"LastDeploymentStatusMessage",
             @"lastUpdatedDate" : @"LastUpdatedDate",
             @"routeSettings" : @"RouteSettings",
             @"stageName" : @"StageName",
             @"stageVariables" : @"StageVariables",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)accessLogSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayAccessLogSettings class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)defaultRouteSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayRouteSettings class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)routeSettingsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayRouteSettings class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayStages

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayStage class]];
}

@end

@implementation AWSapigatewayTagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSapigatewayTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSapigatewayTagResourceResponse

@end

@implementation AWSapigatewayTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"value" : @"Value",
             };
}

@end

@implementation AWSapigatewayTlsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverNameToVerify" : @"ServerNameToVerify",
             };
}

@end

@implementation AWSapigatewayTlsConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverNameToVerify" : @"ServerNameToVerify",
             };
}

@end

@implementation AWSapigatewayUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSapigatewayUpdateApiInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKeySelectionExpression" : @"ApiKeySelectionExpression",
             @"corsConfiguration" : @"CorsConfiguration",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"disableSchemaValidation" : @"DisableSchemaValidation",
             @"name" : @"Name",
             @"routeKey" : @"RouteKey",
             @"routeSelectionExpression" : @"RouteSelectionExpression",
             @"target" : @"Target",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)corsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayCors class]];
}

@end

@implementation AWSapigatewayUpdateApiMappingInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"apiMappingKey" : @"ApiMappingKey",
             @"stage" : @"Stage",
             };
}

@end

@implementation AWSapigatewayUpdateApiMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"apiMappingId" : @"ApiMappingId",
             @"apiMappingKey" : @"ApiMappingKey",
             @"domainName" : @"DomainName",
             @"stage" : @"Stage",
             };
}

@end

@implementation AWSapigatewayUpdateApiMappingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"apiMappingId" : @"ApiMappingId",
             @"apiMappingKey" : @"ApiMappingKey",
             @"stage" : @"Stage",
             };
}

@end

@implementation AWSapigatewayUpdateApiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"apiKeySelectionExpression" : @"ApiKeySelectionExpression",
             @"corsConfiguration" : @"CorsConfiguration",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"disableSchemaValidation" : @"DisableSchemaValidation",
             @"name" : @"Name",
             @"routeKey" : @"RouteKey",
             @"routeSelectionExpression" : @"RouteSelectionExpression",
             @"target" : @"Target",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)corsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayCors class]];
}

@end

@implementation AWSapigatewayUpdateApiResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiEndpoint" : @"ApiEndpoint",
             @"apiId" : @"ApiId",
             @"apiKeySelectionExpression" : @"ApiKeySelectionExpression",
             @"corsConfiguration" : @"CorsConfiguration",
             @"createdDate" : @"CreatedDate",
             @"detail" : @"Description",
             @"disableSchemaValidation" : @"DisableSchemaValidation",
             @"importInfo" : @"ImportInfo",
             @"name" : @"Name",
             @"protocolType" : @"ProtocolType",
             @"routeSelectionExpression" : @"RouteSelectionExpression",
             @"tags" : @"Tags",
             @"version" : @"Version",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)corsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayCors class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)protocolTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEBSOCKET"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeWebsocket);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayProtocolTypeHttp);
        }
        return @(AWSapigatewayProtocolTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayProtocolTypeWebsocket:
                return @"WEBSOCKET";
            case AWSapigatewayProtocolTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayUpdateAuthorizerInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerCredentialsArn" : @"AuthorizerCredentialsArn",
             @"authorizerResultTtlInSeconds" : @"AuthorizerResultTtlInSeconds",
             @"authorizerType" : @"AuthorizerType",
             @"authorizerUri" : @"AuthorizerUri",
             @"identitySource" : @"IdentitySource",
             @"identityValidationExpression" : @"IdentityValidationExpression",
             @"jwtConfiguration" : @"JwtConfiguration",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)authorizerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REQUEST"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeRequest);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeJwt);
        }
        return @(AWSapigatewayAuthorizerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizerTypeRequest:
                return @"REQUEST";
            case AWSapigatewayAuthorizerTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jwtConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayJWTConfiguration class]];
}

@end

@implementation AWSapigatewayUpdateAuthorizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"authorizerCredentialsArn" : @"AuthorizerCredentialsArn",
             @"authorizerId" : @"AuthorizerId",
             @"authorizerResultTtlInSeconds" : @"AuthorizerResultTtlInSeconds",
             @"authorizerType" : @"AuthorizerType",
             @"authorizerUri" : @"AuthorizerUri",
             @"identitySource" : @"IdentitySource",
             @"identityValidationExpression" : @"IdentityValidationExpression",
             @"jwtConfiguration" : @"JwtConfiguration",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)authorizerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REQUEST"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeRequest);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeJwt);
        }
        return @(AWSapigatewayAuthorizerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizerTypeRequest:
                return @"REQUEST";
            case AWSapigatewayAuthorizerTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jwtConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayJWTConfiguration class]];
}

@end

@implementation AWSapigatewayUpdateAuthorizerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerCredentialsArn" : @"AuthorizerCredentialsArn",
             @"authorizerId" : @"AuthorizerId",
             @"authorizerResultTtlInSeconds" : @"AuthorizerResultTtlInSeconds",
             @"authorizerType" : @"AuthorizerType",
             @"authorizerUri" : @"AuthorizerUri",
             @"identitySource" : @"IdentitySource",
             @"identityValidationExpression" : @"IdentityValidationExpression",
             @"jwtConfiguration" : @"JwtConfiguration",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)authorizerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REQUEST"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeRequest);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizerTypeJwt);
        }
        return @(AWSapigatewayAuthorizerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizerTypeRequest:
                return @"REQUEST";
            case AWSapigatewayAuthorizerTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jwtConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayJWTConfiguration class]];
}

@end

@implementation AWSapigatewayUpdateDeploymentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             };
}

@end

@implementation AWSapigatewayUpdateDeploymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"deploymentId" : @"DeploymentId",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSapigatewayUpdateDeploymentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoDeployed" : @"AutoDeployed",
             @"createdDate" : @"CreatedDate",
             @"deploymentId" : @"DeploymentId",
             @"deploymentStatus" : @"DeploymentStatus",
             @"deploymentStatusMessage" : @"DeploymentStatusMessage",
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deploymentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusPending);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYED"] == NSOrderedSame) {
            return @(AWSapigatewayDeploymentStatusDeployed);
        }
        return @(AWSapigatewayDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayDeploymentStatusPending:
                return @"PENDING";
            case AWSapigatewayDeploymentStatusFailed:
                return @"FAILED";
            case AWSapigatewayDeploymentStatusDeployed:
                return @"DEPLOYED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayUpdateDomainNameInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainNameConfigurations" : @"DomainNameConfigurations",
             };
}

+ (NSValueTransformer *)domainNameConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDomainNameConfiguration class]];
}

@end

@implementation AWSapigatewayUpdateDomainNameRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"domainNameConfigurations" : @"DomainNameConfigurations",
             };
}

+ (NSValueTransformer *)domainNameConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDomainNameConfiguration class]];
}

@end

@implementation AWSapigatewayUpdateDomainNameResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiMappingSelectionExpression" : @"ApiMappingSelectionExpression",
             @"domainName" : @"DomainName",
             @"domainNameConfigurations" : @"DomainNameConfigurations",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)domainNameConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayDomainNameConfiguration class]];
}

@end

@implementation AWSapigatewayUpdateIntegrationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"ConnectionId",
             @"connectionType" : @"ConnectionType",
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"integrationMethod" : @"IntegrationMethod",
             @"integrationType" : @"IntegrationType",
             @"integrationUri" : @"IntegrationUri",
             @"passthroughBehavior" : @"PassthroughBehavior",
             @"payloadFormatVersion" : @"PayloadFormatVersion",
             @"requestParameters" : @"RequestParameters",
             @"requestTemplates" : @"RequestTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             @"timeoutInMillis" : @"TimeoutInMillis",
             @"tlsConfig" : @"TlsConfig",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNET"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeInternet);
        }
        if ([value caseInsensitiveCompare:@"VPC_LINK"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeVpcLink);
        }
        return @(AWSapigatewayConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayConnectionTypeInternet:
                return @"INTERNET";
            case AWSapigatewayConnectionTypeVpcLink:
                return @"VPC_LINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAws);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"MOCK"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeMock);
        }
        if ([value caseInsensitiveCompare:@"HTTP_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttpProxy);
        }
        if ([value caseInsensitiveCompare:@"AWS_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAwsProxy);
        }
        return @(AWSapigatewayIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayIntegrationTypeAws:
                return @"AWS";
            case AWSapigatewayIntegrationTypeHttp:
                return @"HTTP";
            case AWSapigatewayIntegrationTypeMock:
                return @"MOCK";
            case AWSapigatewayIntegrationTypeHttpProxy:
                return @"HTTP_PROXY";
            case AWSapigatewayIntegrationTypeAwsProxy:
                return @"AWS_PROXY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHEN_NO_MATCH"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoMatch);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorNever);
        }
        if ([value caseInsensitiveCompare:@"WHEN_NO_TEMPLATES"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoTemplates);
        }
        return @(AWSapigatewayPassthroughBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayPassthroughBehaviorWhenNoMatch:
                return @"WHEN_NO_MATCH";
            case AWSapigatewayPassthroughBehaviorNever:
                return @"NEVER";
            case AWSapigatewayPassthroughBehaviorWhenNoTemplates:
                return @"WHEN_NO_TEMPLATES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tlsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayTlsConfigInput class]];
}

@end

@implementation AWSapigatewayUpdateIntegrationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"connectionId" : @"ConnectionId",
             @"connectionType" : @"ConnectionType",
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"integrationId" : @"IntegrationId",
             @"integrationMethod" : @"IntegrationMethod",
             @"integrationType" : @"IntegrationType",
             @"integrationUri" : @"IntegrationUri",
             @"passthroughBehavior" : @"PassthroughBehavior",
             @"payloadFormatVersion" : @"PayloadFormatVersion",
             @"requestParameters" : @"RequestParameters",
             @"requestTemplates" : @"RequestTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             @"timeoutInMillis" : @"TimeoutInMillis",
             @"tlsConfig" : @"TlsConfig",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNET"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeInternet);
        }
        if ([value caseInsensitiveCompare:@"VPC_LINK"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeVpcLink);
        }
        return @(AWSapigatewayConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayConnectionTypeInternet:
                return @"INTERNET";
            case AWSapigatewayConnectionTypeVpcLink:
                return @"VPC_LINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAws);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"MOCK"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeMock);
        }
        if ([value caseInsensitiveCompare:@"HTTP_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttpProxy);
        }
        if ([value caseInsensitiveCompare:@"AWS_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAwsProxy);
        }
        return @(AWSapigatewayIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayIntegrationTypeAws:
                return @"AWS";
            case AWSapigatewayIntegrationTypeHttp:
                return @"HTTP";
            case AWSapigatewayIntegrationTypeMock:
                return @"MOCK";
            case AWSapigatewayIntegrationTypeHttpProxy:
                return @"HTTP_PROXY";
            case AWSapigatewayIntegrationTypeAwsProxy:
                return @"AWS_PROXY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHEN_NO_MATCH"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoMatch);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorNever);
        }
        if ([value caseInsensitiveCompare:@"WHEN_NO_TEMPLATES"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoTemplates);
        }
        return @(AWSapigatewayPassthroughBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayPassthroughBehaviorWhenNoMatch:
                return @"WHEN_NO_MATCH";
            case AWSapigatewayPassthroughBehaviorNever:
                return @"NEVER";
            case AWSapigatewayPassthroughBehaviorWhenNoTemplates:
                return @"WHEN_NO_TEMPLATES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tlsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayTlsConfigInput class]];
}

@end

@implementation AWSapigatewayUpdateIntegrationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"connectionId" : @"ConnectionId",
             @"connectionType" : @"ConnectionType",
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"credentialsArn" : @"CredentialsArn",
             @"detail" : @"Description",
             @"integrationId" : @"IntegrationId",
             @"integrationMethod" : @"IntegrationMethod",
             @"integrationResponseSelectionExpression" : @"IntegrationResponseSelectionExpression",
             @"integrationType" : @"IntegrationType",
             @"integrationUri" : @"IntegrationUri",
             @"passthroughBehavior" : @"PassthroughBehavior",
             @"payloadFormatVersion" : @"PayloadFormatVersion",
             @"requestParameters" : @"RequestParameters",
             @"requestTemplates" : @"RequestTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             @"timeoutInMillis" : @"TimeoutInMillis",
             @"tlsConfig" : @"TlsConfig",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNET"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeInternet);
        }
        if ([value caseInsensitiveCompare:@"VPC_LINK"] == NSOrderedSame) {
            return @(AWSapigatewayConnectionTypeVpcLink);
        }
        return @(AWSapigatewayConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayConnectionTypeInternet:
                return @"INTERNET";
            case AWSapigatewayConnectionTypeVpcLink:
                return @"VPC_LINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAws);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"MOCK"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeMock);
        }
        if ([value caseInsensitiveCompare:@"HTTP_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeHttpProxy);
        }
        if ([value caseInsensitiveCompare:@"AWS_PROXY"] == NSOrderedSame) {
            return @(AWSapigatewayIntegrationTypeAwsProxy);
        }
        return @(AWSapigatewayIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayIntegrationTypeAws:
                return @"AWS";
            case AWSapigatewayIntegrationTypeHttp:
                return @"HTTP";
            case AWSapigatewayIntegrationTypeMock:
                return @"MOCK";
            case AWSapigatewayIntegrationTypeHttpProxy:
                return @"HTTP_PROXY";
            case AWSapigatewayIntegrationTypeAwsProxy:
                return @"AWS_PROXY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHEN_NO_MATCH"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoMatch);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorNever);
        }
        if ([value caseInsensitiveCompare:@"WHEN_NO_TEMPLATES"] == NSOrderedSame) {
            return @(AWSapigatewayPassthroughBehaviorWhenNoTemplates);
        }
        return @(AWSapigatewayPassthroughBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayPassthroughBehaviorWhenNoMatch:
                return @"WHEN_NO_MATCH";
            case AWSapigatewayPassthroughBehaviorNever:
                return @"NEVER";
            case AWSapigatewayPassthroughBehaviorWhenNoTemplates:
                return @"WHEN_NO_TEMPLATES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tlsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayTlsConfig class]];
}

@end

@implementation AWSapigatewayUpdateIntegrationResponseInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"integrationResponseKey" : @"IntegrationResponseKey",
             @"responseParameters" : @"ResponseParameters",
             @"responseTemplates" : @"ResponseTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             };
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayUpdateIntegrationResponseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"integrationId" : @"IntegrationId",
             @"integrationResponseId" : @"IntegrationResponseId",
             @"integrationResponseKey" : @"IntegrationResponseKey",
             @"responseParameters" : @"ResponseParameters",
             @"responseTemplates" : @"ResponseTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             };
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayUpdateIntegrationResponseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentHandlingStrategy" : @"ContentHandlingStrategy",
             @"integrationResponseId" : @"IntegrationResponseId",
             @"integrationResponseKey" : @"IntegrationResponseKey",
             @"responseParameters" : @"ResponseParameters",
             @"responseTemplates" : @"ResponseTemplates",
             @"templateSelectionExpression" : @"TemplateSelectionExpression",
             };
}

+ (NSValueTransformer *)contentHandlingStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERT_TO_BINARY"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToBinary);
        }
        if ([value caseInsensitiveCompare:@"CONVERT_TO_TEXT"] == NSOrderedSame) {
            return @(AWSapigatewayContentHandlingStrategyConvertToText);
        }
        return @(AWSapigatewayContentHandlingStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayContentHandlingStrategyConvertToBinary:
                return @"CONVERT_TO_BINARY";
            case AWSapigatewayContentHandlingStrategyConvertToText:
                return @"CONVERT_TO_TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayUpdateModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"schema" : @"Schema",
             };
}

@end

@implementation AWSapigatewayUpdateModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"contentType" : @"ContentType",
             @"detail" : @"Description",
             @"modelId" : @"ModelId",
             @"name" : @"Name",
             @"schema" : @"Schema",
             };
}

@end

@implementation AWSapigatewayUpdateModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"detail" : @"Description",
             @"modelId" : @"ModelId",
             @"name" : @"Name",
             @"schema" : @"Schema",
             };
}

@end

@implementation AWSapigatewayUpdateRouteInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKeyRequired" : @"ApiKeyRequired",
             @"authorizationScopes" : @"AuthorizationScopes",
             @"authorizationType" : @"AuthorizationType",
             @"authorizerId" : @"AuthorizerId",
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"operationName" : @"OperationName",
             @"requestModels" : @"RequestModels",
             @"requestParameters" : @"RequestParameters",
             @"routeKey" : @"RouteKey",
             @"routeResponseSelectionExpression" : @"RouteResponseSelectionExpression",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)authorizationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeAwsIam);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeJwt);
        }
        return @(AWSapigatewayAuthorizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizationTypeNone:
                return @"NONE";
            case AWSapigatewayAuthorizationTypeAwsIam:
                return @"AWS_IAM";
            case AWSapigatewayAuthorizationTypeCustom:
                return @"CUSTOM";
            case AWSapigatewayAuthorizationTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayUpdateRouteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"apiKeyRequired" : @"ApiKeyRequired",
             @"authorizationScopes" : @"AuthorizationScopes",
             @"authorizationType" : @"AuthorizationType",
             @"authorizerId" : @"AuthorizerId",
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"operationName" : @"OperationName",
             @"requestModels" : @"RequestModels",
             @"requestParameters" : @"RequestParameters",
             @"routeId" : @"RouteId",
             @"routeKey" : @"RouteKey",
             @"routeResponseSelectionExpression" : @"RouteResponseSelectionExpression",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)authorizationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeAwsIam);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeJwt);
        }
        return @(AWSapigatewayAuthorizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizationTypeNone:
                return @"NONE";
            case AWSapigatewayAuthorizationTypeAwsIam:
                return @"AWS_IAM";
            case AWSapigatewayAuthorizationTypeCustom:
                return @"CUSTOM";
            case AWSapigatewayAuthorizationTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayUpdateRouteResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"apiKeyRequired" : @"ApiKeyRequired",
             @"authorizationScopes" : @"AuthorizationScopes",
             @"authorizationType" : @"AuthorizationType",
             @"authorizerId" : @"AuthorizerId",
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"operationName" : @"OperationName",
             @"requestModels" : @"RequestModels",
             @"requestParameters" : @"RequestParameters",
             @"routeId" : @"RouteId",
             @"routeKey" : @"RouteKey",
             @"routeResponseSelectionExpression" : @"RouteResponseSelectionExpression",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)authorizationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeAwsIam);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"JWT"] == NSOrderedSame) {
            return @(AWSapigatewayAuthorizationTypeJwt);
        }
        return @(AWSapigatewayAuthorizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayAuthorizationTypeNone:
                return @"NONE";
            case AWSapigatewayAuthorizationTypeAwsIam:
                return @"AWS_IAM";
            case AWSapigatewayAuthorizationTypeCustom:
                return @"CUSTOM";
            case AWSapigatewayAuthorizationTypeJwt:
                return @"JWT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayUpdateRouteResponseInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"responseModels" : @"ResponseModels",
             @"responseParameters" : @"ResponseParameters",
             @"routeResponseKey" : @"RouteResponseKey",
             };
}

+ (NSValueTransformer *)responseParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayUpdateRouteResponseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiId" : @"ApiId",
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"responseModels" : @"ResponseModels",
             @"responseParameters" : @"ResponseParameters",
             @"routeId" : @"RouteId",
             @"routeResponseId" : @"RouteResponseId",
             @"routeResponseKey" : @"RouteResponseKey",
             };
}

+ (NSValueTransformer *)responseParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayUpdateRouteResponseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelSelectionExpression" : @"ModelSelectionExpression",
             @"responseModels" : @"ResponseModels",
             @"responseParameters" : @"ResponseParameters",
             @"routeResponseId" : @"RouteResponseId",
             @"routeResponseKey" : @"RouteResponseKey",
             };
}

+ (NSValueTransformer *)responseParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayParameterConstraints class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayUpdateStageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessLogSettings" : @"AccessLogSettings",
             @"autoDeploy" : @"AutoDeploy",
             @"clientCertificateId" : @"ClientCertificateId",
             @"defaultRouteSettings" : @"DefaultRouteSettings",
             @"deploymentId" : @"DeploymentId",
             @"detail" : @"Description",
             @"routeSettings" : @"RouteSettings",
             @"stageVariables" : @"StageVariables",
             };
}

+ (NSValueTransformer *)accessLogSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayAccessLogSettings class]];
}

+ (NSValueTransformer *)defaultRouteSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayRouteSettings class]];
}

+ (NSValueTransformer *)routeSettingsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayRouteSettings class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayUpdateStageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessLogSettings" : @"AccessLogSettings",
             @"apiId" : @"ApiId",
             @"autoDeploy" : @"AutoDeploy",
             @"clientCertificateId" : @"ClientCertificateId",
             @"defaultRouteSettings" : @"DefaultRouteSettings",
             @"deploymentId" : @"DeploymentId",
             @"detail" : @"Description",
             @"routeSettings" : @"RouteSettings",
             @"stageName" : @"StageName",
             @"stageVariables" : @"StageVariables",
             };
}

+ (NSValueTransformer *)accessLogSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayAccessLogSettings class]];
}

+ (NSValueTransformer *)defaultRouteSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayRouteSettings class]];
}

+ (NSValueTransformer *)routeSettingsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayRouteSettings class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayUpdateStageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessLogSettings" : @"AccessLogSettings",
             @"apiGatewayManaged" : @"ApiGatewayManaged",
             @"autoDeploy" : @"AutoDeploy",
             @"clientCertificateId" : @"ClientCertificateId",
             @"createdDate" : @"CreatedDate",
             @"defaultRouteSettings" : @"DefaultRouteSettings",
             @"deploymentId" : @"DeploymentId",
             @"detail" : @"Description",
             @"lastDeploymentStatusMessage" : @"LastDeploymentStatusMessage",
             @"lastUpdatedDate" : @"LastUpdatedDate",
             @"routeSettings" : @"RouteSettings",
             @"stageName" : @"StageName",
             @"stageVariables" : @"StageVariables",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)accessLogSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayAccessLogSettings class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)defaultRouteSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapigatewayRouteSettings class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)routeSettingsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapigatewayRouteSettings class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSapigatewayUpdateVpcLinkInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSapigatewayUpdateVpcLinkRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"vpcLinkId" : @"VpcLinkId",
             };
}

@end

@implementation AWSapigatewayUpdateVpcLinkResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"CreatedDate",
             @"name" : @"Name",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             @"vpcLinkId" : @"VpcLinkId",
             @"vpcLinkStatus" : @"VpcLinkStatus",
             @"vpcLinkStatusMessage" : @"VpcLinkStatusMessage",
             @"vpcLinkVersion" : @"VpcLinkVersion",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcLinkStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusPending);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusInactive);
        }
        return @(AWSapigatewayVpcLinkStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayVpcLinkStatusPending:
                return @"PENDING";
            case AWSapigatewayVpcLinkStatusAvailable:
                return @"AVAILABLE";
            case AWSapigatewayVpcLinkStatusDeleting:
                return @"DELETING";
            case AWSapigatewayVpcLinkStatusFailed:
                return @"FAILED";
            case AWSapigatewayVpcLinkStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcLinkVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"V2"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkVersionV2);
        }
        return @(AWSapigatewayVpcLinkVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayVpcLinkVersionV2:
                return @"V2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayVpcLink

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"CreatedDate",
             @"name" : @"Name",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             @"vpcLinkId" : @"VpcLinkId",
             @"vpcLinkStatus" : @"VpcLinkStatus",
             @"vpcLinkStatusMessage" : @"VpcLinkStatusMessage",
             @"vpcLinkVersion" : @"VpcLinkVersion",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcLinkStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusPending);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkStatusInactive);
        }
        return @(AWSapigatewayVpcLinkStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayVpcLinkStatusPending:
                return @"PENDING";
            case AWSapigatewayVpcLinkStatusAvailable:
                return @"AVAILABLE";
            case AWSapigatewayVpcLinkStatusDeleting:
                return @"DELETING";
            case AWSapigatewayVpcLinkStatusFailed:
                return @"FAILED";
            case AWSapigatewayVpcLinkStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcLinkVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"V2"] == NSOrderedSame) {
            return @(AWSapigatewayVpcLinkVersionV2);
        }
        return @(AWSapigatewayVpcLinkVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapigatewayVpcLinkVersionV2:
                return @"V2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapigatewayVpcLinks

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapigatewayVpcLink class]];
}

@end
