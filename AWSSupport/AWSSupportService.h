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
#import "AWSSupportModel.h"
#import "AWSSupportResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSupport
FOUNDATION_EXPORT NSString *const AWSSupportSDKVersion;

/**
 <fullname>AWS Support</fullname><p>The AWS Support API reference is intended for programmers who need detailed information about the AWS Support operations and data types. This service enables you to manage your AWS Support cases programmatically. It uses HTTP methods that return results in JSON format.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note><p>The AWS Support service also exposes a set of <a href="http://aws.amazon.com/premiumsupport/trustedadvisor/">AWS Trusted Advisor</a> features. You can retrieve a list of checks and their descriptions, get check results, specify checks to refresh, and get the refresh status of checks.</p><p>The following list describes the AWS Support case management operations:</p><ul><li><p><b>Service names, issue categories, and available severity levels. </b>The <a>DescribeServices</a> and <a>DescribeSeverityLevels</a> operations return AWS service names, service codes, service categories, and problem severity levels. You use these values when you call the <a>CreateCase</a> operation.</p></li><li><p><b>Case creation, case details, and case resolution.</b> The <a>CreateCase</a>, <a>DescribeCases</a>, <a>DescribeAttachment</a>, and <a>ResolveCase</a> operations create AWS Support cases, retrieve information about cases, and resolve cases.</p></li><li><p><b>Case communication.</b> The <a>DescribeCommunications</a>, <a>AddCommunicationToCase</a>, and <a>AddAttachmentsToSet</a> operations retrieve and add communications and attachments to AWS Support cases.</p></li></ul><p>The following list describes the operations available from the AWS Support service for Trusted Advisor:</p><ul><li><p><a>DescribeTrustedAdvisorChecks</a> returns the list of checks that run against your AWS resources.</p></li><li><p>Using the <code>checkId</code> for a specific check returned by <a>DescribeTrustedAdvisorChecks</a>, you can call <a>DescribeTrustedAdvisorCheckResult</a> to obtain the results for the check that you specified.</p></li><li><p><a>DescribeTrustedAdvisorCheckSummaries</a> returns summarized results for one or more Trusted Advisor checks.</p></li><li><p><a>RefreshTrustedAdvisorCheck</a> requests that Trusted Advisor rerun a specified check.</p></li><li><p><a>DescribeTrustedAdvisorCheckRefreshStatuses</a> reports the refresh status of one or more checks.</p></li></ul><p>For authentication of requests, AWS Support uses <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 Signing Process</a>.</p><p>See <a href="https://docs.aws.amazon.com/awssupport/latest/user/Welcome.html">About the AWS Support API</a> in the <i>AWS Support User Guide</i> for information about how to use this service to create and manage your support cases, and how to call Trusted Advisor for results of checks on your resources.</p>
 */
@interface AWSSupport : AWSService

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

     let Support = AWSSupport.default()

 *Objective-C*

     AWSSupport *Support = [AWSSupport defaultSupport];

 @return The default service client.
 */
+ (instancetype)defaultSupport;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSupport.register(with: configuration!, forKey: "USWest2Support")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSupport registerSupportWithConfiguration:configuration forKey:@"USWest2Support"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Support = AWSSupport(forKey: "USWest2Support")

 *Objective-C*

     AWSSupport *Support = [AWSSupport SupportForKey:@"USWest2Support"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSupportWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSupportWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSupport.register(with: configuration!, forKey: "USWest2Support")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSupport registerSupportWithConfiguration:configuration forKey:@"USWest2Support"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Support = AWSSupport(forKey: "USWest2Support")

 *Objective-C*

     AWSSupport *Support = [AWSSupport SupportForKey:@"USWest2Support"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SupportForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSupportForKey:(NSString *)key;

/**
 <p>Adds one or more attachments to an attachment set. </p><p>An attachment set is a temporary container for attachments that you add to a case or case communication. The set is available for 1 hour after it's created. The <code>expiryTime</code> returned in the response is when the set expires. </p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AddAttachmentsToSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportAddAttachmentsToSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorAttachmentSetIdNotFound`, `AWSSupportErrorAttachmentSetExpired`, `AWSSupportErrorAttachmentSetSizeLimitExceeded`, `AWSSupportErrorAttachmentLimitExceeded`.
 
 @see AWSSupportAddAttachmentsToSetRequest
 @see AWSSupportAddAttachmentsToSetResponse
 */
- (AWSTask<AWSSupportAddAttachmentsToSetResponse *> *)addAttachmentsToSet:(AWSSupportAddAttachmentsToSetRequest *)request;

/**
 <p>Adds one or more attachments to an attachment set. </p><p>An attachment set is a temporary container for attachments that you add to a case or case communication. The set is available for 1 hour after it's created. The <code>expiryTime</code> returned in the response is when the set expires. </p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AddAttachmentsToSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorAttachmentSetIdNotFound`, `AWSSupportErrorAttachmentSetExpired`, `AWSSupportErrorAttachmentSetSizeLimitExceeded`, `AWSSupportErrorAttachmentLimitExceeded`.
 
 @see AWSSupportAddAttachmentsToSetRequest
 @see AWSSupportAddAttachmentsToSetResponse
 */
- (void)addAttachmentsToSet:(AWSSupportAddAttachmentsToSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportAddAttachmentsToSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds additional customer communication to an AWS Support case. Use the <code>caseId</code> parameter to identify the case to which to add communication. You can list a set of email addresses to copy on the communication by using the <code>ccEmailAddresses</code> parameter. The <code>communicationBody</code> value contains the text of the communication.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AddCommunicationToCase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportAddCommunicationToCaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorCaseIdNotFound`, `AWSSupportErrorAttachmentSetIdNotFound`, `AWSSupportErrorAttachmentSetExpired`.
 
 @see AWSSupportAddCommunicationToCaseRequest
 @see AWSSupportAddCommunicationToCaseResponse
 */
- (AWSTask<AWSSupportAddCommunicationToCaseResponse *> *)addCommunicationToCase:(AWSSupportAddCommunicationToCaseRequest *)request;

/**
 <p>Adds additional customer communication to an AWS Support case. Use the <code>caseId</code> parameter to identify the case to which to add communication. You can list a set of email addresses to copy on the communication by using the <code>ccEmailAddresses</code> parameter. The <code>communicationBody</code> value contains the text of the communication.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AddCommunicationToCase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorCaseIdNotFound`, `AWSSupportErrorAttachmentSetIdNotFound`, `AWSSupportErrorAttachmentSetExpired`.
 
 @see AWSSupportAddCommunicationToCaseRequest
 @see AWSSupportAddCommunicationToCaseResponse
 */
- (void)addCommunicationToCase:(AWSSupportAddCommunicationToCaseRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportAddCommunicationToCaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a case in the AWS Support Center. This operation is similar to how you create a case in the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p><p>The AWS Support API doesn't support requesting service limit increases. You can submit a service limit increase in the following ways: </p><ul><li><p>Submit a request from the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p></li><li><p>Use the Service Quotas <a href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_RequestServiceQuotaIncrease.html">RequestServiceQuotaIncrease</a> operation.</p></li></ul><p>A successful <code>CreateCase</code> request returns an AWS Support case number. You can use the <a>DescribeCases</a> operation and specify the case number to get existing AWS Support cases. After you create a case, use the <a>AddCommunicationToCase</a> operation to add additional communication or attachments to an existing case.</p><p>The <code>caseId</code> is separate from the <code>displayId</code> that appears in the <a href="https://console.aws.amazon.com/support">AWS Support Center</a>. Use the <a>DescribeCases</a> operation to get the <code>displayId</code>.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateCase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportCreateCaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorCaseCreationLimitExceeded`, `AWSSupportErrorAttachmentSetIdNotFound`, `AWSSupportErrorAttachmentSetExpired`.
 
 @see AWSSupportCreateCaseRequest
 @see AWSSupportCreateCaseResponse
 */
- (AWSTask<AWSSupportCreateCaseResponse *> *)createCase:(AWSSupportCreateCaseRequest *)request;

/**
 <p>Creates a case in the AWS Support Center. This operation is similar to how you create a case in the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p><p>The AWS Support API doesn't support requesting service limit increases. You can submit a service limit increase in the following ways: </p><ul><li><p>Submit a request from the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p></li><li><p>Use the Service Quotas <a href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_RequestServiceQuotaIncrease.html">RequestServiceQuotaIncrease</a> operation.</p></li></ul><p>A successful <code>CreateCase</code> request returns an AWS Support case number. You can use the <a>DescribeCases</a> operation and specify the case number to get existing AWS Support cases. After you create a case, use the <a>AddCommunicationToCase</a> operation to add additional communication or attachments to an existing case.</p><p>The <code>caseId</code> is separate from the <code>displayId</code> that appears in the <a href="https://console.aws.amazon.com/support">AWS Support Center</a>. Use the <a>DescribeCases</a> operation to get the <code>displayId</code>.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateCase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorCaseCreationLimitExceeded`, `AWSSupportErrorAttachmentSetIdNotFound`, `AWSSupportErrorAttachmentSetExpired`.
 
 @see AWSSupportCreateCaseRequest
 @see AWSSupportCreateCaseResponse
 */
- (void)createCase:(AWSSupportCreateCaseRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportCreateCaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the attachment that has the specified ID. Attachments can include screenshots, error logs, or other files that describe your issue. Attachment IDs are generated by the case management system when you add an attachment to a case or case communication. Attachment IDs are returned in the <a>AttachmentDetails</a> objects that are returned by the <a>DescribeCommunications</a> operation.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportDescribeAttachmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorDescribeAttachmentLimitExceeded`, `AWSSupportErrorAttachmentIdNotFound`.
 
 @see AWSSupportDescribeAttachmentRequest
 @see AWSSupportDescribeAttachmentResponse
 */
- (AWSTask<AWSSupportDescribeAttachmentResponse *> *)describeAttachment:(AWSSupportDescribeAttachmentRequest *)request;

/**
 <p>Returns the attachment that has the specified ID. Attachments can include screenshots, error logs, or other files that describe your issue. Attachment IDs are generated by the case management system when you add an attachment to a case or case communication. Attachment IDs are returned in the <a>AttachmentDetails</a> objects that are returned by the <a>DescribeCommunications</a> operation.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorDescribeAttachmentLimitExceeded`, `AWSSupportErrorAttachmentIdNotFound`.
 
 @see AWSSupportDescribeAttachmentRequest
 @see AWSSupportDescribeAttachmentResponse
 */
- (void)describeAttachment:(AWSSupportDescribeAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportDescribeAttachmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of cases that you specify by passing one or more case IDs. You can use the <code>afterTime</code> and <code>beforeTime</code> parameters to filter the cases by date. You can set values for the <code>includeResolvedCases</code> and <code>includeCommunications</code> parameters to specify how much information to return.</p><p>The response returns the following in JSON format:</p><ul><li><p>One or more <a href="https://docs.aws.amazon.com/awssupport/latest/APIReference/API_CaseDetails.html">CaseDetails</a> data types.</p></li><li><p>One or more <code>nextToken</code> values, which specify where to paginate the returned records represented by the <code>CaseDetails</code> objects.</p></li></ul><p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request might return an error.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeCases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportDescribeCasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorCaseIdNotFound`.
 
 @see AWSSupportDescribeCasesRequest
 @see AWSSupportDescribeCasesResponse
 */
- (AWSTask<AWSSupportDescribeCasesResponse *> *)describeCases:(AWSSupportDescribeCasesRequest *)request;

/**
 <p>Returns a list of cases that you specify by passing one or more case IDs. You can use the <code>afterTime</code> and <code>beforeTime</code> parameters to filter the cases by date. You can set values for the <code>includeResolvedCases</code> and <code>includeCommunications</code> parameters to specify how much information to return.</p><p>The response returns the following in JSON format:</p><ul><li><p>One or more <a href="https://docs.aws.amazon.com/awssupport/latest/APIReference/API_CaseDetails.html">CaseDetails</a> data types.</p></li><li><p>One or more <code>nextToken</code> values, which specify where to paginate the returned records represented by the <code>CaseDetails</code> objects.</p></li></ul><p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request might return an error.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeCases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorCaseIdNotFound`.
 
 @see AWSSupportDescribeCasesRequest
 @see AWSSupportDescribeCasesResponse
 */
- (void)describeCases:(AWSSupportDescribeCasesRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportDescribeCasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns communications and attachments for one or more support cases. Use the <code>afterTime</code> and <code>beforeTime</code> parameters to filter by date. You can use the <code>caseId</code> parameter to restrict the results to a specific case.</p><p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request for data might cause an error.</p><p>You can use the <code>maxResults</code> and <code>nextToken</code> parameters to control the pagination of the results. Set <code>maxResults</code> to the number of cases that you want to display on each page, and use <code>nextToken</code> to specify the resumption of pagination.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeCommunications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportDescribeCommunicationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorCaseIdNotFound`.
 
 @see AWSSupportDescribeCommunicationsRequest
 @see AWSSupportDescribeCommunicationsResponse
 */
- (AWSTask<AWSSupportDescribeCommunicationsResponse *> *)describeCommunications:(AWSSupportDescribeCommunicationsRequest *)request;

/**
 <p>Returns communications and attachments for one or more support cases. Use the <code>afterTime</code> and <code>beforeTime</code> parameters to filter by date. You can use the <code>caseId</code> parameter to restrict the results to a specific case.</p><p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request for data might cause an error.</p><p>You can use the <code>maxResults</code> and <code>nextToken</code> parameters to control the pagination of the results. Set <code>maxResults</code> to the number of cases that you want to display on each page, and use <code>nextToken</code> to specify the resumption of pagination.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeCommunications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorCaseIdNotFound`.
 
 @see AWSSupportDescribeCommunicationsRequest
 @see AWSSupportDescribeCommunicationsResponse
 */
- (void)describeCommunications:(AWSSupportDescribeCommunicationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportDescribeCommunicationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the current list of AWS services and a list of service categories for each service. You then use service names and categories in your <a>CreateCase</a> requests. Each AWS service has its own set of categories.</p><p>The service codes and category codes correspond to the values that appear in the <b>Service</b> and <b>Category</b> lists on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page. The values in those fields don't necessarily match the service codes and categories returned by the <code>DescribeServices</code> operation. Always use the service codes and categories that the <code>DescribeServices</code> operation returns, so that you have the most recent set of service and category codes.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeServices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportDescribeServicesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeServicesRequest
 @see AWSSupportDescribeServicesResponse
 */
- (AWSTask<AWSSupportDescribeServicesResponse *> *)describeServices:(AWSSupportDescribeServicesRequest *)request;

/**
 <p>Returns the current list of AWS services and a list of service categories for each service. You then use service names and categories in your <a>CreateCase</a> requests. Each AWS service has its own set of categories.</p><p>The service codes and category codes correspond to the values that appear in the <b>Service</b> and <b>Category</b> lists on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page. The values in those fields don't necessarily match the service codes and categories returned by the <code>DescribeServices</code> operation. Always use the service codes and categories that the <code>DescribeServices</code> operation returns, so that you have the most recent set of service and category codes.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeServices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeServicesRequest
 @see AWSSupportDescribeServicesResponse
 */
- (void)describeServices:(AWSSupportDescribeServicesRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportDescribeServicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of severity levels that you can assign to an AWS Support case. The severity level for a case is also a field in the <a>CaseDetails</a> data type that you include for a <a>CreateCase</a> request.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeSeverityLevels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportDescribeSeverityLevelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeSeverityLevelsRequest
 @see AWSSupportDescribeSeverityLevelsResponse
 */
- (AWSTask<AWSSupportDescribeSeverityLevelsResponse *> *)describeSeverityLevels:(AWSSupportDescribeSeverityLevelsRequest *)request;

/**
 <p>Returns the list of severity levels that you can assign to an AWS Support case. The severity level for a case is also a field in the <a>CaseDetails</a> data type that you include for a <a>CreateCase</a> request.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeSeverityLevels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeSeverityLevelsRequest
 @see AWSSupportDescribeSeverityLevelsResponse
 */
- (void)describeSeverityLevels:(AWSSupportDescribeSeverityLevelsRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportDescribeSeverityLevelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the refresh status of the AWS Trusted Advisor checks that have the specified check IDs. You can get the check IDs by calling the <a>DescribeTrustedAdvisorChecks</a> operation.</p><p>Some checks are refreshed automatically, and you can't return their refresh statuses by using the <code>DescribeTrustedAdvisorCheckRefreshStatuses</code> operation. If you call this operation for these checks, you might see an <code>InvalidParameterValue</code> error.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckRefreshStatuses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest
 @see AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse
 */
- (AWSTask<AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse *> *)describeTrustedAdvisorCheckRefreshStatuses:(AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest *)request;

/**
 <p>Returns the refresh status of the AWS Trusted Advisor checks that have the specified check IDs. You can get the check IDs by calling the <a>DescribeTrustedAdvisorChecks</a> operation.</p><p>Some checks are refreshed automatically, and you can't return their refresh statuses by using the <code>DescribeTrustedAdvisorCheckRefreshStatuses</code> operation. If you call this operation for these checks, you might see an <code>InvalidParameterValue</code> error.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckRefreshStatuses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest
 @see AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse
 */
- (void)describeTrustedAdvisorCheckRefreshStatuses:(AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the results of the AWS Trusted Advisor check that has the specified check ID. You can get the check IDs by calling the <a>DescribeTrustedAdvisorChecks</a> operation.</p><p>The response contains a <a>TrustedAdvisorCheckResult</a> object, which contains these three objects:</p><ul><li><p><a>TrustedAdvisorCategorySpecificSummary</a></p></li><li><p><a>TrustedAdvisorResourceDetail</a></p></li><li><p><a>TrustedAdvisorResourcesSummary</a></p></li></ul><p>In addition, the response contains these fields:</p><ul><li><p><b>status</b> - The alert status of the check: "ok" (green), "warning" (yellow), "error" (red), or "not_available".</p></li><li><p><b>timestamp</b> - The time of the last refresh of the check.</p></li><li><p><b>checkId</b> - The unique identifier for the check.</p></li></ul><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckResult service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportDescribeTrustedAdvisorCheckResultResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeTrustedAdvisorCheckResultRequest
 @see AWSSupportDescribeTrustedAdvisorCheckResultResponse
 */
- (AWSTask<AWSSupportDescribeTrustedAdvisorCheckResultResponse *> *)describeTrustedAdvisorCheckResult:(AWSSupportDescribeTrustedAdvisorCheckResultRequest *)request;

/**
 <p>Returns the results of the AWS Trusted Advisor check that has the specified check ID. You can get the check IDs by calling the <a>DescribeTrustedAdvisorChecks</a> operation.</p><p>The response contains a <a>TrustedAdvisorCheckResult</a> object, which contains these three objects:</p><ul><li><p><a>TrustedAdvisorCategorySpecificSummary</a></p></li><li><p><a>TrustedAdvisorResourceDetail</a></p></li><li><p><a>TrustedAdvisorResourcesSummary</a></p></li></ul><p>In addition, the response contains these fields:</p><ul><li><p><b>status</b> - The alert status of the check: "ok" (green), "warning" (yellow), "error" (red), or "not_available".</p></li><li><p><b>timestamp</b> - The time of the last refresh of the check.</p></li><li><p><b>checkId</b> - The unique identifier for the check.</p></li></ul><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckResult service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeTrustedAdvisorCheckResultRequest
 @see AWSSupportDescribeTrustedAdvisorCheckResultResponse
 */
- (void)describeTrustedAdvisorCheckResult:(AWSSupportDescribeTrustedAdvisorCheckResultRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportDescribeTrustedAdvisorCheckResultResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the results for the AWS Trusted Advisor check summaries for the check IDs that you specified. You can get the check IDs by calling the <a>DescribeTrustedAdvisorChecks</a> operation.</p><p>The response contains an array of <a>TrustedAdvisorCheckSummary</a> objects.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckSummaries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportDescribeTrustedAdvisorCheckSummariesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeTrustedAdvisorCheckSummariesRequest
 @see AWSSupportDescribeTrustedAdvisorCheckSummariesResponse
 */
- (AWSTask<AWSSupportDescribeTrustedAdvisorCheckSummariesResponse *> *)describeTrustedAdvisorCheckSummaries:(AWSSupportDescribeTrustedAdvisorCheckSummariesRequest *)request;

/**
 <p>Returns the results for the AWS Trusted Advisor check summaries for the check IDs that you specified. You can get the check IDs by calling the <a>DescribeTrustedAdvisorChecks</a> operation.</p><p>The response contains an array of <a>TrustedAdvisorCheckSummary</a> objects.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckSummaries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeTrustedAdvisorCheckSummariesRequest
 @see AWSSupportDescribeTrustedAdvisorCheckSummariesResponse
 */
- (void)describeTrustedAdvisorCheckSummaries:(AWSSupportDescribeTrustedAdvisorCheckSummariesRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportDescribeTrustedAdvisorCheckSummariesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all available AWS Trusted Advisor checks, including the name, ID, category, description, and metadata. You must specify a language code. The AWS Support API currently supports English ("en") and Japanese ("ja"). The response contains a <a>TrustedAdvisorCheckDescription</a> object for each check. You must set the AWS Region to us-east-1.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorChecks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportDescribeTrustedAdvisorChecksResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeTrustedAdvisorChecksRequest
 @see AWSSupportDescribeTrustedAdvisorChecksResponse
 */
- (AWSTask<AWSSupportDescribeTrustedAdvisorChecksResponse *> *)describeTrustedAdvisorChecks:(AWSSupportDescribeTrustedAdvisorChecksRequest *)request;

/**
 <p>Returns information about all available AWS Trusted Advisor checks, including the name, ID, category, description, and metadata. You must specify a language code. The AWS Support API currently supports English ("en") and Japanese ("ja"). The response contains a <a>TrustedAdvisorCheckDescription</a> object for each check. You must set the AWS Region to us-east-1.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorChecks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportDescribeTrustedAdvisorChecksRequest
 @see AWSSupportDescribeTrustedAdvisorChecksResponse
 */
- (void)describeTrustedAdvisorChecks:(AWSSupportDescribeTrustedAdvisorChecksRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportDescribeTrustedAdvisorChecksResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Refreshes the AWS Trusted Advisor check that you specify using the check ID. You can get the check IDs by calling the <a>DescribeTrustedAdvisorChecks</a> operation.</p><note><p>Some checks are refreshed automatically. If you call the <code>RefreshTrustedAdvisorCheck</code> operation to refresh them, you might see the <code>InvalidParameterValue</code> error.</p></note><p>The response contains a <a>TrustedAdvisorCheckRefreshStatus</a> object.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the RefreshTrustedAdvisorCheck service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportRefreshTrustedAdvisorCheckResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportRefreshTrustedAdvisorCheckRequest
 @see AWSSupportRefreshTrustedAdvisorCheckResponse
 */
- (AWSTask<AWSSupportRefreshTrustedAdvisorCheckResponse *> *)refreshTrustedAdvisorCheck:(AWSSupportRefreshTrustedAdvisorCheckRequest *)request;

/**
 <p>Refreshes the AWS Trusted Advisor check that you specify using the check ID. You can get the check IDs by calling the <a>DescribeTrustedAdvisorChecks</a> operation.</p><note><p>Some checks are refreshed automatically. If you call the <code>RefreshTrustedAdvisorCheck</code> operation to refresh them, you might see the <code>InvalidParameterValue</code> error.</p></note><p>The response contains a <a>TrustedAdvisorCheckRefreshStatus</a> object.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the RefreshTrustedAdvisorCheck service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`.
 
 @see AWSSupportRefreshTrustedAdvisorCheckRequest
 @see AWSSupportRefreshTrustedAdvisorCheckResponse
 */
- (void)refreshTrustedAdvisorCheck:(AWSSupportRefreshTrustedAdvisorCheckRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportRefreshTrustedAdvisorCheckResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resolves a support case. This operation takes a <code>caseId</code> and returns the initial and final state of the case.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ResolveCase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSupportResolveCaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorCaseIdNotFound`.
 
 @see AWSSupportResolveCaseRequest
 @see AWSSupportResolveCaseResponse
 */
- (AWSTask<AWSSupportResolveCaseResponse *> *)resolveCase:(AWSSupportResolveCaseRequest *)request;

/**
 <p>Resolves a support case. This operation takes a <code>caseId</code> and returns the initial and final state of the case.</p><note><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that does not have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ResolveCase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSupportErrorDomain` domain and the following error code: `AWSSupportErrorInternalServer`, `AWSSupportErrorCaseIdNotFound`.
 
 @see AWSSupportResolveCaseRequest
 @see AWSSupportResolveCaseResponse
 */
- (void)resolveCase:(AWSSupportResolveCaseRequest *)request completionHandler:(void (^ _Nullable)(AWSSupportResolveCaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
