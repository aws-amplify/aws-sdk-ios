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
#import "AWSguarddutyModel.h"
#import "AWSguarddutyResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSguardduty
FOUNDATION_EXPORT NSString *const AWSguarddutySDKVersion;

/**
 <p>Amazon GuardDuty is a continuous security monitoring service that analyzes and processes the following data sources: VPC Flow Logs, AWS CloudTrail event logs, and DNS logs. It uses threat intelligence feeds (such as lists of malicious IPs and domains) and machine learning to identify unexpected, potentially unauthorized, and malicious activity within your AWS environment. This can include issues like escalations of privileges, uses of exposed credentials, or communication with malicious IPs, URLs, or domains. For example, GuardDuty can detect compromised EC2 instances that serve malware or mine bitcoin. </p><p>GuardDuty also monitors AWS account access behavior for signs of compromise. Some examples of this are unauthorized infrastructure deployments such as EC2 instances deployed in a Region that has never been used, or unusual API calls like a password policy change to reduce password strength. </p><p>GuardDuty informs you of the status of your AWS environment by producing security findings that you can view in the GuardDuty console or through Amazon CloudWatch events. For more information, see the <i><a href="https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html">Amazon GuardDuty User Guide</a></i>. </p>
 */
@interface AWSguardduty : AWSService

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

     let guardduty = AWSguardduty.default()

 *Objective-C*

     AWSguardduty *guardduty = [AWSguardduty defaultguardduty];

 @return The default service client.
 */
+ (instancetype)defaultguardduty;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSguardduty.register(with: configuration!, forKey: "USWest2guardduty")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSguardduty registerguarddutyWithConfiguration:configuration forKey:@"USWest2guardduty"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let guardduty = AWSguardduty(forKey: "USWest2guardduty")

 *Objective-C*

     AWSguardduty *guardduty = [AWSguardduty guarddutyForKey:@"USWest2guardduty"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerguarddutyWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerguarddutyWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSguardduty.register(with: configuration!, forKey: "USWest2guardduty")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSguardduty registerguarddutyWithConfiguration:configuration forKey:@"USWest2guardduty"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let guardduty = AWSguardduty(forKey: "USWest2guardduty")

 *Objective-C*

     AWSguardduty *guardduty = [AWSguardduty guarddutyForKey:@"USWest2guardduty"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)guarddutyForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeguarddutyForKey:(NSString *)key;

/**
 <p>Accepts the invitation to be monitored by a master GuardDuty account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInvitation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyAcceptInvitationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyAcceptInvitationRequest
 @see AWSguarddutyAcceptInvitationResponse
 */
- (AWSTask<AWSguarddutyAcceptInvitationResponse *> *)acceptInvitation:(AWSguarddutyAcceptInvitationRequest *)request;

/**
 <p>Accepts the invitation to be monitored by a master GuardDuty account.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInvitation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyAcceptInvitationRequest
 @see AWSguarddutyAcceptInvitationResponse
 */
- (void)acceptInvitation:(AWSguarddutyAcceptInvitationRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyAcceptInvitationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Archives GuardDuty findings that are specified by the list of finding IDs.</p><note><p>Only the master account can archive findings. Member accounts don't have permission to archive findings from their accounts.</p></note>
 
 @param request A container for the necessary parameters to execute the ArchiveFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyArchiveFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyArchiveFindingsRequest
 @see AWSguarddutyArchiveFindingsResponse
 */
- (AWSTask<AWSguarddutyArchiveFindingsResponse *> *)archiveFindings:(AWSguarddutyArchiveFindingsRequest *)request;

/**
 <p>Archives GuardDuty findings that are specified by the list of finding IDs.</p><note><p>Only the master account can archive findings. Member accounts don't have permission to archive findings from their accounts.</p></note>
 
 @param request A container for the necessary parameters to execute the ArchiveFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyArchiveFindingsRequest
 @see AWSguarddutyArchiveFindingsResponse
 */
- (void)archiveFindings:(AWSguarddutyArchiveFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyArchiveFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a single Amazon GuardDuty detector. A detector is a resource that represents the GuardDuty service. To start using GuardDuty, you must create a detector in each Region where you enable the service. You can have only one detector per account per Region.</p>
 
 @param request A container for the necessary parameters to execute the CreateDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyCreateDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateDetectorRequest
 @see AWSguarddutyCreateDetectorResponse
 */
- (AWSTask<AWSguarddutyCreateDetectorResponse *> *)createDetector:(AWSguarddutyCreateDetectorRequest *)request;

/**
 <p>Creates a single Amazon GuardDuty detector. A detector is a resource that represents the GuardDuty service. To start using GuardDuty, you must create a detector in each Region where you enable the service. You can have only one detector per account per Region.</p>
 
 @param request A container for the necessary parameters to execute the CreateDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateDetectorRequest
 @see AWSguarddutyCreateDetectorResponse
 */
- (void)createDetector:(AWSguarddutyCreateDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyCreateDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a filter using the specified finding criteria.</p>
 
 @param request A container for the necessary parameters to execute the CreateFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyCreateFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateFilterRequest
 @see AWSguarddutyCreateFilterResponse
 */
- (AWSTask<AWSguarddutyCreateFilterResponse *> *)createFilter:(AWSguarddutyCreateFilterRequest *)request;

/**
 <p>Creates a filter using the specified finding criteria.</p>
 
 @param request A container for the necessary parameters to execute the CreateFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateFilterRequest
 @see AWSguarddutyCreateFilterResponse
 */
- (void)createFilter:(AWSguarddutyCreateFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyCreateFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new IPSet, which is called a trusted IP list in the console user interface. An IPSet is a list of IP addresses that are trusted for secure communication with AWS infrastructure and applications. GuardDuty doesn't generate findings for IP addresses that are included in IPSets. Only users from the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyCreateIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateIPSetRequest
 @see AWSguarddutyCreateIPSetResponse
 */
- (AWSTask<AWSguarddutyCreateIPSetResponse *> *)createIPSet:(AWSguarddutyCreateIPSetRequest *)request;

/**
 <p>Creates a new IPSet, which is called a trusted IP list in the console user interface. An IPSet is a list of IP addresses that are trusted for secure communication with AWS infrastructure and applications. GuardDuty doesn't generate findings for IP addresses that are included in IPSets. Only users from the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateIPSetRequest
 @see AWSguarddutyCreateIPSetResponse
 */
- (void)createIPSet:(AWSguarddutyCreateIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyCreateIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates member accounts of the current AWS account by specifying a list of AWS account IDs. The current AWS account can then invite these members to manage GuardDuty in their accounts.</p>
 
 @param request A container for the necessary parameters to execute the CreateMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyCreateMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateMembersRequest
 @see AWSguarddutyCreateMembersResponse
 */
- (AWSTask<AWSguarddutyCreateMembersResponse *> *)createMembers:(AWSguarddutyCreateMembersRequest *)request;

/**
 <p>Creates member accounts of the current AWS account by specifying a list of AWS account IDs. The current AWS account can then invite these members to manage GuardDuty in their accounts.</p>
 
 @param request A container for the necessary parameters to execute the CreateMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateMembersRequest
 @see AWSguarddutyCreateMembersResponse
 */
- (void)createMembers:(AWSguarddutyCreateMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyCreateMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a publishing destination to export findings to. The resource to export findings to must exist before you use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyCreatePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreatePublishingDestinationRequest
 @see AWSguarddutyCreatePublishingDestinationResponse
 */
- (AWSTask<AWSguarddutyCreatePublishingDestinationResponse *> *)createPublishingDestination:(AWSguarddutyCreatePublishingDestinationRequest *)request;

/**
 <p>Creates a publishing destination to export findings to. The resource to export findings to must exist before you use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreatePublishingDestinationRequest
 @see AWSguarddutyCreatePublishingDestinationResponse
 */
- (void)createPublishingDestination:(AWSguarddutyCreatePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyCreatePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates example findings of types specified by the list of finding types. If 'NULL' is specified for <code>findingTypes</code>, the API generates example findings of all supported finding types.</p>
 
 @param request A container for the necessary parameters to execute the CreateSampleFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyCreateSampleFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateSampleFindingsRequest
 @see AWSguarddutyCreateSampleFindingsResponse
 */
- (AWSTask<AWSguarddutyCreateSampleFindingsResponse *> *)createSampleFindings:(AWSguarddutyCreateSampleFindingsRequest *)request;

/**
 <p>Generates example findings of types specified by the list of finding types. If 'NULL' is specified for <code>findingTypes</code>, the API generates example findings of all supported finding types.</p>
 
 @param request A container for the necessary parameters to execute the CreateSampleFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateSampleFindingsRequest
 @see AWSguarddutyCreateSampleFindingsResponse
 */
- (void)createSampleFindings:(AWSguarddutyCreateSampleFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyCreateSampleFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new ThreatIntelSet. ThreatIntelSets consist of known malicious IP addresses. GuardDuty generates findings based on ThreatIntelSets. Only users of the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyCreateThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateThreatIntelSetRequest
 @see AWSguarddutyCreateThreatIntelSetResponse
 */
- (AWSTask<AWSguarddutyCreateThreatIntelSetResponse *> *)createThreatIntelSet:(AWSguarddutyCreateThreatIntelSetRequest *)request;

/**
 <p>Creates a new ThreatIntelSet. ThreatIntelSets consist of known malicious IP addresses. GuardDuty generates findings based on ThreatIntelSets. Only users of the master account can use this operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyCreateThreatIntelSetRequest
 @see AWSguarddutyCreateThreatIntelSetResponse
 */
- (void)createThreatIntelSet:(AWSguarddutyCreateThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyCreateThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Declines invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeclineInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDeclineInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeclineInvitationsRequest
 @see AWSguarddutyDeclineInvitationsResponse
 */
- (AWSTask<AWSguarddutyDeclineInvitationsResponse *> *)declineInvitations:(AWSguarddutyDeclineInvitationsRequest *)request;

/**
 <p>Declines invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeclineInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeclineInvitationsRequest
 @see AWSguarddutyDeclineInvitationsResponse
 */
- (void)declineInvitations:(AWSguarddutyDeclineInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDeclineInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon GuardDuty detector that is specified by the detector ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDeleteDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteDetectorRequest
 @see AWSguarddutyDeleteDetectorResponse
 */
- (AWSTask<AWSguarddutyDeleteDetectorResponse *> *)deleteDetector:(AWSguarddutyDeleteDetectorRequest *)request;

/**
 <p>Deletes an Amazon GuardDuty detector that is specified by the detector ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteDetectorRequest
 @see AWSguarddutyDeleteDetectorResponse
 */
- (void)deleteDetector:(AWSguarddutyDeleteDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDeleteDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDeleteFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteFilterRequest
 @see AWSguarddutyDeleteFilterResponse
 */
- (AWSTask<AWSguarddutyDeleteFilterResponse *> *)deleteFilter:(AWSguarddutyDeleteFilterRequest *)request;

/**
 <p>Deletes the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteFilterRequest
 @see AWSguarddutyDeleteFilterResponse
 */
- (void)deleteFilter:(AWSguarddutyDeleteFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDeleteFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the IPSet specified by the <code>ipSetId</code>. IPSets are called trusted IP lists in the console user interface.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDeleteIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteIPSetRequest
 @see AWSguarddutyDeleteIPSetResponse
 */
- (AWSTask<AWSguarddutyDeleteIPSetResponse *> *)deleteIPSet:(AWSguarddutyDeleteIPSetRequest *)request;

/**
 <p>Deletes the IPSet specified by the <code>ipSetId</code>. IPSets are called trusted IP lists in the console user interface.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteIPSetRequest
 @see AWSguarddutyDeleteIPSetResponse
 */
- (void)deleteIPSet:(AWSguarddutyDeleteIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDeleteIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDeleteInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteInvitationsRequest
 @see AWSguarddutyDeleteInvitationsResponse
 */
- (AWSTask<AWSguarddutyDeleteInvitationsResponse *> *)deleteInvitations:(AWSguarddutyDeleteInvitationsRequest *)request;

/**
 <p>Deletes invitations sent to the current member account by AWS accounts specified by their account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteInvitationsRequest
 @see AWSguarddutyDeleteInvitationsResponse
 */
- (void)deleteInvitations:(AWSguarddutyDeleteInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDeleteInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDeleteMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteMembersRequest
 @see AWSguarddutyDeleteMembersResponse
 */
- (AWSTask<AWSguarddutyDeleteMembersResponse *> *)deleteMembers:(AWSguarddutyDeleteMembersRequest *)request;

/**
 <p>Deletes GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteMembersRequest
 @see AWSguarddutyDeleteMembersResponse
 */
- (void)deleteMembers:(AWSguarddutyDeleteMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDeleteMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the publishing definition with the specified <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDeletePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeletePublishingDestinationRequest
 @see AWSguarddutyDeletePublishingDestinationResponse
 */
- (AWSTask<AWSguarddutyDeletePublishingDestinationResponse *> *)deletePublishingDestination:(AWSguarddutyDeletePublishingDestinationRequest *)request;

/**
 <p>Deletes the publishing definition with the specified <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeletePublishingDestinationRequest
 @see AWSguarddutyDeletePublishingDestinationResponse
 */
- (void)deletePublishingDestination:(AWSguarddutyDeletePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDeletePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDeleteThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteThreatIntelSetRequest
 @see AWSguarddutyDeleteThreatIntelSetResponse
 */
- (AWSTask<AWSguarddutyDeleteThreatIntelSetResponse *> *)deleteThreatIntelSet:(AWSguarddutyDeleteThreatIntelSetRequest *)request;

/**
 <p>Deletes the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDeleteThreatIntelSetRequest
 @see AWSguarddutyDeleteThreatIntelSetResponse
 */
- (void)deleteThreatIntelSet:(AWSguarddutyDeleteThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDeleteThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the account selected as the delegated administrator for GuardDuty.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrganizationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDescribeOrganizationConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDescribeOrganizationConfigurationRequest
 @see AWSguarddutyDescribeOrganizationConfigurationResponse
 */
- (AWSTask<AWSguarddutyDescribeOrganizationConfigurationResponse *> *)describeOrganizationConfiguration:(AWSguarddutyDescribeOrganizationConfigurationRequest *)request;

/**
 <p>Returns information about the account selected as the delegated administrator for GuardDuty.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOrganizationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDescribeOrganizationConfigurationRequest
 @see AWSguarddutyDescribeOrganizationConfigurationResponse
 */
- (void)describeOrganizationConfiguration:(AWSguarddutyDescribeOrganizationConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDescribeOrganizationConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the publishing destination specified by the provided <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDescribePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDescribePublishingDestinationRequest
 @see AWSguarddutyDescribePublishingDestinationResponse
 */
- (AWSTask<AWSguarddutyDescribePublishingDestinationResponse *> *)describePublishingDestination:(AWSguarddutyDescribePublishingDestinationRequest *)request;

/**
 <p>Returns information about the publishing destination specified by the provided <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDescribePublishingDestinationRequest
 @see AWSguarddutyDescribePublishingDestinationResponse
 */
- (void)describePublishingDestination:(AWSguarddutyDescribePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDescribePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables GuardDuty administrator permissions for an AWS account within the Organization.</p>
 
 @param request A container for the necessary parameters to execute the DisableOrganizationAdminAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDisableOrganizationAdminAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDisableOrganizationAdminAccountRequest
 @see AWSguarddutyDisableOrganizationAdminAccountResponse
 */
- (AWSTask<AWSguarddutyDisableOrganizationAdminAccountResponse *> *)disableOrganizationAdminAccount:(AWSguarddutyDisableOrganizationAdminAccountRequest *)request;

/**
 <p>Disables GuardDuty administrator permissions for an AWS account within the Organization.</p>
 
 @param request A container for the necessary parameters to execute the DisableOrganizationAdminAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDisableOrganizationAdminAccountRequest
 @see AWSguarddutyDisableOrganizationAdminAccountResponse
 */
- (void)disableOrganizationAdminAccount:(AWSguarddutyDisableOrganizationAdminAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDisableOrganizationAdminAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the current GuardDuty member account from its master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFromMasterAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDisassociateFromMasterAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDisassociateFromMasterAccountRequest
 @see AWSguarddutyDisassociateFromMasterAccountResponse
 */
- (AWSTask<AWSguarddutyDisassociateFromMasterAccountResponse *> *)disassociateFromMasterAccount:(AWSguarddutyDisassociateFromMasterAccountRequest *)request;

/**
 <p>Disassociates the current GuardDuty member account from its master account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateFromMasterAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDisassociateFromMasterAccountRequest
 @see AWSguarddutyDisassociateFromMasterAccountResponse
 */
- (void)disassociateFromMasterAccount:(AWSguarddutyDisassociateFromMasterAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDisassociateFromMasterAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyDisassociateMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDisassociateMembersRequest
 @see AWSguarddutyDisassociateMembersResponse
 */
- (AWSTask<AWSguarddutyDisassociateMembersResponse *> *)disassociateMembers:(AWSguarddutyDisassociateMembersRequest *)request;

/**
 <p>Disassociates GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyDisassociateMembersRequest
 @see AWSguarddutyDisassociateMembersResponse
 */
- (void)disassociateMembers:(AWSguarddutyDisassociateMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyDisassociateMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables GuardDuty administrator permissions for an AWS account within the organization.</p>
 
 @param request A container for the necessary parameters to execute the EnableOrganizationAdminAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyEnableOrganizationAdminAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyEnableOrganizationAdminAccountRequest
 @see AWSguarddutyEnableOrganizationAdminAccountResponse
 */
- (AWSTask<AWSguarddutyEnableOrganizationAdminAccountResponse *> *)enableOrganizationAdminAccount:(AWSguarddutyEnableOrganizationAdminAccountRequest *)request;

/**
 <p>Enables GuardDuty administrator permissions for an AWS account within the organization.</p>
 
 @param request A container for the necessary parameters to execute the EnableOrganizationAdminAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyEnableOrganizationAdminAccountRequest
 @see AWSguarddutyEnableOrganizationAdminAccountResponse
 */
- (void)enableOrganizationAdminAccount:(AWSguarddutyEnableOrganizationAdminAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyEnableOrganizationAdminAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves an Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the GetDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyGetDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetDetectorRequest
 @see AWSguarddutyGetDetectorResponse
 */
- (AWSTask<AWSguarddutyGetDetectorResponse *> *)getDetector:(AWSguarddutyGetDetectorRequest *)request;

/**
 <p>Retrieves an Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the GetDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetDetectorRequest
 @see AWSguarddutyGetDetectorResponse
 */
- (void)getDetector:(AWSguarddutyGetDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyGetDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the details of the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the GetFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyGetFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetFilterRequest
 @see AWSguarddutyGetFilterResponse
 */
- (AWSTask<AWSguarddutyGetFilterResponse *> *)getFilter:(AWSguarddutyGetFilterRequest *)request;

/**
 <p>Returns the details of the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the GetFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetFilterRequest
 @see AWSguarddutyGetFilterResponse
 */
- (void)getFilter:(AWSguarddutyGetFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyGetFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes Amazon GuardDuty findings specified by finding IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyGetFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetFindingsRequest
 @see AWSguarddutyGetFindingsResponse
 */
- (AWSTask<AWSguarddutyGetFindingsResponse *> *)getFindings:(AWSguarddutyGetFindingsRequest *)request;

/**
 <p>Describes Amazon GuardDuty findings specified by finding IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetFindingsRequest
 @see AWSguarddutyGetFindingsResponse
 */
- (void)getFindings:(AWSguarddutyGetFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyGetFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists Amazon GuardDuty findings statistics for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the GetFindingsStatistics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyGetFindingsStatisticsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetFindingsStatisticsRequest
 @see AWSguarddutyGetFindingsStatisticsResponse
 */
- (AWSTask<AWSguarddutyGetFindingsStatisticsResponse *> *)getFindingsStatistics:(AWSguarddutyGetFindingsStatisticsRequest *)request;

/**
 <p>Lists Amazon GuardDuty findings statistics for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the GetFindingsStatistics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetFindingsStatisticsRequest
 @see AWSguarddutyGetFindingsStatisticsResponse
 */
- (void)getFindingsStatistics:(AWSguarddutyGetFindingsStatisticsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyGetFindingsStatisticsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the IPSet specified by the <code>ipSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyGetIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetIPSetRequest
 @see AWSguarddutyGetIPSetResponse
 */
- (AWSTask<AWSguarddutyGetIPSetResponse *> *)getIPSet:(AWSguarddutyGetIPSetRequest *)request;

/**
 <p>Retrieves the IPSet specified by the <code>ipSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetIPSetRequest
 @see AWSguarddutyGetIPSetResponse
 */
- (void)getIPSet:(AWSguarddutyGetIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyGetIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the count of all GuardDuty membership invitations that were sent to the current member account except the currently accepted invitation.</p>
 
 @param request A container for the necessary parameters to execute the GetInvitationsCount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyGetInvitationsCountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetInvitationsCountRequest
 @see AWSguarddutyGetInvitationsCountResponse
 */
- (AWSTask<AWSguarddutyGetInvitationsCountResponse *> *)getInvitationsCount:(AWSguarddutyGetInvitationsCountRequest *)request;

/**
 <p>Returns the count of all GuardDuty membership invitations that were sent to the current member account except the currently accepted invitation.</p>
 
 @param request A container for the necessary parameters to execute the GetInvitationsCount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetInvitationsCountRequest
 @see AWSguarddutyGetInvitationsCountResponse
 */
- (void)getInvitationsCount:(AWSguarddutyGetInvitationsCountRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyGetInvitationsCountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the details for the GuardDuty master account associated with the current GuardDuty member account.</p>
 
 @param request A container for the necessary parameters to execute the GetMasterAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyGetMasterAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetMasterAccountRequest
 @see AWSguarddutyGetMasterAccountResponse
 */
- (AWSTask<AWSguarddutyGetMasterAccountResponse *> *)getMasterAccount:(AWSguarddutyGetMasterAccountRequest *)request;

/**
 <p>Provides the details for the GuardDuty master account associated with the current GuardDuty member account.</p>
 
 @param request A container for the necessary parameters to execute the GetMasterAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetMasterAccountRequest
 @see AWSguarddutyGetMasterAccountResponse
 */
- (void)getMasterAccount:(AWSguarddutyGetMasterAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyGetMasterAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyGetMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetMembersRequest
 @see AWSguarddutyGetMembersResponse
 */
- (AWSTask<AWSguarddutyGetMembersResponse *> *)getMembers:(AWSguarddutyGetMembersRequest *)request;

/**
 <p>Retrieves GuardDuty member accounts (to the current GuardDuty master account) specified by the account IDs.</p>
 
 @param request A container for the necessary parameters to execute the GetMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetMembersRequest
 @see AWSguarddutyGetMembersResponse
 */
- (void)getMembers:(AWSguarddutyGetMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyGetMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the ThreatIntelSet that is specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the GetThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyGetThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetThreatIntelSetRequest
 @see AWSguarddutyGetThreatIntelSetResponse
 */
- (AWSTask<AWSguarddutyGetThreatIntelSetResponse *> *)getThreatIntelSet:(AWSguarddutyGetThreatIntelSetRequest *)request;

/**
 <p>Retrieves the ThreatIntelSet that is specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the GetThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyGetThreatIntelSetRequest
 @see AWSguarddutyGetThreatIntelSetResponse
 */
- (void)getThreatIntelSet:(AWSguarddutyGetThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyGetThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Invites other AWS accounts (created as members of the current AWS account by CreateMembers) to enable GuardDuty, and allow the current AWS account to view and manage these accounts' GuardDuty findings on their behalf as the master account.</p>
 
 @param request A container for the necessary parameters to execute the InviteMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyInviteMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyInviteMembersRequest
 @see AWSguarddutyInviteMembersResponse
 */
- (AWSTask<AWSguarddutyInviteMembersResponse *> *)inviteMembers:(AWSguarddutyInviteMembersRequest *)request;

/**
 <p>Invites other AWS accounts (created as members of the current AWS account by CreateMembers) to enable GuardDuty, and allow the current AWS account to view and manage these accounts' GuardDuty findings on their behalf as the master account.</p>
 
 @param request A container for the necessary parameters to execute the InviteMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyInviteMembersRequest
 @see AWSguarddutyInviteMembersResponse
 */
- (void)inviteMembers:(AWSguarddutyInviteMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyInviteMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists detectorIds of all the existing Amazon GuardDuty detector resources.</p>
 
 @param request A container for the necessary parameters to execute the ListDetectors service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyListDetectorsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListDetectorsRequest
 @see AWSguarddutyListDetectorsResponse
 */
- (AWSTask<AWSguarddutyListDetectorsResponse *> *)listDetectors:(AWSguarddutyListDetectorsRequest *)request;

/**
 <p>Lists detectorIds of all the existing Amazon GuardDuty detector resources.</p>
 
 @param request A container for the necessary parameters to execute the ListDetectors service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListDetectorsRequest
 @see AWSguarddutyListDetectorsResponse
 */
- (void)listDetectors:(AWSguarddutyListDetectorsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyListDetectorsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a paginated list of the current filters.</p>
 
 @param request A container for the necessary parameters to execute the ListFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyListFiltersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListFiltersRequest
 @see AWSguarddutyListFiltersResponse
 */
- (AWSTask<AWSguarddutyListFiltersResponse *> *)listFilters:(AWSguarddutyListFiltersRequest *)request;

/**
 <p>Returns a paginated list of the current filters.</p>
 
 @param request A container for the necessary parameters to execute the ListFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListFiltersRequest
 @see AWSguarddutyListFiltersResponse
 */
- (void)listFilters:(AWSguarddutyListFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyListFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists Amazon GuardDuty findings for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the ListFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyListFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListFindingsRequest
 @see AWSguarddutyListFindingsResponse
 */
- (AWSTask<AWSguarddutyListFindingsResponse *> *)listFindings:(AWSguarddutyListFindingsRequest *)request;

/**
 <p>Lists Amazon GuardDuty findings for the specified detector ID.</p>
 
 @param request A container for the necessary parameters to execute the ListFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListFindingsRequest
 @see AWSguarddutyListFindingsResponse
 */
- (void)listFindings:(AWSguarddutyListFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyListFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the IPSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the IPSets returned are the IPSets from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the ListIPSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyListIPSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListIPSetsRequest
 @see AWSguarddutyListIPSetsResponse
 */
- (AWSTask<AWSguarddutyListIPSetsResponse *> *)listIPSets:(AWSguarddutyListIPSetsRequest *)request;

/**
 <p>Lists the IPSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the IPSets returned are the IPSets from the associated master account.</p>
 
 @param request A container for the necessary parameters to execute the ListIPSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListIPSetsRequest
 @see AWSguarddutyListIPSetsResponse
 */
- (void)listIPSets:(AWSguarddutyListIPSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyListIPSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all GuardDuty membership invitations that were sent to the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListInvitations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyListInvitationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListInvitationsRequest
 @see AWSguarddutyListInvitationsResponse
 */
- (AWSTask<AWSguarddutyListInvitationsResponse *> *)listInvitations:(AWSguarddutyListInvitationsRequest *)request;

/**
 <p>Lists all GuardDuty membership invitations that were sent to the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListInvitations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListInvitationsRequest
 @see AWSguarddutyListInvitationsResponse
 */
- (void)listInvitations:(AWSguarddutyListInvitationsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyListInvitationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists details about associated member accounts for the current GuardDuty master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyListMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListMembersRequest
 @see AWSguarddutyListMembersResponse
 */
- (AWSTask<AWSguarddutyListMembersResponse *> *)listMembers:(AWSguarddutyListMembersRequest *)request;

/**
 <p>Lists details about associated member accounts for the current GuardDuty master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListMembersRequest
 @see AWSguarddutyListMembersResponse
 */
- (void)listMembers:(AWSguarddutyListMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyListMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the accounts configured as AWS Organization delegated administrators.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizationAdminAccounts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyListOrganizationAdminAccountsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListOrganizationAdminAccountsRequest
 @see AWSguarddutyListOrganizationAdminAccountsResponse
 */
- (AWSTask<AWSguarddutyListOrganizationAdminAccountsResponse *> *)listOrganizationAdminAccounts:(AWSguarddutyListOrganizationAdminAccountsRequest *)request;

/**
 <p>Lists the accounts configured as AWS Organization delegated administrators.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizationAdminAccounts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListOrganizationAdminAccountsRequest
 @see AWSguarddutyListOrganizationAdminAccountsResponse
 */
- (void)listOrganizationAdminAccounts:(AWSguarddutyListOrganizationAdminAccountsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyListOrganizationAdminAccountsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of publishing destinations associated with the specified <code>dectectorId</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListPublishingDestinations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyListPublishingDestinationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListPublishingDestinationsRequest
 @see AWSguarddutyListPublishingDestinationsResponse
 */
- (AWSTask<AWSguarddutyListPublishingDestinationsResponse *> *)listPublishingDestinations:(AWSguarddutyListPublishingDestinationsRequest *)request;

/**
 <p>Returns a list of publishing destinations associated with the specified <code>dectectorId</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListPublishingDestinations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListPublishingDestinationsRequest
 @see AWSguarddutyListPublishingDestinationsResponse
 */
- (void)listPublishingDestinations:(AWSguarddutyListPublishingDestinationsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyListPublishingDestinationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists tags for a resource. Tagging is currently supported for detectors, finding filters, IP sets, and threat intel sets, with a limit of 50 tags per resource. When invoked, this operation returns all assigned tags for a given resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListTagsForResourceRequest
 @see AWSguarddutyListTagsForResourceResponse
 */
- (AWSTask<AWSguarddutyListTagsForResourceResponse *> *)listTagsForResource:(AWSguarddutyListTagsForResourceRequest *)request;

/**
 <p>Lists tags for a resource. Tagging is currently supported for detectors, finding filters, IP sets, and threat intel sets, with a limit of 50 tags per resource. When invoked, this operation returns all assigned tags for a given resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListTagsForResourceRequest
 @see AWSguarddutyListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSguarddutyListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the ThreatIntelSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the ThreatIntelSets associated with the master account are returned.</p>
 
 @param request A container for the necessary parameters to execute the ListThreatIntelSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyListThreatIntelSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListThreatIntelSetsRequest
 @see AWSguarddutyListThreatIntelSetsResponse
 */
- (AWSTask<AWSguarddutyListThreatIntelSetsResponse *> *)listThreatIntelSets:(AWSguarddutyListThreatIntelSetsRequest *)request;

/**
 <p>Lists the ThreatIntelSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the ThreatIntelSets associated with the master account are returned.</p>
 
 @param request A container for the necessary parameters to execute the ListThreatIntelSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyListThreatIntelSetsRequest
 @see AWSguarddutyListThreatIntelSetsResponse
 */
- (void)listThreatIntelSets:(AWSguarddutyListThreatIntelSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyListThreatIntelSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Turns on GuardDuty monitoring of the specified member accounts. Use this operation to restart monitoring of accounts that you stopped monitoring with the <code>StopMonitoringMembers</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the StartMonitoringMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyStartMonitoringMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyStartMonitoringMembersRequest
 @see AWSguarddutyStartMonitoringMembersResponse
 */
- (AWSTask<AWSguarddutyStartMonitoringMembersResponse *> *)startMonitoringMembers:(AWSguarddutyStartMonitoringMembersRequest *)request;

/**
 <p>Turns on GuardDuty monitoring of the specified member accounts. Use this operation to restart monitoring of accounts that you stopped monitoring with the <code>StopMonitoringMembers</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the StartMonitoringMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyStartMonitoringMembersRequest
 @see AWSguarddutyStartMonitoringMembersResponse
 */
- (void)startMonitoringMembers:(AWSguarddutyStartMonitoringMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyStartMonitoringMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops GuardDuty monitoring for the specified member accounts. Use the <code>StartMonitoringMembers</code> operation to restart monitoring for those accounts.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyStopMonitoringMembersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyStopMonitoringMembersRequest
 @see AWSguarddutyStopMonitoringMembersResponse
 */
- (AWSTask<AWSguarddutyStopMonitoringMembersResponse *> *)stopMonitoringMembers:(AWSguarddutyStopMonitoringMembersRequest *)request;

/**
 <p>Stops GuardDuty monitoring for the specified member accounts. Use the <code>StartMonitoringMembers</code> operation to restart monitoring for those accounts.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyStopMonitoringMembersRequest
 @see AWSguarddutyStopMonitoringMembersResponse
 */
- (void)stopMonitoringMembers:(AWSguarddutyStopMonitoringMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyStopMonitoringMembersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyTagResourceRequest
 @see AWSguarddutyTagResourceResponse
 */
- (AWSTask<AWSguarddutyTagResourceResponse *> *)tagResource:(AWSguarddutyTagResourceRequest *)request;

/**
 <p>Adds tags to a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyTagResourceRequest
 @see AWSguarddutyTagResourceResponse
 */
- (void)tagResource:(AWSguarddutyTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Unarchives GuardDuty findings specified by the <code>findingIds</code>.</p>
 
 @param request A container for the necessary parameters to execute the UnarchiveFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyUnarchiveFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUnarchiveFindingsRequest
 @see AWSguarddutyUnarchiveFindingsResponse
 */
- (AWSTask<AWSguarddutyUnarchiveFindingsResponse *> *)unarchiveFindings:(AWSguarddutyUnarchiveFindingsRequest *)request;

/**
 <p>Unarchives GuardDuty findings specified by the <code>findingIds</code>.</p>
 
 @param request A container for the necessary parameters to execute the UnarchiveFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUnarchiveFindingsRequest
 @see AWSguarddutyUnarchiveFindingsResponse
 */
- (void)unarchiveFindings:(AWSguarddutyUnarchiveFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyUnarchiveFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUntagResourceRequest
 @see AWSguarddutyUntagResourceResponse
 */
- (AWSTask<AWSguarddutyUntagResourceResponse *> *)untagResource:(AWSguarddutyUntagResourceRequest *)request;

/**
 <p>Removes tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUntagResourceRequest
 @see AWSguarddutyUntagResourceResponse
 */
- (void)untagResource:(AWSguarddutyUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyUpdateDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateDetectorRequest
 @see AWSguarddutyUpdateDetectorResponse
 */
- (AWSTask<AWSguarddutyUpdateDetectorResponse *> *)updateDetector:(AWSguarddutyUpdateDetectorRequest *)request;

/**
 <p>Updates the Amazon GuardDuty detector specified by the detectorId.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateDetectorRequest
 @see AWSguarddutyUpdateDetectorResponse
 */
- (void)updateDetector:(AWSguarddutyUpdateDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyUpdateDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyUpdateFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateFilterRequest
 @see AWSguarddutyUpdateFilterResponse
 */
- (AWSTask<AWSguarddutyUpdateFilterResponse *> *)updateFilter:(AWSguarddutyUpdateFilterRequest *)request;

/**
 <p>Updates the filter specified by the filter name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateFilterRequest
 @see AWSguarddutyUpdateFilterResponse
 */
- (void)updateFilter:(AWSguarddutyUpdateFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyUpdateFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Marks the specified GuardDuty findings as useful or not useful.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindingsFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyUpdateFindingsFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateFindingsFeedbackRequest
 @see AWSguarddutyUpdateFindingsFeedbackResponse
 */
- (AWSTask<AWSguarddutyUpdateFindingsFeedbackResponse *> *)updateFindingsFeedback:(AWSguarddutyUpdateFindingsFeedbackRequest *)request;

/**
 <p>Marks the specified GuardDuty findings as useful or not useful.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindingsFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateFindingsFeedbackRequest
 @see AWSguarddutyUpdateFindingsFeedbackResponse
 */
- (void)updateFindingsFeedback:(AWSguarddutyUpdateFindingsFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyUpdateFindingsFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the IPSet specified by the IPSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyUpdateIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateIPSetRequest
 @see AWSguarddutyUpdateIPSetResponse
 */
- (AWSTask<AWSguarddutyUpdateIPSetResponse *> *)updateIPSet:(AWSguarddutyUpdateIPSetRequest *)request;

/**
 <p>Updates the IPSet specified by the IPSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateIPSetRequest
 @see AWSguarddutyUpdateIPSetResponse
 */
- (void)updateIPSet:(AWSguarddutyUpdateIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyUpdateIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the delegated administrator account with the values provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateOrganizationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyUpdateOrganizationConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateOrganizationConfigurationRequest
 @see AWSguarddutyUpdateOrganizationConfigurationResponse
 */
- (AWSTask<AWSguarddutyUpdateOrganizationConfigurationResponse *> *)updateOrganizationConfiguration:(AWSguarddutyUpdateOrganizationConfigurationRequest *)request;

/**
 <p>Updates the delegated administrator account with the values provided.</p>
 
 @param request A container for the necessary parameters to execute the UpdateOrganizationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateOrganizationConfigurationRequest
 @see AWSguarddutyUpdateOrganizationConfigurationResponse
 */
- (void)updateOrganizationConfiguration:(AWSguarddutyUpdateOrganizationConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyUpdateOrganizationConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates information about the publishing destination specified by the <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePublishingDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyUpdatePublishingDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdatePublishingDestinationRequest
 @see AWSguarddutyUpdatePublishingDestinationResponse
 */
- (AWSTask<AWSguarddutyUpdatePublishingDestinationResponse *> *)updatePublishingDestination:(AWSguarddutyUpdatePublishingDestinationRequest *)request;

/**
 <p>Updates information about the publishing destination specified by the <code>destinationId</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePublishingDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdatePublishingDestinationRequest
 @see AWSguarddutyUpdatePublishingDestinationResponse
 */
- (void)updatePublishingDestination:(AWSguarddutyUpdatePublishingDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyUpdatePublishingDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateThreatIntelSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSguarddutyUpdateThreatIntelSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateThreatIntelSetRequest
 @see AWSguarddutyUpdateThreatIntelSetResponse
 */
- (AWSTask<AWSguarddutyUpdateThreatIntelSetResponse *> *)updateThreatIntelSet:(AWSguarddutyUpdateThreatIntelSetRequest *)request;

/**
 <p>Updates the ThreatIntelSet specified by the ThreatIntelSet ID.</p>
 
 @param request A container for the necessary parameters to execute the UpdateThreatIntelSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSguarddutyErrorDomain` domain and the following error code: `AWSguarddutyErrorBadRequest`, `AWSguarddutyErrorInternalServerError`.
 
 @see AWSguarddutyUpdateThreatIntelSetRequest
 @see AWSguarddutyUpdateThreatIntelSetResponse
 */
- (void)updateThreatIntelSet:(AWSguarddutyUpdateThreatIntelSetRequest *)request completionHandler:(void (^ _Nullable)(AWSguarddutyUpdateThreatIntelSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
