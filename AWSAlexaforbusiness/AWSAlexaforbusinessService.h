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
#import "AWSAlexaforbusinessModel.h"
#import "AWSAlexaforbusinessResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSAlexaforbusiness
FOUNDATION_EXPORT NSString *const AWSAlexaforbusinessSDKVersion;

/**
 <p>Alexa for Business helps you use Alexa in your organization. Alexa for Business provides you with the tools to manage Alexa devices, enroll your users, and assign skills, at scale. You can build your own context-aware voice skills using the Alexa Skills Kit and the Alexa for Business API operations. You can also make these available as private skills for your organization. Alexa for Business makes it efficient to voice-enable your products and services, thus providing context-aware voice experiences for your customers. Device makers building with the Alexa Voice Service (AVS) can create fully integrated solutions, register their products with Alexa for Business, and manage them as shared devices in their organization. </p>
 */
@interface AWSAlexaforbusiness : AWSService

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

     let Alexaforbusiness = AWSAlexaforbusiness.default()

 *Objective-C*

     AWSAlexaforbusiness *Alexaforbusiness = [AWSAlexaforbusiness defaultAlexaforbusiness];

 @return The default service client.
 */
+ (instancetype)defaultAlexaforbusiness;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAlexaforbusiness.register(with: configuration!, forKey: "USWest2Alexaforbusiness")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:@"USWest2Alexaforbusiness"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Alexaforbusiness = AWSAlexaforbusiness(forKey: "USWest2Alexaforbusiness")

 *Objective-C*

     AWSAlexaforbusiness *Alexaforbusiness = [AWSAlexaforbusiness AlexaforbusinessForKey:@"USWest2Alexaforbusiness"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerAlexaforbusinessWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerAlexaforbusinessWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAlexaforbusiness.register(with: configuration!, forKey: "USWest2Alexaforbusiness")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:@"USWest2Alexaforbusiness"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Alexaforbusiness = AWSAlexaforbusiness(forKey: "USWest2Alexaforbusiness")

 *Objective-C*

     AWSAlexaforbusiness *Alexaforbusiness = [AWSAlexaforbusiness AlexaforbusinessForKey:@"USWest2Alexaforbusiness"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)AlexaforbusinessForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeAlexaforbusinessForKey:(NSString *)key;

/**
 <p>Associates a skill with the organization under the customer's AWS account. If a skill is private, the user implicitly accepts access to this skill during enablement.</p>
 
 @param request A container for the necessary parameters to execute the ApproveSkill service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessApproveSkillResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessApproveSkillRequest
 @see AWSAlexaforbusinessApproveSkillResponse
 */
- (AWSTask<AWSAlexaforbusinessApproveSkillResponse *> *)approveSkill:(AWSAlexaforbusinessApproveSkillRequest *)request;

/**
 <p>Associates a skill with the organization under the customer's AWS account. If a skill is private, the user implicitly accepts access to this skill during enablement.</p>
 
 @param request A container for the necessary parameters to execute the ApproveSkill service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessApproveSkillRequest
 @see AWSAlexaforbusinessApproveSkillResponse
 */
- (void)approveSkill:(AWSAlexaforbusinessApproveSkillRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessApproveSkillResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a contact with a given address book.</p>
 
 @param request A container for the necessary parameters to execute the AssociateContactWithAddressBook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessAssociateContactWithAddressBookResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessAssociateContactWithAddressBookRequest
 @see AWSAlexaforbusinessAssociateContactWithAddressBookResponse
 */
- (AWSTask<AWSAlexaforbusinessAssociateContactWithAddressBookResponse *> *)associateContactWithAddressBook:(AWSAlexaforbusinessAssociateContactWithAddressBookRequest *)request;

/**
 <p>Associates a contact with a given address book.</p>
 
 @param request A container for the necessary parameters to execute the AssociateContactWithAddressBook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessAssociateContactWithAddressBookRequest
 @see AWSAlexaforbusinessAssociateContactWithAddressBookResponse
 */
- (void)associateContactWithAddressBook:(AWSAlexaforbusinessAssociateContactWithAddressBookRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessAssociateContactWithAddressBookResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a device with the specified network profile.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDeviceWithNetworkProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorDeviceNotRegistered`.
 
 @see AWSAlexaforbusinessAssociateDeviceWithNetworkProfileRequest
 @see AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse
 */
- (AWSTask<AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse *> *)associateDeviceWithNetworkProfile:(AWSAlexaforbusinessAssociateDeviceWithNetworkProfileRequest *)request;

/**
 <p>Associates a device with the specified network profile.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDeviceWithNetworkProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorDeviceNotRegistered`.
 
 @see AWSAlexaforbusinessAssociateDeviceWithNetworkProfileRequest
 @see AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse
 */
- (void)associateDeviceWithNetworkProfile:(AWSAlexaforbusinessAssociateDeviceWithNetworkProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a device with a given room. This applies all the settings from the room profile to the device, and all the skills in any skill groups added to that room. This operation requires the device to be online, or else a manual sync is required. </p>
 
 @param request A container for the necessary parameters to execute the AssociateDeviceWithRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessAssociateDeviceWithRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorDeviceNotRegistered`.
 
 @see AWSAlexaforbusinessAssociateDeviceWithRoomRequest
 @see AWSAlexaforbusinessAssociateDeviceWithRoomResponse
 */
- (AWSTask<AWSAlexaforbusinessAssociateDeviceWithRoomResponse *> *)associateDeviceWithRoom:(AWSAlexaforbusinessAssociateDeviceWithRoomRequest *)request;

/**
 <p>Associates a device with a given room. This applies all the settings from the room profile to the device, and all the skills in any skill groups added to that room. This operation requires the device to be online, or else a manual sync is required. </p>
 
 @param request A container for the necessary parameters to execute the AssociateDeviceWithRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorDeviceNotRegistered`.
 
 @see AWSAlexaforbusinessAssociateDeviceWithRoomRequest
 @see AWSAlexaforbusinessAssociateDeviceWithRoomResponse
 */
- (void)associateDeviceWithRoom:(AWSAlexaforbusinessAssociateDeviceWithRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessAssociateDeviceWithRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a skill group with a given room. This enables all skills in the associated skill group on all devices in the room.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSkillGroupWithRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessAssociateSkillGroupWithRoomRequest
 @see AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse
 */
- (AWSTask<AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse *> *)associateSkillGroupWithRoom:(AWSAlexaforbusinessAssociateSkillGroupWithRoomRequest *)request;

/**
 <p>Associates a skill group with a given room. This enables all skills in the associated skill group on all devices in the room.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSkillGroupWithRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessAssociateSkillGroupWithRoomRequest
 @see AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse
 */
- (void)associateSkillGroupWithRoom:(AWSAlexaforbusinessAssociateSkillGroupWithRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a skill with a skill group.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSkillWithSkillGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorSkillNotLinked`.
 
 @see AWSAlexaforbusinessAssociateSkillWithSkillGroupRequest
 @see AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse
 */
- (AWSTask<AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse *> *)associateSkillWithSkillGroup:(AWSAlexaforbusinessAssociateSkillWithSkillGroupRequest *)request;

/**
 <p>Associates a skill with a skill group.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSkillWithSkillGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorSkillNotLinked`.
 
 @see AWSAlexaforbusinessAssociateSkillWithSkillGroupRequest
 @see AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse
 */
- (void)associateSkillWithSkillGroup:(AWSAlexaforbusinessAssociateSkillWithSkillGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Makes a private skill available for enrolled users to enable on their devices.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSkillWithUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessAssociateSkillWithUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessAssociateSkillWithUsersRequest
 @see AWSAlexaforbusinessAssociateSkillWithUsersResponse
 */
- (AWSTask<AWSAlexaforbusinessAssociateSkillWithUsersResponse *> *)associateSkillWithUsers:(AWSAlexaforbusinessAssociateSkillWithUsersRequest *)request;

/**
 <p>Makes a private skill available for enrolled users to enable on their devices.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSkillWithUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessAssociateSkillWithUsersRequest
 @see AWSAlexaforbusinessAssociateSkillWithUsersResponse
 */
- (void)associateSkillWithUsers:(AWSAlexaforbusinessAssociateSkillWithUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessAssociateSkillWithUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an address book with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateAddressBook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessCreateAddressBookResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessCreateAddressBookRequest
 @see AWSAlexaforbusinessCreateAddressBookResponse
 */
- (AWSTask<AWSAlexaforbusinessCreateAddressBookResponse *> *)createAddressBook:(AWSAlexaforbusinessCreateAddressBookRequest *)request;

/**
 <p>Creates an address book with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateAddressBook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessCreateAddressBookRequest
 @see AWSAlexaforbusinessCreateAddressBookResponse
 */
- (void)createAddressBook:(AWSAlexaforbusinessCreateAddressBookRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessCreateAddressBookResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a recurring schedule for usage reports to deliver to the specified S3 location with a specified daily or weekly interval.</p>
 
 @param request A container for the necessary parameters to execute the CreateBusinessReportSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessCreateBusinessReportScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`.
 
 @see AWSAlexaforbusinessCreateBusinessReportScheduleRequest
 @see AWSAlexaforbusinessCreateBusinessReportScheduleResponse
 */
- (AWSTask<AWSAlexaforbusinessCreateBusinessReportScheduleResponse *> *)createBusinessReportSchedule:(AWSAlexaforbusinessCreateBusinessReportScheduleRequest *)request;

/**
 <p>Creates a recurring schedule for usage reports to deliver to the specified S3 location with a specified daily or weekly interval.</p>
 
 @param request A container for the necessary parameters to execute the CreateBusinessReportSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`.
 
 @see AWSAlexaforbusinessCreateBusinessReportScheduleRequest
 @see AWSAlexaforbusinessCreateBusinessReportScheduleResponse
 */
- (void)createBusinessReportSchedule:(AWSAlexaforbusinessCreateBusinessReportScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessCreateBusinessReportScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a new conference provider under the user's AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreateConferenceProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessCreateConferenceProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`.
 
 @see AWSAlexaforbusinessCreateConferenceProviderRequest
 @see AWSAlexaforbusinessCreateConferenceProviderResponse
 */
- (AWSTask<AWSAlexaforbusinessCreateConferenceProviderResponse *> *)createConferenceProvider:(AWSAlexaforbusinessCreateConferenceProviderRequest *)request;

/**
 <p>Adds a new conference provider under the user's AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreateConferenceProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`.
 
 @see AWSAlexaforbusinessCreateConferenceProviderRequest
 @see AWSAlexaforbusinessCreateConferenceProviderResponse
 */
- (void)createConferenceProvider:(AWSAlexaforbusinessCreateConferenceProviderRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessCreateConferenceProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a contact with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessCreateContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessCreateContactRequest
 @see AWSAlexaforbusinessCreateContactResponse
 */
- (AWSTask<AWSAlexaforbusinessCreateContactResponse *> *)createContact:(AWSAlexaforbusinessCreateContactRequest *)request;

/**
 <p>Creates a contact with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessCreateContactRequest
 @see AWSAlexaforbusinessCreateContactResponse
 */
- (void)createContact:(AWSAlexaforbusinessCreateContactRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessCreateContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a gateway group with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateGatewayGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessCreateGatewayGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessCreateGatewayGroupRequest
 @see AWSAlexaforbusinessCreateGatewayGroupResponse
 */
- (AWSTask<AWSAlexaforbusinessCreateGatewayGroupResponse *> *)createGatewayGroup:(AWSAlexaforbusinessCreateGatewayGroupRequest *)request;

/**
 <p>Creates a gateway group with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateGatewayGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessCreateGatewayGroupRequest
 @see AWSAlexaforbusinessCreateGatewayGroupResponse
 */
- (void)createGatewayGroup:(AWSAlexaforbusinessCreateGatewayGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessCreateGatewayGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a network profile with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessCreateNetworkProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorInvalidCertificateAuthority`, `AWSAlexaforbusinessErrorInvalidServiceLinkedRoleState`.
 
 @see AWSAlexaforbusinessCreateNetworkProfileRequest
 @see AWSAlexaforbusinessCreateNetworkProfileResponse
 */
- (AWSTask<AWSAlexaforbusinessCreateNetworkProfileResponse *> *)createNetworkProfile:(AWSAlexaforbusinessCreateNetworkProfileRequest *)request;

/**
 <p>Creates a network profile with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorInvalidCertificateAuthority`, `AWSAlexaforbusinessErrorInvalidServiceLinkedRoleState`.
 
 @see AWSAlexaforbusinessCreateNetworkProfileRequest
 @see AWSAlexaforbusinessCreateNetworkProfileResponse
 */
- (void)createNetworkProfile:(AWSAlexaforbusinessCreateNetworkProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessCreateNetworkProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new room profile with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessCreateProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessCreateProfileRequest
 @see AWSAlexaforbusinessCreateProfileResponse
 */
- (AWSTask<AWSAlexaforbusinessCreateProfileResponse *> *)createProfile:(AWSAlexaforbusinessCreateProfileRequest *)request;

/**
 <p>Creates a new room profile with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessCreateProfileRequest
 @see AWSAlexaforbusinessCreateProfileResponse
 */
- (void)createProfile:(AWSAlexaforbusinessCreateProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessCreateProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a room with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessCreateRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessCreateRoomRequest
 @see AWSAlexaforbusinessCreateRoomResponse
 */
- (AWSTask<AWSAlexaforbusinessCreateRoomResponse *> *)createRoom:(AWSAlexaforbusinessCreateRoomRequest *)request;

/**
 <p>Creates a room with the specified details.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessCreateRoomRequest
 @see AWSAlexaforbusinessCreateRoomResponse
 */
- (void)createRoom:(AWSAlexaforbusinessCreateRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessCreateRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a skill group with a specified name and description.</p>
 
 @param request A container for the necessary parameters to execute the CreateSkillGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessCreateSkillGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessCreateSkillGroupRequest
 @see AWSAlexaforbusinessCreateSkillGroupResponse
 */
- (AWSTask<AWSAlexaforbusinessCreateSkillGroupResponse *> *)createSkillGroup:(AWSAlexaforbusinessCreateSkillGroupRequest *)request;

/**
 <p>Creates a skill group with a specified name and description.</p>
 
 @param request A container for the necessary parameters to execute the CreateSkillGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorAlreadyExists`, `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessCreateSkillGroupRequest
 @see AWSAlexaforbusinessCreateSkillGroupResponse
 */
- (void)createSkillGroup:(AWSAlexaforbusinessCreateSkillGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessCreateSkillGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a user.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessCreateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorResourceInUse`, `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessCreateUserRequest
 @see AWSAlexaforbusinessCreateUserResponse
 */
- (AWSTask<AWSAlexaforbusinessCreateUserResponse *> *)createUser:(AWSAlexaforbusinessCreateUserRequest *)request;

/**
 <p>Creates a user.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorResourceInUse`, `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessCreateUserRequest
 @see AWSAlexaforbusinessCreateUserResponse
 */
- (void)createUser:(AWSAlexaforbusinessCreateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessCreateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an address book by the address book ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAddressBook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteAddressBookResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteAddressBookRequest
 @see AWSAlexaforbusinessDeleteAddressBookResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteAddressBookResponse *> *)deleteAddressBook:(AWSAlexaforbusinessDeleteAddressBookRequest *)request;

/**
 <p>Deletes an address book by the address book ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAddressBook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteAddressBookRequest
 @see AWSAlexaforbusinessDeleteAddressBookResponse
 */
- (void)deleteAddressBook:(AWSAlexaforbusinessDeleteAddressBookRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteAddressBookResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the recurring report delivery schedule with the specified schedule ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBusinessReportSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteBusinessReportScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteBusinessReportScheduleRequest
 @see AWSAlexaforbusinessDeleteBusinessReportScheduleResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteBusinessReportScheduleResponse *> *)deleteBusinessReportSchedule:(AWSAlexaforbusinessDeleteBusinessReportScheduleRequest *)request;

/**
 <p>Deletes the recurring report delivery schedule with the specified schedule ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBusinessReportSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteBusinessReportScheduleRequest
 @see AWSAlexaforbusinessDeleteBusinessReportScheduleResponse
 */
- (void)deleteBusinessReportSchedule:(AWSAlexaforbusinessDeleteBusinessReportScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteBusinessReportScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a conference provider.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConferenceProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteConferenceProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessDeleteConferenceProviderRequest
 @see AWSAlexaforbusinessDeleteConferenceProviderResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteConferenceProviderResponse *> *)deleteConferenceProvider:(AWSAlexaforbusinessDeleteConferenceProviderRequest *)request;

/**
 <p>Deletes a conference provider.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConferenceProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessDeleteConferenceProviderRequest
 @see AWSAlexaforbusinessDeleteConferenceProviderResponse
 */
- (void)deleteConferenceProvider:(AWSAlexaforbusinessDeleteConferenceProviderRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteConferenceProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a contact by the contact ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteContactRequest
 @see AWSAlexaforbusinessDeleteContactResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteContactResponse *> *)deleteContact:(AWSAlexaforbusinessDeleteContactRequest *)request;

/**
 <p>Deletes a contact by the contact ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteContactRequest
 @see AWSAlexaforbusinessDeleteContactResponse
 */
- (void)deleteContact:(AWSAlexaforbusinessDeleteContactRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a device from Alexa For Business.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorInvalidCertificateAuthority`.
 
 @see AWSAlexaforbusinessDeleteDeviceRequest
 @see AWSAlexaforbusinessDeleteDeviceResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteDeviceResponse *> *)deleteDevice:(AWSAlexaforbusinessDeleteDeviceRequest *)request;

/**
 <p>Removes a device from Alexa For Business.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorInvalidCertificateAuthority`.
 
 @see AWSAlexaforbusinessDeleteDeviceRequest
 @see AWSAlexaforbusinessDeleteDeviceResponse
 */
- (void)deleteDevice:(AWSAlexaforbusinessDeleteDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>When this action is called for a specified shared device, it allows authorized users to delete the device's entire previous history of voice input data and associated response data. This action can be called once every 24 hours for a specific shared device.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeviceUsageData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteDeviceUsageDataResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorDeviceNotRegistered`, `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessDeleteDeviceUsageDataRequest
 @see AWSAlexaforbusinessDeleteDeviceUsageDataResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteDeviceUsageDataResponse *> *)deleteDeviceUsageData:(AWSAlexaforbusinessDeleteDeviceUsageDataRequest *)request;

/**
 <p>When this action is called for a specified shared device, it allows authorized users to delete the device's entire previous history of voice input data and associated response data. This action can be called once every 24 hours for a specific shared device.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeviceUsageData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorDeviceNotRegistered`, `AWSAlexaforbusinessErrorLimitExceeded`.
 
 @see AWSAlexaforbusinessDeleteDeviceUsageDataRequest
 @see AWSAlexaforbusinessDeleteDeviceUsageDataResponse
 */
- (void)deleteDeviceUsageData:(AWSAlexaforbusinessDeleteDeviceUsageDataRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteDeviceUsageDataResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a gateway group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGatewayGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteGatewayGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorResourceAssociated`.
 
 @see AWSAlexaforbusinessDeleteGatewayGroupRequest
 @see AWSAlexaforbusinessDeleteGatewayGroupResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteGatewayGroupResponse *> *)deleteGatewayGroup:(AWSAlexaforbusinessDeleteGatewayGroupRequest *)request;

/**
 <p>Deletes a gateway group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGatewayGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorResourceAssociated`.
 
 @see AWSAlexaforbusinessDeleteGatewayGroupRequest
 @see AWSAlexaforbusinessDeleteGatewayGroupResponse
 */
- (void)deleteGatewayGroup:(AWSAlexaforbusinessDeleteGatewayGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteGatewayGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a network profile by the network profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteNetworkProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorResourceInUse`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessDeleteNetworkProfileRequest
 @see AWSAlexaforbusinessDeleteNetworkProfileResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteNetworkProfileResponse *> *)deleteNetworkProfile:(AWSAlexaforbusinessDeleteNetworkProfileRequest *)request;

/**
 <p>Deletes a network profile by the network profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorResourceInUse`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessDeleteNetworkProfileRequest
 @see AWSAlexaforbusinessDeleteNetworkProfileResponse
 */
- (void)deleteNetworkProfile:(AWSAlexaforbusinessDeleteNetworkProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteNetworkProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a room profile by the profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteProfileRequest
 @see AWSAlexaforbusinessDeleteProfileResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteProfileResponse *> *)deleteProfile:(AWSAlexaforbusinessDeleteProfileRequest *)request;

/**
 <p>Deletes a room profile by the profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteProfileRequest
 @see AWSAlexaforbusinessDeleteProfileResponse
 */
- (void)deleteProfile:(AWSAlexaforbusinessDeleteProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a room by the room ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteRoomRequest
 @see AWSAlexaforbusinessDeleteRoomResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteRoomResponse *> *)deleteRoom:(AWSAlexaforbusinessDeleteRoomRequest *)request;

/**
 <p>Deletes a room by the room ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteRoomRequest
 @see AWSAlexaforbusinessDeleteRoomResponse
 */
- (void)deleteRoom:(AWSAlexaforbusinessDeleteRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes room skill parameter details by room, skill, and parameter key ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoomSkillParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteRoomSkillParameterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteRoomSkillParameterRequest
 @see AWSAlexaforbusinessDeleteRoomSkillParameterResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteRoomSkillParameterResponse *> *)deleteRoomSkillParameter:(AWSAlexaforbusinessDeleteRoomSkillParameterRequest *)request;

/**
 <p>Deletes room skill parameter details by room, skill, and parameter key ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoomSkillParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteRoomSkillParameterRequest
 @see AWSAlexaforbusinessDeleteRoomSkillParameterResponse
 */
- (void)deleteRoomSkillParameter:(AWSAlexaforbusinessDeleteRoomSkillParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteRoomSkillParameterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Unlinks a third-party account from a skill.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSkillAuthorization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteSkillAuthorizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteSkillAuthorizationRequest
 @see AWSAlexaforbusinessDeleteSkillAuthorizationResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteSkillAuthorizationResponse *> *)deleteSkillAuthorization:(AWSAlexaforbusinessDeleteSkillAuthorizationRequest *)request;

/**
 <p>Unlinks a third-party account from a skill.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSkillAuthorization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteSkillAuthorizationRequest
 @see AWSAlexaforbusinessDeleteSkillAuthorizationResponse
 */
- (void)deleteSkillAuthorization:(AWSAlexaforbusinessDeleteSkillAuthorizationRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteSkillAuthorizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a skill group by skill group ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSkillGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteSkillGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteSkillGroupRequest
 @see AWSAlexaforbusinessDeleteSkillGroupResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteSkillGroupResponse *> *)deleteSkillGroup:(AWSAlexaforbusinessDeleteSkillGroupRequest *)request;

/**
 <p>Deletes a skill group by skill group ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSkillGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteSkillGroupRequest
 @see AWSAlexaforbusinessDeleteSkillGroupResponse
 */
- (void)deleteSkillGroup:(AWSAlexaforbusinessDeleteSkillGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteSkillGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified user by user ARN and enrollment ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDeleteUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteUserRequest
 @see AWSAlexaforbusinessDeleteUserResponse
 */
- (AWSTask<AWSAlexaforbusinessDeleteUserResponse *> *)deleteUser:(AWSAlexaforbusinessDeleteUserRequest *)request;

/**
 <p>Deletes a specified user by user ARN and enrollment ARN.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDeleteUserRequest
 @see AWSAlexaforbusinessDeleteUserResponse
 */
- (void)deleteUser:(AWSAlexaforbusinessDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDeleteUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a contact from a given address book.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateContactFromAddressBook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDisassociateContactFromAddressBookResponse`.
 
 @see AWSAlexaforbusinessDisassociateContactFromAddressBookRequest
 @see AWSAlexaforbusinessDisassociateContactFromAddressBookResponse
 */
- (AWSTask<AWSAlexaforbusinessDisassociateContactFromAddressBookResponse *> *)disassociateContactFromAddressBook:(AWSAlexaforbusinessDisassociateContactFromAddressBookRequest *)request;

/**
 <p>Disassociates a contact from a given address book.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateContactFromAddressBook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessDisassociateContactFromAddressBookRequest
 @see AWSAlexaforbusinessDisassociateContactFromAddressBookResponse
 */
- (void)disassociateContactFromAddressBook:(AWSAlexaforbusinessDisassociateContactFromAddressBookRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDisassociateContactFromAddressBookResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a device from its current room. The device continues to be connected to the Wi-Fi network and is still registered to the account. The device settings and skills are removed from the room.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateDeviceFromRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDisassociateDeviceFromRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorDeviceNotRegistered`.
 
 @see AWSAlexaforbusinessDisassociateDeviceFromRoomRequest
 @see AWSAlexaforbusinessDisassociateDeviceFromRoomResponse
 */
- (AWSTask<AWSAlexaforbusinessDisassociateDeviceFromRoomResponse *> *)disassociateDeviceFromRoom:(AWSAlexaforbusinessDisassociateDeviceFromRoomRequest *)request;

/**
 <p>Disassociates a device from its current room. The device continues to be connected to the Wi-Fi network and is still registered to the account. The device settings and skills are removed from the room.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateDeviceFromRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorDeviceNotRegistered`.
 
 @see AWSAlexaforbusinessDisassociateDeviceFromRoomRequest
 @see AWSAlexaforbusinessDisassociateDeviceFromRoomResponse
 */
- (void)disassociateDeviceFromRoom:(AWSAlexaforbusinessDisassociateDeviceFromRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDisassociateDeviceFromRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a skill from a skill group.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateSkillFromSkillGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessDisassociateSkillFromSkillGroupRequest
 @see AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse
 */
- (AWSTask<AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse *> *)disassociateSkillFromSkillGroup:(AWSAlexaforbusinessDisassociateSkillFromSkillGroupRequest *)request;

/**
 <p>Disassociates a skill from a skill group.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateSkillFromSkillGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessDisassociateSkillFromSkillGroupRequest
 @see AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse
 */
- (void)disassociateSkillFromSkillGroup:(AWSAlexaforbusinessDisassociateSkillFromSkillGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Makes a private skill unavailable for enrolled users and prevents them from enabling it on their devices.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateSkillFromUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDisassociateSkillFromUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessDisassociateSkillFromUsersRequest
 @see AWSAlexaforbusinessDisassociateSkillFromUsersResponse
 */
- (AWSTask<AWSAlexaforbusinessDisassociateSkillFromUsersResponse *> *)disassociateSkillFromUsers:(AWSAlexaforbusinessDisassociateSkillFromUsersRequest *)request;

/**
 <p>Makes a private skill unavailable for enrolled users and prevents them from enabling it on their devices.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateSkillFromUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessDisassociateSkillFromUsersRequest
 @see AWSAlexaforbusinessDisassociateSkillFromUsersResponse
 */
- (void)disassociateSkillFromUsers:(AWSAlexaforbusinessDisassociateSkillFromUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDisassociateSkillFromUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a skill group from a specified room. This disables all skills in the skill group on all devices in the room.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateSkillGroupFromRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDisassociateSkillGroupFromRoomRequest
 @see AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse
 */
- (AWSTask<AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse *> *)disassociateSkillGroupFromRoom:(AWSAlexaforbusinessDisassociateSkillGroupFromRoomRequest *)request;

/**
 <p>Disassociates a skill group from a specified room. This disables all skills in the skill group on all devices in the room.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateSkillGroupFromRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessDisassociateSkillGroupFromRoomRequest
 @see AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse
 */
- (void)disassociateSkillGroupFromRoom:(AWSAlexaforbusinessDisassociateSkillGroupFromRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Forgets smart home appliances associated to a room.</p>
 
 @param request A container for the necessary parameters to execute the ForgetSmartHomeAppliances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessForgetSmartHomeAppliancesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessForgetSmartHomeAppliancesRequest
 @see AWSAlexaforbusinessForgetSmartHomeAppliancesResponse
 */
- (AWSTask<AWSAlexaforbusinessForgetSmartHomeAppliancesResponse *> *)forgetSmartHomeAppliances:(AWSAlexaforbusinessForgetSmartHomeAppliancesRequest *)request;

/**
 <p>Forgets smart home appliances associated to a room.</p>
 
 @param request A container for the necessary parameters to execute the ForgetSmartHomeAppliances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessForgetSmartHomeAppliancesRequest
 @see AWSAlexaforbusinessForgetSmartHomeAppliancesResponse
 */
- (void)forgetSmartHomeAppliances:(AWSAlexaforbusinessForgetSmartHomeAppliancesRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessForgetSmartHomeAppliancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets address the book details by the address book ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetAddressBook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetAddressBookResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetAddressBookRequest
 @see AWSAlexaforbusinessGetAddressBookResponse
 */
- (AWSTask<AWSAlexaforbusinessGetAddressBookResponse *> *)getAddressBook:(AWSAlexaforbusinessGetAddressBookRequest *)request;

/**
 <p>Gets address the book details by the address book ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetAddressBook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetAddressBookRequest
 @see AWSAlexaforbusinessGetAddressBookResponse
 */
- (void)getAddressBook:(AWSAlexaforbusinessGetAddressBookRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetAddressBookResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the existing conference preferences.</p>
 
 @param request A container for the necessary parameters to execute the GetConferencePreference service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetConferencePreferenceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetConferencePreferenceRequest
 @see AWSAlexaforbusinessGetConferencePreferenceResponse
 */
- (AWSTask<AWSAlexaforbusinessGetConferencePreferenceResponse *> *)getConferencePreference:(AWSAlexaforbusinessGetConferencePreferenceRequest *)request;

/**
 <p>Retrieves the existing conference preferences.</p>
 
 @param request A container for the necessary parameters to execute the GetConferencePreference service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetConferencePreferenceRequest
 @see AWSAlexaforbusinessGetConferencePreferenceResponse
 */
- (void)getConferencePreference:(AWSAlexaforbusinessGetConferencePreferenceRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetConferencePreferenceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets details about a specific conference provider.</p>
 
 @param request A container for the necessary parameters to execute the GetConferenceProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetConferenceProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetConferenceProviderRequest
 @see AWSAlexaforbusinessGetConferenceProviderResponse
 */
- (AWSTask<AWSAlexaforbusinessGetConferenceProviderResponse *> *)getConferenceProvider:(AWSAlexaforbusinessGetConferenceProviderRequest *)request;

/**
 <p>Gets details about a specific conference provider.</p>
 
 @param request A container for the necessary parameters to execute the GetConferenceProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetConferenceProviderRequest
 @see AWSAlexaforbusinessGetConferenceProviderResponse
 */
- (void)getConferenceProvider:(AWSAlexaforbusinessGetConferenceProviderRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetConferenceProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the contact details by the contact ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetContactRequest
 @see AWSAlexaforbusinessGetContactResponse
 */
- (AWSTask<AWSAlexaforbusinessGetContactResponse *> *)getContact:(AWSAlexaforbusinessGetContactRequest *)request;

/**
 <p>Gets the contact details by the contact ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetContactRequest
 @see AWSAlexaforbusinessGetContactResponse
 */
- (void)getContact:(AWSAlexaforbusinessGetContactRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the details of a device by device ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetDeviceRequest
 @see AWSAlexaforbusinessGetDeviceResponse
 */
- (AWSTask<AWSAlexaforbusinessGetDeviceResponse *> *)getDevice:(AWSAlexaforbusinessGetDeviceRequest *)request;

/**
 <p>Gets the details of a device by device ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetDeviceRequest
 @see AWSAlexaforbusinessGetDeviceResponse
 */
- (void)getDevice:(AWSAlexaforbusinessGetDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the details of a gateway.</p>
 
 @param request A container for the necessary parameters to execute the GetGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetGatewayResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetGatewayRequest
 @see AWSAlexaforbusinessGetGatewayResponse
 */
- (AWSTask<AWSAlexaforbusinessGetGatewayResponse *> *)getGateway:(AWSAlexaforbusinessGetGatewayRequest *)request;

/**
 <p>Retrieves the details of a gateway.</p>
 
 @param request A container for the necessary parameters to execute the GetGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetGatewayRequest
 @see AWSAlexaforbusinessGetGatewayResponse
 */
- (void)getGateway:(AWSAlexaforbusinessGetGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetGatewayResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the details of a gateway group.</p>
 
 @param request A container for the necessary parameters to execute the GetGatewayGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetGatewayGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetGatewayGroupRequest
 @see AWSAlexaforbusinessGetGatewayGroupResponse
 */
- (AWSTask<AWSAlexaforbusinessGetGatewayGroupResponse *> *)getGatewayGroup:(AWSAlexaforbusinessGetGatewayGroupRequest *)request;

/**
 <p>Retrieves the details of a gateway group.</p>
 
 @param request A container for the necessary parameters to execute the GetGatewayGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetGatewayGroupRequest
 @see AWSAlexaforbusinessGetGatewayGroupResponse
 */
- (void)getGatewayGroup:(AWSAlexaforbusinessGetGatewayGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetGatewayGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the configured values for the user enrollment invitation email template.</p>
 
 @param request A container for the necessary parameters to execute the GetInvitationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetInvitationConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetInvitationConfigurationRequest
 @see AWSAlexaforbusinessGetInvitationConfigurationResponse
 */
- (AWSTask<AWSAlexaforbusinessGetInvitationConfigurationResponse *> *)getInvitationConfiguration:(AWSAlexaforbusinessGetInvitationConfigurationRequest *)request;

/**
 <p>Retrieves the configured values for the user enrollment invitation email template.</p>
 
 @param request A container for the necessary parameters to execute the GetInvitationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetInvitationConfigurationRequest
 @see AWSAlexaforbusinessGetInvitationConfigurationResponse
 */
- (void)getInvitationConfiguration:(AWSAlexaforbusinessGetInvitationConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetInvitationConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the network profile details by the network profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetNetworkProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetNetworkProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorInvalidSecretsManagerResource`.
 
 @see AWSAlexaforbusinessGetNetworkProfileRequest
 @see AWSAlexaforbusinessGetNetworkProfileResponse
 */
- (AWSTask<AWSAlexaforbusinessGetNetworkProfileResponse *> *)getNetworkProfile:(AWSAlexaforbusinessGetNetworkProfileRequest *)request;

/**
 <p>Gets the network profile details by the network profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetNetworkProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorInvalidSecretsManagerResource`.
 
 @see AWSAlexaforbusinessGetNetworkProfileRequest
 @see AWSAlexaforbusinessGetNetworkProfileResponse
 */
- (void)getNetworkProfile:(AWSAlexaforbusinessGetNetworkProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetNetworkProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the details of a room profile by profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetProfileRequest
 @see AWSAlexaforbusinessGetProfileResponse
 */
- (AWSTask<AWSAlexaforbusinessGetProfileResponse *> *)getProfile:(AWSAlexaforbusinessGetProfileRequest *)request;

/**
 <p>Gets the details of a room profile by profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetProfileRequest
 @see AWSAlexaforbusinessGetProfileResponse
 */
- (void)getProfile:(AWSAlexaforbusinessGetProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets room details by room ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetRoomRequest
 @see AWSAlexaforbusinessGetRoomResponse
 */
- (AWSTask<AWSAlexaforbusinessGetRoomResponse *> *)getRoom:(AWSAlexaforbusinessGetRoomRequest *)request;

/**
 <p>Gets room details by room ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetRoomRequest
 @see AWSAlexaforbusinessGetRoomResponse
 */
- (void)getRoom:(AWSAlexaforbusinessGetRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets room skill parameter details by room, skill, and parameter key ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetRoomSkillParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetRoomSkillParameterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetRoomSkillParameterRequest
 @see AWSAlexaforbusinessGetRoomSkillParameterResponse
 */
- (AWSTask<AWSAlexaforbusinessGetRoomSkillParameterResponse *> *)getRoomSkillParameter:(AWSAlexaforbusinessGetRoomSkillParameterRequest *)request;

/**
 <p>Gets room skill parameter details by room, skill, and parameter key ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetRoomSkillParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetRoomSkillParameterRequest
 @see AWSAlexaforbusinessGetRoomSkillParameterResponse
 */
- (void)getRoomSkillParameter:(AWSAlexaforbusinessGetRoomSkillParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetRoomSkillParameterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets skill group details by skill group ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetSkillGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessGetSkillGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetSkillGroupRequest
 @see AWSAlexaforbusinessGetSkillGroupResponse
 */
- (AWSTask<AWSAlexaforbusinessGetSkillGroupResponse *> *)getSkillGroup:(AWSAlexaforbusinessGetSkillGroupRequest *)request;

/**
 <p>Gets skill group details by skill group ARN.</p>
 
 @param request A container for the necessary parameters to execute the GetSkillGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessGetSkillGroupRequest
 @see AWSAlexaforbusinessGetSkillGroupResponse
 */
- (void)getSkillGroup:(AWSAlexaforbusinessGetSkillGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessGetSkillGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the details of the schedules that a user configured. A download URL of the report associated with each schedule is returned every time this action is called. A new download URL is returned each time, and is valid for 24 hours.</p>
 
 @param request A container for the necessary parameters to execute the ListBusinessReportSchedules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessListBusinessReportSchedulesResponse`.
 
 @see AWSAlexaforbusinessListBusinessReportSchedulesRequest
 @see AWSAlexaforbusinessListBusinessReportSchedulesResponse
 */
- (AWSTask<AWSAlexaforbusinessListBusinessReportSchedulesResponse *> *)listBusinessReportSchedules:(AWSAlexaforbusinessListBusinessReportSchedulesRequest *)request;

/**
 <p>Lists the details of the schedules that a user configured. A download URL of the report associated with each schedule is returned every time this action is called. A new download URL is returned each time, and is valid for 24 hours.</p>
 
 @param request A container for the necessary parameters to execute the ListBusinessReportSchedules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessListBusinessReportSchedulesRequest
 @see AWSAlexaforbusinessListBusinessReportSchedulesResponse
 */
- (void)listBusinessReportSchedules:(AWSAlexaforbusinessListBusinessReportSchedulesRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessListBusinessReportSchedulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists conference providers under a specific AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListConferenceProviders service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessListConferenceProvidersResponse`.
 
 @see AWSAlexaforbusinessListConferenceProvidersRequest
 @see AWSAlexaforbusinessListConferenceProvidersResponse
 */
- (AWSTask<AWSAlexaforbusinessListConferenceProvidersResponse *> *)listConferenceProviders:(AWSAlexaforbusinessListConferenceProvidersRequest *)request;

/**
 <p>Lists conference providers under a specific AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListConferenceProviders service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessListConferenceProvidersRequest
 @see AWSAlexaforbusinessListConferenceProvidersResponse
 */
- (void)listConferenceProviders:(AWSAlexaforbusinessListConferenceProvidersRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessListConferenceProvidersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the device event history, including device connection status, for up to 30 days.</p>
 
 @param request A container for the necessary parameters to execute the ListDeviceEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessListDeviceEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessListDeviceEventsRequest
 @see AWSAlexaforbusinessListDeviceEventsResponse
 */
- (AWSTask<AWSAlexaforbusinessListDeviceEventsResponse *> *)listDeviceEvents:(AWSAlexaforbusinessListDeviceEventsRequest *)request;

/**
 <p>Lists the device event history, including device connection status, for up to 30 days.</p>
 
 @param request A container for the necessary parameters to execute the ListDeviceEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessListDeviceEventsRequest
 @see AWSAlexaforbusinessListDeviceEventsResponse
 */
- (void)listDeviceEvents:(AWSAlexaforbusinessListDeviceEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessListDeviceEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of gateway group summaries. Use GetGatewayGroup to retrieve details of a specific gateway group.</p>
 
 @param request A container for the necessary parameters to execute the ListGatewayGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessListGatewayGroupsResponse`.
 
 @see AWSAlexaforbusinessListGatewayGroupsRequest
 @see AWSAlexaforbusinessListGatewayGroupsResponse
 */
- (AWSTask<AWSAlexaforbusinessListGatewayGroupsResponse *> *)listGatewayGroups:(AWSAlexaforbusinessListGatewayGroupsRequest *)request;

/**
 <p>Retrieves a list of gateway group summaries. Use GetGatewayGroup to retrieve details of a specific gateway group.</p>
 
 @param request A container for the necessary parameters to execute the ListGatewayGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessListGatewayGroupsRequest
 @see AWSAlexaforbusinessListGatewayGroupsResponse
 */
- (void)listGatewayGroups:(AWSAlexaforbusinessListGatewayGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessListGatewayGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of gateway summaries. Use GetGateway to retrieve details of a specific gateway. An optional gateway group ARN can be provided to only retrieve gateway summaries of gateways that are associated with that gateway group ARN.</p>
 
 @param request A container for the necessary parameters to execute the ListGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessListGatewaysResponse`.
 
 @see AWSAlexaforbusinessListGatewaysRequest
 @see AWSAlexaforbusinessListGatewaysResponse
 */
- (AWSTask<AWSAlexaforbusinessListGatewaysResponse *> *)listGateways:(AWSAlexaforbusinessListGatewaysRequest *)request;

/**
 <p>Retrieves a list of gateway summaries. Use GetGateway to retrieve details of a specific gateway. An optional gateway group ARN can be provided to only retrieve gateway summaries of gateways that are associated with that gateway group ARN.</p>
 
 @param request A container for the necessary parameters to execute the ListGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessListGatewaysRequest
 @see AWSAlexaforbusinessListGatewaysResponse
 */
- (void)listGateways:(AWSAlexaforbusinessListGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessListGatewaysResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all enabled skills in a specific skill group.</p>
 
 @param request A container for the necessary parameters to execute the ListSkills service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessListSkillsResponse`.
 
 @see AWSAlexaforbusinessListSkillsRequest
 @see AWSAlexaforbusinessListSkillsResponse
 */
- (AWSTask<AWSAlexaforbusinessListSkillsResponse *> *)listSkills:(AWSAlexaforbusinessListSkillsRequest *)request;

/**
 <p>Lists all enabled skills in a specific skill group.</p>
 
 @param request A container for the necessary parameters to execute the ListSkills service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessListSkillsRequest
 @see AWSAlexaforbusinessListSkillsResponse
 */
- (void)listSkills:(AWSAlexaforbusinessListSkillsRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessListSkillsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all categories in the Alexa skill store.</p>
 
 @param request A container for the necessary parameters to execute the ListSkillsStoreCategories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessListSkillsStoreCategoriesResponse`.
 
 @see AWSAlexaforbusinessListSkillsStoreCategoriesRequest
 @see AWSAlexaforbusinessListSkillsStoreCategoriesResponse
 */
- (AWSTask<AWSAlexaforbusinessListSkillsStoreCategoriesResponse *> *)listSkillsStoreCategories:(AWSAlexaforbusinessListSkillsStoreCategoriesRequest *)request;

/**
 <p>Lists all categories in the Alexa skill store.</p>
 
 @param request A container for the necessary parameters to execute the ListSkillsStoreCategories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessListSkillsStoreCategoriesRequest
 @see AWSAlexaforbusinessListSkillsStoreCategoriesResponse
 */
- (void)listSkillsStoreCategories:(AWSAlexaforbusinessListSkillsStoreCategoriesRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessListSkillsStoreCategoriesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all skills in the Alexa skill store by category.</p>
 
 @param request A container for the necessary parameters to execute the ListSkillsStoreSkillsByCategory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse`.
 
 @see AWSAlexaforbusinessListSkillsStoreSkillsByCategoryRequest
 @see AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse
 */
- (AWSTask<AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse *> *)listSkillsStoreSkillsByCategory:(AWSAlexaforbusinessListSkillsStoreSkillsByCategoryRequest *)request;

/**
 <p>Lists all skills in the Alexa skill store by category.</p>
 
 @param request A container for the necessary parameters to execute the ListSkillsStoreSkillsByCategory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessListSkillsStoreSkillsByCategoryRequest
 @see AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse
 */
- (void)listSkillsStoreSkillsByCategory:(AWSAlexaforbusinessListSkillsStoreSkillsByCategoryRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the smart home appliances associated with a room.</p>
 
 @param request A container for the necessary parameters to execute the ListSmartHomeAppliances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessListSmartHomeAppliancesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessListSmartHomeAppliancesRequest
 @see AWSAlexaforbusinessListSmartHomeAppliancesResponse
 */
- (AWSTask<AWSAlexaforbusinessListSmartHomeAppliancesResponse *> *)listSmartHomeAppliances:(AWSAlexaforbusinessListSmartHomeAppliancesRequest *)request;

/**
 <p>Lists all of the smart home appliances associated with a room.</p>
 
 @param request A container for the necessary parameters to execute the ListSmartHomeAppliances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessListSmartHomeAppliancesRequest
 @see AWSAlexaforbusinessListSmartHomeAppliancesResponse
 */
- (void)listSmartHomeAppliances:(AWSAlexaforbusinessListSmartHomeAppliancesRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessListSmartHomeAppliancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all tags for the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessListTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessListTagsRequest
 @see AWSAlexaforbusinessListTagsResponse
 */
- (AWSTask<AWSAlexaforbusinessListTagsResponse *> *)listTags:(AWSAlexaforbusinessListTagsRequest *)request;

/**
 <p>Lists all tags for the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessListTagsRequest
 @see AWSAlexaforbusinessListTagsResponse
 */
- (void)listTags:(AWSAlexaforbusinessListTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessListTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the conference preferences on a specific conference provider at the account level.</p>
 
 @param request A container for the necessary parameters to execute the PutConferencePreference service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessPutConferencePreferenceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessPutConferencePreferenceRequest
 @see AWSAlexaforbusinessPutConferencePreferenceResponse
 */
- (AWSTask<AWSAlexaforbusinessPutConferencePreferenceResponse *> *)putConferencePreference:(AWSAlexaforbusinessPutConferencePreferenceRequest *)request;

/**
 <p>Sets the conference preferences on a specific conference provider at the account level.</p>
 
 @param request A container for the necessary parameters to execute the PutConferencePreference service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessPutConferencePreferenceRequest
 @see AWSAlexaforbusinessPutConferencePreferenceResponse
 */
- (void)putConferencePreference:(AWSAlexaforbusinessPutConferencePreferenceRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessPutConferencePreferenceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures the email template for the user enrollment invitation with the specified attributes.</p>
 
 @param request A container for the necessary parameters to execute the PutInvitationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessPutInvitationConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessPutInvitationConfigurationRequest
 @see AWSAlexaforbusinessPutInvitationConfigurationResponse
 */
- (AWSTask<AWSAlexaforbusinessPutInvitationConfigurationResponse *> *)putInvitationConfiguration:(AWSAlexaforbusinessPutInvitationConfigurationRequest *)request;

/**
 <p>Configures the email template for the user enrollment invitation with the specified attributes.</p>
 
 @param request A container for the necessary parameters to execute the PutInvitationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessPutInvitationConfigurationRequest
 @see AWSAlexaforbusinessPutInvitationConfigurationResponse
 */
- (void)putInvitationConfiguration:(AWSAlexaforbusinessPutInvitationConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessPutInvitationConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates room skill parameter details by room, skill, and parameter key ID. Not all skills have a room skill parameter.</p>
 
 @param request A container for the necessary parameters to execute the PutRoomSkillParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessPutRoomSkillParameterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessPutRoomSkillParameterRequest
 @see AWSAlexaforbusinessPutRoomSkillParameterResponse
 */
- (AWSTask<AWSAlexaforbusinessPutRoomSkillParameterResponse *> *)putRoomSkillParameter:(AWSAlexaforbusinessPutRoomSkillParameterRequest *)request;

/**
 <p>Updates room skill parameter details by room, skill, and parameter key ID. Not all skills have a room skill parameter.</p>
 
 @param request A container for the necessary parameters to execute the PutRoomSkillParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessPutRoomSkillParameterRequest
 @see AWSAlexaforbusinessPutRoomSkillParameterResponse
 */
- (void)putRoomSkillParameter:(AWSAlexaforbusinessPutRoomSkillParameterRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessPutRoomSkillParameterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Links a user's account to a third-party skill provider. If this API operation is called by an assumed IAM role, the skill being linked must be a private skill. Also, the skill must be owned by the AWS account that assumed the IAM role.</p>
 
 @param request A container for the necessary parameters to execute the PutSkillAuthorization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessPutSkillAuthorizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorUnauthorized`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessPutSkillAuthorizationRequest
 @see AWSAlexaforbusinessPutSkillAuthorizationResponse
 */
- (AWSTask<AWSAlexaforbusinessPutSkillAuthorizationResponse *> *)putSkillAuthorization:(AWSAlexaforbusinessPutSkillAuthorizationRequest *)request;

/**
 <p>Links a user's account to a third-party skill provider. If this API operation is called by an assumed IAM role, the skill being linked must be a private skill. Also, the skill must be owned by the AWS account that assumed the IAM role.</p>
 
 @param request A container for the necessary parameters to execute the PutSkillAuthorization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorUnauthorized`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessPutSkillAuthorizationRequest
 @see AWSAlexaforbusinessPutSkillAuthorizationResponse
 */
- (void)putSkillAuthorization:(AWSAlexaforbusinessPutSkillAuthorizationRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessPutSkillAuthorizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers an Alexa-enabled device built by an Original Equipment Manufacturer (OEM) using Alexa Voice Service (AVS).</p>
 
 @param request A container for the necessary parameters to execute the RegisterAVSDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessRegisterAVSDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorInvalidDevice`.
 
 @see AWSAlexaforbusinessRegisterAVSDeviceRequest
 @see AWSAlexaforbusinessRegisterAVSDeviceResponse
 */
- (AWSTask<AWSAlexaforbusinessRegisterAVSDeviceResponse *> *)registerAVSDevice:(AWSAlexaforbusinessRegisterAVSDeviceRequest *)request;

/**
 <p>Registers an Alexa-enabled device built by an Original Equipment Manufacturer (OEM) using Alexa Voice Service (AVS).</p>
 
 @param request A container for the necessary parameters to execute the RegisterAVSDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorInvalidDevice`.
 
 @see AWSAlexaforbusinessRegisterAVSDeviceRequest
 @see AWSAlexaforbusinessRegisterAVSDeviceResponse
 */
- (void)registerAVSDevice:(AWSAlexaforbusinessRegisterAVSDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessRegisterAVSDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a skill from the organization under a user's AWS account. If the skill is a private skill, it moves to an AcceptStatus of PENDING. Any private or public skill that is rejected can be added later by calling the ApproveSkill API. </p>
 
 @param request A container for the necessary parameters to execute the RejectSkill service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessRejectSkillResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessRejectSkillRequest
 @see AWSAlexaforbusinessRejectSkillResponse
 */
- (AWSTask<AWSAlexaforbusinessRejectSkillResponse *> *)rejectSkill:(AWSAlexaforbusinessRejectSkillRequest *)request;

/**
 <p>Disassociates a skill from the organization under a user's AWS account. If the skill is a private skill, it moves to an AcceptStatus of PENDING. Any private or public skill that is rejected can be added later by calling the ApproveSkill API. </p>
 
 @param request A container for the necessary parameters to execute the RejectSkill service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessRejectSkillRequest
 @see AWSAlexaforbusinessRejectSkillResponse
 */
- (void)rejectSkill:(AWSAlexaforbusinessRejectSkillRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessRejectSkillResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Determines the details for the room from which a skill request was invoked. This operation is used by skill developers.</p>
 
 @param request A container for the necessary parameters to execute the ResolveRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessResolveRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessResolveRoomRequest
 @see AWSAlexaforbusinessResolveRoomResponse
 */
- (AWSTask<AWSAlexaforbusinessResolveRoomResponse *> *)resolveRoom:(AWSAlexaforbusinessResolveRoomRequest *)request;

/**
 <p>Determines the details for the room from which a skill request was invoked. This operation is used by skill developers.</p>
 
 @param request A container for the necessary parameters to execute the ResolveRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessResolveRoomRequest
 @see AWSAlexaforbusinessResolveRoomResponse
 */
- (void)resolveRoom:(AWSAlexaforbusinessResolveRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessResolveRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Revokes an invitation and invalidates the enrollment URL.</p>
 
 @param request A container for the necessary parameters to execute the RevokeInvitation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessRevokeInvitationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessRevokeInvitationRequest
 @see AWSAlexaforbusinessRevokeInvitationResponse
 */
- (AWSTask<AWSAlexaforbusinessRevokeInvitationResponse *> *)revokeInvitation:(AWSAlexaforbusinessRevokeInvitationRequest *)request;

/**
 <p>Revokes an invitation and invalidates the enrollment URL.</p>
 
 @param request A container for the necessary parameters to execute the RevokeInvitation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessRevokeInvitationRequest
 @see AWSAlexaforbusinessRevokeInvitationResponse
 */
- (void)revokeInvitation:(AWSAlexaforbusinessRevokeInvitationRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessRevokeInvitationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches address books and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchAddressBooks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessSearchAddressBooksResponse`.
 
 @see AWSAlexaforbusinessSearchAddressBooksRequest
 @see AWSAlexaforbusinessSearchAddressBooksResponse
 */
- (AWSTask<AWSAlexaforbusinessSearchAddressBooksResponse *> *)searchAddressBooks:(AWSAlexaforbusinessSearchAddressBooksRequest *)request;

/**
 <p>Searches address books and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchAddressBooks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessSearchAddressBooksRequest
 @see AWSAlexaforbusinessSearchAddressBooksResponse
 */
- (void)searchAddressBooks:(AWSAlexaforbusinessSearchAddressBooksRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessSearchAddressBooksResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches contacts and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchContacts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessSearchContactsResponse`.
 
 @see AWSAlexaforbusinessSearchContactsRequest
 @see AWSAlexaforbusinessSearchContactsResponse
 */
- (AWSTask<AWSAlexaforbusinessSearchContactsResponse *> *)searchContacts:(AWSAlexaforbusinessSearchContactsRequest *)request;

/**
 <p>Searches contacts and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchContacts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessSearchContactsRequest
 @see AWSAlexaforbusinessSearchContactsResponse
 */
- (void)searchContacts:(AWSAlexaforbusinessSearchContactsRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessSearchContactsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches devices and lists the ones that meet a set of filter criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchDevices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessSearchDevicesResponse`.
 
 @see AWSAlexaforbusinessSearchDevicesRequest
 @see AWSAlexaforbusinessSearchDevicesResponse
 */
- (AWSTask<AWSAlexaforbusinessSearchDevicesResponse *> *)searchDevices:(AWSAlexaforbusinessSearchDevicesRequest *)request;

/**
 <p>Searches devices and lists the ones that meet a set of filter criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchDevices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessSearchDevicesRequest
 @see AWSAlexaforbusinessSearchDevicesResponse
 */
- (void)searchDevices:(AWSAlexaforbusinessSearchDevicesRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessSearchDevicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches network profiles and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchNetworkProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessSearchNetworkProfilesResponse`.
 
 @see AWSAlexaforbusinessSearchNetworkProfilesRequest
 @see AWSAlexaforbusinessSearchNetworkProfilesResponse
 */
- (AWSTask<AWSAlexaforbusinessSearchNetworkProfilesResponse *> *)searchNetworkProfiles:(AWSAlexaforbusinessSearchNetworkProfilesRequest *)request;

/**
 <p>Searches network profiles and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchNetworkProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessSearchNetworkProfilesRequest
 @see AWSAlexaforbusinessSearchNetworkProfilesResponse
 */
- (void)searchNetworkProfiles:(AWSAlexaforbusinessSearchNetworkProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessSearchNetworkProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches room profiles and lists the ones that meet a set of filter criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessSearchProfilesResponse`.
 
 @see AWSAlexaforbusinessSearchProfilesRequest
 @see AWSAlexaforbusinessSearchProfilesResponse
 */
- (AWSTask<AWSAlexaforbusinessSearchProfilesResponse *> *)searchProfiles:(AWSAlexaforbusinessSearchProfilesRequest *)request;

/**
 <p>Searches room profiles and lists the ones that meet a set of filter criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessSearchProfilesRequest
 @see AWSAlexaforbusinessSearchProfilesResponse
 */
- (void)searchProfiles:(AWSAlexaforbusinessSearchProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessSearchProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches rooms and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchRooms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessSearchRoomsResponse`.
 
 @see AWSAlexaforbusinessSearchRoomsRequest
 @see AWSAlexaforbusinessSearchRoomsResponse
 */
- (AWSTask<AWSAlexaforbusinessSearchRoomsResponse *> *)searchRooms:(AWSAlexaforbusinessSearchRoomsRequest *)request;

/**
 <p>Searches rooms and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchRooms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessSearchRoomsRequest
 @see AWSAlexaforbusinessSearchRoomsResponse
 */
- (void)searchRooms:(AWSAlexaforbusinessSearchRoomsRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessSearchRoomsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches skill groups and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchSkillGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessSearchSkillGroupsResponse`.
 
 @see AWSAlexaforbusinessSearchSkillGroupsRequest
 @see AWSAlexaforbusinessSearchSkillGroupsResponse
 */
- (AWSTask<AWSAlexaforbusinessSearchSkillGroupsResponse *> *)searchSkillGroups:(AWSAlexaforbusinessSearchSkillGroupsRequest *)request;

/**
 <p>Searches skill groups and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchSkillGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessSearchSkillGroupsRequest
 @see AWSAlexaforbusinessSearchSkillGroupsResponse
 */
- (void)searchSkillGroups:(AWSAlexaforbusinessSearchSkillGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessSearchSkillGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches users and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessSearchUsersResponse`.
 
 @see AWSAlexaforbusinessSearchUsersRequest
 @see AWSAlexaforbusinessSearchUsersResponse
 */
- (AWSTask<AWSAlexaforbusinessSearchUsersResponse *> *)searchUsers:(AWSAlexaforbusinessSearchUsersRequest *)request;

/**
 <p>Searches users and lists the ones that meet a set of filter and sort criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAlexaforbusinessSearchUsersRequest
 @see AWSAlexaforbusinessSearchUsersResponse
 */
- (void)searchUsers:(AWSAlexaforbusinessSearchUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessSearchUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Triggers an asynchronous flow to send text, SSML, or audio announcements to rooms that are identified by a search or filter. </p>
 
 @param request A container for the necessary parameters to execute the SendAnnouncement service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessSendAnnouncementResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorAlreadyExists`.
 
 @see AWSAlexaforbusinessSendAnnouncementRequest
 @see AWSAlexaforbusinessSendAnnouncementResponse
 */
- (AWSTask<AWSAlexaforbusinessSendAnnouncementResponse *> *)sendAnnouncement:(AWSAlexaforbusinessSendAnnouncementRequest *)request;

/**
 <p>Triggers an asynchronous flow to send text, SSML, or audio announcements to rooms that are identified by a search or filter. </p>
 
 @param request A container for the necessary parameters to execute the SendAnnouncement service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorLimitExceeded`, `AWSAlexaforbusinessErrorAlreadyExists`.
 
 @see AWSAlexaforbusinessSendAnnouncementRequest
 @see AWSAlexaforbusinessSendAnnouncementResponse
 */
- (void)sendAnnouncement:(AWSAlexaforbusinessSendAnnouncementRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessSendAnnouncementResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends an enrollment invitation email with a URL to a user. The URL is valid for 30 days or until you call this operation again, whichever comes first. </p>
 
 @param request A container for the necessary parameters to execute the SendInvitation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessSendInvitationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorInvalidUserStatus`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessSendInvitationRequest
 @see AWSAlexaforbusinessSendInvitationResponse
 */
- (AWSTask<AWSAlexaforbusinessSendInvitationResponse *> *)sendInvitation:(AWSAlexaforbusinessSendInvitationRequest *)request;

/**
 <p>Sends an enrollment invitation email with a URL to a user. The URL is valid for 30 days or until you call this operation again, whichever comes first. </p>
 
 @param request A container for the necessary parameters to execute the SendInvitation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorInvalidUserStatus`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessSendInvitationRequest
 @see AWSAlexaforbusinessSendInvitationResponse
 */
- (void)sendInvitation:(AWSAlexaforbusinessSendInvitationRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessSendInvitationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets a device and its account to the known default settings. This clears all information and settings set by previous users in the following ways:</p><ul><li><p>Bluetooth - This unpairs all bluetooth devices paired with your echo device.</p></li><li><p>Volume - This resets the echo device's volume to the default value.</p></li><li><p>Notifications - This clears all notifications from your echo device.</p></li><li><p>Lists - This clears all to-do items from your echo device.</p></li><li><p>Settings - This internally syncs the room's profile (if the device is assigned to a room), contacts, address books, delegation access for account linking, and communications (if enabled on the room profile).</p></li></ul>
 
 @param request A container for the necessary parameters to execute the StartDeviceSync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessStartDeviceSyncResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorDeviceNotRegistered`.
 
 @see AWSAlexaforbusinessStartDeviceSyncRequest
 @see AWSAlexaforbusinessStartDeviceSyncResponse
 */
- (AWSTask<AWSAlexaforbusinessStartDeviceSyncResponse *> *)startDeviceSync:(AWSAlexaforbusinessStartDeviceSyncRequest *)request;

/**
 <p>Resets a device and its account to the known default settings. This clears all information and settings set by previous users in the following ways:</p><ul><li><p>Bluetooth - This unpairs all bluetooth devices paired with your echo device.</p></li><li><p>Volume - This resets the echo device's volume to the default value.</p></li><li><p>Notifications - This clears all notifications from your echo device.</p></li><li><p>Lists - This clears all to-do items from your echo device.</p></li><li><p>Settings - This internally syncs the room's profile (if the device is assigned to a room), contacts, address books, delegation access for account linking, and communications (if enabled on the room profile).</p></li></ul>
 
 @param request A container for the necessary parameters to execute the StartDeviceSync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorDeviceNotRegistered`.
 
 @see AWSAlexaforbusinessStartDeviceSyncRequest
 @see AWSAlexaforbusinessStartDeviceSyncResponse
 */
- (void)startDeviceSync:(AWSAlexaforbusinessStartDeviceSyncRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessStartDeviceSyncResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates the discovery of any smart home appliances associated with the room.</p>
 
 @param request A container for the necessary parameters to execute the StartSmartHomeApplianceDiscovery service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryRequest
 @see AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse
 */
- (AWSTask<AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse *> *)startSmartHomeApplianceDiscovery:(AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryRequest *)request;

/**
 <p>Initiates the discovery of any smart home appliances associated with the room.</p>
 
 @param request A container for the necessary parameters to execute the StartSmartHomeApplianceDiscovery service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryRequest
 @see AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse
 */
- (void)startSmartHomeApplianceDiscovery:(AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds metadata tags to a specified resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessTagResourceRequest
 @see AWSAlexaforbusinessTagResourceResponse
 */
- (AWSTask<AWSAlexaforbusinessTagResourceResponse *> *)tagResource:(AWSAlexaforbusinessTagResourceRequest *)request;

/**
 <p>Adds metadata tags to a specified resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessTagResourceRequest
 @see AWSAlexaforbusinessTagResourceResponse
 */
- (void)tagResource:(AWSAlexaforbusinessTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes metadata tags from a specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessUntagResourceRequest
 @see AWSAlexaforbusinessUntagResourceResponse
 */
- (AWSTask<AWSAlexaforbusinessUntagResourceResponse *> *)untagResource:(AWSAlexaforbusinessUntagResourceRequest *)request;

/**
 <p>Removes metadata tags from a specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessUntagResourceRequest
 @see AWSAlexaforbusinessUntagResourceResponse
 */
- (void)untagResource:(AWSAlexaforbusinessUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates address book details by the address book ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAddressBook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUpdateAddressBookResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessUpdateAddressBookRequest
 @see AWSAlexaforbusinessUpdateAddressBookResponse
 */
- (AWSTask<AWSAlexaforbusinessUpdateAddressBookResponse *> *)updateAddressBook:(AWSAlexaforbusinessUpdateAddressBookRequest *)request;

/**
 <p>Updates address book details by the address book ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAddressBook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessUpdateAddressBookRequest
 @see AWSAlexaforbusinessUpdateAddressBookResponse
 */
- (void)updateAddressBook:(AWSAlexaforbusinessUpdateAddressBookRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUpdateAddressBookResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the configuration of the report delivery schedule with the specified schedule ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBusinessReportSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUpdateBusinessReportScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessUpdateBusinessReportScheduleRequest
 @see AWSAlexaforbusinessUpdateBusinessReportScheduleResponse
 */
- (AWSTask<AWSAlexaforbusinessUpdateBusinessReportScheduleResponse *> *)updateBusinessReportSchedule:(AWSAlexaforbusinessUpdateBusinessReportScheduleRequest *)request;

/**
 <p>Updates the configuration of the report delivery schedule with the specified schedule ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBusinessReportSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessUpdateBusinessReportScheduleRequest
 @see AWSAlexaforbusinessUpdateBusinessReportScheduleResponse
 */
- (void)updateBusinessReportSchedule:(AWSAlexaforbusinessUpdateBusinessReportScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUpdateBusinessReportScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing conference provider's settings.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConferenceProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUpdateConferenceProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessUpdateConferenceProviderRequest
 @see AWSAlexaforbusinessUpdateConferenceProviderResponse
 */
- (AWSTask<AWSAlexaforbusinessUpdateConferenceProviderResponse *> *)updateConferenceProvider:(AWSAlexaforbusinessUpdateConferenceProviderRequest *)request;

/**
 <p>Updates an existing conference provider's settings.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConferenceProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`.
 
 @see AWSAlexaforbusinessUpdateConferenceProviderRequest
 @see AWSAlexaforbusinessUpdateConferenceProviderResponse
 */
- (void)updateConferenceProvider:(AWSAlexaforbusinessUpdateConferenceProviderRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUpdateConferenceProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the contact details by the contact ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUpdateContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessUpdateContactRequest
 @see AWSAlexaforbusinessUpdateContactResponse
 */
- (AWSTask<AWSAlexaforbusinessUpdateContactResponse *> *)updateContact:(AWSAlexaforbusinessUpdateContactRequest *)request;

/**
 <p>Updates the contact details by the contact ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessUpdateContactRequest
 @see AWSAlexaforbusinessUpdateContactResponse
 */
- (void)updateContact:(AWSAlexaforbusinessUpdateContactRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUpdateContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the device name by device ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUpdateDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorDeviceNotRegistered`.
 
 @see AWSAlexaforbusinessUpdateDeviceRequest
 @see AWSAlexaforbusinessUpdateDeviceResponse
 */
- (AWSTask<AWSAlexaforbusinessUpdateDeviceResponse *> *)updateDevice:(AWSAlexaforbusinessUpdateDeviceRequest *)request;

/**
 <p>Updates the device name by device ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorDeviceNotRegistered`.
 
 @see AWSAlexaforbusinessUpdateDeviceRequest
 @see AWSAlexaforbusinessUpdateDeviceResponse
 */
- (void)updateDevice:(AWSAlexaforbusinessUpdateDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUpdateDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the details of a gateway. If any optional field is not provided, the existing corresponding value is left unmodified.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUpdateGatewayResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`.
 
 @see AWSAlexaforbusinessUpdateGatewayRequest
 @see AWSAlexaforbusinessUpdateGatewayResponse
 */
- (AWSTask<AWSAlexaforbusinessUpdateGatewayResponse *> *)updateGateway:(AWSAlexaforbusinessUpdateGatewayRequest *)request;

/**
 <p>Updates the details of a gateway. If any optional field is not provided, the existing corresponding value is left unmodified.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`.
 
 @see AWSAlexaforbusinessUpdateGatewayRequest
 @see AWSAlexaforbusinessUpdateGatewayResponse
 */
- (void)updateGateway:(AWSAlexaforbusinessUpdateGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUpdateGatewayResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the details of a gateway group. If any optional field is not provided, the existing corresponding value is left unmodified.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGatewayGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUpdateGatewayGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`.
 
 @see AWSAlexaforbusinessUpdateGatewayGroupRequest
 @see AWSAlexaforbusinessUpdateGatewayGroupResponse
 */
- (AWSTask<AWSAlexaforbusinessUpdateGatewayGroupResponse *> *)updateGatewayGroup:(AWSAlexaforbusinessUpdateGatewayGroupRequest *)request;

/**
 <p>Updates the details of a gateway group. If any optional field is not provided, the existing corresponding value is left unmodified.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGatewayGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`.
 
 @see AWSAlexaforbusinessUpdateGatewayGroupRequest
 @see AWSAlexaforbusinessUpdateGatewayGroupResponse
 */
- (void)updateGatewayGroup:(AWSAlexaforbusinessUpdateGatewayGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUpdateGatewayGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a network profile by the network profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNetworkProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUpdateNetworkProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorInvalidCertificateAuthority`, `AWSAlexaforbusinessErrorInvalidSecretsManagerResource`.
 
 @see AWSAlexaforbusinessUpdateNetworkProfileRequest
 @see AWSAlexaforbusinessUpdateNetworkProfileResponse
 */
- (AWSTask<AWSAlexaforbusinessUpdateNetworkProfileResponse *> *)updateNetworkProfile:(AWSAlexaforbusinessUpdateNetworkProfileRequest *)request;

/**
 <p>Updates a network profile by the network profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNetworkProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`, `AWSAlexaforbusinessErrorConcurrentModification`, `AWSAlexaforbusinessErrorInvalidCertificateAuthority`, `AWSAlexaforbusinessErrorInvalidSecretsManagerResource`.
 
 @see AWSAlexaforbusinessUpdateNetworkProfileRequest
 @see AWSAlexaforbusinessUpdateNetworkProfileResponse
 */
- (void)updateNetworkProfile:(AWSAlexaforbusinessUpdateNetworkProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUpdateNetworkProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing room profile by room profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUpdateProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessUpdateProfileRequest
 @see AWSAlexaforbusinessUpdateProfileResponse
 */
- (AWSTask<AWSAlexaforbusinessUpdateProfileResponse *> *)updateProfile:(AWSAlexaforbusinessUpdateProfileRequest *)request;

/**
 <p>Updates an existing room profile by room profile ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessUpdateProfileRequest
 @see AWSAlexaforbusinessUpdateProfileResponse
 */
- (void)updateProfile:(AWSAlexaforbusinessUpdateProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUpdateProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates room details by room ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoom service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUpdateRoomResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`.
 
 @see AWSAlexaforbusinessUpdateRoomRequest
 @see AWSAlexaforbusinessUpdateRoomResponse
 */
- (AWSTask<AWSAlexaforbusinessUpdateRoomResponse *> *)updateRoom:(AWSAlexaforbusinessUpdateRoomRequest *)request;

/**
 <p>Updates room details by room ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoom service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`.
 
 @see AWSAlexaforbusinessUpdateRoomRequest
 @see AWSAlexaforbusinessUpdateRoomResponse
 */
- (void)updateRoom:(AWSAlexaforbusinessUpdateRoomRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUpdateRoomResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates skill group details by skill group ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSkillGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAlexaforbusinessUpdateSkillGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessUpdateSkillGroupRequest
 @see AWSAlexaforbusinessUpdateSkillGroupResponse
 */
- (AWSTask<AWSAlexaforbusinessUpdateSkillGroupResponse *> *)updateSkillGroup:(AWSAlexaforbusinessUpdateSkillGroupRequest *)request;

/**
 <p>Updates skill group details by skill group ARN.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSkillGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAlexaforbusinessErrorDomain` domain and the following error code: `AWSAlexaforbusinessErrorNotFound`, `AWSAlexaforbusinessErrorNameInUse`, `AWSAlexaforbusinessErrorConcurrentModification`.
 
 @see AWSAlexaforbusinessUpdateSkillGroupRequest
 @see AWSAlexaforbusinessUpdateSkillGroupResponse
 */
- (void)updateSkillGroup:(AWSAlexaforbusinessUpdateSkillGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSAlexaforbusinessUpdateSkillGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
