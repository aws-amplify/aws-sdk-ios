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
#import "AWSGuardDutyModel.h"
#import "AWSGuardDutyResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSGuardDuty
FOUNDATION_EXPORT NSString *const AWSGuardDutySDKVersion;

/**
 <p>Amazon GuardDuty is a continuous security monitoring service that analyzes and processes the following data sources: VPC Flow Logs, AWS CloudTrail event logs, and DNS logs. It uses threat intelligence feeds (such as lists of malicious IPs and domains) and machine learning to identify unexpected, potentially unauthorized, and malicious activity within your AWS environment. This can include issues like escalations of privileges, uses of exposed credentials, or communication with malicious IPs, URLs, or domains. For example, GuardDuty can detect compromised EC2 instances that serve malware or mine bitcoin. </p><p>GuardDuty also monitors AWS account access behavior for signs of compromise. Some examples of this are unauthorized infrastructure deployments such as EC2 instances deployed in a Region that has never been used, or unusual API calls like a password policy change to reduce password strength. </p><p>GuardDuty informs you of the status of your AWS environment by producing security findings that you can view in the GuardDuty console or through Amazon CloudWatch events. For more information, see the <i><a href="https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html">Amazon GuardDuty User Guide</a></i>. </p>
 */
@interface AWSGuardDuty : AWSService

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

     let GuardDuty = AWSGuardDuty.default()

 *Objective-C*

     AWSGuardDuty *GuardDuty = [AWSGuardDuty defaultGuardDuty];

 @return The default service client.
 */
+ (instancetype)defaultGuardDuty;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSGuardDuty.register(with: configuration!, forKey: "USWest2GuardDuty")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:@"USWest2GuardDuty"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let GuardDuty = AWSGuardDuty(forKey: "USWest2GuardDuty")

 *Objective-C*

     AWSGuardDuty *GuardDuty = [AWSGuardDuty GuardDutyForKey:@"USWest2GuardDuty"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerGuardDutyWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerGuardDutyWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSGuardDuty.register(with: configuration!, forKey: "USWest2GuardDuty")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:@"USWest2GuardDuty"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let GuardDuty = AWSGuardDuty(forKey: "USWest2GuardDuty")

 *Objective-C*

     AWSGuardDuty *GuardDuty = [AWSGuardDuty GuardDutyForKey:@"USWest2GuardDuty"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)GuardDutyForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeGuardDutyForKey:(NSString *)key;

/**
 <p>Accepts the invitation to be monitored by a master GuardDuty account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInvitation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyAcceptInvitationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyAcceptInvitationRequest
 @see AWSGuardDutyAcceptInvitationResponse
 */
- (AWSTask<AWSGuardDutyAcceptInvitationResponse *> *)acceptInvitation:(AWSGuardDutyAcceptInvitationRequest *)request;

/**
 <p>Accepts the invitation to be monitored by a master GuardDuty account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInvitation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyAcceptInvitationRequest
 @see AWSGuardDutyAcceptInvitationResponse
 */
- (void)acceptInvitation:(AWSGuardDutyAcceptInvitationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyAcceptInvitationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Archives GuardDuty findings that are specified by the list of finding IDs.</p><note><p>Only the master account can archive findings. Member accounts don't have permission to archive findings from their accounts.</p></note>
 
 @param request A container for the necessary parameters to execute the ArchiveFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyArchiveFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyArchiveFindingsRequest
 @see AWSGuardDutyArchiveFindingsResponse
 */
- (AWSTask<AWSGuardDutyArchiveFindingsResponse *> *)archiveFindings:(AWSGuardDutyArchiveFindingsRequest *)request;

/**
 <p>Archives GuardDuty findings that are specified by the list of finding IDs.</p><note><p>Only the master account can archive findings. Member accounts don't have permission to archive findings from their accounts.</p></note>
 
 @param request A container for the necessary parameters to execute the ArchiveFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyArchiveFindingsRequest
 @see AWSGuardDutyArchiveFindingsResponse
 */
- (void)archiveFindings:(AWSGuardDutyArchiveFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyArchiveFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a single Amazon GuardDuty detector. A detector is a resource that represents the GuardDuty service. To start using GuardDuty, you must create a detector in each Region where you enable the service. You can have only one detector per account per Region.</p>
 
 @param request A container for the necessary parameters to execute the CreateDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyCreateDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateDetectorRequest
 @see AWSGuardDutyCreateDetectorResponse
 */
- (AWSTask<AWSGuardDutyCreateDetectorResponse *> *)createDetector:(AWSGuardDutyCreateDetectorRequest *)request;

/**
 <p>Creates a single Amazon GuardDuty detector. A detector is a resource that represents the GuardDuty service. To start using GuardDuty, you must create a detector in each Region where you enable the service. You can have only one detector per account per Region.</p>
 
 @param request A container for the necessary parameters to execute the CreateDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateDetectorRequest
 @see AWSGuardDutyCreateDetectorResponse
 */
- (void)createDetector:(AWSGuardDutyCreateDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyCreateDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a filter using the specified finding criteria.</p>
 
 @param request A container for the necessary parameters to execute the CreateFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyCreateFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateFilterRequest
 @see AWSGuardDutyCreateFilterResponse
 */
- (AWSTask<AWSGuardDutyCreateFilterResponse *> *)createFilter:(AWSGuardDutyCreateFilterRequest *)request;

/**
 <p>Creates a filter using the specified finding criteria.</p>
 
 @param request A container for the necessary parameters to execute the CreateFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateFilterRequest
 @see AWSGuardDutyCreateFilterResponse
 */
- (void)createFilter:(AWSGuardDutyCreateFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyCreateFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new IPSet, which is called a trusted IP list in the console user interface. An IPSet is a list of IP addresses that are trusted for secure communication with AWS infrastructure and applications. GuardDuty doesn't generate findings for IP addresses that are included in IPSets. Only users from the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyCreateIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateIPSetRequest
 @see AWSGuardDutyCreateIPSetResponse
 */
- (AWSTask<AWSGuardDutyCreateIPSetResponse *> *)createIPSet:(AWSGuardDutyCreateIPSetRequest *)request;

/**
 <p>Creates a new IPSet, which is called a trusted IP list in the console user interface. An IPSet is a list of IP addresses that are trusted for secure communication with AWS infrastructure and applications. GuardDuty doesn't generate findings for IP addresses that are included in IPSets. Only users from the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateIPSetRequest
 @see AWSGuardDutyCreateIPSetResponse
 */
- (void)createIPSet:(AWSGuardDutyCreateIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyCreateIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates member accounts of the current AWS account by specifying a list of AWS account IDs. The current AWS account can then invite these members to manage GuardDuty in their accounts.</p>
 
 @param request A container for the necessary parameters to execute the CreateMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyCreateMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateMembersRequest
 @see AWSGuardDutyCreateMembersResponse
 */
- (AWSTask<AWSGuardDutyCreateMembersResponse *> *)createMembers:(AWSGuardDutyCreateMembersRequest *)request;

/**
 <p>Creates member accounts of the current AWS account by specifying a list of AWS account IDs. The current AWS account can then invite these members to manage GuardDuty in their accounts.</p>
 
 @param request A container for the necessary parameters to execute the CreateMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateMembersRequest
 @see AWSGuardDutyCreateMembersResponse
 */
- (void)createMembers:(AWSGuardDutyCreateMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyCreateMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a publishing destination to export findings to. The resource to export findings to must exist before you use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyCreatePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreatePublishingDestinationRequest
 @see AWSGuardDutyCreatePublishingDestinationResponse
 */
- (AWSTask<AWSGuardDutyCreatePublishingDestinationResponse *> *)createPublishingDestination:(AWSGuardDutyCreatePublishingDestinationRequest *)request;

/**
 <p>Creates a publishing destination to export findings to. The resource to export findings to must exist before you use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreatePublishingDestinationRequest
 @see AWSGuardDutyCreatePublishingDestinationResponse
 */
- (void)createPublishingDestination:(AWSGuardDutyCreatePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyCreatePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates example findings of types specified by the list of finding types. If 'NULL' is specified for <code>findingTypes</code>, the API generates example findings of all supported finding types.</p>
 
 @param request A container for the necessary parameters to execute the CreateSampleFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyCreateSampleFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateSampleFindingsRequest
 @see AWSGuardDutyCreateSampleFindingsResponse
 */
- (AWSTask<AWSGuardDutyCreateSampleFindingsResponse *> *)createSampleFindings:(AWSGuardDutyCreateSampleFindingsRequest *)request;

/**
 <p>Generates example findings of types specified by the list of finding types. If 'NULL' is specified for <code>findingTypes</code>, the API generates example findings of all supported finding types.</p>
 
 @param request A container for the necessary parameters to execute the CreateSampleFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateSampleFindingsRequest
 @see AWSGuardDutyCreateSampleFindingsResponse
 */
- (void)createSampleFindings:(AWSGuardDutyCreateSampleFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyCreateSampleFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new ThreatIntelSet. ThreatIntelSets consist of known malicious IP addresses. GuardDuty generates findings based on ThreatIntelSets. Only users of the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyCreateThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateThreatIntelSetRequest
 @see AWSGuardDutyCreateThreatIntelSetResponse
 */
- (AWSTask<AWSGuardDutyCreateThreatIntelSetResponse *> *)createThreatIntelSet:(AWSGuardDutyCreateThreatIntelSetRequest *)request;

/**
 <p>Creates a new ThreatIntelSet. ThreatIntelSets consist of known malicious IP addresses. GuardDuty generates findings based on ThreatIntelSets. Only users of the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyCreateThreatIntelSetRequest
 @see AWSGuardDutyCreateThreatIntelSetResponse
 */
- (void)createThreatIntelSet:(AWSGuardDutyCreateThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyCreateThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Declines invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeclineInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDeclineInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeclineInvitationsRequest
 @see AWSGuardDutyDeclineInvitationsResponse
 */
- (AWSTask<AWSGuardDutyDeclineInvitationsResponse *> *)declineInvitations:(AWSGuardDutyDeclineInvitationsRequest *)request;

/**
 <p>Declines invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeclineInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeclineInvitationsRequest
 @see AWSGuardDutyDeclineInvitationsResponse
 */
- (void)declineInvitations:(AWSGuardDutyDeclineInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDeclineInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon GuardDuty detector that is specified by the detector ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDeleteDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteDetectorRequest
 @see AWSGuardDutyDeleteDetectorResponse
 */
- (AWSTask<AWSGuardDutyDeleteDetectorResponse *> *)deleteDetector:(AWSGuardDutyDeleteDetectorRequest *)request;

/**
 <p>Deletes an Amazon GuardDuty detector that is specified by the detector ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteDetectorRequest
 @see AWSGuardDutyDeleteDetectorResponse
 */
- (void)deleteDetector:(AWSGuardDutyDeleteDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDeleteDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDeleteFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteFilterRequest
 @see AWSGuardDutyDeleteFilterResponse
 */
- (AWSTask<AWSGuardDutyDeleteFilterResponse *> *)deleteFilter:(AWSGuardDutyDeleteFilterRequest *)request;

/**
 <p>Deletes the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteFilterRequest
 @see AWSGuardDutyDeleteFilterResponse
 */
- (void)deleteFilter:(AWSGuardDutyDeleteFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDeleteFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the IPSet specified by the <code>ipSetId</code>. IPSets are called trusted IP lists in the console user interface.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDeleteIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteIPSetRequest
 @see AWSGuardDutyDeleteIPSetResponse
 */
- (AWSTask<AWSGuardDutyDeleteIPSetResponse *> *)deleteIPSet:(AWSGuardDutyDeleteIPSetRequest *)request;

/**
 <p>Deletes the IPSet specified by the <code>ipSetId</code>. IPSets are called trusted IP lists in the console user interface.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteIPSetRequest
 @see AWSGuardDutyDeleteIPSetResponse
 */
- (void)deleteIPSet:(AWSGuardDutyDeleteIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDeleteIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDeleteInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteInvitationsRequest
 @see AWSGuardDutyDeleteInvitationsResponse
 */
- (AWSTask<AWSGuardDutyDeleteInvitationsResponse *> *)deleteInvitations:(AWSGuardDutyDeleteInvitationsRequest *)request;

/**
 <p>Deletes invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteInvitationsRequest
 @see AWSGuardDutyDeleteInvitationsResponse
 */
- (void)deleteInvitations:(AWSGuardDutyDeleteInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDeleteInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDeleteMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteMembersRequest
 @see AWSGuardDutyDeleteMembersResponse
 */
- (AWSTask<AWSGuardDutyDeleteMembersResponse *> *)deleteMembers:(AWSGuardDutyDeleteMembersRequest *)request;

/**
 <p>Deletes GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteMembersRequest
 @see AWSGuardDutyDeleteMembersResponse
 */
- (void)deleteMembers:(AWSGuardDutyDeleteMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDeleteMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the publishing definition with the specified <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDeletePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeletePublishingDestinationRequest
 @see AWSGuardDutyDeletePublishingDestinationResponse
 */
- (AWSTask<AWSGuardDutyDeletePublishingDestinationResponse *> *)deletePublishingDestination:(AWSGuardDutyDeletePublishingDestinationRequest *)request;

/**
 <p>Deletes the publishing definition with the specified <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeletePublishingDestinationRequest
 @see AWSGuardDutyDeletePublishingDestinationResponse
 */
- (void)deletePublishingDestination:(AWSGuardDutyDeletePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDeletePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDeleteThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteThreatIntelSetRequest
 @see AWSGuardDutyDeleteThreatIntelSetResponse
 */
- (AWSTask<AWSGuardDutyDeleteThreatIntelSetResponse *> *)deleteThreatIntelSet:(AWSGuardDutyDeleteThreatIntelSetRequest *)request;

/**
 <p>Deletes the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDeleteThreatIntelSetRequest
 @see AWSGuardDutyDeleteThreatIntelSetResponse
 */
- (void)deleteThreatIntelSet:(AWSGuardDutyDeleteThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDeleteThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the account selected as the delegated administrator for GuardDuty.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrganizationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDescribeOrganizationConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDescribeOrganizationConfigurationRequest
 @see AWSGuardDutyDescribeOrganizationConfigurationResponse
 */
- (AWSTask<AWSGuardDutyDescribeOrganizationConfigurationResponse *> *)describeOrganizationConfiguration:(AWSGuardDutyDescribeOrganizationConfigurationRequest *)request;

/**
 <p>Returns information about the account selected as the delegated administrator for GuardDuty.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrganizationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDescribeOrganizationConfigurationRequest
 @see AWSGuardDutyDescribeOrganizationConfigurationResponse
 */
- (void)describeOrganizationConfiguration:(AWSGuardDutyDescribeOrganizationConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDescribeOrganizationConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the publishing destination specified by the provided <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDescribePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDescribePublishingDestinationRequest
 @see AWSGuardDutyDescribePublishingDestinationResponse
 */
- (AWSTask<AWSGuardDutyDescribePublishingDestinationResponse *> *)describePublishingDestination:(AWSGuardDutyDescribePublishingDestinationRequest *)request;

/**
 <p>Returns information about the publishing destination specified by the provided <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDescribePublishingDestinationRequest
 @see AWSGuardDutyDescribePublishingDestinationResponse
 */
- (void)describePublishingDestination:(AWSGuardDutyDescribePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDescribePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables an AWS account within the Organization as the GuardDuty delegated administrator.</p>
 
 @param request A container for the necessary parameters to execute the DisableOrganizationAdminAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDisableOrganizationAdminAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDisableOrganizationAdminAccountRequest
 @see AWSGuardDutyDisableOrganizationAdminAccountResponse
 */
- (AWSTask<AWSGuardDutyDisableOrganizationAdminAccountResponse *> *)disableOrganizationAdminAccount:(AWSGuardDutyDisableOrganizationAdminAccountRequest *)request;

/**
 <p>Disables an AWS account within the Organization as the GuardDuty delegated administrator.</p>
 
 @param request A container for the necessary parameters to execute the DisableOrganizationAdminAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDisableOrganizationAdminAccountRequest
 @see AWSGuardDutyDisableOrganizationAdminAccountResponse
 */
- (void)disableOrganizationAdminAccount:(AWSGuardDutyDisableOrganizationAdminAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDisableOrganizationAdminAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the current GuardDuty member account from its master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFromMasterAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDisassociateFromMasterAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDisassociateFromMasterAccountRequest
 @see AWSGuardDutyDisassociateFromMasterAccountResponse
 */
- (AWSTask<AWSGuardDutyDisassociateFromMasterAccountResponse *> *)disassociateFromMasterAccount:(AWSGuardDutyDisassociateFromMasterAccountRequest *)request;

/**
 <p>Disassociates the current GuardDuty member account from its master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFromMasterAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDisassociateFromMasterAccountRequest
 @see AWSGuardDutyDisassociateFromMasterAccountResponse
 */
- (void)disassociateFromMasterAccount:(AWSGuardDutyDisassociateFromMasterAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDisassociateFromMasterAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyDisassociateMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDisassociateMembersRequest
 @see AWSGuardDutyDisassociateMembersResponse
 */
- (AWSTask<AWSGuardDutyDisassociateMembersResponse *> *)disassociateMembers:(AWSGuardDutyDisassociateMembersRequest *)request;

/**
 <p>Disassociates GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyDisassociateMembersRequest
 @see AWSGuardDutyDisassociateMembersResponse
 */
- (void)disassociateMembers:(AWSGuardDutyDisassociateMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyDisassociateMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables an AWS account within the organization as the GuardDuty delegated administrator.</p>
 
 @param request A container for the necessary parameters to execute the EnableOrganizationAdminAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyEnableOrganizationAdminAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyEnableOrganizationAdminAccountRequest
 @see AWSGuardDutyEnableOrganizationAdminAccountResponse
 */
- (AWSTask<AWSGuardDutyEnableOrganizationAdminAccountResponse *> *)enableOrganizationAdminAccount:(AWSGuardDutyEnableOrganizationAdminAccountRequest *)request;

/**
 <p>Enables an AWS account within the organization as the GuardDuty delegated administrator.</p>
 
 @param request A container for the necessary parameters to execute the EnableOrganizationAdminAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyEnableOrganizationAdminAccountRequest
 @see AWSGuardDutyEnableOrganizationAdminAccountResponse
 */
- (void)enableOrganizationAdminAccount:(AWSGuardDutyEnableOrganizationAdminAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyEnableOrganizationAdminAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves an Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the GetDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyGetDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetDetectorRequest
 @see AWSGuardDutyGetDetectorResponse
 */
- (AWSTask<AWSGuardDutyGetDetectorResponse *> *)getDetector:(AWSGuardDutyGetDetectorRequest *)request;

/**
 <p>Retrieves an Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the GetDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetDetectorRequest
 @see AWSGuardDutyGetDetectorResponse
 */
- (void)getDetector:(AWSGuardDutyGetDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyGetDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the details of the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the GetFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyGetFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetFilterRequest
 @see AWSGuardDutyGetFilterResponse
 */
- (AWSTask<AWSGuardDutyGetFilterResponse *> *)getFilter:(AWSGuardDutyGetFilterRequest *)request;

/**
 <p>Returns the details of the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the GetFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetFilterRequest
 @see AWSGuardDutyGetFilterResponse
 */
- (void)getFilter:(AWSGuardDutyGetFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyGetFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes Amazon GuardDuty findings specified by finding IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyGetFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetFindingsRequest
 @see AWSGuardDutyGetFindingsResponse
 */
- (AWSTask<AWSGuardDutyGetFindingsResponse *> *)getFindings:(AWSGuardDutyGetFindingsRequest *)request;

/**
 <p>Describes Amazon GuardDuty findings specified by finding IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetFindingsRequest
 @see AWSGuardDutyGetFindingsResponse
 */
- (void)getFindings:(AWSGuardDutyGetFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyGetFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists Amazon GuardDuty findings statistics for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the GetFindingsStatistics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyGetFindingsStatisticsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetFindingsStatisticsRequest
 @see AWSGuardDutyGetFindingsStatisticsResponse
 */
- (AWSTask<AWSGuardDutyGetFindingsStatisticsResponse *> *)getFindingsStatistics:(AWSGuardDutyGetFindingsStatisticsRequest *)request;

/**
 <p>Lists Amazon GuardDuty findings statistics for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the GetFindingsStatistics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetFindingsStatisticsRequest
 @see AWSGuardDutyGetFindingsStatisticsResponse
 */
- (void)getFindingsStatistics:(AWSGuardDutyGetFindingsStatisticsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyGetFindingsStatisticsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the IPSet specified by the <code>ipSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyGetIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetIPSetRequest
 @see AWSGuardDutyGetIPSetResponse
 */
- (AWSTask<AWSGuardDutyGetIPSetResponse *> *)getIPSet:(AWSGuardDutyGetIPSetRequest *)request;

/**
 <p>Retrieves the IPSet specified by the <code>ipSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetIPSetRequest
 @see AWSGuardDutyGetIPSetResponse
 */
- (void)getIPSet:(AWSGuardDutyGetIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyGetIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the count of all GuardDuty membership invitations that were sent to the current member account except the currently accepted invitation.</p>
 
 @param request A container for the necessary parameters to execute the GetInvitationsCount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyGetInvitationsCountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetInvitationsCountRequest
 @see AWSGuardDutyGetInvitationsCountResponse
 */
- (AWSTask<AWSGuardDutyGetInvitationsCountResponse *> *)getInvitationsCount:(AWSGuardDutyGetInvitationsCountRequest *)request;

/**
 <p>Returns the count of all GuardDuty membership invitations that were sent to the current member account except the currently accepted invitation.</p>
 
 @param request A container for the necessary parameters to execute the GetInvitationsCount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetInvitationsCountRequest
 @see AWSGuardDutyGetInvitationsCountResponse
 */
- (void)getInvitationsCount:(AWSGuardDutyGetInvitationsCountRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyGetInvitationsCountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the details for the GuardDuty master account associated with the current GuardDuty member account.</p>
 
 @param request A container for the necessary parameters to execute the GetMasterAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyGetMasterAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetMasterAccountRequest
 @see AWSGuardDutyGetMasterAccountResponse
 */
- (AWSTask<AWSGuardDutyGetMasterAccountResponse *> *)getMasterAccount:(AWSGuardDutyGetMasterAccountRequest *)request;

/**
 <p>Provides the details for the GuardDuty master account associated with the current GuardDuty member account.</p>
 
 @param request A container for the necessary parameters to execute the GetMasterAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetMasterAccountRequest
 @see AWSGuardDutyGetMasterAccountResponse
 */
- (void)getMasterAccount:(AWSGuardDutyGetMasterAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyGetMasterAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyGetMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetMembersRequest
 @see AWSGuardDutyGetMembersResponse
 */
- (AWSTask<AWSGuardDutyGetMembersResponse *> *)getMembers:(AWSGuardDutyGetMembersRequest *)request;

/**
 <p>Retrieves GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetMembersRequest
 @see AWSGuardDutyGetMembersResponse
 */
- (void)getMembers:(AWSGuardDutyGetMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyGetMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the ThreatIntelSet that is specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the GetThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyGetThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetThreatIntelSetRequest
 @see AWSGuardDutyGetThreatIntelSetResponse
 */
- (AWSTask<AWSGuardDutyGetThreatIntelSetResponse *> *)getThreatIntelSet:(AWSGuardDutyGetThreatIntelSetRequest *)request;

/**
 <p>Retrieves the ThreatIntelSet that is specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the GetThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyGetThreatIntelSetRequest
 @see AWSGuardDutyGetThreatIntelSetResponse
 */
- (void)getThreatIntelSet:(AWSGuardDutyGetThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyGetThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Invites other AWS accounts (created as members of the current AWS account by CreateMembers) to enable GuardDuty, and allow the current AWS account to view and manage these accounts' GuardDuty findings on their behalf as the master account.</p>
 
 @param request A container for the necessary parameters to execute the InviteMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyInviteMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyInviteMembersRequest
 @see AWSGuardDutyInviteMembersResponse
 */
- (AWSTask<AWSGuardDutyInviteMembersResponse *> *)inviteMembers:(AWSGuardDutyInviteMembersRequest *)request;

/**
 <p>Invites other AWS accounts (created as members of the current AWS account by CreateMembers) to enable GuardDuty, and allow the current AWS account to view and manage these accounts' GuardDuty findings on their behalf as the master account.</p>
 
 @param request A container for the necessary parameters to execute the InviteMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyInviteMembersRequest
 @see AWSGuardDutyInviteMembersResponse
 */
- (void)inviteMembers:(AWSGuardDutyInviteMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyInviteMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists detectorIds of all the existing Amazon GuardDuty detector resources.</p>
 
 @param request A container for the necessary parameters to execute the ListDetectors service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyListDetectorsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListDetectorsRequest
 @see AWSGuardDutyListDetectorsResponse
 */
- (AWSTask<AWSGuardDutyListDetectorsResponse *> *)listDetectors:(AWSGuardDutyListDetectorsRequest *)request;

/**
 <p>Lists detectorIds of all the existing Amazon GuardDuty detector resources.</p>
 
 @param request A container for the necessary parameters to execute the ListDetectors service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListDetectorsRequest
 @see AWSGuardDutyListDetectorsResponse
 */
- (void)listDetectors:(AWSGuardDutyListDetectorsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyListDetectorsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a paginated list of the current filters.</p>
 
 @param request A container for the necessary parameters to execute the ListFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyListFiltersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListFiltersRequest
 @see AWSGuardDutyListFiltersResponse
 */
- (AWSTask<AWSGuardDutyListFiltersResponse *> *)listFilters:(AWSGuardDutyListFiltersRequest *)request;

/**
 <p>Returns a paginated list of the current filters.</p>
 
 @param request A container for the necessary parameters to execute the ListFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListFiltersRequest
 @see AWSGuardDutyListFiltersResponse
 */
- (void)listFilters:(AWSGuardDutyListFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyListFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists Amazon GuardDuty findings for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the ListFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyListFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListFindingsRequest
 @see AWSGuardDutyListFindingsResponse
 */
- (AWSTask<AWSGuardDutyListFindingsResponse *> *)listFindings:(AWSGuardDutyListFindingsRequest *)request;

/**
 <p>Lists Amazon GuardDuty findings for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the ListFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListFindingsRequest
 @see AWSGuardDutyListFindingsResponse
 */
- (void)listFindings:(AWSGuardDutyListFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyListFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the IPSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the IPSets returned are the IPSets from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the ListIPSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyListIPSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListIPSetsRequest
 @see AWSGuardDutyListIPSetsResponse
 */
- (AWSTask<AWSGuardDutyListIPSetsResponse *> *)listIPSets:(AWSGuardDutyListIPSetsRequest *)request;

/**
 <p>Lists the IPSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the IPSets returned are the IPSets from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the ListIPSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListIPSetsRequest
 @see AWSGuardDutyListIPSetsResponse
 */
- (void)listIPSets:(AWSGuardDutyListIPSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyListIPSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all GuardDuty membership invitations that were sent to the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyListInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListInvitationsRequest
 @see AWSGuardDutyListInvitationsResponse
 */
- (AWSTask<AWSGuardDutyListInvitationsResponse *> *)listInvitations:(AWSGuardDutyListInvitationsRequest *)request;

/**
 <p>Lists all GuardDuty membership invitations that were sent to the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListInvitationsRequest
 @see AWSGuardDutyListInvitationsResponse
 */
- (void)listInvitations:(AWSGuardDutyListInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyListInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists details about associated member accounts for the current GuardDuty master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyListMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListMembersRequest
 @see AWSGuardDutyListMembersResponse
 */
- (AWSTask<AWSGuardDutyListMembersResponse *> *)listMembers:(AWSGuardDutyListMembersRequest *)request;

/**
 <p>Lists details about associated member accounts for the current GuardDuty master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListMembersRequest
 @see AWSGuardDutyListMembersResponse
 */
- (void)listMembers:(AWSGuardDutyListMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyListMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the accounts configured as GuardDuty delegated administrators.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizationAdminAccounts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyListOrganizationAdminAccountsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListOrganizationAdminAccountsRequest
 @see AWSGuardDutyListOrganizationAdminAccountsResponse
 */
- (AWSTask<AWSGuardDutyListOrganizationAdminAccountsResponse *> *)listOrganizationAdminAccounts:(AWSGuardDutyListOrganizationAdminAccountsRequest *)request;

/**
 <p>Lists the accounts configured as GuardDuty delegated administrators.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizationAdminAccounts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListOrganizationAdminAccountsRequest
 @see AWSGuardDutyListOrganizationAdminAccountsResponse
 */
- (void)listOrganizationAdminAccounts:(AWSGuardDutyListOrganizationAdminAccountsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyListOrganizationAdminAccountsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of publishing destinations associated with the specified <code>dectectorId</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListPublishingDestinations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyListPublishingDestinationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListPublishingDestinationsRequest
 @see AWSGuardDutyListPublishingDestinationsResponse
 */
- (AWSTask<AWSGuardDutyListPublishingDestinationsResponse *> *)listPublishingDestinations:(AWSGuardDutyListPublishingDestinationsRequest *)request;

/**
 <p>Returns a list of publishing destinations associated with the specified <code>dectectorId</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListPublishingDestinations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListPublishingDestinationsRequest
 @see AWSGuardDutyListPublishingDestinationsResponse
 */
- (void)listPublishingDestinations:(AWSGuardDutyListPublishingDestinationsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyListPublishingDestinationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists tags for a resource. Tagging is currently supported for detectors, finding filters, IP sets, and threat intel sets, with a limit of 50 tags per resource. When invoked, this operation returns all assigned tags for a given resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListTagsForResourceRequest
 @see AWSGuardDutyListTagsForResourceResponse
 */
- (AWSTask<AWSGuardDutyListTagsForResourceResponse *> *)listTagsForResource:(AWSGuardDutyListTagsForResourceRequest *)request;

/**
 <p>Lists tags for a resource. Tagging is currently supported for detectors, finding filters, IP sets, and threat intel sets, with a limit of 50 tags per resource. When invoked, this operation returns all assigned tags for a given resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListTagsForResourceRequest
 @see AWSGuardDutyListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSGuardDutyListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the ThreatIntelSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the ThreatIntelSets associated with the master account are returned.</p>
 
 @param request A container for the necessary parameters to execute the ListThreatIntelSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyListThreatIntelSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListThreatIntelSetsRequest
 @see AWSGuardDutyListThreatIntelSetsResponse
 */
- (AWSTask<AWSGuardDutyListThreatIntelSetsResponse *> *)listThreatIntelSets:(AWSGuardDutyListThreatIntelSetsRequest *)request;

/**
 <p>Lists the ThreatIntelSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the ThreatIntelSets associated with the master account are returned.</p>
 
 @param request A container for the necessary parameters to execute the ListThreatIntelSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyListThreatIntelSetsRequest
 @see AWSGuardDutyListThreatIntelSetsResponse
 */
- (void)listThreatIntelSets:(AWSGuardDutyListThreatIntelSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyListThreatIntelSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Turns on GuardDuty monitoring of the specified member accounts. Use this operation to restart monitoring of accounts that you stopped monitoring with the <code>StopMonitoringMembers</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the StartMonitoringMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyStartMonitoringMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyStartMonitoringMembersRequest
 @see AWSGuardDutyStartMonitoringMembersResponse
 */
- (AWSTask<AWSGuardDutyStartMonitoringMembersResponse *> *)startMonitoringMembers:(AWSGuardDutyStartMonitoringMembersRequest *)request;

/**
 <p>Turns on GuardDuty monitoring of the specified member accounts. Use this operation to restart monitoring of accounts that you stopped monitoring with the <code>StopMonitoringMembers</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the StartMonitoringMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyStartMonitoringMembersRequest
 @see AWSGuardDutyStartMonitoringMembersResponse
 */
- (void)startMonitoringMembers:(AWSGuardDutyStartMonitoringMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyStartMonitoringMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops GuardDuty monitoring for the specified member accounts. Use the <code>StartMonitoringMembers</code> operation to restart monitoring for those accounts.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyStopMonitoringMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyStopMonitoringMembersRequest
 @see AWSGuardDutyStopMonitoringMembersResponse
 */
- (AWSTask<AWSGuardDutyStopMonitoringMembersResponse *> *)stopMonitoringMembers:(AWSGuardDutyStopMonitoringMembersRequest *)request;

/**
 <p>Stops GuardDuty monitoring for the specified member accounts. Use the <code>StartMonitoringMembers</code> operation to restart monitoring for those accounts.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyStopMonitoringMembersRequest
 @see AWSGuardDutyStopMonitoringMembersResponse
 */
- (void)stopMonitoringMembers:(AWSGuardDutyStopMonitoringMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyStopMonitoringMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyTagResourceRequest
 @see AWSGuardDutyTagResourceResponse
 */
- (AWSTask<AWSGuardDutyTagResourceResponse *> *)tagResource:(AWSGuardDutyTagResourceRequest *)request;

/**
 <p>Adds tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyTagResourceRequest
 @see AWSGuardDutyTagResourceResponse
 */
- (void)tagResource:(AWSGuardDutyTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Unarchives GuardDuty findings specified by the <code>findingIds</code>.</p>
 
 @param request A container for the necessary parameters to execute the UnarchiveFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyUnarchiveFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUnarchiveFindingsRequest
 @see AWSGuardDutyUnarchiveFindingsResponse
 */
- (AWSTask<AWSGuardDutyUnarchiveFindingsResponse *> *)unarchiveFindings:(AWSGuardDutyUnarchiveFindingsRequest *)request;

/**
 <p>Unarchives GuardDuty findings specified by the <code>findingIds</code>.</p>
 
 @param request A container for the necessary parameters to execute the UnarchiveFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUnarchiveFindingsRequest
 @see AWSGuardDutyUnarchiveFindingsResponse
 */
- (void)unarchiveFindings:(AWSGuardDutyUnarchiveFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyUnarchiveFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUntagResourceRequest
 @see AWSGuardDutyUntagResourceResponse
 */
- (AWSTask<AWSGuardDutyUntagResourceResponse *> *)untagResource:(AWSGuardDutyUntagResourceRequest *)request;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUntagResourceRequest
 @see AWSGuardDutyUntagResourceResponse
 */
- (void)untagResource:(AWSGuardDutyUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyUpdateDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateDetectorRequest
 @see AWSGuardDutyUpdateDetectorResponse
 */
- (AWSTask<AWSGuardDutyUpdateDetectorResponse *> *)updateDetector:(AWSGuardDutyUpdateDetectorRequest *)request;

/**
 <p>Updates the Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateDetectorRequest
 @see AWSGuardDutyUpdateDetectorResponse
 */
- (void)updateDetector:(AWSGuardDutyUpdateDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyUpdateDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyUpdateFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateFilterRequest
 @see AWSGuardDutyUpdateFilterResponse
 */
- (AWSTask<AWSGuardDutyUpdateFilterResponse *> *)updateFilter:(AWSGuardDutyUpdateFilterRequest *)request;

/**
 <p>Updates the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateFilterRequest
 @see AWSGuardDutyUpdateFilterResponse
 */
- (void)updateFilter:(AWSGuardDutyUpdateFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyUpdateFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Marks the specified GuardDuty findings as useful or not useful.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindingsFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyUpdateFindingsFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateFindingsFeedbackRequest
 @see AWSGuardDutyUpdateFindingsFeedbackResponse
 */
- (AWSTask<AWSGuardDutyUpdateFindingsFeedbackResponse *> *)updateFindingsFeedback:(AWSGuardDutyUpdateFindingsFeedbackRequest *)request;

/**
 <p>Marks the specified GuardDuty findings as useful or not useful.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindingsFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateFindingsFeedbackRequest
 @see AWSGuardDutyUpdateFindingsFeedbackResponse
 */
- (void)updateFindingsFeedback:(AWSGuardDutyUpdateFindingsFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyUpdateFindingsFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the IPSet specified by the IPSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyUpdateIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateIPSetRequest
 @see AWSGuardDutyUpdateIPSetResponse
 */
- (AWSTask<AWSGuardDutyUpdateIPSetResponse *> *)updateIPSet:(AWSGuardDutyUpdateIPSetRequest *)request;

/**
 <p>Updates the IPSet specified by the IPSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateIPSetRequest
 @see AWSGuardDutyUpdateIPSetResponse
 */
- (void)updateIPSet:(AWSGuardDutyUpdateIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyUpdateIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the delegated administrator account with the values provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateOrganizationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyUpdateOrganizationConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateOrganizationConfigurationRequest
 @see AWSGuardDutyUpdateOrganizationConfigurationResponse
 */
- (AWSTask<AWSGuardDutyUpdateOrganizationConfigurationResponse *> *)updateOrganizationConfiguration:(AWSGuardDutyUpdateOrganizationConfigurationRequest *)request;

/**
 <p>Updates the delegated administrator account with the values provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateOrganizationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateOrganizationConfigurationRequest
 @see AWSGuardDutyUpdateOrganizationConfigurationResponse
 */
- (void)updateOrganizationConfiguration:(AWSGuardDutyUpdateOrganizationConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyUpdateOrganizationConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates information about the publishing destination specified by the <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyUpdatePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdatePublishingDestinationRequest
 @see AWSGuardDutyUpdatePublishingDestinationResponse
 */
- (AWSTask<AWSGuardDutyUpdatePublishingDestinationResponse *> *)updatePublishingDestination:(AWSGuardDutyUpdatePublishingDestinationRequest *)request;

/**
 <p>Updates information about the publishing destination specified by the <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdatePublishingDestinationRequest
 @see AWSGuardDutyUpdatePublishingDestinationResponse
 */
- (void)updatePublishingDestination:(AWSGuardDutyUpdatePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyUpdatePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSGuardDutyUpdateThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateThreatIntelSetRequest
 @see AWSGuardDutyUpdateThreatIntelSetResponse
 */
- (AWSTask<AWSGuardDutyUpdateThreatIntelSetResponse *> *)updateThreatIntelSet:(AWSGuardDutyUpdateThreatIntelSetRequest *)request;

/**
 <p>Updates the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSGuardDutyErrorDomain` domain and the following error code: `AWSGuardDutyErrorBadRequest`, `AWSGuardDutyErrorInternalServerError`.
 
 @see AWSGuardDutyUpdateThreatIntelSetRequest
 @see AWSGuardDutyUpdateThreatIntelSetResponse
 */
- (void)updateThreatIntelSet:(AWSGuardDutyUpdateThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSGuardDutyUpdateThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
