/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSNetworking.h"
#import "AZModel.h"

FOUNDATION_EXPORT NSString *const AWSSTSErrorDomain;

typedef NS_ENUM(NSInteger, AWSSTSErrorType) {
    AWSSTSErrorUnknown,
    AWSSTSErrorIncompleteSignature,
    AWSSTSErrorInvalidClientTokenId,
    AWSSTSErrorMissingAuthenticationToken,
    AWSSTSErrorExpiredToken,
    AWSSTSErrorIDPCommunicationError,
    AWSSTSErrorIDPRejectedClaim,
    AWSSTSErrorInvalidAuthorizationMessage,
    AWSSTSErrorInvalidIdentityToken,
    AWSSTSErrorMalformedPolicyDocument,
    AWSSTSErrorPackedPolicyTooLarge,
};

@class AWSSTSAssumeRoleRequest;
@class AWSSTSAssumeRoleResponse;
@class AWSSTSAssumeRoleWithSAMLRequest;
@class AWSSTSAssumeRoleWithSAMLResponse;
@class AWSSTSAssumeRoleWithWebIdentityRequest;
@class AWSSTSAssumeRoleWithWebIdentityResponse;
@class AWSSTSAssumedRoleUser;
@class AWSSTSCredentials;
@class AWSSTSDecodeAuthorizationMessageRequest;
@class AWSSTSDecodeAuthorizationMessageResponse;
@class AWSSTSFederatedUser;
@class AWSSTSGetFederationTokenRequest;
@class AWSSTSGetFederationTokenResponse;
@class AWSSTSGetSessionTokenRequest;
@class AWSSTSGetSessionTokenResponse;

@interface AWSSTSAssumeRoleRequest : AWSRequest


/**
 * <p> The duration, in seconds, of the role session. The value can range from 900 seconds (15 			minutes) to 3600 seconds (1 hour). By default, the value is set to 3600 seconds. </p>
 */
@property (nonatomic, strong) NSNumber *durationSeconds;

/**
 * <p> A unique identifier that is used by third parties to assume a role in their customers' 			accounts. For each role that the third party can assume, they should instruct their customers 			to create a role with the external ID that the third party generated. Each time the third 			party assumes the role, they must pass the customer's external ID. The external ID is useful 			in order to help third parties bind a role to the customer who created it. For more 			information about the external ID, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/sts-delegating-externalid.html" target="_blank">About the External ID</a> in <i>Using Temporary Security Credentials</i>. 		</p>
 */
@property (nonatomic, strong) NSString *externalId;

/**
 * <p>An AWS IAM policy in JSON format.</p> 		 		<p>The temporary security credentials that are returned by the operation have the permissions that are			associated with the access policy of the role being assumed, except for any permissions explicitly denied			by the policy you pass. This gives you a way to further restrict the permissions for the resulting temporary security credentials.			These policies and any applicable resource-based policies are evaluated when calls to AWS are made			using the temporary security credentials.		</p>
 */
@property (nonatomic, strong) NSString *policy;

/**
 * <p>The Amazon Resource Name (ARN) of the role that the caller is assuming.</p>
 */
@property (nonatomic, strong) NSString *roleArn;

/**
 * <p> An identifier for the assumed role session. The session name is included as part of the 				<code>AssumedRoleUser</code>. </p>
 */
@property (nonatomic, strong) NSString *roleSessionName;

/**
 * <p>The identification number of the MFA device that is associated with the user who is 	making the <code>AssumeRole</code> call. Specify this value if the trust policy of the 	role being assumed includes a condition that requires MFA authentication. 		The value is either the serial number for a hardware device 		(such as <code>GAHT12345678</code>) or an Amazon Resource Name (ARN) for a virtual device 		(such as <code>arn:aws:iam::123456789012:mfa/user</code>).		</p>
 */
@property (nonatomic, strong) NSString *serialNumber;

/**
 * <p>The value provided by the MFA device, if the trust policy of the 			role being assumed requires MFA (that is, if the policy includes a condition that 			tests for MFA). If the role being assumed requires MFA 			and if the <code>TokenCode</code> value is missing or expired, the 			<code>AssumeRole</code> call returns an "access denied" errror. 		</p>
 */
@property (nonatomic, strong) NSString *tokenCode;

@end

/**
 * <p> Contains the result of a successful call to the <a>AssumeRole</a> action, including 			temporary AWS credentials that can be used to make AWS requests. </p>
 */
@interface AWSSTSAssumeRoleResponse : AZModel


/**
 * <p> The Amazon Resource Name (ARN) and the assumed role ID, which are identifiers that you can 			use to refer to the resulting temporary security credentials. For example, you can reference 			these credentials as a principal in a resource-based policy by using the ARN or assumed role 			ID. The ARN and ID include the <code>RoleSessionName</code> that you specified when you called 				<code>AssumeRole</code>. </p>
 */
@property (nonatomic, strong) AWSSTSAssumedRoleUser *assumedRoleUser;

/**
 * <p>The temporary security credentials, which include an access key ID, a secret access key, and 			a security (or session) token.</p>
 */
@property (nonatomic, strong) AWSSTSCredentials *credentials;

/**
 * <p> A percentage value that indicates the size of the policy in packed form. The service rejects 			any policy with a packed size greater than 100 percent, which means the policy exceeded the 			allowed space. </p>
 */
@property (nonatomic, strong) NSNumber *packedPolicySize;

@end

@interface AWSSTSAssumeRoleWithSAMLRequest : AWSRequest


/**
 * <p>The duration, in seconds, of the role session. The value can range from 900 seconds (15 			minutes) to 3600 seconds (1 hour). By default, the value is set to 3600 seconds. An expiration 			can also be specified in the SAML authentication response's <code>NotOnOrAfter</code> value. 			The actual expiration time is whichever value is shorter. </p> 		 		<note>The maximum duration for a session is 1 hour, and the minimum duration is 15 minutes, even if 			values outside this range are specified. 		</note>
 */
@property (nonatomic, strong) NSNumber *durationSeconds;

/**
 * <p>An AWS IAM policy in JSON format.</p>			 		<p>The temporary security credentials that are returned by this operation have the permissions that are associated			with the access policy of the role being assumed, except for any permissions explicitly denied by the			policy you pass. These policies and any applicable resource-based policies are evaluated when			calls to AWS are made using the temporary security credentials. 		</p> 		 		<note>The policy must be 2048 bytes or shorter, and its packed size must be less than 450 			bytes.</note>
 */
@property (nonatomic, strong) NSString *policy;

/**
 * <p>The Amazon Resource Name (ARN) of the SAML provider in AWS IAM that describes the IdP.</p>
 */
@property (nonatomic, strong) NSString *principalArn;

/**
 * <p>The Amazon Resource Name (ARN) of the role that the caller is assuming.</p>
 */
@property (nonatomic, strong) NSString *roleArn;

/**
 * <p>The base-64 encoded SAML authentication response provided by the IdP.</p> 		<p>For more information, see			<a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/create-role-saml-IdP-tasks.html">Configuring a Relying Party and Adding Claims</a> 			in the <i>Using IAM</i> guide. 		</p>
 */
@property (nonatomic, strong) NSString *SAMLAssertion;

@end

/**
 * <p> Contains the result of a successful call to the <a>AssumeRoleWithSAML</a> action, including 			temporary AWS credentials that can be used to make AWS requests. </p>
 */
@interface AWSSTSAssumeRoleWithSAMLResponse : AZModel


/**
 * <p>The identifiers for the temporary security credentials that the operation returns. </p>
 */
@property (nonatomic, strong) AWSSTSAssumedRoleUser *assumedRoleUser;

/**
 * <p>AWS credentials for API authentication.</p>
 */
@property (nonatomic, strong) AWSSTSCredentials *credentials;

/**
 * <p> A percentage value that indicates the size of the policy in packed form. The service rejects 			any policy with a packed size greater than 100 percent, which means the policy exceeded the 			allowed space. </p>
 */
@property (nonatomic, strong) NSNumber *packedPolicySize;

@end

@interface AWSSTSAssumeRoleWithWebIdentityRequest : AWSRequest


/**
 * <p> The duration, in seconds, of the role session. The value can range from 900 seconds (15 			minutes) to 3600 seconds (1 hour). By default, the value is set to 3600 seconds. </p>
 */
@property (nonatomic, strong) NSNumber *durationSeconds;

/**
 * <p>An AWS IAM policy in JSON format.</p> 		 		<p>The temporary security credentials that are returned by the operation have the permissions that are			associated with the access policy of the role being assumed, except for any permissions explicitly denied			by the policy you pass. This gives you a way to further restrict the permissions for the resulting temporary security credentials.			These policies and any applicable resource-based policies are evaluated when calls to AWS are made			using the temporary security credentials.		</p>
 */
@property (nonatomic, strong) NSString *policy;

/**
 * <p> The fully-qualified host component of the domain name of the identity provider. Specify this 			value only for OAuth access tokens. Do not specify this value for OpenID Connect ID tokens, 			such as <code>accounts.google.com</code>. Do not include URL schemes and port numbers. 			Currently, <code>www.amazon.com</code> and <code>graph.facebook.com</code> are supported. </p>
 */
@property (nonatomic, strong) NSString *providerId;

/**
 * <p>The Amazon Resource Name (ARN) of the role that the caller is assuming.</p>
 */
@property (nonatomic, strong) NSString *roleArn;

/**
 * <p> An identifier for the assumed role session. Typically, you pass the name or identifier that 			is associated with the user who is using your application. That way, the temporary security 			credentials that your application will use are associated with that user. This session name is 			included as part of the ARN and assumed role ID in the <code>AssumedRoleUser</code> response 			element. </p>
 */
@property (nonatomic, strong) NSString *roleSessionName;

/**
 * <p> The OAuth 2.0 access token or OpenID Connect ID token that is provided by the identity 			provider. Your application must get this token by authenticating the user who is using your 			application with a web identity provider before the application makes an 				<code>AssumeRoleWithWebIdentity</code> call. </p>
 */
@property (nonatomic, strong) NSString *webIdentityToken;

@end

/**
 * <p> Contains the result of a successful call to the <a>AssumeRoleWithWebIdentity</a> action, 			including temporary AWS credentials that can be used to make AWS requests. </p>
 */
@interface AWSSTSAssumeRoleWithWebIdentityResponse : AZModel


/**
 * <p> The Amazon Resource Name (ARN) and the assumed role ID, which are identifiers that you can 			use to refer to the resulting temporary security credentials. For example, you can reference 			these credentials as a principal in a resource-based policy by using the ARN or assumed role 			ID. The ARN and ID include the <code>RoleSessionName</code> that you specified when you called 				<code>AssumeRole</code>. </p>
 */
@property (nonatomic, strong) AWSSTSAssumedRoleUser *assumedRoleUser;

/**
 * <p>The temporary security credentials, which include an access key ID, a secret access key, and 			a security token.</p>
 */
@property (nonatomic, strong) AWSSTSCredentials *credentials;

/**
 * <p> A percentage value that indicates the size of the policy in packed form. The service rejects 			any policy with a packed size greater than 100 percent, which means the policy exceeded the 			allowed space. </p>
 */
@property (nonatomic, strong) NSNumber *packedPolicySize;

/**
 * <p> The unique user identifier that is returned by the identity provider. This identifier is 			associated with the <code>WebIdentityToken</code> that was submitted with the 				<code>AssumeRoleWithWebIdentity</code> call. The identifier is typically unique to the user 			and the application that acquired the <code>WebIdentityToken</code> (pairwise identifier). If 			an OpenID Connect ID token was submitted in the <code>WebIdentityToken</code>, this value is 			returned by the identity provider as the token's <code>sub</code> (Subject) claim. </p>
 */
@property (nonatomic, strong) NSString *subjectFromWebIdentityToken;

@end

/**
 * <p>The identifiers for the temporary security credentials that the operation returns. </p>
 * Required parameters: [AssumedRoleId, Arn]
 */
@interface AWSSTSAssumedRoleUser : AZModel


/**
 * <p> The ARN of the temporary security credentials that are returned from the <a>AssumeRole</a> 			action. For more information about ARNs and how to use them in policies, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html" target="_blank"> Identifiers for IAM Entities </a> in <i>Using IAM</i>. </p>
 */
@property (nonatomic, strong) NSString *arn;

/**
 * <p>A unique identifier that contains the role ID and the role session name of the role that is 			being assumed. The role ID is generated by AWS when the role is created.</p>
 */
@property (nonatomic, strong) NSString *assumedRoleId;

@end

/**
 * <p>AWS credentials for API authentication.</p>
 * Required parameters: [AccessKeyId, SecretAccessKey, SessionToken, Expiration]
 */
@interface AWSSTSCredentials : AZModel


/**
 * <p>The access key ID that identifies the temporary security credentials.</p>
 */
@property (nonatomic, strong) NSString *accessKeyId;

/**
 * <p>The date on which the current credentials expire.</p>
 */
@property (nonatomic, strong) NSDate *expiration;

/**
 * <p>The secret access key that can be used to sign requests.</p>
 */
@property (nonatomic, strong) NSString *secretAccessKey;

/**
 * <p>The token that users must pass to the service API to use the temporary credentials.</p>
 */
@property (nonatomic, strong) NSString *sessionToken;

@end

@interface AWSSTSDecodeAuthorizationMessageRequest : AWSRequest


/**
 * <p>The encoded message that was returned with the response.</p>
 */
@property (nonatomic, strong) NSString *encodedMessage;

@end

/**
 * <p>A document that contains additional information about the authorization status of a request 			from an encoded message that is returned in response to an AWS request. </p>
 */
@interface AWSSTSDecodeAuthorizationMessageResponse : AZModel


/**
 * <p>An XML document that contains the decoded message. For more information, see 				<code>DecodeAuthorizationMessage</code>. </p>
 */
@property (nonatomic, strong) NSString *decodedMessage;

@end

/**
 * <p>Identifiers for the federated user that is associated with the credentials.</p>
 * Required parameters: [FederatedUserId, Arn]
 */
@interface AWSSTSFederatedUser : AZModel


/**
 * <p> The ARN that specifies the federated user that is associated with the credentials. For more 			information about ARNs and how to use them in policies, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html" target="_blank">Identifiers for IAM Entities</a> in <i>Using IAM</i>. </p>
 */
@property (nonatomic, strong) NSString *arn;

/**
 * <p>The string that identifies the federated user associated with the credentials, similar to the 			unique ID of an IAM user.</p>
 */
@property (nonatomic, strong) NSString *federatedUserId;

@end

@interface AWSSTSGetFederationTokenRequest : AWSRequest


/**
 * <p> The duration, in seconds, that the session should last. Acceptable durations for federation 			sessions range from 900 seconds (15 minutes) to 129600 seconds (36 hours), with 43200 seconds 			(12 hours) as the default. Sessions for AWS account owners are restricted to a maximum of 3600 			seconds (one hour). If the duration is longer than one hour, the session for AWS account 			owners defaults to one hour. </p>
 */
@property (nonatomic, strong) NSNumber *durationSeconds;

/**
 * <p> The name of the federated user. The name is used as an identifier for the temporary security 			credentials (such as <code>Bob</code>). For example, you can reference the federated user name 			in a resource-based policy, such as in an Amazon S3 bucket policy. </p>
 */
@property (nonatomic, strong) NSString *name;

/**
 * <p>An AWS IAM policy in JSON format.</p> 		 		<p>By default, federated users have no permissions; they do not inherit any from the IAM user. When you 			specify a policy, the federated user's permissions are based on the specified policy and the IAM user's policy.			If you don't specify a policy, federated users can only access AWS resources that explicitly allow those federated			users in a resource policy, such as in an Amazon S3 bucket policy. 		</p>
 */
@property (nonatomic, strong) NSString *policy;

@end

/**
 * <p> Contains the result of a successful call to the <a>GetFederationToken</a> action, including 			temporary AWS credentials that can be used to make AWS requests. </p>
 */
@interface AWSSTSGetFederationTokenResponse : AZModel


/**
 * <p>Credentials for the service API authentication. </p>
 */
@property (nonatomic, strong) AWSSTSCredentials *credentials;

/**
 * <p> Identifiers for the federated user associated with the credentials (such as 				<code>arn:aws:sts::123456789012:federated-user/Bob</code> or <code>123456789012:Bob</code>). 			You can use the federated user's ARN in your resource policies like in an Amazon S3 bucket 			policy. </p>
 */
@property (nonatomic, strong) AWSSTSFederatedUser *federatedUser;

/**
 * <p> A percentage value indicating the size of the policy in packed form. The service rejects 			policies for which the packed size is greater than 100 percent of the allowed value. </p>
 */
@property (nonatomic, strong) NSNumber *packedPolicySize;

@end

@interface AWSSTSGetSessionTokenRequest : AWSRequest


/**
 * <p> The duration, in seconds, that the credentials should remain valid. Acceptable durations for 			IAM user sessions range from 900 seconds (15 minutes) to 129600 seconds (36 hours), with 43200 			seconds (12 hours) as the default. Sessions for AWS account owners are restricted to a maximum 			of 3600 seconds (one hour). If the duration is longer than one hour, the session for AWS 			account owners defaults to one hour. </p>
 */
@property (nonatomic, strong) NSNumber *durationSeconds;

/**
 * <p> The identification number of the MFA device that is associated with the IAM user who is 			making the <code>GetSessionToken</code> call. Specify this value if the IAM user has a policy 			that requires MFA authentication. The value is either the serial number for a hardware device 			(such as <code>GAHT12345678</code>) or an Amazon Resource Name (ARN) for a virtual device 			(such as <code>arn:aws:iam::123456789012:mfa/user</code>). You can find the device for an IAM 			user by going to the AWS Management Console and viewing the user's security credentials. </p>
 */
@property (nonatomic, strong) NSString *serialNumber;

/**
 * <p>The value provided by the MFA device, if MFA is required. If any policy requires the IAM user 			to submit an MFA code, specify this value. If MFA authentication is required, and the user 			does not provide a code when requesting a set of temporary security credentials, the user will 			receive an "access denied" response when requesting resources that require MFA 			authentication.</p>
 */
@property (nonatomic, strong) NSString *tokenCode;

@end

/**
 * <p> Contains the result of a successful call to the <a>GetSessionToken</a> action, including 			temporary AWS credentials that can be used to make AWS requests. </p>
 */
@interface AWSSTSGetSessionTokenResponse : AZModel


/**
 * <p>The session credentials for API authentication. </p>
 */
@property (nonatomic, strong) AWSSTSCredentials *credentials;

@end
