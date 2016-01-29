//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSCore.h"
#import "AWSSTSModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>AWS Security Token Service</fullname><p>The AWS Security Token Service (STS) is a web service that enables you to request temporary, limited-privilege credentials for AWS Identity and Access Management (IAM) users or for users that you authenticate (federated users). This guide provides descriptions of the STS API. For more detailed information about using this service, go to <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/Welcome.html" target="_blank">Using Temporary Security Credentials</a>. </p><note> As an alternative to using the API, you can use one of the AWS SDKs, which consist of libraries and sample code for various programming languages and platforms (Java, Ruby, .NET, iOS, Android, etc.). The SDKs provide a convenient way to create programmatic access to STS. For example, the SDKs take care of cryptographically signing requests, managing errors, and retrying requests automatically. For information about the AWS SDKs, including how to download and install them, see the <a href="http://aws.amazon.com/tools/">Tools for Amazon Web Services page</a>. </note><p>For information about setting up signatures and authorization through the API, go to <a href="http://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html" target="_blank">Signing AWS API Requests</a> in the <i>AWS General Reference</i>. For general information about the Query API, go to <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html" target="_blank">Making Query Requests</a> in <i>Using IAM</i>. For information about using security tokens with other AWS products, go to <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/UsingTokens.html">Using Temporary Security Credentials to Access AWS</a> in <i>Using Temporary Security Credentials</i>. </p><p>If you're new to AWS and need additional technical information about a specific AWS product, you can find the product's technical documentation at <a href="http://aws.amazon.com/documentation/" target="_blank">http://aws.amazon.com/documentation/</a>. </p><p><b>Endpoints</b></p><p>For information about STS endpoints, see <a href="http://docs.aws.amazon.com/general/latest/gr/rande.html#sts_region" target="_blank">Regions and Endpoints</a> in the <i>AWS General Reference</i>.</p><p><b>Recording API requests</b></p><p>STS supports AWS CloudTrail, which is a service that records AWS calls for your AWS account and delivers log files to an Amazon S3 bucket. By using information collected by CloudTrail, you can determine what requests were successfully made to STS, who made the request, when it was made, and so on. To learn more about CloudTrail, including how to turn it on and find your log files, see the <a href="http://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html">AWS CloudTrail User Guide</a>.</p>
 */
@interface AWSSTS : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let STS = AWSSTS.defaultSTS()

 *Objective-C*

     AWSSTS *STS = [AWSSTS defaultSTS];

 @return The default service client.
 */
+ (instancetype)defaultSTS;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSSTS.registerSTSWithConfiguration(configuration, forKey: "USWest2STS")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSTS registerSTSWithConfiguration:configuration forKey:@"USWest2STS"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let STS = AWSSTS(forKey: "USWest2STS")

 *Objective-C*

     AWSSTS *STS = [AWSSTS STSForKey:@"USWest2STS"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSTSWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSTSWithConfiguration:forKey:` before invoking this method. If `+ registerSTSWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSSTS.registerSTSWithConfiguration(configuration, forKey: "USWest2STS")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSTS registerSTSWithConfiguration:configuration forKey:@"USWest2STS"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let STS = AWSSTS(forKey: "USWest2STS")

 *Objective-C*

     AWSSTS *STS = [AWSSTS STSForKey:@"USWest2STS"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)STSForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSTSForKey:(NSString *)key;

/**
 Instantiates the service client with the given service configuration.
 
 @warning This method has been deprecated. Use `+ registerSTSWithConfiguration:forKey:` and `+ STSForKey:` instead.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 
 @warning Unlike the singleton method, you are responsible for maintaining a strong reference to this object. If the service client is released before completing a service request, the request may fail with unspecified errors.
 
 @param configuration The service configuration object.
 
 @return An instance of the service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration __attribute__ ((deprecated("Use '+ registerSTSWithConfiguration:forKey:' and '+ STSForKey:' instead.")));

/**
 <p>Returns a set of temporary security credentials (consisting of an access key ID, a secret access key, and a security token) that you can use to access AWS resources that you might not normally have access to. Typically, you use <code>AssumeRole</code> for cross-account access or federation. </p><p><b>Important:</b> You cannot call <code>AssumeRole</code> by using AWS account credentials; access will be denied. You must use IAM user credentials or temporary security credentials to call <code>AssumeRole</code>. </p><p>For cross-account access, imagine that you own multiple accounts and need to access resources in each account. You could create long-term credentials in each account to access those resources. However, managing all those credentials and remembering which one can access which account can be time consuming. Instead, you can create one set of long-term credentials in one account and then use temporary security credentials to access all the other accounts by assuming roles in those accounts. For more information about roles, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Roles</a> in <i>Using IAM</i>. </p><p>For federation, you can, for example, grant single sign-on access to the AWS Management Console. If you already have an identity and authentication system in your corporate network, you don't have to recreate user identities in AWS in order to grant those user identities access to AWS. Instead, after a user has been authenticated, you call <code>AssumeRole</code> (and specify the role with the appropriate permissions) to get temporary security credentials for that user. With those temporary security credentials, you construct a sign-in URL that users can use to access the console. For more information, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/STSUseCases.html">Scenarios for Granting Temporary Access</a> in <i>Using Temporary Security Credentials</i>. </p><p>The temporary security credentials are valid for the duration that you specified when calling <code>AssumeRole</code>, which can be from 900 seconds (15 minutes) to 3600 seconds (1 hour). The default is 1 hour. </p><p>Optionally, you can pass an IAM access policy to this operation. If you choose not to pass a policy, the temporary security credentials that are returned by the operation have the permissions that are defined in the access policy of the role that is being assumed. If you pass a policy to this operation, the temporary security credentials that are returned by the operation have the permissions that are allowed by both the access policy of the role that is being assumed, <i><b>and</b></i> the policy that you pass. This gives you a way to further restrict the permissions for the resulting temporary security credentials. You cannot use the passed policy to grant permissions that are in excess of those allowed by the access policy of the role that is being assumed. For more information, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/permissions-assume-role.html">Permissions for AssumeRole</a> in <i>Using Temporary Security Credentials</i>.</p><p>To assume a role, your AWS account must be trusted by the role. The trust relationship is defined in the role's trust policy when the role is created. You must also have a policy that allows you to call <code>sts:AssumeRole</code>. </p><p><b>Using MFA with AssumeRole</b></p><p>You can optionally include multi-factor authentication (MFA) information when you call <code>AssumeRole</code>. This is useful for cross-account scenarios in which you want to make sure that the user who is assuming the role has been authenticated using an AWS MFA device. In that scenario, the trust policy of the role being assumed includes a condition that tests for MFA authentication; if the caller does not include valid MFA information, the request to assume the role is denied. The condition in a trust policy that tests for MFA authentication might look like the following example.</p><p><code>"Condition": {"Null": {"aws:MultiFactorAuthAge": false}}</code></p><p>For more information, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/MFAProtectedAPI.html">Configuring MFA-Protected API Access</a> in the <i>Using IAM</i> guide. </p><p>To use MFA with <code>AssumeRole</code>, you pass values for the <code>SerialNumber</code> and <code>TokenCode</code> parameters. The <code>SerialNumber</code> value identifies the user's hardware or virtual MFA device. The <code>TokenCode</code> is the time-based one-time password (TOTP) that the MFA devices produces. </p><member name="RoleArn" target="arnType"></member><member name="RoleSessionName" target="userNameType"></member><member name="Policy" target="sessionPolicyDocumentType"></member><member name="DurationSeconds" target="roleDurationSecondsType"></member><member name="ExternalId" target="externalIdType"></member>
 
 @param request A container for the necessary parameters to execute the AssumeRole service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSTSAssumeRoleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSTSErrorDomain` domain and the following error code: `AWSSTSErrorMalformedPolicyDocument`, `AWSSTSErrorPackedPolicyTooLarge`.
 
 @see AWSSTSAssumeRoleRequest
 @see AWSSTSAssumeRoleResponse
 */
- (AWSTask<AWSSTSAssumeRoleResponse *> *)assumeRole:(AWSSTSAssumeRoleRequest *)request;

/**
 <p>Returns a set of temporary security credentials (consisting of an access key ID, a secret access key, and a security token) that you can use to access AWS resources that you might not normally have access to. Typically, you use <code>AssumeRole</code> for cross-account access or federation. </p><p><b>Important:</b> You cannot call <code>AssumeRole</code> by using AWS account credentials; access will be denied. You must use IAM user credentials or temporary security credentials to call <code>AssumeRole</code>. </p><p>For cross-account access, imagine that you own multiple accounts and need to access resources in each account. You could create long-term credentials in each account to access those resources. However, managing all those credentials and remembering which one can access which account can be time consuming. Instead, you can create one set of long-term credentials in one account and then use temporary security credentials to access all the other accounts by assuming roles in those accounts. For more information about roles, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Roles</a> in <i>Using IAM</i>. </p><p>For federation, you can, for example, grant single sign-on access to the AWS Management Console. If you already have an identity and authentication system in your corporate network, you don't have to recreate user identities in AWS in order to grant those user identities access to AWS. Instead, after a user has been authenticated, you call <code>AssumeRole</code> (and specify the role with the appropriate permissions) to get temporary security credentials for that user. With those temporary security credentials, you construct a sign-in URL that users can use to access the console. For more information, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/STSUseCases.html">Scenarios for Granting Temporary Access</a> in <i>Using Temporary Security Credentials</i>. </p><p>The temporary security credentials are valid for the duration that you specified when calling <code>AssumeRole</code>, which can be from 900 seconds (15 minutes) to 3600 seconds (1 hour). The default is 1 hour. </p><p>Optionally, you can pass an IAM access policy to this operation. If you choose not to pass a policy, the temporary security credentials that are returned by the operation have the permissions that are defined in the access policy of the role that is being assumed. If you pass a policy to this operation, the temporary security credentials that are returned by the operation have the permissions that are allowed by both the access policy of the role that is being assumed, <i><b>and</b></i> the policy that you pass. This gives you a way to further restrict the permissions for the resulting temporary security credentials. You cannot use the passed policy to grant permissions that are in excess of those allowed by the access policy of the role that is being assumed. For more information, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/permissions-assume-role.html">Permissions for AssumeRole</a> in <i>Using Temporary Security Credentials</i>.</p><p>To assume a role, your AWS account must be trusted by the role. The trust relationship is defined in the role's trust policy when the role is created. You must also have a policy that allows you to call <code>sts:AssumeRole</code>. </p><p><b>Using MFA with AssumeRole</b></p><p>You can optionally include multi-factor authentication (MFA) information when you call <code>AssumeRole</code>. This is useful for cross-account scenarios in which you want to make sure that the user who is assuming the role has been authenticated using an AWS MFA device. In that scenario, the trust policy of the role being assumed includes a condition that tests for MFA authentication; if the caller does not include valid MFA information, the request to assume the role is denied. The condition in a trust policy that tests for MFA authentication might look like the following example.</p><p><code>"Condition": {"Null": {"aws:MultiFactorAuthAge": false}}</code></p><p>For more information, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/MFAProtectedAPI.html">Configuring MFA-Protected API Access</a> in the <i>Using IAM</i> guide. </p><p>To use MFA with <code>AssumeRole</code>, you pass values for the <code>SerialNumber</code> and <code>TokenCode</code> parameters. The <code>SerialNumber</code> value identifies the user's hardware or virtual MFA device. The <code>TokenCode</code> is the time-based one-time password (TOTP) that the MFA devices produces. </p><member name="RoleArn" target="arnType"></member><member name="RoleSessionName" target="userNameType"></member><member name="Policy" target="sessionPolicyDocumentType"></member><member name="DurationSeconds" target="roleDurationSecondsType"></member><member name="ExternalId" target="externalIdType"></member>
 
 @param request A container for the necessary parameters to execute the AssumeRole service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSTSErrorDomain` domain and the following error code: `AWSSTSErrorMalformedPolicyDocument`, `AWSSTSErrorPackedPolicyTooLarge`.
 
 @see AWSSTSAssumeRoleRequest
 @see AWSSTSAssumeRoleResponse
 */
- (void)assumeRole:(AWSSTSAssumeRoleRequest *)request completionHandler:(void (^ _Nullable)(AWSSTSAssumeRoleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a set of temporary security credentials for users who have been authenticated via a SAML authentication response. This operation provides a mechanism for tying an enterprise identity store or directory to role-based AWS access without user-specific credentials or configuration. </p><p>The temporary security credentials returned by this operation consist of an access key ID, a secret access key, and a security token. Applications can use these temporary security credentials to sign calls to AWS services. The credentials are valid for the duration that you specified when calling <code>AssumeRoleWithSAML</code>, which can be up to 3600 seconds (1 hour) or until the time specified in the SAML authentication response's <code>NotOnOrAfter</code> value, whichever is shorter.</p><note>The maximum duration for a session is 1 hour, and the minimum duration is 15 minutes, even if values outside this range are specified. </note><p>Optionally, you can pass an IAM access policy to this operation. If you choose not to pass a policy, the temporary security credentials that are returned by the operation have the permissions that are defined in the access policy of the role that is being assumed. If you pass a policy to this operation, the temporary security credentials that are returned by the operation have the permissions that are allowed by both the access policy of the role that is being assumed, <i><b>and</b></i> the policy that you pass. This gives you a way to further restrict the permissions for the resulting temporary security credentials. You cannot use the passed policy to grant permissions that are in excess of those allowed by the access policy of the role that is being assumed. For more information, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/permissions-assume-role.html">Permissions for AssumeRoleWithSAML</a> in <i>Using Temporary Security Credentials</i>.</p><p>Before your application can call <code>AssumeRoleWithSAML</code>, you must configure your SAML identity provider (IdP) to issue the claims required by AWS. Additionally, you must use AWS Identity and Access Management (IAM) to create a SAML provider entity in your AWS account that represents your identity provider, and create an IAM role that specifies this SAML provider in its trust policy. </p><p>Calling <code>AssumeRoleWithSAML</code> does not require the use of AWS security credentials. The identity of the caller is validated by using keys in the metadata document that is uploaded for the SAML provider entity for your identity provider. </p><p>For more information, see the following resources:</p><ul><li><a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/CreatingSAML.html">Creating Temporary Security Credentials for SAML Federation</a> in <i>Using Temporary Security Credentials</i>. </li><li><a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/idp-managing-identityproviders.html">SAML Providers</a> in <i>Using IAM</i>. </li><li><a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/create-role-saml-IdP-tasks.html">Configuring a Relying Party and Claims</a> in <i>Using IAM</i>. </li><li><a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/create-role-saml.html">Creating a Role for SAML-Based Federation</a> in <i>Using IAM</i>. </li></ul><member name="RoleArn" target="arnType"></member><member name="SAMLAssertion" target="SAMLAssertionType"></member><member name="Policy" target="sessionPolicyDocumentType"></member><member name="DurationSeconds" target="roleDurationSecondsType"></member>
 
 @param request A container for the necessary parameters to execute the AssumeRoleWithSAML service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSTSAssumeRoleWithSAMLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSTSErrorDomain` domain and the following error code: `AWSSTSErrorMalformedPolicyDocument`, `AWSSTSErrorPackedPolicyTooLarge`, `AWSSTSErrorIDPRejectedClaim`, `AWSSTSErrorInvalidIdentityToken`, `AWSSTSErrorExpiredToken`.
 
 @see AWSSTSAssumeRoleWithSAMLRequest
 @see AWSSTSAssumeRoleWithSAMLResponse
 */
- (AWSTask<AWSSTSAssumeRoleWithSAMLResponse *> *)assumeRoleWithSAML:(AWSSTSAssumeRoleWithSAMLRequest *)request;

/**
 <p>Returns a set of temporary security credentials for users who have been authenticated via a SAML authentication response. This operation provides a mechanism for tying an enterprise identity store or directory to role-based AWS access without user-specific credentials or configuration. </p><p>The temporary security credentials returned by this operation consist of an access key ID, a secret access key, and a security token. Applications can use these temporary security credentials to sign calls to AWS services. The credentials are valid for the duration that you specified when calling <code>AssumeRoleWithSAML</code>, which can be up to 3600 seconds (1 hour) or until the time specified in the SAML authentication response's <code>NotOnOrAfter</code> value, whichever is shorter.</p><note>The maximum duration for a session is 1 hour, and the minimum duration is 15 minutes, even if values outside this range are specified. </note><p>Optionally, you can pass an IAM access policy to this operation. If you choose not to pass a policy, the temporary security credentials that are returned by the operation have the permissions that are defined in the access policy of the role that is being assumed. If you pass a policy to this operation, the temporary security credentials that are returned by the operation have the permissions that are allowed by both the access policy of the role that is being assumed, <i><b>and</b></i> the policy that you pass. This gives you a way to further restrict the permissions for the resulting temporary security credentials. You cannot use the passed policy to grant permissions that are in excess of those allowed by the access policy of the role that is being assumed. For more information, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/permissions-assume-role.html">Permissions for AssumeRoleWithSAML</a> in <i>Using Temporary Security Credentials</i>.</p><p>Before your application can call <code>AssumeRoleWithSAML</code>, you must configure your SAML identity provider (IdP) to issue the claims required by AWS. Additionally, you must use AWS Identity and Access Management (IAM) to create a SAML provider entity in your AWS account that represents your identity provider, and create an IAM role that specifies this SAML provider in its trust policy. </p><p>Calling <code>AssumeRoleWithSAML</code> does not require the use of AWS security credentials. The identity of the caller is validated by using keys in the metadata document that is uploaded for the SAML provider entity for your identity provider. </p><p>For more information, see the following resources:</p><ul><li><a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/CreatingSAML.html">Creating Temporary Security Credentials for SAML Federation</a> in <i>Using Temporary Security Credentials</i>. </li><li><a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/idp-managing-identityproviders.html">SAML Providers</a> in <i>Using IAM</i>. </li><li><a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/create-role-saml-IdP-tasks.html">Configuring a Relying Party and Claims</a> in <i>Using IAM</i>. </li><li><a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/create-role-saml.html">Creating a Role for SAML-Based Federation</a> in <i>Using IAM</i>. </li></ul><member name="RoleArn" target="arnType"></member><member name="SAMLAssertion" target="SAMLAssertionType"></member><member name="Policy" target="sessionPolicyDocumentType"></member><member name="DurationSeconds" target="roleDurationSecondsType"></member>
 
 @param request A container for the necessary parameters to execute the AssumeRoleWithSAML service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSTSErrorDomain` domain and the following error code: `AWSSTSErrorMalformedPolicyDocument`, `AWSSTSErrorPackedPolicyTooLarge`, `AWSSTSErrorIDPRejectedClaim`, `AWSSTSErrorInvalidIdentityToken`, `AWSSTSErrorExpiredToken`.
 
 @see AWSSTSAssumeRoleWithSAMLRequest
 @see AWSSTSAssumeRoleWithSAMLResponse
 */
- (void)assumeRoleWithSAML:(AWSSTSAssumeRoleWithSAMLRequest *)request completionHandler:(void (^ _Nullable)(AWSSTSAssumeRoleWithSAMLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a set of temporary security credentials for users who have been authenticated in a mobile or web application with a web identity provider, such as Login with Amazon, Amazon Cognito, Facebook, or Google. </p><note><p>For mobile applications, we recommend that you use Amazon Cognito. You can Amazon Cognito with the <a href="http://aws.amazon.com/sdkforios/">AWS SDK for iOS</a> and the <a href="http://aws.amazon.com/sdkforandroid/">AWS SDK for Android</a> to uniquely identify a user and supply the user with a consistent identity throughout the lifetime of an application. </p><p>To learn more about Amazon Cognito, see <a href="http://docs.aws.amazon.com/mobile/sdkforandroid/developerguide/cognito-auth.html#d0e840">Amazon Cognito Overview</a> in the <i>AWS SDK for Android Developer Guide</i> guide and <a href="http://docs.aws.amazon.com/mobile/sdkforios/developerguide/cognito-auth.html#d0e664">Amazon Cognito Overview</a> in the <i>AWS SDK for iOS Developer Guide</i>.</p></note><p>Calling <code>AssumeRoleWithWebIdentity</code> does not require the use of AWS security credentials. Therefore, you can distribute an application (for example, on mobile devices) that requests temporary security credentials without including long-term AWS credentials in the application, and without deploying server-based proxy services that use long-term AWS credentials. Instead, the identity of the caller is validated by using a token from the web identity provider. </p><p>The temporary security credentials returned by this API consist of an access key ID, a secret access key, and a security token. Applications can use these temporary security credentials to sign calls to AWS service APIs. The credentials are valid for the duration that you specified when calling <code>AssumeRoleWithWebIdentity</code>, which can be from 900 seconds (15 minutes) to 3600 seconds (1 hour). By default, the temporary security credentials are valid for 1 hour. </p><p>Optionally, you can pass an IAM access policy to this operation. If you choose not to pass a policy, the temporary security credentials that are returned by the operation have the permissions that are defined in the access policy of the role that is being assumed. If you pass a policy to this operation, the temporary security credentials that are returned by the operation have the permissions that are allowed by both the access policy of the role that is being assumed, <i><b>and</b></i> the policy that you pass. This gives you a way to further restrict the permissions for the resulting temporary security credentials. You cannot use the passed policy to grant permissions that are in excess of those allowed by the access policy of the role that is being assumed. For more information, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/permissions-assume-role.html">Permissions for AssumeRoleWithWebIdentity</a> in <i>Using Temporary Security Credentials</i>.</p><p>Before your application can call <code>AssumeRoleWithWebIdentity</code>, you must have an identity token from a supported identity provider and create a role that the application can assume. The role that your application assumes must trust the identity provider that is associated with the identity token. In other words, the identity provider must be specified in the role's trust policy. </p><p>For more information about how to use web identity federation and the <code>AssumeRoleWithWebIdentity</code>, see the following resources: </p><ul><li><a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/STSUseCases.html#MobileApplication-KnownProvider" target="_blank"> Creating a Mobile Application with Third-Party Sign-In</a> and <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/CreatingWIF.html" target="_blank"> Creating Temporary Security Credentials for Mobile Apps Using Third-Party Identity Providers</a> in <i>Using Temporary Security Credentials</i>. </li><li><a href="https://web-identity-federation-playground.s3.amazonaws.com/index.html" target="_blank"> Web Identity Federation Playground</a>. This interactive website lets you walk through the process of authenticating via Login with Amazon, Facebook, or Google, getting temporary security credentials, and then using those credentials to make a request to AWS. </li><li><a href="http://aws.amazon.com/sdkforios/">AWS SDK for iOS</a> and <a href="http://aws.amazon.com/sdkforandroid/" target="_blank">AWS SDK for Android</a>. These toolkits contain sample apps that show how to invoke the identity providers, and then how to use the information from these providers to get and use temporary security credentials. </li><li><a href="http://aws.amazon.com/articles/4617974389850313" target="_blank">Web Identity Federation with Mobile Applications</a>. This article discusses web identity federation and shows an example of how to use web identity federation to get access to content in Amazon S3. </li></ul><member name="RoleArn" target="arnType"></member><member name="RoleSessionName" target="userNameType"></member><member name="WebIdentityToken" target="clientTokenType"></member><member name="ProviderId" target="urlType"></member><member name="Policy" target="sessionPolicyDocumentType"></member><member name="DurationSeconds" target="roleDurationSecondsType"></member>
 
 @param request A container for the necessary parameters to execute the AssumeRoleWithWebIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSTSAssumeRoleWithWebIdentityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSTSErrorDomain` domain and the following error code: `AWSSTSErrorMalformedPolicyDocument`, `AWSSTSErrorPackedPolicyTooLarge`, `AWSSTSErrorIDPRejectedClaim`, `AWSSTSErrorIDPCommunicationError`, `AWSSTSErrorInvalidIdentityToken`, `AWSSTSErrorExpiredToken`.
 
 @see AWSSTSAssumeRoleWithWebIdentityRequest
 @see AWSSTSAssumeRoleWithWebIdentityResponse
 */
- (AWSTask<AWSSTSAssumeRoleWithWebIdentityResponse *> *)assumeRoleWithWebIdentity:(AWSSTSAssumeRoleWithWebIdentityRequest *)request;

/**
 <p>Returns a set of temporary security credentials for users who have been authenticated in a mobile or web application with a web identity provider, such as Login with Amazon, Amazon Cognito, Facebook, or Google. </p><note><p>For mobile applications, we recommend that you use Amazon Cognito. You can Amazon Cognito with the <a href="http://aws.amazon.com/sdkforios/">AWS SDK for iOS</a> and the <a href="http://aws.amazon.com/sdkforandroid/">AWS SDK for Android</a> to uniquely identify a user and supply the user with a consistent identity throughout the lifetime of an application. </p><p>To learn more about Amazon Cognito, see <a href="http://docs.aws.amazon.com/mobile/sdkforandroid/developerguide/cognito-auth.html#d0e840">Amazon Cognito Overview</a> in the <i>AWS SDK for Android Developer Guide</i> guide and <a href="http://docs.aws.amazon.com/mobile/sdkforios/developerguide/cognito-auth.html#d0e664">Amazon Cognito Overview</a> in the <i>AWS SDK for iOS Developer Guide</i>.</p></note><p>Calling <code>AssumeRoleWithWebIdentity</code> does not require the use of AWS security credentials. Therefore, you can distribute an application (for example, on mobile devices) that requests temporary security credentials without including long-term AWS credentials in the application, and without deploying server-based proxy services that use long-term AWS credentials. Instead, the identity of the caller is validated by using a token from the web identity provider. </p><p>The temporary security credentials returned by this API consist of an access key ID, a secret access key, and a security token. Applications can use these temporary security credentials to sign calls to AWS service APIs. The credentials are valid for the duration that you specified when calling <code>AssumeRoleWithWebIdentity</code>, which can be from 900 seconds (15 minutes) to 3600 seconds (1 hour). By default, the temporary security credentials are valid for 1 hour. </p><p>Optionally, you can pass an IAM access policy to this operation. If you choose not to pass a policy, the temporary security credentials that are returned by the operation have the permissions that are defined in the access policy of the role that is being assumed. If you pass a policy to this operation, the temporary security credentials that are returned by the operation have the permissions that are allowed by both the access policy of the role that is being assumed, <i><b>and</b></i> the policy that you pass. This gives you a way to further restrict the permissions for the resulting temporary security credentials. You cannot use the passed policy to grant permissions that are in excess of those allowed by the access policy of the role that is being assumed. For more information, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/permissions-assume-role.html">Permissions for AssumeRoleWithWebIdentity</a> in <i>Using Temporary Security Credentials</i>.</p><p>Before your application can call <code>AssumeRoleWithWebIdentity</code>, you must have an identity token from a supported identity provider and create a role that the application can assume. The role that your application assumes must trust the identity provider that is associated with the identity token. In other words, the identity provider must be specified in the role's trust policy. </p><p>For more information about how to use web identity federation and the <code>AssumeRoleWithWebIdentity</code>, see the following resources: </p><ul><li><a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/STSUseCases.html#MobileApplication-KnownProvider" target="_blank"> Creating a Mobile Application with Third-Party Sign-In</a> and <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/CreatingWIF.html" target="_blank"> Creating Temporary Security Credentials for Mobile Apps Using Third-Party Identity Providers</a> in <i>Using Temporary Security Credentials</i>. </li><li><a href="https://web-identity-federation-playground.s3.amazonaws.com/index.html" target="_blank"> Web Identity Federation Playground</a>. This interactive website lets you walk through the process of authenticating via Login with Amazon, Facebook, or Google, getting temporary security credentials, and then using those credentials to make a request to AWS. </li><li><a href="http://aws.amazon.com/sdkforios/">AWS SDK for iOS</a> and <a href="http://aws.amazon.com/sdkforandroid/" target="_blank">AWS SDK for Android</a>. These toolkits contain sample apps that show how to invoke the identity providers, and then how to use the information from these providers to get and use temporary security credentials. </li><li><a href="http://aws.amazon.com/articles/4617974389850313" target="_blank">Web Identity Federation with Mobile Applications</a>. This article discusses web identity federation and shows an example of how to use web identity federation to get access to content in Amazon S3. </li></ul><member name="RoleArn" target="arnType"></member><member name="RoleSessionName" target="userNameType"></member><member name="WebIdentityToken" target="clientTokenType"></member><member name="ProviderId" target="urlType"></member><member name="Policy" target="sessionPolicyDocumentType"></member><member name="DurationSeconds" target="roleDurationSecondsType"></member>
 
 @param request A container for the necessary parameters to execute the AssumeRoleWithWebIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSTSErrorDomain` domain and the following error code: `AWSSTSErrorMalformedPolicyDocument`, `AWSSTSErrorPackedPolicyTooLarge`, `AWSSTSErrorIDPRejectedClaim`, `AWSSTSErrorIDPCommunicationError`, `AWSSTSErrorInvalidIdentityToken`, `AWSSTSErrorExpiredToken`.
 
 @see AWSSTSAssumeRoleWithWebIdentityRequest
 @see AWSSTSAssumeRoleWithWebIdentityResponse
 */
- (void)assumeRoleWithWebIdentity:(AWSSTSAssumeRoleWithWebIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSSTSAssumeRoleWithWebIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Decodes additional information about the authorization status of a request from an encoded message returned in response to an AWS request. </p><p>For example, if a user is not authorized to perform an action that he or she has requested, the request returns a <code>Client.UnauthorizedOperation</code> response (an HTTP 403 response). Some AWS actions additionally return an encoded message that can provide details about this authorization failure. </p><note> Only certain AWS actions return an encoded authorization message. The documentation for an individual action indicates whether that action returns an encoded message in addition to returning an HTTP code. </note><p>The message is encoded because the details of the authorization status can constitute privileged information that the user who requested the action should not see. To decode an authorization status message, a user must be granted permissions via an IAM policy to request the <code>DecodeAuthorizationMessage</code> (<code>sts:DecodeAuthorizationMessage</code>) action. </p><p>The decoded message includes the following type of information: </p><ul><li>Whether the request was denied due to an explicit deny or due to the absence of an explicit allow. For more information, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/AccessPolicyLanguage_EvaluationLogic.html#policy-eval-denyallow">Determining Whether a Request is Allowed or Denied</a> in <i>Using IAM</i>. </li><li>The principal who made the request.</li><li>The requested action.</li><li>The requested resource.</li><li>The values of condition keys in the context of the user's request.</li></ul>
 
 @param request A container for the necessary parameters to execute the DecodeAuthorizationMessage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSTSDecodeAuthorizationMessageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSTSErrorDomain` domain and the following error code: `AWSSTSErrorInvalidAuthorizationMessage`.
 
 @see AWSSTSDecodeAuthorizationMessageRequest
 @see AWSSTSDecodeAuthorizationMessageResponse
 */
- (AWSTask<AWSSTSDecodeAuthorizationMessageResponse *> *)decodeAuthorizationMessage:(AWSSTSDecodeAuthorizationMessageRequest *)request;

/**
 <p>Decodes additional information about the authorization status of a request from an encoded message returned in response to an AWS request. </p><p>For example, if a user is not authorized to perform an action that he or she has requested, the request returns a <code>Client.UnauthorizedOperation</code> response (an HTTP 403 response). Some AWS actions additionally return an encoded message that can provide details about this authorization failure. </p><note> Only certain AWS actions return an encoded authorization message. The documentation for an individual action indicates whether that action returns an encoded message in addition to returning an HTTP code. </note><p>The message is encoded because the details of the authorization status can constitute privileged information that the user who requested the action should not see. To decode an authorization status message, a user must be granted permissions via an IAM policy to request the <code>DecodeAuthorizationMessage</code> (<code>sts:DecodeAuthorizationMessage</code>) action. </p><p>The decoded message includes the following type of information: </p><ul><li>Whether the request was denied due to an explicit deny or due to the absence of an explicit allow. For more information, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/AccessPolicyLanguage_EvaluationLogic.html#policy-eval-denyallow">Determining Whether a Request is Allowed or Denied</a> in <i>Using IAM</i>. </li><li>The principal who made the request.</li><li>The requested action.</li><li>The requested resource.</li><li>The values of condition keys in the context of the user's request.</li></ul>
 
 @param request A container for the necessary parameters to execute the DecodeAuthorizationMessage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSTSErrorDomain` domain and the following error code: `AWSSTSErrorInvalidAuthorizationMessage`.
 
 @see AWSSTSDecodeAuthorizationMessageRequest
 @see AWSSTSDecodeAuthorizationMessageResponse
 */
- (void)decodeAuthorizationMessage:(AWSSTSDecodeAuthorizationMessageRequest *)request completionHandler:(void (^ _Nullable)(AWSSTSDecodeAuthorizationMessageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a set of temporary security credentials (consisting of an access key ID, a secret access key, and a security token) for a federated user. A typical use is in a proxy application that gets temporary security credentials on behalf of distributed applications inside a corporate network. Because you must call the <code>GetFederationToken</code> action using the long-term security credentials of an IAM user, this call is appropriate in contexts where those credentials can be safely stored, usually in a server-based application.</p><p><b>Note:</b> Do not use this call in mobile applications or client-based web applications that directly get temporary security credentials. For those types of applications, use <code>AssumeRoleWithWebIdentity</code>.</p><p>The <code>GetFederationToken</code> action must be called by using the long-term AWS security credentials of an IAM user. You can also call <code>GetFederationToken</code> using the security credentials of an AWS account (root), but this is not recommended. Instead, we recommend that you create an IAM user for the purpose of the proxy application and then attach a policy to the IAM user that limits federated users to only the actions and resources they need access to. For more information, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/IAMBestPractices.html">IAM Best Practices</a> in <i>Using IAM</i>. </p><p>The temporary security credentials that are obtained by using the long-term credentials of an IAM user are valid for the specified duration, between 900 seconds (15 minutes) and 129600 seconds (36 hours). Temporary credentials that are obtained by using AWS account (root) credentials have a maximum duration of 3600 seconds (1 hour)</p><p><b>Permissions</b></p><p>The permissions for the temporary security credentials returned by <code>GetFederationToken</code> are determined by a combination of the following: </p><ul><li>The policy or policies that are attached to the IAM user whose credentials are used to call <code>GetFederationToken</code>.</li><li>The policy that is passed as a parameter in the call.</li></ul><p>The passed policy is attached to the temporary security credentials that result from the <code>GetFederationToken</code> API call--that is, to the <i>federated user</i>. When the federated user makes an AWS request, AWS evaluates the policy attached to the federated user in combination with the policy or policies attached to the IAM user whose credentials were used to call <code>GetFederationToken</code>. AWS allows the federated user's request only when both the federated user <i><b>and</b></i> the IAM user are explicitly allowed to perform the requested action. The passed policy cannot grant more permissions than those that are defined in the IAM user policy.</p><p>A typical use case is that the permissions of the IAM user whose credentials are used to call <code>GetFederationToken</code> are designed to allow access to all the actions and resources that any federated user will need. Then, for individual users, you pass a policy to the operation that scopes down the permissions to a level that's appropriate to that individual user, using a policy that allows only a subset of permissions that are granted to the IAM user. </p><p>If you do not pass a policy, the resulting temporary security credentials have no effective permissions. The only exception is when the temporary security credentials are used to access a resource that has a resource-based policy that specifically allows the federated user to access the resource. </p><p>For more information about how permissions work, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/permissions-get-federation-token.html">Permissions for GetFederationToken</a> in <i>Using Temporary Security Credentials</i>. For information about using <code>GetFederationToken</code> to create temporary security credentials, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/CreatingFedTokens.html">Creating Temporary Credentials to Enable Access for Federated Users</a> in <i>Using Temporary Security Credentials</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetFederationToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSTSGetFederationTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSTSErrorDomain` domain and the following error code: `AWSSTSErrorMalformedPolicyDocument`, `AWSSTSErrorPackedPolicyTooLarge`.
 
 @see AWSSTSGetFederationTokenRequest
 @see AWSSTSGetFederationTokenResponse
 */
- (AWSTask<AWSSTSGetFederationTokenResponse *> *)getFederationToken:(AWSSTSGetFederationTokenRequest *)request;

/**
 <p>Returns a set of temporary security credentials (consisting of an access key ID, a secret access key, and a security token) for a federated user. A typical use is in a proxy application that gets temporary security credentials on behalf of distributed applications inside a corporate network. Because you must call the <code>GetFederationToken</code> action using the long-term security credentials of an IAM user, this call is appropriate in contexts where those credentials can be safely stored, usually in a server-based application.</p><p><b>Note:</b> Do not use this call in mobile applications or client-based web applications that directly get temporary security credentials. For those types of applications, use <code>AssumeRoleWithWebIdentity</code>.</p><p>The <code>GetFederationToken</code> action must be called by using the long-term AWS security credentials of an IAM user. You can also call <code>GetFederationToken</code> using the security credentials of an AWS account (root), but this is not recommended. Instead, we recommend that you create an IAM user for the purpose of the proxy application and then attach a policy to the IAM user that limits federated users to only the actions and resources they need access to. For more information, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/IAMBestPractices.html">IAM Best Practices</a> in <i>Using IAM</i>. </p><p>The temporary security credentials that are obtained by using the long-term credentials of an IAM user are valid for the specified duration, between 900 seconds (15 minutes) and 129600 seconds (36 hours). Temporary credentials that are obtained by using AWS account (root) credentials have a maximum duration of 3600 seconds (1 hour)</p><p><b>Permissions</b></p><p>The permissions for the temporary security credentials returned by <code>GetFederationToken</code> are determined by a combination of the following: </p><ul><li>The policy or policies that are attached to the IAM user whose credentials are used to call <code>GetFederationToken</code>.</li><li>The policy that is passed as a parameter in the call.</li></ul><p>The passed policy is attached to the temporary security credentials that result from the <code>GetFederationToken</code> API call--that is, to the <i>federated user</i>. When the federated user makes an AWS request, AWS evaluates the policy attached to the federated user in combination with the policy or policies attached to the IAM user whose credentials were used to call <code>GetFederationToken</code>. AWS allows the federated user's request only when both the federated user <i><b>and</b></i> the IAM user are explicitly allowed to perform the requested action. The passed policy cannot grant more permissions than those that are defined in the IAM user policy.</p><p>A typical use case is that the permissions of the IAM user whose credentials are used to call <code>GetFederationToken</code> are designed to allow access to all the actions and resources that any federated user will need. Then, for individual users, you pass a policy to the operation that scopes down the permissions to a level that's appropriate to that individual user, using a policy that allows only a subset of permissions that are granted to the IAM user. </p><p>If you do not pass a policy, the resulting temporary security credentials have no effective permissions. The only exception is when the temporary security credentials are used to access a resource that has a resource-based policy that specifically allows the federated user to access the resource. </p><p>For more information about how permissions work, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/permissions-get-federation-token.html">Permissions for GetFederationToken</a> in <i>Using Temporary Security Credentials</i>. For information about using <code>GetFederationToken</code> to create temporary security credentials, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/CreatingFedTokens.html">Creating Temporary Credentials to Enable Access for Federated Users</a> in <i>Using Temporary Security Credentials</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetFederationToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSTSErrorDomain` domain and the following error code: `AWSSTSErrorMalformedPolicyDocument`, `AWSSTSErrorPackedPolicyTooLarge`.
 
 @see AWSSTSGetFederationTokenRequest
 @see AWSSTSGetFederationTokenResponse
 */
- (void)getFederationToken:(AWSSTSGetFederationTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSSTSGetFederationTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a set of temporary credentials for an AWS account or IAM user. The credentials consist of an access key ID, a secret access key, and a security token. Typically, you use <code>GetSessionToken</code> if you want to use MFA to protect programmatic calls to specific AWS APIs like Amazon EC2 <code>StopInstances</code>. MFA-enabled IAM users would need to call <code>GetSessionToken</code> and submit an MFA code that is associated with their MFA device. Using the temporary security credentials that are returned from the call, IAM users can then make programmatic calls to APIs that require MFA authentication. </p><p>The <code>GetSessionToken</code> action must be called by using the long-term AWS security credentials of the AWS account or an IAM user. Credentials that are created by IAM users are valid for the duration that you specify, between 900 seconds (15 minutes) and 129600 seconds (36 hours); credentials that are created by using account credentials have a maximum duration of 3600 seconds (1 hour). </p><note><p>We recommend that you do not call <code>GetSessionToken</code> with root account credentials. Instead, follow our <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/IAMBestPractices.html#create-iam-users">best practices</a> by creating one or more IAM users, giving them the necessary permissions, and using IAM users for everyday interaction with AWS. </p></note><p>The permissions associated with the temporary security credentials returned by <code>GetSessionToken</code> are based on the permissions associated with account or IAM user whose credentials are used to call the action. If <code>GetSessionToken</code> is called using root account credentials, the temporary credentials have root account permissions. Similarly, if <code>GetSessionToken</code> is called using the credentials of an IAM user, the temporary credentials have the same permissions as the IAM user. </p><p>For more information about using <code>GetSessionToken</code> to create temporary credentials, go to <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/CreatingSessionTokens.html" target="_blank">Creating Temporary Credentials to Enable Access for IAM Users</a> in <i>Using Temporary Security Credentials</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetSessionToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSTSGetSessionTokenResponse`.
 
 @see AWSSTSGetSessionTokenRequest
 @see AWSSTSGetSessionTokenResponse
 */
- (AWSTask<AWSSTSGetSessionTokenResponse *> *)getSessionToken:(AWSSTSGetSessionTokenRequest *)request;

/**
 <p>Returns a set of temporary credentials for an AWS account or IAM user. The credentials consist of an access key ID, a secret access key, and a security token. Typically, you use <code>GetSessionToken</code> if you want to use MFA to protect programmatic calls to specific AWS APIs like Amazon EC2 <code>StopInstances</code>. MFA-enabled IAM users would need to call <code>GetSessionToken</code> and submit an MFA code that is associated with their MFA device. Using the temporary security credentials that are returned from the call, IAM users can then make programmatic calls to APIs that require MFA authentication. </p><p>The <code>GetSessionToken</code> action must be called by using the long-term AWS security credentials of the AWS account or an IAM user. Credentials that are created by IAM users are valid for the duration that you specify, between 900 seconds (15 minutes) and 129600 seconds (36 hours); credentials that are created by using account credentials have a maximum duration of 3600 seconds (1 hour). </p><note><p>We recommend that you do not call <code>GetSessionToken</code> with root account credentials. Instead, follow our <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/IAMBestPractices.html#create-iam-users">best practices</a> by creating one or more IAM users, giving them the necessary permissions, and using IAM users for everyday interaction with AWS. </p></note><p>The permissions associated with the temporary security credentials returned by <code>GetSessionToken</code> are based on the permissions associated with account or IAM user whose credentials are used to call the action. If <code>GetSessionToken</code> is called using root account credentials, the temporary credentials have root account permissions. Similarly, if <code>GetSessionToken</code> is called using the credentials of an IAM user, the temporary credentials have the same permissions as the IAM user. </p><p>For more information about using <code>GetSessionToken</code> to create temporary credentials, go to <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/CreatingSessionTokens.html" target="_blank">Creating Temporary Credentials to Enable Access for IAM Users</a> in <i>Using Temporary Security Credentials</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetSessionToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSTSGetSessionTokenRequest
 @see AWSSTSGetSessionTokenResponse
 */
- (void)getSessionToken:(AWSSTSGetSessionTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSSTSGetSessionTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
