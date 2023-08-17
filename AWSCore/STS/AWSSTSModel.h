//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSNetworking.h"
#import "AWSModel.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSSTSErrorDomain;

typedef NS_ENUM(NSInteger, AWSSTSErrorType) {
    AWSSTSErrorUnknown,
    AWSSTSErrorExpiredToken,
    AWSSTSErrorIDPCommunicationError,
    AWSSTSErrorIDPRejectedClaim,
    AWSSTSErrorInvalidAuthorizationMessage,
    AWSSTSErrorInvalidIdentityToken,
    AWSSTSErrorMalformedPolicyDocument,
    AWSSTSErrorPackedPolicyTooLarge,
    AWSSTSErrorRegionDisabled,
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
@class AWSSTSGetAccessKeyInfoRequest;
@class AWSSTSGetAccessKeyInfoResponse;
@class AWSSTSGetCallerIdentityRequest;
@class AWSSTSGetCallerIdentityResponse;
@class AWSSTSGetFederationTokenRequest;
@class AWSSTSGetFederationTokenResponse;
@class AWSSTSGetSessionTokenRequest;
@class AWSSTSGetSessionTokenResponse;
@class AWSSTSPolicyDescriptorType;
@class AWSSTSProvidedContext;
@class AWSSTSTag;

/**
 
 */
@interface AWSSTSAssumeRoleRequest : AWSRequest


/**
 <p>The duration, in seconds, of the role session. The value specified can range from 900 seconds (15 minutes) up to the maximum session duration set for the role. The maximum session duration setting can have a value from 1 hour to 12 hours. If you specify a value higher than this setting or the administrator setting (whichever is lower), the operation fails. For example, if you specify a session duration of 12 hours, but your administrator set the maximum session duration to 6 hours, your operation fails. </p><p>Role chaining limits your Amazon Web Services CLI or Amazon Web Services API role session to a maximum of one hour. When you use the <code>AssumeRole</code> API operation to assume a role, you can specify the duration of your role session with the <code>DurationSeconds</code> parameter. You can specify a parameter value of up to 43200 seconds (12 hours), depending on the maximum session duration setting for your role. However, if you assume a role using role chaining and provide a <code>DurationSeconds</code> parameter value greater than one hour, the operation fails. To learn how to view the maximum value for your role, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View the Maximum Session Duration Setting for a Role</a> in the <i>IAM User Guide</i>.</p><p>By default, the value is set to <code>3600</code> seconds. </p><note><p>The <code>DurationSeconds</code> parameter is separate from the duration of a console session that you might request using the returned credentials. The request to the federation endpoint for a console sign-in token takes a <code>SessionDuration</code> parameter that specifies the maximum length of the console session. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html">Creating a URL that Enables Federated Users to Access the Amazon Web Services Management Console</a> in the <i>IAM User Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>A unique identifier that might be required when you assume a role in another account. If the administrator of the account to which the role belongs provided you with an external ID, then provide that value in the <code>ExternalId</code> parameter. This value can be any string, such as a passphrase or account number. A cross-account role is usually set up to trust everyone in an account. Therefore, the administrator of the trusting account might send an external ID to the administrator of the trusted account. That way, only someone with the ID can assume the role, rather than everyone in the account. For more information about the external ID, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html">How to Use an External ID When Granting Access to Your Amazon Web Services Resources to a Third Party</a> in the <i>IAM User Guide</i>.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@:/-</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>An IAM policy in JSON format that you want to use as an inline session policy.</p><p>This parameter is optional. Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent Amazon Web Services API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p><p>The plaintext that you use for both inline and managed session policies can't exceed 2,048 characters. The JSON policy characters can be any ASCII character from the space character to the end of the valid character list (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed (\u000A), and carriage return (\u000D) characters.</p><note><p>An Amazon Web Services conversion compresses the passed inline session policy, managed policy ARNs, and session tags into a packed binary format that has a separate limit. Your request can fail for this limit even if your plaintext meets the other requirements. The <code>PackedPolicySize</code> response element indicates by percentage how close the policies and tags for your request are to the upper size limit.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as managed session policies. The policies must exist in the same account as the role.</p><p>This parameter is optional. You can provide up to 10 managed policy ARNs. However, the plaintext that you use for both inline and managed session policies can't exceed 2,048 characters. For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a> in the Amazon Web Services General Reference.</p><note><p>An Amazon Web Services conversion compresses the passed inline session policy, managed policy ARNs, and session tags into a packed binary format that has a separate limit. Your request can fail for this limit even if your plaintext meets the other requirements. The <code>PackedPolicySize</code> response element indicates by percentage how close the policies and tags for your request are to the upper size limit.</p></note><p>Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent Amazon Web Services API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSTSPolicyDescriptorType *> * _Nullable policyArns;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSArray<AWSSTSProvidedContext *> * _Nullable providedContexts;

/**
 <p>The Amazon Resource Name (ARN) of the role to assume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>An identifier for the assumed role session.</p><p>Use the role session name to uniquely identify a session when the same role is assumed by different principals or for different reasons. In cross-account scenarios, the role session name is visible to, and can be logged by the account that owns the role. The role session name is also used in the ARN of the assumed role principal. This means that subsequent cross-account API requests that use the temporary security credentials will expose the role session name to the external account in their CloudTrail logs.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleSessionName;

/**
 <p>The identification number of the MFA device that is associated with the user who is making the <code>AssumeRole</code> call. Specify this value if the trust policy of the role being assumed includes a condition that requires MFA authentication. The value is either the serial number for a hardware device (such as <code>GAHT12345678</code>) or an Amazon Resource Name (ARN) for a virtual device (such as <code>arn:aws:iam::123456789012:mfa/user</code>).</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 <p>The source identity specified by the principal that is calling the <code>AssumeRole</code> operation.</p><p>You can require users to specify a source identity when they assume a role. You do this by using the <code>sts:SourceIdentity</code> condition key in a role trust policy. You can use source identity information in CloudTrail logs to determine who took actions with a role. You can use the <code>aws:SourceIdentity</code> condition key to further control access to Amazon Web Services resources based on the value of source identity. For more information about using source identity, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html">Monitor and control actions taken with assumed roles</a> in the <i>IAM User Guide</i>.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-. You cannot use a value that begins with the text <code>aws:</code>. This prefix is reserved for Amazon Web Services internal use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentity;

/**
 <p>A list of session tags that you want to pass. Each session tag consists of a key name and an associated value. For more information about session tags, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html">Tagging Amazon Web Services STS Sessions</a> in the <i>IAM User Guide</i>.</p><p>This parameter is optional. You can pass up to 50 session tags. The plaintext session tag keys can’t exceed 128 characters, and the values can’t exceed 256 characters. For these and additional limits, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length">IAM and STS Character Limits</a> in the <i>IAM User Guide</i>.</p><note><p>An Amazon Web Services conversion compresses the passed inline session policy, managed policy ARNs, and session tags into a packed binary format that has a separate limit. Your request can fail for this limit even if your plaintext meets the other requirements. The <code>PackedPolicySize</code> response element indicates by percentage how close the policies and tags for your request are to the upper size limit.</p></note><p>You can pass a session tag with the same key as a tag that is already attached to the role. When you do, session tags override a role tag with the same key. </p><p>Tag key–value pairs are not case sensitive, but case is preserved. This means that you cannot have separate <code>Department</code> and <code>department</code> tag keys. Assume that the role has the <code>Department</code>=<code>Marketing</code> tag and you pass the <code>department</code>=<code>engineering</code> session tag. <code>Department</code> and <code>department</code> are not saved as separate tags, and the session tag passed in the request takes precedence over the role tag.</p><p>Additionally, if you used temporary credentials to perform this operation, the new session inherits any transitive session tags from the calling session. If you pass a session tag with the same key as an inherited tag, the operation fails. To view the inherited tags for a session, see the CloudTrail logs. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_ctlogs">Viewing Session Tags in CloudTrail</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSTSTag *> * _Nullable tags;

/**
 <p>The value provided by the MFA device, if the trust policy of the role being assumed requires MFA. (In other words, if the policy includes a condition that tests for MFA). If the role being assumed requires MFA and if the <code>TokenCode</code> value is missing or expired, the <code>AssumeRole</code> call returns an "access denied" error.</p><p>The format for this parameter, as described by its regex pattern, is a sequence of six numeric digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenCode;

/**
 <p>A list of keys for session tags that you want to set as transitive. If you set a tag key as transitive, the corresponding key and value passes to subsequent sessions in a role chain. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_role-chaining">Chaining Roles with Session Tags</a> in the <i>IAM User Guide</i>.</p><p>This parameter is optional. When you set session tags as transitive, the session policy and session tags packed binary limit is not affected.</p><p>If you choose not to specify a transitive tag key, then no tags are passed from this session to any subsequent sessions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable transitiveTagKeys;

@end

/**
 <p>Contains the response to a successful <a>AssumeRole</a> request, including temporary Amazon Web Services credentials that can be used to make Amazon Web Services requests. </p>
 */
@interface AWSSTSAssumeRoleResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) and the assumed role ID, which are identifiers that you can use to refer to the resulting temporary security credentials. For example, you can reference these credentials as a principal in a resource-based policy by using the ARN or assumed role ID. The ARN and ID include the <code>RoleSessionName</code> that you specified when you called <code>AssumeRole</code>. </p>
 */
@property (nonatomic, strong) AWSSTSAssumedRoleUser * _Nullable assumedRoleUser;

/**
 <p>The temporary security credentials, which include an access key ID, a secret access key, and a security (or session) token.</p><note><p>The size of the security token that STS API operations return is not fixed. We strongly recommend that you make no assumptions about the maximum size.</p></note>
 */
@property (nonatomic, strong) AWSSTSCredentials * _Nullable credentials;

/**
 <p>A percentage value that indicates the packed size of the session policies and session tags combined passed in the request. The request fails if the packed size is greater than 100 percent, which means the policies and tags exceeded the allowed space.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable packedPolicySize;

/**
 <p>The source identity specified by the principal that is calling the <code>AssumeRole</code> operation.</p><p>You can require users to specify a source identity when they assume a role. You do this by using the <code>sts:SourceIdentity</code> condition key in a role trust policy. You can use source identity information in CloudTrail logs to determine who took actions with a role. You can use the <code>aws:SourceIdentity</code> condition key to further control access to Amazon Web Services resources based on the value of source identity. For more information about using source identity, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html">Monitor and control actions taken with assumed roles</a> in the <i>IAM User Guide</i>.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentity;

@end

/**
 
 */
@interface AWSSTSAssumeRoleWithSAMLRequest : AWSRequest


/**
 <p>The duration, in seconds, of the role session. Your role session lasts for the duration that you specify for the <code>DurationSeconds</code> parameter, or until the time specified in the SAML authentication response's <code>SessionNotOnOrAfter</code> value, whichever is shorter. You can provide a <code>DurationSeconds</code> value from 900 seconds (15 minutes) up to the maximum session duration setting for the role. This setting can have a value from 1 hour to 12 hours. If you specify a value higher than this setting, the operation fails. For example, if you specify a session duration of 12 hours, but your administrator set the maximum session duration to 6 hours, your operation fails. To learn how to view the maximum value for your role, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View the Maximum Session Duration Setting for a Role</a> in the <i>IAM User Guide</i>.</p><p>By default, the value is set to <code>3600</code> seconds. </p><note><p>The <code>DurationSeconds</code> parameter is separate from the duration of a console session that you might request using the returned credentials. The request to the federation endpoint for a console sign-in token takes a <code>SessionDuration</code> parameter that specifies the maximum length of the console session. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html">Creating a URL that Enables Federated Users to Access the Amazon Web Services Management Console</a> in the <i>IAM User Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>An IAM policy in JSON format that you want to use as an inline session policy.</p><p>This parameter is optional. Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent Amazon Web Services API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>. </p><p>The plaintext that you use for both inline and managed session policies can't exceed 2,048 characters. The JSON policy characters can be any ASCII character from the space character to the end of the valid character list (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed (\u000A), and carriage return (\u000D) characters.</p><note><p>An Amazon Web Services conversion compresses the passed inline session policy, managed policy ARNs, and session tags into a packed binary format that has a separate limit. Your request can fail for this limit even if your plaintext meets the other requirements. The <code>PackedPolicySize</code> response element indicates by percentage how close the policies and tags for your request are to the upper size limit.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as managed session policies. The policies must exist in the same account as the role.</p><p>This parameter is optional. You can provide up to 10 managed policy ARNs. However, the plaintext that you use for both inline and managed session policies can't exceed 2,048 characters. For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a> in the Amazon Web Services General Reference.</p><note><p>An Amazon Web Services conversion compresses the passed inline session policy, managed policy ARNs, and session tags into a packed binary format that has a separate limit. Your request can fail for this limit even if your plaintext meets the other requirements. The <code>PackedPolicySize</code> response element indicates by percentage how close the policies and tags for your request are to the upper size limit.</p></note><p>Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent Amazon Web Services API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSTSPolicyDescriptorType *> * _Nullable policyArns;

/**
 <p>The Amazon Resource Name (ARN) of the SAML provider in IAM that describes the IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalArn;

/**
 <p>The Amazon Resource Name (ARN) of the role that the caller is assuming.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The base64 encoded SAML authentication response provided by the IdP.</p><p>For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/create-role-saml-IdP-tasks.html">Configuring a Relying Party and Adding Claims</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable SAMLAssertion;

@end

/**
 <p>Contains the response to a successful <a>AssumeRoleWithSAML</a> request, including temporary Amazon Web Services credentials that can be used to make Amazon Web Services requests. </p>
 */
@interface AWSSTSAssumeRoleWithSAMLResponse : AWSModel


/**
 <p>The identifiers for the temporary security credentials that the operation returns.</p>
 */
@property (nonatomic, strong) AWSSTSAssumedRoleUser * _Nullable assumedRoleUser;

/**
 <p> The value of the <code>Recipient</code> attribute of the <code>SubjectConfirmationData</code> element of the SAML assertion. </p>
 */
@property (nonatomic, strong) NSString * _Nullable audience;

/**
 <p>The temporary security credentials, which include an access key ID, a secret access key, and a security (or session) token.</p><note><p>The size of the security token that STS API operations return is not fixed. We strongly recommend that you make no assumptions about the maximum size.</p></note>
 */
@property (nonatomic, strong) AWSSTSCredentials * _Nullable credentials;

/**
 <p>The value of the <code>Issuer</code> element of the SAML assertion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable issuer;

/**
 <p>A hash value based on the concatenation of the following:</p><ul><li><p>The <code>Issuer</code> response value.</p></li><li><p>The Amazon Web Services account ID.</p></li><li><p>The friendly name (the last part of the ARN) of the SAML provider in IAM.</p></li></ul><p>The combination of <code>NameQualifier</code> and <code>Subject</code> can be used to uniquely identify a user.</p><p>The following pseudocode shows how the hash value is calculated:</p><p><code>BASE64 ( SHA1 ( "https://example.com/saml" + "123456789012" + "/MySAMLIdP" ) )</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nameQualifier;

/**
 <p>A percentage value that indicates the packed size of the session policies and session tags combined passed in the request. The request fails if the packed size is greater than 100 percent, which means the policies and tags exceeded the allowed space.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable packedPolicySize;

/**
 <p>The value in the <code>SourceIdentity</code> attribute in the SAML assertion. </p><p>You can require users to set a source identity value when they assume a role. You do this by using the <code>sts:SourceIdentity</code> condition key in a role trust policy. That way, actions that are taken with the role are associated with that user. After the source identity is set, the value cannot be changed. It is present in the request for all actions that are taken by the role and persists across <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts#iam-term-role-chaining">chained role</a> sessions. You can configure your SAML identity provider to use an attribute associated with your users, like user name or email, as the source identity when calling <code>AssumeRoleWithSAML</code>. You do this by adding an attribute to the SAML assertion. For more information about using source identity, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html">Monitor and control actions taken with assumed roles</a> in the <i>IAM User Guide</i>.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentity;

/**
 <p>The value of the <code>NameID</code> element in the <code>Subject</code> element of the SAML assertion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

/**
 <p> The format of the name ID, as defined by the <code>Format</code> attribute in the <code>NameID</code> element of the SAML assertion. Typical examples of the format are <code>transient</code> or <code>persistent</code>. </p><p> If the format includes the prefix <code>urn:oasis:names:tc:SAML:2.0:nameid-format</code>, that prefix is removed. For example, <code>urn:oasis:names:tc:SAML:2.0:nameid-format:transient</code> is returned as <code>transient</code>. If the format includes any other prefix, the format is returned with no modifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subjectType;

@end

/**
 
 */
@interface AWSSTSAssumeRoleWithWebIdentityRequest : AWSRequest


/**
 <p>The duration, in seconds, of the role session. The value can range from 900 seconds (15 minutes) up to the maximum session duration setting for the role. This setting can have a value from 1 hour to 12 hours. If you specify a value higher than this setting, the operation fails. For example, if you specify a session duration of 12 hours, but your administrator set the maximum session duration to 6 hours, your operation fails. To learn how to view the maximum value for your role, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View the Maximum Session Duration Setting for a Role</a> in the <i>IAM User Guide</i>.</p><p>By default, the value is set to <code>3600</code> seconds. </p><note><p>The <code>DurationSeconds</code> parameter is separate from the duration of a console session that you might request using the returned credentials. The request to the federation endpoint for a console sign-in token takes a <code>SessionDuration</code> parameter that specifies the maximum length of the console session. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html">Creating a URL that Enables Federated Users to Access the Amazon Web Services Management Console</a> in the <i>IAM User Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>An IAM policy in JSON format that you want to use as an inline session policy.</p><p>This parameter is optional. Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent Amazon Web Services API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p><p>The plaintext that you use for both inline and managed session policies can't exceed 2,048 characters. The JSON policy characters can be any ASCII character from the space character to the end of the valid character list (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed (\u000A), and carriage return (\u000D) characters.</p><note><p>An Amazon Web Services conversion compresses the passed inline session policy, managed policy ARNs, and session tags into a packed binary format that has a separate limit. Your request can fail for this limit even if your plaintext meets the other requirements. The <code>PackedPolicySize</code> response element indicates by percentage how close the policies and tags for your request are to the upper size limit.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as managed session policies. The policies must exist in the same account as the role.</p><p>This parameter is optional. You can provide up to 10 managed policy ARNs. However, the plaintext that you use for both inline and managed session policies can't exceed 2,048 characters. For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a> in the Amazon Web Services General Reference.</p><note><p>An Amazon Web Services conversion compresses the passed inline session policy, managed policy ARNs, and session tags into a packed binary format that has a separate limit. Your request can fail for this limit even if your plaintext meets the other requirements. The <code>PackedPolicySize</code> response element indicates by percentage how close the policies and tags for your request are to the upper size limit.</p></note><p>Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent Amazon Web Services API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSTSPolicyDescriptorType *> * _Nullable policyArns;

/**
 <p>The fully qualified host component of the domain name of the OAuth 2.0 identity provider. Do not specify this value for an OpenID Connect identity provider.</p><p>Currently <code>www.amazon.com</code> and <code>graph.facebook.com</code> are the only supported identity providers for OAuth 2.0 access tokens. Do not include URL schemes and port numbers.</p><p>Do not specify this value for OpenID Connect ID tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerId;

/**
 <p>The Amazon Resource Name (ARN) of the role that the caller is assuming.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>An identifier for the assumed role session. Typically, you pass the name or identifier that is associated with the user who is using your application. That way, the temporary security credentials that your application will use are associated with that user. This session name is included as part of the ARN and assumed role ID in the <code>AssumedRoleUser</code> response element.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleSessionName;

/**
 <p>The OAuth 2.0 access token or OpenID Connect ID token that is provided by the identity provider. Your application must get this token by authenticating the user who is using your application with a web identity provider before the application makes an <code>AssumeRoleWithWebIdentity</code> call. Only tokens with RSA algorithms (RS256) are supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webIdentityToken;

@end

/**
 <p>Contains the response to a successful <a>AssumeRoleWithWebIdentity</a> request, including temporary Amazon Web Services credentials that can be used to make Amazon Web Services requests. </p>
 */
@interface AWSSTSAssumeRoleWithWebIdentityResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) and the assumed role ID, which are identifiers that you can use to refer to the resulting temporary security credentials. For example, you can reference these credentials as a principal in a resource-based policy by using the ARN or assumed role ID. The ARN and ID include the <code>RoleSessionName</code> that you specified when you called <code>AssumeRole</code>. </p>
 */
@property (nonatomic, strong) AWSSTSAssumedRoleUser * _Nullable assumedRoleUser;

/**
 <p>The intended audience (also known as client ID) of the web identity token. This is traditionally the client identifier issued to the application that requested the web identity token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable audience;

/**
 <p>The temporary security credentials, which include an access key ID, a secret access key, and a security token.</p><note><p>The size of the security token that STS API operations return is not fixed. We strongly recommend that you make no assumptions about the maximum size.</p></note>
 */
@property (nonatomic, strong) AWSSTSCredentials * _Nullable credentials;

/**
 <p>A percentage value that indicates the packed size of the session policies and session tags combined passed in the request. The request fails if the packed size is greater than 100 percent, which means the policies and tags exceeded the allowed space.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable packedPolicySize;

/**
 <p> The issuing authority of the web identity token presented. For OpenID Connect ID tokens, this contains the value of the <code>iss</code> field. For OAuth 2.0 access tokens, this contains the value of the <code>ProviderId</code> parameter that was passed in the <code>AssumeRoleWithWebIdentity</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provider;

/**
 <p>The value of the source identity that is returned in the JSON web token (JWT) from the identity provider.</p><p>You can require users to set a source identity value when they assume a role. You do this by using the <code>sts:SourceIdentity</code> condition key in a role trust policy. That way, actions that are taken with the role are associated with that user. After the source identity is set, the value cannot be changed. It is present in the request for all actions that are taken by the role and persists across <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts#iam-term-role-chaining">chained role</a> sessions. You can configure your identity provider to use an attribute associated with your users, like user name or email, as the source identity when calling <code>AssumeRoleWithWebIdentity</code>. You do this by adding a claim to the JSON web token. To learn more about OIDC tokens and claims, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-using-tokens-with-identity-providers.html">Using Tokens with User Pools</a> in the <i>Amazon Cognito Developer Guide</i>. For more information about using source identity, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html">Monitor and control actions taken with assumed roles</a> in the <i>IAM User Guide</i>.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentity;

/**
 <p>The unique user identifier that is returned by the identity provider. This identifier is associated with the <code>WebIdentityToken</code> that was submitted with the <code>AssumeRoleWithWebIdentity</code> call. The identifier is typically unique to the user and the application that acquired the <code>WebIdentityToken</code> (pairwise identifier). For OpenID Connect ID tokens, this field contains the value returned by the identity provider as the token's <code>sub</code> (Subject) claim. </p>
 */
@property (nonatomic, strong) NSString * _Nullable subjectFromWebIdentityToken;

@end

/**
 <p>The identifiers for the temporary security credentials that the operation returns.</p>
 Required parameters: [AssumedRoleId, Arn]
 */
@interface AWSSTSAssumedRoleUser : AWSModel


/**
 <p>The ARN of the temporary security credentials that are returned from the <a>AssumeRole</a> action. For more information about ARNs and how to use them in policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>A unique identifier that contains the role ID and the role session name of the role that is being assumed. The role ID is generated by Amazon Web Services when the role is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assumedRoleId;

@end

/**
 <p>Amazon Web Services credentials for API authentication.</p>
 Required parameters: [AccessKeyId, SecretAccessKey, SessionToken, Expiration]
 */
@interface AWSSTSCredentials : AWSModel


/**
 <p>The access key ID that identifies the temporary security credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessKeyId;

/**
 <p>The date on which the current credentials expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expiration;

/**
 <p>The secret access key that can be used to sign requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretAccessKey;

/**
 <p>The token that users must pass to the service API to use the temporary credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionToken;

@end

/**
 
 */
@interface AWSSTSDecodeAuthorizationMessageRequest : AWSRequest


/**
 <p>The encoded message that was returned with the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable encodedMessage;

@end

/**
 <p>A document that contains additional information about the authorization status of a request from an encoded message that is returned in response to an Amazon Web Services request.</p>
 */
@interface AWSSTSDecodeAuthorizationMessageResponse : AWSModel


/**
 <p>The API returns a response with the decoded message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable decodedMessage;

@end

/**
 <p>Identifiers for the federated user that is associated with the credentials.</p>
 Required parameters: [FederatedUserId, Arn]
 */
@interface AWSSTSFederatedUser : AWSModel


/**
 <p>The ARN that specifies the federated user that is associated with the credentials. For more information about ARNs and how to use them in policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The string that identifies the federated user associated with the credentials, similar to the unique ID of an IAM user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable federatedUserId;

@end

/**
 
 */
@interface AWSSTSGetAccessKeyInfoRequest : AWSRequest


/**
 <p>The identifier of an access key.</p><p>This parameter allows (through its regex pattern) a string of characters that can consist of any upper- or lowercase letter or digit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessKeyId;

@end

/**
 
 */
@interface AWSSTSGetAccessKeyInfoResponse : AWSModel


/**
 <p>The number used to identify the Amazon Web Services account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable account;

@end

/**
 
 */
@interface AWSSTSGetCallerIdentityRequest : AWSRequest


@end

/**
 <p>Contains the response to a successful <a>GetCallerIdentity</a> request, including information about the entity making the request.</p>
 */
@interface AWSSTSGetCallerIdentityResponse : AWSModel


/**
 <p>The Amazon Web Services account ID number of the account that owns or contains the calling entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable account;

/**
 <p>The Amazon Web Services ARN associated with the calling entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The unique identifier of the calling entity. The exact value depends on the type of entity that is making the call. The values returned are those listed in the <b>aws:userid</b> column in the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_variables.html#principaltable">Principal table</a> found on the <b>Policy Variables</b> reference page in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSSTSGetFederationTokenRequest : AWSRequest


/**
 <p>The duration, in seconds, that the session should last. Acceptable durations for federation sessions range from 900 seconds (15 minutes) to 129,600 seconds (36 hours), with 43,200 seconds (12 hours) as the default. Sessions obtained using root user credentials are restricted to a maximum of 3,600 seconds (one hour). If the specified duration is longer than one hour, the session obtained by using root user credentials defaults to one hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>The name of the federated user. The name is used as an identifier for the temporary security credentials (such as <code>Bob</code>). For example, you can reference the federated user name in a resource-based policy, such as in an Amazon S3 bucket policy.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An IAM policy in JSON format that you want to use as an inline session policy.</p><p>You must pass an inline or managed <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">session policy</a> to this operation. You can pass a single JSON policy document to use as an inline session policy. You can also specify up to 10 managed policy Amazon Resource Names (ARNs) to use as managed session policies.</p><p>This parameter is optional. However, if you do not pass any session policies, then the resulting federated user session has no permissions.</p><p>When you pass session policies, the session permissions are the intersection of the IAM user policies and the session policies that you pass. This gives you a way to further restrict the permissions for a federated user. You cannot use session policies to grant more permissions than those that are defined in the permissions policy of the IAM user. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p><p>The resulting credentials can be used to access a resource that has a resource-based policy. If that policy specifically references the federated user session in the <code>Principal</code> element of the policy, the session has the permissions allowed by the policy. These permissions are granted in addition to the permissions that are granted by the session policies.</p><p>The plaintext that you use for both inline and managed session policies can't exceed 2,048 characters. The JSON policy characters can be any ASCII character from the space character to the end of the valid character list (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed (\u000A), and carriage return (\u000D) characters.</p><note><p>An Amazon Web Services conversion compresses the passed inline session policy, managed policy ARNs, and session tags into a packed binary format that has a separate limit. Your request can fail for this limit even if your plaintext meets the other requirements. The <code>PackedPolicySize</code> response element indicates by percentage how close the policies and tags for your request are to the upper size limit.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as a managed session policy. The policies must exist in the same account as the IAM user that is requesting federated access.</p><p>You must pass an inline or managed <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">session policy</a> to this operation. You can pass a single JSON policy document to use as an inline session policy. You can also specify up to 10 managed policy Amazon Resource Names (ARNs) to use as managed session policies. The plaintext that you use for both inline and managed session policies can't exceed 2,048 characters. You can provide up to 10 managed policy ARNs. For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a> in the Amazon Web Services General Reference.</p><p>This parameter is optional. However, if you do not pass any session policies, then the resulting federated user session has no permissions.</p><p>When you pass session policies, the session permissions are the intersection of the IAM user policies and the session policies that you pass. This gives you a way to further restrict the permissions for a federated user. You cannot use session policies to grant more permissions than those that are defined in the permissions policy of the IAM user. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p><p>The resulting credentials can be used to access a resource that has a resource-based policy. If that policy specifically references the federated user session in the <code>Principal</code> element of the policy, the session has the permissions allowed by the policy. These permissions are granted in addition to the permissions that are granted by the session policies.</p><note><p>An Amazon Web Services conversion compresses the passed inline session policy, managed policy ARNs, and session tags into a packed binary format that has a separate limit. Your request can fail for this limit even if your plaintext meets the other requirements. The <code>PackedPolicySize</code> response element indicates by percentage how close the policies and tags for your request are to the upper size limit.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSSTSPolicyDescriptorType *> * _Nullable policyArns;

/**
 <p>A list of session tags. Each session tag consists of a key name and an associated value. For more information about session tags, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html">Passing Session Tags in STS</a> in the <i>IAM User Guide</i>.</p><p>This parameter is optional. You can pass up to 50 session tags. The plaintext session tag keys can’t exceed 128 characters and the values can’t exceed 256 characters. For these and additional limits, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length">IAM and STS Character Limits</a> in the <i>IAM User Guide</i>.</p><note><p>An Amazon Web Services conversion compresses the passed inline session policy, managed policy ARNs, and session tags into a packed binary format that has a separate limit. Your request can fail for this limit even if your plaintext meets the other requirements. The <code>PackedPolicySize</code> response element indicates by percentage how close the policies and tags for your request are to the upper size limit.</p></note><p>You can pass a session tag with the same key as a tag that is already attached to the user you are federating. When you do, session tags override a user tag with the same key. </p><p>Tag key–value pairs are not case sensitive, but case is preserved. This means that you cannot have separate <code>Department</code> and <code>department</code> tag keys. Assume that the role has the <code>Department</code>=<code>Marketing</code> tag and you pass the <code>department</code>=<code>engineering</code> session tag. <code>Department</code> and <code>department</code> are not saved as separate tags, and the session tag passed in the request takes precedence over the role tag.</p>
 */
@property (nonatomic, strong) NSArray<AWSSTSTag *> * _Nullable tags;

@end

/**
 <p>Contains the response to a successful <a>GetFederationToken</a> request, including temporary Amazon Web Services credentials that can be used to make Amazon Web Services requests. </p>
 */
@interface AWSSTSGetFederationTokenResponse : AWSModel


/**
 <p>The temporary security credentials, which include an access key ID, a secret access key, and a security (or session) token.</p><note><p>The size of the security token that STS API operations return is not fixed. We strongly recommend that you make no assumptions about the maximum size.</p></note>
 */
@property (nonatomic, strong) AWSSTSCredentials * _Nullable credentials;

/**
 <p>Identifiers for the federated user associated with the credentials (such as <code>arn:aws:sts::123456789012:federated-user/Bob</code> or <code>123456789012:Bob</code>). You can use the federated user's ARN in your resource-based policies, such as an Amazon S3 bucket policy. </p>
 */
@property (nonatomic, strong) AWSSTSFederatedUser * _Nullable federatedUser;

/**
 <p>A percentage value that indicates the packed size of the session policies and session tags combined passed in the request. The request fails if the packed size is greater than 100 percent, which means the policies and tags exceeded the allowed space.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable packedPolicySize;

@end

/**
 
 */
@interface AWSSTSGetSessionTokenRequest : AWSRequest


/**
 <p>The duration, in seconds, that the credentials should remain valid. Acceptable durations for IAM user sessions range from 900 seconds (15 minutes) to 129,600 seconds (36 hours), with 43,200 seconds (12 hours) as the default. Sessions for Amazon Web Services account owners are restricted to a maximum of 3,600 seconds (one hour). If the duration is longer than one hour, the session for Amazon Web Services account owners defaults to one hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>The identification number of the MFA device that is associated with the IAM user who is making the <code>GetSessionToken</code> call. Specify this value if the IAM user has a policy that requires MFA authentication. The value is either the serial number for a hardware device (such as <code>GAHT12345678</code>) or an Amazon Resource Name (ARN) for a virtual device (such as <code>arn:aws:iam::123456789012:mfa/user</code>). You can find the device for an IAM user by going to the Amazon Web Services Management Console and viewing the user's security credentials. </p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@:/-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 <p>The value provided by the MFA device, if MFA is required. If any policy requires the IAM user to submit an MFA code, specify this value. If MFA authentication is required, the user must provide a code when requesting a set of temporary security credentials. A user who fails to provide the code receives an "access denied" response when requesting resources that require MFA authentication.</p><p>The format for this parameter, as described by its regex pattern, is a sequence of six numeric digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenCode;

@end

/**
 <p>Contains the response to a successful <a>GetSessionToken</a> request, including temporary Amazon Web Services credentials that can be used to make Amazon Web Services requests. </p>
 */
@interface AWSSTSGetSessionTokenResponse : AWSModel


/**
 <p>The temporary security credentials, which include an access key ID, a secret access key, and a security (or session) token.</p><note><p>The size of the security token that STS API operations return is not fixed. We strongly recommend that you make no assumptions about the maximum size.</p></note>
 */
@property (nonatomic, strong) AWSSTSCredentials * _Nullable credentials;

@end

/**
 <p>A reference to the IAM managed policy that is passed as a session policy for a role session or a federated user session.</p>
 */
@interface AWSSTSPolicyDescriptorType : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the IAM managed policy to use as a session policy for the role. For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a> in the <i>Amazon Web Services General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 <p>Reserved for future use.</p>
 */
@interface AWSSTSProvidedContext : AWSModel


/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contextAssertion;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerArn;

@end

/**
 <p>You can pass custom key-value pair attributes when you assume a role or federate a user. These are called session tags. You can then use the session tags to control access to resources. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html">Tagging Amazon Web Services STS Sessions</a> in the <i>IAM User Guide</i>.</p>
 Required parameters: [Key, Value]
 */
@interface AWSSTSTag : AWSModel


/**
 <p>The key for a session tag.</p><p>You can pass up to 50 session tags. The plain text session tag keys can’t exceed 128 characters. For these and additional limits, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length">IAM and STS Character Limits</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value for a session tag.</p><p>You can pass up to 50 session tags. The plain text session tag values can’t exceed 256 characters. For these and additional limits, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length">IAM and STS Character Limits</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

NS_ASSUME_NONNULL_END
