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
#import "AWSWorklinkModel.h"
#import "AWSWorklinkResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSWorklink
FOUNDATION_EXPORT NSString *const AWSWorklinkSDKVersion;

/**
 <p>Amazon WorkLink is a cloud-based service that provides secure access to internal websites and web apps from iOS and Android phones. In a single step, your users, such as employees, can access internal websites as efficiently as they access any other public website. They enter a URL in their web browser, or choose a link to an internal website in an email. Amazon WorkLink authenticates the user's access and securely renders authorized internal web content in a secure rendering service in the AWS cloud. Amazon WorkLink doesn't download or store any internal web content on mobile devices.</p>
 */
@interface AWSWorklink : AWSService

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

     let Worklink = AWSWorklink.default()

 *Objective-C*

     AWSWorklink *Worklink = [AWSWorklink defaultWorklink];

 @return The default service client.
 */
+ (instancetype)defaultWorklink;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSWorklink.register(with: configuration!, forKey: "USWest2Worklink")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:@"USWest2Worklink"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Worklink = AWSWorklink(forKey: "USWest2Worklink")

 *Objective-C*

     AWSWorklink *Worklink = [AWSWorklink WorklinkForKey:@"USWest2Worklink"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerWorklinkWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerWorklinkWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSWorklink.register(with: configuration!, forKey: "USWest2Worklink")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:@"USWest2Worklink"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Worklink = AWSWorklink(forKey: "USWest2Worklink")

 *Objective-C*

     AWSWorklink *Worklink = [AWSWorklink WorklinkForKey:@"USWest2Worklink"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)WorklinkForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeWorklinkForKey:(NSString *)key;

/**
 <p>Specifies a domain to be associated to Amazon WorkLink.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkAssociateDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorResourceAlreadyExists`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkAssociateDomainRequest
 @see AWSWorklinkAssociateDomainResponse
 */
- (AWSTask<AWSWorklinkAssociateDomainResponse *> *)associateDomain:(AWSWorklinkAssociateDomainRequest *)request;

/**
 <p>Specifies a domain to be associated to Amazon WorkLink.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorResourceAlreadyExists`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkAssociateDomainRequest
 @see AWSWorklinkAssociateDomainResponse
 */
- (void)associateDomain:(AWSWorklinkAssociateDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkAssociateDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a website authorization provider with a specified fleet. This is used to authorize users against associated websites in the company network.</p>
 
 @param request A container for the necessary parameters to execute the AssociateWebsiteAuthorizationProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkAssociateWebsiteAuthorizationProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorResourceAlreadyExists`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkAssociateWebsiteAuthorizationProviderRequest
 @see AWSWorklinkAssociateWebsiteAuthorizationProviderResponse
 */
- (AWSTask<AWSWorklinkAssociateWebsiteAuthorizationProviderResponse *> *)associateWebsiteAuthorizationProvider:(AWSWorklinkAssociateWebsiteAuthorizationProviderRequest *)request;

/**
 <p>Associates a website authorization provider with a specified fleet. This is used to authorize users against associated websites in the company network.</p>
 
 @param request A container for the necessary parameters to execute the AssociateWebsiteAuthorizationProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorResourceAlreadyExists`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkAssociateWebsiteAuthorizationProviderRequest
 @see AWSWorklinkAssociateWebsiteAuthorizationProviderResponse
 */
- (void)associateWebsiteAuthorizationProvider:(AWSWorklinkAssociateWebsiteAuthorizationProviderRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkAssociateWebsiteAuthorizationProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports the root certificate of a certificate authority (CA) used to obtain TLS certificates used by associated websites within the company network.</p>
 
 @param request A container for the necessary parameters to execute the AssociateWebsiteCertificateAuthority service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkAssociateWebsiteCertificateAuthorityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorResourceAlreadyExists`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkAssociateWebsiteCertificateAuthorityRequest
 @see AWSWorklinkAssociateWebsiteCertificateAuthorityResponse
 */
- (AWSTask<AWSWorklinkAssociateWebsiteCertificateAuthorityResponse *> *)associateWebsiteCertificateAuthority:(AWSWorklinkAssociateWebsiteCertificateAuthorityRequest *)request;

/**
 <p>Imports the root certificate of a certificate authority (CA) used to obtain TLS certificates used by associated websites within the company network.</p>
 
 @param request A container for the necessary parameters to execute the AssociateWebsiteCertificateAuthority service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorResourceAlreadyExists`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkAssociateWebsiteCertificateAuthorityRequest
 @see AWSWorklinkAssociateWebsiteCertificateAuthorityResponse
 */
- (void)associateWebsiteCertificateAuthority:(AWSWorklinkAssociateWebsiteCertificateAuthorityRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkAssociateWebsiteCertificateAuthorityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a fleet. A fleet consists of resources and the configuration that delivers associated websites to authorized users who download and set up the Amazon WorkLink app.</p>
 
 @param request A container for the necessary parameters to execute the CreateFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkCreateFleetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorResourceAlreadyExists`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkCreateFleetRequest
 @see AWSWorklinkCreateFleetResponse
 */
- (AWSTask<AWSWorklinkCreateFleetResponse *> *)createFleet:(AWSWorklinkCreateFleetRequest *)request;

/**
 <p>Creates a fleet. A fleet consists of resources and the configuration that delivers associated websites to authorized users who download and set up the Amazon WorkLink app.</p>
 
 @param request A container for the necessary parameters to execute the CreateFleet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorResourceAlreadyExists`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkCreateFleetRequest
 @see AWSWorklinkCreateFleetResponse
 */
- (void)createFleet:(AWSWorklinkCreateFleetRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkCreateFleetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a fleet. Prevents users from accessing previously associated websites. </p>
 
 @param request A container for the necessary parameters to execute the DeleteFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDeleteFleetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDeleteFleetRequest
 @see AWSWorklinkDeleteFleetResponse
 */
- (AWSTask<AWSWorklinkDeleteFleetResponse *> *)deleteFleet:(AWSWorklinkDeleteFleetRequest *)request;

/**
 <p>Deletes a fleet. Prevents users from accessing previously associated websites. </p>
 
 @param request A container for the necessary parameters to execute the DeleteFleet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDeleteFleetRequest
 @see AWSWorklinkDeleteFleetResponse
 */
- (void)deleteFleet:(AWSWorklinkDeleteFleetRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDeleteFleetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the configuration for delivering audit streams to the customer account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAuditStreamConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDescribeAuditStreamConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeAuditStreamConfigurationRequest
 @see AWSWorklinkDescribeAuditStreamConfigurationResponse
 */
- (AWSTask<AWSWorklinkDescribeAuditStreamConfigurationResponse *> *)describeAuditStreamConfiguration:(AWSWorklinkDescribeAuditStreamConfigurationRequest *)request;

/**
 <p>Describes the configuration for delivering audit streams to the customer account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAuditStreamConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeAuditStreamConfigurationRequest
 @see AWSWorklinkDescribeAuditStreamConfigurationResponse
 */
- (void)describeAuditStreamConfiguration:(AWSWorklinkDescribeAuditStreamConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDescribeAuditStreamConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the networking configuration to access the internal websites associated with the specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCompanyNetworkConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDescribeCompanyNetworkConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeCompanyNetworkConfigurationRequest
 @see AWSWorklinkDescribeCompanyNetworkConfigurationResponse
 */
- (AWSTask<AWSWorklinkDescribeCompanyNetworkConfigurationResponse *> *)describeCompanyNetworkConfiguration:(AWSWorklinkDescribeCompanyNetworkConfigurationRequest *)request;

/**
 <p>Describes the networking configuration to access the internal websites associated with the specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCompanyNetworkConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeCompanyNetworkConfigurationRequest
 @see AWSWorklinkDescribeCompanyNetworkConfigurationResponse
 */
- (void)describeCompanyNetworkConfiguration:(AWSWorklinkDescribeCompanyNetworkConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDescribeCompanyNetworkConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about a user's device.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDescribeDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeDeviceRequest
 @see AWSWorklinkDescribeDeviceResponse
 */
- (AWSTask<AWSWorklinkDescribeDeviceResponse *> *)describeDevice:(AWSWorklinkDescribeDeviceRequest *)request;

/**
 <p>Provides information about a user's device.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeDeviceRequest
 @see AWSWorklinkDescribeDeviceResponse
 */
- (void)describeDevice:(AWSWorklinkDescribeDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDescribeDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the device policy configuration for the specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDevicePolicyConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDescribeDevicePolicyConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeDevicePolicyConfigurationRequest
 @see AWSWorklinkDescribeDevicePolicyConfigurationResponse
 */
- (AWSTask<AWSWorklinkDescribeDevicePolicyConfigurationResponse *> *)describeDevicePolicyConfiguration:(AWSWorklinkDescribeDevicePolicyConfigurationRequest *)request;

/**
 <p>Describes the device policy configuration for the specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDevicePolicyConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeDevicePolicyConfigurationRequest
 @see AWSWorklinkDescribeDevicePolicyConfigurationResponse
 */
- (void)describeDevicePolicyConfiguration:(AWSWorklinkDescribeDevicePolicyConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDescribeDevicePolicyConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDescribeDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeDomainRequest
 @see AWSWorklinkDescribeDomainResponse
 */
- (AWSTask<AWSWorklinkDescribeDomainResponse *> *)describeDomain:(AWSWorklinkDescribeDomainRequest *)request;

/**
 <p>Provides information about the domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeDomainRequest
 @see AWSWorklinkDescribeDomainResponse
 */
- (void)describeDomain:(AWSWorklinkDescribeDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDescribeDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides basic information for the specified fleet, excluding identity provider, networking, and device configuration details.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFleetMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDescribeFleetMetadataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeFleetMetadataRequest
 @see AWSWorklinkDescribeFleetMetadataResponse
 */
- (AWSTask<AWSWorklinkDescribeFleetMetadataResponse *> *)describeFleetMetadata:(AWSWorklinkDescribeFleetMetadataRequest *)request;

/**
 <p>Provides basic information for the specified fleet, excluding identity provider, networking, and device configuration details.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFleetMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeFleetMetadataRequest
 @see AWSWorklinkDescribeFleetMetadataResponse
 */
- (void)describeFleetMetadata:(AWSWorklinkDescribeFleetMetadataRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDescribeFleetMetadataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the identity provider configuration of the specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityProviderConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDescribeIdentityProviderConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeIdentityProviderConfigurationRequest
 @see AWSWorklinkDescribeIdentityProviderConfigurationResponse
 */
- (AWSTask<AWSWorklinkDescribeIdentityProviderConfigurationResponse *> *)describeIdentityProviderConfiguration:(AWSWorklinkDescribeIdentityProviderConfigurationRequest *)request;

/**
 <p>Describes the identity provider configuration of the specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityProviderConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeIdentityProviderConfigurationRequest
 @see AWSWorklinkDescribeIdentityProviderConfigurationResponse
 */
- (void)describeIdentityProviderConfiguration:(AWSWorklinkDescribeIdentityProviderConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDescribeIdentityProviderConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the certificate authority.</p>
 
 @param request A container for the necessary parameters to execute the DescribeWebsiteCertificateAuthority service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDescribeWebsiteCertificateAuthorityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeWebsiteCertificateAuthorityRequest
 @see AWSWorklinkDescribeWebsiteCertificateAuthorityResponse
 */
- (AWSTask<AWSWorklinkDescribeWebsiteCertificateAuthorityResponse *> *)describeWebsiteCertificateAuthority:(AWSWorklinkDescribeWebsiteCertificateAuthorityRequest *)request;

/**
 <p>Provides information about the certificate authority.</p>
 
 @param request A container for the necessary parameters to execute the DescribeWebsiteCertificateAuthority service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDescribeWebsiteCertificateAuthorityRequest
 @see AWSWorklinkDescribeWebsiteCertificateAuthorityResponse
 */
- (void)describeWebsiteCertificateAuthority:(AWSWorklinkDescribeWebsiteCertificateAuthorityRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDescribeWebsiteCertificateAuthorityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a domain from Amazon WorkLink. End users lose the ability to access the domain with Amazon WorkLink. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDisassociateDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDisassociateDomainRequest
 @see AWSWorklinkDisassociateDomainResponse
 */
- (AWSTask<AWSWorklinkDisassociateDomainResponse *> *)disassociateDomain:(AWSWorklinkDisassociateDomainRequest *)request;

/**
 <p>Disassociates a domain from Amazon WorkLink. End users lose the ability to access the domain with Amazon WorkLink. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDisassociateDomainRequest
 @see AWSWorklinkDisassociateDomainResponse
 */
- (void)disassociateDomain:(AWSWorklinkDisassociateDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDisassociateDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a website authorization provider from a specified fleet. After the disassociation, users can't load any associated websites that require this authorization provider.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateWebsiteAuthorizationProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorResourceAlreadyExists`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDisassociateWebsiteAuthorizationProviderRequest
 @see AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse
 */
- (AWSTask<AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse *> *)disassociateWebsiteAuthorizationProvider:(AWSWorklinkDisassociateWebsiteAuthorizationProviderRequest *)request;

/**
 <p>Disassociates a website authorization provider from a specified fleet. After the disassociation, users can't load any associated websites that require this authorization provider.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateWebsiteAuthorizationProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorResourceAlreadyExists`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDisassociateWebsiteAuthorizationProviderRequest
 @see AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse
 */
- (void)disassociateWebsiteAuthorizationProvider:(AWSWorklinkDisassociateWebsiteAuthorizationProviderRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a certificate authority (CA).</p>
 
 @param request A container for the necessary parameters to execute the DisassociateWebsiteCertificateAuthority service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDisassociateWebsiteCertificateAuthorityRequest
 @see AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse
 */
- (AWSTask<AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse *> *)disassociateWebsiteCertificateAuthority:(AWSWorklinkDisassociateWebsiteCertificateAuthorityRequest *)request;

/**
 <p>Removes a certificate authority (CA).</p>
 
 @param request A container for the necessary parameters to execute the DisassociateWebsiteCertificateAuthority service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkDisassociateWebsiteCertificateAuthorityRequest
 @see AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse
 */
- (void)disassociateWebsiteCertificateAuthority:(AWSWorklinkDisassociateWebsiteCertificateAuthorityRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of devices registered with the specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the ListDevices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkListDevicesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkListDevicesRequest
 @see AWSWorklinkListDevicesResponse
 */
- (AWSTask<AWSWorklinkListDevicesResponse *> *)listDevices:(AWSWorklinkListDevicesRequest *)request;

/**
 <p>Retrieves a list of devices registered with the specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the ListDevices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkListDevicesRequest
 @see AWSWorklinkListDevicesResponse
 */
- (void)listDevices:(AWSWorklinkListDevicesRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkListDevicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of domains associated to a specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the ListDomains service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkListDomainsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkListDomainsRequest
 @see AWSWorklinkListDomainsResponse
 */
- (AWSTask<AWSWorklinkListDomainsResponse *> *)listDomains:(AWSWorklinkListDomainsRequest *)request;

/**
 <p>Retrieves a list of domains associated to a specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the ListDomains service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkListDomainsRequest
 @see AWSWorklinkListDomainsResponse
 */
- (void)listDomains:(AWSWorklinkListDomainsRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkListDomainsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of fleets for the current account and Region.</p>
 
 @param request A container for the necessary parameters to execute the ListFleets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkListFleetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkListFleetsRequest
 @see AWSWorklinkListFleetsResponse
 */
- (AWSTask<AWSWorklinkListFleetsResponse *> *)listFleets:(AWSWorklinkListFleetsRequest *)request;

/**
 <p>Retrieves a list of fleets for the current account and Region.</p>
 
 @param request A container for the necessary parameters to execute the ListFleets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkListFleetsRequest
 @see AWSWorklinkListFleetsResponse
 */
- (void)listFleets:(AWSWorklinkListFleetsRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkListFleetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of tags for the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorInvalidRequest`.
 
 @see AWSWorklinkListTagsForResourceRequest
 @see AWSWorklinkListTagsForResourceResponse
 */
- (AWSTask<AWSWorklinkListTagsForResourceResponse *> *)listTagsForResource:(AWSWorklinkListTagsForResourceRequest *)request;

/**
 <p>Retrieves a list of tags for the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorInvalidRequest`.
 
 @see AWSWorklinkListTagsForResourceRequest
 @see AWSWorklinkListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSWorklinkListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of website authorization providers associated with a specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the ListWebsiteAuthorizationProviders service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkListWebsiteAuthorizationProvidersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkListWebsiteAuthorizationProvidersRequest
 @see AWSWorklinkListWebsiteAuthorizationProvidersResponse
 */
- (AWSTask<AWSWorklinkListWebsiteAuthorizationProvidersResponse *> *)listWebsiteAuthorizationProviders:(AWSWorklinkListWebsiteAuthorizationProvidersRequest *)request;

/**
 <p>Retrieves a list of website authorization providers associated with a specified fleet.</p>
 
 @param request A container for the necessary parameters to execute the ListWebsiteAuthorizationProviders service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkListWebsiteAuthorizationProvidersRequest
 @see AWSWorklinkListWebsiteAuthorizationProvidersResponse
 */
- (void)listWebsiteAuthorizationProviders:(AWSWorklinkListWebsiteAuthorizationProvidersRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkListWebsiteAuthorizationProvidersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of certificate authorities added for the current account and Region.</p>
 
 @param request A container for the necessary parameters to execute the ListWebsiteCertificateAuthorities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkListWebsiteCertificateAuthoritiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkListWebsiteCertificateAuthoritiesRequest
 @see AWSWorklinkListWebsiteCertificateAuthoritiesResponse
 */
- (AWSTask<AWSWorklinkListWebsiteCertificateAuthoritiesResponse *> *)listWebsiteCertificateAuthorities:(AWSWorklinkListWebsiteCertificateAuthoritiesRequest *)request;

/**
 <p>Retrieves a list of certificate authorities added for the current account and Region.</p>
 
 @param request A container for the necessary parameters to execute the ListWebsiteCertificateAuthorities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkListWebsiteCertificateAuthoritiesRequest
 @see AWSWorklinkListWebsiteCertificateAuthoritiesResponse
 */
- (void)listWebsiteCertificateAuthorities:(AWSWorklinkListWebsiteCertificateAuthoritiesRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkListWebsiteCertificateAuthoritiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Moves a domain to ACTIVE status if it was in the INACTIVE status.</p>
 
 @param request A container for the necessary parameters to execute the RestoreDomainAccess service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkRestoreDomainAccessResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkRestoreDomainAccessRequest
 @see AWSWorklinkRestoreDomainAccessResponse
 */
- (AWSTask<AWSWorklinkRestoreDomainAccessResponse *> *)restoreDomainAccess:(AWSWorklinkRestoreDomainAccessRequest *)request;

/**
 <p>Moves a domain to ACTIVE status if it was in the INACTIVE status.</p>
 
 @param request A container for the necessary parameters to execute the RestoreDomainAccess service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkRestoreDomainAccessRequest
 @see AWSWorklinkRestoreDomainAccessResponse
 */
- (void)restoreDomainAccess:(AWSWorklinkRestoreDomainAccessRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkRestoreDomainAccessResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Moves a domain to INACTIVE status if it was in the ACTIVE status.</p>
 
 @param request A container for the necessary parameters to execute the RevokeDomainAccess service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkRevokeDomainAccessResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkRevokeDomainAccessRequest
 @see AWSWorklinkRevokeDomainAccessResponse
 */
- (AWSTask<AWSWorklinkRevokeDomainAccessResponse *> *)revokeDomainAccess:(AWSWorklinkRevokeDomainAccessRequest *)request;

/**
 <p>Moves a domain to INACTIVE status if it was in the ACTIVE status.</p>
 
 @param request A container for the necessary parameters to execute the RevokeDomainAccess service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkRevokeDomainAccessRequest
 @see AWSWorklinkRevokeDomainAccessResponse
 */
- (void)revokeDomainAccess:(AWSWorklinkRevokeDomainAccessRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkRevokeDomainAccessResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Signs the user out from all of their devices. The user can sign in again if they have valid credentials.</p>
 
 @param request A container for the necessary parameters to execute the SignOutUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkSignOutUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkSignOutUserRequest
 @see AWSWorklinkSignOutUserResponse
 */
- (AWSTask<AWSWorklinkSignOutUserResponse *> *)signOutUser:(AWSWorklinkSignOutUserRequest *)request;

/**
 <p>Signs the user out from all of their devices. The user can sign in again if they have valid credentials.</p>
 
 @param request A container for the necessary parameters to execute the SignOutUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkSignOutUserRequest
 @see AWSWorklinkSignOutUserResponse
 */
- (void)signOutUser:(AWSWorklinkSignOutUserRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkSignOutUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or overwrites one or more tags for the specified resource, such as a fleet. Each tag consists of a key and an optional value. If a resource already has a tag with the same key, this operation updates its value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorInvalidRequest`.
 
 @see AWSWorklinkTagResourceRequest
 @see AWSWorklinkTagResourceResponse
 */
- (AWSTask<AWSWorklinkTagResourceResponse *> *)tagResource:(AWSWorklinkTagResourceRequest *)request;

/**
 <p>Adds or overwrites one or more tags for the specified resource, such as a fleet. Each tag consists of a key and an optional value. If a resource already has a tag with the same key, this operation updates its value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorInvalidRequest`.
 
 @see AWSWorklinkTagResourceRequest
 @see AWSWorklinkTagResourceResponse
 */
- (void)tagResource:(AWSWorklinkTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorInvalidRequest`.
 
 @see AWSWorklinkUntagResourceRequest
 @see AWSWorklinkUntagResourceResponse
 */
- (AWSTask<AWSWorklinkUntagResourceResponse *> *)untagResource:(AWSWorklinkUntagResourceRequest *)request;

/**
 <p>Removes one or more tags from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorInvalidRequest`.
 
 @see AWSWorklinkUntagResourceRequest
 @see AWSWorklinkUntagResourceResponse
 */
- (void)untagResource:(AWSWorklinkUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the audit stream configuration for the fleet.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAuditStreamConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkUpdateAuditStreamConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateAuditStreamConfigurationRequest
 @see AWSWorklinkUpdateAuditStreamConfigurationResponse
 */
- (AWSTask<AWSWorklinkUpdateAuditStreamConfigurationResponse *> *)updateAuditStreamConfiguration:(AWSWorklinkUpdateAuditStreamConfigurationRequest *)request;

/**
 <p>Updates the audit stream configuration for the fleet.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAuditStreamConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateAuditStreamConfigurationRequest
 @see AWSWorklinkUpdateAuditStreamConfigurationResponse
 */
- (void)updateAuditStreamConfiguration:(AWSWorklinkUpdateAuditStreamConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkUpdateAuditStreamConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the company network configuration for the fleet.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCompanyNetworkConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkUpdateCompanyNetworkConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateCompanyNetworkConfigurationRequest
 @see AWSWorklinkUpdateCompanyNetworkConfigurationResponse
 */
- (AWSTask<AWSWorklinkUpdateCompanyNetworkConfigurationResponse *> *)updateCompanyNetworkConfiguration:(AWSWorklinkUpdateCompanyNetworkConfigurationRequest *)request;

/**
 <p>Updates the company network configuration for the fleet.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCompanyNetworkConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateCompanyNetworkConfigurationRequest
 @see AWSWorklinkUpdateCompanyNetworkConfigurationResponse
 */
- (void)updateCompanyNetworkConfiguration:(AWSWorklinkUpdateCompanyNetworkConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkUpdateCompanyNetworkConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the device policy configuration for the fleet.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDevicePolicyConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkUpdateDevicePolicyConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateDevicePolicyConfigurationRequest
 @see AWSWorklinkUpdateDevicePolicyConfigurationResponse
 */
- (AWSTask<AWSWorklinkUpdateDevicePolicyConfigurationResponse *> *)updateDevicePolicyConfiguration:(AWSWorklinkUpdateDevicePolicyConfigurationRequest *)request;

/**
 <p>Updates the device policy configuration for the fleet.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDevicePolicyConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateDevicePolicyConfigurationRequest
 @see AWSWorklinkUpdateDevicePolicyConfigurationResponse
 */
- (void)updateDevicePolicyConfiguration:(AWSWorklinkUpdateDevicePolicyConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkUpdateDevicePolicyConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates domain metadata, such as DisplayName.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkUpdateDomainMetadataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateDomainMetadataRequest
 @see AWSWorklinkUpdateDomainMetadataResponse
 */
- (AWSTask<AWSWorklinkUpdateDomainMetadataResponse *> *)updateDomainMetadata:(AWSWorklinkUpdateDomainMetadataRequest *)request;

/**
 <p>Updates domain metadata, such as DisplayName.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateDomainMetadataRequest
 @see AWSWorklinkUpdateDomainMetadataResponse
 */
- (void)updateDomainMetadata:(AWSWorklinkUpdateDomainMetadataRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkUpdateDomainMetadataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates fleet metadata, such as DisplayName.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFleetMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkUpdateFleetMetadataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateFleetMetadataRequest
 @see AWSWorklinkUpdateFleetMetadataResponse
 */
- (AWSTask<AWSWorklinkUpdateFleetMetadataResponse *> *)updateFleetMetadata:(AWSWorklinkUpdateFleetMetadataRequest *)request;

/**
 <p>Updates fleet metadata, such as DisplayName.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFleetMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateFleetMetadataRequest
 @see AWSWorklinkUpdateFleetMetadataResponse
 */
- (void)updateFleetMetadata:(AWSWorklinkUpdateFleetMetadataRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkUpdateFleetMetadataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the identity provider configuration for the fleet.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIdentityProviderConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSWorklinkUpdateIdentityProviderConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateIdentityProviderConfigurationRequest
 @see AWSWorklinkUpdateIdentityProviderConfigurationResponse
 */
- (AWSTask<AWSWorklinkUpdateIdentityProviderConfigurationResponse *> *)updateIdentityProviderConfiguration:(AWSWorklinkUpdateIdentityProviderConfigurationRequest *)request;

/**
 <p>Updates the identity provider configuration for the fleet.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIdentityProviderConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSWorklinkErrorDomain` domain and the following error code: `AWSWorklinkErrorUnauthorized`, `AWSWorklinkErrorInternalServerError`, `AWSWorklinkErrorInvalidRequest`, `AWSWorklinkErrorResourceNotFound`, `AWSWorklinkErrorTooManyRequests`.
 
 @see AWSWorklinkUpdateIdentityProviderConfigurationRequest
 @see AWSWorklinkUpdateIdentityProviderConfigurationResponse
 */
- (void)updateIdentityProviderConfiguration:(AWSWorklinkUpdateIdentityProviderConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSWorklinkUpdateIdentityProviderConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
