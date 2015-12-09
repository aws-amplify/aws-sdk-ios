/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSIoTModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>AWS IoT (Beta)</fullname><p><b>AWS IoT is in beta and is subject to change</b></p><p>AWS IoT provides secure, bi-directional communication between Internet-connected things (such as sensors, actuators, embedded devices, or smart appliances) and the AWS cloud. You can discover your custom IoT-Data endpoint to communicate with, configure rules for data processing and integration with other services, organize resources associated with each thing (Thing Registry), configure logging, and create and manage policies and credentials to authenticate things.</p><p>For more information about how AWS IoT works, see the <a href="http://docs.aws.amazon.com/iot/latest/developerguide/aws-iot-how-it-works.html">Developer Guide</a>.</p>
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
+ (instancetype)registerIoTWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerIoTWithConfiguration:forKey:` before invoking this method. If `+ registerIoTWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

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
 <p>Attaches the specified policy to the specified principal (certificate or other credential).</p>
 
 @param request A container for the necessary parameters to execute the AttachPrincipalPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorLimitExceeded`.
 
 @see AWSIoTAttachPrincipalPolicyRequest
 */
- (AWSTask *)attachPrincipalPolicy:(AWSIoTAttachPrincipalPolicyRequest *)request;

/**
 <p>Attaches the specified principal to the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the AttachThingPrincipal service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTAttachThingPrincipalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTAttachThingPrincipalRequest
 @see AWSIoTAttachThingPrincipalResponse
 */
- (AWSTask *)attachThingPrincipal:(AWSIoTAttachThingPrincipalRequest *)request;

/**
 <p>Cancels a pending transfer for the specified certificate.</p><p><b>Note</b> Only the transfer source account can use this operation to cancel a transfer (transfer destinations can use <a>RejectCertificateTransfer</a> instead). After transfer, AWS IoT returns the certificate to the source account in the INACTIVE state. Once the destination account has accepted the transfer, the transfer may no longer be cancelled.</p><p>After a certificate transfer is cancelled, the status of the certificate changes from PENDING_TRANSFER to INACTIVE.</p>
 
 @param request A container for the necessary parameters to execute the CancelCertificateTransfer service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorTransferAlreadyCompleted`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCancelCertificateTransferRequest
 */
- (AWSTask *)cancelCertificateTransfer:(AWSIoTCancelCertificateTransferRequest *)request;

/**
 <p>Creates an X.509 certificate using the specified certificate signing request.</p><p><b>Note</b> Reusing the same certificate signing request (CSR) results in a distinct certificate.</p>
 
 @param request A container for the necessary parameters to execute the CreateCertificateFromCsr service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTCreateCertificateFromCsrResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreateCertificateFromCsrRequest
 @see AWSIoTCreateCertificateFromCsrResponse
 */
- (AWSTask *)createCertificateFromCsr:(AWSIoTCreateCertificateFromCsrRequest *)request;

/**
 <p>Creates a 2048 bit RSA key pair and issues an X.509 certificate using the issued public key.</p><p><b>Note</b> This is the only time AWS IoT issues the private key for this certificate. It is important to keep track of the private key.</p>
 
 @param request A container for the necessary parameters to execute the CreateKeysAndCertificate service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTCreateKeysAndCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreateKeysAndCertificateRequest
 @see AWSIoTCreateKeysAndCertificateResponse
 */
- (AWSTask *)createKeysAndCertificate:(AWSIoTCreateKeysAndCertificateRequest *)request;

/**
 <p>Creates an AWS IoT policy.</p><p>The created policy is the default version for the policy. This operation creates a policy version with a version identifier of <b>1</b> and sets <b>1</b> as the policy's default version.</p>
 
 @param request A container for the necessary parameters to execute the CreatePolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTCreatePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceAlreadyExists`, `AWSIoTErrorMalformedPolicy`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreatePolicyRequest
 @see AWSIoTCreatePolicyResponse
 */
- (AWSTask *)createPolicy:(AWSIoTCreatePolicyRequest *)request;

/**
 <p>Creates a new version of the specified AWS IoT policy.</p>
 
 @param request A container for the necessary parameters to execute the CreatePolicyVersion service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTCreatePolicyVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorMalformedPolicy`, `AWSIoTErrorVersionsLimitExceeded`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTCreatePolicyVersionRequest
 @see AWSIoTCreatePolicyVersionResponse
 */
- (AWSTask *)createPolicyVersion:(AWSIoTCreatePolicyVersionRequest *)request;

/**
 <p>Creates a thing in the thing registry.</p>
 
 @param request A container for the necessary parameters to execute the CreateThing service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTCreateThingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceAlreadyExists`.
 
 @see AWSIoTCreateThingRequest
 @see AWSIoTCreateThingResponse
 */
- (AWSTask *)createThing:(AWSIoTCreateThingRequest *)request;

/**
 <p>Creates a rule.</p>
 
 @param request A container for the necessary parameters to execute the CreateTopicRule service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorSqlParse`, `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorResourceAlreadyExists`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTCreateTopicRuleRequest
 */
- (AWSTask *)createTopicRule:(AWSIoTCreateTopicRuleRequest *)request;

/**
 <p>Deletes the specified certificate.</p><p>A certificate cannot be deleted if it has a policy attached to it. To delete a certificate, first detach all policies using the <a>DetachPrincipalPolicy</a> operation.</p><p>In addition, a certificate cannot be deleted if it is in ACTIVE status. To delete a certificate, first change the status to INACTIVE using the <a>UpdateCertificate</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCertificate service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorDeleteConflict`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorCertificateState`.
 
 @see AWSIoTDeleteCertificateRequest
 */
- (AWSTask *)deleteCertificate:(AWSIoTDeleteCertificateRequest *)request;

/**
 <p>Deletes the specified policy.</p><p>A policy cannot be deleted if: </p><p> - it has non-default versions</p><p> - it is attached to any certificate</p><p>To delete a policy:</p><p> - First delete all the non-default versions of the policy using the <a>DeletePolicyVersion</a> API.</p><p> - Detach it from any certificate using the <a>DetachPrincipalPolicy</a> API.</p><p>When a policy is deleted, its default version is deleted with it.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorDeleteConflict`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDeletePolicyRequest
 */
- (AWSTask *)deletePolicy:(AWSIoTDeletePolicyRequest *)request;

/**
 <p>Deletes the specified version of the specified policy. The default version of the policy cannot be deleted.</p><p>To delete the default version use the <a>DeletePolicy</a> API or mark the policy as non-default and then delete it.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicyVersion service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorDeleteConflict`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDeletePolicyVersionRequest
 */
- (AWSTask *)deletePolicyVersion:(AWSIoTDeletePolicyVersionRequest *)request;

/**
 <p>Deletes the specified thing from the Thing Registry.</p>
 
 @param request A container for the necessary parameters to execute the DeleteThing service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDeleteThingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDeleteThingRequest
 @see AWSIoTDeleteThingResponse
 */
- (AWSTask *)deleteThing:(AWSIoTDeleteThingRequest *)request;

/**
 <p>Deletes the specified rule.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTopicRule service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTDeleteTopicRuleRequest
 */
- (AWSTask *)deleteTopicRule:(AWSIoTDeleteTopicRuleRequest *)request;

/**
 <p>Gets information about the specified certificate.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCertificate service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDescribeCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTDescribeCertificateRequest
 @see AWSIoTDescribeCertificateResponse
 */
- (AWSTask *)describeCertificate:(AWSIoTDescribeCertificateRequest *)request;

/**
 <p>Returns a unique URL specific to the AWS account making the call. The URL points to the AWS IoT data plane endpoint. The customer-specific endpoint should be provided to all data plane operations.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoint service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDescribeEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternalFailure`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTDescribeEndpointRequest
 @see AWSIoTDescribeEndpointResponse
 */
- (AWSTask *)describeEndpoint:(AWSIoTDescribeEndpointRequest *)request;

/**
 <p>Gets information about the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the DescribeThing service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDescribeThingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDescribeThingRequest
 @see AWSIoTDescribeThingResponse
 */
- (AWSTask *)describeThing:(AWSIoTDescribeThingRequest *)request;

/**
 <p>Removes the specified policy from the specified certificate.</p>
 
 @param request A container for the necessary parameters to execute the DetachPrincipalPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDetachPrincipalPolicyRequest
 */
- (AWSTask *)detachPrincipalPolicy:(AWSIoTDetachPrincipalPolicyRequest *)request;

/**
 <p>Detaches the specified principal from the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the DetachThingPrincipal service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDetachThingPrincipalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTDetachThingPrincipalRequest
 @see AWSIoTDetachThingPrincipalResponse
 */
- (AWSTask *)detachThingPrincipal:(AWSIoTDetachThingPrincipalRequest *)request;

/**
 <p>Gets the logging options.</p>
 
 @param request A container for the necessary parameters to execute the GetLoggingOptions service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTGetLoggingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTGetLoggingOptionsRequest
 @see AWSIoTGetLoggingOptionsResponse
 */
- (AWSTask *)getLoggingOptions:(AWSIoTGetLoggingOptionsRequest *)request;

/**
 <p>Gets information about the specified policy with the policy document of the default version.</p>
 
 @param request A container for the necessary parameters to execute the GetPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTGetPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTGetPolicyRequest
 @see AWSIoTGetPolicyResponse
 */
- (AWSTask *)getPolicy:(AWSIoTGetPolicyRequest *)request;

/**
 <p>Gets information about the specified policy version.</p>
 
 @param request A container for the necessary parameters to execute the GetPolicyVersion service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTGetPolicyVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTGetPolicyVersionRequest
 @see AWSIoTGetPolicyVersionResponse
 */
- (AWSTask *)getPolicyVersion:(AWSIoTGetPolicyVersionRequest *)request;

/**
 <p>Gets information about the specified rule.</p>
 
 @param request A container for the necessary parameters to execute the GetTopicRule service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTGetTopicRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTGetTopicRuleRequest
 @see AWSIoTGetTopicRuleResponse
 */
- (AWSTask *)getTopicRule:(AWSIoTGetTopicRuleRequest *)request;

/**
 <p>Lists your certificates.</p><p>The results are paginated with a default page size of 25. You can retrieve additional results using the returned marker.</p>
 
 @param request A container for the necessary parameters to execute the ListCertificates service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListCertificatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListCertificatesRequest
 @see AWSIoTListCertificatesResponse
 */
- (AWSTask *)listCertificates:(AWSIoTListCertificatesRequest *)request;

/**
 <p>Lists your policies.</p>
 
 @param request A container for the necessary parameters to execute the ListPolicies service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPoliciesRequest
 @see AWSIoTListPoliciesResponse
 */
- (AWSTask *)listPolicies:(AWSIoTListPoliciesRequest *)request;

/**
 <p>Lists the versions of the specified policy, and identifies the default version.</p>
 
 @param request A container for the necessary parameters to execute the ListPolicyVersions service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListPolicyVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPolicyVersionsRequest
 @see AWSIoTListPolicyVersionsResponse
 */
- (AWSTask *)listPolicyVersions:(AWSIoTListPolicyVersionsRequest *)request;

/**
 <p>Lists the policies attached to the specified principal. If you use an Amazon Cognito identity, the ID needs to be in <a href="http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetCredentialsForIdentity.html#API_GetCredentialsForIdentity_RequestSyntax">Amazon Cognito Identity format</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListPrincipalPolicies service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListPrincipalPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPrincipalPoliciesRequest
 @see AWSIoTListPrincipalPoliciesResponse
 */
- (AWSTask *)listPrincipalPolicies:(AWSIoTListPrincipalPoliciesRequest *)request;

/**
 <p>Lists the things associated with the specified principal.</p>
 
 @param request A container for the necessary parameters to execute the ListPrincipalThings service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListPrincipalThingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListPrincipalThingsRequest
 @see AWSIoTListPrincipalThingsResponse
 */
- (AWSTask *)listPrincipalThings:(AWSIoTListPrincipalThingsRequest *)request;

/**
 <p>Lists the principals associated with the specified thing.</p>
 
 @param request A container for the necessary parameters to execute the ListThingPrincipals service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListThingPrincipalsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListThingPrincipalsRequest
 @see AWSIoTListThingPrincipalsResponse
 */
- (AWSTask *)listThingPrincipals:(AWSIoTListThingPrincipalsRequest *)request;

/**
 <p>Lists your things. You can pass an AttributeName and/or AttributeValue to filter your things. For example: "ListThings where AttributeName=Color and AttributeValue=Red"</p>
 
 @param request A container for the necessary parameters to execute the ListThings service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListThingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTListThingsRequest
 @see AWSIoTListThingsResponse
 */
- (AWSTask *)listThings:(AWSIoTListThingsRequest *)request;

/**
 <p>Lists the rules for the specific topic.</p>
 
 @param request A container for the necessary parameters to execute the ListTopicRules service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTListTopicRulesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTListTopicRulesRequest
 @see AWSIoTListTopicRulesResponse
 */
- (AWSTask *)listTopicRules:(AWSIoTListTopicRulesRequest *)request;

/**
 <p>Rejects a pending certificate transfer. After AWS IoT rejects a certificate transfer, the certificate status changes from <b>PENDING_TRANFER</b> to <b>INACTIVE</b>.</p><p>To check for pending certificate transfers, call <a>ListCertificates</a> to enumerate your certificates.</p><p>This operation can only be called by the transfer destination. Once called, the certificate will be returned to the source's account in the INACTIVE state.</p>
 
 @param request A container for the necessary parameters to execute the RejectCertificateTransfer service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorTransferAlreadyCompleted`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTRejectCertificateTransferRequest
 */
- (AWSTask *)rejectCertificateTransfer:(AWSIoTRejectCertificateTransferRequest *)request;

/**
 <p>Replaces the specified rule. You must specify all parameters for the new rule.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceTopicRule service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorSqlParse`, `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorUnauthorized`.
 
 @see AWSIoTReplaceTopicRuleRequest
 */
- (AWSTask *)replaceTopicRule:(AWSIoTReplaceTopicRuleRequest *)request;

/**
 <p>Sets the specified policy version as the default for the specified policy.</p>
 
 @param request A container for the necessary parameters to execute the SetDefaultPolicyVersion service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTSetDefaultPolicyVersionRequest
 */
- (AWSTask *)setDefaultPolicyVersion:(AWSIoTSetDefaultPolicyVersionRequest *)request;

/**
 <p>Sets the logging options.</p>
 
 @param request A container for the necessary parameters to execute the SetLoggingOptions service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInternal`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorServiceUnavailable`.
 
 @see AWSIoTSetLoggingOptionsRequest
 */
- (AWSTask *)setLoggingOptions:(AWSIoTSetLoggingOptionsRequest *)request;

/**
 <p>Transfers the specified certificate to the specified AWS account.</p><p>You can cancel the transfer until it is acknowledged by the recipient.</p><p>No notification is sent to the transfer destination's account, it is up to the caller to notify the transfer target.</p><p>The certificate being transferred must not be in the ACTIVE state. It can be deactivated using the UpdateCertificate API.</p><p>The certificate must not have any policies attached to it. These can be detached using the <a>DetachPrincipalPolicy</a> API.</p>
 
 @param request A container for the necessary parameters to execute the TransferCertificate service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTTransferCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorResourceNotFound`, `AWSIoTErrorCertificateState`, `AWSIoTErrorTransferConflict`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTTransferCertificateRequest
 @see AWSIoTTransferCertificateResponse
 */
- (AWSTask *)transferCertificate:(AWSIoTTransferCertificateRequest *)request;

/**
 <p>Updates the status of the specified certificate. This operation is idempotent.</p><p>Moving a cert from the ACTIVE state (including REVOKED) will NOT disconnect currently-connected devices, although these devices will be unable to reconnect.</p><p>The ACTIVE state is required to authenticate devices connecting to AWS IoT using a certificate.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCertificate service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorResourceNotFound`, `AWSIoTErrorCertificateState`, `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`.
 
 @see AWSIoTUpdateCertificateRequest
 */
- (AWSTask *)updateCertificate:(AWSIoTUpdateCertificateRequest *)request;

/**
 <p>Updates the data for a thing.</p>
 
 @param request A container for the necessary parameters to execute the UpdateThing service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTUpdateThingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTErrorDomain` domain and the following error code: `AWSIoTErrorInvalidRequest`, `AWSIoTErrorThrottling`, `AWSIoTErrorUnauthorized`, `AWSIoTErrorServiceUnavailable`, `AWSIoTErrorInternalFailure`, `AWSIoTErrorResourceNotFound`.
 
 @see AWSIoTUpdateThingRequest
 @see AWSIoTUpdateThingResponse
 */
- (AWSTask *)updateThing:(AWSIoTUpdateThingRequest *)request;

@end

NS_ASSUME_NONNULL_END
