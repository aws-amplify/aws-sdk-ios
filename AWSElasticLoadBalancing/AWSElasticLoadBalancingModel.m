//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSElasticLoadBalancingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSElasticLoadBalancingErrorDomain = @"com.amazonaws.AWSElasticLoadBalancingErrorDomain";

@implementation AWSElasticLoadBalancingAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticateCognitoConfig" : @"AuthenticateCognitoConfig",
             @"authenticateOidcConfig" : @"AuthenticateOidcConfig",
             @"fixedResponseConfig" : @"FixedResponseConfig",
             @"forwardConfig" : @"ForwardConfig",
             @"order" : @"Order",
             @"redirectConfig" : @"RedirectConfig",
             @"targetGroupArn" : @"TargetGroupArn",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)authenticateCognitoConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingAuthenticateCognitoActionConfig class]];
}

+ (NSValueTransformer *)authenticateOidcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingAuthenticateOidcActionConfig class]];
}

+ (NSValueTransformer *)fixedResponseConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingFixedResponseActionConfig class]];
}

+ (NSValueTransformer *)forwardConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingForwardActionConfig class]];
}

+ (NSValueTransformer *)redirectConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingRedirectActionConfig class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"forward"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingActionTypeEnumForward);
        }
        if ([value caseInsensitiveCompare:@"authenticate-oidc"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingActionTypeEnumAuthenticateOidc);
        }
        if ([value caseInsensitiveCompare:@"authenticate-cognito"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingActionTypeEnumAuthenticateCognito);
        }
        if ([value caseInsensitiveCompare:@"redirect"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingActionTypeEnumRedirect);
        }
        if ([value caseInsensitiveCompare:@"fixed-response"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingActionTypeEnumFixedResponse);
        }
        return @(AWSElasticLoadBalancingActionTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingActionTypeEnumForward:
                return @"forward";
            case AWSElasticLoadBalancingActionTypeEnumAuthenticateOidc:
                return @"authenticate-oidc";
            case AWSElasticLoadBalancingActionTypeEnumAuthenticateCognito:
                return @"authenticate-cognito";
            case AWSElasticLoadBalancingActionTypeEnumRedirect:
                return @"redirect";
            case AWSElasticLoadBalancingActionTypeEnumFixedResponse:
                return @"fixed-response";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingAddListenerCertificatesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificates" : @"Certificates",
             @"listenerArn" : @"ListenerArn",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingCertificate class]];
}

@end

@implementation AWSElasticLoadBalancingAddListenerCertificatesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificates" : @"Certificates",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingCertificate class]];
}

@end

@implementation AWSElasticLoadBalancingAddTagsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArns" : @"ResourceArns",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTag class]];
}

@end

@implementation AWSElasticLoadBalancingAddTagsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingAuthenticateCognitoActionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationRequestExtraParams" : @"AuthenticationRequestExtraParams",
             @"onUnauthenticatedRequest" : @"OnUnauthenticatedRequest",
             @"scope" : @"Scope",
             @"sessionCookieName" : @"SessionCookieName",
             @"sessionTimeout" : @"SessionTimeout",
             @"userPoolArn" : @"UserPoolArn",
             @"userPoolClientId" : @"UserPoolClientId",
             @"userPoolDomain" : @"UserPoolDomain",
             };
}

+ (NSValueTransformer *)onUnauthenticatedRequestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"deny"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnumDeny);
        }
        if ([value caseInsensitiveCompare:@"allow"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnumAllow);
        }
        if ([value caseInsensitiveCompare:@"authenticate"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnumAuthenticate);
        }
        return @(AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnumDeny:
                return @"deny";
            case AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnumAllow:
                return @"allow";
            case AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnumAuthenticate:
                return @"authenticate";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingAuthenticateOidcActionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationRequestExtraParams" : @"AuthenticationRequestExtraParams",
             @"authorizationEndpoint" : @"AuthorizationEndpoint",
             @"clientId" : @"ClientId",
             @"clientSecret" : @"ClientSecret",
             @"issuer" : @"Issuer",
             @"onUnauthenticatedRequest" : @"OnUnauthenticatedRequest",
             @"scope" : @"Scope",
             @"sessionCookieName" : @"SessionCookieName",
             @"sessionTimeout" : @"SessionTimeout",
             @"tokenEndpoint" : @"TokenEndpoint",
             @"useExistingClientSecret" : @"UseExistingClientSecret",
             @"userInfoEndpoint" : @"UserInfoEndpoint",
             };
}

+ (NSValueTransformer *)onUnauthenticatedRequestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"deny"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnumDeny);
        }
        if ([value caseInsensitiveCompare:@"allow"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnumAllow);
        }
        if ([value caseInsensitiveCompare:@"authenticate"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnumAuthenticate);
        }
        return @(AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnumDeny:
                return @"deny";
            case AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnumAllow:
                return @"allow";
            case AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnumAuthenticate:
                return @"authenticate";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingAvailabilityZone

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerAddresses" : @"LoadBalancerAddresses",
             @"outpostId" : @"OutpostId",
             @"subnetId" : @"SubnetId",
             @"zoneName" : @"ZoneName",
             };
}

+ (NSValueTransformer *)loadBalancerAddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancerAddress class]];
}

@end

@implementation AWSElasticLoadBalancingCertificate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             @"isDefault" : @"IsDefault",
             };
}

@end

@implementation AWSElasticLoadBalancingCipher

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"priority" : @"Priority",
             };
}

@end

@implementation AWSElasticLoadBalancingCreateListenerInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alpnPolicy" : @"AlpnPolicy",
             @"certificates" : @"Certificates",
             @"defaultActions" : @"DefaultActions",
             @"loadBalancerArn" : @"LoadBalancerArn",
             @"port" : @"Port",
             @"protocols" : @"Protocol",
             @"sslPolicy" : @"SslPolicy",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingCertificate class]];
}

+ (NSValueTransformer *)defaultActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAction class]];
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttps);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcp);
        }
        if ([value caseInsensitiveCompare:@"TLS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTls);
        }
        if ([value caseInsensitiveCompare:@"UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumUdp);
        }
        if ([value caseInsensitiveCompare:@"TCP_UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcpUdp);
        }
        if ([value caseInsensitiveCompare:@"GENEVE"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumGeneve);
        }
        return @(AWSElasticLoadBalancingProtocolEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingProtocolEnumHttp:
                return @"HTTP";
            case AWSElasticLoadBalancingProtocolEnumHttps:
                return @"HTTPS";
            case AWSElasticLoadBalancingProtocolEnumTcp:
                return @"TCP";
            case AWSElasticLoadBalancingProtocolEnumTls:
                return @"TLS";
            case AWSElasticLoadBalancingProtocolEnumUdp:
                return @"UDP";
            case AWSElasticLoadBalancingProtocolEnumTcpUdp:
                return @"TCP_UDP";
            case AWSElasticLoadBalancingProtocolEnumGeneve:
                return @"GENEVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTag class]];
}

@end

@implementation AWSElasticLoadBalancingCreateListenerOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listeners" : @"Listeners",
             };
}

+ (NSValueTransformer *)listenersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingListener class]];
}

@end

@implementation AWSElasticLoadBalancingCreateLoadBalancerInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerOwnedIpv4Pool" : @"CustomerOwnedIpv4Pool",
             @"ipAddressType" : @"IpAddressType",
             @"name" : @"Name",
             @"scheme" : @"Scheme",
             @"securityGroups" : @"SecurityGroups",
             @"subnetMappings" : @"SubnetMappings",
             @"subnets" : @"Subnets",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)ipAddressTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeIpv4);
        }
        if ([value caseInsensitiveCompare:@"dualstack"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeDualstack);
        }
        return @(AWSElasticLoadBalancingIpAddressTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingIpAddressTypeIpv4:
                return @"ipv4";
            case AWSElasticLoadBalancingIpAddressTypeDualstack:
                return @"dualstack";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)schemeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"internet-facing"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerSchemeEnumInternetFacing);
        }
        if ([value caseInsensitiveCompare:@"internal"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerSchemeEnumInternal);
        }
        return @(AWSElasticLoadBalancingLoadBalancerSchemeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingLoadBalancerSchemeEnumInternetFacing:
                return @"internet-facing";
            case AWSElasticLoadBalancingLoadBalancerSchemeEnumInternal:
                return @"internal";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)subnetMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingSubnetMapping class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"application"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerTypeEnumApplication);
        }
        if ([value caseInsensitiveCompare:@"network"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerTypeEnumNetwork);
        }
        if ([value caseInsensitiveCompare:@"gateway"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerTypeEnumGateway);
        }
        return @(AWSElasticLoadBalancingLoadBalancerTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingLoadBalancerTypeEnumApplication:
                return @"application";
            case AWSElasticLoadBalancingLoadBalancerTypeEnumNetwork:
                return @"network";
            case AWSElasticLoadBalancingLoadBalancerTypeEnumGateway:
                return @"gateway";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingCreateLoadBalancerOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancers" : @"LoadBalancers",
             };
}

+ (NSValueTransformer *)loadBalancersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancer class]];
}

@end

@implementation AWSElasticLoadBalancingCreateRuleInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"conditions" : @"Conditions",
             @"listenerArn" : @"ListenerArn",
             @"priority" : @"Priority",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAction class]];
}

+ (NSValueTransformer *)conditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingRuleCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTag class]];
}

@end

@implementation AWSElasticLoadBalancingCreateRuleOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingRule class]];
}

@end

@implementation AWSElasticLoadBalancingCreateTargetGroupInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckEnabled" : @"HealthCheckEnabled",
             @"healthCheckIntervalSeconds" : @"HealthCheckIntervalSeconds",
             @"healthCheckPath" : @"HealthCheckPath",
             @"healthCheckPort" : @"HealthCheckPort",
             @"healthCheckProtocol" : @"HealthCheckProtocol",
             @"healthCheckTimeoutSeconds" : @"HealthCheckTimeoutSeconds",
             @"healthyThresholdCount" : @"HealthyThresholdCount",
             @"ipAddressType" : @"IpAddressType",
             @"matcher" : @"Matcher",
             @"name" : @"Name",
             @"port" : @"Port",
             @"protocols" : @"Protocol",
             @"protocolVersion" : @"ProtocolVersion",
             @"tags" : @"Tags",
             @"targetType" : @"TargetType",
             @"unhealthyThresholdCount" : @"UnhealthyThresholdCount",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)healthCheckProtocolJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttps);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcp);
        }
        if ([value caseInsensitiveCompare:@"TLS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTls);
        }
        if ([value caseInsensitiveCompare:@"UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumUdp);
        }
        if ([value caseInsensitiveCompare:@"TCP_UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcpUdp);
        }
        if ([value caseInsensitiveCompare:@"GENEVE"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumGeneve);
        }
        return @(AWSElasticLoadBalancingProtocolEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingProtocolEnumHttp:
                return @"HTTP";
            case AWSElasticLoadBalancingProtocolEnumHttps:
                return @"HTTPS";
            case AWSElasticLoadBalancingProtocolEnumTcp:
                return @"TCP";
            case AWSElasticLoadBalancingProtocolEnumTls:
                return @"TLS";
            case AWSElasticLoadBalancingProtocolEnumUdp:
                return @"UDP";
            case AWSElasticLoadBalancingProtocolEnumTcpUdp:
                return @"TCP_UDP";
            case AWSElasticLoadBalancingProtocolEnumGeneve:
                return @"GENEVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ipAddressTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumIpv4);
        }
        if ([value caseInsensitiveCompare:@"ipv6"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumIpv6);
        }
        return @(AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumIpv4:
                return @"ipv4";
            case AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumIpv6:
                return @"ipv6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)matcherJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingMatcher class]];
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttps);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcp);
        }
        if ([value caseInsensitiveCompare:@"TLS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTls);
        }
        if ([value caseInsensitiveCompare:@"UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumUdp);
        }
        if ([value caseInsensitiveCompare:@"TCP_UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcpUdp);
        }
        if ([value caseInsensitiveCompare:@"GENEVE"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumGeneve);
        }
        return @(AWSElasticLoadBalancingProtocolEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingProtocolEnumHttp:
                return @"HTTP";
            case AWSElasticLoadBalancingProtocolEnumHttps:
                return @"HTTPS";
            case AWSElasticLoadBalancingProtocolEnumTcp:
                return @"TCP";
            case AWSElasticLoadBalancingProtocolEnumTls:
                return @"TLS";
            case AWSElasticLoadBalancingProtocolEnumUdp:
                return @"UDP";
            case AWSElasticLoadBalancingProtocolEnumTcpUdp:
                return @"TCP_UDP";
            case AWSElasticLoadBalancingProtocolEnumGeneve:
                return @"GENEVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTag class]];
}

+ (NSValueTransformer *)targetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"instance"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetTypeEnumInstance);
        }
        if ([value caseInsensitiveCompare:@"ip"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetTypeEnumIp);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetTypeEnumLambda);
        }
        if ([value caseInsensitiveCompare:@"alb"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetTypeEnumAlb);
        }
        return @(AWSElasticLoadBalancingTargetTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingTargetTypeEnumInstance:
                return @"instance";
            case AWSElasticLoadBalancingTargetTypeEnumIp:
                return @"ip";
            case AWSElasticLoadBalancingTargetTypeEnumLambda:
                return @"lambda";
            case AWSElasticLoadBalancingTargetTypeEnumAlb:
                return @"alb";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingCreateTargetGroupOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroups" : @"TargetGroups",
             };
}

+ (NSValueTransformer *)targetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTargetGroup class]];
}

@end

@implementation AWSElasticLoadBalancingDeleteListenerInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listenerArn" : @"ListenerArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteListenerOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerArn" : @"LoadBalancerArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingDeleteRuleInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleArn" : @"RuleArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteRuleOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingDeleteTargetGroupInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroupArn" : @"TargetGroupArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteTargetGroupOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingDeregisterTargetsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroupArn" : @"TargetGroupArn",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTargetDescription class]];
}

@end

@implementation AWSElasticLoadBalancingDeregisterTargetsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingDescribeAccountLimitsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeAccountLimitsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limits" : @"Limits",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingLimit class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeListenerCertificatesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listenerArn" : @"ListenerArn",
             @"marker" : @"Marker",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeListenerCertificatesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificates" : @"Certificates",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingCertificate class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeListenersInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listenerArns" : @"ListenerArns",
             @"loadBalancerArn" : @"LoadBalancerArn",
             @"marker" : @"Marker",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeListenersOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listeners" : @"Listeners",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)listenersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingListener class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerArn" : @"LoadBalancerArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancerAttribute class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancersInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerArns" : @"LoadBalancerArns",
             @"marker" : @"Marker",
             @"names" : @"Names",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancersOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancers" : @"LoadBalancers",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)loadBalancersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancer class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeRulesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listenerArn" : @"ListenerArn",
             @"marker" : @"Marker",
             @"pageSize" : @"PageSize",
             @"ruleArns" : @"RuleArns",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeRulesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingRule class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeSSLPoliciesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerType" : @"LoadBalancerType",
             @"marker" : @"Marker",
             @"names" : @"Names",
             @"pageSize" : @"PageSize",
             };
}

+ (NSValueTransformer *)loadBalancerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"application"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerTypeEnumApplication);
        }
        if ([value caseInsensitiveCompare:@"network"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerTypeEnumNetwork);
        }
        if ([value caseInsensitiveCompare:@"gateway"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerTypeEnumGateway);
        }
        return @(AWSElasticLoadBalancingLoadBalancerTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingLoadBalancerTypeEnumApplication:
                return @"application";
            case AWSElasticLoadBalancingLoadBalancerTypeEnumNetwork:
                return @"network";
            case AWSElasticLoadBalancingLoadBalancerTypeEnumGateway:
                return @"gateway";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingDescribeSSLPoliciesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"sslPolicies" : @"SslPolicies",
             };
}

+ (NSValueTransformer *)sslPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingSslPolicy class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeTagsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArns" : @"ResourceArns",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeTagsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagDescriptions" : @"TagDescriptions",
             };
}

+ (NSValueTransformer *)tagDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTagDescription class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeTargetGroupAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroupArn" : @"TargetGroupArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTargetGroupAttribute class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeTargetGroupsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerArn" : @"LoadBalancerArn",
             @"marker" : @"Marker",
             @"names" : @"Names",
             @"pageSize" : @"PageSize",
             @"targetGroupArns" : @"TargetGroupArns",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeTargetGroupsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"targetGroups" : @"TargetGroups",
             };
}

+ (NSValueTransformer *)targetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTargetGroup class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeTargetHealthInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroupArn" : @"TargetGroupArn",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTargetDescription class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeTargetHealthOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetHealthDescriptions" : @"TargetHealthDescriptions",
             };
}

+ (NSValueTransformer *)targetHealthDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTargetHealthDescription class]];
}

@end

@implementation AWSElasticLoadBalancingFixedResponseActionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"messageBody" : @"MessageBody",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSElasticLoadBalancingForwardActionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroupStickinessConfig" : @"TargetGroupStickinessConfig",
             @"targetGroups" : @"TargetGroups",
             };
}

+ (NSValueTransformer *)targetGroupStickinessConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingTargetGroupStickinessConfig class]];
}

+ (NSValueTransformer *)targetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTargetGroupTuple class]];
}

@end

@implementation AWSElasticLoadBalancingHostHeaderConditionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticLoadBalancingHttpHeaderConditionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"httpHeaderName" : @"HttpHeaderName",
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticLoadBalancingHttpRequestMethodConditionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticLoadBalancingLimit

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"max" : @"Max",
             @"name" : @"Name",
             };
}

@end

@implementation AWSElasticLoadBalancingListener

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alpnPolicy" : @"AlpnPolicy",
             @"certificates" : @"Certificates",
             @"defaultActions" : @"DefaultActions",
             @"listenerArn" : @"ListenerArn",
             @"loadBalancerArn" : @"LoadBalancerArn",
             @"port" : @"Port",
             @"protocols" : @"Protocol",
             @"sslPolicy" : @"SslPolicy",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingCertificate class]];
}

+ (NSValueTransformer *)defaultActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAction class]];
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttps);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcp);
        }
        if ([value caseInsensitiveCompare:@"TLS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTls);
        }
        if ([value caseInsensitiveCompare:@"UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumUdp);
        }
        if ([value caseInsensitiveCompare:@"TCP_UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcpUdp);
        }
        if ([value caseInsensitiveCompare:@"GENEVE"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumGeneve);
        }
        return @(AWSElasticLoadBalancingProtocolEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingProtocolEnumHttp:
                return @"HTTP";
            case AWSElasticLoadBalancingProtocolEnumHttps:
                return @"HTTPS";
            case AWSElasticLoadBalancingProtocolEnumTcp:
                return @"TCP";
            case AWSElasticLoadBalancingProtocolEnumTls:
                return @"TLS";
            case AWSElasticLoadBalancingProtocolEnumUdp:
                return @"UDP";
            case AWSElasticLoadBalancingProtocolEnumTcpUdp:
                return @"TCP_UDP";
            case AWSElasticLoadBalancingProtocolEnumGeneve:
                return @"GENEVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingLoadBalancer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"canonicalHostedZoneId" : @"CanonicalHostedZoneId",
             @"createdTime" : @"CreatedTime",
             @"customerOwnedIpv4Pool" : @"CustomerOwnedIpv4Pool",
             @"DNSName" : @"DNSName",
             @"ipAddressType" : @"IpAddressType",
             @"loadBalancerArn" : @"LoadBalancerArn",
             @"loadBalancerName" : @"LoadBalancerName",
             @"scheme" : @"Scheme",
             @"securityGroups" : @"SecurityGroups",
             @"state" : @"State",
             @"types" : @"Type",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)availabilityZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAvailabilityZone class]];
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)ipAddressTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeIpv4);
        }
        if ([value caseInsensitiveCompare:@"dualstack"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeDualstack);
        }
        return @(AWSElasticLoadBalancingIpAddressTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingIpAddressTypeIpv4:
                return @"ipv4";
            case AWSElasticLoadBalancingIpAddressTypeDualstack:
                return @"dualstack";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)schemeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"internet-facing"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerSchemeEnumInternetFacing);
        }
        if ([value caseInsensitiveCompare:@"internal"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerSchemeEnumInternal);
        }
        return @(AWSElasticLoadBalancingLoadBalancerSchemeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingLoadBalancerSchemeEnumInternetFacing:
                return @"internet-facing";
            case AWSElasticLoadBalancingLoadBalancerSchemeEnumInternal:
                return @"internal";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancerState class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"application"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerTypeEnumApplication);
        }
        if ([value caseInsensitiveCompare:@"network"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerTypeEnumNetwork);
        }
        if ([value caseInsensitiveCompare:@"gateway"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerTypeEnumGateway);
        }
        return @(AWSElasticLoadBalancingLoadBalancerTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingLoadBalancerTypeEnumApplication:
                return @"application";
            case AWSElasticLoadBalancingLoadBalancerTypeEnumNetwork:
                return @"network";
            case AWSElasticLoadBalancingLoadBalancerTypeEnumGateway:
                return @"gateway";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingLoadBalancerAddress

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"IPv6Address" : @"IPv6Address",
             @"ipAddress" : @"IpAddress",
             @"privateIPv4Address" : @"PrivateIPv4Address",
             };
}

@end

@implementation AWSElasticLoadBalancingLoadBalancerAttribute

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticLoadBalancingLoadBalancerState

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"reason" : @"Reason",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerStateEnumActive);
        }
        if ([value caseInsensitiveCompare:@"provisioning"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerStateEnumProvisioning);
        }
        if ([value caseInsensitiveCompare:@"active_impaired"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerStateEnumActiveImpaired);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingLoadBalancerStateEnumFailed);
        }
        return @(AWSElasticLoadBalancingLoadBalancerStateEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingLoadBalancerStateEnumActive:
                return @"active";
            case AWSElasticLoadBalancingLoadBalancerStateEnumProvisioning:
                return @"provisioning";
            case AWSElasticLoadBalancingLoadBalancerStateEnumActiveImpaired:
                return @"active_impaired";
            case AWSElasticLoadBalancingLoadBalancerStateEnumFailed:
                return @"failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingMatcher

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grpcCode" : @"GrpcCode",
             @"httpCode" : @"HttpCode",
             };
}

@end

@implementation AWSElasticLoadBalancingModifyListenerInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alpnPolicy" : @"AlpnPolicy",
             @"certificates" : @"Certificates",
             @"defaultActions" : @"DefaultActions",
             @"listenerArn" : @"ListenerArn",
             @"port" : @"Port",
             @"protocols" : @"Protocol",
             @"sslPolicy" : @"SslPolicy",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingCertificate class]];
}

+ (NSValueTransformer *)defaultActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAction class]];
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttps);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcp);
        }
        if ([value caseInsensitiveCompare:@"TLS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTls);
        }
        if ([value caseInsensitiveCompare:@"UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumUdp);
        }
        if ([value caseInsensitiveCompare:@"TCP_UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcpUdp);
        }
        if ([value caseInsensitiveCompare:@"GENEVE"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumGeneve);
        }
        return @(AWSElasticLoadBalancingProtocolEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingProtocolEnumHttp:
                return @"HTTP";
            case AWSElasticLoadBalancingProtocolEnumHttps:
                return @"HTTPS";
            case AWSElasticLoadBalancingProtocolEnumTcp:
                return @"TCP";
            case AWSElasticLoadBalancingProtocolEnumTls:
                return @"TLS";
            case AWSElasticLoadBalancingProtocolEnumUdp:
                return @"UDP";
            case AWSElasticLoadBalancingProtocolEnumTcpUdp:
                return @"TCP_UDP";
            case AWSElasticLoadBalancingProtocolEnumGeneve:
                return @"GENEVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingModifyListenerOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listeners" : @"Listeners",
             };
}

+ (NSValueTransformer *)listenersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingListener class]];
}

@end

@implementation AWSElasticLoadBalancingModifyLoadBalancerAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"loadBalancerArn" : @"LoadBalancerArn",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancerAttribute class]];
}

@end

@implementation AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancerAttribute class]];
}

@end

@implementation AWSElasticLoadBalancingModifyRuleInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"conditions" : @"Conditions",
             @"ruleArn" : @"RuleArn",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAction class]];
}

+ (NSValueTransformer *)conditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingRuleCondition class]];
}

@end

@implementation AWSElasticLoadBalancingModifyRuleOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingRule class]];
}

@end

@implementation AWSElasticLoadBalancingModifyTargetGroupAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"targetGroupArn" : @"TargetGroupArn",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTargetGroupAttribute class]];
}

@end

@implementation AWSElasticLoadBalancingModifyTargetGroupAttributesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTargetGroupAttribute class]];
}

@end

@implementation AWSElasticLoadBalancingModifyTargetGroupInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckEnabled" : @"HealthCheckEnabled",
             @"healthCheckIntervalSeconds" : @"HealthCheckIntervalSeconds",
             @"healthCheckPath" : @"HealthCheckPath",
             @"healthCheckPort" : @"HealthCheckPort",
             @"healthCheckProtocol" : @"HealthCheckProtocol",
             @"healthCheckTimeoutSeconds" : @"HealthCheckTimeoutSeconds",
             @"healthyThresholdCount" : @"HealthyThresholdCount",
             @"matcher" : @"Matcher",
             @"targetGroupArn" : @"TargetGroupArn",
             @"unhealthyThresholdCount" : @"UnhealthyThresholdCount",
             };
}

+ (NSValueTransformer *)healthCheckProtocolJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttps);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcp);
        }
        if ([value caseInsensitiveCompare:@"TLS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTls);
        }
        if ([value caseInsensitiveCompare:@"UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumUdp);
        }
        if ([value caseInsensitiveCompare:@"TCP_UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcpUdp);
        }
        if ([value caseInsensitiveCompare:@"GENEVE"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumGeneve);
        }
        return @(AWSElasticLoadBalancingProtocolEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingProtocolEnumHttp:
                return @"HTTP";
            case AWSElasticLoadBalancingProtocolEnumHttps:
                return @"HTTPS";
            case AWSElasticLoadBalancingProtocolEnumTcp:
                return @"TCP";
            case AWSElasticLoadBalancingProtocolEnumTls:
                return @"TLS";
            case AWSElasticLoadBalancingProtocolEnumUdp:
                return @"UDP";
            case AWSElasticLoadBalancingProtocolEnumTcpUdp:
                return @"TCP_UDP";
            case AWSElasticLoadBalancingProtocolEnumGeneve:
                return @"GENEVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)matcherJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingMatcher class]];
}

@end

@implementation AWSElasticLoadBalancingModifyTargetGroupOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroups" : @"TargetGroups",
             };
}

+ (NSValueTransformer *)targetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTargetGroup class]];
}

@end

@implementation AWSElasticLoadBalancingPathPatternConditionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticLoadBalancingQueryStringConditionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)valuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingQueryStringKeyValuePair class]];
}

@end

@implementation AWSElasticLoadBalancingQueryStringKeyValuePair

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticLoadBalancingRedirectActionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"host" : @"Host",
             @"path" : @"Path",
             @"port" : @"Port",
             @"protocols" : @"Protocol",
             @"query" : @"Query",
             @"statusCode" : @"StatusCode",
             };
}

+ (NSValueTransformer *)statusCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP_301"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingRedirectActionStatusCodeEnumHttp301);
        }
        if ([value caseInsensitiveCompare:@"HTTP_302"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingRedirectActionStatusCodeEnumHttp302);
        }
        return @(AWSElasticLoadBalancingRedirectActionStatusCodeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingRedirectActionStatusCodeEnumHttp301:
                return @"HTTP_301";
            case AWSElasticLoadBalancingRedirectActionStatusCodeEnumHttp302:
                return @"HTTP_302";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingRegisterTargetsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroupArn" : @"TargetGroupArn",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTargetDescription class]];
}

@end

@implementation AWSElasticLoadBalancingRegisterTargetsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingRemoveListenerCertificatesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificates" : @"Certificates",
             @"listenerArn" : @"ListenerArn",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingCertificate class]];
}

@end

@implementation AWSElasticLoadBalancingRemoveListenerCertificatesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingRemoveTagsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArns" : @"ResourceArns",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSElasticLoadBalancingRemoveTagsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"conditions" : @"Conditions",
             @"isDefault" : @"IsDefault",
             @"priority" : @"Priority",
             @"ruleArn" : @"RuleArn",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAction class]];
}

+ (NSValueTransformer *)conditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingRuleCondition class]];
}

@end

@implementation AWSElasticLoadBalancingRuleCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"field" : @"Field",
             @"hostHeaderConfig" : @"HostHeaderConfig",
             @"httpHeaderConfig" : @"HttpHeaderConfig",
             @"httpRequestMethodConfig" : @"HttpRequestMethodConfig",
             @"pathPatternConfig" : @"PathPatternConfig",
             @"queryStringConfig" : @"QueryStringConfig",
             @"sourceIpConfig" : @"SourceIpConfig",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)hostHeaderConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingHostHeaderConditionConfig class]];
}

+ (NSValueTransformer *)httpHeaderConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingHttpHeaderConditionConfig class]];
}

+ (NSValueTransformer *)httpRequestMethodConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingHttpRequestMethodConditionConfig class]];
}

+ (NSValueTransformer *)pathPatternConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingPathPatternConditionConfig class]];
}

+ (NSValueTransformer *)queryStringConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingQueryStringConditionConfig class]];
}

+ (NSValueTransformer *)sourceIpConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingSourceIpConditionConfig class]];
}

@end

@implementation AWSElasticLoadBalancingRulePriorityPair

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"priority" : @"Priority",
             @"ruleArn" : @"RuleArn",
             };
}

@end

@implementation AWSElasticLoadBalancingSetIpAddressTypeInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipAddressType" : @"IpAddressType",
             @"loadBalancerArn" : @"LoadBalancerArn",
             };
}

+ (NSValueTransformer *)ipAddressTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeIpv4);
        }
        if ([value caseInsensitiveCompare:@"dualstack"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeDualstack);
        }
        return @(AWSElasticLoadBalancingIpAddressTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingIpAddressTypeIpv4:
                return @"ipv4";
            case AWSElasticLoadBalancingIpAddressTypeDualstack:
                return @"dualstack";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingSetIpAddressTypeOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipAddressType" : @"IpAddressType",
             };
}

+ (NSValueTransformer *)ipAddressTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeIpv4);
        }
        if ([value caseInsensitiveCompare:@"dualstack"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeDualstack);
        }
        return @(AWSElasticLoadBalancingIpAddressTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingIpAddressTypeIpv4:
                return @"ipv4";
            case AWSElasticLoadBalancingIpAddressTypeDualstack:
                return @"dualstack";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingSetRulePrioritiesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rulePriorities" : @"RulePriorities",
             };
}

+ (NSValueTransformer *)rulePrioritiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingRulePriorityPair class]];
}

@end

@implementation AWSElasticLoadBalancingSetRulePrioritiesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingRule class]];
}

@end

@implementation AWSElasticLoadBalancingSetSecurityGroupsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerArn" : @"LoadBalancerArn",
             @"securityGroups" : @"SecurityGroups",
             };
}

@end

@implementation AWSElasticLoadBalancingSetSecurityGroupsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             };
}

@end

@implementation AWSElasticLoadBalancingSetSubnetsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipAddressType" : @"IpAddressType",
             @"loadBalancerArn" : @"LoadBalancerArn",
             @"subnetMappings" : @"SubnetMappings",
             @"subnets" : @"Subnets",
             };
}

+ (NSValueTransformer *)ipAddressTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeIpv4);
        }
        if ([value caseInsensitiveCompare:@"dualstack"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeDualstack);
        }
        return @(AWSElasticLoadBalancingIpAddressTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingIpAddressTypeIpv4:
                return @"ipv4";
            case AWSElasticLoadBalancingIpAddressTypeDualstack:
                return @"dualstack";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)subnetMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingSubnetMapping class]];
}

@end

@implementation AWSElasticLoadBalancingSetSubnetsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"ipAddressType" : @"IpAddressType",
             };
}

+ (NSValueTransformer *)availabilityZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAvailabilityZone class]];
}

+ (NSValueTransformer *)ipAddressTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeIpv4);
        }
        if ([value caseInsensitiveCompare:@"dualstack"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingIpAddressTypeDualstack);
        }
        return @(AWSElasticLoadBalancingIpAddressTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingIpAddressTypeIpv4:
                return @"ipv4";
            case AWSElasticLoadBalancingIpAddressTypeDualstack:
                return @"dualstack";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingSourceIpConditionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticLoadBalancingSslPolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphers" : @"Ciphers",
             @"name" : @"Name",
             @"sslProtocols" : @"SslProtocols",
             @"supportedLoadBalancerTypes" : @"SupportedLoadBalancerTypes",
             };
}

+ (NSValueTransformer *)ciphersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingCipher class]];
}

@end

@implementation AWSElasticLoadBalancingSubnetMapping

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"IPv6Address" : @"IPv6Address",
             @"privateIPv4Address" : @"PrivateIPv4Address",
             @"subnetId" : @"SubnetId",
             };
}

@end

@implementation AWSElasticLoadBalancingTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticLoadBalancingTagDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTag class]];
}

@end

@implementation AWSElasticLoadBalancingTargetDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"identifier" : @"Id",
             @"port" : @"Port",
             };
}

@end

@implementation AWSElasticLoadBalancingTargetGroup

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckEnabled" : @"HealthCheckEnabled",
             @"healthCheckIntervalSeconds" : @"HealthCheckIntervalSeconds",
             @"healthCheckPath" : @"HealthCheckPath",
             @"healthCheckPort" : @"HealthCheckPort",
             @"healthCheckProtocol" : @"HealthCheckProtocol",
             @"healthCheckTimeoutSeconds" : @"HealthCheckTimeoutSeconds",
             @"healthyThresholdCount" : @"HealthyThresholdCount",
             @"ipAddressType" : @"IpAddressType",
             @"loadBalancerArns" : @"LoadBalancerArns",
             @"matcher" : @"Matcher",
             @"port" : @"Port",
             @"protocols" : @"Protocol",
             @"protocolVersion" : @"ProtocolVersion",
             @"targetGroupArn" : @"TargetGroupArn",
             @"targetGroupName" : @"TargetGroupName",
             @"targetType" : @"TargetType",
             @"unhealthyThresholdCount" : @"UnhealthyThresholdCount",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)healthCheckProtocolJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttps);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcp);
        }
        if ([value caseInsensitiveCompare:@"TLS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTls);
        }
        if ([value caseInsensitiveCompare:@"UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumUdp);
        }
        if ([value caseInsensitiveCompare:@"TCP_UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcpUdp);
        }
        if ([value caseInsensitiveCompare:@"GENEVE"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumGeneve);
        }
        return @(AWSElasticLoadBalancingProtocolEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingProtocolEnumHttp:
                return @"HTTP";
            case AWSElasticLoadBalancingProtocolEnumHttps:
                return @"HTTPS";
            case AWSElasticLoadBalancingProtocolEnumTcp:
                return @"TCP";
            case AWSElasticLoadBalancingProtocolEnumTls:
                return @"TLS";
            case AWSElasticLoadBalancingProtocolEnumUdp:
                return @"UDP";
            case AWSElasticLoadBalancingProtocolEnumTcpUdp:
                return @"TCP_UDP";
            case AWSElasticLoadBalancingProtocolEnumGeneve:
                return @"GENEVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ipAddressTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumIpv4);
        }
        if ([value caseInsensitiveCompare:@"ipv6"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumIpv6);
        }
        return @(AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumIpv4:
                return @"ipv4";
            case AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumIpv6:
                return @"ipv6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)matcherJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingMatcher class]];
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumHttps);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcp);
        }
        if ([value caseInsensitiveCompare:@"TLS"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTls);
        }
        if ([value caseInsensitiveCompare:@"UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumUdp);
        }
        if ([value caseInsensitiveCompare:@"TCP_UDP"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumTcpUdp);
        }
        if ([value caseInsensitiveCompare:@"GENEVE"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingProtocolEnumGeneve);
        }
        return @(AWSElasticLoadBalancingProtocolEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingProtocolEnumHttp:
                return @"HTTP";
            case AWSElasticLoadBalancingProtocolEnumHttps:
                return @"HTTPS";
            case AWSElasticLoadBalancingProtocolEnumTcp:
                return @"TCP";
            case AWSElasticLoadBalancingProtocolEnumTls:
                return @"TLS";
            case AWSElasticLoadBalancingProtocolEnumUdp:
                return @"UDP";
            case AWSElasticLoadBalancingProtocolEnumTcpUdp:
                return @"TCP_UDP";
            case AWSElasticLoadBalancingProtocolEnumGeneve:
                return @"GENEVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"instance"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetTypeEnumInstance);
        }
        if ([value caseInsensitiveCompare:@"ip"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetTypeEnumIp);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetTypeEnumLambda);
        }
        if ([value caseInsensitiveCompare:@"alb"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetTypeEnumAlb);
        }
        return @(AWSElasticLoadBalancingTargetTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingTargetTypeEnumInstance:
                return @"instance";
            case AWSElasticLoadBalancingTargetTypeEnumIp:
                return @"ip";
            case AWSElasticLoadBalancingTargetTypeEnumLambda:
                return @"lambda";
            case AWSElasticLoadBalancingTargetTypeEnumAlb:
                return @"alb";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingTargetGroupAttribute

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticLoadBalancingTargetGroupStickinessConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSElasticLoadBalancingTargetGroupTuple

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroupArn" : @"TargetGroupArn",
             @"weight" : @"Weight",
             };
}

@end

@implementation AWSElasticLoadBalancingTargetHealth

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"reason" : @"Reason",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)reasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Elb.RegistrationInProgress"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumElbRegistrationInProgress);
        }
        if ([value caseInsensitiveCompare:@"Elb.InitialHealthChecking"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumElbInitialHealthChecking);
        }
        if ([value caseInsensitiveCompare:@"Target.ResponseCodeMismatch"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumTargetResponseCodeMismatch);
        }
        if ([value caseInsensitiveCompare:@"Target.Timeout"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumTargetTimeout);
        }
        if ([value caseInsensitiveCompare:@"Target.FailedHealthChecks"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumTargetFailedHealthChecks);
        }
        if ([value caseInsensitiveCompare:@"Target.NotRegistered"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumTargetNotRegistered);
        }
        if ([value caseInsensitiveCompare:@"Target.NotInUse"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumTargetNotInUse);
        }
        if ([value caseInsensitiveCompare:@"Target.DeregistrationInProgress"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumTargetDeregistrationInProgress);
        }
        if ([value caseInsensitiveCompare:@"Target.InvalidState"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumTargetInvalidState);
        }
        if ([value caseInsensitiveCompare:@"Target.IpUnusable"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumTargetIpUnusable);
        }
        if ([value caseInsensitiveCompare:@"Target.HealthCheckDisabled"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumTargetHealthCheckDisabled);
        }
        if ([value caseInsensitiveCompare:@"Elb.InternalError"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthReasonEnumElbInternalError);
        }
        return @(AWSElasticLoadBalancingTargetHealthReasonEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingTargetHealthReasonEnumElbRegistrationInProgress:
                return @"Elb.RegistrationInProgress";
            case AWSElasticLoadBalancingTargetHealthReasonEnumElbInitialHealthChecking:
                return @"Elb.InitialHealthChecking";
            case AWSElasticLoadBalancingTargetHealthReasonEnumTargetResponseCodeMismatch:
                return @"Target.ResponseCodeMismatch";
            case AWSElasticLoadBalancingTargetHealthReasonEnumTargetTimeout:
                return @"Target.Timeout";
            case AWSElasticLoadBalancingTargetHealthReasonEnumTargetFailedHealthChecks:
                return @"Target.FailedHealthChecks";
            case AWSElasticLoadBalancingTargetHealthReasonEnumTargetNotRegistered:
                return @"Target.NotRegistered";
            case AWSElasticLoadBalancingTargetHealthReasonEnumTargetNotInUse:
                return @"Target.NotInUse";
            case AWSElasticLoadBalancingTargetHealthReasonEnumTargetDeregistrationInProgress:
                return @"Target.DeregistrationInProgress";
            case AWSElasticLoadBalancingTargetHealthReasonEnumTargetInvalidState:
                return @"Target.InvalidState";
            case AWSElasticLoadBalancingTargetHealthReasonEnumTargetIpUnusable:
                return @"Target.IpUnusable";
            case AWSElasticLoadBalancingTargetHealthReasonEnumTargetHealthCheckDisabled:
                return @"Target.HealthCheckDisabled";
            case AWSElasticLoadBalancingTargetHealthReasonEnumElbInternalError:
                return @"Elb.InternalError";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"initial"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthStateEnumInitial);
        }
        if ([value caseInsensitiveCompare:@"healthy"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthStateEnumHealthy);
        }
        if ([value caseInsensitiveCompare:@"unhealthy"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthStateEnumUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"unused"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthStateEnumUnused);
        }
        if ([value caseInsensitiveCompare:@"draining"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthStateEnumDraining);
        }
        if ([value caseInsensitiveCompare:@"unavailable"] == NSOrderedSame) {
            return @(AWSElasticLoadBalancingTargetHealthStateEnumUnavailable);
        }
        return @(AWSElasticLoadBalancingTargetHealthStateEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingTargetHealthStateEnumInitial:
                return @"initial";
            case AWSElasticLoadBalancingTargetHealthStateEnumHealthy:
                return @"healthy";
            case AWSElasticLoadBalancingTargetHealthStateEnumUnhealthy:
                return @"unhealthy";
            case AWSElasticLoadBalancingTargetHealthStateEnumUnused:
                return @"unused";
            case AWSElasticLoadBalancingTargetHealthStateEnumDraining:
                return @"draining";
            case AWSElasticLoadBalancingTargetHealthStateEnumUnavailable:
                return @"unavailable";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingTargetHealthDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckPort" : @"HealthCheckPort",
             @"target" : @"Target",
             @"targetHealth" : @"TargetHealth",
             };
}

+ (NSValueTransformer *)targetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingTargetDescription class]];
}

+ (NSValueTransformer *)targetHealthJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingTargetHealth class]];
}

@end
