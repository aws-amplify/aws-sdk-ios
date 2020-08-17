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

#import "AWSElasticLoadBalancingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSElasticLoadBalancingErrorDomain = @"com.amazonaws.AWSElasticLoadBalancingErrorDomain";

@implementation AWSElasticLoadBalancingAction

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

@end

@implementation AWSElasticLoadBalancingAuthenticateCognitoActionConfig

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerAddresses" : @"LoadBalancerAddresses",
             @"subnetId" : @"SubnetId",
             @"zoneName" : @"ZoneName",
             };
}

+ (NSValueTransformer *)loadBalancerAddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancerAddress class]];
}

@end

@implementation AWSElasticLoadBalancingCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             @"isDefault" : @"IsDefault",
             };
}

@end

@implementation AWSElasticLoadBalancingCipher

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"priority" : @"Priority",
             };
}

@end

@implementation AWSElasticLoadBalancingCreateListenerInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alpnPolicy" : @"AlpnPolicy",
             @"certificates" : @"Certificates",
             @"defaultActions" : @"DefaultActions",
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingCreateListenerOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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
        return @(AWSElasticLoadBalancingLoadBalancerTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingLoadBalancerTypeEnumApplication:
                return @"application";
            case AWSElasticLoadBalancingLoadBalancerTypeEnumNetwork:
                return @"network";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingCreateLoadBalancerOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"conditions" : @"Conditions",
             @"listenerArn" : @"ListenerArn",
             @"priority" : @"Priority",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAction class]];
}

+ (NSValueTransformer *)conditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingRuleCondition class]];
}

@end

@implementation AWSElasticLoadBalancingCreateRuleOutput

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
             @"name" : @"Name",
             @"port" : @"Port",
             @"protocols" : @"Protocol",
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
        return @(AWSElasticLoadBalancingTargetTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingTargetTypeEnumInstance:
                return @"instance";
            case AWSElasticLoadBalancingTargetTypeEnumIp:
                return @"ip";
            case AWSElasticLoadBalancingTargetTypeEnumLambda:
                return @"lambda";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingCreateTargetGroupOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listenerArn" : @"ListenerArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteListenerOutput

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerArn" : @"LoadBalancerArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerOutput

@end

@implementation AWSElasticLoadBalancingDeleteRuleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleArn" : @"RuleArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteRuleOutput

@end

@implementation AWSElasticLoadBalancingDeleteTargetGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroupArn" : @"TargetGroupArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteTargetGroupOutput

@end

@implementation AWSElasticLoadBalancingDeregisterTargetsInput

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

@end

@implementation AWSElasticLoadBalancingDescribeAccountLimitsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeAccountLimitsOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listenerArn" : @"ListenerArn",
             @"marker" : @"Marker",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeListenerCertificatesOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerArn" : @"LoadBalancerArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"names" : @"Names",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeSSLPoliciesOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArns" : @"ResourceArns",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeTagsOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroupArn" : @"TargetGroupArn",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"messageBody" : @"MessageBody",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSElasticLoadBalancingForwardActionConfig

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticLoadBalancingHttpHeaderConditionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"httpHeaderName" : @"HttpHeaderName",
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticLoadBalancingHttpRequestMethodConditionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticLoadBalancingLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"max" : @"Max",
             @"name" : @"Name",
             };
}

@end

@implementation AWSElasticLoadBalancingListener

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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingLoadBalancer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"canonicalHostedZoneId" : @"CanonicalHostedZoneId",
             @"createdTime" : @"CreatedTime",
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
        return @(AWSElasticLoadBalancingLoadBalancerTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingLoadBalancerTypeEnumApplication:
                return @"application";
            case AWSElasticLoadBalancingLoadBalancerTypeEnumNetwork:
                return @"network";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingLoadBalancerAddress

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"ipAddress" : @"IpAddress",
             @"privateIPv4Address" : @"PrivateIPv4Address",
             };
}

@end

@implementation AWSElasticLoadBalancingLoadBalancerAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticLoadBalancingLoadBalancerState

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"httpCode" : @"HttpCode",
             };
}

@end

@implementation AWSElasticLoadBalancingModifyListenerInput

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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingModifyListenerOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticLoadBalancingQueryStringConditionConfig

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticLoadBalancingRedirectActionConfig

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

@end

@implementation AWSElasticLoadBalancingRemoveListenerCertificatesInput

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

@end

@implementation AWSElasticLoadBalancingRemoveTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArns" : @"ResourceArns",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSElasticLoadBalancingRemoveTagsOutput

@end

@implementation AWSElasticLoadBalancingRule

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"priority" : @"Priority",
             @"ruleArn" : @"RuleArn",
             };
}

@end

@implementation AWSElasticLoadBalancingSetIpAddressTypeInput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerArn" : @"LoadBalancerArn",
             @"securityGroups" : @"SecurityGroups",
             };
}

@end

@implementation AWSElasticLoadBalancingSetSecurityGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             };
}

@end

@implementation AWSElasticLoadBalancingSetSubnetsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerArn" : @"LoadBalancerArn",
             @"subnetMappings" : @"SubnetMappings",
             @"subnets" : @"Subnets",
             };
}

+ (NSValueTransformer *)subnetMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingSubnetMapping class]];
}

@end

@implementation AWSElasticLoadBalancingSetSubnetsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             };
}

+ (NSValueTransformer *)availabilityZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAvailabilityZone class]];
}

@end

@implementation AWSElasticLoadBalancingSourceIpConditionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticLoadBalancingSslPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphers" : @"Ciphers",
             @"name" : @"Name",
             @"sslProtocols" : @"SslProtocols",
             };
}

+ (NSValueTransformer *)ciphersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingCipher class]];
}

@end

@implementation AWSElasticLoadBalancingSubnetMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"privateIPv4Address" : @"PrivateIPv4Address",
             @"subnetId" : @"SubnetId",
             };
}

@end

@implementation AWSElasticLoadBalancingTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticLoadBalancingTagDescription

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"identifier" : @"Id",
             @"port" : @"Port",
             };
}

@end

@implementation AWSElasticLoadBalancingTargetGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckEnabled" : @"HealthCheckEnabled",
             @"healthCheckIntervalSeconds" : @"HealthCheckIntervalSeconds",
             @"healthCheckPath" : @"HealthCheckPath",
             @"healthCheckPort" : @"HealthCheckPort",
             @"healthCheckProtocol" : @"HealthCheckProtocol",
             @"healthCheckTimeoutSeconds" : @"HealthCheckTimeoutSeconds",
             @"healthyThresholdCount" : @"HealthyThresholdCount",
             @"loadBalancerArns" : @"LoadBalancerArns",
             @"matcher" : @"Matcher",
             @"port" : @"Port",
             @"protocols" : @"Protocol",
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
        return @(AWSElasticLoadBalancingTargetTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticLoadBalancingTargetTypeEnumInstance:
                return @"instance";
            case AWSElasticLoadBalancingTargetTypeEnumIp:
                return @"ip";
            case AWSElasticLoadBalancingTargetTypeEnumLambda:
                return @"lambda";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticLoadBalancingTargetGroupAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticLoadBalancingTargetGroupStickinessConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSElasticLoadBalancingTargetGroupTuple

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetGroupArn" : @"TargetGroupArn",
             @"weight" : @"Weight",
             };
}

@end

@implementation AWSElasticLoadBalancingTargetHealth

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
