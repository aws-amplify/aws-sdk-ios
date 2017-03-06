//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSKMSModel.h"
#import "AWSKMSResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>AWS Key Management Service</fullname><p>AWS Key Management Service (AWS KMS) is an encryption and key management web service. This guide describes the AWS KMS operations that you can call programmatically. For general information about AWS KMS, see the <a href="http://docs.aws.amazon.com/kms/latest/developerguide/">AWS Key Management Service Developer Guide</a>.</p><note><p>AWS provides SDKs that consist of libraries and sample code for various programming languages and platforms (Java, Ruby, .Net, iOS, Android, etc.). The SDKs provide a convenient way to create programmatic access to AWS KMS and other AWS services. For example, the SDKs take care of tasks such as signing requests (see below), managing errors, and retrying requests automatically. For more information about the AWS SDKs, including how to download and install them, see <a href="http://aws.amazon.com/tools/">Tools for Amazon Web Services</a>.</p></note><p>We recommend that you use the AWS SDKs to make programmatic API calls to AWS KMS.</p><p>Clients must support TLS (Transport Layer Security) 1.0. We recommend TLS 1.2. Clients must also support cipher suites with Perfect Forward Secrecy (PFS) such as Ephemeral Diffie-Hellman (DHE) or Elliptic Curve Ephemeral Diffie-Hellman (ECDHE). Most modern systems such as Java 7 and later support these modes.</p><p><b>Signing Requests</b></p><p>Requests must be signed by using an access key ID and a secret access key. We strongly recommend that you <i>do not</i> use your AWS account (root) access key ID and secret key for everyday work with AWS KMS. Instead, use the access key ID and secret access key for an IAM user, or you can use the AWS Security Token Service to generate temporary security credentials that you can use to sign requests.</p><p>All AWS KMS operations require <a href="http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4</a>.</p><p><b>Logging API Requests</b></p><p>AWS KMS supports AWS CloudTrail, a service that logs AWS API calls and related events for your AWS account and delivers them to an Amazon S3 bucket that you specify. By using the information collected by CloudTrail, you can determine what requests were made to AWS KMS, who made the request, when it was made, and so on. To learn more about CloudTrail, including how to turn it on and find your log files, see the <a href="http://docs.aws.amazon.com/awscloudtrail/latest/userguide/">AWS CloudTrail User Guide</a>.</p><p><b>Additional Resources</b></p><p>For more information about credentials and request signing, see the following:</p><ul><li><p><a href="http://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html">AWS Security Credentials</a> - This topic provides general information about the types of credentials used for accessing AWS.</p></li><li><p><a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html">Temporary Security Credentials</a> - This section of the <i>IAM User Guide</i> describes how to create and use temporary security credentials.</p></li><li><p><a href="http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 Signing Process</a> - This set of topics walks you through the process of signing a request using an access key ID and a secret access key.</p></li></ul><p><b>Commonly Used APIs</b></p><p>Of the APIs discussed in this guide, the following will prove the most useful for most applications. You will likely perform actions other than these, such as creating keys and assigning policies, by using the console.</p><ul><li><p><a>Encrypt</a></p></li><li><p><a>Decrypt</a></p></li><li><p><a>GenerateDataKey</a></p></li><li><p><a>GenerateDataKeyWithoutPlaintext</a></p></li></ul>
 */
@interface AWSKMS : AWSService

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

     let KMS = AWSKMS.default()

 *Objective-C*

     AWSKMS *KMS = [AWSKMS defaultKMS];

 @return The default service client.
 */
+ (instancetype)defaultKMS;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKMS.register(with: configuration!, forKey: "USWest2KMS")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKMS registerKMSWithConfiguration:configuration forKey:@"USWest2KMS"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KMS = AWSKMS(forKey: "USWest2KMS")

 *Objective-C*

     AWSKMS *KMS = [AWSKMS KMSForKey:@"USWest2KMS"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerKMSWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerKMSWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKMS.register(with: configuration!, forKey: "USWest2KMS")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKMS registerKMSWithConfiguration:configuration forKey:@"USWest2KMS"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KMS = AWSKMS(forKey: "USWest2KMS")

 *Objective-C*

     AWSKMS *KMS = [AWSKMS KMSForKey:@"USWest2KMS"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)KMSForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeKMSForKey:(NSString *)key;

/**
 <p>Cancels the deletion of a customer master key (CMK). When this operation is successful, the CMK is set to the <code>Disabled</code> state. To enable a CMK, use <a>EnableKey</a>.</p><p>For more information about scheduling and canceling deletion of a CMK, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html">Deleting Customer Master Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CancelKeyDeletion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSCancelKeyDeletionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSCancelKeyDeletionRequest
 @see AWSKMSCancelKeyDeletionResponse
 */
- (AWSTask<AWSKMSCancelKeyDeletionResponse *> *)cancelKeyDeletion:(AWSKMSCancelKeyDeletionRequest *)request;

/**
 <p>Cancels the deletion of a customer master key (CMK). When this operation is successful, the CMK is set to the <code>Disabled</code> state. To enable a CMK, use <a>EnableKey</a>.</p><p>For more information about scheduling and canceling deletion of a CMK, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html">Deleting Customer Master Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CancelKeyDeletion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSCancelKeyDeletionRequest
 @see AWSKMSCancelKeyDeletionResponse
 */
- (void)cancelKeyDeletion:(AWSKMSCancelKeyDeletionRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSCancelKeyDeletionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a display name for a customer master key. An alias can be used to identify a key and should be unique. The console enforces a one-to-one mapping between the alias and a key. An alias name can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). An alias must start with the word "alias" followed by a forward slash (alias/). An alias that begins with "aws" after the forward slash (alias/aws...) is reserved by Amazon Web Services (AWS).</p><p>The alias and the key it is mapped to must be in the same AWS account and the same region.</p><p>To map an alias to a different key, call <a>UpdateAlias</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorAlreadyExists`, `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidAliasName`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSCreateAliasRequest
 */
- (AWSTask *)createAlias:(AWSKMSCreateAliasRequest *)request;

/**
 <p>Creates a display name for a customer master key. An alias can be used to identify a key and should be unique. The console enforces a one-to-one mapping between the alias and a key. An alias name can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). An alias must start with the word "alias" followed by a forward slash (alias/). An alias that begins with "aws" after the forward slash (alias/aws...) is reserved by Amazon Web Services (AWS).</p><p>The alias and the key it is mapped to must be in the same AWS account and the same region.</p><p>To map an alias to a different key, call <a>UpdateAlias</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorAlreadyExists`, `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidAliasName`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSCreateAliasRequest
 */
- (void)createAlias:(AWSKMSCreateAliasRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds a grant to a key to specify who can use the key and under what conditions. Grants are alternate permission mechanisms to key policies.</p><p>For more information about grants, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/grants.html">Grants</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateGrant service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSCreateGrantResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSCreateGrantRequest
 @see AWSKMSCreateGrantResponse
 */
- (AWSTask<AWSKMSCreateGrantResponse *> *)createGrant:(AWSKMSCreateGrantRequest *)request;

/**
 <p>Adds a grant to a key to specify who can use the key and under what conditions. Grants are alternate permission mechanisms to key policies.</p><p>For more information about grants, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/grants.html">Grants</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateGrant service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSCreateGrantRequest
 @see AWSKMSCreateGrantResponse
 */
- (void)createGrant:(AWSKMSCreateGrantRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSCreateGrantResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a customer master key (CMK).</p><p>You can use a CMK to encrypt small amounts of data (4 KiB or less) directly, but CMKs are more commonly used to encrypt data encryption keys (DEKs), which are used to encrypt raw data. For more information about DEKs and the difference between CMKs and DEKs, see the following:</p><ul><li><p>The <a>GenerateDataKey</a> operation</p></li><li><p><a href="http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html">AWS Key Management Service Concepts</a> in the <i>AWS Key Management Service Developer Guide</i></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSCreateKeyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorMalformedPolicyDocument`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorUnsupportedOperation`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorTag`.
 
 @see AWSKMSCreateKeyRequest
 @see AWSKMSCreateKeyResponse
 */
- (AWSTask<AWSKMSCreateKeyResponse *> *)createKey:(AWSKMSCreateKeyRequest *)request;

/**
 <p>Creates a customer master key (CMK).</p><p>You can use a CMK to encrypt small amounts of data (4 KiB or less) directly, but CMKs are more commonly used to encrypt data encryption keys (DEKs), which are used to encrypt raw data. For more information about DEKs and the difference between CMKs and DEKs, see the following:</p><ul><li><p>The <a>GenerateDataKey</a> operation</p></li><li><p><a href="http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html">AWS Key Management Service Concepts</a> in the <i>AWS Key Management Service Developer Guide</i></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorMalformedPolicyDocument`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorUnsupportedOperation`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorTag`.
 
 @see AWSKMSCreateKeyRequest
 @see AWSKMSCreateKeyResponse
 */
- (void)createKey:(AWSKMSCreateKeyRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSCreateKeyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Decrypts ciphertext. Ciphertext is plaintext that has been previously encrypted by using any of the following functions:</p><ul><li><p><a>GenerateDataKey</a></p></li><li><p><a>GenerateDataKeyWithoutPlaintext</a></p></li><li><p><a>Encrypt</a></p></li></ul><p>Note that if a caller has been granted access permissions to all keys (through, for example, IAM user policies that grant <code>Decrypt</code> permission on all resources), then ciphertext encrypted by using keys in other accounts where the key grants access to the caller can be decrypted. To remedy this, we recommend that you do not grant <code>Decrypt</code> access in an IAM user policy. Instead grant <code>Decrypt</code> access only in key policies. If you must grant <code>Decrypt</code> access in an IAM user policy, you should scope the resource to specific keys or to specific trusted accounts.</p>
 
 @param request A container for the necessary parameters to execute the Decrypt service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSDecryptResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorInvalidCiphertext`, `AWSKMSErrorKeyUnavailable`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSDecryptRequest
 @see AWSKMSDecryptResponse
 */
- (AWSTask<AWSKMSDecryptResponse *> *)decrypt:(AWSKMSDecryptRequest *)request;

/**
 <p>Decrypts ciphertext. Ciphertext is plaintext that has been previously encrypted by using any of the following functions:</p><ul><li><p><a>GenerateDataKey</a></p></li><li><p><a>GenerateDataKeyWithoutPlaintext</a></p></li><li><p><a>Encrypt</a></p></li></ul><p>Note that if a caller has been granted access permissions to all keys (through, for example, IAM user policies that grant <code>Decrypt</code> permission on all resources), then ciphertext encrypted by using keys in other accounts where the key grants access to the caller can be decrypted. To remedy this, we recommend that you do not grant <code>Decrypt</code> access in an IAM user policy. Instead grant <code>Decrypt</code> access only in key policies. If you must grant <code>Decrypt</code> access in an IAM user policy, you should scope the resource to specific keys or to specific trusted accounts.</p>
 
 @param request A container for the necessary parameters to execute the Decrypt service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorInvalidCiphertext`, `AWSKMSErrorKeyUnavailable`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSDecryptRequest
 @see AWSKMSDecryptResponse
 */
- (void)decrypt:(AWSKMSDecryptRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSDecryptResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified alias. To map an alias to a different key, call <a>UpdateAlias</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSDeleteAliasRequest
 */
- (AWSTask *)deleteAlias:(AWSKMSDeleteAliasRequest *)request;

/**
 <p>Deletes the specified alias. To map an alias to a different key, call <a>UpdateAlias</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSDeleteAliasRequest
 */
- (void)deleteAlias:(AWSKMSDeleteAliasRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes key material that you previously imported and makes the specified customer master key (CMK) unusable. For more information about importing key material into AWS KMS, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p><p>When the specified CMK is in the <code>PendingDeletion</code> state, this operation does not change the CMK's state. Otherwise, it changes the CMK's state to <code>PendingImport</code>.</p><p>After you delete key material, you can use <a>ImportKeyMaterial</a> to reimport the same key material into the CMK.</p>
 
 @param request A container for the necessary parameters to execute the DeleteImportedKeyMaterial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorInvalidArn`, `AWSKMSErrorUnsupportedOperation`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSDeleteImportedKeyMaterialRequest
 */
- (AWSTask *)deleteImportedKeyMaterial:(AWSKMSDeleteImportedKeyMaterialRequest *)request;

/**
 <p>Deletes key material that you previously imported and makes the specified customer master key (CMK) unusable. For more information about importing key material into AWS KMS, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p><p>When the specified CMK is in the <code>PendingDeletion</code> state, this operation does not change the CMK's state. Otherwise, it changes the CMK's state to <code>PendingImport</code>.</p><p>After you delete key material, you can use <a>ImportKeyMaterial</a> to reimport the same key material into the CMK.</p>
 
 @param request A container for the necessary parameters to execute the DeleteImportedKeyMaterial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorInvalidArn`, `AWSKMSErrorUnsupportedOperation`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSDeleteImportedKeyMaterialRequest
 */
- (void)deleteImportedKeyMaterial:(AWSKMSDeleteImportedKeyMaterialRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Provides detailed information about the specified customer master key.</p>
 
 @param request A container for the necessary parameters to execute the DescribeKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSDescribeKeyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`.
 
 @see AWSKMSDescribeKeyRequest
 @see AWSKMSDescribeKeyResponse
 */
- (AWSTask<AWSKMSDescribeKeyResponse *> *)describeKey:(AWSKMSDescribeKeyRequest *)request;

/**
 <p>Provides detailed information about the specified customer master key.</p>
 
 @param request A container for the necessary parameters to execute the DescribeKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`.
 
 @see AWSKMSDescribeKeyRequest
 @see AWSKMSDescribeKeyResponse
 */
- (void)describeKey:(AWSKMSDescribeKeyRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSDescribeKeyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the state of a customer master key (CMK) to disabled, thereby preventing its use for cryptographic operations. For more information about how key state affects the use of a CMK, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How Key State Affects the Use of a Customer Master Key</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisableKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSDisableKeyRequest
 */
- (AWSTask *)disableKey:(AWSKMSDisableKeyRequest *)request;

/**
 <p>Sets the state of a customer master key (CMK) to disabled, thereby preventing its use for cryptographic operations. For more information about how key state affects the use of a CMK, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How Key State Affects the Use of a Customer Master Key</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisableKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSDisableKeyRequest
 */
- (void)disableKey:(AWSKMSDisableKeyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disables rotation of the specified key.</p>
 
 @param request A container for the necessary parameters to execute the DisableKeyRotation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorUnsupportedOperation`.
 
 @see AWSKMSDisableKeyRotationRequest
 */
- (AWSTask *)disableKeyRotation:(AWSKMSDisableKeyRotationRequest *)request;

/**
 <p>Disables rotation of the specified key.</p>
 
 @param request A container for the necessary parameters to execute the DisableKeyRotation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorUnsupportedOperation`.
 
 @see AWSKMSDisableKeyRotationRequest
 */
- (void)disableKeyRotation:(AWSKMSDisableKeyRotationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Marks a key as enabled, thereby permitting its use.</p>
 
 @param request A container for the necessary parameters to execute the EnableKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSEnableKeyRequest
 */
- (AWSTask *)enableKey:(AWSKMSEnableKeyRequest *)request;

/**
 <p>Marks a key as enabled, thereby permitting its use.</p>
 
 @param request A container for the necessary parameters to execute the EnableKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSEnableKeyRequest
 */
- (void)enableKey:(AWSKMSEnableKeyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables rotation of the specified customer master key.</p>
 
 @param request A container for the necessary parameters to execute the EnableKeyRotation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorUnsupportedOperation`.
 
 @see AWSKMSEnableKeyRotationRequest
 */
- (AWSTask *)enableKeyRotation:(AWSKMSEnableKeyRotationRequest *)request;

/**
 <p>Enables rotation of the specified customer master key.</p>
 
 @param request A container for the necessary parameters to execute the EnableKeyRotation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorUnsupportedOperation`.
 
 @see AWSKMSEnableKeyRotationRequest
 */
- (void)enableKeyRotation:(AWSKMSEnableKeyRotationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Encrypts plaintext into ciphertext by using a customer master key. The <code>Encrypt</code> function has two primary use cases:</p><ul><li><p>You can encrypt up to 4 KB of arbitrary data such as an RSA key, a database password, or other sensitive customer information.</p></li><li><p>If you are moving encrypted data from one region to another, you can use this API to encrypt in the new region the plaintext data key that was used to encrypt the data in the original region. This provides you with an encrypted copy of the data key that can be decrypted in the new region and used there to decrypt the encrypted data.</p></li></ul><p>Unless you are moving encrypted data from one region to another, you don't use this function to encrypt a generated data key within a region. You retrieve data keys already encrypted by calling the <a>GenerateDataKey</a> or <a>GenerateDataKeyWithoutPlaintext</a> function. Data keys don't need to be encrypted again by calling <code>Encrypt</code>.</p><p>If you want to encrypt data locally in your application, you can use the <code>GenerateDataKey</code> function to return a plaintext data encryption key and a copy of the key encrypted under the customer master key (CMK) of your choosing.</p>
 
 @param request A container for the necessary parameters to execute the Encrypt service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSEncryptResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorKeyUnavailable`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidKeyUsage`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSEncryptRequest
 @see AWSKMSEncryptResponse
 */
- (AWSTask<AWSKMSEncryptResponse *> *)encrypt:(AWSKMSEncryptRequest *)request;

/**
 <p>Encrypts plaintext into ciphertext by using a customer master key. The <code>Encrypt</code> function has two primary use cases:</p><ul><li><p>You can encrypt up to 4 KB of arbitrary data such as an RSA key, a database password, or other sensitive customer information.</p></li><li><p>If you are moving encrypted data from one region to another, you can use this API to encrypt in the new region the plaintext data key that was used to encrypt the data in the original region. This provides you with an encrypted copy of the data key that can be decrypted in the new region and used there to decrypt the encrypted data.</p></li></ul><p>Unless you are moving encrypted data from one region to another, you don't use this function to encrypt a generated data key within a region. You retrieve data keys already encrypted by calling the <a>GenerateDataKey</a> or <a>GenerateDataKeyWithoutPlaintext</a> function. Data keys don't need to be encrypted again by calling <code>Encrypt</code>.</p><p>If you want to encrypt data locally in your application, you can use the <code>GenerateDataKey</code> function to return a plaintext data encryption key and a copy of the key encrypted under the customer master key (CMK) of your choosing.</p>
 
 @param request A container for the necessary parameters to execute the Encrypt service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorKeyUnavailable`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidKeyUsage`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSEncryptRequest
 @see AWSKMSEncryptResponse
 */
- (void)encrypt:(AWSKMSEncryptRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSEncryptResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a data encryption key that you can use in your application to encrypt data locally.</p><p>You must specify the customer master key (CMK) under which to generate the data key. You must also specify the length of the data key using either the <code>KeySpec</code> or <code>NumberOfBytes</code> field. You must specify one field or the other, but not both. For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use <code>KeySpec</code>.</p><p>This operation returns a plaintext copy of the data key in the <code>Plaintext</code> field of the response, and an encrypted copy of the data key in the <code>CiphertextBlob</code> field. The data key is encrypted under the CMK specified in the <code>KeyId</code> field of the request.</p><p>We recommend that you use the following pattern to encrypt data locally in your application:</p><ol><li><p>Use this operation (<code>GenerateDataKey</code>) to retrieve a data encryption key.</p></li><li><p>Use the plaintext data encryption key (returned in the <code>Plaintext</code> field of the response) to encrypt data locally, then erase the plaintext data key from memory.</p></li><li><p>Store the encrypted data key (returned in the <code>CiphertextBlob</code> field of the response) alongside the locally encrypted data.</p></li></ol><p>To decrypt data locally:</p><ol><li><p>Use the <a>Decrypt</a> operation to decrypt the encrypted data key into a plaintext copy of the data key.</p></li><li><p>Use the plaintext data key to decrypt data locally, then erase the plaintext data key from memory.</p></li></ol><p>To return only an encrypted copy of the data key, use <a>GenerateDataKeyWithoutPlaintext</a>. To return an arbitrary unpredictable byte string, use <a>GenerateRandom</a>.</p><p>If you use the optional <code>EncryptionContext</code> field, you must store at least enough information to be able to reconstruct the full encryption context when you later send the ciphertext to the <a>Decrypt</a> operation. It is a good practice to choose an encryption context that you can reconstruct on the fly to better secure the ciphertext. For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html">Encryption Context</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GenerateDataKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSGenerateDataKeyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorKeyUnavailable`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidKeyUsage`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSGenerateDataKeyRequest
 @see AWSKMSGenerateDataKeyResponse
 */
- (AWSTask<AWSKMSGenerateDataKeyResponse *> *)generateDataKey:(AWSKMSGenerateDataKeyRequest *)request;

/**
 <p>Returns a data encryption key that you can use in your application to encrypt data locally.</p><p>You must specify the customer master key (CMK) under which to generate the data key. You must also specify the length of the data key using either the <code>KeySpec</code> or <code>NumberOfBytes</code> field. You must specify one field or the other, but not both. For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use <code>KeySpec</code>.</p><p>This operation returns a plaintext copy of the data key in the <code>Plaintext</code> field of the response, and an encrypted copy of the data key in the <code>CiphertextBlob</code> field. The data key is encrypted under the CMK specified in the <code>KeyId</code> field of the request.</p><p>We recommend that you use the following pattern to encrypt data locally in your application:</p><ol><li><p>Use this operation (<code>GenerateDataKey</code>) to retrieve a data encryption key.</p></li><li><p>Use the plaintext data encryption key (returned in the <code>Plaintext</code> field of the response) to encrypt data locally, then erase the plaintext data key from memory.</p></li><li><p>Store the encrypted data key (returned in the <code>CiphertextBlob</code> field of the response) alongside the locally encrypted data.</p></li></ol><p>To decrypt data locally:</p><ol><li><p>Use the <a>Decrypt</a> operation to decrypt the encrypted data key into a plaintext copy of the data key.</p></li><li><p>Use the plaintext data key to decrypt data locally, then erase the plaintext data key from memory.</p></li></ol><p>To return only an encrypted copy of the data key, use <a>GenerateDataKeyWithoutPlaintext</a>. To return an arbitrary unpredictable byte string, use <a>GenerateRandom</a>.</p><p>If you use the optional <code>EncryptionContext</code> field, you must store at least enough information to be able to reconstruct the full encryption context when you later send the ciphertext to the <a>Decrypt</a> operation. It is a good practice to choose an encryption context that you can reconstruct on the fly to better secure the ciphertext. For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html">Encryption Context</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GenerateDataKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorKeyUnavailable`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidKeyUsage`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSGenerateDataKeyRequest
 @see AWSKMSGenerateDataKeyResponse
 */
- (void)generateDataKey:(AWSKMSGenerateDataKeyRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSGenerateDataKeyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a data encryption key encrypted under a customer master key (CMK). This operation is identical to <a>GenerateDataKey</a> but returns only the encrypted copy of the data key.</p><p>This operation is useful in a system that has multiple components with different degrees of trust. For example, consider a system that stores encrypted data in containers. Each container stores the encrypted data and an encrypted copy of the data key. One component of the system, called the <i>control plane</i>, creates new containers. When it creates a new container, it uses this operation (<code>GenerateDataKeyWithoutPlaintext</code>) to get an encrypted data key and then stores it in the container. Later, a different component of the system, called the <i>data plane</i>, puts encrypted data into the containers. To do this, it passes the encrypted data key to the <a>Decrypt</a> operation, then uses the returned plaintext data key to encrypt data, and finally stores the encrypted data in the container. In this system, the control plane never sees the plaintext data key.</p>
 
 @param request A container for the necessary parameters to execute the GenerateDataKeyWithoutPlaintext service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSGenerateDataKeyWithoutPlaintextResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorKeyUnavailable`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidKeyUsage`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSGenerateDataKeyWithoutPlaintextRequest
 @see AWSKMSGenerateDataKeyWithoutPlaintextResponse
 */
- (AWSTask<AWSKMSGenerateDataKeyWithoutPlaintextResponse *> *)generateDataKeyWithoutPlaintext:(AWSKMSGenerateDataKeyWithoutPlaintextRequest *)request;

/**
 <p>Returns a data encryption key encrypted under a customer master key (CMK). This operation is identical to <a>GenerateDataKey</a> but returns only the encrypted copy of the data key.</p><p>This operation is useful in a system that has multiple components with different degrees of trust. For example, consider a system that stores encrypted data in containers. Each container stores the encrypted data and an encrypted copy of the data key. One component of the system, called the <i>control plane</i>, creates new containers. When it creates a new container, it uses this operation (<code>GenerateDataKeyWithoutPlaintext</code>) to get an encrypted data key and then stores it in the container. Later, a different component of the system, called the <i>data plane</i>, puts encrypted data into the containers. To do this, it passes the encrypted data key to the <a>Decrypt</a> operation, then uses the returned plaintext data key to encrypt data, and finally stores the encrypted data in the container. In this system, the control plane never sees the plaintext data key.</p>
 
 @param request A container for the necessary parameters to execute the GenerateDataKeyWithoutPlaintext service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorKeyUnavailable`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidKeyUsage`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSGenerateDataKeyWithoutPlaintextRequest
 @see AWSKMSGenerateDataKeyWithoutPlaintextResponse
 */
- (void)generateDataKeyWithoutPlaintext:(AWSKMSGenerateDataKeyWithoutPlaintextRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSGenerateDataKeyWithoutPlaintextResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates an unpredictable byte string.</p>
 
 @param request A container for the necessary parameters to execute the GenerateRandom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSGenerateRandomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`.
 
 @see AWSKMSGenerateRandomRequest
 @see AWSKMSGenerateRandomResponse
 */
- (AWSTask<AWSKMSGenerateRandomResponse *> *)generateRandom:(AWSKMSGenerateRandomRequest *)request;

/**
 <p>Generates an unpredictable byte string.</p>
 
 @param request A container for the necessary parameters to execute the GenerateRandom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`.
 
 @see AWSKMSGenerateRandomRequest
 @see AWSKMSGenerateRandomResponse
 */
- (void)generateRandom:(AWSKMSGenerateRandomRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSGenerateRandomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a policy attached to the specified key.</p>
 
 @param request A container for the necessary parameters to execute the GetKeyPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSGetKeyPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSGetKeyPolicyRequest
 @see AWSKMSGetKeyPolicyResponse
 */
- (AWSTask<AWSKMSGetKeyPolicyResponse *> *)getKeyPolicy:(AWSKMSGetKeyPolicyRequest *)request;

/**
 <p>Retrieves a policy attached to the specified key.</p>
 
 @param request A container for the necessary parameters to execute the GetKeyPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSGetKeyPolicyRequest
 @see AWSKMSGetKeyPolicyResponse
 */
- (void)getKeyPolicy:(AWSKMSGetKeyPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSGetKeyPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a Boolean value that indicates whether key rotation is enabled for the specified key.</p>
 
 @param request A container for the necessary parameters to execute the GetKeyRotationStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSGetKeyRotationStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorUnsupportedOperation`.
 
 @see AWSKMSGetKeyRotationStatusRequest
 @see AWSKMSGetKeyRotationStatusResponse
 */
- (AWSTask<AWSKMSGetKeyRotationStatusResponse *> *)getKeyRotationStatus:(AWSKMSGetKeyRotationStatusRequest *)request;

/**
 <p>Retrieves a Boolean value that indicates whether key rotation is enabled for the specified key.</p>
 
 @param request A container for the necessary parameters to execute the GetKeyRotationStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorUnsupportedOperation`.
 
 @see AWSKMSGetKeyRotationStatusRequest
 @see AWSKMSGetKeyRotationStatusResponse
 */
- (void)getKeyRotationStatus:(AWSKMSGetKeyRotationStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSGetKeyRotationStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the items you need in order to import key material into AWS KMS from your existing key management infrastructure. For more information about importing key material into AWS KMS, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p><p>You must specify the key ID of the customer master key (CMK) into which you will import key material. This CMK's <code>Origin</code> must be <code>EXTERNAL</code>. You must also specify the wrapping algorithm and type of wrapping key (public key) that you will use to encrypt the key material.</p><p>This operation returns a public key and an import token. Use the public key to encrypt the key material. Store the import token to send with a subsequent <a>ImportKeyMaterial</a> request. The public key and import token from the same response must be used together. These items are valid for 24 hours, after which they cannot be used for a subsequent <a>ImportKeyMaterial</a> request. To retrieve new ones, send another <code>GetParametersForImport</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetParametersForImport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSGetParametersForImportResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorInvalidArn`, `AWSKMSErrorUnsupportedOperation`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSGetParametersForImportRequest
 @see AWSKMSGetParametersForImportResponse
 */
- (AWSTask<AWSKMSGetParametersForImportResponse *> *)getParametersForImport:(AWSKMSGetParametersForImportRequest *)request;

/**
 <p>Returns the items you need in order to import key material into AWS KMS from your existing key management infrastructure. For more information about importing key material into AWS KMS, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p><p>You must specify the key ID of the customer master key (CMK) into which you will import key material. This CMK's <code>Origin</code> must be <code>EXTERNAL</code>. You must also specify the wrapping algorithm and type of wrapping key (public key) that you will use to encrypt the key material.</p><p>This operation returns a public key and an import token. Use the public key to encrypt the key material. Store the import token to send with a subsequent <a>ImportKeyMaterial</a> request. The public key and import token from the same response must be used together. These items are valid for 24 hours, after which they cannot be used for a subsequent <a>ImportKeyMaterial</a> request. To retrieve new ones, send another <code>GetParametersForImport</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetParametersForImport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorInvalidArn`, `AWSKMSErrorUnsupportedOperation`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSGetParametersForImportRequest
 @see AWSKMSGetParametersForImportResponse
 */
- (void)getParametersForImport:(AWSKMSGetParametersForImportRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSGetParametersForImportResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports key material into an AWS KMS customer master key (CMK) from your existing key management infrastructure. For more information about importing key material into AWS KMS, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p><p>You must specify the key ID of the CMK to import the key material into. This CMK's <code>Origin</code> must be <code>EXTERNAL</code>. You must also send an import token and the encrypted key material. Send the import token that you received in the same <a>GetParametersForImport</a> response that contained the public key that you used to encrypt the key material. You must also specify whether the key material expires and if so, when. When the key material expires, AWS KMS deletes the key material and the CMK becomes unusable. To use the CMK again, you can reimport the same key material. If you set an expiration date, you can change it only by reimporting the same key material and specifying a new expiration date.</p><p>When this operation is successful, the specified CMK's key state changes to <code>Enabled</code>, and you can use the CMK.</p><p>After you successfully import key material into a CMK, you can reimport the same key material into that CMK, but you cannot import different key material.</p>
 
 @param request A container for the necessary parameters to execute the ImportKeyMaterial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSImportKeyMaterialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorInvalidArn`, `AWSKMSErrorUnsupportedOperation`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorInvalidCiphertext`, `AWSKMSErrorIncorrectKeyMaterial`, `AWSKMSErrorExpiredImportToken`, `AWSKMSErrorInvalidImportToken`.
 
 @see AWSKMSImportKeyMaterialRequest
 @see AWSKMSImportKeyMaterialResponse
 */
- (AWSTask<AWSKMSImportKeyMaterialResponse *> *)importKeyMaterial:(AWSKMSImportKeyMaterialRequest *)request;

/**
 <p>Imports key material into an AWS KMS customer master key (CMK) from your existing key management infrastructure. For more information about importing key material into AWS KMS, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p><p>You must specify the key ID of the CMK to import the key material into. This CMK's <code>Origin</code> must be <code>EXTERNAL</code>. You must also send an import token and the encrypted key material. Send the import token that you received in the same <a>GetParametersForImport</a> response that contained the public key that you used to encrypt the key material. You must also specify whether the key material expires and if so, when. When the key material expires, AWS KMS deletes the key material and the CMK becomes unusable. To use the CMK again, you can reimport the same key material. If you set an expiration date, you can change it only by reimporting the same key material and specifying a new expiration date.</p><p>When this operation is successful, the specified CMK's key state changes to <code>Enabled</code>, and you can use the CMK.</p><p>After you successfully import key material into a CMK, you can reimport the same key material into that CMK, but you cannot import different key material.</p>
 
 @param request A container for the necessary parameters to execute the ImportKeyMaterial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorInvalidArn`, `AWSKMSErrorUnsupportedOperation`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorInvalidCiphertext`, `AWSKMSErrorIncorrectKeyMaterial`, `AWSKMSErrorExpiredImportToken`, `AWSKMSErrorInvalidImportToken`.
 
 @see AWSKMSImportKeyMaterialRequest
 @see AWSKMSImportKeyMaterialResponse
 */
- (void)importKeyMaterial:(AWSKMSImportKeyMaterialRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSImportKeyMaterialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the key aliases in the account.</p>
 
 @param request A container for the necessary parameters to execute the ListAliases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSListAliasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidMarker`, `AWSKMSErrorKMSInternal`.
 
 @see AWSKMSListAliasesRequest
 @see AWSKMSListAliasesResponse
 */
- (AWSTask<AWSKMSListAliasesResponse *> *)listAliases:(AWSKMSListAliasesRequest *)request;

/**
 <p>Lists all of the key aliases in the account.</p>
 
 @param request A container for the necessary parameters to execute the ListAliases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidMarker`, `AWSKMSErrorKMSInternal`.
 
 @see AWSKMSListAliasesRequest
 @see AWSKMSListAliasesResponse
 */
- (void)listAliases:(AWSKMSListAliasesRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSListAliasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the grants for a specified key.</p>
 
 @param request A container for the necessary parameters to execute the ListGrants service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSListGrantsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidMarker`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSListGrantsRequest
 @see AWSKMSListGrantsResponse
 */
- (AWSTask<AWSKMSListGrantsResponse *> *)listGrants:(AWSKMSListGrantsRequest *)request;

/**
 <p>List the grants for a specified key.</p>
 
 @param request A container for the necessary parameters to execute the ListGrants service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidMarker`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSListGrantsRequest
 @see AWSKMSListGrantsResponse
 */
- (void)listGrants:(AWSKMSListGrantsRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSListGrantsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of policies attached to a key.</p>
 
 @param request A container for the necessary parameters to execute the ListKeyPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSListKeyPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSListKeyPoliciesRequest
 @see AWSKMSListKeyPoliciesResponse
 */
- (AWSTask<AWSKMSListKeyPoliciesResponse *> *)listKeyPolicies:(AWSKMSListKeyPoliciesRequest *)request;

/**
 <p>Retrieves a list of policies attached to a key.</p>
 
 @param request A container for the necessary parameters to execute the ListKeyPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSListKeyPoliciesRequest
 @see AWSKMSListKeyPoliciesResponse
 */
- (void)listKeyPolicies:(AWSKMSListKeyPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSListKeyPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the customer master keys.</p>
 
 @param request A container for the necessary parameters to execute the ListKeys service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSListKeysResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorInvalidMarker`.
 
 @see AWSKMSListKeysRequest
 @see AWSKMSListKeysResponse
 */
- (AWSTask<AWSKMSListKeysResponse *> *)listKeys:(AWSKMSListKeysRequest *)request;

/**
 <p>Lists the customer master keys.</p>
 
 @param request A container for the necessary parameters to execute the ListKeys service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorInvalidMarker`.
 
 @see AWSKMSListKeysRequest
 @see AWSKMSListKeysResponse
 */
- (void)listKeys:(AWSKMSListKeysRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSListKeysResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of all tags for the specified customer master key (CMK).</p>
 
 @param request A container for the necessary parameters to execute the ListResourceTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSListResourceTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorKMSInternal`, `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorInvalidMarker`.
 
 @see AWSKMSListResourceTagsRequest
 @see AWSKMSListResourceTagsResponse
 */
- (AWSTask<AWSKMSListResourceTagsResponse *> *)listResourceTags:(AWSKMSListResourceTagsRequest *)request;

/**
 <p>Returns a list of all tags for the specified customer master key (CMK).</p>
 
 @param request A container for the necessary parameters to execute the ListResourceTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorKMSInternal`, `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorInvalidMarker`.
 
 @see AWSKMSListResourceTagsRequest
 @see AWSKMSListResourceTagsResponse
 */
- (void)listResourceTags:(AWSKMSListResourceTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSListResourceTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of all grants for which the grant's <code>RetiringPrincipal</code> matches the one specified.</p><p>A typical use is to list all grants that you are able to retire. To retire a grant, use <a>RetireGrant</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListRetirableGrants service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSListGrantsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidMarker`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`.
 
 @see AWSKMSListRetirableGrantsRequest
 @see AWSKMSListGrantsResponse
 */
- (AWSTask<AWSKMSListGrantsResponse *> *)listRetirableGrants:(AWSKMSListRetirableGrantsRequest *)request;

/**
 <p>Returns a list of all grants for which the grant's <code>RetiringPrincipal</code> matches the one specified.</p><p>A typical use is to list all grants that you are able to retire. To retire a grant, use <a>RetireGrant</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListRetirableGrants service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidMarker`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`.
 
 @see AWSKMSListRetirableGrantsRequest
 @see AWSKMSListGrantsResponse
 */
- (void)listRetirableGrants:(AWSKMSListRetirableGrantsRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSListGrantsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches a key policy to the specified customer master key (CMK).</p><p>For more information about key policies, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">Key Policies</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutKeyPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorMalformedPolicyDocument`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorUnsupportedOperation`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSPutKeyPolicyRequest
 */
- (AWSTask *)putKeyPolicy:(AWSKMSPutKeyPolicyRequest *)request;

/**
 <p>Attaches a key policy to the specified customer master key (CMK).</p><p>For more information about key policies, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">Key Policies</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutKeyPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorMalformedPolicyDocument`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorUnsupportedOperation`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSPutKeyPolicyRequest
 */
- (void)putKeyPolicy:(AWSKMSPutKeyPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Encrypts data on the server side with a new customer master key (CMK) without exposing the plaintext of the data on the client side. The data is first decrypted and then reencrypted. You can also use this operation to change the encryption context of a ciphertext.</p><p>Unlike other operations, <code>ReEncrypt</code> is authorized twice, once as <code>ReEncryptFrom</code> on the source CMK and once as <code>ReEncryptTo</code> on the destination CMK. We recommend that you include the <code>"kms:ReEncrypt*"</code> permission in your <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">key policies</a> to permit reencryption from or to the CMK. This permission is automatically included in the key policy when you create a CMK through the console, but you must include it manually when you create a CMK programmatically or when you set a key policy with the <a>PutKeyPolicy</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the ReEncrypt service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSReEncryptResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorInvalidCiphertext`, `AWSKMSErrorKeyUnavailable`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidKeyUsage`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSReEncryptRequest
 @see AWSKMSReEncryptResponse
 */
- (AWSTask<AWSKMSReEncryptResponse *> *)reEncrypt:(AWSKMSReEncryptRequest *)request;

/**
 <p>Encrypts data on the server side with a new customer master key (CMK) without exposing the plaintext of the data on the client side. The data is first decrypted and then reencrypted. You can also use this operation to change the encryption context of a ciphertext.</p><p>Unlike other operations, <code>ReEncrypt</code> is authorized twice, once as <code>ReEncryptFrom</code> on the source CMK and once as <code>ReEncryptTo</code> on the destination CMK. We recommend that you include the <code>"kms:ReEncrypt*"</code> permission in your <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">key policies</a> to permit reencryption from or to the CMK. This permission is automatically included in the key policy when you create a CMK through the console, but you must include it manually when you create a CMK programmatically or when you set a key policy with the <a>PutKeyPolicy</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the ReEncrypt service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDisabled`, `AWSKMSErrorInvalidCiphertext`, `AWSKMSErrorKeyUnavailable`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidKeyUsage`, `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSReEncryptRequest
 @see AWSKMSReEncryptResponse
 */
- (void)reEncrypt:(AWSKMSReEncryptRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSReEncryptResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retires a grant. To clean up, you can retire a grant when you're done using it. You should revoke a grant when you intend to actively deny operations that depend on it. The following are permitted to call this API:</p><ul><li><p>The AWS account (root user) under which the grant was created</p></li><li><p>The <code>RetiringPrincipal</code>, if present in the grant</p></li><li><p>The <code>GranteePrincipal</code>, if <code>RetireGrant</code> is an operation specified in the grant</p></li></ul><p>You must identify the grant to retire by its grant token or by a combination of the grant ID and the Amazon Resource Name (ARN) of the customer master key (CMK). A grant token is a unique variable-length base64-encoded string. A grant ID is a 64 character unique identifier of a grant. The <a>CreateGrant</a> operation returns both.</p>
 
 @param request A container for the necessary parameters to execute the RetireGrant service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorInvalidGrantId`, `AWSKMSErrorNotFound`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSRetireGrantRequest
 */
- (AWSTask *)retireGrant:(AWSKMSRetireGrantRequest *)request;

/**
 <p>Retires a grant. To clean up, you can retire a grant when you're done using it. You should revoke a grant when you intend to actively deny operations that depend on it. The following are permitted to call this API:</p><ul><li><p>The AWS account (root user) under which the grant was created</p></li><li><p>The <code>RetiringPrincipal</code>, if present in the grant</p></li><li><p>The <code>GranteePrincipal</code>, if <code>RetireGrant</code> is an operation specified in the grant</p></li></ul><p>You must identify the grant to retire by its grant token or by a combination of the grant ID and the Amazon Resource Name (ARN) of the customer master key (CMK). A grant token is a unique variable-length base64-encoded string. A grant ID is a 64 character unique identifier of a grant. The <a>CreateGrant</a> operation returns both.</p>
 
 @param request A container for the necessary parameters to execute the RetireGrant service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorInvalidGrantToken`, `AWSKMSErrorInvalidGrantId`, `AWSKMSErrorNotFound`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSRetireGrantRequest
 */
- (void)retireGrant:(AWSKMSRetireGrantRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Revokes a grant. You can revoke a grant to actively deny operations that depend on it.</p>
 
 @param request A container for the necessary parameters to execute the RevokeGrant service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorInvalidGrantId`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSRevokeGrantRequest
 */
- (AWSTask *)revokeGrant:(AWSKMSRevokeGrantRequest *)request;

/**
 <p>Revokes a grant. You can revoke a grant to actively deny operations that depend on it.</p>
 
 @param request A container for the necessary parameters to execute the RevokeGrant service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorInvalidGrantId`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSRevokeGrantRequest
 */
- (void)revokeGrant:(AWSKMSRevokeGrantRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Schedules the deletion of a customer master key (CMK). You may provide a waiting period, specified in days, before deletion occurs. If you do not provide a waiting period, the default period of 30 days is used. When this operation is successful, the state of the CMK changes to <code>PendingDeletion</code>. Before the waiting period ends, you can use <a>CancelKeyDeletion</a> to cancel the deletion of the CMK. After the waiting period ends, AWS KMS deletes the CMK and all AWS KMS data associated with it, including all aliases that refer to it.</p><important><p>Deleting a CMK is a destructive and potentially dangerous operation. When a CMK is deleted, all data that was encrypted under the CMK is rendered unrecoverable. To restrict the use of a CMK without deleting it, use <a>DisableKey</a>.</p></important><p>For more information about scheduling a CMK for deletion, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html">Deleting Customer Master Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ScheduleKeyDeletion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKMSScheduleKeyDeletionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSScheduleKeyDeletionRequest
 @see AWSKMSScheduleKeyDeletionResponse
 */
- (AWSTask<AWSKMSScheduleKeyDeletionResponse *> *)scheduleKeyDeletion:(AWSKMSScheduleKeyDeletionRequest *)request;

/**
 <p>Schedules the deletion of a customer master key (CMK). You may provide a waiting period, specified in days, before deletion occurs. If you do not provide a waiting period, the default period of 30 days is used. When this operation is successful, the state of the CMK changes to <code>PendingDeletion</code>. Before the waiting period ends, you can use <a>CancelKeyDeletion</a> to cancel the deletion of the CMK. After the waiting period ends, AWS KMS deletes the CMK and all AWS KMS data associated with it, including all aliases that refer to it.</p><important><p>Deleting a CMK is a destructive and potentially dangerous operation. When a CMK is deleted, all data that was encrypted under the CMK is rendered unrecoverable. To restrict the use of a CMK without deleting it, use <a>DisableKey</a>.</p></important><p>For more information about scheduling a CMK for deletion, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html">Deleting Customer Master Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ScheduleKeyDeletion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSScheduleKeyDeletionRequest
 @see AWSKMSScheduleKeyDeletionResponse
 */
- (void)scheduleKeyDeletion:(AWSKMSScheduleKeyDeletionRequest *)request completionHandler:(void (^ _Nullable)(AWSKMSScheduleKeyDeletionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or overwrites one or more tags for the specified customer master key (CMK). </p><p>Each tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.</p><p>You cannot use the same tag key more than once per CMK. For example, consider a CMK with one tag whose tag key is <code>Purpose</code> and tag value is <code>Test</code>. If you send a <code>TagResource</code> request for this CMK with a tag key of <code>Purpose</code> and a tag value of <code>Prod</code>, it does not create a second tag. Instead, the original tag is overwritten with the new tag value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorKMSInternal`, `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorTag`.
 
 @see AWSKMSTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSKMSTagResourceRequest *)request;

/**
 <p>Adds or overwrites one or more tags for the specified customer master key (CMK). </p><p>Each tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.</p><p>You cannot use the same tag key more than once per CMK. For example, consider a CMK with one tag whose tag key is <code>Purpose</code> and tag value is <code>Test</code>. If you send a <code>TagResource</code> request for this CMK with a tag key of <code>Purpose</code> and a tag value of <code>Prod</code>, it does not create a second tag. Instead, the original tag is overwritten with the new tag value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorKMSInternal`, `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorLimitExceeded`, `AWSKMSErrorTag`.
 
 @see AWSKMSTagResourceRequest
 */
- (void)tagResource:(AWSKMSTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tag or tags from the specified customer master key (CMK). </p><p>To remove a tag, you specify the tag key for each tag to remove. You do not specify the tag value. To overwrite the tag value for an existing tag, use <a>TagResource</a>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorKMSInternal`, `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorTag`.
 
 @see AWSKMSUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSKMSUntagResourceRequest *)request;

/**
 <p>Removes the specified tag or tags from the specified customer master key (CMK). </p><p>To remove a tag, you specify the tag key for each tag to remove. You do not specify the tag value. To overwrite the tag value for an existing tag, use <a>TagResource</a>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorKMSInternal`, `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorKMSInvalidState`, `AWSKMSErrorTag`.
 
 @see AWSKMSUntagResourceRequest
 */
- (void)untagResource:(AWSKMSUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates an alias to map it to a different key.</p><p>An alias is not a property of a key. Therefore, an alias can be mapped to and unmapped from an existing key without changing the properties of the key.</p><p>An alias name can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). An alias must start with the word "alias" followed by a forward slash (alias/). An alias that begins with "aws" after the forward slash (alias/aws...) is reserved by Amazon Web Services (AWS).</p><p>The alias and the key it is mapped to must be in the same AWS account and the same region.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSUpdateAliasRequest
 */
- (AWSTask *)updateAlias:(AWSKMSUpdateAliasRequest *)request;

/**
 <p>Updates an alias to map it to a different key.</p><p>An alias is not a property of a key. Therefore, an alias can be mapped to and unmapped from an existing key without changing the properties of the key.</p><p>An alias name can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). An alias must start with the word "alias" followed by a forward slash (alias/). An alias that begins with "aws" after the forward slash (alias/aws...) is reserved by Amazon Web Services (AWS).</p><p>The alias and the key it is mapped to must be in the same AWS account and the same region.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorNotFound`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSUpdateAliasRequest
 */
- (void)updateAlias:(AWSKMSUpdateAliasRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the description of a customer master key (CMK).</p>
 
 @param request A container for the necessary parameters to execute the UpdateKeyDescription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSUpdateKeyDescriptionRequest
 */
- (AWSTask *)updateKeyDescription:(AWSKMSUpdateKeyDescriptionRequest *)request;

/**
 <p>Updates the description of a customer master key (CMK).</p>
 
 @param request A container for the necessary parameters to execute the UpdateKeyDescription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKMSErrorDomain` domain and the following error code: `AWSKMSErrorNotFound`, `AWSKMSErrorInvalidArn`, `AWSKMSErrorDependencyTimeout`, `AWSKMSErrorKMSInternal`, `AWSKMSErrorKMSInvalidState`.
 
 @see AWSKMSUpdateKeyDescriptionRequest
 */
- (void)updateKeyDescription:(AWSKMSUpdateKeyDescriptionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
