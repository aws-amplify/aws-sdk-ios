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
#import <AWSCore/AWSCore.h>
#import "AWSIoTModel.h"
#import "AWSIoTResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>AWS IoT</fullname><p>AWS IoT provides secure, bi-directional communication between Internet-connected things (such as sensors, actuators, embedded devices, or smart appliances) and the AWS cloud. You can discover your custom IoT-Data endpoint to communicate with, configure rules for data processing and integration with other services, organize resources associated with each thing (Thing Registry), configure logging, and create and manage policies and credentials to authenticate things.</p><p>For more information about how AWS IoT works, see the <a href="http://docs.aws.amazon.com/iot/latest/developerguide/aws-iot-how-it-works.html">Developer Guide</a>.</p>
 */
@interface AWSIoT : AWSService

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

     let IoT = AWSIoT.defaultIoT()

 *Objective-C*

     AWSIoT *IoT = [AWSIoT defaultIoT];

 @return The default service client.
 */
+ (instancetype)defaultIoT;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSIoT.registerIoTWithConfiguration(configuration, forKey: "USWest2IoT")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSIoT registerIoTWithConfiguration:configuration forKey:@"USWest2IoT"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let IoT = AWSIoT(forKey: "USWest2IoT")

 *Objective-C*

     AWSIoT *IoT = [AWSIoT IoTForKey:@"USWest2IoT"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerIoTWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerIoTWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSIoT.registerIoTWithConfiguration(configuration, forKey: "USWest2IoT")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSIoT registerIoTWithConfiguration:configuration forKey:@"USWest2IoT"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let IoT = AWSIoT(forKey: "USWest2IoT")

 *Objective-C*

     AWSIoT *IoT = [AWSIoT IoTForKey:@"USWest2IoT"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)IoTForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeIoTForKey:(NSString *)key;

/**
 <p>Accepts a pending certificate transfer. The default state of the certificate is INACTIVE.</p><p>To check for pending certificate transfers, call <a>ListCertificates</a> to enumerate your certificates.</p>
 
 @param request A container for the necessary parameters to execute the AcceptCertificateTransfer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorTransferAlreadyCompleted`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTAcceptCertificateTransferRequest
 */
- (AWSTask *)acceptCertificateTransfer:(AWSIoTAcceptCertificateTransferRequest *)request;

/**
 <p>Accepts a pending certificate transfer. The default state of the certificate is INACTIVE.</p><p>To check for pending certificate transfers, call <a>ListCertificates</a> to enumerate your certificates.</p>
 
 @param request A container for the necessary parameters to execute the AcceptCertificateTransfer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorTransferAlreadyCompleted`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTAcceptCertificateTransferRequest
 */
- (void)acceptCertificateTransfer:(AWSIoTAcceptCertificateTransferRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Attaches the specified policy to the specified principal (certificate or other credential).</p>
 
 @param request A container for the necessary parameters to execute the AttachPrincipalPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorLimitExceeded`.
 
 @see AWSIoTAttachPrincipalPolicyRequest
 */
- (AWSTask *)attachPrincipalPolicy:(AWSIoTAttachPrincipalPolicyRequest *)request;

/**
 <p>Attaches the specified policy to the specified principal (certificate or other credential).</p>
 
 @param request A container for the necessary parameters to execute the AttachPrincipalPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorLimitExceeded`.
 
 @see AWSIoTAttachPrincipalPolicyRequest
 */
- (void)attachPrincipalPolicy:(AWSIoTAttachPrincipalPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Attaches the specified principal to the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the AttachThingPrincipal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTAttachThingPrincipalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTAttachThingPrincipalRequest
 @see AWSIoTAttachThingPrincipalResponse
 */
- (AWSTask<AWSIoTAttachThingPrincipalResponse *> *)attachThingPrincipal:(AWSIoTAttachThingPrincipalRequest *)request;

/**
 <p>Attaches the specified principal to the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the AttachThingPrincipal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTAttachThingPrincipalRequest
 @see AWSIoTAttachThingPrincipalResponse
 */
- (void)attachThingPrincipal:(AWSIoTAttachThingPrincipalRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTAttachThingPrincipalResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels a pending transfer for the specified certificate.</p><p><b>Note</b> Only the transfer source account can use this operation to cancel a transfer. (Transfer destinations can use <a>RejectCertificateTransfer</a> instead.) After transfer, AWS IoT returns the certificate to the source account in the INACTIVE state. After the destination account has accepted the transfer, the transfer cannot be cancelled.</p><p>After a certificate transfer is cancelled, the status of the certificate changes from PENDING_TRANSFER to INACTIVE.</p>
 
 @param request A container for the necessary parameters to execute the CancelCertificateTransfer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorTransferAlreadyCompleted`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCancelCertificateTransferRequest
 */
- (AWSTask *)cancelCertificateTransfer:(AWSIoTCancelCertificateTransferRequest *)request;

/**
 <p>Cancels a pending transfer for the specified certificate.</p><p><b>Note</b> Only the transfer source account can use this operation to cancel a transfer. (Transfer destinations can use <a>RejectCertificateTransfer</a> instead.) After transfer, AWS IoT returns the certificate to the source account in the INACTIVE state. After the destination account has accepted the transfer, the transfer cannot be cancelled.</p><p>After a certificate transfer is cancelled, the status of the certificate changes from PENDING_TRANSFER to INACTIVE.</p>
 
 @param request A container for the necessary parameters to execute the CancelCertificateTransfer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorTransferAlreadyCompleted`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCancelCertificateTransferRequest
 */
- (void)cancelCertificateTransfer:(AWSIoTCancelCertificateTransferRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates an X.509 certificate using the specified certificate signing request.</p><p><b>Note</b> Reusing the same certificate signing request (CSR) results in a distinct certificate.</p><p>You can create multiple certificates in a batch by creating a directory, copying multiple .csr files into that directory, and then specifying that directory on the command line. The following commands show how to create a batch of certificates given a batch of CSRs. </p><p>Assuming a set of CSRs are located inside of the directory my-csr-directory:</p>&gt; <p>On Linux and OS X, the command is:</p><p>$ ls my-csr-directory/ | xargs -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{}</p><p> This command lists all of the CSRs in my-csr-directory and pipes each CSR file name to the aws iot create-certificate-from-csr AWS CLI command to create a certificate for the corresponding CSR. </p><p> The aws iot create-certificate-from-csr part of the command can also be run in parallel to speed up the certificate creation process: </p><p> $ ls my-csr-directory/ | xargs -P 10 -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{} </p><p> On Windows PowerShell, the command to create certificates for all CSRs in my-csr-directory is: </p><p> &gt; ls -Name my-csr-directory | %{aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/$_} </p><p> On a Windows command prompt, the command to create certificates for all CSRs in my-csr-directory is: </p><p> &gt; forfiles /p my-csr-directory /c "cmd /c aws iot create-certificate-from-csr --certificate-signing-request file://@path"</p>
 
 @param request A container for the necessary parameters to execute the CreateCertificateFromCsr service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTCreateCertificateFromCsrResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreateCertificateFromCsrRequest
 @see AWSIoTCreateCertificateFromCsrResponse
 */
- (AWSTask<AWSIoTCreateCertificateFromCsrResponse *> *)createCertificateFromCsr:(AWSIoTCreateCertificateFromCsrRequest *)request;

/**
 <p>Creates an X.509 certificate using the specified certificate signing request.</p><p><b>Note</b> Reusing the same certificate signing request (CSR) results in a distinct certificate.</p><p>You can create multiple certificates in a batch by creating a directory, copying multiple .csr files into that directory, and then specifying that directory on the command line. The following commands show how to create a batch of certificates given a batch of CSRs. </p><p>Assuming a set of CSRs are located inside of the directory my-csr-directory:</p>&gt; <p>On Linux and OS X, the command is:</p><p>$ ls my-csr-directory/ | xargs -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{}</p><p> This command lists all of the CSRs in my-csr-directory and pipes each CSR file name to the aws iot create-certificate-from-csr AWS CLI command to create a certificate for the corresponding CSR. </p><p> The aws iot create-certificate-from-csr part of the command can also be run in parallel to speed up the certificate creation process: </p><p> $ ls my-csr-directory/ | xargs -P 10 -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{} </p><p> On Windows PowerShell, the command to create certificates for all CSRs in my-csr-directory is: </p><p> &gt; ls -Name my-csr-directory | %{aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/$_} </p><p> On a Windows command prompt, the command to create certificates for all CSRs in my-csr-directory is: </p><p> &gt; forfiles /p my-csr-directory /c "cmd /c aws iot create-certificate-from-csr --certificate-signing-request file://@path"</p>
 
 @param request A container for the necessary parameters to execute the CreateCertificateFromCsr service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreateCertificateFromCsrRequest
 @see AWSIoTCreateCertificateFromCsrResponse
 */
- (void)createCertificateFromCsr:(AWSIoTCreateCertificateFromCsrRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTCreateCertificateFromCsrResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a 2048-bit RSA key pair and issues an X.509 certificate using the issued public key.</p><p><b>Note</b> This is the only time AWS IoT issues the private key for this certificate, so it is important to keep it in a secure location.</p>
 
 @param request A container for the necessary parameters to execute the CreateKeysAndCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTCreateKeysAndCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreateKeysAndCertificateRequest
 @see AWSIoTCreateKeysAndCertificateResponse
 */
- (AWSTask<AWSIoTCreateKeysAndCertificateResponse *> *)createKeysAndCertificate:(AWSIoTCreateKeysAndCertificateRequest *)request;

/**
 <p>Creates a 2048-bit RSA key pair and issues an X.509 certificate using the issued public key.</p><p><b>Note</b> This is the only time AWS IoT issues the private key for this certificate, so it is important to keep it in a secure location.</p>
 
 @param request A container for the necessary parameters to execute the CreateKeysAndCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreateKeysAndCertificateRequest
 @see AWSIoTCreateKeysAndCertificateResponse
 */
- (void)createKeysAndCertificate:(AWSIoTCreateKeysAndCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTCreateKeysAndCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AWS IoT policy.</p><p>The created policy is the default version for the policy. This operation creates a policy version with a version identifier of <b>1</b> and sets <b>1</b> as the policy's default version.</p>
 
 @param request A container for the necessary parameters to execute the CreatePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTCreatePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceAlreadyExists`, `AWSIoTErrorMalformedPolicy`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreatePolicyRequest
 @see AWSIoTCreatePolicyResponse
 */
- (AWSTask<AWSIoTCreatePolicyResponse *> *)createPolicy:(AWSIoTCreatePolicyRequest *)request;

/**
 <p>Creates an AWS IoT policy.</p><p>The created policy is the default version for the policy. This operation creates a policy version with a version identifier of <b>1</b> and sets <b>1</b> as the policy's default version.</p>
 
 @param request A container for the necessary parameters to execute the CreatePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceAlreadyExists`, `AWSIoTErrorMalformedPolicy`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreatePolicyRequest
 @see AWSIoTCreatePolicyResponse
 */
- (void)createPolicy:(AWSIoTCreatePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTCreatePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new version of the specified AWS IoT policy. To update a policy, create a new policy version. A managed policy can have up to five versions. If the policy has five versions, you must use <a>DeletePolicyVersion</a> to delete an existing version before you create a new one.</p><p>Optionally, you can set the new version as the policy's default version. The default version is the operative version (that is, the version that is in effect for the certificates to which the policy is attached).</p>
 
 @param request A container for the necessary parameters to execute the CreatePolicyVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTCreatePolicyVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorMalformedPolicy`, `AWSIoTErrorVersionsLimitExceeded`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreatePolicyVersionRequest
 @see AWSIoTCreatePolicyVersionResponse
 */
- (AWSTask<AWSIoTCreatePolicyVersionResponse *> *)createPolicyVersion:(AWSIoTCreatePolicyVersionRequest *)request;

/**
 <p>Creates a new version of the specified AWS IoT policy. To update a policy, create a new policy version. A managed policy can have up to five versions. If the policy has five versions, you must use <a>DeletePolicyVersion</a> to delete an existing version before you create a new one.</p><p>Optionally, you can set the new version as the policy's default version. The default version is the operative version (that is, the version that is in effect for the certificates to which the policy is attached).</p>
 
 @param request A container for the necessary parameters to execute the CreatePolicyVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorMalformedPolicy`, `AWSIoTErrorVersionsLimitExceeded`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreatePolicyVersionRequest
 @see AWSIoTCreatePolicyVersionResponse
 */
- (void)createPolicyVersion:(AWSIoTCreatePolicyVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTCreatePolicyVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a thing in the Thing Registry.</p>
 
 @param request A container for the necessary parameters to execute the CreateThing service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTCreateThingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceAlreadyExists`.
 
 @see AWSIoTCreateThingRequest
 @see AWSIoTCreateThingResponse
 */
- (AWSTask<AWSIoTCreateThingResponse *> *)createThing:(AWSIoTCreateThingRequest *)request;

/**
 <p>Creates a thing in the Thing Registry.</p>
 
 @param request A container for the necessary parameters to execute the CreateThing service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceAlreadyExists`.
 
 @see AWSIoTCreateThingRequest
 @see AWSIoTCreateThingResponse
 */
- (void)createThing:(AWSIoTCreateThingRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTCreateThingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a rule. Creating rules is an administrator-level action. Any user who has permission to create rules will be able to access data processed by the rule.</p>
 
 @param request A container for the necessary parameters to execute the CreateTopicRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorSqlParse`, `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorResourceAlreadyExists`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTCreateTopicRuleRequest
 */
- (AWSTask *)createTopicRule:(AWSIoTCreateTopicRuleRequest *)request;

/**
 <p>Creates a rule. Creating rules is an administrator-level action. Any user who has permission to create rules will be able to access data processed by the rule.</p>
 
 @param request A container for the necessary parameters to execute the CreateTopicRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorSqlParse`, `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorResourceAlreadyExists`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTCreateTopicRuleRequest
 */
- (void)createTopicRule:(AWSIoTCreateTopicRuleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a registered CA certificate.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCACertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDeleteCACertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorCertificateState`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTDeleteCACertificateRequest
 @see AWSIoTDeleteCACertificateResponse
 */
- (AWSTask<AWSIoTDeleteCACertificateResponse *> *)deleteCACertificate:(AWSIoTDeleteCACertificateRequest *)request;

/**
 <p>Deletes a registered CA certificate.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCACertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorCertificateState`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTDeleteCACertificateRequest
 @see AWSIoTDeleteCACertificateResponse
 */
- (void)deleteCACertificate:(AWSIoTDeleteCACertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDeleteCACertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified certificate.</p><p>A certificate cannot be deleted if it has a policy attached to it or if its status is set to ACTIVE. To delete a certificate, first use the <a>DetachPrincipalPolicy</a> API to detach all policies. Next, use the <a>UpdateCertificate</a> API to set the certificate to the INACTIVE status.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorCertificateState`, `AWSIoTErrorDeleteConflict`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTDeleteCertificateRequest
 */
- (AWSTask *)deleteCertificate:(AWSIoTDeleteCertificateRequest *)request;

/**
 <p>Deletes the specified certificate.</p><p>A certificate cannot be deleted if it has a policy attached to it or if its status is set to ACTIVE. To delete a certificate, first use the <a>DetachPrincipalPolicy</a> API to detach all policies. Next, use the <a>UpdateCertificate</a> API to set the certificate to the INACTIVE status.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorCertificateState`, `AWSIoTErrorDeleteConflict`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTDeleteCertificateRequest
 */
- (void)deleteCertificate:(AWSIoTDeleteCertificateRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified policy.</p><p>A policy cannot be deleted if it has non-default versions or it is attached to any certificate.</p><p>To delete a policy, use the DeletePolicyVersion API to delete all non-default versions of the policy; use the DetachPrincipalPolicy API to detach the policy from any certificate; and then use the DeletePolicy API to delete the policy.</p><p>When a policy is deleted using DeletePolicy, its default version is deleted with it.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorDeleteConflict`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDeletePolicyRequest
 */
- (AWSTask *)deletePolicy:(AWSIoTDeletePolicyRequest *)request;

/**
 <p>Deletes the specified policy.</p><p>A policy cannot be deleted if it has non-default versions or it is attached to any certificate.</p><p>To delete a policy, use the DeletePolicyVersion API to delete all non-default versions of the policy; use the DetachPrincipalPolicy API to detach the policy from any certificate; and then use the DeletePolicy API to delete the policy.</p><p>When a policy is deleted using DeletePolicy, its default version is deleted with it.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorDeleteConflict`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDeletePolicyRequest
 */
- (void)deletePolicy:(AWSIoTDeletePolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified version of the specified policy. You cannot delete the default version of a policy using this API. To delete the default version of a policy, use <a>DeletePolicy</a>. To find out which version of a policy is marked as the default version, use ListPolicyVersions.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicyVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorDeleteConflict`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDeletePolicyVersionRequest
 */
- (AWSTask *)deletePolicyVersion:(AWSIoTDeletePolicyVersionRequest *)request;

/**
 <p>Deletes the specified version of the specified policy. You cannot delete the default version of a policy using this API. To delete the default version of a policy, use <a>DeletePolicy</a>. To find out which version of a policy is marked as the default version, use ListPolicyVersions.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicyVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorDeleteConflict`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDeletePolicyVersionRequest
 */
- (void)deletePolicyVersion:(AWSIoTDeletePolicyVersionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a CA certificate registration code.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRegistrationCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDeleteRegistrationCodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorThrottling`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDeleteRegistrationCodeRequest
 @see AWSIoTDeleteRegistrationCodeResponse
 */
- (AWSTask<AWSIoTDeleteRegistrationCodeResponse *> *)deleteRegistrationCode:(AWSIoTDeleteRegistrationCodeRequest *)request;

/**
 <p>Deletes a CA certificate registration code.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRegistrationCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorThrottling`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDeleteRegistrationCodeRequest
 @see AWSIoTDeleteRegistrationCodeResponse
 */
- (void)deleteRegistrationCode:(AWSIoTDeleteRegistrationCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDeleteRegistrationCodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified thing from the Thing Registry.</p>
 
 @param request A container for the necessary parameters to execute the DeleteThing service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDeleteThingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDeleteThingRequest
 @see AWSIoTDeleteThingResponse
 */
- (AWSTask<AWSIoTDeleteThingResponse *> *)deleteThing:(AWSIoTDeleteThingRequest *)request;

/**
 <p>Deletes the specified thing from the Thing Registry.</p>
 
 @param request A container for the necessary parameters to execute the DeleteThing service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDeleteThingRequest
 @see AWSIoTDeleteThingResponse
 */
- (void)deleteThing:(AWSIoTDeleteThingRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDeleteThingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified rule.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTopicRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTDeleteTopicRuleRequest
 */
- (AWSTask *)deleteTopicRule:(AWSIoTDeleteTopicRuleRequest *)request;

/**
 <p>Deletes the specified rule.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTopicRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTDeleteTopicRuleRequest
 */
- (void)deleteTopicRule:(AWSIoTDeleteTopicRuleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Describes a registered CA certificate.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCACertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDescribeCACertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTDescribeCACertificateRequest
 @see AWSIoTDescribeCACertificateResponse
 */
- (AWSTask<AWSIoTDescribeCACertificateResponse *> *)describeCACertificate:(AWSIoTDescribeCACertificateRequest *)request;

/**
 <p>Describes a registered CA certificate.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCACertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTDescribeCACertificateRequest
 @see AWSIoTDescribeCACertificateResponse
 */
- (void)describeCACertificate:(AWSIoTDescribeCACertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDescribeCACertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified certificate.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDescribeCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTDescribeCertificateRequest
 @see AWSIoTDescribeCertificateResponse
 */
- (AWSTask<AWSIoTDescribeCertificateResponse *> *)describeCertificate:(AWSIoTDescribeCertificateRequest *)request;

/**
 <p>Gets information about the specified certificate.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTDescribeCertificateRequest
 @see AWSIoTDescribeCertificateResponse
 */
- (void)describeCertificate:(AWSIoTDescribeCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDescribeCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a unique endpoint specific to the AWS account making the call. You specify the following URI when updating state information for your thing: https://<i>endpoint</i>/things/<i>thingName</i>/shadow.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDescribeEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternalFailure`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorThrottling`.
 
 @see AWSIoTDescribeEndpointRequest
 @see AWSIoTDescribeEndpointResponse
 */
- (AWSTask<AWSIoTDescribeEndpointResponse *> *)describeEndpoint:(AWSIoTDescribeEndpointRequest *)request;

/**
 <p>Returns a unique endpoint specific to the AWS account making the call. You specify the following URI when updating state information for your thing: https://<i>endpoint</i>/things/<i>thingName</i>/shadow.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternalFailure`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorThrottling`.
 
 @see AWSIoTDescribeEndpointRequest
 @see AWSIoTDescribeEndpointResponse
 */
- (void)describeEndpoint:(AWSIoTDescribeEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDescribeEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the DescribeThing service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDescribeThingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDescribeThingRequest
 @see AWSIoTDescribeThingResponse
 */
- (AWSTask<AWSIoTDescribeThingResponse *> *)describeThing:(AWSIoTDescribeThingRequest *)request;

/**
 <p>Gets information about the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the DescribeThing service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDescribeThingRequest
 @see AWSIoTDescribeThingResponse
 */
- (void)describeThing:(AWSIoTDescribeThingRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDescribeThingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified policy from the specified certificate.</p>
 
 @param request A container for the necessary parameters to execute the DetachPrincipalPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDetachPrincipalPolicyRequest
 */
- (AWSTask *)detachPrincipalPolicy:(AWSIoTDetachPrincipalPolicyRequest *)request;

/**
 <p>Removes the specified policy from the specified certificate.</p>
 
 @param request A container for the necessary parameters to execute the DetachPrincipalPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDetachPrincipalPolicyRequest
 */
- (void)detachPrincipalPolicy:(AWSIoTDetachPrincipalPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Detaches the specified principal from the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the DetachThingPrincipal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDetachThingPrincipalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDetachThingPrincipalRequest
 @see AWSIoTDetachThingPrincipalResponse
 */
- (AWSTask<AWSIoTDetachThingPrincipalResponse *> *)detachThingPrincipal:(AWSIoTDetachThingPrincipalRequest *)request;

/**
 <p>Detaches the specified principal from the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the DetachThingPrincipal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDetachThingPrincipalRequest
 @see AWSIoTDetachThingPrincipalResponse
 */
- (void)detachThingPrincipal:(AWSIoTDetachThingPrincipalRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDetachThingPrincipalResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the specified rule.</p>
 
 @param request A container for the necessary parameters to execute the DisableTopicRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTDisableTopicRuleRequest
 */
- (AWSTask *)disableTopicRule:(AWSIoTDisableTopicRuleRequest *)request;

/**
 <p>Disables the specified rule.</p>
 
 @param request A container for the necessary parameters to execute the DisableTopicRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTDisableTopicRuleRequest
 */
- (void)disableTopicRule:(AWSIoTDisableTopicRuleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables the specified rule.</p>
 
 @param request A container for the necessary parameters to execute the EnableTopicRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTEnableTopicRuleRequest
 */
- (AWSTask *)enableTopicRule:(AWSIoTEnableTopicRuleRequest *)request;

/**
 <p>Enables the specified rule.</p>
 
 @param request A container for the necessary parameters to execute the EnableTopicRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTEnableTopicRuleRequest
 */
- (void)enableTopicRule:(AWSIoTEnableTopicRuleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets the logging options.</p>
 
 @param request A container for the necessary parameters to execute the GetLoggingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTGetLoggingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTGetLoggingOptionsRequest
 @see AWSIoTGetLoggingOptionsResponse
 */
- (AWSTask<AWSIoTGetLoggingOptionsResponse *> *)getLoggingOptions:(AWSIoTGetLoggingOptionsRequest *)request;

/**
 <p>Gets the logging options.</p>
 
 @param request A container for the necessary parameters to execute the GetLoggingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTGetLoggingOptionsRequest
 @see AWSIoTGetLoggingOptionsResponse
 */
- (void)getLoggingOptions:(AWSIoTGetLoggingOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTGetLoggingOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified policy with the policy document of the default version.</p>
 
 @param request A container for the necessary parameters to execute the GetPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTGetPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTGetPolicyRequest
 @see AWSIoTGetPolicyResponse
 */
- (AWSTask<AWSIoTGetPolicyResponse *> *)getPolicy:(AWSIoTGetPolicyRequest *)request;

/**
 <p>Gets information about the specified policy with the policy document of the default version.</p>
 
 @param request A container for the necessary parameters to execute the GetPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTGetPolicyRequest
 @see AWSIoTGetPolicyResponse
 */
- (void)getPolicy:(AWSIoTGetPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTGetPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified policy version.</p>
 
 @param request A container for the necessary parameters to execute the GetPolicyVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTGetPolicyVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTGetPolicyVersionRequest
 @see AWSIoTGetPolicyVersionResponse
 */
- (AWSTask<AWSIoTGetPolicyVersionResponse *> *)getPolicyVersion:(AWSIoTGetPolicyVersionRequest *)request;

/**
 <p>Gets information about the specified policy version.</p>
 
 @param request A container for the necessary parameters to execute the GetPolicyVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTGetPolicyVersionRequest
 @see AWSIoTGetPolicyVersionResponse
 */
- (void)getPolicyVersion:(AWSIoTGetPolicyVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTGetPolicyVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a registration code used to register a CA certificate with AWS IoT.</p>
 
 @param request A container for the necessary parameters to execute the GetRegistrationCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTGetRegistrationCodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTGetRegistrationCodeRequest
 @see AWSIoTGetRegistrationCodeResponse
 */
- (AWSTask<AWSIoTGetRegistrationCodeResponse *> *)getRegistrationCode:(AWSIoTGetRegistrationCodeRequest *)request;

/**
 <p>Gets a registration code used to register a CA certificate with AWS IoT.</p>
 
 @param request A container for the necessary parameters to execute the GetRegistrationCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTGetRegistrationCodeRequest
 @see AWSIoTGetRegistrationCodeResponse
 */
- (void)getRegistrationCode:(AWSIoTGetRegistrationCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTGetRegistrationCodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified rule.</p>
 
 @param request A container for the necessary parameters to execute the GetTopicRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTGetTopicRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTGetTopicRuleRequest
 @see AWSIoTGetTopicRuleResponse
 */
- (AWSTask<AWSIoTGetTopicRuleResponse *> *)getTopicRule:(AWSIoTGetTopicRuleRequest *)request;

/**
 <p>Gets information about the specified rule.</p>
 
 @param request A container for the necessary parameters to execute the GetTopicRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTGetTopicRuleRequest
 @see AWSIoTGetTopicRuleResponse
 */
- (void)getTopicRule:(AWSIoTGetTopicRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTGetTopicRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the CA certificates registered for your AWS account.</p><p>The results are paginated with a default page size of 25. You can use the returned marker to retrieve additional results.</p>
 
 @param request A container for the necessary parameters to execute the ListCACertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListCACertificatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListCACertificatesRequest
 @see AWSIoTListCACertificatesResponse
 */
- (AWSTask<AWSIoTListCACertificatesResponse *> *)listCACertificates:(AWSIoTListCACertificatesRequest *)request;

/**
 <p>Lists the CA certificates registered for your AWS account.</p><p>The results are paginated with a default page size of 25. You can use the returned marker to retrieve additional results.</p>
 
 @param request A container for the necessary parameters to execute the ListCACertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListCACertificatesRequest
 @see AWSIoTListCACertificatesResponse
 */
- (void)listCACertificates:(AWSIoTListCACertificatesRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTListCACertificatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the certificates registered in your AWS account.</p><p>The results are paginated with a default page size of 25. You can use the returned marker to retrieve additional results.</p>
 
 @param request A container for the necessary parameters to execute the ListCertificates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListCertificatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListCertificatesRequest
 @see AWSIoTListCertificatesResponse
 */
- (AWSTask<AWSIoTListCertificatesResponse *> *)listCertificates:(AWSIoTListCertificatesRequest *)request;

/**
 <p>Lists the certificates registered in your AWS account.</p><p>The results are paginated with a default page size of 25. You can use the returned marker to retrieve additional results.</p>
 
 @param request A container for the necessary parameters to execute the ListCertificates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListCertificatesRequest
 @see AWSIoTListCertificatesResponse
 */
- (void)listCertificates:(AWSIoTListCertificatesRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTListCertificatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the device certificates signed by the specified CA certificate.</p>
 
 @param request A container for the necessary parameters to execute the ListCertificatesByCA service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListCertificatesByCAResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListCertificatesByCARequest
 @see AWSIoTListCertificatesByCAResponse
 */
- (AWSTask<AWSIoTListCertificatesByCAResponse *> *)listCertificatesByCA:(AWSIoTListCertificatesByCARequest *)request;

/**
 <p>List the device certificates signed by the specified CA certificate.</p>
 
 @param request A container for the necessary parameters to execute the ListCertificatesByCA service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListCertificatesByCARequest
 @see AWSIoTListCertificatesByCAResponse
 */
- (void)listCertificatesByCA:(AWSIoTListCertificatesByCARequest *)request completionHandler:(void (^ _Nullable)(AWSIoTListCertificatesByCAResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists your policies.</p>
 
 @param request A container for the necessary parameters to execute the ListPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPoliciesRequest
 @see AWSIoTListPoliciesResponse
 */
- (AWSTask<AWSIoTListPoliciesResponse *> *)listPolicies:(AWSIoTListPoliciesRequest *)request;

/**
 <p>Lists your policies.</p>
 
 @param request A container for the necessary parameters to execute the ListPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPoliciesRequest
 @see AWSIoTListPoliciesResponse
 */
- (void)listPolicies:(AWSIoTListPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTListPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the versions of the specified policy, and identifies the default version.</p>
 
 @param request A container for the necessary parameters to execute the ListPolicyVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListPolicyVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPolicyVersionsRequest
 @see AWSIoTListPolicyVersionsResponse
 */
- (AWSTask<AWSIoTListPolicyVersionsResponse *> *)listPolicyVersions:(AWSIoTListPolicyVersionsRequest *)request;

/**
 <p>Lists the versions of the specified policy, and identifies the default version.</p>
 
 @param request A container for the necessary parameters to execute the ListPolicyVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPolicyVersionsRequest
 @see AWSIoTListPolicyVersionsResponse
 */
- (void)listPolicyVersions:(AWSIoTListPolicyVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTListPolicyVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the policies attached to the specified principal. If you use an Cognito identity, the ID must be in <a href="http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetCredentialsForIdentity.html#API_GetCredentialsForIdentity_RequestSyntax">AmazonCognito Identity format</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListPrincipalPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListPrincipalPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPrincipalPoliciesRequest
 @see AWSIoTListPrincipalPoliciesResponse
 */
- (AWSTask<AWSIoTListPrincipalPoliciesResponse *> *)listPrincipalPolicies:(AWSIoTListPrincipalPoliciesRequest *)request;

/**
 <p>Lists the policies attached to the specified principal. If you use an Cognito identity, the ID must be in <a href="http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetCredentialsForIdentity.html#API_GetCredentialsForIdentity_RequestSyntax">AmazonCognito Identity format</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListPrincipalPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPrincipalPoliciesRequest
 @see AWSIoTListPrincipalPoliciesResponse
 */
- (void)listPrincipalPolicies:(AWSIoTListPrincipalPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTListPrincipalPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the things associated with the specified principal.</p>
 
 @param request A container for the necessary parameters to execute the ListPrincipalThings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListPrincipalThingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPrincipalThingsRequest
 @see AWSIoTListPrincipalThingsResponse
 */
- (AWSTask<AWSIoTListPrincipalThingsResponse *> *)listPrincipalThings:(AWSIoTListPrincipalThingsRequest *)request;

/**
 <p>Lists the things associated with the specified principal.</p>
 
 @param request A container for the necessary parameters to execute the ListPrincipalThings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPrincipalThingsRequest
 @see AWSIoTListPrincipalThingsResponse
 */
- (void)listPrincipalThings:(AWSIoTListPrincipalThingsRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTListPrincipalThingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the principals associated with the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the ListThingPrincipals service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListThingPrincipalsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListThingPrincipalsRequest
 @see AWSIoTListThingPrincipalsResponse
 */
- (AWSTask<AWSIoTListThingPrincipalsResponse *> *)listThingPrincipals:(AWSIoTListThingPrincipalsRequest *)request;

/**
 <p>Lists the principals associated with the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the ListThingPrincipals service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListThingPrincipalsRequest
 @see AWSIoTListThingPrincipalsResponse
 */
- (void)listThingPrincipals:(AWSIoTListThingPrincipalsRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTListThingPrincipalsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists your things. You can pass an AttributeName or AttributeValue to filter your things (for example, "ListThings where AttributeName=Color and AttributeValue=Red").</p>
 
 @param request A container for the necessary parameters to execute the ListThings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListThingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListThingsRequest
 @see AWSIoTListThingsResponse
 */
- (AWSTask<AWSIoTListThingsResponse *> *)listThings:(AWSIoTListThingsRequest *)request;

/**
 <p>Lists your things. You can pass an AttributeName or AttributeValue to filter your things (for example, "ListThings where AttributeName=Color and AttributeValue=Red").</p>
 
 @param request A container for the necessary parameters to execute the ListThings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListThingsRequest
 @see AWSIoTListThingsResponse
 */
- (void)listThings:(AWSIoTListThingsRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTListThingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the rules for the specific topic.</p>
 
 @param request A container for the necessary parameters to execute the ListTopicRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListTopicRulesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTListTopicRulesRequest
 @see AWSIoTListTopicRulesResponse
 */
- (AWSTask<AWSIoTListTopicRulesResponse *> *)listTopicRules:(AWSIoTListTopicRulesRequest *)request;

/**
 <p>Lists the rules for the specific topic.</p>
 
 @param request A container for the necessary parameters to execute the ListTopicRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTListTopicRulesRequest
 @see AWSIoTListTopicRulesResponse
 */
- (void)listTopicRules:(AWSIoTListTopicRulesRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTListTopicRulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a CA certificate with AWS IoT. This CA certificate can then be used to sign device certificates, which can be then registered with AWS IoT. You can register up to 10 CA certificates per AWS account that have the same subject field and public key. This enables you to have up to 10 certificate authorities sign your device certificates. If you have more than one CA certificate registered, make sure you pass the CA certificate when you register your device certificates with the RegisterCertificate API.</p>
 
 @param request A container for the necessary parameters to execute the RegisterCACertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTRegisterCACertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceAlreadyExists`, `AWSIoTErrorRegistrationCodeValidation`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorCertificateValidation`, `AWSIoTErrorThrottling`, `AWSIoTErrorLimitExceeded`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTRegisterCACertificateRequest
 @see AWSIoTRegisterCACertificateResponse
 */
- (AWSTask<AWSIoTRegisterCACertificateResponse *> *)registerCACertificate:(AWSIoTRegisterCACertificateRequest *)request;

/**
 <p>Registers a CA certificate with AWS IoT. This CA certificate can then be used to sign device certificates, which can be then registered with AWS IoT. You can register up to 10 CA certificates per AWS account that have the same subject field and public key. This enables you to have up to 10 certificate authorities sign your device certificates. If you have more than one CA certificate registered, make sure you pass the CA certificate when you register your device certificates with the RegisterCertificate API.</p>
 
 @param request A container for the necessary parameters to execute the RegisterCACertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceAlreadyExists`, `AWSIoTErrorRegistrationCodeValidation`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorCertificateValidation`, `AWSIoTErrorThrottling`, `AWSIoTErrorLimitExceeded`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTRegisterCACertificateRequest
 @see AWSIoTRegisterCACertificateResponse
 */
- (void)registerCACertificate:(AWSIoTRegisterCACertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTRegisterCACertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a device certificate with AWS IoT. If you have more than one CA certificate that has the same subject field, you must specify the CA certificate that was used to sign the device certificate being registered.</p>
 
 @param request A container for the necessary parameters to execute the RegisterCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTRegisterCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceAlreadyExists`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorCertificateValidation`, `AWSIoTErrorCertificateState`, `AWSIoTErrorCertificateConflict`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTRegisterCertificateRequest
 @see AWSIoTRegisterCertificateResponse
 */
- (AWSTask<AWSIoTRegisterCertificateResponse *> *)registerCertificate:(AWSIoTRegisterCertificateRequest *)request;

/**
 <p>Registers a device certificate with AWS IoT. If you have more than one CA certificate that has the same subject field, you must specify the CA certificate that was used to sign the device certificate being registered.</p>
 
 @param request A container for the necessary parameters to execute the RegisterCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceAlreadyExists`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorCertificateValidation`, `AWSIoTErrorCertificateState`, `AWSIoTErrorCertificateConflict`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTRegisterCertificateRequest
 @see AWSIoTRegisterCertificateResponse
 */
- (void)registerCertificate:(AWSIoTRegisterCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTRegisterCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Rejects a pending certificate transfer. After AWS IoT rejects a certificate transfer, the certificate status changes from <b>PENDING_TRANSFER</b> to <b>INACTIVE</b>.</p><p>To check for pending certificate transfers, call <a>ListCertificates</a> to enumerate your certificates.</p><p>This operation can only be called by the transfer destination. After it is called, the certificate will be returned to the source's account in the INACTIVE state.</p>
 
 @param request A container for the necessary parameters to execute the RejectCertificateTransfer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorTransferAlreadyCompleted`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTRejectCertificateTransferRequest
 */
- (AWSTask *)rejectCertificateTransfer:(AWSIoTRejectCertificateTransferRequest *)request;

/**
 <p>Rejects a pending certificate transfer. After AWS IoT rejects a certificate transfer, the certificate status changes from <b>PENDING_TRANSFER</b> to <b>INACTIVE</b>.</p><p>To check for pending certificate transfers, call <a>ListCertificates</a> to enumerate your certificates.</p><p>This operation can only be called by the transfer destination. After it is called, the certificate will be returned to the source's account in the INACTIVE state.</p>
 
 @param request A container for the necessary parameters to execute the RejectCertificateTransfer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorTransferAlreadyCompleted`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTRejectCertificateTransferRequest
 */
- (void)rejectCertificateTransfer:(AWSIoTRejectCertificateTransferRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Replaces the specified rule. You must specify all parameters for the new rule. Creating rules is an administrator-level action. Any user who has permission to create rules will be able to access data processed by the rule.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceTopicRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorSqlParse`, `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTReplaceTopicRuleRequest
 */
- (AWSTask *)replaceTopicRule:(AWSIoTReplaceTopicRuleRequest *)request;

/**
 <p>Replaces the specified rule. You must specify all parameters for the new rule. Creating rules is an administrator-level action. Any user who has permission to create rules will be able to access data processed by the rule.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceTopicRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorSqlParse`, `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTReplaceTopicRuleRequest
 */
- (void)replaceTopicRule:(AWSIoTReplaceTopicRuleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the specified version of the specified policy as the policy's default (operative) version. This action affects all certificates to which the policy is attached. To list the principals the policy is attached to, use the ListPrincipalPolicy API.</p>
 
 @param request A container for the necessary parameters to execute the SetDefaultPolicyVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTSetDefaultPolicyVersionRequest
 */
- (AWSTask *)setDefaultPolicyVersion:(AWSIoTSetDefaultPolicyVersionRequest *)request;

/**
 <p>Sets the specified version of the specified policy as the policy's default (operative) version. This action affects all certificates to which the policy is attached. To list the principals the policy is attached to, use the ListPrincipalPolicy API.</p>
 
 @param request A container for the necessary parameters to execute the SetDefaultPolicyVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTSetDefaultPolicyVersionRequest
 */
- (void)setDefaultPolicyVersion:(AWSIoTSetDefaultPolicyVersionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the logging options.</p>
 
 @param request A container for the necessary parameters to execute the SetLoggingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTSetLoggingOptionsRequest
 */
- (AWSTask *)setLoggingOptions:(AWSIoTSetLoggingOptionsRequest *)request;

/**
 <p>Sets the logging options.</p>
 
 @param request A container for the necessary parameters to execute the SetLoggingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTSetLoggingOptionsRequest
 */
- (void)setLoggingOptions:(AWSIoTSetLoggingOptionsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Transfers the specified certificate to the specified AWS account.</p><p>You can cancel the transfer until it is acknowledged by the recipient.</p><p>No notification is sent to the transfer destination's account. It is up to the caller to notify the transfer target.</p><p>The certificate being transferred must not be in the ACTIVE state. You can use the UpdateCertificate API to deactivate it.</p><p>The certificate must not have any policies attached to it. You can use the DetachPrincipalPolicy API to detach them.</p>
 
 @param request A container for the necessary parameters to execute the TransferCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTTransferCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorCertificateState`, `AWSIoTErrorTransferConflict`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTTransferCertificateRequest
 @see AWSIoTTransferCertificateResponse
 */
- (AWSTask<AWSIoTTransferCertificateResponse *> *)transferCertificate:(AWSIoTTransferCertificateRequest *)request;

/**
 <p>Transfers the specified certificate to the specified AWS account.</p><p>You can cancel the transfer until it is acknowledged by the recipient.</p><p>No notification is sent to the transfer destination's account. It is up to the caller to notify the transfer target.</p><p>The certificate being transferred must not be in the ACTIVE state. You can use the UpdateCertificate API to deactivate it.</p><p>The certificate must not have any policies attached to it. You can use the DetachPrincipalPolicy API to detach them.</p>
 
 @param request A container for the necessary parameters to execute the TransferCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorCertificateState`, `AWSIoTErrorTransferConflict`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTTransferCertificateRequest
 @see AWSIoTTransferCertificateResponse
 */
- (void)transferCertificate:(AWSIoTTransferCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTTransferCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a registered CA certificate.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCACertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTUpdateCACertificateRequest
 */
- (AWSTask *)updateCACertificate:(AWSIoTUpdateCACertificateRequest *)request;

/**
 <p>Updates a registered CA certificate.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCACertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTUpdateCACertificateRequest
 */
- (void)updateCACertificate:(AWSIoTUpdateCACertificateRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the status of the specified certificate. This operation is idempotent.</p><p>Moving a certificate from the ACTIVE state (including REVOKED) will not disconnect currently connected devices, but these devices will be unable to reconnect.</p><p>The ACTIVE state is required to authenticate devices connecting to AWS IoT using a certificate.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorCertificateState`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTUpdateCertificateRequest
 */
- (AWSTask *)updateCertificate:(AWSIoTUpdateCertificateRequest *)request;

/**
 <p>Updates the status of the specified certificate. This operation is idempotent.</p><p>Moving a certificate from the ACTIVE state (including REVOKED) will not disconnect currently connected devices, but these devices will be unable to reconnect.</p><p>The ACTIVE state is required to authenticate devices connecting to AWS IoT using a certificate.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorCertificateState`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTUpdateCertificateRequest
 */
- (void)updateCertificate:(AWSIoTUpdateCertificateRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the data for a thing.</p>
 
 @param request A container for the necessary parameters to execute the UpdateThing service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTUpdateThingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTUpdateThingRequest
 @see AWSIoTUpdateThingResponse
 */
- (AWSTask<AWSIoTUpdateThingResponse *> *)updateThing:(AWSIoTUpdateThingRequest *)request;

/**
 <p>Updates the data for a thing.</p>
 
 @param request A container for the necessary parameters to execute the UpdateThing service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTUpdateThingRequest
 @see AWSIoTUpdateThingResponse
 */
- (void)updateThing:(AWSIoTUpdateThingRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTUpdateThingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
