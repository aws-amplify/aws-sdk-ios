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
#import "AWSGuarddutyModel.h"
#import "AWSGuarddutyResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSGuardduty
FOUNDATION_EXPORT NSString *const AWSGuarddutySDKVersion;

/**
 <p>Amazon GuardDuty is a continuous security monitoring service that analyzes and processes the following data sources: VPC Flow Logs, AWS CloudTrail event logs, and DNS logs. It uses threat intelligence feeds (such as lists of malicious IPs and domains) and machine learning to identify unexpected, potentially unauthorized, and malicious activity within your AWS environment. This can include issues like escalations of privileges, uses of exposed credentials, or communication with malicious IPs, URLs, or domains. For example, GuardDuty can detect compromised EC2 instances that serve malware or mine bitcoin. </p><p>GuardDuty also monitors AWS account access behavior for signs of compromise. Some examples of this are unauthorized infrastructure deployments such as EC2 instances deployed in a Region that has never been used, or unusual API calls like a password policy change to reduce password strength. </p><p>GuardDuty informs you of the status of your AWS environment by producing security findings that you can view in the GuardDuty console or through Amazon CloudWatch events. For more information, see the <i><a href="https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html">Amazon GuardDuty User Guide</a></i>. </p>
 */
@interface AWSGuardduty : AWSService

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

     let Guardduty = AWSGuardduty.default()

 *Objective-C*

     AWSGuardduty *Guardduty = [AWSGuardduty defaultGuardduty];

 @return The default service client.
 */
+ (instancetype)defaultGuardduty;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSGuardduty.register(with: configuration!, forKey: "USWest2Guardduty")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:@"USWest2Guardduty"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Guardduty = AWSGuardduty(forKey: "USWest2Guardduty")

 *Objective-C*

     AWSGuardduty *Guardduty = [AWSGuardduty GuarddutyForKey:@"USWest2Guardduty"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerGuarddutyWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerGuarddutyWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSGuardduty.register(with: configuration!, forKey: "USWest2Guardduty")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:@"USWest2Guardduty"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Guardduty = AWSGuardduty(forKey: "USWest2Guardduty")

 *Objective-C*

     AWSGuardduty *Guardduty = [AWSGuardduty GuarddutyForKey:@"USWest2Guardduty"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)GuarddutyForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeGuarddutyForKey:(NSString *)key;

/**
 <p>Accepts the invitation to be monitored by a master GuardDuty account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInvitation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyAcceptInvitationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyAcceptInvitationRequest
 @see AWSGuarddutyAcceptInvitationResponse
 */
- (AWSTask<AWSGuarddutyAcceptInvitationResponse *> *)acceptInvitation:(AWSGuarddutyAcceptInvitationRequest *)request;

/**
 <p>Accepts the invitation to be monitored by a master GuardDuty account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInvitation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyAcceptInvitationRequest
 @see AWSGuarddutyAcceptInvitationResponse
 */
- (void)acceptInvitation:(AWSGuarddutyAcceptInvitationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyAcceptInvitationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Archives GuardDuty findings that are specified by the list of finding IDs.</p><note><p>Only the master account can archive findings. Member accounts don't have permission to archive findings from their accounts.</p></note>
 
 @param request A container for the necessary parameters to execute the ArchiveFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyArchiveFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyArchiveFindingsRequest
 @see AWSGuarddutyArchiveFindingsResponse
 */
- (AWSTask<AWSGuarddutyArchiveFindingsResponse *> *)archiveFindings:(AWSGuarddutyArchiveFindingsRequest *)request;

/**
 <p>Archives GuardDuty findings that are specified by the list of finding IDs.</p><note><p>Only the master account can archive findings. Member accounts don't have permission to archive findings from their accounts.</p></note>
 
 @param request A container for the necessary parameters to execute the ArchiveFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyArchiveFindingsRequest
 @see AWSGuarddutyArchiveFindingsResponse
 */
- (void)archiveFindings:(AWSGuarddutyArchiveFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyArchiveFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a single Amazon GuardDuty detector. A detector is a resource that represents the GuardDuty service. To start using GuardDuty, you must create a detector in each Region where you enable the service. You can have only one detector per account per Region.</p>
 
 @param request A container for the necessary parameters to execute the CreateDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyCreateDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateDetectorRequest
 @see AWSGuarddutyCreateDetectorResponse
 */
- (AWSTask<AWSGuarddutyCreateDetectorResponse *> *)createDetector:(AWSGuarddutyCreateDetectorRequest *)request;

/**
 <p>Creates a single Amazon GuardDuty detector. A detector is a resource that represents the GuardDuty service. To start using GuardDuty, you must create a detector in each Region where you enable the service. You can have only one detector per account per Region.</p>
 
 @param request A container for the necessary parameters to execute the CreateDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateDetectorRequest
 @see AWSGuarddutyCreateDetectorResponse
 */
- (void)createDetector:(AWSGuarddutyCreateDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyCreateDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a filter using the specified finding criteria.</p>
 
 @param request A container for the necessary parameters to execute the CreateFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyCreateFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateFilterRequest
 @see AWSGuarddutyCreateFilterResponse
 */
- (AWSTask<AWSGuarddutyCreateFilterResponse *> *)createFilter:(AWSGuarddutyCreateFilterRequest *)request;

/**
 <p>Creates a filter using the specified finding criteria.</p>
 
 @param request A container for the necessary parameters to execute the CreateFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateFilterRequest
 @see AWSGuarddutyCreateFilterResponse
 */
- (void)createFilter:(AWSGuarddutyCreateFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyCreateFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new IPSet, which is called a trusted IP list in the console user interface. An IPSet is a list of IP addresses that are trusted for secure communication with AWS infrastructure and applications. GuardDuty doesn't generate findings for IP addresses that are included in IPSets. Only users from the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyCreateIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateIPSetRequest
 @see AWSGuarddutyCreateIPSetResponse
 */
- (AWSTask<AWSGuarddutyCreateIPSetResponse *> *)createIPSet:(AWSGuarddutyCreateIPSetRequest *)request;

/**
 <p>Creates a new IPSet, which is called a trusted IP list in the console user interface. An IPSet is a list of IP addresses that are trusted for secure communication with AWS infrastructure and applications. GuardDuty doesn't generate findings for IP addresses that are included in IPSets. Only users from the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateIPSetRequest
 @see AWSGuarddutyCreateIPSetResponse
 */
- (void)createIPSet:(AWSGuarddutyCreateIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyCreateIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates member accounts of the current AWS account by specifying a list of AWS account IDs. The current AWS account can then invite these members to manage GuardDuty in their accounts.</p>
 
 @param request A container for the necessary parameters to execute the CreateMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyCreateMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateMembersRequest
 @see AWSGuarddutyCreateMembersResponse
 */
- (AWSTask<AWSGuarddutyCreateMembersResponse *> *)createMembers:(AWSGuarddutyCreateMembersRequest *)request;

/**
 <p>Creates member accounts of the current AWS account by specifying a list of AWS account IDs. The current AWS account can then invite these members to manage GuardDuty in their accounts.</p>
 
 @param request A container for the necessary parameters to execute the CreateMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateMembersRequest
 @see AWSGuarddutyCreateMembersResponse
 */
- (void)createMembers:(AWSGuarddutyCreateMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyCreateMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a publishing destination to export findings to. The resource to export findings to must exist before you use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyCreatePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreatePublishingDestinationRequest
 @see AWSGuarddutyCreatePublishingDestinationResponse
 */
- (AWSTask<AWSGuarddutyCreatePublishingDestinationResponse *> *)createPublishingDestination:(AWSGuarddutyCreatePublishingDestinationRequest *)request;

/**
 <p>Creates a publishing destination to export findings to. The resource to export findings to must exist before you use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreatePublishingDestinationRequest
 @see AWSGuarddutyCreatePublishingDestinationResponse
 */
- (void)createPublishingDestination:(AWSGuarddutyCreatePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyCreatePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates example findings of types specified by the list of finding types. If 'NULL' is specified for <code>findingTypes</code>, the API generates example findings of all supported finding types.</p>
 
 @param request A container for the necessary parameters to execute the CreateSampleFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyCreateSampleFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateSampleFindingsRequest
 @see AWSGuarddutyCreateSampleFindingsResponse
 */
- (AWSTask<AWSGuarddutyCreateSampleFindingsResponse *> *)createSampleFindings:(AWSGuarddutyCreateSampleFindingsRequest *)request;

/**
 <p>Generates example findings of types specified by the list of finding types. If 'NULL' is specified for <code>findingTypes</code>, the API generates example findings of all supported finding types.</p>
 
 @param request A container for the necessary parameters to execute the CreateSampleFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateSampleFindingsRequest
 @see AWSGuarddutyCreateSampleFindingsResponse
 */
- (void)createSampleFindings:(AWSGuarddutyCreateSampleFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyCreateSampleFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new ThreatIntelSet. ThreatIntelSets consist of known malicious IP addresses. GuardDuty generates findings based on ThreatIntelSets. Only users of the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyCreateThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateThreatIntelSetRequest
 @see AWSGuarddutyCreateThreatIntelSetResponse
 */
- (AWSTask<AWSGuarddutyCreateThreatIntelSetResponse *> *)createThreatIntelSet:(AWSGuarddutyCreateThreatIntelSetRequest *)request;

/**
 <p>Creates a new ThreatIntelSet. ThreatIntelSets consist of known malicious IP addresses. GuardDuty generates findings based on ThreatIntelSets. Only users of the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyCreateThreatIntelSetRequest
 @see AWSGuarddutyCreateThreatIntelSetResponse
 */
- (void)createThreatIntelSet:(AWSGuarddutyCreateThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyCreateThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Declines invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeclineInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDeclineInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeclineInvitationsRequest
 @see AWSGuarddutyDeclineInvitationsResponse
 */
- (AWSTask<AWSGuarddutyDeclineInvitationsResponse *> *)declineInvitations:(AWSGuarddutyDeclineInvitationsRequest *)request;

/**
 <p>Declines invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeclineInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeclineInvitationsRequest
 @see AWSGuarddutyDeclineInvitationsResponse
 */
- (void)declineInvitations:(AWSGuarddutyDeclineInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDeclineInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon GuardDuty detector that is specified by the detector ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDeleteDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteDetectorRequest
 @see AWSGuarddutyDeleteDetectorResponse
 */
- (AWSTask<AWSGuarddutyDeleteDetectorResponse *> *)deleteDetector:(AWSGuarddutyDeleteDetectorRequest *)request;

/**
 <p>Deletes an Amazon GuardDuty detector that is specified by the detector ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteDetectorRequest
 @see AWSGuarddutyDeleteDetectorResponse
 */
- (void)deleteDetector:(AWSGuarddutyDeleteDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDeleteDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDeleteFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteFilterRequest
 @see AWSGuarddutyDeleteFilterResponse
 */
- (AWSTask<AWSGuarddutyDeleteFilterResponse *> *)deleteFilter:(AWSGuarddutyDeleteFilterRequest *)request;

/**
 <p>Deletes the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteFilterRequest
 @see AWSGuarddutyDeleteFilterResponse
 */
- (void)deleteFilter:(AWSGuarddutyDeleteFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDeleteFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the IPSet specified by the <code>ipSetId</code>. IPSets are called trusted IP lists in the console user interface.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDeleteIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteIPSetRequest
 @see AWSGuarddutyDeleteIPSetResponse
 */
- (AWSTask<AWSGuarddutyDeleteIPSetResponse *> *)deleteIPSet:(AWSGuarddutyDeleteIPSetRequest *)request;

/**
 <p>Deletes the IPSet specified by the <code>ipSetId</code>. IPSets are called trusted IP lists in the console user interface.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteIPSetRequest
 @see AWSGuarddutyDeleteIPSetResponse
 */
- (void)deleteIPSet:(AWSGuarddutyDeleteIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDeleteIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDeleteInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteInvitationsRequest
 @see AWSGuarddutyDeleteInvitationsResponse
 */
- (AWSTask<AWSGuarddutyDeleteInvitationsResponse *> *)deleteInvitations:(AWSGuarddutyDeleteInvitationsRequest *)request;

/**
 <p>Deletes invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteInvitationsRequest
 @see AWSGuarddutyDeleteInvitationsResponse
 */
- (void)deleteInvitations:(AWSGuarddutyDeleteInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDeleteInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDeleteMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteMembersRequest
 @see AWSGuarddutyDeleteMembersResponse
 */
- (AWSTask<AWSGuarddutyDeleteMembersResponse *> *)deleteMembers:(AWSGuarddutyDeleteMembersRequest *)request;

/**
 <p>Deletes GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteMembersRequest
 @see AWSGuarddutyDeleteMembersResponse
 */
- (void)deleteMembers:(AWSGuarddutyDeleteMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDeleteMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the publishing definition with the specified <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDeletePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeletePublishingDestinationRequest
 @see AWSGuarddutyDeletePublishingDestinationResponse
 */
- (AWSTask<AWSGuarddutyDeletePublishingDestinationResponse *> *)deletePublishingDestination:(AWSGuarddutyDeletePublishingDestinationRequest *)request;

/**
 <p>Deletes the publishing definition with the specified <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeletePublishingDestinationRequest
 @see AWSGuarddutyDeletePublishingDestinationResponse
 */
- (void)deletePublishingDestination:(AWSGuarddutyDeletePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDeletePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDeleteThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteThreatIntelSetRequest
 @see AWSGuarddutyDeleteThreatIntelSetResponse
 */
- (AWSTask<AWSGuarddutyDeleteThreatIntelSetResponse *> *)deleteThreatIntelSet:(AWSGuarddutyDeleteThreatIntelSetRequest *)request;

/**
 <p>Deletes the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDeleteThreatIntelSetRequest
 @see AWSGuarddutyDeleteThreatIntelSetResponse
 */
- (void)deleteThreatIntelSet:(AWSGuarddutyDeleteThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDeleteThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the account selected as the delegated administrator for GuardDuty.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrganizationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDescribeOrganizationConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDescribeOrganizationConfigurationRequest
 @see AWSGuarddutyDescribeOrganizationConfigurationResponse
 */
- (AWSTask<AWSGuarddutyDescribeOrganizationConfigurationResponse *> *)describeOrganizationConfiguration:(AWSGuarddutyDescribeOrganizationConfigurationRequest *)request;

/**
 <p>Returns information about the account selected as the delegated administrator for GuardDuty.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrganizationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDescribeOrganizationConfigurationRequest
 @see AWSGuarddutyDescribeOrganizationConfigurationResponse
 */
- (void)describeOrganizationConfiguration:(AWSGuarddutyDescribeOrganizationConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDescribeOrganizationConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the publishing destination specified by the provided <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDescribePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDescribePublishingDestinationRequest
 @see AWSGuarddutyDescribePublishingDestinationResponse
 */
- (AWSTask<AWSGuarddutyDescribePublishingDestinationResponse *> *)describePublishingDestination:(AWSGuarddutyDescribePublishingDestinationRequest *)request;

/**
 <p>Returns information about the publishing destination specified by the provided <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDescribePublishingDestinationRequest
 @see AWSGuarddutyDescribePublishingDestinationResponse
 */
- (void)describePublishingDestination:(AWSGuarddutyDescribePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDescribePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables an AWS account within the Organization as the GuardDuty delegated administrator.</p>
 
 @param request A container for the necessary parameters to execute the DisableOrganizationAdminAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDisableOrganizationAdminAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDisableOrganizationAdminAccountRequest
 @see AWSGuarddutyDisableOrganizationAdminAccountResponse
 */
- (AWSTask<AWSGuarddutyDisableOrganizationAdminAccountResponse *> *)disableOrganizationAdminAccount:(AWSGuarddutyDisableOrganizationAdminAccountRequest *)request;

/**
 <p>Disables an AWS account within the Organization as the GuardDuty delegated administrator.</p>
 
 @param request A container for the necessary parameters to execute the DisableOrganizationAdminAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDisableOrganizationAdminAccountRequest
 @see AWSGuarddutyDisableOrganizationAdminAccountResponse
 */
- (void)disableOrganizationAdminAccount:(AWSGuarddutyDisableOrganizationAdminAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDisableOrganizationAdminAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the current GuardDuty member account from its master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFromMasterAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDisassociateFromMasterAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDisassociateFromMasterAccountRequest
 @see AWSGuarddutyDisassociateFromMasterAccountResponse
 */
- (AWSTask<AWSGuarddutyDisassociateFromMasterAccountResponse *> *)disassociateFromMasterAccount:(AWSGuarddutyDisassociateFromMasterAccountRequest *)request;

/**
 <p>Disassociates the current GuardDuty member account from its master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFromMasterAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDisassociateFromMasterAccountRequest
 @see AWSGuarddutyDisassociateFromMasterAccountResponse
 */
- (void)disassociateFromMasterAccount:(AWSGuarddutyDisassociateFromMasterAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDisassociateFromMasterAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyDisassociateMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDisassociateMembersRequest
 @see AWSGuarddutyDisassociateMembersResponse
 */
- (AWSTask<AWSGuarddutyDisassociateMembersResponse *> *)disassociateMembers:(AWSGuarddutyDisassociateMembersRequest *)request;

/**
 <p>Disassociates GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyDisassociateMembersRequest
 @see AWSGuarddutyDisassociateMembersResponse
 */
- (void)disassociateMembers:(AWSGuarddutyDisassociateMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyDisassociateMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables an AWS account within the organization as the GuardDuty delegated administrator.</p>
 
 @param request A container for the necessary parameters to execute the EnableOrganizationAdminAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyEnableOrganizationAdminAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyEnableOrganizationAdminAccountRequest
 @see AWSGuarddutyEnableOrganizationAdminAccountResponse
 */
- (AWSTask<AWSGuarddutyEnableOrganizationAdminAccountResponse *> *)enableOrganizationAdminAccount:(AWSGuarddutyEnableOrganizationAdminAccountRequest *)request;

/**
 <p>Enables an AWS account within the organization as the GuardDuty delegated administrator.</p>
 
 @param request A container for the necessary parameters to execute the EnableOrganizationAdminAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyEnableOrganizationAdminAccountRequest
 @see AWSGuarddutyEnableOrganizationAdminAccountResponse
 */
- (void)enableOrganizationAdminAccount:(AWSGuarddutyEnableOrganizationAdminAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyEnableOrganizationAdminAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves an Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the GetDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyGetDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetDetectorRequest
 @see AWSGuarddutyGetDetectorResponse
 */
- (AWSTask<AWSGuarddutyGetDetectorResponse *> *)getDetector:(AWSGuarddutyGetDetectorRequest *)request;

/**
 <p>Retrieves an Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the GetDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetDetectorRequest
 @see AWSGuarddutyGetDetectorResponse
 */
- (void)getDetector:(AWSGuarddutyGetDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyGetDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the details of the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the GetFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyGetFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetFilterRequest
 @see AWSGuarddutyGetFilterResponse
 */
- (AWSTask<AWSGuarddutyGetFilterResponse *> *)getFilter:(AWSGuarddutyGetFilterRequest *)request;

/**
 <p>Returns the details of the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the GetFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetFilterRequest
 @see AWSGuarddutyGetFilterResponse
 */
- (void)getFilter:(AWSGuarddutyGetFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyGetFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes Amazon GuardDuty findings specified by finding IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyGetFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetFindingsRequest
 @see AWSGuarddutyGetFindingsResponse
 */
- (AWSTask<AWSGuarddutyGetFindingsResponse *> *)getFindings:(AWSGuarddutyGetFindingsRequest *)request;

/**
 <p>Describes Amazon GuardDuty findings specified by finding IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetFindingsRequest
 @see AWSGuarddutyGetFindingsResponse
 */
- (void)getFindings:(AWSGuarddutyGetFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyGetFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists Amazon GuardDuty findings statistics for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the GetFindingsStatistics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyGetFindingsStatisticsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetFindingsStatisticsRequest
 @see AWSGuarddutyGetFindingsStatisticsResponse
 */
- (AWSTask<AWSGuarddutyGetFindingsStatisticsResponse *> *)getFindingsStatistics:(AWSGuarddutyGetFindingsStatisticsRequest *)request;

/**
 <p>Lists Amazon GuardDuty findings statistics for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the GetFindingsStatistics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetFindingsStatisticsRequest
 @see AWSGuarddutyGetFindingsStatisticsResponse
 */
- (void)getFindingsStatistics:(AWSGuarddutyGetFindingsStatisticsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyGetFindingsStatisticsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the IPSet specified by the <code>ipSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyGetIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetIPSetRequest
 @see AWSGuarddutyGetIPSetResponse
 */
- (AWSTask<AWSGuarddutyGetIPSetResponse *> *)getIPSet:(AWSGuarddutyGetIPSetRequest *)request;

/**
 <p>Retrieves the IPSet specified by the <code>ipSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetIPSetRequest
 @see AWSGuarddutyGetIPSetResponse
 */
- (void)getIPSet:(AWSGuarddutyGetIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyGetIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the count of all GuardDuty membership invitations that were sent to the current member account except the currently accepted invitation.</p>
 
 @param request A container for the necessary parameters to execute the GetInvitationsCount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyGetInvitationsCountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetInvitationsCountRequest
 @see AWSGuarddutyGetInvitationsCountResponse
 */
- (AWSTask<AWSGuarddutyGetInvitationsCountResponse *> *)getInvitationsCount:(AWSGuarddutyGetInvitationsCountRequest *)request;

/**
 <p>Returns the count of all GuardDuty membership invitations that were sent to the current member account except the currently accepted invitation.</p>
 
 @param request A container for the necessary parameters to execute the GetInvitationsCount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetInvitationsCountRequest
 @see AWSGuarddutyGetInvitationsCountResponse
 */
- (void)getInvitationsCount:(AWSGuarddutyGetInvitationsCountRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyGetInvitationsCountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the details for the GuardDuty master account associated with the current GuardDuty member account.</p>
 
 @param request A container for the necessary parameters to execute the GetMasterAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyGetMasterAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetMasterAccountRequest
 @see AWSGuarddutyGetMasterAccountResponse
 */
- (AWSTask<AWSGuarddutyGetMasterAccountResponse *> *)getMasterAccount:(AWSGuarddutyGetMasterAccountRequest *)request;

/**
 <p>Provides the details for the GuardDuty master account associated with the current GuardDuty member account.</p>
 
 @param request A container for the necessary parameters to execute the GetMasterAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetMasterAccountRequest
 @see AWSGuarddutyGetMasterAccountResponse
 */
- (void)getMasterAccount:(AWSGuarddutyGetMasterAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyGetMasterAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyGetMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetMembersRequest
 @see AWSGuarddutyGetMembersResponse
 */
- (AWSTask<AWSGuarddutyGetMembersResponse *> *)getMembers:(AWSGuarddutyGetMembersRequest *)request;

/**
 <p>Retrieves GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetMembersRequest
 @see AWSGuarddutyGetMembersResponse
 */
- (void)getMembers:(AWSGuarddutyGetMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyGetMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the ThreatIntelSet that is specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the GetThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyGetThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetThreatIntelSetRequest
 @see AWSGuarddutyGetThreatIntelSetResponse
 */
- (AWSTask<AWSGuarddutyGetThreatIntelSetResponse *> *)getThreatIntelSet:(AWSGuarddutyGetThreatIntelSetRequest *)request;

/**
 <p>Retrieves the ThreatIntelSet that is specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the GetThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyGetThreatIntelSetRequest
 @see AWSGuarddutyGetThreatIntelSetResponse
 */
- (void)getThreatIntelSet:(AWSGuarddutyGetThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyGetThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Invites other AWS accounts (created as members of the current AWS account by CreateMembers) to enable GuardDuty, and allow the current AWS account to view and manage these accounts' GuardDuty findings on their behalf as the master account.</p>
 
 @param request A container for the necessary parameters to execute the InviteMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyInviteMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyInviteMembersRequest
 @see AWSGuarddutyInviteMembersResponse
 */
- (AWSTask<AWSGuarddutyInviteMembersResponse *> *)inviteMembers:(AWSGuarddutyInviteMembersRequest *)request;

/**
 <p>Invites other AWS accounts (created as members of the current AWS account by CreateMembers) to enable GuardDuty, and allow the current AWS account to view and manage these accounts' GuardDuty findings on their behalf as the master account.</p>
 
 @param request A container for the necessary parameters to execute the InviteMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyInviteMembersRequest
 @see AWSGuarddutyInviteMembersResponse
 */
- (void)inviteMembers:(AWSGuarddutyInviteMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyInviteMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists detectorIds of all the existing Amazon GuardDuty detector resources.</p>
 
 @param request A container for the necessary parameters to execute the ListDetectors service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyListDetectorsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListDetectorsRequest
 @see AWSGuarddutyListDetectorsResponse
 */
- (AWSTask<AWSGuarddutyListDetectorsResponse *> *)listDetectors:(AWSGuarddutyListDetectorsRequest *)request;

/**
 <p>Lists detectorIds of all the existing Amazon GuardDuty detector resources.</p>
 
 @param request A container for the necessary parameters to execute the ListDetectors service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListDetectorsRequest
 @see AWSGuarddutyListDetectorsResponse
 */
- (void)listDetectors:(AWSGuarddutyListDetectorsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyListDetectorsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a paginated list of the current filters.</p>
 
 @param request A container for the necessary parameters to execute the ListFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyListFiltersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListFiltersRequest
 @see AWSGuarddutyListFiltersResponse
 */
- (AWSTask<AWSGuarddutyListFiltersResponse *> *)listFilters:(AWSGuarddutyListFiltersRequest *)request;

/**
 <p>Returns a paginated list of the current filters.</p>
 
 @param request A container for the necessary parameters to execute the ListFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListFiltersRequest
 @see AWSGuarddutyListFiltersResponse
 */
- (void)listFilters:(AWSGuarddutyListFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyListFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists Amazon GuardDuty findings for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the ListFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyListFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListFindingsRequest
 @see AWSGuarddutyListFindingsResponse
 */
- (AWSTask<AWSGuarddutyListFindingsResponse *> *)listFindings:(AWSGuarddutyListFindingsRequest *)request;

/**
 <p>Lists Amazon GuardDuty findings for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the ListFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListFindingsRequest
 @see AWSGuarddutyListFindingsResponse
 */
- (void)listFindings:(AWSGuarddutyListFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyListFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the IPSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the IPSets returned are the IPSets from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the ListIPSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyListIPSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListIPSetsRequest
 @see AWSGuarddutyListIPSetsResponse
 */
- (AWSTask<AWSGuarddutyListIPSetsResponse *> *)listIPSets:(AWSGuarddutyListIPSetsRequest *)request;

/**
 <p>Lists the IPSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the IPSets returned are the IPSets from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the ListIPSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListIPSetsRequest
 @see AWSGuarddutyListIPSetsResponse
 */
- (void)listIPSets:(AWSGuarddutyListIPSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyListIPSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all GuardDuty membership invitations that were sent to the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyListInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListInvitationsRequest
 @see AWSGuarddutyListInvitationsResponse
 */
- (AWSTask<AWSGuarddutyListInvitationsResponse *> *)listInvitations:(AWSGuarddutyListInvitationsRequest *)request;

/**
 <p>Lists all GuardDuty membership invitations that were sent to the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListInvitationsRequest
 @see AWSGuarddutyListInvitationsResponse
 */
- (void)listInvitations:(AWSGuarddutyListInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyListInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists details about all member accounts for the current GuardDuty master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyListMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListMembersRequest
 @see AWSGuarddutyListMembersResponse
 */
- (AWSTask<AWSGuarddutyListMembersResponse *> *)listMembers:(AWSGuarddutyListMembersRequest *)request;

/**
 <p>Lists details about all member accounts for the current GuardDuty master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListMembersRequest
 @see AWSGuarddutyListMembersResponse
 */
- (void)listMembers:(AWSGuarddutyListMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyListMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the accounts configured as GuardDuty delegated administrators.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizationAdminAccounts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyListOrganizationAdminAccountsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListOrganizationAdminAccountsRequest
 @see AWSGuarddutyListOrganizationAdminAccountsResponse
 */
- (AWSTask<AWSGuarddutyListOrganizationAdminAccountsResponse *> *)listOrganizationAdminAccounts:(AWSGuarddutyListOrganizationAdminAccountsRequest *)request;

/**
 <p>Lists the accounts configured as GuardDuty delegated administrators.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizationAdminAccounts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListOrganizationAdminAccountsRequest
 @see AWSGuarddutyListOrganizationAdminAccountsResponse
 */
- (void)listOrganizationAdminAccounts:(AWSGuarddutyListOrganizationAdminAccountsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyListOrganizationAdminAccountsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of publishing destinations associated with the specified <code>dectectorId</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListPublishingDestinations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyListPublishingDestinationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListPublishingDestinationsRequest
 @see AWSGuarddutyListPublishingDestinationsResponse
 */
- (AWSTask<AWSGuarddutyListPublishingDestinationsResponse *> *)listPublishingDestinations:(AWSGuarddutyListPublishingDestinationsRequest *)request;

/**
 <p>Returns a list of publishing destinations associated with the specified <code>dectectorId</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListPublishingDestinations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListPublishingDestinationsRequest
 @see AWSGuarddutyListPublishingDestinationsResponse
 */
- (void)listPublishingDestinations:(AWSGuarddutyListPublishingDestinationsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyListPublishingDestinationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists tags for a resource. Tagging is currently supported for detectors, finding filters, IP sets, and threat intel sets, with a limit of 50 tags per resource. When invoked, this operation returns all assigned tags for a given resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListTagsForResourceRequest
 @see AWSGuarddutyListTagsForResourceResponse
 */
- (AWSTask<AWSGuarddutyListTagsForResourceResponse *> *)listTagsForResource:(AWSGuarddutyListTagsForResourceRequest *)request;

/**
 <p>Lists tags for a resource. Tagging is currently supported for detectors, finding filters, IP sets, and threat intel sets, with a limit of 50 tags per resource. When invoked, this operation returns all assigned tags for a given resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListTagsForResourceRequest
 @see AWSGuarddutyListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSGuarddutyListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the ThreatIntelSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the ThreatIntelSets associated with the master account are returned.</p>
 
 @param request A container for the necessary parameters to execute the ListThreatIntelSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyListThreatIntelSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListThreatIntelSetsRequest
 @see AWSGuarddutyListThreatIntelSetsResponse
 */
- (AWSTask<AWSGuarddutyListThreatIntelSetsResponse *> *)listThreatIntelSets:(AWSGuarddutyListThreatIntelSetsRequest *)request;

/**
 <p>Lists the ThreatIntelSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the ThreatIntelSets associated with the master account are returned.</p>
 
 @param request A container for the necessary parameters to execute the ListThreatIntelSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyListThreatIntelSetsRequest
 @see AWSGuarddutyListThreatIntelSetsResponse
 */
- (void)listThreatIntelSets:(AWSGuarddutyListThreatIntelSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyListThreatIntelSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Turns on GuardDuty monitoring of the specified member accounts. Use this operation to restart monitoring of accounts that you stopped monitoring with the <code>StopMonitoringMembers</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the StartMonitoringMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyStartMonitoringMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyStartMonitoringMembersRequest
 @see AWSGuarddutyStartMonitoringMembersResponse
 */
- (AWSTask<AWSGuarddutyStartMonitoringMembersResponse *> *)startMonitoringMembers:(AWSGuarddutyStartMonitoringMembersRequest *)request;

/**
 <p>Turns on GuardDuty monitoring of the specified member accounts. Use this operation to restart monitoring of accounts that you stopped monitoring with the <code>StopMonitoringMembers</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the StartMonitoringMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyStartMonitoringMembersRequest
 @see AWSGuarddutyStartMonitoringMembersResponse
 */
- (void)startMonitoringMembers:(AWSGuarddutyStartMonitoringMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyStartMonitoringMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops GuardDuty monitoring for the specified member accounts. Use the <code>StartMonitoringMembers</code> operation to restart monitoring for those accounts.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyStopMonitoringMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyStopMonitoringMembersRequest
 @see AWSGuarddutyStopMonitoringMembersResponse
 */
- (AWSTask<AWSGuarddutyStopMonitoringMembersResponse *> *)stopMonitoringMembers:(AWSGuarddutyStopMonitoringMembersRequest *)request;

/**
 <p>Stops GuardDuty monitoring for the specified member accounts. Use the <code>StartMonitoringMembers</code> operation to restart monitoring for those accounts.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyStopMonitoringMembersRequest
 @see AWSGuarddutyStopMonitoringMembersResponse
 */
- (void)stopMonitoringMembers:(AWSGuarddutyStopMonitoringMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyStopMonitoringMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyTagResourceRequest
 @see AWSGuarddutyTagResourceResponse
 */
- (AWSTask<AWSGuarddutyTagResourceResponse *> *)tagResource:(AWSGuarddutyTagResourceRequest *)request;

/**
 <p>Adds tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyTagResourceRequest
 @see AWSGuarddutyTagResourceResponse
 */
- (void)tagResource:(AWSGuarddutyTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Unarchives GuardDuty findings specified by the <code>findingIds</code>.</p>
 
 @param request A container for the necessary parameters to execute the UnarchiveFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyUnarchiveFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUnarchiveFindingsRequest
 @see AWSGuarddutyUnarchiveFindingsResponse
 */
- (AWSTask<AWSGuarddutyUnarchiveFindingsResponse *> *)unarchiveFindings:(AWSGuarddutyUnarchiveFindingsRequest *)request;

/**
 <p>Unarchives GuardDuty findings specified by the <code>findingIds</code>.</p>
 
 @param request A container for the necessary parameters to execute the UnarchiveFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUnarchiveFindingsRequest
 @see AWSGuarddutyUnarchiveFindingsResponse
 */
- (void)unarchiveFindings:(AWSGuarddutyUnarchiveFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyUnarchiveFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUntagResourceRequest
 @see AWSGuarddutyUntagResourceResponse
 */
- (AWSTask<AWSGuarddutyUntagResourceResponse *> *)untagResource:(AWSGuarddutyUntagResourceRequest *)request;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUntagResourceRequest
 @see AWSGuarddutyUntagResourceResponse
 */
- (void)untagResource:(AWSGuarddutyUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyUpdateDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateDetectorRequest
 @see AWSGuarddutyUpdateDetectorResponse
 */
- (AWSTask<AWSGuarddutyUpdateDetectorResponse *> *)updateDetector:(AWSGuarddutyUpdateDetectorRequest *)request;

/**
 <p>Updates the Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateDetectorRequest
 @see AWSGuarddutyUpdateDetectorResponse
 */
- (void)updateDetector:(AWSGuarddutyUpdateDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyUpdateDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyUpdateFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateFilterRequest
 @see AWSGuarddutyUpdateFilterResponse
 */
- (AWSTask<AWSGuarddutyUpdateFilterResponse *> *)updateFilter:(AWSGuarddutyUpdateFilterRequest *)request;

/**
 <p>Updates the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateFilterRequest
 @see AWSGuarddutyUpdateFilterResponse
 */
- (void)updateFilter:(AWSGuarddutyUpdateFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyUpdateFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Marks the specified GuardDuty findings as useful or not useful.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindingsFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyUpdateFindingsFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateFindingsFeedbackRequest
 @see AWSGuarddutyUpdateFindingsFeedbackResponse
 */
- (AWSTask<AWSGuarddutyUpdateFindingsFeedbackResponse *> *)updateFindingsFeedback:(AWSGuarddutyUpdateFindingsFeedbackRequest *)request;

/**
 <p>Marks the specified GuardDuty findings as useful or not useful.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindingsFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateFindingsFeedbackRequest
 @see AWSGuarddutyUpdateFindingsFeedbackResponse
 */
- (void)updateFindingsFeedback:(AWSGuarddutyUpdateFindingsFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyUpdateFindingsFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the IPSet specified by the IPSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyUpdateIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateIPSetRequest
 @see AWSGuarddutyUpdateIPSetResponse
 */
- (AWSTask<AWSGuarddutyUpdateIPSetResponse *> *)updateIPSet:(AWSGuarddutyUpdateIPSetRequest *)request;

/**
 <p>Updates the IPSet specified by the IPSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateIPSetRequest
 @see AWSGuarddutyUpdateIPSetResponse
 */
- (void)updateIPSet:(AWSGuarddutyUpdateIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyUpdateIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the delegated administrator account with the values provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateOrganizationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyUpdateOrganizationConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateOrganizationConfigurationRequest
 @see AWSGuarddutyUpdateOrganizationConfigurationResponse
 */
- (AWSTask<AWSGuarddutyUpdateOrganizationConfigurationResponse *> *)updateOrganizationConfiguration:(AWSGuarddutyUpdateOrganizationConfigurationRequest *)request;

/**
 <p>Updates the delegated administrator account with the values provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateOrganizationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateOrganizationConfigurationRequest
 @see AWSGuarddutyUpdateOrganizationConfigurationResponse
 */
- (void)updateOrganizationConfiguration:(AWSGuarddutyUpdateOrganizationConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyUpdateOrganizationConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates information about the publishing destination specified by the <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyUpdatePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdatePublishingDestinationRequest
 @see AWSGuarddutyUpdatePublishingDestinationResponse
 */
- (AWSTask<AWSGuarddutyUpdatePublishingDestinationResponse *> *)updatePublishingDestination:(AWSGuarddutyUpdatePublishingDestinationRequest *)request;

/**
 <p>Updates information about the publishing destination specified by the <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdatePublishingDestinationRequest
 @see AWSGuarddutyUpdatePublishingDestinationResponse
 */
- (void)updatePublishingDestination:(AWSGuarddutyUpdatePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyUpdatePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuarddutyUpdateThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateThreatIntelSetRequest
 @see AWSGuarddutyUpdateThreatIntelSetResponse
 */
- (AWSTask<AWSGuarddutyUpdateThreatIntelSetResponse *> *)updateThreatIntelSet:(AWSGuarddutyUpdateThreatIntelSetRequest *)request;

/**
 <p>Updates the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuarddutyErrorDomain` domain and the following error code: `AWSGuarddutyErrorBadRequest`, `AWSGuarddutyErrorInternalServerError`.
 
 @see AWSGuarddutyUpdateThreatIntelSetRequest
 @see AWSGuarddutyUpdateThreatIntelSetResponse
 */
- (void)updateThreatIntelSet:(AWSGuarddutyUpdateThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuarddutyUpdateThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
