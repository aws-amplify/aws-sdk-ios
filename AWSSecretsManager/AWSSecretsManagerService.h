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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSSecretsManagerModel.h"
#import "AWSSecretsManagerResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSecretsManager
FOUNDATION_EXPORT NSString *const AWSSecretsManagerSDKVersion;

/**
 <fullname>AWS Secrets Manager API Reference</fullname><p>AWS Secrets Manager provides a service to enable you to store, manage, and retrieve, secrets.</p><p>This guide provides descriptions of the Secrets Manager API. For more information about using this service, see the <a href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/introduction.html">AWS Secrets Manager User Guide</a>.</p><p><b>API Version</b></p><p>This version of the Secrets Manager API Reference documents the Secrets Manager API version 2017-10-17.</p><note><p>As an alternative to using the API, you can use one of the AWS SDKs, which consist of libraries and sample code for various programming languages and platforms such as Java, Ruby, .NET, iOS, and Android. The SDKs provide a convenient way to create programmatic access to AWS Secrets Manager. For example, the SDKs provide cryptographically signing requests, managing errors, and retrying requests automatically. For more information about the AWS SDKs, including downloading and installing them, see <a href="http://aws.amazon.com/tools/">Tools for Amazon Web Services</a>.</p></note><p>We recommend you use the AWS SDKs to make programmatic API calls to Secrets Manager. However, you also can use the Secrets Manager HTTP Query API to make direct calls to the Secrets Manager web service. To learn more about the Secrets Manager HTTP Query API, see <a href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/query-requests.html">Making Query Requests</a> in the <i>AWS Secrets Manager User Guide</i>. </p><p>Secrets Manager API supports GET and POST requests for all actions, and doesn't require you to use GET for some actions and POST for others. However, GET requests are subject to the limitation size of a URL. Therefore, for operations that require larger sizes, use a POST request.</p><p><b>Support and Feedback for AWS Secrets Manager</b></p><p>We welcome your feedback. Send your comments to <a href="mailto:awssecretsmanager-feedback@amazon.com">awssecretsmanager-feedback@amazon.com</a>, or post your feedback and questions in the <a href="http://forums.aws.amazon.com/forum.jspa?forumID=296">AWS Secrets Manager Discussion Forum</a>. For more information about the AWS Discussion Forums, see <a href="http://forums.aws.amazon.com/help.jspa">Forums Help</a>.</p><p><b>How examples are presented</b></p><p>The JSON that AWS Secrets Manager expects as your request parameters and the service returns as a response to HTTP query requests contain single, long strings without line breaks or white space formatting. The JSON shown in the examples displays the code formatted with both line breaks and white space to improve readability. When example input parameters can also cause long strings extending beyond the screen, you can insert line breaks to enhance readability. You should always submit the input as a single JSON text string.</p><p><b>Logging API Requests</b></p><p>AWS Secrets Manager supports AWS CloudTrail, a service that records AWS API calls for your AWS account and delivers log files to an Amazon S3 bucket. By using information that's collected by AWS CloudTrail, you can determine the requests successfully made to Secrets Manager, who made the request, when it was made, and so on. For more about AWS Secrets Manager and support for AWS CloudTrail, see <a href="http://docs.aws.amazon.com/secretsmanager/latest/userguide/monitoring.html#monitoring_cloudtrail">Logging AWS Secrets Manager Events with AWS CloudTrail</a> in the <i>AWS Secrets Manager User Guide</i>. To learn more about CloudTrail, including enabling it and find your log files, see the <a href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html">AWS CloudTrail User Guide</a>.</p>
 */
@interface AWSSecretsManager : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
 
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

     let SecretsManager = AWSSecretsManager.default()

 *Objective-C*

     AWSSecretsManager *SecretsManager = [AWSSecretsManager defaultSecretsManager];

 @return The default service client.
 */
+ (instancetype)defaultSecretsManager;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSecretsManager.register(with: configuration!, forKey: "USWest2SecretsManager")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:@"USWest2SecretsManager"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SecretsManager = AWSSecretsManager(forKey: "USWest2SecretsManager")

 *Objective-C*

     AWSSecretsManager *SecretsManager = [AWSSecretsManager SecretsManagerForKey:@"USWest2SecretsManager"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSecretsManagerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSecretsManagerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSecretsManager.register(with: configuration!, forKey: "USWest2SecretsManager")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:@"USWest2SecretsManager"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SecretsManager = AWSSecretsManager(forKey: "USWest2SecretsManager")

 *Objective-C*

     AWSSecretsManager *SecretsManager = [AWSSecretsManager SecretsManagerForKey:@"USWest2SecretsManager"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SecretsManagerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSecretsManagerForKey:(NSString *)key;

/**
 <p>Disables automatic scheduled rotation and cancels the rotation of a secret if currently in progress.</p><p>To re-enable scheduled rotation, call <a>RotateSecret</a> with <code>AutomaticallyRotateAfterDays</code> set to a value greater than 0. This immediately rotates your secret and then enables the automatic schedule.</p><note><p>If you cancel a rotation while in progress, it can leave the <code>VersionStage</code> labels in an unexpected state. Depending on the step of the rotation in progress, you might need to remove the staging label <code>AWSPENDING</code> from the partially created version, specified by the <code>VersionId</code> response value. You should also evaluate the partially rotated new version to see if it should be deleted, which you can do by removing all staging labels from the new version <code>VersionStage</code> field.</p></note><p>To successfully start a rotation, the staging label <code>AWSPENDING</code> must be in one of the following states:</p><ul><li><p>Not attached to any version at all</p></li><li><p>Attached to the same version as the staging label <code>AWSCURRENT</code></p></li></ul><p>If the staging label <code>AWSPENDING</code> attached to a different version than the version with <code>AWSCURRENT</code> then the attempt to rotate fails.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:CancelRotateSecret</p></li></ul><p><b>Related operations</b></p><ul><li><p>To configure rotation for a secret or to manually trigger a rotation, use <a>RotateSecret</a>.</p></li><li><p>To get the rotation configuration details for a secret, use <a>DescribeSecret</a>.</p></li><li><p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p></li><li><p>To list all of the versions currently associated with a secret, use <a>ListSecretVersionIds</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CancelRotateSecret service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerCancelRotateSecretResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`.
 
 @see AWSSecretsManagerCancelRotateSecretRequest
 @see AWSSecretsManagerCancelRotateSecretResponse
 */
- (AWSTask<AWSSecretsManagerCancelRotateSecretResponse *> *)cancelRotateSecret:(AWSSecretsManagerCancelRotateSecretRequest *)request;

/**
 <p>Disables automatic scheduled rotation and cancels the rotation of a secret if currently in progress.</p><p>To re-enable scheduled rotation, call <a>RotateSecret</a> with <code>AutomaticallyRotateAfterDays</code> set to a value greater than 0. This immediately rotates your secret and then enables the automatic schedule.</p><note><p>If you cancel a rotation while in progress, it can leave the <code>VersionStage</code> labels in an unexpected state. Depending on the step of the rotation in progress, you might need to remove the staging label <code>AWSPENDING</code> from the partially created version, specified by the <code>VersionId</code> response value. You should also evaluate the partially rotated new version to see if it should be deleted, which you can do by removing all staging labels from the new version <code>VersionStage</code> field.</p></note><p>To successfully start a rotation, the staging label <code>AWSPENDING</code> must be in one of the following states:</p><ul><li><p>Not attached to any version at all</p></li><li><p>Attached to the same version as the staging label <code>AWSCURRENT</code></p></li></ul><p>If the staging label <code>AWSPENDING</code> attached to a different version than the version with <code>AWSCURRENT</code> then the attempt to rotate fails.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:CancelRotateSecret</p></li></ul><p><b>Related operations</b></p><ul><li><p>To configure rotation for a secret or to manually trigger a rotation, use <a>RotateSecret</a>.</p></li><li><p>To get the rotation configuration details for a secret, use <a>DescribeSecret</a>.</p></li><li><p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p></li><li><p>To list all of the versions currently associated with a secret, use <a>ListSecretVersionIds</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CancelRotateSecret service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`.
 
 @see AWSSecretsManagerCancelRotateSecretRequest
 @see AWSSecretsManagerCancelRotateSecretResponse
 */
- (void)cancelRotateSecret:(AWSSecretsManagerCancelRotateSecretRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerCancelRotateSecretResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new secret. A secret in Secrets Manager consists of both the protected secret data and the important information needed to manage the secret.</p><p>Secrets Manager stores the encrypted secret data in one of a collection of "versions" associated with the secret. Each version contains a copy of the encrypted secret data. Each version is associated with one or more "staging labels" that identify where the version is in the rotation cycle. The <code>SecretVersionsToStages</code> field of the secret contains the mapping of staging labels to the active versions of the secret. Versions without a staging label are considered deprecated and not included in the list.</p><p>You provide the secret data to be encrypted by putting text in either the <code>SecretString</code> parameter or binary data in the <code>SecretBinary</code> parameter, but not both. If you include <code>SecretString</code> or <code>SecretBinary</code> then Secrets Manager also creates an initial secret version and automatically attaches the staging label <code>AWSCURRENT</code> to the new version.</p><note><ul><li><p>If you call an operation to encrypt or decrypt the <code>SecretString</code> or <code>SecretBinary</code> for a secret in the same account as the calling user and that secret doesn't specify a AWS KMS encryption key, Secrets Manager uses the account's default AWS managed customer master key (CMK) with the alias <code>aws/secretsmanager</code>. If this key doesn't already exist in your account then Secrets Manager creates it for you automatically. All users and roles in the same AWS account automatically have access to use the default CMK. Note that if an Secrets Manager API call results in AWS creating the account's AWS-managed CMK, it can result in a one-time significant delay in returning the result.</p></li><li><p>If the secret resides in a different AWS account from the credentials calling an API that requires encryption or decryption of the secret value then you must create and use a custom AWS KMS CMK because you can't access the default CMK for the account using credentials from a different AWS account. Store the ARN of the CMK in the secret when you create the secret or when you update it by including it in the <code>KMSKeyId</code>. If you call an API that must encrypt or decrypt <code>SecretString</code> or <code>SecretBinary</code> using credentials from a different account then the AWS KMS key policy must grant cross-account access to that other account's user or role for both the kms:GenerateDataKey and kms:Decrypt operations.</p></li></ul></note><p></p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:CreateSecret</p></li><li><p>kms:GenerateDataKey - needed only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account default AWS managed CMK for Secrets Manager.</p></li><li><p>kms:Decrypt - needed only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account default AWS managed CMK for Secrets Manager.</p></li><li><p>secretsmanager:TagResource - needed only if you include the <code>Tags</code> parameter. </p></li></ul><p><b>Related operations</b></p><ul><li><p>To delete a secret, use <a>DeleteSecret</a>.</p></li><li><p>To modify an existing secret, use <a>UpdateSecret</a>.</p></li><li><p>To create a new version of a secret, use <a>PutSecretValue</a>.</p></li><li><p>To retrieve the encrypted secure string and secure binary values, use <a>GetSecretValue</a>.</p></li><li><p>To retrieve all other details for a secret, use <a>DescribeSecret</a>. This does not include the encrypted secure string and secure binary values.</p></li><li><p>To retrieve the list of secret versions associated with the current secret, use <a>DescribeSecret</a> and examine the <code>SecretVersionsToStages</code> response value.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateSecret service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerCreateSecretResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorLimitExceeded`, `AWSSecretsManagerErrorEncryptionFailure`, `AWSSecretsManagerErrorResourceExists`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorMalformedPolicyDocument`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorPreconditionNotMet`.
 
 @see AWSSecretsManagerCreateSecretRequest
 @see AWSSecretsManagerCreateSecretResponse
 */
- (AWSTask<AWSSecretsManagerCreateSecretResponse *> *)createSecret:(AWSSecretsManagerCreateSecretRequest *)request;

/**
 <p>Creates a new secret. A secret in Secrets Manager consists of both the protected secret data and the important information needed to manage the secret.</p><p>Secrets Manager stores the encrypted secret data in one of a collection of "versions" associated with the secret. Each version contains a copy of the encrypted secret data. Each version is associated with one or more "staging labels" that identify where the version is in the rotation cycle. The <code>SecretVersionsToStages</code> field of the secret contains the mapping of staging labels to the active versions of the secret. Versions without a staging label are considered deprecated and not included in the list.</p><p>You provide the secret data to be encrypted by putting text in either the <code>SecretString</code> parameter or binary data in the <code>SecretBinary</code> parameter, but not both. If you include <code>SecretString</code> or <code>SecretBinary</code> then Secrets Manager also creates an initial secret version and automatically attaches the staging label <code>AWSCURRENT</code> to the new version.</p><note><ul><li><p>If you call an operation to encrypt or decrypt the <code>SecretString</code> or <code>SecretBinary</code> for a secret in the same account as the calling user and that secret doesn't specify a AWS KMS encryption key, Secrets Manager uses the account's default AWS managed customer master key (CMK) with the alias <code>aws/secretsmanager</code>. If this key doesn't already exist in your account then Secrets Manager creates it for you automatically. All users and roles in the same AWS account automatically have access to use the default CMK. Note that if an Secrets Manager API call results in AWS creating the account's AWS-managed CMK, it can result in a one-time significant delay in returning the result.</p></li><li><p>If the secret resides in a different AWS account from the credentials calling an API that requires encryption or decryption of the secret value then you must create and use a custom AWS KMS CMK because you can't access the default CMK for the account using credentials from a different AWS account. Store the ARN of the CMK in the secret when you create the secret or when you update it by including it in the <code>KMSKeyId</code>. If you call an API that must encrypt or decrypt <code>SecretString</code> or <code>SecretBinary</code> using credentials from a different account then the AWS KMS key policy must grant cross-account access to that other account's user or role for both the kms:GenerateDataKey and kms:Decrypt operations.</p></li></ul></note><p></p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:CreateSecret</p></li><li><p>kms:GenerateDataKey - needed only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account default AWS managed CMK for Secrets Manager.</p></li><li><p>kms:Decrypt - needed only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account default AWS managed CMK for Secrets Manager.</p></li><li><p>secretsmanager:TagResource - needed only if you include the <code>Tags</code> parameter. </p></li></ul><p><b>Related operations</b></p><ul><li><p>To delete a secret, use <a>DeleteSecret</a>.</p></li><li><p>To modify an existing secret, use <a>UpdateSecret</a>.</p></li><li><p>To create a new version of a secret, use <a>PutSecretValue</a>.</p></li><li><p>To retrieve the encrypted secure string and secure binary values, use <a>GetSecretValue</a>.</p></li><li><p>To retrieve all other details for a secret, use <a>DescribeSecret</a>. This does not include the encrypted secure string and secure binary values.</p></li><li><p>To retrieve the list of secret versions associated with the current secret, use <a>DescribeSecret</a> and examine the <code>SecretVersionsToStages</code> response value.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateSecret service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorLimitExceeded`, `AWSSecretsManagerErrorEncryptionFailure`, `AWSSecretsManagerErrorResourceExists`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorMalformedPolicyDocument`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorPreconditionNotMet`.
 
 @see AWSSecretsManagerCreateSecretRequest
 @see AWSSecretsManagerCreateSecretResponse
 */
- (void)createSecret:(AWSSecretsManagerCreateSecretRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerCreateSecretResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the resource-based permission policy attached to the secret.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:DeleteResourcePolicy</p></li></ul><p><b>Related operations</b></p><ul><li><p>To attach a resource policy to a secret, use <a>PutResourcePolicy</a>.</p></li><li><p>To retrieve the current resource-based policy that's attached to a secret, use <a>GetResourcePolicy</a>.</p></li><li><p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerDeleteResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`.
 
 @see AWSSecretsManagerDeleteResourcePolicyRequest
 @see AWSSecretsManagerDeleteResourcePolicyResponse
 */
- (AWSTask<AWSSecretsManagerDeleteResourcePolicyResponse *> *)deleteResourcePolicy:(AWSSecretsManagerDeleteResourcePolicyRequest *)request;

/**
 <p>Deletes the resource-based permission policy attached to the secret.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:DeleteResourcePolicy</p></li></ul><p><b>Related operations</b></p><ul><li><p>To attach a resource policy to a secret, use <a>PutResourcePolicy</a>.</p></li><li><p>To retrieve the current resource-based policy that's attached to a secret, use <a>GetResourcePolicy</a>.</p></li><li><p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`.
 
 @see AWSSecretsManagerDeleteResourcePolicyRequest
 @see AWSSecretsManagerDeleteResourcePolicyResponse
 */
- (void)deleteResourcePolicy:(AWSSecretsManagerDeleteResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerDeleteResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an entire secret and all of its versions. You can optionally include a recovery window during which you can restore the secret. If you don't specify a recovery window value, the operation defaults to 30 days. Secrets Manager attaches a <code>DeletionDate</code> stamp to the secret that specifies the end of the recovery window. At the end of the recovery window, Secrets Manager deletes the secret permanently.</p><p>At any time before recovery window ends, you can use <a>RestoreSecret</a> to remove the <code>DeletionDate</code> and cancel the deletion of the secret.</p><p>You cannot access the encrypted secret information in any secret that is scheduled for deletion. If you need to access that information, you must cancel the deletion with <a>RestoreSecret</a> and then retrieve the information.</p><note><ul><li><p>There is no explicit operation to delete a version of a secret. Instead, remove all staging labels from the <code>VersionStage</code> field of a version. That marks the version as deprecated and allows Secrets Manager to delete it as needed. Versions that do not have any staging labels do not show up in <a>ListSecretVersionIds</a> unless you specify <code>IncludeDeprecated</code>.</p></li><li><p>The permanent secret deletion at the end of the waiting period is performed as a background task with low priority. There is no guarantee of a specific time after the recovery window for the actual delete operation to occur.</p></li></ul></note><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:DeleteSecret</p></li></ul><p><b>Related operations</b></p><ul><li><p>To create a secret, use <a>CreateSecret</a>.</p></li><li><p>To cancel deletion of a version of a secret before the recovery window has expired, use <a>RestoreSecret</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteSecret service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerDeleteSecretResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerDeleteSecretRequest
 @see AWSSecretsManagerDeleteSecretResponse
 */
- (AWSTask<AWSSecretsManagerDeleteSecretResponse *> *)deleteSecret:(AWSSecretsManagerDeleteSecretRequest *)request;

/**
 <p>Deletes an entire secret and all of its versions. You can optionally include a recovery window during which you can restore the secret. If you don't specify a recovery window value, the operation defaults to 30 days. Secrets Manager attaches a <code>DeletionDate</code> stamp to the secret that specifies the end of the recovery window. At the end of the recovery window, Secrets Manager deletes the secret permanently.</p><p>At any time before recovery window ends, you can use <a>RestoreSecret</a> to remove the <code>DeletionDate</code> and cancel the deletion of the secret.</p><p>You cannot access the encrypted secret information in any secret that is scheduled for deletion. If you need to access that information, you must cancel the deletion with <a>RestoreSecret</a> and then retrieve the information.</p><note><ul><li><p>There is no explicit operation to delete a version of a secret. Instead, remove all staging labels from the <code>VersionStage</code> field of a version. That marks the version as deprecated and allows Secrets Manager to delete it as needed. Versions that do not have any staging labels do not show up in <a>ListSecretVersionIds</a> unless you specify <code>IncludeDeprecated</code>.</p></li><li><p>The permanent secret deletion at the end of the waiting period is performed as a background task with low priority. There is no guarantee of a specific time after the recovery window for the actual delete operation to occur.</p></li></ul></note><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:DeleteSecret</p></li></ul><p><b>Related operations</b></p><ul><li><p>To create a secret, use <a>CreateSecret</a>.</p></li><li><p>To cancel deletion of a version of a secret before the recovery window has expired, use <a>RestoreSecret</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteSecret service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerDeleteSecretRequest
 @see AWSSecretsManagerDeleteSecretResponse
 */
- (void)deleteSecret:(AWSSecretsManagerDeleteSecretRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerDeleteSecretResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the details of a secret. It does not include the encrypted fields. Secrets Manager only returns fields populated with a value in the response. </p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:DescribeSecret</p></li></ul><p><b>Related operations</b></p><ul><li><p>To create a secret, use <a>CreateSecret</a>.</p></li><li><p>To modify a secret, use <a>UpdateSecret</a>.</p></li><li><p>To retrieve the encrypted secret information in a version of the secret, use <a>GetSecretValue</a>.</p></li><li><p>To list all of the secrets in the AWS account, use <a>ListSecrets</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeSecret service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerDescribeSecretResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerDescribeSecretRequest
 @see AWSSecretsManagerDescribeSecretResponse
 */
- (AWSTask<AWSSecretsManagerDescribeSecretResponse *> *)describeSecret:(AWSSecretsManagerDescribeSecretRequest *)request;

/**
 <p>Retrieves the details of a secret. It does not include the encrypted fields. Secrets Manager only returns fields populated with a value in the response. </p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:DescribeSecret</p></li></ul><p><b>Related operations</b></p><ul><li><p>To create a secret, use <a>CreateSecret</a>.</p></li><li><p>To modify a secret, use <a>UpdateSecret</a>.</p></li><li><p>To retrieve the encrypted secret information in a version of the secret, use <a>GetSecretValue</a>.</p></li><li><p>To list all of the secrets in the AWS account, use <a>ListSecrets</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeSecret service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerDescribeSecretRequest
 @see AWSSecretsManagerDescribeSecretResponse
 */
- (void)describeSecret:(AWSSecretsManagerDescribeSecretRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerDescribeSecretResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates a random password of the specified complexity. This operation is intended for use in the Lambda rotation function. Per best practice, we recommend that you specify the maximum length and include every character type that the system you are generating a password for can support.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:GetRandomPassword</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetRandomPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerGetRandomPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerGetRandomPasswordRequest
 @see AWSSecretsManagerGetRandomPasswordResponse
 */
- (AWSTask<AWSSecretsManagerGetRandomPasswordResponse *> *)getRandomPassword:(AWSSecretsManagerGetRandomPasswordRequest *)request;

/**
 <p>Generates a random password of the specified complexity. This operation is intended for use in the Lambda rotation function. Per best practice, we recommend that you specify the maximum length and include every character type that the system you are generating a password for can support.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:GetRandomPassword</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetRandomPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerGetRandomPasswordRequest
 @see AWSSecretsManagerGetRandomPasswordResponse
 */
- (void)getRandomPassword:(AWSSecretsManagerGetRandomPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerGetRandomPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the JSON text of the resource-based policy document attached to the specified secret. The JSON request string input and response output displays formatted code with white space and line breaks for better readability. Submit your input as a single line JSON string.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:GetResourcePolicy</p></li></ul><p><b>Related operations</b></p><ul><li><p>To attach a resource policy to a secret, use <a>PutResourcePolicy</a>.</p></li><li><p>To delete the resource-based policy attached to a secret, use <a>DeleteResourcePolicy</a>.</p></li><li><p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerGetResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`.
 
 @see AWSSecretsManagerGetResourcePolicyRequest
 @see AWSSecretsManagerGetResourcePolicyResponse
 */
- (AWSTask<AWSSecretsManagerGetResourcePolicyResponse *> *)getResourcePolicy:(AWSSecretsManagerGetResourcePolicyRequest *)request;

/**
 <p>Retrieves the JSON text of the resource-based policy document attached to the specified secret. The JSON request string input and response output displays formatted code with white space and line breaks for better readability. Submit your input as a single line JSON string.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:GetResourcePolicy</p></li></ul><p><b>Related operations</b></p><ul><li><p>To attach a resource policy to a secret, use <a>PutResourcePolicy</a>.</p></li><li><p>To delete the resource-based policy attached to a secret, use <a>DeleteResourcePolicy</a>.</p></li><li><p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`.
 
 @see AWSSecretsManagerGetResourcePolicyRequest
 @see AWSSecretsManagerGetResourcePolicyResponse
 */
- (void)getResourcePolicy:(AWSSecretsManagerGetResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerGetResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the contents of the encrypted fields <code>SecretString</code> or <code>SecretBinary</code> from the specified version of a secret, whichever contains content.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:GetSecretValue</p></li><li><p>kms:Decrypt - required only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account's default AWS managed CMK for Secrets Manager.</p></li></ul><p><b>Related operations</b></p><ul><li><p>To create a new version of the secret with different encrypted information, use <a>PutSecretValue</a>.</p></li><li><p>To retrieve the non-encrypted details for the secret, use <a>DescribeSecret</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetSecretValue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerGetSecretValueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorDecryptionFailure`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerGetSecretValueRequest
 @see AWSSecretsManagerGetSecretValueResponse
 */
- (AWSTask<AWSSecretsManagerGetSecretValueResponse *> *)getSecretValue:(AWSSecretsManagerGetSecretValueRequest *)request;

/**
 <p>Retrieves the contents of the encrypted fields <code>SecretString</code> or <code>SecretBinary</code> from the specified version of a secret, whichever contains content.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:GetSecretValue</p></li><li><p>kms:Decrypt - required only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account's default AWS managed CMK for Secrets Manager.</p></li></ul><p><b>Related operations</b></p><ul><li><p>To create a new version of the secret with different encrypted information, use <a>PutSecretValue</a>.</p></li><li><p>To retrieve the non-encrypted details for the secret, use <a>DescribeSecret</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetSecretValue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorDecryptionFailure`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerGetSecretValueRequest
 @see AWSSecretsManagerGetSecretValueResponse
 */
- (void)getSecretValue:(AWSSecretsManagerGetSecretValueRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerGetSecretValueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the versions attached to the specified secret. The output does not include the <code>SecretString</code> or <code>SecretBinary</code> fields. By default, the list includes only versions that have at least one staging label in <code>VersionStage</code> attached.</p><note><p>Always check the <code>NextToken</code> response parameter when calling any of the <code>List*</code> operations. These operations can occasionally return an empty or shorter than expected list of results even when there more results become available. When this happens, the <code>NextToken</code> response parameter contains a value to pass to the next call to the same API to request the next part of the list.</p></note><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:ListSecretVersionIds</p></li></ul><p><b>Related operations</b></p><ul><li><p>To list the secrets in an account, use <a>ListSecrets</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListSecretVersionIds service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerListSecretVersionIdsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidNextToken`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerListSecretVersionIdsRequest
 @see AWSSecretsManagerListSecretVersionIdsResponse
 */
- (AWSTask<AWSSecretsManagerListSecretVersionIdsResponse *> *)listSecretVersionIds:(AWSSecretsManagerListSecretVersionIdsRequest *)request;

/**
 <p>Lists all of the versions attached to the specified secret. The output does not include the <code>SecretString</code> or <code>SecretBinary</code> fields. By default, the list includes only versions that have at least one staging label in <code>VersionStage</code> attached.</p><note><p>Always check the <code>NextToken</code> response parameter when calling any of the <code>List*</code> operations. These operations can occasionally return an empty or shorter than expected list of results even when there more results become available. When this happens, the <code>NextToken</code> response parameter contains a value to pass to the next call to the same API to request the next part of the list.</p></note><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:ListSecretVersionIds</p></li></ul><p><b>Related operations</b></p><ul><li><p>To list the secrets in an account, use <a>ListSecrets</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListSecretVersionIds service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidNextToken`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerListSecretVersionIdsRequest
 @see AWSSecretsManagerListSecretVersionIdsResponse
 */
- (void)listSecretVersionIds:(AWSSecretsManagerListSecretVersionIdsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerListSecretVersionIdsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the secrets that are stored by Secrets Manager in the AWS account. To list the versions currently stored for a specific secret, use <a>ListSecretVersionIds</a>. The encrypted fields <code>SecretString</code> and <code>SecretBinary</code> are not included in the output. To get that information, call the <a>GetSecretValue</a> operation.</p><note><p>Always check the <code>NextToken</code> response parameter when calling any of the <code>List*</code> operations. These operations can occasionally return an empty or shorter than expected list of results even when there more results become available. When this happens, the <code>NextToken</code> response parameter contains a value to pass to the next call to the same API to request the next part of the list.</p></note><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:ListSecrets</p></li></ul><p><b>Related operations</b></p><ul><li><p>To list the versions attached to a secret, use <a>ListSecretVersionIds</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListSecrets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerListSecretsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidNextToken`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerListSecretsRequest
 @see AWSSecretsManagerListSecretsResponse
 */
- (AWSTask<AWSSecretsManagerListSecretsResponse *> *)listSecrets:(AWSSecretsManagerListSecretsRequest *)request;

/**
 <p>Lists all of the secrets that are stored by Secrets Manager in the AWS account. To list the versions currently stored for a specific secret, use <a>ListSecretVersionIds</a>. The encrypted fields <code>SecretString</code> and <code>SecretBinary</code> are not included in the output. To get that information, call the <a>GetSecretValue</a> operation.</p><note><p>Always check the <code>NextToken</code> response parameter when calling any of the <code>List*</code> operations. These operations can occasionally return an empty or shorter than expected list of results even when there more results become available. When this happens, the <code>NextToken</code> response parameter contains a value to pass to the next call to the same API to request the next part of the list.</p></note><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:ListSecrets</p></li></ul><p><b>Related operations</b></p><ul><li><p>To list the versions attached to a secret, use <a>ListSecretVersionIds</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListSecrets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidNextToken`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerListSecretsRequest
 @see AWSSecretsManagerListSecretsResponse
 */
- (void)listSecrets:(AWSSecretsManagerListSecretsRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerListSecretsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches the contents of the specified resource-based permission policy to a secret. A resource-based policy is optional. Alternatively, you can use IAM identity-based policies that specify the secret's Amazon Resource Name (ARN) in the policy statement's <code>Resources</code> element. You can also use a combination of both identity-based and resource-based policies. The affected users and roles receive the permissions that are permitted by all of the relevant policies. For more information, see <a href="http://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_resource-based-policies.html">Using Resource-Based Policies for AWS Secrets Manager</a>. For the complete description of the AWS policy syntax and grammar, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">IAM JSON Policy Reference</a> in the <i>IAM User Guide</i>.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:PutResourcePolicy</p></li></ul><p><b>Related operations</b></p><ul><li><p>To retrieve the resource policy attached to a secret, use <a>GetResourcePolicy</a>.</p></li><li><p>To delete the resource-based policy that's attached to a secret, use <a>DeleteResourcePolicy</a>.</p></li><li><p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerPutResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorMalformedPolicyDocument`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorPublicPolicy`.
 
 @see AWSSecretsManagerPutResourcePolicyRequest
 @see AWSSecretsManagerPutResourcePolicyResponse
 */
- (AWSTask<AWSSecretsManagerPutResourcePolicyResponse *> *)putResourcePolicy:(AWSSecretsManagerPutResourcePolicyRequest *)request;

/**
 <p>Attaches the contents of the specified resource-based permission policy to a secret. A resource-based policy is optional. Alternatively, you can use IAM identity-based policies that specify the secret's Amazon Resource Name (ARN) in the policy statement's <code>Resources</code> element. You can also use a combination of both identity-based and resource-based policies. The affected users and roles receive the permissions that are permitted by all of the relevant policies. For more information, see <a href="http://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_resource-based-policies.html">Using Resource-Based Policies for AWS Secrets Manager</a>. For the complete description of the AWS policy syntax and grammar, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">IAM JSON Policy Reference</a> in the <i>IAM User Guide</i>.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:PutResourcePolicy</p></li></ul><p><b>Related operations</b></p><ul><li><p>To retrieve the resource policy attached to a secret, use <a>GetResourcePolicy</a>.</p></li><li><p>To delete the resource-based policy that's attached to a secret, use <a>DeleteResourcePolicy</a>.</p></li><li><p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorMalformedPolicyDocument`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorPublicPolicy`.
 
 @see AWSSecretsManagerPutResourcePolicyRequest
 @see AWSSecretsManagerPutResourcePolicyResponse
 */
- (void)putResourcePolicy:(AWSSecretsManagerPutResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerPutResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stores a new encrypted secret value in the specified secret. To do this, the operation creates a new version and attaches it to the secret. The version can contain a new <code>SecretString</code> value or a new <code>SecretBinary</code> value. You can also specify the staging labels that are initially attached to the new version.</p><note><p>The Secrets Manager console uses only the <code>SecretString</code> field. To add binary data to a secret with the <code>SecretBinary</code> field you must use the AWS CLI or one of the AWS SDKs.</p></note><ul><li><p>If this operation creates the first version for the secret then Secrets Manager automatically attaches the staging label <code>AWSCURRENT</code> to the new version.</p></li><li><p>If another version of this secret already exists, then this operation does not automatically move any staging labels other than those that you explicitly specify in the <code>VersionStages</code> parameter.</p></li><li><p>If this operation moves the staging label <code>AWSCURRENT</code> from another version to this version (because you included it in the <code>StagingLabels</code> parameter) then Secrets Manager also automatically moves the staging label <code>AWSPREVIOUS</code> to the version that <code>AWSCURRENT</code> was removed from.</p></li><li><p>This operation is idempotent. If a version with a <code>VersionId</code> with the same value as the <code>ClientRequestToken</code> parameter already exists and you specify the same secret data, the operation succeeds but does nothing. However, if the secret data is different, then the operation fails because you cannot modify an existing version; you can only create new ones.</p></li></ul><note><ul><li><p>If you call an operation to encrypt or decrypt the <code>SecretString</code> or <code>SecretBinary</code> for a secret in the same account as the calling user and that secret doesn't specify a AWS KMS encryption key, Secrets Manager uses the account's default AWS managed customer master key (CMK) with the alias <code>aws/secretsmanager</code>. If this key doesn't already exist in your account then Secrets Manager creates it for you automatically. All users and roles in the same AWS account automatically have access to use the default CMK. Note that if an Secrets Manager API call results in AWS creating the account's AWS-managed CMK, it can result in a one-time significant delay in returning the result.</p></li><li><p>If the secret resides in a different AWS account from the credentials calling an API that requires encryption or decryption of the secret value then you must create and use a custom AWS KMS CMK because you can't access the default CMK for the account using credentials from a different AWS account. Store the ARN of the CMK in the secret when you create the secret or when you update it by including it in the <code>KMSKeyId</code>. If you call an API that must encrypt or decrypt <code>SecretString</code> or <code>SecretBinary</code> using credentials from a different account then the AWS KMS key policy must grant cross-account access to that other account's user or role for both the kms:GenerateDataKey and kms:Decrypt operations.</p></li></ul></note><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:PutSecretValue</p></li><li><p>kms:GenerateDataKey - needed only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account's default AWS managed CMK for Secrets Manager.</p></li></ul><p><b>Related operations</b></p><ul><li><p>To retrieve the encrypted value you store in the version of a secret, use <a>GetSecretValue</a>.</p></li><li><p>To create a secret, use <a>CreateSecret</a>.</p></li><li><p>To get the details for a secret, use <a>DescribeSecret</a>.</p></li><li><p>To list the versions attached to a secret, use <a>ListSecretVersionIds</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutSecretValue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerPutSecretValueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorLimitExceeded`, `AWSSecretsManagerErrorEncryptionFailure`, `AWSSecretsManagerErrorResourceExists`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerPutSecretValueRequest
 @see AWSSecretsManagerPutSecretValueResponse
 */
- (AWSTask<AWSSecretsManagerPutSecretValueResponse *> *)putSecretValue:(AWSSecretsManagerPutSecretValueRequest *)request;

/**
 <p>Stores a new encrypted secret value in the specified secret. To do this, the operation creates a new version and attaches it to the secret. The version can contain a new <code>SecretString</code> value or a new <code>SecretBinary</code> value. You can also specify the staging labels that are initially attached to the new version.</p><note><p>The Secrets Manager console uses only the <code>SecretString</code> field. To add binary data to a secret with the <code>SecretBinary</code> field you must use the AWS CLI or one of the AWS SDKs.</p></note><ul><li><p>If this operation creates the first version for the secret then Secrets Manager automatically attaches the staging label <code>AWSCURRENT</code> to the new version.</p></li><li><p>If another version of this secret already exists, then this operation does not automatically move any staging labels other than those that you explicitly specify in the <code>VersionStages</code> parameter.</p></li><li><p>If this operation moves the staging label <code>AWSCURRENT</code> from another version to this version (because you included it in the <code>StagingLabels</code> parameter) then Secrets Manager also automatically moves the staging label <code>AWSPREVIOUS</code> to the version that <code>AWSCURRENT</code> was removed from.</p></li><li><p>This operation is idempotent. If a version with a <code>VersionId</code> with the same value as the <code>ClientRequestToken</code> parameter already exists and you specify the same secret data, the operation succeeds but does nothing. However, if the secret data is different, then the operation fails because you cannot modify an existing version; you can only create new ones.</p></li></ul><note><ul><li><p>If you call an operation to encrypt or decrypt the <code>SecretString</code> or <code>SecretBinary</code> for a secret in the same account as the calling user and that secret doesn't specify a AWS KMS encryption key, Secrets Manager uses the account's default AWS managed customer master key (CMK) with the alias <code>aws/secretsmanager</code>. If this key doesn't already exist in your account then Secrets Manager creates it for you automatically. All users and roles in the same AWS account automatically have access to use the default CMK. Note that if an Secrets Manager API call results in AWS creating the account's AWS-managed CMK, it can result in a one-time significant delay in returning the result.</p></li><li><p>If the secret resides in a different AWS account from the credentials calling an API that requires encryption or decryption of the secret value then you must create and use a custom AWS KMS CMK because you can't access the default CMK for the account using credentials from a different AWS account. Store the ARN of the CMK in the secret when you create the secret or when you update it by including it in the <code>KMSKeyId</code>. If you call an API that must encrypt or decrypt <code>SecretString</code> or <code>SecretBinary</code> using credentials from a different account then the AWS KMS key policy must grant cross-account access to that other account's user or role for both the kms:GenerateDataKey and kms:Decrypt operations.</p></li></ul></note><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:PutSecretValue</p></li><li><p>kms:GenerateDataKey - needed only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account's default AWS managed CMK for Secrets Manager.</p></li></ul><p><b>Related operations</b></p><ul><li><p>To retrieve the encrypted value you store in the version of a secret, use <a>GetSecretValue</a>.</p></li><li><p>To create a secret, use <a>CreateSecret</a>.</p></li><li><p>To get the details for a secret, use <a>DescribeSecret</a>.</p></li><li><p>To list the versions attached to a secret, use <a>ListSecretVersionIds</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutSecretValue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorLimitExceeded`, `AWSSecretsManagerErrorEncryptionFailure`, `AWSSecretsManagerErrorResourceExists`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerPutSecretValueRequest
 @see AWSSecretsManagerPutSecretValueResponse
 */
- (void)putSecretValue:(AWSSecretsManagerPutSecretValueRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerPutSecretValueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels the scheduled deletion of a secret by removing the <code>DeletedDate</code> time stamp. This makes the secret accessible to query once again.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:RestoreSecret</p></li></ul><p><b>Related operations</b></p><ul><li><p>To delete a secret, use <a>DeleteSecret</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the RestoreSecret service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerRestoreSecretResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerRestoreSecretRequest
 @see AWSSecretsManagerRestoreSecretResponse
 */
- (AWSTask<AWSSecretsManagerRestoreSecretResponse *> *)restoreSecret:(AWSSecretsManagerRestoreSecretRequest *)request;

/**
 <p>Cancels the scheduled deletion of a secret by removing the <code>DeletedDate</code> time stamp. This makes the secret accessible to query once again.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:RestoreSecret</p></li></ul><p><b>Related operations</b></p><ul><li><p>To delete a secret, use <a>DeleteSecret</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the RestoreSecret service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerRestoreSecretRequest
 @see AWSSecretsManagerRestoreSecretResponse
 */
- (void)restoreSecret:(AWSSecretsManagerRestoreSecretRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerRestoreSecretResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures and starts the asynchronous process of rotating this secret. If you include the configuration parameters, the operation sets those values for the secret and then immediately starts a rotation. If you do not include the configuration parameters, the operation starts a rotation with the values already stored in the secret. After the rotation completes, the protected service and its clients all use the new version of the secret. </p><p>This required configuration information includes the ARN of an AWS Lambda function and the time between scheduled rotations. The Lambda rotation function creates a new version of the secret and creates or updates the credentials on the protected service to match. After testing the new credentials, the function marks the new secret with the staging label <code>AWSCURRENT</code> so that your clients all immediately begin to use the new version. For more information about rotating secrets and how to configure a Lambda function to rotate the secrets for your protected service, see <a href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html">Rotating Secrets in AWS Secrets Manager</a> in the <i>AWS Secrets Manager User Guide</i>.</p><p>Secrets Manager schedules the next rotation when the previous one completes. Secrets Manager schedules the date by adding the rotation interval (number of days) to the actual date of the last rotation. The service chooses the hour within that 24-hour date window randomly. The minute is also chosen somewhat randomly, but weighted towards the top of the hour and influenced by a variety of factors that help distribute load.</p><p>The rotation function must end with the versions of the secret in one of two states:</p><ul><li><p>The <code>AWSPENDING</code> and <code>AWSCURRENT</code> staging labels are attached to the same version of the secret, or</p></li><li><p>The <code>AWSPENDING</code> staging label is not attached to any version of the secret.</p></li></ul><p>If the <code>AWSPENDING</code> staging label is present but not attached to the same version as <code>AWSCURRENT</code> then any later invocation of <code>RotateSecret</code> assumes that a previous rotation request is still in progress and returns an error.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:RotateSecret</p></li><li><p>lambda:InvokeFunction (on the function specified in the secret's metadata)</p></li></ul><p><b>Related operations</b></p><ul><li><p>To list the secrets in your account, use <a>ListSecrets</a>.</p></li><li><p>To get the details for a version of a secret, use <a>DescribeSecret</a>.</p></li><li><p>To create a new version of a secret, use <a>CreateSecret</a>.</p></li><li><p>To attach staging labels to or remove staging labels from a version of a secret, use <a>UpdateSecretVersionStage</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the RotateSecret service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerRotateSecretResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`.
 
 @see AWSSecretsManagerRotateSecretRequest
 @see AWSSecretsManagerRotateSecretResponse
 */
- (AWSTask<AWSSecretsManagerRotateSecretResponse *> *)rotateSecret:(AWSSecretsManagerRotateSecretRequest *)request;

/**
 <p>Configures and starts the asynchronous process of rotating this secret. If you include the configuration parameters, the operation sets those values for the secret and then immediately starts a rotation. If you do not include the configuration parameters, the operation starts a rotation with the values already stored in the secret. After the rotation completes, the protected service and its clients all use the new version of the secret. </p><p>This required configuration information includes the ARN of an AWS Lambda function and the time between scheduled rotations. The Lambda rotation function creates a new version of the secret and creates or updates the credentials on the protected service to match. After testing the new credentials, the function marks the new secret with the staging label <code>AWSCURRENT</code> so that your clients all immediately begin to use the new version. For more information about rotating secrets and how to configure a Lambda function to rotate the secrets for your protected service, see <a href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html">Rotating Secrets in AWS Secrets Manager</a> in the <i>AWS Secrets Manager User Guide</i>.</p><p>Secrets Manager schedules the next rotation when the previous one completes. Secrets Manager schedules the date by adding the rotation interval (number of days) to the actual date of the last rotation. The service chooses the hour within that 24-hour date window randomly. The minute is also chosen somewhat randomly, but weighted towards the top of the hour and influenced by a variety of factors that help distribute load.</p><p>The rotation function must end with the versions of the secret in one of two states:</p><ul><li><p>The <code>AWSPENDING</code> and <code>AWSCURRENT</code> staging labels are attached to the same version of the secret, or</p></li><li><p>The <code>AWSPENDING</code> staging label is not attached to any version of the secret.</p></li></ul><p>If the <code>AWSPENDING</code> staging label is present but not attached to the same version as <code>AWSCURRENT</code> then any later invocation of <code>RotateSecret</code> assumes that a previous rotation request is still in progress and returns an error.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:RotateSecret</p></li><li><p>lambda:InvokeFunction (on the function specified in the secret's metadata)</p></li></ul><p><b>Related operations</b></p><ul><li><p>To list the secrets in your account, use <a>ListSecrets</a>.</p></li><li><p>To get the details for a version of a secret, use <a>DescribeSecret</a>.</p></li><li><p>To create a new version of a secret, use <a>CreateSecret</a>.</p></li><li><p>To attach staging labels to or remove staging labels from a version of a secret, use <a>UpdateSecretVersionStage</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the RotateSecret service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`.
 
 @see AWSSecretsManagerRotateSecretRequest
 @see AWSSecretsManagerRotateSecretResponse
 */
- (void)rotateSecret:(AWSSecretsManagerRotateSecretRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerRotateSecretResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches one or more tags, each consisting of a key name and a value, to the specified secret. Tags are part of the secret's overall metadata, and are not associated with any specific version of the secret. This operation only appends tags to the existing list of tags. To remove tags, you must use <a>UntagResource</a>.</p><p>The following basic restrictions apply to tags:</p><ul><li><p>Maximum number of tags per secret—50</p></li><li><p>Maximum key length—127 Unicode characters in UTF-8</p></li><li><p>Maximum value length—255 Unicode characters in UTF-8</p></li><li><p>Tag keys and values are case sensitive.</p></li><li><p>Do not use the <code>aws:</code> prefix in your tag names or values because AWS reserves it for AWS use. You can't edit or delete tag names or values with this prefix. Tags with this prefix do not count against your tags per secret limit.</p></li><li><p>If you use your tagging schema across multiple services and resources, remember other services might have restrictions on allowed characters. Generally allowed characters: letters, spaces, and numbers representable in UTF-8, plus the following special characters: + - = . _ : / @.</p></li></ul><important><p>If you use tags as part of your security strategy, then adding or removing a tag can change permissions. If successfully completing this operation would result in you losing your permissions for this secret, then the operation is blocked and returns an Access Denied error.</p></important><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:TagResource</p></li></ul><p><b>Related operations</b></p><ul><li><p>To remove one or more tags from the collection attached to a secret, use <a>UntagResource</a>.</p></li><li><p>To view the list of tags attached to a secret, use <a>DescribeSecret</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSSecretsManagerTagResourceRequest *)request;

/**
 <p>Attaches one or more tags, each consisting of a key name and a value, to the specified secret. Tags are part of the secret's overall metadata, and are not associated with any specific version of the secret. This operation only appends tags to the existing list of tags. To remove tags, you must use <a>UntagResource</a>.</p><p>The following basic restrictions apply to tags:</p><ul><li><p>Maximum number of tags per secret—50</p></li><li><p>Maximum key length—127 Unicode characters in UTF-8</p></li><li><p>Maximum value length—255 Unicode characters in UTF-8</p></li><li><p>Tag keys and values are case sensitive.</p></li><li><p>Do not use the <code>aws:</code> prefix in your tag names or values because AWS reserves it for AWS use. You can't edit or delete tag names or values with this prefix. Tags with this prefix do not count against your tags per secret limit.</p></li><li><p>If you use your tagging schema across multiple services and resources, remember other services might have restrictions on allowed characters. Generally allowed characters: letters, spaces, and numbers representable in UTF-8, plus the following special characters: + - = . _ : / @.</p></li></ul><important><p>If you use tags as part of your security strategy, then adding or removing a tag can change permissions. If successfully completing this operation would result in you losing your permissions for this secret, then the operation is blocked and returns an Access Denied error.</p></important><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:TagResource</p></li></ul><p><b>Related operations</b></p><ul><li><p>To remove one or more tags from the collection attached to a secret, use <a>UntagResource</a>.</p></li><li><p>To view the list of tags attached to a secret, use <a>DescribeSecret</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerTagResourceRequest
 */
- (void)tagResource:(AWSSecretsManagerTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from the specified secret.</p><p>This operation is idempotent. If a requested tag is not attached to the secret, no error is returned and the secret metadata is unchanged.</p><important><p>If you use tags as part of your security strategy, then removing a tag can change permissions. If successfully completing this operation would result in you losing your permissions for this secret, then the operation is blocked and returns an Access Denied error.</p></important><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:UntagResource</p></li></ul><p><b>Related operations</b></p><ul><li><p>To add one or more tags to the collection attached to a secret, use <a>TagResource</a>.</p></li><li><p>To view the list of tags attached to a secret, use <a>DescribeSecret</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSSecretsManagerUntagResourceRequest *)request;

/**
 <p>Removes one or more tags from the specified secret.</p><p>This operation is idempotent. If a requested tag is not attached to the secret, no error is returned and the secret metadata is unchanged.</p><important><p>If you use tags as part of your security strategy, then removing a tag can change permissions. If successfully completing this operation would result in you losing your permissions for this secret, then the operation is blocked and returns an Access Denied error.</p></important><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:UntagResource</p></li></ul><p><b>Related operations</b></p><ul><li><p>To add one or more tags to the collection attached to a secret, use <a>TagResource</a>.</p></li><li><p>To view the list of tags attached to a secret, use <a>DescribeSecret</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerUntagResourceRequest
 */
- (void)untagResource:(AWSSecretsManagerUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies many of the details of the specified secret. If you include a <code>ClientRequestToken</code> and <i>either</i><code>SecretString</code> or <code>SecretBinary</code> then it also creates a new version attached to the secret.</p><p>To modify the rotation configuration of a secret, use <a>RotateSecret</a> instead.</p><note><p>The Secrets Manager console uses only the <code>SecretString</code> parameter and therefore limits you to encrypting and storing only a text string. To encrypt and store binary data as part of the version of a secret, you must use either the AWS CLI or one of the AWS SDKs.</p></note><ul><li><p>If a version with a <code>VersionId</code> with the same value as the <code>ClientRequestToken</code> parameter already exists, the operation results in an error. You cannot modify an existing version, you can only create a new version.</p></li><li><p>If you include <code>SecretString</code> or <code>SecretBinary</code> to create a new secret version, Secrets Manager automatically attaches the staging label <code>AWSCURRENT</code> to the new version. </p></li></ul><note><ul><li><p>If you call an operation to encrypt or decrypt the <code>SecretString</code> or <code>SecretBinary</code> for a secret in the same account as the calling user and that secret doesn't specify a AWS KMS encryption key, Secrets Manager uses the account's default AWS managed customer master key (CMK) with the alias <code>aws/secretsmanager</code>. If this key doesn't already exist in your account then Secrets Manager creates it for you automatically. All users and roles in the same AWS account automatically have access to use the default CMK. Note that if an Secrets Manager API call results in AWS creating the account's AWS-managed CMK, it can result in a one-time significant delay in returning the result.</p></li><li><p>If the secret resides in a different AWS account from the credentials calling an API that requires encryption or decryption of the secret value then you must create and use a custom AWS KMS CMK because you can't access the default CMK for the account using credentials from a different AWS account. Store the ARN of the CMK in the secret when you create the secret or when you update it by including it in the <code>KMSKeyId</code>. If you call an API that must encrypt or decrypt <code>SecretString</code> or <code>SecretBinary</code> using credentials from a different account then the AWS KMS key policy must grant cross-account access to that other account's user or role for both the kms:GenerateDataKey and kms:Decrypt operations.</p></li></ul></note><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:UpdateSecret</p></li><li><p>kms:GenerateDataKey - needed only if you use a custom AWS KMS key to encrypt the secret. You do not need this permission to use the account's AWS managed CMK for Secrets Manager.</p></li><li><p>kms:Decrypt - needed only if you use a custom AWS KMS key to encrypt the secret. You do not need this permission to use the account's AWS managed CMK for Secrets Manager.</p></li></ul><p><b>Related operations</b></p><ul><li><p>To create a new secret, use <a>CreateSecret</a>.</p></li><li><p>To add only a new version to an existing secret, use <a>PutSecretValue</a>.</p></li><li><p>To get the details for a secret, use <a>DescribeSecret</a>.</p></li><li><p>To list the versions contained in a secret, use <a>ListSecretVersionIds</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateSecret service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerUpdateSecretResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorLimitExceeded`, `AWSSecretsManagerErrorEncryptionFailure`, `AWSSecretsManagerErrorResourceExists`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorMalformedPolicyDocument`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorPreconditionNotMet`.
 
 @see AWSSecretsManagerUpdateSecretRequest
 @see AWSSecretsManagerUpdateSecretResponse
 */
- (AWSTask<AWSSecretsManagerUpdateSecretResponse *> *)updateSecret:(AWSSecretsManagerUpdateSecretRequest *)request;

/**
 <p>Modifies many of the details of the specified secret. If you include a <code>ClientRequestToken</code> and <i>either</i><code>SecretString</code> or <code>SecretBinary</code> then it also creates a new version attached to the secret.</p><p>To modify the rotation configuration of a secret, use <a>RotateSecret</a> instead.</p><note><p>The Secrets Manager console uses only the <code>SecretString</code> parameter and therefore limits you to encrypting and storing only a text string. To encrypt and store binary data as part of the version of a secret, you must use either the AWS CLI or one of the AWS SDKs.</p></note><ul><li><p>If a version with a <code>VersionId</code> with the same value as the <code>ClientRequestToken</code> parameter already exists, the operation results in an error. You cannot modify an existing version, you can only create a new version.</p></li><li><p>If you include <code>SecretString</code> or <code>SecretBinary</code> to create a new secret version, Secrets Manager automatically attaches the staging label <code>AWSCURRENT</code> to the new version. </p></li></ul><note><ul><li><p>If you call an operation to encrypt or decrypt the <code>SecretString</code> or <code>SecretBinary</code> for a secret in the same account as the calling user and that secret doesn't specify a AWS KMS encryption key, Secrets Manager uses the account's default AWS managed customer master key (CMK) with the alias <code>aws/secretsmanager</code>. If this key doesn't already exist in your account then Secrets Manager creates it for you automatically. All users and roles in the same AWS account automatically have access to use the default CMK. Note that if an Secrets Manager API call results in AWS creating the account's AWS-managed CMK, it can result in a one-time significant delay in returning the result.</p></li><li><p>If the secret resides in a different AWS account from the credentials calling an API that requires encryption or decryption of the secret value then you must create and use a custom AWS KMS CMK because you can't access the default CMK for the account using credentials from a different AWS account. Store the ARN of the CMK in the secret when you create the secret or when you update it by including it in the <code>KMSKeyId</code>. If you call an API that must encrypt or decrypt <code>SecretString</code> or <code>SecretBinary</code> using credentials from a different account then the AWS KMS key policy must grant cross-account access to that other account's user or role for both the kms:GenerateDataKey and kms:Decrypt operations.</p></li></ul></note><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:UpdateSecret</p></li><li><p>kms:GenerateDataKey - needed only if you use a custom AWS KMS key to encrypt the secret. You do not need this permission to use the account's AWS managed CMK for Secrets Manager.</p></li><li><p>kms:Decrypt - needed only if you use a custom AWS KMS key to encrypt the secret. You do not need this permission to use the account's AWS managed CMK for Secrets Manager.</p></li></ul><p><b>Related operations</b></p><ul><li><p>To create a new secret, use <a>CreateSecret</a>.</p></li><li><p>To add only a new version to an existing secret, use <a>PutSecretValue</a>.</p></li><li><p>To get the details for a secret, use <a>DescribeSecret</a>.</p></li><li><p>To list the versions contained in a secret, use <a>ListSecretVersionIds</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateSecret service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorLimitExceeded`, `AWSSecretsManagerErrorEncryptionFailure`, `AWSSecretsManagerErrorResourceExists`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorMalformedPolicyDocument`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorPreconditionNotMet`.
 
 @see AWSSecretsManagerUpdateSecretRequest
 @see AWSSecretsManagerUpdateSecretResponse
 */
- (void)updateSecret:(AWSSecretsManagerUpdateSecretRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerUpdateSecretResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the staging labels attached to a version of a secret. Staging labels are used to track a version as it progresses through the secret rotation process. You can attach a staging label to only one version of a secret at a time. If a staging label to be added is already attached to another version, then it is moved--removed from the other version first and then attached to this one. For more information about staging labels, see <a href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/terms-concepts.html#term_staging-label">Staging Labels</a> in the <i>AWS Secrets Manager User Guide</i>. </p><p>The staging labels that you specify in the <code>VersionStage</code> parameter are added to the existing list of staging labels--they don't replace it.</p><p>You can move the <code>AWSCURRENT</code> staging label to this version by including it in this call.</p><note><p>Whenever you move <code>AWSCURRENT</code>, Secrets Manager automatically moves the label <code>AWSPREVIOUS</code> to the version that <code>AWSCURRENT</code> was removed from.</p></note><p>If this action results in the last label being removed from a version, then the version is considered to be 'deprecated' and can be deleted by Secrets Manager.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:UpdateSecretVersionStage</p></li></ul><p><b>Related operations</b></p><ul><li><p>To get the list of staging labels that are currently associated with a version of a secret, use <code><a>DescribeSecret</a></code> and examine the <code>SecretVersionsToStages</code> response value. </p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateSecretVersionStage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerUpdateSecretVersionStageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorLimitExceeded`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerUpdateSecretVersionStageRequest
 @see AWSSecretsManagerUpdateSecretVersionStageResponse
 */
- (AWSTask<AWSSecretsManagerUpdateSecretVersionStageResponse *> *)updateSecretVersionStage:(AWSSecretsManagerUpdateSecretVersionStageRequest *)request;

/**
 <p>Modifies the staging labels attached to a version of a secret. Staging labels are used to track a version as it progresses through the secret rotation process. You can attach a staging label to only one version of a secret at a time. If a staging label to be added is already attached to another version, then it is moved--removed from the other version first and then attached to this one. For more information about staging labels, see <a href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/terms-concepts.html#term_staging-label">Staging Labels</a> in the <i>AWS Secrets Manager User Guide</i>. </p><p>The staging labels that you specify in the <code>VersionStage</code> parameter are added to the existing list of staging labels--they don't replace it.</p><p>You can move the <code>AWSCURRENT</code> staging label to this version by including it in this call.</p><note><p>Whenever you move <code>AWSCURRENT</code>, Secrets Manager automatically moves the label <code>AWSPREVIOUS</code> to the version that <code>AWSCURRENT</code> was removed from.</p></note><p>If this action results in the last label being removed from a version, then the version is considered to be 'deprecated' and can be deleted by Secrets Manager.</p><p><b>Minimum permissions</b></p><p>To run this command, you must have the following permissions:</p><ul><li><p>secretsmanager:UpdateSecretVersionStage</p></li></ul><p><b>Related operations</b></p><ul><li><p>To get the list of staging labels that are currently associated with a version of a secret, use <code><a>DescribeSecret</a></code> and examine the <code>SecretVersionsToStages</code> response value. </p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateSecretVersionStage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInvalidRequest`, `AWSSecretsManagerErrorLimitExceeded`, `AWSSecretsManagerErrorInternalService`.
 
 @see AWSSecretsManagerUpdateSecretVersionStageRequest
 @see AWSSecretsManagerUpdateSecretVersionStageResponse
 */
- (void)updateSecretVersionStage:(AWSSecretsManagerUpdateSecretVersionStageRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerUpdateSecretVersionStageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Validates the JSON text of the resource-based policy document attached to the specified secret. The JSON request string input and response output displays formatted code with white space and line breaks for better readability. Submit your input as a single line JSON string. A resource-based policy is optional.</p>
 
 @param request A container for the necessary parameters to execute the ValidateResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSecretsManagerValidateResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorMalformedPolicyDocument`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`.
 
 @see AWSSecretsManagerValidateResourcePolicyRequest
 @see AWSSecretsManagerValidateResourcePolicyResponse
 */
- (AWSTask<AWSSecretsManagerValidateResourcePolicyResponse *> *)validateResourcePolicy:(AWSSecretsManagerValidateResourcePolicyRequest *)request;

/**
 <p>Validates the JSON text of the resource-based policy document attached to the specified secret. The JSON request string input and response output displays formatted code with white space and line breaks for better readability. Submit your input as a single line JSON string. A resource-based policy is optional.</p>
 
 @param request A container for the necessary parameters to execute the ValidateResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSecretsManagerErrorDomain` domain and the following error code: `AWSSecretsManagerErrorMalformedPolicyDocument`, `AWSSecretsManagerErrorResourceNotFound`, `AWSSecretsManagerErrorInvalidParameter`, `AWSSecretsManagerErrorInternalService`, `AWSSecretsManagerErrorInvalidRequest`.
 
 @see AWSSecretsManagerValidateResourcePolicyRequest
 @see AWSSecretsManagerValidateResourcePolicyResponse
 */
- (void)validateResourcePolicy:(AWSSecretsManagerValidateResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSSecretsManagerValidateResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
