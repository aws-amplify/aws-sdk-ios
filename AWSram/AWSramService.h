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
#import "AWSramModel.h"
#import "AWSramResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSram
FOUNDATION_EXPORT NSString *const AWSramSDKVersion;

/**
 <p>Use AWS Resource Access Manager to share AWS resources between AWS accounts. To share a resource, you create a resource share, associate the resource with the resource share, and specify the principals that can access the resources associated with the resource share. The following principals are supported: AWS accounts, organizational units (OU) from AWS Organizations, and organizations from AWS Organizations.</p><p>For more information, see the <a href="https://docs.aws.amazon.com/ram/latest/userguide/">AWS Resource Access Manager User Guide</a>.</p>
 */
@interface AWSram : AWSService

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

     let ram = AWSram.default()

 *Objective-C*

     AWSram *ram = [AWSram defaultram];

 @return The default service client.
 */
+ (instancetype)defaultram;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSram.register(with: configuration!, forKey: "USWest2ram")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSram registerramWithConfiguration:configuration forKey:@"USWest2ram"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ram = AWSram(forKey: "USWest2ram")

 *Objective-C*

     AWSram *ram = [AWSram ramForKey:@"USWest2ram"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerramWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerramWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSram.register(with: configuration!, forKey: "USWest2ram")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSram registerramWithConfiguration:configuration forKey:@"USWest2ram"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ram = AWSram(forKey: "USWest2ram")

 *Objective-C*

     AWSram *ram = [AWSram ramForKey:@"USWest2ram"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ramForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeramForKey:(NSString *)key;

/**
 <p>Accepts an invitation to a resource share from another AWS account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptResourceShareInvitation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramAcceptResourceShareInvitationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorOperationNotPermitted`, `AWSramErrorResourceShareInvitationArnNotFound`, `AWSramErrorResourceShareInvitationAlreadyAccepted`, `AWSramErrorResourceShareInvitationAlreadyRejected`, `AWSramErrorResourceShareInvitationExpired`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorInvalidClientToken`, `AWSramErrorIdempotentParameterMismatch`.
 
 @see AWSramAcceptResourceShareInvitationRequest
 @see AWSramAcceptResourceShareInvitationResponse
 */
- (AWSTask<AWSramAcceptResourceShareInvitationResponse *> *)acceptResourceShareInvitation:(AWSramAcceptResourceShareInvitationRequest *)request;

/**
 <p>Accepts an invitation to a resource share from another AWS account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptResourceShareInvitation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorOperationNotPermitted`, `AWSramErrorResourceShareInvitationArnNotFound`, `AWSramErrorResourceShareInvitationAlreadyAccepted`, `AWSramErrorResourceShareInvitationAlreadyRejected`, `AWSramErrorResourceShareInvitationExpired`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorInvalidClientToken`, `AWSramErrorIdempotentParameterMismatch`.
 
 @see AWSramAcceptResourceShareInvitationRequest
 @see AWSramAcceptResourceShareInvitationResponse
 */
- (void)acceptResourceShareInvitation:(AWSramAcceptResourceShareInvitationRequest *)request completionHandler:(void (^ _Nullable)(AWSramAcceptResourceShareInvitationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified resource share with the specified principals and resources.</p>
 
 @param request A container for the necessary parameters to execute the AssociateResourceShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramAssociateResourceShareResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorIdempotentParameterMismatch`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidStateTransition`, `AWSramErrorResourceShareLimitExceeded`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidStateTransition`, `AWSramErrorInvalidClientToken`, `AWSramErrorInvalidParameter`, `AWSramErrorOperationNotPermitted`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorUnknownResource`.
 
 @see AWSramAssociateResourceShareRequest
 @see AWSramAssociateResourceShareResponse
 */
- (AWSTask<AWSramAssociateResourceShareResponse *> *)associateResourceShare:(AWSramAssociateResourceShareRequest *)request;

/**
 <p>Associates the specified resource share with the specified principals and resources.</p>
 
 @param request A container for the necessary parameters to execute the AssociateResourceShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorIdempotentParameterMismatch`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidStateTransition`, `AWSramErrorResourceShareLimitExceeded`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidStateTransition`, `AWSramErrorInvalidClientToken`, `AWSramErrorInvalidParameter`, `AWSramErrorOperationNotPermitted`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorUnknownResource`.
 
 @see AWSramAssociateResourceShareRequest
 @see AWSramAssociateResourceShareResponse
 */
- (void)associateResourceShare:(AWSramAssociateResourceShareRequest *)request completionHandler:(void (^ _Nullable)(AWSramAssociateResourceShareResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a permission with a resource share.</p>
 
 @param request A container for the necessary parameters to execute the AssociateResourceSharePermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramAssociateResourceSharePermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidParameter`, `AWSramErrorInvalidClientToken`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorOperationNotPermitted`.
 
 @see AWSramAssociateResourceSharePermissionRequest
 @see AWSramAssociateResourceSharePermissionResponse
 */
- (AWSTask<AWSramAssociateResourceSharePermissionResponse *> *)associateResourceSharePermission:(AWSramAssociateResourceSharePermissionRequest *)request;

/**
 <p>Associates a permission with a resource share.</p>
 
 @param request A container for the necessary parameters to execute the AssociateResourceSharePermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidParameter`, `AWSramErrorInvalidClientToken`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorOperationNotPermitted`.
 
 @see AWSramAssociateResourceSharePermissionRequest
 @see AWSramAssociateResourceSharePermissionResponse
 */
- (void)associateResourceSharePermission:(AWSramAssociateResourceSharePermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSramAssociateResourceSharePermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a resource share.</p>
 
 @param request A container for the necessary parameters to execute the CreateResourceShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramCreateResourceShareResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorIdempotentParameterMismatch`, `AWSramErrorInvalidStateTransition`, `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidClientToken`, `AWSramErrorInvalidParameter`, `AWSramErrorOperationNotPermitted`, `AWSramErrorResourceShareLimitExceeded`, `AWSramErrorTagPolicyViolation`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramCreateResourceShareRequest
 @see AWSramCreateResourceShareResponse
 */
- (AWSTask<AWSramCreateResourceShareResponse *> *)createResourceShare:(AWSramCreateResourceShareRequest *)request;

/**
 <p>Creates a resource share.</p>
 
 @param request A container for the necessary parameters to execute the CreateResourceShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorIdempotentParameterMismatch`, `AWSramErrorInvalidStateTransition`, `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidClientToken`, `AWSramErrorInvalidParameter`, `AWSramErrorOperationNotPermitted`, `AWSramErrorResourceShareLimitExceeded`, `AWSramErrorTagPolicyViolation`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramCreateResourceShareRequest
 @see AWSramCreateResourceShareResponse
 */
- (void)createResourceShare:(AWSramCreateResourceShareRequest *)request completionHandler:(void (^ _Nullable)(AWSramCreateResourceShareResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified resource share.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourceShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramDeleteResourceShareResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorOperationNotPermitted`, `AWSramErrorIdempotentParameterMismatch`, `AWSramErrorInvalidStateTransition`, `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidClientToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramDeleteResourceShareRequest
 @see AWSramDeleteResourceShareResponse
 */
- (AWSTask<AWSramDeleteResourceShareResponse *> *)deleteResourceShare:(AWSramDeleteResourceShareRequest *)request;

/**
 <p>Deletes the specified resource share.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourceShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorOperationNotPermitted`, `AWSramErrorIdempotentParameterMismatch`, `AWSramErrorInvalidStateTransition`, `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidClientToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramDeleteResourceShareRequest
 @see AWSramDeleteResourceShareResponse
 */
- (void)deleteResourceShare:(AWSramDeleteResourceShareRequest *)request completionHandler:(void (^ _Nullable)(AWSramDeleteResourceShareResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified principals or resources from the specified resource share.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateResourceShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramDisassociateResourceShareResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorIdempotentParameterMismatch`, `AWSramErrorResourceShareLimitExceeded`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidStateTransition`, `AWSramErrorInvalidClientToken`, `AWSramErrorInvalidParameter`, `AWSramErrorOperationNotPermitted`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorUnknownResource`.
 
 @see AWSramDisassociateResourceShareRequest
 @see AWSramDisassociateResourceShareResponse
 */
- (AWSTask<AWSramDisassociateResourceShareResponse *> *)disassociateResourceShare:(AWSramDisassociateResourceShareRequest *)request;

/**
 <p>Disassociates the specified principals or resources from the specified resource share.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateResourceShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorIdempotentParameterMismatch`, `AWSramErrorResourceShareLimitExceeded`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidStateTransition`, `AWSramErrorInvalidClientToken`, `AWSramErrorInvalidParameter`, `AWSramErrorOperationNotPermitted`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorUnknownResource`.
 
 @see AWSramDisassociateResourceShareRequest
 @see AWSramDisassociateResourceShareResponse
 */
- (void)disassociateResourceShare:(AWSramDisassociateResourceShareRequest *)request completionHandler:(void (^ _Nullable)(AWSramDisassociateResourceShareResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates an AWS RAM permission from a resource share.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateResourceSharePermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramDisassociateResourceSharePermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidParameter`, `AWSramErrorInvalidClientToken`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorOperationNotPermitted`.
 
 @see AWSramDisassociateResourceSharePermissionRequest
 @see AWSramDisassociateResourceSharePermissionResponse
 */
- (AWSTask<AWSramDisassociateResourceSharePermissionResponse *> *)disassociateResourceSharePermission:(AWSramDisassociateResourceSharePermissionRequest *)request;

/**
 <p>Disassociates an AWS RAM permission from a resource share.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateResourceSharePermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidParameter`, `AWSramErrorInvalidClientToken`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorOperationNotPermitted`.
 
 @see AWSramDisassociateResourceSharePermissionRequest
 @see AWSramDisassociateResourceSharePermissionResponse
 */
- (void)disassociateResourceSharePermission:(AWSramDisassociateResourceSharePermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSramDisassociateResourceSharePermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables resource sharing within your AWS Organization.</p><p>The caller must be the master account for the AWS Organization.</p>
 
 @param request A container for the necessary parameters to execute the EnableSharingWithAwsOrganization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramEnableSharingWithAwsOrganizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorOperationNotPermitted`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramEnableSharingWithAwsOrganizationRequest
 @see AWSramEnableSharingWithAwsOrganizationResponse
 */
- (AWSTask<AWSramEnableSharingWithAwsOrganizationResponse *> *)enableSharingWithAwsOrganization:(AWSramEnableSharingWithAwsOrganizationRequest *)request;

/**
 <p>Enables resource sharing within your AWS Organization.</p><p>The caller must be the master account for the AWS Organization.</p>
 
 @param request A container for the necessary parameters to execute the EnableSharingWithAwsOrganization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorOperationNotPermitted`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramEnableSharingWithAwsOrganizationRequest
 @see AWSramEnableSharingWithAwsOrganizationResponse
 */
- (void)enableSharingWithAwsOrganization:(AWSramEnableSharingWithAwsOrganizationRequest *)request completionHandler:(void (^ _Nullable)(AWSramEnableSharingWithAwsOrganizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the contents of an AWS RAM permission in JSON format.</p>
 
 @param request A container for the necessary parameters to execute the GetPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramGetPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidParameter`, `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorOperationNotPermitted`.
 
 @see AWSramGetPermissionRequest
 @see AWSramGetPermissionResponse
 */
- (AWSTask<AWSramGetPermissionResponse *> *)getPermission:(AWSramGetPermissionRequest *)request;

/**
 <p>Gets the contents of an AWS RAM permission in JSON format.</p>
 
 @param request A container for the necessary parameters to execute the GetPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidParameter`, `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorOperationNotPermitted`.
 
 @see AWSramGetPermissionRequest
 @see AWSramGetPermissionResponse
 */
- (void)getPermission:(AWSramGetPermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSramGetPermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the policies for the specified resources that you own and have shared.</p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramGetResourcePoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorResourceArnNotFound`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramGetResourcePoliciesRequest
 @see AWSramGetResourcePoliciesResponse
 */
- (AWSTask<AWSramGetResourcePoliciesResponse *> *)getResourcePolicies:(AWSramGetResourcePoliciesRequest *)request;

/**
 <p>Gets the policies for the specified resources that you own and have shared.</p>
 
 @param request A container for the necessary parameters to execute the GetResourcePolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorResourceArnNotFound`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramGetResourcePoliciesRequest
 @see AWSramGetResourcePoliciesResponse
 */
- (void)getResourcePolicies:(AWSramGetResourcePoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSramGetResourcePoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the resources or principals for the resource shares that you own.</p>
 
 @param request A container for the necessary parameters to execute the GetResourceShareAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramGetResourceShareAssociationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorOperationNotPermitted`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramGetResourceShareAssociationsRequest
 @see AWSramGetResourceShareAssociationsResponse
 */
- (AWSTask<AWSramGetResourceShareAssociationsResponse *> *)getResourceShareAssociations:(AWSramGetResourceShareAssociationsRequest *)request;

/**
 <p>Gets the resources or principals for the resource shares that you own.</p>
 
 @param request A container for the necessary parameters to execute the GetResourceShareAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorOperationNotPermitted`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramGetResourceShareAssociationsRequest
 @see AWSramGetResourceShareAssociationsResponse
 */
- (void)getResourceShareAssociations:(AWSramGetResourceShareAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSramGetResourceShareAssociationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the invitations for resource sharing that you've received.</p>
 
 @param request A container for the necessary parameters to execute the GetResourceShareInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramGetResourceShareInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorResourceShareInvitationArnNotFound`, `AWSramErrorInvalidMaxResults`, `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramGetResourceShareInvitationsRequest
 @see AWSramGetResourceShareInvitationsResponse
 */
- (AWSTask<AWSramGetResourceShareInvitationsResponse *> *)getResourceShareInvitations:(AWSramGetResourceShareInvitationsRequest *)request;

/**
 <p>Gets the invitations for resource sharing that you've received.</p>
 
 @param request A container for the necessary parameters to execute the GetResourceShareInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorResourceShareInvitationArnNotFound`, `AWSramErrorInvalidMaxResults`, `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramGetResourceShareInvitationsRequest
 @see AWSramGetResourceShareInvitationsResponse
 */
- (void)getResourceShareInvitations:(AWSramGetResourceShareInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSramGetResourceShareInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the resource shares that you own or the resource shares that are shared with you.</p>
 
 @param request A container for the necessary parameters to execute the GetResourceShares service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramGetResourceSharesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramGetResourceSharesRequest
 @see AWSramGetResourceSharesResponse
 */
- (AWSTask<AWSramGetResourceSharesResponse *> *)getResourceShares:(AWSramGetResourceSharesRequest *)request;

/**
 <p>Gets the resource shares that you own or the resource shares that are shared with you.</p>
 
 @param request A container for the necessary parameters to execute the GetResourceShares service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramGetResourceSharesRequest
 @see AWSramGetResourceSharesResponse
 */
- (void)getResourceShares:(AWSramGetResourceSharesRequest *)request completionHandler:(void (^ _Nullable)(AWSramGetResourceSharesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the resources in a resource share that is shared with you but that the invitation is still pending for.</p>
 
 @param request A container for the necessary parameters to execute the ListPendingInvitationResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramListPendingInvitationResourcesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorResourceShareInvitationArnNotFound`, `AWSramErrorMissingRequiredParameter`, `AWSramErrorResourceShareInvitationAlreadyRejected`, `AWSramErrorResourceShareInvitationExpired`.
 
 @see AWSramListPendingInvitationResourcesRequest
 @see AWSramListPendingInvitationResourcesResponse
 */
- (AWSTask<AWSramListPendingInvitationResourcesResponse *> *)listPendingInvitationResources:(AWSramListPendingInvitationResourcesRequest *)request;

/**
 <p>Lists the resources in a resource share that is shared with you but that the invitation is still pending for.</p>
 
 @param request A container for the necessary parameters to execute the ListPendingInvitationResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorResourceShareInvitationArnNotFound`, `AWSramErrorMissingRequiredParameter`, `AWSramErrorResourceShareInvitationAlreadyRejected`, `AWSramErrorResourceShareInvitationExpired`.
 
 @see AWSramListPendingInvitationResourcesRequest
 @see AWSramListPendingInvitationResourcesResponse
 */
- (void)listPendingInvitationResources:(AWSramListPendingInvitationResourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSramListPendingInvitationResourcesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the AWS RAM permissions.</p>
 
 @param request A container for the necessary parameters to execute the ListPermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramListPermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidParameter`, `AWSramErrorInvalidNextToken`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorOperationNotPermitted`.
 
 @see AWSramListPermissionsRequest
 @see AWSramListPermissionsResponse
 */
- (AWSTask<AWSramListPermissionsResponse *> *)listPermissions:(AWSramListPermissionsRequest *)request;

/**
 <p>Lists the AWS RAM permissions.</p>
 
 @param request A container for the necessary parameters to execute the ListPermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidParameter`, `AWSramErrorInvalidNextToken`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorOperationNotPermitted`.
 
 @see AWSramListPermissionsRequest
 @see AWSramListPermissionsResponse
 */
- (void)listPermissions:(AWSramListPermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSramListPermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the principals that you have shared resources with or that have shared resources with you.</p>
 
 @param request A container for the necessary parameters to execute the ListPrincipals service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramListPrincipalsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramListPrincipalsRequest
 @see AWSramListPrincipalsResponse
 */
- (AWSTask<AWSramListPrincipalsResponse *> *)listPrincipals:(AWSramListPrincipalsRequest *)request;

/**
 <p>Lists the principals that you have shared resources with or that have shared resources with you.</p>
 
 @param request A container for the necessary parameters to execute the ListPrincipals service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramListPrincipalsRequest
 @see AWSramListPrincipalsResponse
 */
- (void)listPrincipals:(AWSramListPrincipalsRequest *)request completionHandler:(void (^ _Nullable)(AWSramListPrincipalsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the AWS RAM permissions that are associated with a resource share.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceSharePermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramListResourceSharePermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidParameter`, `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidNextToken`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorOperationNotPermitted`.
 
 @see AWSramListResourceSharePermissionsRequest
 @see AWSramListResourceSharePermissionsResponse
 */
- (AWSTask<AWSramListResourceSharePermissionsResponse *> *)listResourceSharePermissions:(AWSramListResourceSharePermissionsRequest *)request;

/**
 <p>Lists the AWS RAM permissions that are associated with a resource share.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceSharePermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidParameter`, `AWSramErrorMalformedArn`, `AWSramErrorUnknownResource`, `AWSramErrorInvalidNextToken`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorOperationNotPermitted`.
 
 @see AWSramListResourceSharePermissionsRequest
 @see AWSramListResourceSharePermissionsResponse
 */
- (void)listResourceSharePermissions:(AWSramListResourceSharePermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSramListResourceSharePermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the shareable resource types supported by AWS RAM.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramListResourceTypesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramListResourceTypesRequest
 @see AWSramListResourceTypesResponse
 */
- (AWSTask<AWSramListResourceTypesResponse *> *)listResourceTypes:(AWSramListResourceTypesRequest *)request;

/**
 <p>Lists the shareable resource types supported by AWS RAM.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramListResourceTypesRequest
 @see AWSramListResourceTypesResponse
 */
- (void)listResourceTypes:(AWSramListResourceTypesRequest *)request completionHandler:(void (^ _Nullable)(AWSramListResourceTypesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the resources that you added to a resource shares or the resources that are shared with you.</p>
 
 @param request A container for the necessary parameters to execute the ListResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramListResourcesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidResourceType`, `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramListResourcesRequest
 @see AWSramListResourcesResponse
 */
- (AWSTask<AWSramListResourcesResponse *> *)listResources:(AWSramListResourcesRequest *)request;

/**
 <p>Lists the resources that you added to a resource shares or the resources that are shared with you.</p>
 
 @param request A container for the necessary parameters to execute the ListResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidResourceType`, `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidNextToken`, `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramListResourcesRequest
 @see AWSramListResourcesResponse
 */
- (void)listResources:(AWSramListResourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSramListResourcesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resource shares that were created by attaching a policy to a resource are visible only to the resource share owner, and the resource share cannot be modified in AWS RAM.</p><p>Use this API action to promote the resource share. When you promote the resource share, it becomes:</p><ul><li><p>Visible to all principals that it is shared with.</p></li><li><p>Modifiable in AWS RAM.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PromoteResourceShareCreatedFromPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramPromoteResourceShareCreatedFromPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorOperationNotPermitted`, `AWSramErrorInvalidParameter`, `AWSramErrorMissingRequiredParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorUnknownResource`.
 
 @see AWSramPromoteResourceShareCreatedFromPolicyRequest
 @see AWSramPromoteResourceShareCreatedFromPolicyResponse
 */
- (AWSTask<AWSramPromoteResourceShareCreatedFromPolicyResponse *> *)promoteResourceShareCreatedFromPolicy:(AWSramPromoteResourceShareCreatedFromPolicyRequest *)request;

/**
 <p>Resource shares that were created by attaching a policy to a resource are visible only to the resource share owner, and the resource share cannot be modified in AWS RAM.</p><p>Use this API action to promote the resource share. When you promote the resource share, it becomes:</p><ul><li><p>Visible to all principals that it is shared with.</p></li><li><p>Modifiable in AWS RAM.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PromoteResourceShareCreatedFromPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorOperationNotPermitted`, `AWSramErrorInvalidParameter`, `AWSramErrorMissingRequiredParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorUnknownResource`.
 
 @see AWSramPromoteResourceShareCreatedFromPolicyRequest
 @see AWSramPromoteResourceShareCreatedFromPolicyResponse
 */
- (void)promoteResourceShareCreatedFromPolicy:(AWSramPromoteResourceShareCreatedFromPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSramPromoteResourceShareCreatedFromPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Rejects an invitation to a resource share from another AWS account.</p>
 
 @param request A container for the necessary parameters to execute the RejectResourceShareInvitation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramRejectResourceShareInvitationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorOperationNotPermitted`, `AWSramErrorResourceShareInvitationArnNotFound`, `AWSramErrorResourceShareInvitationAlreadyAccepted`, `AWSramErrorResourceShareInvitationAlreadyRejected`, `AWSramErrorResourceShareInvitationExpired`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorInvalidClientToken`, `AWSramErrorIdempotentParameterMismatch`.
 
 @see AWSramRejectResourceShareInvitationRequest
 @see AWSramRejectResourceShareInvitationResponse
 */
- (AWSTask<AWSramRejectResourceShareInvitationResponse *> *)rejectResourceShareInvitation:(AWSramRejectResourceShareInvitationRequest *)request;

/**
 <p>Rejects an invitation to a resource share from another AWS account.</p>
 
 @param request A container for the necessary parameters to execute the RejectResourceShareInvitation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorMalformedArn`, `AWSramErrorOperationNotPermitted`, `AWSramErrorResourceShareInvitationArnNotFound`, `AWSramErrorResourceShareInvitationAlreadyAccepted`, `AWSramErrorResourceShareInvitationAlreadyRejected`, `AWSramErrorResourceShareInvitationExpired`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`, `AWSramErrorInvalidClientToken`, `AWSramErrorIdempotentParameterMismatch`.
 
 @see AWSramRejectResourceShareInvitationRequest
 @see AWSramRejectResourceShareInvitationResponse
 */
- (void)rejectResourceShareInvitation:(AWSramRejectResourceShareInvitationRequest *)request completionHandler:(void (^ _Nullable)(AWSramRejectResourceShareInvitationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified tags to the specified resource share that you own.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidParameter`, `AWSramErrorMalformedArn`, `AWSramErrorTagLimitExceeded`, `AWSramErrorResourceArnNotFound`, `AWSramErrorTagPolicyViolation`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramTagResourceRequest
 @see AWSramTagResourceResponse
 */
- (AWSTask<AWSramTagResourceResponse *> *)tagResource:(AWSramTagResourceRequest *)request;

/**
 <p>Adds the specified tags to the specified resource share that you own.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidParameter`, `AWSramErrorMalformedArn`, `AWSramErrorTagLimitExceeded`, `AWSramErrorResourceArnNotFound`, `AWSramErrorTagPolicyViolation`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramTagResourceRequest
 @see AWSramTagResourceResponse
 */
- (void)tagResource:(AWSramTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSramTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tags from the specified resource share that you own.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramUntagResourceRequest
 @see AWSramUntagResourceResponse
 */
- (AWSTask<AWSramUntagResourceResponse *> *)untagResource:(AWSramUntagResourceRequest *)request;

/**
 <p>Removes the specified tags from the specified resource share that you own.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorInvalidParameter`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramUntagResourceRequest
 @see AWSramUntagResourceResponse
 */
- (void)untagResource:(AWSramUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSramUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified resource share that you own.</p>
 
 @param request A container for the necessary parameters to execute the UpdateResourceShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSramUpdateResourceShareResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorIdempotentParameterMismatch`, `AWSramErrorMissingRequiredParameter`, `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidClientToken`, `AWSramErrorInvalidParameter`, `AWSramErrorOperationNotPermitted`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramUpdateResourceShareRequest
 @see AWSramUpdateResourceShareResponse
 */
- (AWSTask<AWSramUpdateResourceShareResponse *> *)updateResourceShare:(AWSramUpdateResourceShareRequest *)request;

/**
 <p>Updates the specified resource share that you own.</p>
 
 @param request A container for the necessary parameters to execute the UpdateResourceShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSramErrorDomain` domain and the following error code: `AWSramErrorIdempotentParameterMismatch`, `AWSramErrorMissingRequiredParameter`, `AWSramErrorUnknownResource`, `AWSramErrorMalformedArn`, `AWSramErrorInvalidClientToken`, `AWSramErrorInvalidParameter`, `AWSramErrorOperationNotPermitted`, `AWSramErrorServerInternal`, `AWSramErrorServiceUnavailable`.
 
 @see AWSramUpdateResourceShareRequest
 @see AWSramUpdateResourceShareResponse
 */
- (void)updateResourceShare:(AWSramUpdateResourceShareRequest *)request completionHandler:(void (^ _Nullable)(AWSramUpdateResourceShareResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
