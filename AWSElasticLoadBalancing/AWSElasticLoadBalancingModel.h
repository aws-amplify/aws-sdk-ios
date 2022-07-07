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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSElasticLoadBalancingErrorDomain;

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingErrorType) {
    AWSElasticLoadBalancingErrorUnknown,
    AWSElasticLoadBalancingErrorALPNPolicyNotSupported,
    AWSElasticLoadBalancingErrorAllocationIdNotFound,
    AWSElasticLoadBalancingErrorAvailabilityZoneNotSupported,
    AWSElasticLoadBalancingErrorCertificateNotFound,
    AWSElasticLoadBalancingErrorDuplicateListener,
    AWSElasticLoadBalancingErrorDuplicateLoadBalancerName,
    AWSElasticLoadBalancingErrorDuplicateTagKeys,
    AWSElasticLoadBalancingErrorDuplicateTargetGroupName,
    AWSElasticLoadBalancingErrorHealthUnavailable,
    AWSElasticLoadBalancingErrorIncompatibleProtocols,
    AWSElasticLoadBalancingErrorInvalidConfigurationRequest,
    AWSElasticLoadBalancingErrorInvalidLoadBalancerAction,
    AWSElasticLoadBalancingErrorInvalidScheme,
    AWSElasticLoadBalancingErrorInvalidSecurityGroup,
    AWSElasticLoadBalancingErrorInvalidSubnet,
    AWSElasticLoadBalancingErrorInvalidTarget,
    AWSElasticLoadBalancingErrorListenerNotFound,
    AWSElasticLoadBalancingErrorLoadBalancerNotFound,
    AWSElasticLoadBalancingErrorOperationNotPermitted,
    AWSElasticLoadBalancingErrorPriorityInUse,
    AWSElasticLoadBalancingErrorResourceInUse,
    AWSElasticLoadBalancingErrorRuleNotFound,
    AWSElasticLoadBalancingErrorSSLPolicyNotFound,
    AWSElasticLoadBalancingErrorSubnetNotFound,
    AWSElasticLoadBalancingErrorTargetGroupAssociationLimit,
    AWSElasticLoadBalancingErrorTargetGroupNotFound,
    AWSElasticLoadBalancingErrorTooManyActions,
    AWSElasticLoadBalancingErrorTooManyCertificates,
    AWSElasticLoadBalancingErrorTooManyListeners,
    AWSElasticLoadBalancingErrorTooManyLoadBalancers,
    AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId,
    AWSElasticLoadBalancingErrorTooManyRules,
    AWSElasticLoadBalancingErrorTooManyTags,
    AWSElasticLoadBalancingErrorTooManyTargetGroups,
    AWSElasticLoadBalancingErrorTooManyTargets,
    AWSElasticLoadBalancingErrorTooManyUniqueTargetGroupsPerLoadBalancer,
    AWSElasticLoadBalancingErrorUnsupportedProtocol,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingActionTypeEnum) {
    AWSElasticLoadBalancingActionTypeEnumUnknown,
    AWSElasticLoadBalancingActionTypeEnumForward,
    AWSElasticLoadBalancingActionTypeEnumAuthenticateOidc,
    AWSElasticLoadBalancingActionTypeEnumAuthenticateCognito,
    AWSElasticLoadBalancingActionTypeEnumRedirect,
    AWSElasticLoadBalancingActionTypeEnumFixedResponse,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnum) {
    AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnumUnknown,
    AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnumDeny,
    AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnumAllow,
    AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnumAuthenticate,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnum) {
    AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnumUnknown,
    AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnumDeny,
    AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnumAllow,
    AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnumAuthenticate,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingIpAddressType) {
    AWSElasticLoadBalancingIpAddressTypeUnknown,
    AWSElasticLoadBalancingIpAddressTypeIpv4,
    AWSElasticLoadBalancingIpAddressTypeDualstack,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingLoadBalancerSchemeEnum) {
    AWSElasticLoadBalancingLoadBalancerSchemeEnumUnknown,
    AWSElasticLoadBalancingLoadBalancerSchemeEnumInternetFacing,
    AWSElasticLoadBalancingLoadBalancerSchemeEnumInternal,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingLoadBalancerStateEnum) {
    AWSElasticLoadBalancingLoadBalancerStateEnumUnknown,
    AWSElasticLoadBalancingLoadBalancerStateEnumActive,
    AWSElasticLoadBalancingLoadBalancerStateEnumProvisioning,
    AWSElasticLoadBalancingLoadBalancerStateEnumActiveImpaired,
    AWSElasticLoadBalancingLoadBalancerStateEnumFailed,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingLoadBalancerTypeEnum) {
    AWSElasticLoadBalancingLoadBalancerTypeEnumUnknown,
    AWSElasticLoadBalancingLoadBalancerTypeEnumApplication,
    AWSElasticLoadBalancingLoadBalancerTypeEnumNetwork,
    AWSElasticLoadBalancingLoadBalancerTypeEnumGateway,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingProtocolEnum) {
    AWSElasticLoadBalancingProtocolEnumUnknown,
    AWSElasticLoadBalancingProtocolEnumHttp,
    AWSElasticLoadBalancingProtocolEnumHttps,
    AWSElasticLoadBalancingProtocolEnumTcp,
    AWSElasticLoadBalancingProtocolEnumTls,
    AWSElasticLoadBalancingProtocolEnumUdp,
    AWSElasticLoadBalancingProtocolEnumTcpUdp,
    AWSElasticLoadBalancingProtocolEnumGeneve,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingRedirectActionStatusCodeEnum) {
    AWSElasticLoadBalancingRedirectActionStatusCodeEnumUnknown,
    AWSElasticLoadBalancingRedirectActionStatusCodeEnumHttp301,
    AWSElasticLoadBalancingRedirectActionStatusCodeEnumHttp302,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingTargetGroupIpAddressTypeEnum) {
    AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumUnknown,
    AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumIpv4,
    AWSElasticLoadBalancingTargetGroupIpAddressTypeEnumIpv6,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingTargetHealthReasonEnum) {
    AWSElasticLoadBalancingTargetHealthReasonEnumUnknown,
    AWSElasticLoadBalancingTargetHealthReasonEnumElbRegistrationInProgress,
    AWSElasticLoadBalancingTargetHealthReasonEnumElbInitialHealthChecking,
    AWSElasticLoadBalancingTargetHealthReasonEnumTargetResponseCodeMismatch,
    AWSElasticLoadBalancingTargetHealthReasonEnumTargetTimeout,
    AWSElasticLoadBalancingTargetHealthReasonEnumTargetFailedHealthChecks,
    AWSElasticLoadBalancingTargetHealthReasonEnumTargetNotRegistered,
    AWSElasticLoadBalancingTargetHealthReasonEnumTargetNotInUse,
    AWSElasticLoadBalancingTargetHealthReasonEnumTargetDeregistrationInProgress,
    AWSElasticLoadBalancingTargetHealthReasonEnumTargetInvalidState,
    AWSElasticLoadBalancingTargetHealthReasonEnumTargetIpUnusable,
    AWSElasticLoadBalancingTargetHealthReasonEnumTargetHealthCheckDisabled,
    AWSElasticLoadBalancingTargetHealthReasonEnumElbInternalError,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingTargetHealthStateEnum) {
    AWSElasticLoadBalancingTargetHealthStateEnumUnknown,
    AWSElasticLoadBalancingTargetHealthStateEnumInitial,
    AWSElasticLoadBalancingTargetHealthStateEnumHealthy,
    AWSElasticLoadBalancingTargetHealthStateEnumUnhealthy,
    AWSElasticLoadBalancingTargetHealthStateEnumUnused,
    AWSElasticLoadBalancingTargetHealthStateEnumDraining,
    AWSElasticLoadBalancingTargetHealthStateEnumUnavailable,
};

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingTargetTypeEnum) {
    AWSElasticLoadBalancingTargetTypeEnumUnknown,
    AWSElasticLoadBalancingTargetTypeEnumInstance,
    AWSElasticLoadBalancingTargetTypeEnumIp,
    AWSElasticLoadBalancingTargetTypeEnumLambda,
    AWSElasticLoadBalancingTargetTypeEnumAlb,
};

@class AWSElasticLoadBalancingAction;
@class AWSElasticLoadBalancingAddListenerCertificatesInput;
@class AWSElasticLoadBalancingAddListenerCertificatesOutput;
@class AWSElasticLoadBalancingAddTagsInput;
@class AWSElasticLoadBalancingAddTagsOutput;
@class AWSElasticLoadBalancingAuthenticateCognitoActionConfig;
@class AWSElasticLoadBalancingAuthenticateOidcActionConfig;
@class AWSElasticLoadBalancingAvailabilityZone;
@class AWSElasticLoadBalancingCertificate;
@class AWSElasticLoadBalancingCipher;
@class AWSElasticLoadBalancingCreateListenerInput;
@class AWSElasticLoadBalancingCreateListenerOutput;
@class AWSElasticLoadBalancingCreateLoadBalancerInput;
@class AWSElasticLoadBalancingCreateLoadBalancerOutput;
@class AWSElasticLoadBalancingCreateRuleInput;
@class AWSElasticLoadBalancingCreateRuleOutput;
@class AWSElasticLoadBalancingCreateTargetGroupInput;
@class AWSElasticLoadBalancingCreateTargetGroupOutput;
@class AWSElasticLoadBalancingDeleteListenerInput;
@class AWSElasticLoadBalancingDeleteListenerOutput;
@class AWSElasticLoadBalancingDeleteLoadBalancerInput;
@class AWSElasticLoadBalancingDeleteLoadBalancerOutput;
@class AWSElasticLoadBalancingDeleteRuleInput;
@class AWSElasticLoadBalancingDeleteRuleOutput;
@class AWSElasticLoadBalancingDeleteTargetGroupInput;
@class AWSElasticLoadBalancingDeleteTargetGroupOutput;
@class AWSElasticLoadBalancingDeregisterTargetsInput;
@class AWSElasticLoadBalancingDeregisterTargetsOutput;
@class AWSElasticLoadBalancingDescribeAccountLimitsInput;
@class AWSElasticLoadBalancingDescribeAccountLimitsOutput;
@class AWSElasticLoadBalancingDescribeListenerCertificatesInput;
@class AWSElasticLoadBalancingDescribeListenerCertificatesOutput;
@class AWSElasticLoadBalancingDescribeListenersInput;
@class AWSElasticLoadBalancingDescribeListenersOutput;
@class AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput;
@class AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput;
@class AWSElasticLoadBalancingDescribeLoadBalancersInput;
@class AWSElasticLoadBalancingDescribeLoadBalancersOutput;
@class AWSElasticLoadBalancingDescribeRulesInput;
@class AWSElasticLoadBalancingDescribeRulesOutput;
@class AWSElasticLoadBalancingDescribeSSLPoliciesInput;
@class AWSElasticLoadBalancingDescribeSSLPoliciesOutput;
@class AWSElasticLoadBalancingDescribeTagsInput;
@class AWSElasticLoadBalancingDescribeTagsOutput;
@class AWSElasticLoadBalancingDescribeTargetGroupAttributesInput;
@class AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput;
@class AWSElasticLoadBalancingDescribeTargetGroupsInput;
@class AWSElasticLoadBalancingDescribeTargetGroupsOutput;
@class AWSElasticLoadBalancingDescribeTargetHealthInput;
@class AWSElasticLoadBalancingDescribeTargetHealthOutput;
@class AWSElasticLoadBalancingFixedResponseActionConfig;
@class AWSElasticLoadBalancingForwardActionConfig;
@class AWSElasticLoadBalancingHostHeaderConditionConfig;
@class AWSElasticLoadBalancingHttpHeaderConditionConfig;
@class AWSElasticLoadBalancingHttpRequestMethodConditionConfig;
@class AWSElasticLoadBalancingLimit;
@class AWSElasticLoadBalancingListener;
@class AWSElasticLoadBalancingLoadBalancer;
@class AWSElasticLoadBalancingLoadBalancerAddress;
@class AWSElasticLoadBalancingLoadBalancerAttribute;
@class AWSElasticLoadBalancingLoadBalancerState;
@class AWSElasticLoadBalancingMatcher;
@class AWSElasticLoadBalancingModifyListenerInput;
@class AWSElasticLoadBalancingModifyListenerOutput;
@class AWSElasticLoadBalancingModifyLoadBalancerAttributesInput;
@class AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput;
@class AWSElasticLoadBalancingModifyRuleInput;
@class AWSElasticLoadBalancingModifyRuleOutput;
@class AWSElasticLoadBalancingModifyTargetGroupAttributesInput;
@class AWSElasticLoadBalancingModifyTargetGroupAttributesOutput;
@class AWSElasticLoadBalancingModifyTargetGroupInput;
@class AWSElasticLoadBalancingModifyTargetGroupOutput;
@class AWSElasticLoadBalancingPathPatternConditionConfig;
@class AWSElasticLoadBalancingQueryStringConditionConfig;
@class AWSElasticLoadBalancingQueryStringKeyValuePair;
@class AWSElasticLoadBalancingRedirectActionConfig;
@class AWSElasticLoadBalancingRegisterTargetsInput;
@class AWSElasticLoadBalancingRegisterTargetsOutput;
@class AWSElasticLoadBalancingRemoveListenerCertificatesInput;
@class AWSElasticLoadBalancingRemoveListenerCertificatesOutput;
@class AWSElasticLoadBalancingRemoveTagsInput;
@class AWSElasticLoadBalancingRemoveTagsOutput;
@class AWSElasticLoadBalancingRule;
@class AWSElasticLoadBalancingRuleCondition;
@class AWSElasticLoadBalancingRulePriorityPair;
@class AWSElasticLoadBalancingSetIpAddressTypeInput;
@class AWSElasticLoadBalancingSetIpAddressTypeOutput;
@class AWSElasticLoadBalancingSetRulePrioritiesInput;
@class AWSElasticLoadBalancingSetRulePrioritiesOutput;
@class AWSElasticLoadBalancingSetSecurityGroupsInput;
@class AWSElasticLoadBalancingSetSecurityGroupsOutput;
@class AWSElasticLoadBalancingSetSubnetsInput;
@class AWSElasticLoadBalancingSetSubnetsOutput;
@class AWSElasticLoadBalancingSourceIpConditionConfig;
@class AWSElasticLoadBalancingSslPolicy;
@class AWSElasticLoadBalancingSubnetMapping;
@class AWSElasticLoadBalancingTag;
@class AWSElasticLoadBalancingTagDescription;
@class AWSElasticLoadBalancingTargetDescription;
@class AWSElasticLoadBalancingTargetGroup;
@class AWSElasticLoadBalancingTargetGroupAttribute;
@class AWSElasticLoadBalancingTargetGroupStickinessConfig;
@class AWSElasticLoadBalancingTargetGroupTuple;
@class AWSElasticLoadBalancingTargetHealth;
@class AWSElasticLoadBalancingTargetHealthDescription;

/**
 <p>Information about an action.</p><p>Each rule must include exactly one of the following types of actions: <code>forward</code>, <code>fixed-response</code>, or <code>redirect</code>, and it must be the last action to be performed.</p>
 Required parameters: [Type]
 */
@interface AWSElasticLoadBalancingAction : AWSModel


/**
 <p>[HTTPS listeners] Information for using Amazon Cognito to authenticate users. Specify only when <code>Type</code> is <code>authenticate-cognito</code>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingAuthenticateCognitoActionConfig * _Nullable authenticateCognitoConfig;

/**
 <p>[HTTPS listeners] Information about an identity provider that is compliant with OpenID Connect (OIDC). Specify only when <code>Type</code> is <code>authenticate-oidc</code>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingAuthenticateOidcActionConfig * _Nullable authenticateOidcConfig;

/**
 <p>[Application Load Balancer] Information for creating an action that returns a custom HTTP response. Specify only when <code>Type</code> is <code>fixed-response</code>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingFixedResponseActionConfig * _Nullable fixedResponseConfig;

/**
 <p>Information for creating an action that distributes requests among one or more target groups. For Network Load Balancers, you can specify a single target group. Specify only when <code>Type</code> is <code>forward</code>. If you specify both <code>ForwardConfig</code> and <code>TargetGroupArn</code>, you can specify only one target group using <code>ForwardConfig</code> and it must be the same target group specified in <code>TargetGroupArn</code>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingForwardActionConfig * _Nullable forwardConfig;

/**
 <p>The order for the action. This value is required for rules with multiple actions. The action with the lowest value for order is performed first.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable order;

/**
 <p>[Application Load Balancer] Information for creating a redirect action. Specify only when <code>Type</code> is <code>redirect</code>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingRedirectActionConfig * _Nullable redirectConfig;

/**
 <p>The Amazon Resource Name (ARN) of the target group. Specify only when <code>Type</code> is <code>forward</code> and you want to route to a single target group. To route to one or more target groups, use <code>ForwardConfig</code> instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupArn;

/**
 <p>The type of action.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingActionTypeEnum types;

@end

/**
 
 */
@interface AWSElasticLoadBalancingAddListenerCertificatesInput : AWSRequest


/**
 <p>The certificate to add. You can specify one certificate per call. Set <code>CertificateArn</code> to the certificate ARN but do not set <code>IsDefault</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingCertificate *> * _Nullable certificates;

/**
 <p>The Amazon Resource Name (ARN) of the listener.</p>
 */
@property (nonatomic, strong) NSString * _Nullable listenerArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingAddListenerCertificatesOutput : AWSModel


/**
 <p>Information about the certificates in the certificate list.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingCertificate *> * _Nullable certificates;

@end

/**
 
 */
@interface AWSElasticLoadBalancingAddTagsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

/**
 <p>The tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSElasticLoadBalancingAddTagsOutput : AWSModel


@end

/**
 <p>Request parameters to use when integrating with Amazon Cognito to authenticate users.</p>
 Required parameters: [UserPoolArn, UserPoolClientId, UserPoolDomain]
 */
@interface AWSElasticLoadBalancingAuthenticateCognitoActionConfig : AWSModel


/**
 <p>The query parameters (up to 10) to include in the redirect request to the authorization endpoint.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable authenticationRequestExtraParams;

/**
 <p>The behavior if the user is not authenticated. The following are possible values:</p><ul><li><p>deny<code/> - Return an HTTP 401 Unauthorized error.</p></li><li><p>allow<code/> - Allow the request to be forwarded to the target.</p></li><li><p>authenticate<code/> - Redirect the request to the IdP authorization endpoint. This is the default value.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingAuthenticateCognitoActionConditionalBehaviorEnum onUnauthenticatedRequest;

/**
 <p>The set of user claims to be requested from the IdP. The default is <code>openid</code>.</p><p>To verify which scope values your IdP supports and how to separate multiple values, see the documentation for your IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scope;

/**
 <p>The name of the cookie used to maintain session information. The default is AWSELBAuthSessionCookie.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionCookieName;

/**
 <p>The maximum duration of the authentication session, in seconds. The default is 604800 seconds (7 days).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sessionTimeout;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Cognito user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolArn;

/**
 <p>The ID of the Amazon Cognito user pool client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolClientId;

/**
 <p>The domain prefix or fully-qualified domain name of the Amazon Cognito user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolDomain;

@end

/**
 <p>Request parameters when using an identity provider (IdP) that is compliant with OpenID Connect (OIDC) to authenticate users.</p>
 Required parameters: [Issuer, AuthorizationEndpoint, TokenEndpoint, UserInfoEndpoint, ClientId]
 */
@interface AWSElasticLoadBalancingAuthenticateOidcActionConfig : AWSModel


/**
 <p>The query parameters (up to 10) to include in the redirect request to the authorization endpoint.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable authenticationRequestExtraParams;

/**
 <p>The authorization endpoint of the IdP. This must be a full URL, including the HTTPS protocol, the domain, and the path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizationEndpoint;

/**
 <p>The OAuth 2.0 client identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The OAuth 2.0 client secret. This parameter is required if you are creating a rule. If you are modifying a rule, you can omit this parameter if you set <code>UseExistingClientSecret</code> to true.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientSecret;

/**
 <p>The OIDC issuer identifier of the IdP. This must be a full URL, including the HTTPS protocol, the domain, and the path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable issuer;

/**
 <p>The behavior if the user is not authenticated. The following are possible values:</p><ul><li><p>deny<code/> - Return an HTTP 401 Unauthorized error.</p></li><li><p>allow<code/> - Allow the request to be forwarded to the target.</p></li><li><p>authenticate<code/> - Redirect the request to the IdP authorization endpoint. This is the default value.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingAuthenticateOidcActionConditionalBehaviorEnum onUnauthenticatedRequest;

/**
 <p>The set of user claims to be requested from the IdP. The default is <code>openid</code>.</p><p>To verify which scope values your IdP supports and how to separate multiple values, see the documentation for your IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scope;

/**
 <p>The name of the cookie used to maintain session information. The default is AWSELBAuthSessionCookie.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionCookieName;

/**
 <p>The maximum duration of the authentication session, in seconds. The default is 604800 seconds (7 days).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sessionTimeout;

/**
 <p>The token endpoint of the IdP. This must be a full URL, including the HTTPS protocol, the domain, and the path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenEndpoint;

/**
 <p>Indicates whether to use the existing client secret when modifying a rule. If you are creating a rule, you can omit this parameter or set it to false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useExistingClientSecret;

/**
 <p>The user info endpoint of the IdP. This must be a full URL, including the HTTPS protocol, the domain, and the path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userInfoEndpoint;

@end

/**
 <p>Information about an Availability Zone.</p>
 */
@interface AWSElasticLoadBalancingAvailabilityZone : AWSModel


/**
 <p>[Network Load Balancers] If you need static IP addresses for your load balancer, you can specify one Elastic IP address per Availability Zone when you create an internal-facing load balancer. For internal load balancers, you can specify a private IP address from the IPv4 range of the subnet.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingLoadBalancerAddress *> * _Nullable loadBalancerAddresses;

/**
 <p>[Application Load Balancers on Outposts] The ID of the Outpost.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outpostId;

/**
 <p>The ID of the subnet. You can specify one subnet per Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The name of the Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable zoneName;

@end

/**
 <p>Information about an SSL server certificate.</p>
 */
@interface AWSElasticLoadBalancingCertificate : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>Indicates whether the certificate is the default certificate. Do not set this value when specifying a certificate as an input. This value is not included in the output when describing a listener, but is included when describing listener certificates.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefault;

@end

/**
 <p>Information about a cipher used in a policy.</p>
 */
@interface AWSElasticLoadBalancingCipher : AWSModel


/**
 <p>The name of the cipher.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The priority of the cipher.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateListenerInput : AWSRequest


/**
 <p>[TLS listeners] The name of the Application-Layer Protocol Negotiation (ALPN) policy. You can specify one policy name. The following are the possible values:</p><ul><li><p><code>HTTP1Only</code></p></li><li><p><code>HTTP2Only</code></p></li><li><p><code>HTTP2Optional</code></p></li><li><p><code>HTTP2Preferred</code></p></li><li><p><code>None</code></p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#alpn-policies">ALPN policies</a> in the <i>Network Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alpnPolicy;

/**
 <p>[HTTPS and TLS listeners] The default certificate for the listener. You must provide exactly one certificate. Set <code>CertificateArn</code> to the certificate ARN but do not set <code>IsDefault</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingCertificate *> * _Nullable certificates;

/**
 <p>The actions for the default rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingAction *> * _Nullable defaultActions;

/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerArn;

/**
 <p>The port on which the load balancer is listening. You cannot specify a port for a Gateway Load Balancer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The protocol for connections from clients to the load balancer. For Application Load Balancers, the supported protocols are HTTP and HTTPS. For Network Load Balancers, the supported protocols are TCP, TLS, UDP, and TCP_UDP. You can’t specify the UDP or TCP_UDP protocol if dual-stack mode is enabled. You cannot specify a protocol for a Gateway Load Balancer.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingProtocolEnum protocols;

/**
 <p>[HTTPS and TLS listeners] The security policy that defines which protocols and ciphers are supported.</p><p>For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies">Security policies</a> in the <i>Application Load Balancers Guide</i> and <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies">Security policies</a> in the <i>Network Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sslPolicy;

/**
 <p>The tags to assign to the listener.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateListenerOutput : AWSModel


/**
 <p>Information about the listener.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingListener *> * _Nullable listeners;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerInput : AWSRequest


/**
 <p>[Application Load Balancers on Outposts] The ID of the customer-owned address pool (CoIP pool).</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerOwnedIpv4Pool;

/**
 <p>The type of IP addresses used by the subnets for your load balancer. The possible values are <code>ipv4</code> (for IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses). </p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingIpAddressType ipAddressType;

/**
 <p>The name of the load balancer.</p><p>This name must be unique per region per account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, must not begin or end with a hyphen, and must not begin with "internal-".</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The nodes of an Internet-facing load balancer have public IP addresses. The DNS name of an Internet-facing load balancer is publicly resolvable to the public IP addresses of the nodes. Therefore, Internet-facing load balancers can route requests from clients over the internet.</p><p>The nodes of an internal load balancer have only private IP addresses. The DNS name of an internal load balancer is publicly resolvable to the private IP addresses of the nodes. Therefore, internal load balancers can route requests only from clients with access to the VPC for the load balancer.</p><p>The default is an Internet-facing load balancer.</p><p>You cannot specify a scheme for a Gateway Load Balancer.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingLoadBalancerSchemeEnum scheme;

/**
 <p>[Application Load Balancers] The IDs of the security groups for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The IDs of the public subnets. You can specify only one subnet per Availability Zone. You must specify either subnets or subnet mappings, but not both.</p><p>[Application Load Balancers] You must specify subnets from at least two Availability Zones. You cannot specify Elastic IP addresses for your subnets.</p><p>[Application Load Balancers on Outposts] You must specify one Outpost subnet.</p><p>[Application Load Balancers on Local Zones] You can specify subnets from one or more Local Zones.</p><p>[Network Load Balancers] You can specify subnets from one or more Availability Zones. You can specify one Elastic IP address per subnet if you need static IP addresses for your internet-facing load balancer. For internal load balancers, you can specify one private IP address per subnet from the IPv4 range of the subnet. For internet-facing load balancer, you can specify one IPv6 address per subnet.</p><p>[Gateway Load Balancers] You can specify subnets from one or more Availability Zones. You cannot specify Elastic IP addresses for your subnets.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingSubnetMapping *> * _Nullable subnetMappings;

/**
 <p>The IDs of the public subnets. You can specify only one subnet per Availability Zone. You must specify either subnets or subnet mappings, but not both. To specify an Elastic IP address, specify subnet mappings instead of subnets.</p><p>[Application Load Balancers] You must specify subnets from at least two Availability Zones.</p><p>[Application Load Balancers on Outposts] You must specify one Outpost subnet.</p><p>[Application Load Balancers on Local Zones] You can specify subnets from one or more Local Zones.</p><p>[Network Load Balancers] You can specify subnets from one or more Availability Zones.</p><p>[Gateway Load Balancers] You can specify subnets from one or more Availability Zones.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

/**
 <p>The tags to assign to the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTag *> * _Nullable tags;

/**
 <p>The type of load balancer. The default is <code>application</code>.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingLoadBalancerTypeEnum types;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerOutput : AWSModel


/**
 <p>Information about the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingLoadBalancer *> * _Nullable loadBalancers;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateRuleInput : AWSRequest


/**
 <p>The actions.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingAction *> * _Nullable actions;

/**
 <p>The conditions.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingRuleCondition *> * _Nullable conditions;

/**
 <p>The Amazon Resource Name (ARN) of the listener.</p>
 */
@property (nonatomic, strong) NSString * _Nullable listenerArn;

/**
 <p>The rule priority. A listener can't have multiple rules with the same priority.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The tags to assign to the rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateRuleOutput : AWSModel


/**
 <p>Information about the rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateTargetGroupInput : AWSRequest


/**
 <p>Indicates whether health checks are enabled. If the target type is <code>lambda</code>, health checks are disabled by default but can be enabled. If the target type is <code>instance</code>, <code>ip</code>, or <code>alb</code>, health checks are always enabled and cannot be disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckEnabled;

/**
 <p>The approximate amount of time, in seconds, between health checks of an individual target. If the target group protocol is HTTP or HTTPS, the default is 30 seconds. If the target group protocol is TCP, TLS, UDP, or TCP_UDP, the supported values are 10 and 30 seconds and the default is 30 seconds. If the target group protocol is GENEVE, the default is 10 seconds. If the target type is <code>lambda</code>, the default is 35 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckIntervalSeconds;

/**
 <p>[HTTP/HTTPS health checks] The destination for health checks on the targets.</p><p>[HTTP1 or HTTP2 protocol version] The ping path. The default is /.</p><p>[GRPC protocol version] The path of a custom health check method with the format /package.service/method. The default is /Amazon Web Services.ALB/healthcheck.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckPath;

/**
 <p>The port the load balancer uses when performing health checks on targets. If the protocol is HTTP, HTTPS, TCP, TLS, UDP, or TCP_UDP, the default is <code>traffic-port</code>, which is the port on which each target receives traffic from the load balancer. If the protocol is GENEVE, the default is port 80.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckPort;

/**
 <p>The protocol the load balancer uses when performing health checks on targets. For Application Load Balancers, the default is HTTP. For Network Load Balancers and Gateway Load Balancers, the default is TCP. The TCP protocol is not supported for health checks if the protocol of the target group is HTTP or HTTPS. The GENEVE, TLS, UDP, and TCP_UDP protocols are not supported for health checks.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingProtocolEnum healthCheckProtocol;

/**
 <p>The amount of time, in seconds, during which no response from a target means a failed health check. For target groups with a protocol of HTTP, HTTPS, or GENEVE, the default is 5 seconds. For target groups with a protocol of TCP or TLS, this value must be 6 seconds for HTTP health checks and 10 seconds for TCP and HTTPS health checks. If the target type is <code>lambda</code>, the default is 30 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckTimeoutSeconds;

/**
 <p>The number of consecutive health checks successes required before considering an unhealthy target healthy. For target groups with a protocol of HTTP or HTTPS, the default is 5. For target groups with a protocol of TCP, TLS, or GENEVE, the default is 3. If the target type is <code>lambda</code>, the default is 5.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthyThresholdCount;

/**
 <p>The type of IP address used for this target group. The possible values are <code>ipv4</code> and <code>ipv6</code>. This is an optional parameter. If not specified, the IP address type defaults to <code>ipv4</code>.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingTargetGroupIpAddressTypeEnum ipAddressType;

/**
 <p>[HTTP/HTTPS health checks] The HTTP or gRPC codes to use when checking for a successful response from a target.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingMatcher * _Nullable matcher;

/**
 <p>The name of the target group.</p><p>This name must be unique per region per account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The port on which the targets receive traffic. This port is used unless you specify a port override when registering the target. If the target is a Lambda function, this parameter does not apply. If the protocol is GENEVE, the supported port is 6081.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The protocol to use for routing traffic to the targets. For Application Load Balancers, the supported protocols are HTTP and HTTPS. For Network Load Balancers, the supported protocols are TCP, TLS, UDP, or TCP_UDP. For Gateway Load Balancers, the supported protocol is GENEVE. A TCP_UDP listener must be associated with a TCP_UDP target group. If the target is a Lambda function, this parameter does not apply.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingProtocolEnum protocols;

/**
 <p>[HTTP/HTTPS protocol] The protocol version. Specify <code>GRPC</code> to send requests to targets using gRPC. Specify <code>HTTP2</code> to send requests to targets using HTTP/2. The default is <code>HTTP1</code>, which sends requests to targets using HTTP/1.1.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocolVersion;

/**
 <p>The tags to assign to the target group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTag *> * _Nullable tags;

/**
 <p>The type of target that you must specify when registering targets with this target group. You can't specify targets for a target group using more than one target type.</p><ul><li><p><code>instance</code> - Register targets by instance ID. This is the default value.</p></li><li><p><code>ip</code> - Register targets by IP address. You can specify IP addresses from the subnets of the virtual private cloud (VPC) for the target group, the RFC 1918 range (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You can't specify publicly routable IP addresses.</p></li><li><p><code>lambda</code> - Register a single Lambda function as a target.</p></li><li><p><code>alb</code> - Register a single Application Load Balancer as a target.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingTargetTypeEnum targetType;

/**
 <p>The number of consecutive health check failures required before considering a target unhealthy. If the target group protocol is HTTP or HTTPS, the default is 2. If the target group protocol is TCP or TLS, this value must be the same as the healthy threshold count. If the target group protocol is GENEVE, the default is 3. If the target type is <code>lambda</code>, the default is 2.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unhealthyThresholdCount;

/**
 <p>The identifier of the virtual private cloud (VPC). If the target is a Lambda function, this parameter does not apply. Otherwise, this parameter is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateTargetGroupOutput : AWSModel


/**
 <p>Information about the target group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTargetGroup *> * _Nullable targetGroups;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteListenerInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the listener.</p>
 */
@property (nonatomic, strong) NSString * _Nullable listenerArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteListenerOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteRuleInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteRuleOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteTargetGroupInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteTargetGroupOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingDeregisterTargetsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupArn;

/**
 <p>The targets. If you specified a port override when you registered a target, you must specify both the target ID and the port when you deregister it.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTargetDescription *> * _Nullable targets;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDeregisterTargetsOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeAccountLimitsInput : AWSRequest


/**
 <p>The marker for the next set of results. (You received this marker from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeAccountLimitsOutput : AWSModel


/**
 <p>Information about the limits.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingLimit *> * _Nullable limits;

/**
 <p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeListenerCertificatesInput : AWSRequest


/**
 <p>The Amazon Resource Names (ARN) of the listener.</p>
 */
@property (nonatomic, strong) NSString * _Nullable listenerArn;

/**
 <p>The marker for the next set of results. (You received this marker from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeListenerCertificatesOutput : AWSModel


/**
 <p>Information about the certificates.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingCertificate *> * _Nullable certificates;

/**
 <p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeListenersInput : AWSRequest


/**
 <p>The Amazon Resource Names (ARN) of the listeners.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable listenerArns;

/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerArn;

/**
 <p>The marker for the next set of results. (You received this marker from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeListenersOutput : AWSModel


/**
 <p>Information about the listeners.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingListener *> * _Nullable listeners;

/**
 <p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput : AWSModel


/**
 <p>Information about the load balancer attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingLoadBalancerAttribute *> * _Nullable attributes;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancersInput : AWSRequest


/**
 <p>The Amazon Resource Names (ARN) of the load balancers. You can specify up to 20 load balancers in a single call.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerArns;

/**
 <p>The marker for the next set of results. (You received this marker from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The names of the load balancers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable names;

/**
 <p>The maximum number of results to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancersOutput : AWSModel


/**
 <p>Information about the load balancers.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingLoadBalancer *> * _Nullable loadBalancers;

/**
 <p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeRulesInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the listener.</p>
 */
@property (nonatomic, strong) NSString * _Nullable listenerArn;

/**
 <p>The marker for the next set of results. (You received this marker from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The Amazon Resource Names (ARN) of the rules.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ruleArns;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeRulesOutput : AWSModel


/**
 <p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>Information about the rules.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeSSLPoliciesInput : AWSRequest


/**
 <p> The type of load balancer. The default lists the SSL policies for all load balancers.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingLoadBalancerTypeEnum loadBalancerType;

/**
 <p>The marker for the next set of results. (You received this marker from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The names of the policies.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable names;

/**
 <p>The maximum number of results to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeSSLPoliciesOutput : AWSModel


/**
 <p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>Information about the security policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingSslPolicy *> * _Nullable sslPolicies;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeTagsInput : AWSRequest


/**
 <p>The Amazon Resource Names (ARN) of the resources. You can specify up to 20 resources in a single call.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeTagsOutput : AWSModel


/**
 <p>Information about the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTagDescription *> * _Nullable tagDescriptions;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeTargetGroupAttributesInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput : AWSModel


/**
 <p>Information about the target group attributes</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTargetGroupAttribute *> * _Nullable attributes;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeTargetGroupsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerArn;

/**
 <p>The marker for the next set of results. (You received this marker from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The names of the target groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable names;

/**
 <p>The maximum number of results to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The Amazon Resource Names (ARN) of the target groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetGroupArns;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeTargetGroupsOutput : AWSModel


/**
 <p>If there are additional results, this is the marker for the next set of results. Otherwise, this is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>Information about the target groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTargetGroup *> * _Nullable targetGroups;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeTargetHealthInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupArn;

/**
 <p>The targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTargetDescription *> * _Nullable targets;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeTargetHealthOutput : AWSModel


/**
 <p>Information about the health of the targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTargetHealthDescription *> * _Nullable targetHealthDescriptions;

@end

/**
 <p>Information about an action that returns a custom HTTP response.</p>
 Required parameters: [StatusCode]
 */
@interface AWSElasticLoadBalancingFixedResponseActionConfig : AWSModel


/**
 <p>The content type.</p><p>Valid Values: text/plain | text/css | text/html | application/javascript | application/json</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageBody;

/**
 <p>The HTTP response code (2XX, 4XX, or 5XX).</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusCode;

@end

/**
 <p>Information about a forward action.</p>
 */
@interface AWSElasticLoadBalancingForwardActionConfig : AWSModel


/**
 <p>The target group stickiness for the rule.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingTargetGroupStickinessConfig * _Nullable targetGroupStickinessConfig;

/**
 <p>One or more target groups. For Network Load Balancers, you can specify a single target group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTargetGroupTuple *> * _Nullable targetGroups;

@end

/**
 <p>Information about a host header condition.</p>
 */
@interface AWSElasticLoadBalancingHostHeaderConditionConfig : AWSModel


/**
 <p>One or more host names. The maximum size of each name is 128 characters. The comparison is case insensitive. The following wildcard characters are supported: * (matches 0 or more characters) and ? (matches exactly 1 character).</p><p>If you specify multiple strings, the condition is satisfied if one of the strings matches the host name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Information about an HTTP header condition.</p><p>There is a set of standard HTTP header fields. You can also define custom HTTP header fields.</p>
 */
@interface AWSElasticLoadBalancingHttpHeaderConditionConfig : AWSModel


/**
 <p>The name of the HTTP header field. The maximum size is 40 characters. The header name is case insensitive. The allowed characters are specified by RFC 7230. Wildcards are not supported.</p><p>You can't use an HTTP header condition to specify the host header. Use <a>HostHeaderConditionConfig</a> to specify a host header condition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable httpHeaderName;

/**
 <p>One or more strings to compare against the value of the HTTP header. The maximum size of each string is 128 characters. The comparison strings are case insensitive. The following wildcard characters are supported: * (matches 0 or more characters) and ? (matches exactly 1 character).</p><p>If the same header appears multiple times in the request, we search them in order until a match is found.</p><p>If you specify multiple strings, the condition is satisfied if one of the strings matches the value of the HTTP header. To require that all of the strings are a match, create one condition per string.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Information about an HTTP method condition.</p><p>HTTP defines a set of request methods, also referred to as HTTP verbs. For more information, see the <a href="https://www.iana.org/assignments/http-methods/http-methods.xhtml">HTTP Method Registry</a>. You can also define custom HTTP methods.</p>
 */
@interface AWSElasticLoadBalancingHttpRequestMethodConditionConfig : AWSModel


/**
 <p>The name of the request method. The maximum size is 40 characters. The allowed characters are A-Z, hyphen (-), and underscore (_). The comparison is case sensitive. Wildcards are not supported; therefore, the method name must be an exact match.</p><p>If you specify multiple strings, the condition is satisfied if one of the strings matches the HTTP request method. We recommend that you route GET and HEAD requests in the same way, because the response to a HEAD request may be cached.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Information about an Elastic Load Balancing resource limit for your Amazon Web Services account.</p>
 */
@interface AWSElasticLoadBalancingLimit : AWSModel


/**
 <p>The maximum value of the limit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable max;

/**
 <p>The name of the limit. The possible values are:</p><ul><li><p>application-load-balancers</p></li><li><p>condition-values-per-alb-rule</p></li><li><p>condition-wildcards-per-alb-rule</p></li><li><p>gateway-load-balancers</p></li><li><p>gateway-load-balancers-per-vpc</p></li><li><p>geneve-target-groups</p></li><li><p>listeners-per-application-load-balancer</p></li><li><p>listeners-per-network-load-balancer</p></li><li><p>network-load-balancers</p></li><li><p>rules-per-application-load-balancer</p></li><li><p>target-groups</p></li><li><p>target-groups-per-action-on-application-load-balancer</p></li><li><p>target-groups-per-action-on-network-load-balancer</p></li><li><p>target-groups-per-application-load-balancer</p></li><li><p>targets-per-application-load-balancer</p></li><li><p>targets-per-availability-zone-per-gateway-load-balancer</p></li><li><p>targets-per-availability-zone-per-network-load-balancer</p></li><li><p>targets-per-network-load-balancer</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information about a listener.</p>
 */
@interface AWSElasticLoadBalancingListener : AWSModel


/**
 <p>[TLS listener] The name of the Application-Layer Protocol Negotiation (ALPN) policy.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alpnPolicy;

/**
 <p>[HTTPS or TLS listener] The default certificate for the listener.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingCertificate *> * _Nullable certificates;

/**
 <p>The default actions for the listener.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingAction *> * _Nullable defaultActions;

/**
 <p>The Amazon Resource Name (ARN) of the listener.</p>
 */
@property (nonatomic, strong) NSString * _Nullable listenerArn;

/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerArn;

/**
 <p>The port on which the load balancer is listening.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The protocol for connections from clients to the load balancer.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingProtocolEnum protocols;

/**
 <p>[HTTPS or TLS listener] The security policy that defines which protocols and ciphers are supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sslPolicy;

@end

/**
 <p>Information about a load balancer.</p>
 */
@interface AWSElasticLoadBalancingLoadBalancer : AWSModel


/**
 <p>The subnets for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingAvailabilityZone *> * _Nullable availabilityZones;

/**
 <p>The ID of the Amazon Route 53 hosted zone associated with the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable canonicalHostedZoneId;

/**
 <p>The date and time the load balancer was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>[Application Load Balancers on Outposts] The ID of the customer-owned address pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerOwnedIpv4Pool;

/**
 <p>The public DNS name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DNSName;

/**
 <p>The type of IP addresses used by the subnets for your load balancer. The possible values are <code>ipv4</code> (for IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses).</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingIpAddressType ipAddressType;

/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerArn;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The nodes of an Internet-facing load balancer have public IP addresses. The DNS name of an Internet-facing load balancer is publicly resolvable to the public IP addresses of the nodes. Therefore, Internet-facing load balancers can route requests from clients over the internet.</p><p>The nodes of an internal load balancer have only private IP addresses. The DNS name of an internal load balancer is publicly resolvable to the private IP addresses of the nodes. Therefore, internal load balancers can route requests only from clients with access to the VPC for the load balancer.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingLoadBalancerSchemeEnum scheme;

/**
 <p>The IDs of the security groups for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The state of the load balancer.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerState * _Nullable state;

/**
 <p>The type of load balancer.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingLoadBalancerTypeEnum types;

/**
 <p>The ID of the VPC for the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Information about a static IP address for a load balancer.</p>
 */
@interface AWSElasticLoadBalancingLoadBalancerAddress : AWSModel


/**
 <p>[Network Load Balancers] The allocation ID of the Elastic IP address for an internal-facing load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allocationId;

/**
 <p>[Network Load Balancers] The IPv6 address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable IPv6Address;

/**
 <p>The static IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 <p>[Network Load Balancers] The private IPv4 address for an internal load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIPv4Address;

@end

/**
 <p>Information about a load balancer attribute.</p>
 */
@interface AWSElasticLoadBalancingLoadBalancerAttribute : AWSModel


/**
 <p>The name of the attribute.</p><p>The following attribute is supported by all load balancers:</p><ul><li><p><code>deletion_protection.enabled</code> - Indicates whether deletion protection is enabled. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>.</p></li></ul><p>The following attributes are supported by both Application Load Balancers and Network Load Balancers:</p><ul><li><p><code>access_logs.s3.enabled</code> - Indicates whether access logs are enabled. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>.</p></li><li><p><code>access_logs.s3.bucket</code> - The name of the S3 bucket for the access logs. This attribute is required if access logs are enabled. The bucket must exist in the same region as the load balancer and have a bucket policy that grants Elastic Load Balancing permissions to write to the bucket.</p></li><li><p><code>access_logs.s3.prefix</code> - The prefix for the location in the S3 bucket for the access logs.</p></li><li><p><code>ipv6.deny_all_igw_traffic</code> - Blocks internet gateway (IGW) access to the load balancer. It is set to <code>false</code> for internet-facing load balancers and <code>true</code> for internal load balancers, preventing unintended access to your internal load balancer through an internet gateway.</p></li></ul><p>The following attributes are supported by only Application Load Balancers:</p><ul><li><p><code>idle_timeout.timeout_seconds</code> - The idle timeout value, in seconds. The valid range is 1-4000 seconds. The default is 60 seconds.</p></li><li><p><code>routing.http.desync_mitigation_mode</code> - Determines how the load balancer handles requests that might pose a security risk to your application. The possible values are <code>monitor</code>, <code>defensive</code>, and <code>strictest</code>. The default is <code>defensive</code>.</p></li><li><p><code>routing.http.drop_invalid_header_fields.enabled</code> - Indicates whether HTTP headers with invalid header fields are removed by the load balancer (<code>true</code>) or routed to targets (<code>false</code>). The default is <code>false</code>.</p></li><li><p><code>routing.http.preserve_host_header.enabled</code> - Indicates whether the Application Load Balancer should preserve the <code>Host</code> header in the HTTP request and send it to the target without any change. The possible values are <code>true</code> and <code>false</code>. The default is <code>false</code>.</p></li><li><p><code>routing.http.x_amzn_tls_version_and_cipher_suite.enabled</code> - Indicates whether the two headers (<code>x-amzn-tls-version</code> and <code>x-amzn-tls-cipher-suite</code>), which contain information about the negotiated TLS version and cipher suite, are added to the client request before sending it to the target. The <code>x-amzn-tls-version</code> header has information about the TLS protocol version negotiated with the client, and the <code>x-amzn-tls-cipher-suite</code> header has information about the cipher suite negotiated with the client. Both headers are in OpenSSL format. The possible values for the attribute are <code>true</code> and <code>false</code>. The default is <code>false</code>.</p></li><li><p><code>routing.http.xff_client_port.enabled</code> - Indicates whether the <code>X-Forwarded-For</code> header should preserve the source port that the client used to connect to the load balancer. The possible values are <code>true</code> and <code>false</code>. The default is <code>false</code>.</p></li><li><p><code>routing.http.xff_header_processing.mode</code> - Enables you to modify, preserve, or remove the <code>X-Forwarded-For</code> header in the HTTP request before the Application Load Balancer sends the request to the target. The possible values are <code>append</code>, <code>preserve</code>, and <code>remove</code>. The default is <code>append</code>.</p><ul><li><p>If the value is <code>append</code>, the Application Load Balancer adds the client IP address (of the last hop) to the <code>X-Forwarded-For</code> header in the HTTP request before it sends it to targets.</p></li><li><p>If the value is <code>preserve</code> the Application Load Balancer preserves the <code>X-Forwarded-For</code> header in the HTTP request, and sends it to targets without any change.</p></li><li><p>If the value is <code>remove</code>, the Application Load Balancer removes the <code>X-Forwarded-For</code> header in the HTTP request before it sends it to targets.</p></li></ul></li><li><p><code>routing.http2.enabled</code> - Indicates whether HTTP/2 is enabled. The possible values are <code>true</code> and <code>false</code>. The default is <code>true</code>. Elastic Load Balancing requires that message header names contain only alphanumeric characters and hyphens.</p></li><li><p><code>waf.fail_open.enabled</code> - Indicates whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the request to Amazon Web Services WAF. The possible values are <code>true</code> and <code>false</code>. The default is <code>false</code>.</p></li></ul><p>The following attribute is supported by Network Load Balancers and Gateway Load Balancers:</p><ul><li><p><code>load_balancing.cross_zone.enabled</code> - Indicates whether cross-zone load balancing is enabled. The possible values are <code>true</code> and <code>false</code>. The default is <code>false</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about the state of the load balancer.</p>
 */
@interface AWSElasticLoadBalancingLoadBalancerState : AWSModel


/**
 <p>The state code. The initial state of the load balancer is <code>provisioning</code>. After the load balancer is fully set up and ready to route traffic, its state is <code>active</code>. If load balancer is routing traffic but does not have the resources it needs to scale, its state is<code>active_impaired</code>. If the load balancer could not be set up, its state is <code>failed</code>.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingLoadBalancerStateEnum code;

/**
 <p>A description of the state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reason;

@end

/**
 <p>The codes to use when checking for a successful response from a target. If the protocol version is gRPC, these are gRPC codes. Otherwise, these are HTTP codes. </p>
 */
@interface AWSElasticLoadBalancingMatcher : AWSModel


/**
 <p>You can specify values between 0 and 99. You can specify multiple values (for example, "0,1") or a range of values (for example, "0-5"). The default value is 12.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grpcCode;

/**
 <p>For Application Load Balancers, you can specify values between 200 and 499, and the default value is 200. You can specify multiple values (for example, "200,202") or a range of values (for example, "200-299").</p><p>For Network Load Balancers and Gateway Load Balancers, this must be "200–399".</p><p>Note that when using shorthand syntax, some values such as commas need to be escaped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable httpCode;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyListenerInput : AWSRequest


/**
 <p>[TLS listeners] The name of the Application-Layer Protocol Negotiation (ALPN) policy. You can specify one policy name. The following are the possible values:</p><ul><li><p><code>HTTP1Only</code></p></li><li><p><code>HTTP2Only</code></p></li><li><p><code>HTTP2Optional</code></p></li><li><p><code>HTTP2Preferred</code></p></li><li><p><code>None</code></p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#alpn-policies">ALPN policies</a> in the <i>Network Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alpnPolicy;

/**
 <p>[HTTPS and TLS listeners] The default certificate for the listener. You must provide exactly one certificate. Set <code>CertificateArn</code> to the certificate ARN but do not set <code>IsDefault</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingCertificate *> * _Nullable certificates;

/**
 <p>The actions for the default rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingAction *> * _Nullable defaultActions;

/**
 <p>The Amazon Resource Name (ARN) of the listener.</p>
 */
@property (nonatomic, strong) NSString * _Nullable listenerArn;

/**
 <p>The port for connections from clients to the load balancer. You cannot specify a port for a Gateway Load Balancer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The protocol for connections from clients to the load balancer. Application Load Balancers support the HTTP and HTTPS protocols. Network Load Balancers support the TCP, TLS, UDP, and TCP_UDP protocols. You can’t change the protocol to UDP or TCP_UDP if dual-stack mode is enabled. You cannot specify a protocol for a Gateway Load Balancer.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingProtocolEnum protocols;

/**
 <p>[HTTPS and TLS listeners] The security policy that defines which protocols and ciphers are supported.</p><p>For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies">Security policies</a> in the <i>Application Load Balancers Guide</i> or <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies">Security policies</a> in the <i>Network Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sslPolicy;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyListenerOutput : AWSModel


/**
 <p>Information about the modified listener.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingListener *> * _Nullable listeners;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyLoadBalancerAttributesInput : AWSRequest


/**
 <p>The load balancer attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingLoadBalancerAttribute *> * _Nullable attributes;

/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput : AWSModel


/**
 <p>Information about the load balancer attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingLoadBalancerAttribute *> * _Nullable attributes;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyRuleInput : AWSRequest


/**
 <p>The actions.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingAction *> * _Nullable actions;

/**
 <p>The conditions.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingRuleCondition *> * _Nullable conditions;

/**
 <p>The Amazon Resource Name (ARN) of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyRuleOutput : AWSModel


/**
 <p>Information about the modified rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyTargetGroupAttributesInput : AWSRequest


/**
 <p>The attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTargetGroupAttribute *> * _Nullable attributes;

/**
 <p>The Amazon Resource Name (ARN) of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyTargetGroupAttributesOutput : AWSModel


/**
 <p>Information about the attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTargetGroupAttribute *> * _Nullable attributes;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyTargetGroupInput : AWSRequest


/**
 <p>Indicates whether health checks are enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckEnabled;

/**
 <p>The approximate amount of time, in seconds, between health checks of an individual target. For TCP health checks, the supported values are 10 or 30 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckIntervalSeconds;

/**
 <p>[HTTP/HTTPS health checks] The destination for health checks on the targets.</p><p>[HTTP1 or HTTP2 protocol version] The ping path. The default is /.</p><p>[GRPC protocol version] The path of a custom health check method with the format /package.service/method. The default is /Amazon Web Services.ALB/healthcheck.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckPath;

/**
 <p>The port the load balancer uses when performing health checks on targets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckPort;

/**
 <p>The protocol the load balancer uses when performing health checks on targets. For Application Load Balancers, the default is HTTP. For Network Load Balancers and Gateway Load Balancers, the default is TCP. The TCP protocol is not supported for health checks if the protocol of the target group is HTTP or HTTPS. It is supported for health checks only if the protocol of the target group is TCP, TLS, UDP, or TCP_UDP. The GENEVE, TLS, UDP, and TCP_UDP protocols are not supported for health checks.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingProtocolEnum healthCheckProtocol;

/**
 <p>[HTTP/HTTPS health checks] The amount of time, in seconds, during which no response means a failed health check.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckTimeoutSeconds;

/**
 <p>The number of consecutive health checks successes required before considering an unhealthy target healthy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthyThresholdCount;

/**
 <p>[HTTP/HTTPS health checks] The HTTP or gRPC codes to use when checking for a successful response from a target.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingMatcher * _Nullable matcher;

/**
 <p>The Amazon Resource Name (ARN) of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupArn;

/**
 <p>The number of consecutive health check failures required before considering the target unhealthy. For target groups with a protocol of TCP or TLS, this value must be the same as the healthy threshold count.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unhealthyThresholdCount;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyTargetGroupOutput : AWSModel


/**
 <p>Information about the modified target group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTargetGroup *> * _Nullable targetGroups;

@end

/**
 <p>Information about a path pattern condition.</p>
 */
@interface AWSElasticLoadBalancingPathPatternConditionConfig : AWSModel


/**
 <p>One or more path patterns to compare against the request URL. The maximum size of each string is 128 characters. The comparison is case sensitive. The following wildcard characters are supported: * (matches 0 or more characters) and ? (matches exactly 1 character).</p><p>If you specify multiple strings, the condition is satisfied if one of them matches the request URL. The path pattern is compared only to the path of the URL, not to its query string. To compare against the query string, use <a>QueryStringConditionConfig</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Information about a query string condition.</p><p>The query string component of a URI starts after the first '?' character and is terminated by either a '#' character or the end of the URI. A typical query string contains key/value pairs separated by '&amp;' characters. The allowed characters are specified by RFC 3986. Any character can be percentage encoded.</p>
 */
@interface AWSElasticLoadBalancingQueryStringConditionConfig : AWSModel


/**
 <p>One or more key/value pairs or values to find in the query string. The maximum size of each string is 128 characters. The comparison is case insensitive. The following wildcard characters are supported: * (matches 0 or more characters) and ? (matches exactly 1 character). To search for a literal '*' or '?' character in a query string, you must escape these characters in <code>Values</code> using a '\' character.</p><p>If you specify multiple key/value pairs or values, the condition is satisfied if one of them is found in the query string.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingQueryStringKeyValuePair *> * _Nullable values;

@end

/**
 <p>Information about a key/value pair.</p>
 */
@interface AWSElasticLoadBalancingQueryStringKeyValuePair : AWSModel


/**
 <p>The key. You can omit the key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about a redirect action.</p><p>A URI consists of the following components: protocol://hostname:port/path?query. You must modify at least one of the following components to avoid a redirect loop: protocol, hostname, port, or path. Any components that you do not modify retain their original values.</p><p>You can reuse URI components using the following reserved keywords:</p><ul><li><p>#{protocol}</p></li><li><p>#{host}</p></li><li><p>#{port}</p></li><li><p>#{path} (the leading "/" is removed)</p></li><li><p>#{query}</p></li></ul><p>For example, you can change the path to "/new/#{path}", the hostname to "example.#{host}", or the query to "#{query}&amp;value=xyz".</p>
 Required parameters: [StatusCode]
 */
@interface AWSElasticLoadBalancingRedirectActionConfig : AWSModel


/**
 <p>The hostname. This component is not percent-encoded. The hostname can contain #{host}.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>The absolute path, starting with the leading "/". This component is not percent-encoded. The path can contain #{host}, #{path}, and #{port}.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The port. You can specify a value from 1 to 65535 or #{port}.</p>
 */
@property (nonatomic, strong) NSString * _Nullable port;

/**
 <p>The protocol. You can specify HTTP, HTTPS, or #{protocol}. You can redirect HTTP to HTTP, HTTP to HTTPS, and HTTPS to HTTPS. You cannot redirect HTTPS to HTTP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 <p>The query parameters, URL-encoded when necessary, but not percent-encoded. Do not include the leading "?", as it is automatically added. You can specify any of the reserved keywords.</p>
 */
@property (nonatomic, strong) NSString * _Nullable query;

/**
 <p>The HTTP redirect code. The redirect is either permanent (HTTP 301) or temporary (HTTP 302).</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingRedirectActionStatusCodeEnum statusCode;

@end

/**
 
 */
@interface AWSElasticLoadBalancingRegisterTargetsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupArn;

/**
 <p>The targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTargetDescription *> * _Nullable targets;

@end

/**
 
 */
@interface AWSElasticLoadBalancingRegisterTargetsOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingRemoveListenerCertificatesInput : AWSRequest


/**
 <p>The certificate to remove. You can specify one certificate per call. Set <code>CertificateArn</code> to the certificate ARN but do not set <code>IsDefault</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingCertificate *> * _Nullable certificates;

/**
 <p>The Amazon Resource Name (ARN) of the listener.</p>
 */
@property (nonatomic, strong) NSString * _Nullable listenerArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingRemoveListenerCertificatesOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingRemoveTagsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

/**
 <p>The tag keys for the tags to remove.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSElasticLoadBalancingRemoveTagsOutput : AWSModel


@end

/**
 <p>Information about a rule.</p>
 */
@interface AWSElasticLoadBalancingRule : AWSModel


/**
 <p>The actions. Each rule must include exactly one of the following types of actions: <code>forward</code>, <code>redirect</code>, or <code>fixed-response</code>, and it must be the last action to be performed.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingAction *> * _Nullable actions;

/**
 <p>The conditions. Each rule can include zero or one of the following conditions: <code>http-request-method</code>, <code>host-header</code>, <code>path-pattern</code>, and <code>source-ip</code>, and zero or more of the following conditions: <code>http-header</code> and <code>query-string</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingRuleCondition *> * _Nullable conditions;

/**
 <p>Indicates whether this is the default rule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefault;

/**
 <p>The priority.</p>
 */
@property (nonatomic, strong) NSString * _Nullable priority;

/**
 <p>The Amazon Resource Name (ARN) of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

@end

/**
 <p>Information about a condition for a rule.</p><p>Each rule can optionally include up to one of each of the following conditions: <code>http-request-method</code>, <code>host-header</code>, <code>path-pattern</code>, and <code>source-ip</code>. Each rule can also optionally include one or more of each of the following conditions: <code>http-header</code> and <code>query-string</code>. Note that the value for a condition cannot be empty.</p>
 */
@interface AWSElasticLoadBalancingRuleCondition : AWSModel


/**
 <p>The field in the HTTP request. The following are the possible values:</p><ul><li><p><code>http-header</code></p></li><li><p><code>http-request-method</code></p></li><li><p><code>host-header</code></p></li><li><p><code>path-pattern</code></p></li><li><p><code>query-string</code></p></li><li><p><code>source-ip</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable field;

/**
 <p>Information for a host header condition. Specify only when <code>Field</code> is <code>host-header</code>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHostHeaderConditionConfig * _Nullable hostHeaderConfig;

/**
 <p>Information for an HTTP header condition. Specify only when <code>Field</code> is <code>http-header</code>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHttpHeaderConditionConfig * _Nullable httpHeaderConfig;

/**
 <p>Information for an HTTP method condition. Specify only when <code>Field</code> is <code>http-request-method</code>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHttpRequestMethodConditionConfig * _Nullable httpRequestMethodConfig;

/**
 <p>Information for a path pattern condition. Specify only when <code>Field</code> is <code>path-pattern</code>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingPathPatternConditionConfig * _Nullable pathPatternConfig;

/**
 <p>Information for a query string condition. Specify only when <code>Field</code> is <code>query-string</code>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingQueryStringConditionConfig * _Nullable queryStringConfig;

/**
 <p>Information for a source IP condition. Specify only when <code>Field</code> is <code>source-ip</code>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingSourceIpConditionConfig * _Nullable sourceIpConfig;

/**
 <p>The condition value. Specify only when <code>Field</code> is <code>host-header</code> or <code>path-pattern</code>. Alternatively, to specify multiple host names or multiple path patterns, use <code>HostHeaderConfig</code> or <code>PathPatternConfig</code>.</p><p>If <code>Field</code> is <code>host-header</code> and you are not using <code>HostHeaderConfig</code>, you can specify a single host name (for example, my.example.com) in <code>Values</code>. A host name is case insensitive, can be up to 128 characters in length, and can contain any of the following characters.</p><ul><li><p>A-Z, a-z, 0-9</p></li><li><p>- .</p></li><li><p>* (matches 0 or more characters)</p></li><li><p>? (matches exactly 1 character)</p></li></ul><p>If <code>Field</code> is <code>path-pattern</code> and you are not using <code>PathPatternConfig</code>, you can specify a single path pattern (for example, /img/*) in <code>Values</code>. A path pattern is case-sensitive, can be up to 128 characters in length, and can contain any of the following characters.</p><ul><li><p>A-Z, a-z, 0-9</p></li><li><p>_ - . $ / ~ " ' @ : +</p></li><li><p>&amp; (using &amp;amp;)</p></li><li><p>* (matches 0 or more characters)</p></li><li><p>? (matches exactly 1 character)</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Information about the priorities for the rules for a listener.</p>
 */
@interface AWSElasticLoadBalancingRulePriorityPair : AWSModel


/**
 <p>The rule priority.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The Amazon Resource Name (ARN) of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingSetIpAddressTypeInput : AWSRequest


/**
 <p>The IP address type. The possible values are <code>ipv4</code> (for IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses). You can’t specify <code>dualstack</code> for a load balancer with a UDP or TCP_UDP listener.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingIpAddressType ipAddressType;

/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerArn;

@end

/**
 
 */
@interface AWSElasticLoadBalancingSetIpAddressTypeOutput : AWSModel


/**
 <p>The IP address type.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingIpAddressType ipAddressType;

@end

/**
 
 */
@interface AWSElasticLoadBalancingSetRulePrioritiesInput : AWSRequest


/**
 <p>The rule priorities.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingRulePriorityPair *> * _Nullable rulePriorities;

@end

/**
 
 */
@interface AWSElasticLoadBalancingSetRulePrioritiesOutput : AWSModel


/**
 <p>Information about the rules.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSElasticLoadBalancingSetSecurityGroupsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerArn;

/**
 <p>The IDs of the security groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

@end

/**
 
 */
@interface AWSElasticLoadBalancingSetSecurityGroupsOutput : AWSModel


/**
 <p>The IDs of the security groups associated with the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

@end

/**
 
 */
@interface AWSElasticLoadBalancingSetSubnetsInput : AWSRequest


/**
 <p>[Network Load Balancers] The type of IP addresses used by the subnets for your load balancer. The possible values are <code>ipv4</code> (for IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses). You can’t specify <code>dualstack</code> for a load balancer with a UDP or TCP_UDP listener. .</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingIpAddressType ipAddressType;

/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerArn;

/**
 <p>The IDs of the public subnets. You can specify only one subnet per Availability Zone. You must specify either subnets or subnet mappings.</p><p>[Application Load Balancers] You must specify subnets from at least two Availability Zones. You cannot specify Elastic IP addresses for your subnets.</p><p>[Application Load Balancers on Outposts] You must specify one Outpost subnet.</p><p>[Application Load Balancers on Local Zones] You can specify subnets from one or more Local Zones.</p><p>[Network Load Balancers] You can specify subnets from one or more Availability Zones. You can specify one Elastic IP address per subnet if you need static IP addresses for your internet-facing load balancer. For internal load balancers, you can specify one private IP address per subnet from the IPv4 range of the subnet. For internet-facing load balancer, you can specify one IPv6 address per subnet.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingSubnetMapping *> * _Nullable subnetMappings;

/**
 <p>The IDs of the public subnets. You can specify only one subnet per Availability Zone. You must specify either subnets or subnet mappings.</p><p>[Application Load Balancers] You must specify subnets from at least two Availability Zones.</p><p>[Application Load Balancers on Outposts] You must specify one Outpost subnet.</p><p>[Application Load Balancers on Local Zones] You can specify subnets from one or more Local Zones.</p><p>[Network Load Balancers] You can specify subnets from one or more Availability Zones.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

@end

/**
 
 */
@interface AWSElasticLoadBalancingSetSubnetsOutput : AWSModel


/**
 <p>Information about the subnets.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingAvailabilityZone *> * _Nullable availabilityZones;

/**
 <p>[Network Load Balancers] The IP address type.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingIpAddressType ipAddressType;

@end

/**
 <p>Information about a source IP condition.</p><p>You can use this condition to route based on the IP address of the source that connects to the load balancer. If a client is behind a proxy, this is the IP address of the proxy not the IP address of the client.</p>
 */
@interface AWSElasticLoadBalancingSourceIpConditionConfig : AWSModel


/**
 <p>One or more source IP addresses, in CIDR format. You can use both IPv4 and IPv6 addresses. Wildcards are not supported.</p><p>If you specify multiple addresses, the condition is satisfied if the source IP address of the request matches one of the CIDR blocks. This condition is not satisfied by the addresses in the X-Forwarded-For header. To search for addresses in the X-Forwarded-For header, use <a>HttpHeaderConditionConfig</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Information about a policy used for SSL negotiation.</p>
 */
@interface AWSElasticLoadBalancingSslPolicy : AWSModel


/**
 <p>The ciphers.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingCipher *> * _Nullable ciphers;

/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The protocols.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sslProtocols;

/**
 <p> The supported load balancers. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedLoadBalancerTypes;

@end

/**
 <p>Information about a subnet mapping.</p>
 */
@interface AWSElasticLoadBalancingSubnetMapping : AWSModel


/**
 <p>[Network Load Balancers] The allocation ID of the Elastic IP address for an internet-facing load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allocationId;

/**
 <p>[Network Load Balancers] The IPv6 address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable IPv6Address;

/**
 <p>[Network Load Balancers] The private IPv4 address for an internal load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIPv4Address;

/**
 <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>Information about a tag.</p>
 Required parameters: [Key]
 */
@interface AWSElasticLoadBalancingTag : AWSModel


/**
 <p>The key of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The tags associated with a resource.</p>
 */
@interface AWSElasticLoadBalancingTagDescription : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Information about the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTag *> * _Nullable tags;

@end

/**
 <p>Information about a target.</p>
 Required parameters: [Id]
 */
@interface AWSElasticLoadBalancingTargetDescription : AWSModel


/**
 <p>An Availability Zone or <code>all</code>. This determines whether the target receives traffic from the load balancer nodes in the specified Availability Zone or from all enabled Availability Zones for the load balancer.</p><p>This parameter is not supported if the target type of the target group is <code>instance</code> or <code>alb</code>.</p><p>If the target type is <code>ip</code> and the IP address is in a subnet of the VPC for the target group, the Availability Zone is automatically detected and this parameter is optional. If the IP address is outside the VPC, this parameter is required.</p><p>With an Application Load Balancer, if the target type is <code>ip</code> and the IP address is outside the VPC for the target group, the only supported value is <code>all</code>.</p><p>If the target type is <code>lambda</code>, this parameter is optional and the only supported value is <code>all</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The ID of the target. If the target type of the target group is <code>instance</code>, specify an instance ID. If the target type is <code>ip</code>, specify an IP address. If the target type is <code>lambda</code>, specify the ARN of the Lambda function. If the target type is <code>alb</code>, specify the ARN of the Application Load Balancer target. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The port on which the target is listening. If the target group protocol is GENEVE, the supported port is 6081. If the target type is <code>alb</code>, the targeted Application Load Balancer must have at least one listener whose port matches the target group port. Not used if the target is a Lambda function.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>Information about a target group.</p>
 */
@interface AWSElasticLoadBalancingTargetGroup : AWSModel


/**
 <p>Indicates whether health checks are enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckEnabled;

/**
 <p>The approximate amount of time, in seconds, between health checks of an individual target.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckIntervalSeconds;

/**
 <p>The destination for health checks on the targets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckPath;

/**
 <p>The port to use to connect with the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckPort;

/**
 <p>The protocol to use to connect with the target. The GENEVE, TLS, UDP, and TCP_UDP protocols are not supported for health checks.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingProtocolEnum healthCheckProtocol;

/**
 <p>The amount of time, in seconds, during which no response means a failed health check.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckTimeoutSeconds;

/**
 <p>The number of consecutive health checks successes required before considering an unhealthy target healthy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthyThresholdCount;

/**
 <p>The type of IP address used for this target group. The possible values are <code>ipv4</code> and <code>ipv6</code>. This is an optional parameter. If not specified, the IP address type defaults to <code>ipv4</code>.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingTargetGroupIpAddressTypeEnum ipAddressType;

/**
 <p>The Amazon Resource Names (ARN) of the load balancers that route traffic to this target group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerArns;

/**
 <p>The HTTP or gRPC codes to use when checking for a successful response from a target.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingMatcher * _Nullable matcher;

/**
 <p>The port on which the targets are listening. Not used if the target is a Lambda function.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The protocol to use for routing traffic to the targets.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingProtocolEnum protocols;

/**
 <p>[HTTP/HTTPS protocol] The protocol version. The possible values are <code>GRPC</code>, <code>HTTP1</code>, and <code>HTTP2</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocolVersion;

/**
 <p>The Amazon Resource Name (ARN) of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupArn;

/**
 <p>The name of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupName;

/**
 <p>The type of target that you must specify when registering targets with this target group. The possible values are <code>instance</code> (register targets by instance ID), <code>ip</code> (register targets by IP address), <code>lambda</code> (register a single Lambda function as a target), or <code>alb</code> (register a single Application Load Balancer as a target).</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingTargetTypeEnum targetType;

/**
 <p>The number of consecutive health check failures required before considering the target unhealthy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unhealthyThresholdCount;

/**
 <p>The ID of the VPC for the targets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Information about a target group attribute.</p>
 */
@interface AWSElasticLoadBalancingTargetGroupAttribute : AWSModel


/**
 <p>The name of the attribute.</p><p>The following attribute is supported by all load balancers:</p><ul><li><p><code>deregistration_delay.timeout_seconds</code> - The amount of time, in seconds, for Elastic Load Balancing to wait before changing the state of a deregistering target from <code>draining</code> to <code>unused</code>. The range is 0-3600 seconds. The default value is 300 seconds. If the target is a Lambda function, this attribute is not supported.</p></li></ul><p>The following attributes are supported by both Application Load Balancers and Network Load Balancers:</p><ul><li><p><code>stickiness.enabled</code> - Indicates whether sticky sessions are enabled. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>.</p></li><li><p><code>stickiness.type</code> - The type of sticky sessions. The possible values are <code>lb_cookie</code> and <code>app_cookie</code> for Application Load Balancers or <code>source_ip</code> for Network Load Balancers.</p></li></ul><p>The following attributes are supported only if the load balancer is an Application Load Balancer and the target is an instance or an IP address:</p><ul><li><p><code>load_balancing.algorithm.type</code> - The load balancing algorithm determines how the load balancer selects targets when routing requests. The value is <code>round_robin</code> or <code>least_outstanding_requests</code>. The default is <code>round_robin</code>.</p></li><li><p><code>slow_start.duration_seconds</code> - The time period, in seconds, during which a newly registered target receives an increasing share of the traffic to the target group. After this time period ends, the target receives its full share of traffic. The range is 30-900 seconds (15 minutes). The default is 0 seconds (disabled).</p></li><li><p><code>stickiness.app_cookie.cookie_name</code> - Indicates the name of the application-based cookie. Names that start with the following prefixes are not allowed: <code>AWSALB</code>, <code>AWSALBAPP</code>, and <code>AWSALBTG</code>; they're reserved for use by the load balancer.</p></li><li><p><code>stickiness.app_cookie.duration_seconds</code> - The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the application-based cookie is considered stale. The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds).</p></li><li><p><code>stickiness.lb_cookie.duration_seconds</code> - The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds).</p></li></ul><p>The following attribute is supported only if the load balancer is an Application Load Balancer and the target is a Lambda function:</p><ul><li><p><code>lambda.multi_value_headers.enabled</code> - Indicates whether the request and response headers that are exchanged between the load balancer and the Lambda function include arrays of values or strings. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>. If the value is <code>false</code> and the request contains a duplicate header field name or query parameter key, the load balancer uses the last value sent by the client.</p></li></ul><p>The following attributes are supported only by Network Load Balancers:</p><ul><li><p><code>deregistration_delay.connection_termination.enabled</code> - Indicates whether the load balancer terminates connections at the end of the deregistration timeout. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>.</p></li><li><p><code>preserve_client_ip.enabled</code> - Indicates whether client IP preservation is enabled. The value is <code>true</code> or <code>false</code>. The default is disabled if the target group type is IP address and the target group protocol is TCP or TLS. Otherwise, the default is enabled. Client IP preservation cannot be disabled for UDP and TCP_UDP target groups.</p></li><li><p><code>proxy_protocol_v2.enabled</code> - Indicates whether Proxy Protocol version 2 is enabled. The value is <code>true</code> or <code>false</code>. The default is <code>false</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about the target group stickiness for a rule.</p>
 */
@interface AWSElasticLoadBalancingTargetGroupStickinessConfig : AWSModel


/**
 <p>The time period, in seconds, during which requests from a client should be routed to the same target group. The range is 1-604800 seconds (7 days).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>Indicates whether target group stickiness is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Information about how traffic will be distributed between multiple target groups in a forward rule.</p>
 */
@interface AWSElasticLoadBalancingTargetGroupTuple : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupArn;

/**
 <p>The weight. The range is 0 to 999.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable weight;

@end

/**
 <p>Information about the current health of a target.</p>
 */
@interface AWSElasticLoadBalancingTargetHealth : AWSModel


/**
 <p>A description of the target health that provides additional details. If the state is <code>healthy</code>, a description is not provided.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The reason code.</p><p>If the target state is <code>healthy</code>, a reason code is not provided.</p><p>If the target state is <code>initial</code>, the reason code can be one of the following values:</p><ul><li><p><code>Elb.RegistrationInProgress</code> - The target is in the process of being registered with the load balancer.</p></li><li><p><code>Elb.InitialHealthChecking</code> - The load balancer is still sending the target the minimum number of health checks required to determine its health status.</p></li></ul><p>If the target state is <code>unhealthy</code>, the reason code can be one of the following values:</p><ul><li><p><code>Target.ResponseCodeMismatch</code> - The health checks did not return an expected HTTP code. Applies only to Application Load Balancers and Gateway Load Balancers.</p></li><li><p><code>Target.Timeout</code> - The health check requests timed out. Applies only to Application Load Balancers and Gateway Load Balancers.</p></li><li><p><code>Target.FailedHealthChecks</code> - The load balancer received an error while establishing a connection to the target or the target response was malformed.</p></li><li><p><code>Elb.InternalError</code> - The health checks failed due to an internal error. Applies only to Application Load Balancers.</p></li></ul><p>If the target state is <code>unused</code>, the reason code can be one of the following values:</p><ul><li><p><code>Target.NotRegistered</code> - The target is not registered with the target group.</p></li><li><p><code>Target.NotInUse</code> - The target group is not used by any load balancer or the target is in an Availability Zone that is not enabled for its load balancer.</p></li><li><p><code>Target.InvalidState</code> - The target is in the stopped or terminated state.</p></li><li><p><code>Target.IpUnusable</code> - The target IP address is reserved for use by a load balancer.</p></li></ul><p>If the target state is <code>draining</code>, the reason code can be the following value:</p><ul><li><p><code>Target.DeregistrationInProgress</code> - The target is in the process of being deregistered and the deregistration delay period has not expired.</p></li></ul><p>If the target state is <code>unavailable</code>, the reason code can be the following value:</p><ul><li><p><code>Target.HealthCheckDisabled</code> - Health checks are disabled for the target group. Applies only to Application Load Balancers.</p></li><li><p><code>Elb.InternalError</code> - Target health is unavailable due to an internal error. Applies only to Network Load Balancers.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingTargetHealthReasonEnum reason;

/**
 <p>The state of the target.</p>
 */
@property (nonatomic, assign) AWSElasticLoadBalancingTargetHealthStateEnum state;

@end

/**
 <p>Information about the health of a target.</p>
 */
@interface AWSElasticLoadBalancingTargetHealthDescription : AWSModel


/**
 <p>The port to use to connect with the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckPort;

/**
 <p>The description of the target.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingTargetDescription * _Nullable target;

/**
 <p>The health information for the target.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingTargetHealth * _Nullable targetHealth;

@end

NS_ASSUME_NONNULL_END
