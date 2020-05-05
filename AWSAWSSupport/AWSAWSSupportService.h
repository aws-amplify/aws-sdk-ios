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
#import "AWSAWSSupportModel.h"
#import "AWSAWSSupportResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSAWSSupport
FOUNDATION_EXPORT NSString *const AWSAWSSupportSDKVersion;

/**
 <fullname>AWS Support</fullname><p>The AWS Support API reference is intended for programmers who need detailed information about the AWS Support operations and data types. This service enables you to manage your AWS Support cases programmatically. It uses HTTP methods that return results in JSON format.</p><important><ul><li><p>You must have a Business or Enterprise support plan to use the AWS Support API. </p></li><li><p>If you call the AWS Support API from an account that doesn't have a Business or Enterprise support plan, the <code>SubscriptionRequiredException</code> error message appears. For information about changing your support plan, see <a href="http://aws.amazon.com/premiumsupport/">AWS Support</a>.</p></li></ul></important><p>The AWS Support service also exposes a set of <a href="http://aws.amazon.com/premiumsupport/trustedadvisor/">Trusted Advisor</a> features. You can retrieve a list of checks and their descriptions, get check results, specify checks to refresh, and get the refresh status of checks.</p><p>The following list describes the AWS Support case management operations:</p><ul><li><p><b>Service names, issue categories, and available severity levels. </b>The <a>DescribeServices</a> and <a>DescribeSeverityLevels</a> operations return AWS service names, service codes, service categories, and problem severity levels. You use these values when you call the <a>CreateCase</a> operation.</p></li><li><p><b>Case creation, case details, and case resolution.</b> The <a>CreateCase</a>, <a>DescribeCases</a>, <a>DescribeAttachment</a>, and <a>ResolveCase</a> operations create AWS Support cases, retrieve information about cases, and resolve cases.</p></li><li><p><b>Case communication.</b> The <a>DescribeCommunications</a>, <a>AddCommunicationToCase</a>, and <a>AddAttachmentsToSet</a> operations retrieve and add communications and attachments to AWS Support cases.</p></li></ul><p>The following list describes the operations available from the AWS Support service for Trusted Advisor:</p><ul><li><p><a>DescribeTrustedAdvisorChecks</a> returns the list of checks that run against your AWS resources.</p></li><li><p>Using the <code>checkId</code> for a specific check returned by <a>DescribeTrustedAdvisorChecks</a>, you can call <a>DescribeTrustedAdvisorCheckResult</a> to obtain the results for the check you specified.</p></li><li><p><a>DescribeTrustedAdvisorCheckSummaries</a> returns summarized results for one or more Trusted Advisor checks.</p></li><li><p><a>RefreshTrustedAdvisorCheck</a> requests that Trusted Advisor rerun a specified check.</p></li><li><p><a>DescribeTrustedAdvisorCheckRefreshStatuses</a> reports the refresh status of one or more checks.</p></li></ul><p>For authentication of requests, AWS Support uses <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 Signing Process</a>.</p><p>See <a href="https://docs.aws.amazon.com/awssupport/latest/user/Welcome.html">About the AWS Support API</a> in the <i>AWS Support User Guide</i> for information about how to use this service to create and manage your support cases, and how to call Trusted Advisor for results of checks on your resources.</p>
 */
@interface AWSAWSSupport : AWSService

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

     let AWSSupport = AWSAWSSupport.default()

 *Objective-C*

     AWSAWSSupport *AWSSupport = [AWSAWSSupport defaultAWSSupport];

 @return The default service client.
 */
+ (instancetype)defaultAWSSupport;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAWSSupport.register(with: configuration!, forKey: "USWest2AWSSupport")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:@"USWest2AWSSupport"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AWSSupport = AWSAWSSupport(forKey: "USWest2AWSSupport")

 *Objective-C*

     AWSAWSSupport *AWSSupport = [AWSAWSSupport AWSSupportForKey:@"USWest2AWSSupport"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerAWSSupportWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerAWSSupportWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAWSSupport.register(with: configuration!, forKey: "USWest2AWSSupport")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:@"USWest2AWSSupport"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AWSSupport = AWSAWSSupport(forKey: "USWest2AWSSupport")

 *Objective-C*

     AWSAWSSupport *AWSSupport = [AWSAWSSupport AWSSupportForKey:@"USWest2AWSSupport"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)AWSSupportForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeAWSSupportForKey:(NSString *)key;

/**
 <p>Adds one or more attachments to an attachment set. </p><p>An attachment set is a temporary container for attachments that you add to a case or case communication. The set is available for 1 hour after it's created. The <code>expiryTime</code> returned in the response is when the set expires. </p>
 
 @param request A container for the necessary parameters to execute the AddAttachmentsToSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportAddAttachmentsToSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorAttachmentSetIdNotFound`, `AWSAWSSupportErrorAttachmentSetExpired`, `AWSAWSSupportErrorAttachmentSetSizeLimitExceeded`, `AWSAWSSupportErrorAttachmentLimitExceeded`.
 
 @see AWSAWSSupportAddAttachmentsToSetRequest
 @see AWSAWSSupportAddAttachmentsToSetResponse
 */
- (AWSTask<AWSAWSSupportAddAttachmentsToSetResponse *> *)addAttachmentsToSet:(AWSAWSSupportAddAttachmentsToSetRequest *)request;

/**
 <p>Adds one or more attachments to an attachment set. </p><p>An attachment set is a temporary container for attachments that you add to a case or case communication. The set is available for 1 hour after it's created. The <code>expiryTime</code> returned in the response is when the set expires. </p>
 
 @param request A container for the necessary parameters to execute the AddAttachmentsToSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorAttachmentSetIdNotFound`, `AWSAWSSupportErrorAttachmentSetExpired`, `AWSAWSSupportErrorAttachmentSetSizeLimitExceeded`, `AWSAWSSupportErrorAttachmentLimitExceeded`.
 
 @see AWSAWSSupportAddAttachmentsToSetRequest
 @see AWSAWSSupportAddAttachmentsToSetResponse
 */
- (void)addAttachmentsToSet:(AWSAWSSupportAddAttachmentsToSetRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportAddAttachmentsToSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds additional customer communication to an AWS Support case. You use the <code>caseId</code> value to identify the case to add communication to. You can list a set of email addresses to copy on the communication using the <code>ccEmailAddresses</code> value. The <code>communicationBody</code> value contains the text of the communication.</p><p>The response indicates the success or failure of the request.</p><p>This operation implements a subset of the features of the AWS Support Center.</p>
 
 @param request A container for the necessary parameters to execute the AddCommunicationToCase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportAddCommunicationToCaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorCaseIdNotFound`, `AWSAWSSupportErrorAttachmentSetIdNotFound`, `AWSAWSSupportErrorAttachmentSetExpired`.
 
 @see AWSAWSSupportAddCommunicationToCaseRequest
 @see AWSAWSSupportAddCommunicationToCaseResponse
 */
- (AWSTask<AWSAWSSupportAddCommunicationToCaseResponse *> *)addCommunicationToCase:(AWSAWSSupportAddCommunicationToCaseRequest *)request;

/**
 <p>Adds additional customer communication to an AWS Support case. You use the <code>caseId</code> value to identify the case to add communication to. You can list a set of email addresses to copy on the communication using the <code>ccEmailAddresses</code> value. The <code>communicationBody</code> value contains the text of the communication.</p><p>The response indicates the success or failure of the request.</p><p>This operation implements a subset of the features of the AWS Support Center.</p>
 
 @param request A container for the necessary parameters to execute the AddCommunicationToCase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorCaseIdNotFound`, `AWSAWSSupportErrorAttachmentSetIdNotFound`, `AWSAWSSupportErrorAttachmentSetExpired`.
 
 @see AWSAWSSupportAddCommunicationToCaseRequest
 @see AWSAWSSupportAddCommunicationToCaseResponse
 */
- (void)addCommunicationToCase:(AWSAWSSupportAddCommunicationToCaseRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportAddCommunicationToCaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a case in the AWS Support Center. This operation is similar to how you create a case in the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p><p>The AWS Support API doesn't support requesting service limit increases. You can submit a service limit increase in the following ways: </p><ul><li><p>Submit a request from the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p></li><li><p>Use the Service Quotas <a href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_RequestServiceQuotaIncrease.html">RequestServiceQuotaIncrease</a> operation.</p></li></ul><p>A successful <a>CreateCase</a> request returns an AWS Support case number. You can use the <a>DescribeCases</a> operation and specify the case number to get existing AWS Support cases. After you create a case, you can use the <a>AddCommunicationToCase</a> operation to add additional communication or attachments to an existing case.</p><note><ul><li><p>The <code>caseId</code> is separate from the <code>displayId</code> that appears in the <a href="https://console.aws.amazon.com/support">Support Center</a>. You can use the <a>DescribeCases</a> operation to get the <code>displayId</code>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateCase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportCreateCaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorCaseCreationLimitExceeded`, `AWSAWSSupportErrorAttachmentSetIdNotFound`, `AWSAWSSupportErrorAttachmentSetExpired`.
 
 @see AWSAWSSupportCreateCaseRequest
 @see AWSAWSSupportCreateCaseResponse
 */
- (AWSTask<AWSAWSSupportCreateCaseResponse *> *)createCase:(AWSAWSSupportCreateCaseRequest *)request;

/**
 <p>Creates a case in the AWS Support Center. This operation is similar to how you create a case in the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p><p>The AWS Support API doesn't support requesting service limit increases. You can submit a service limit increase in the following ways: </p><ul><li><p>Submit a request from the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p></li><li><p>Use the Service Quotas <a href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_RequestServiceQuotaIncrease.html">RequestServiceQuotaIncrease</a> operation.</p></li></ul><p>A successful <a>CreateCase</a> request returns an AWS Support case number. You can use the <a>DescribeCases</a> operation and specify the case number to get existing AWS Support cases. After you create a case, you can use the <a>AddCommunicationToCase</a> operation to add additional communication or attachments to an existing case.</p><note><ul><li><p>The <code>caseId</code> is separate from the <code>displayId</code> that appears in the <a href="https://console.aws.amazon.com/support">Support Center</a>. You can use the <a>DescribeCases</a> operation to get the <code>displayId</code>.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateCase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorCaseCreationLimitExceeded`, `AWSAWSSupportErrorAttachmentSetIdNotFound`, `AWSAWSSupportErrorAttachmentSetExpired`.
 
 @see AWSAWSSupportCreateCaseRequest
 @see AWSAWSSupportCreateCaseResponse
 */
- (void)createCase:(AWSAWSSupportCreateCaseRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportCreateCaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the attachment that has the specified ID. Attachments can include screenshots, error logs, or other files that describe your issue. Attachment IDs are generated by the case management system when you add an attachment to a case or case communication. Attachment IDs are returned in the <a>AttachmentDetails</a> objects that are returned by the <a>DescribeCommunications</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportDescribeAttachmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorDescribeAttachmentLimitExceeded`, `AWSAWSSupportErrorAttachmentIdNotFound`.
 
 @see AWSAWSSupportDescribeAttachmentRequest
 @see AWSAWSSupportDescribeAttachmentResponse
 */
- (AWSTask<AWSAWSSupportDescribeAttachmentResponse *> *)describeAttachment:(AWSAWSSupportDescribeAttachmentRequest *)request;

/**
 <p>Returns the attachment that has the specified ID. Attachments can include screenshots, error logs, or other files that describe your issue. Attachment IDs are generated by the case management system when you add an attachment to a case or case communication. Attachment IDs are returned in the <a>AttachmentDetails</a> objects that are returned by the <a>DescribeCommunications</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorDescribeAttachmentLimitExceeded`, `AWSAWSSupportErrorAttachmentIdNotFound`.
 
 @see AWSAWSSupportDescribeAttachmentRequest
 @see AWSAWSSupportDescribeAttachmentResponse
 */
- (void)describeAttachment:(AWSAWSSupportDescribeAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportDescribeAttachmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of cases that you specify by passing one or more case IDs. In addition, you can filter the cases by date by setting values for the <code>afterTime</code> and <code>beforeTime</code> request parameters. You can set values for the <code>includeResolvedCases</code> and <code>includeCommunications</code> request parameters to control how much information is returned.</p><p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request for data might cause an error.</p><p>The response returns the following in JSON format:</p><ul><li><p>One or more <a>CaseDetails</a> data types.</p></li><li><p>One or more <code>nextToken</code> values, which specify where to paginate the returned records represented by the <code>CaseDetails</code> objects.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeCases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportDescribeCasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorCaseIdNotFound`.
 
 @see AWSAWSSupportDescribeCasesRequest
 @see AWSAWSSupportDescribeCasesResponse
 */
- (AWSTask<AWSAWSSupportDescribeCasesResponse *> *)describeCases:(AWSAWSSupportDescribeCasesRequest *)request;

/**
 <p>Returns a list of cases that you specify by passing one or more case IDs. In addition, you can filter the cases by date by setting values for the <code>afterTime</code> and <code>beforeTime</code> request parameters. You can set values for the <code>includeResolvedCases</code> and <code>includeCommunications</code> request parameters to control how much information is returned.</p><p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request for data might cause an error.</p><p>The response returns the following in JSON format:</p><ul><li><p>One or more <a>CaseDetails</a> data types.</p></li><li><p>One or more <code>nextToken</code> values, which specify where to paginate the returned records represented by the <code>CaseDetails</code> objects.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeCases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorCaseIdNotFound`.
 
 @see AWSAWSSupportDescribeCasesRequest
 @see AWSAWSSupportDescribeCasesResponse
 */
- (void)describeCases:(AWSAWSSupportDescribeCasesRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportDescribeCasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns communications (and attachments) for one or more support cases. You can use the <code>afterTime</code> and <code>beforeTime</code> parameters to filter by date. You can use the <code>caseId</code> parameter to restrict the results to a particular case.</p><p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request for data might cause an error.</p><p>You can use the <code>maxResults</code> and <code>nextToken</code> parameters to control the pagination of the result set. Set <code>maxResults</code> to the number of cases you want displayed on each page, and use <code>nextToken</code> to specify the resumption of pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCommunications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportDescribeCommunicationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorCaseIdNotFound`.
 
 @see AWSAWSSupportDescribeCommunicationsRequest
 @see AWSAWSSupportDescribeCommunicationsResponse
 */
- (AWSTask<AWSAWSSupportDescribeCommunicationsResponse *> *)describeCommunications:(AWSAWSSupportDescribeCommunicationsRequest *)request;

/**
 <p>Returns communications (and attachments) for one or more support cases. You can use the <code>afterTime</code> and <code>beforeTime</code> parameters to filter by date. You can use the <code>caseId</code> parameter to restrict the results to a particular case.</p><p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request for data might cause an error.</p><p>You can use the <code>maxResults</code> and <code>nextToken</code> parameters to control the pagination of the result set. Set <code>maxResults</code> to the number of cases you want displayed on each page, and use <code>nextToken</code> to specify the resumption of pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCommunications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorCaseIdNotFound`.
 
 @see AWSAWSSupportDescribeCommunicationsRequest
 @see AWSAWSSupportDescribeCommunicationsResponse
 */
- (void)describeCommunications:(AWSAWSSupportDescribeCommunicationsRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportDescribeCommunicationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the current list of AWS services and a list of service categories that applies to each one. You then use service names and categories in your <a>CreateCase</a> requests. Each AWS service has its own set of categories.</p><p>The service codes and category codes correspond to the values that are displayed in the <b>Service</b> and <b>Category</b> drop-down lists on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page. The values in those fields, however, do not necessarily match the service codes and categories returned by the <code>DescribeServices</code> request. Always use the service codes and categories obtained programmatically. This practice ensures that you always have the most recent set of service and category codes.</p>
 
 @param request A container for the necessary parameters to execute the DescribeServices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportDescribeServicesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeServicesRequest
 @see AWSAWSSupportDescribeServicesResponse
 */
- (AWSTask<AWSAWSSupportDescribeServicesResponse *> *)describeServices:(AWSAWSSupportDescribeServicesRequest *)request;

/**
 <p>Returns the current list of AWS services and a list of service categories that applies to each one. You then use service names and categories in your <a>CreateCase</a> requests. Each AWS service has its own set of categories.</p><p>The service codes and category codes correspond to the values that are displayed in the <b>Service</b> and <b>Category</b> drop-down lists on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page. The values in those fields, however, do not necessarily match the service codes and categories returned by the <code>DescribeServices</code> request. Always use the service codes and categories obtained programmatically. This practice ensures that you always have the most recent set of service and category codes.</p>
 
 @param request A container for the necessary parameters to execute the DescribeServices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeServicesRequest
 @see AWSAWSSupportDescribeServicesResponse
 */
- (void)describeServices:(AWSAWSSupportDescribeServicesRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportDescribeServicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of severity levels that you can assign to an AWS Support case. The severity level for a case is also a field in the <a>CaseDetails</a> data type included in any <a>CreateCase</a> request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSeverityLevels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportDescribeSeverityLevelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeSeverityLevelsRequest
 @see AWSAWSSupportDescribeSeverityLevelsResponse
 */
- (AWSTask<AWSAWSSupportDescribeSeverityLevelsResponse *> *)describeSeverityLevels:(AWSAWSSupportDescribeSeverityLevelsRequest *)request;

/**
 <p>Returns the list of severity levels that you can assign to an AWS Support case. The severity level for a case is also a field in the <a>CaseDetails</a> data type included in any <a>CreateCase</a> request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSeverityLevels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeSeverityLevelsRequest
 @see AWSAWSSupportDescribeSeverityLevelsResponse
 */
- (void)describeSeverityLevels:(AWSAWSSupportDescribeSeverityLevelsRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportDescribeSeverityLevelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the refresh status of the Trusted Advisor checks that have the specified check IDs. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p><note><p>Some checks are refreshed automatically, and their refresh statuses cannot be retrieved by using this operation. Use of the <code>DescribeTrustedAdvisorCheckRefreshStatuses</code> operation for these checks causes an <code>InvalidParameterValue</code> error.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckRefreshStatuses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest
 @see AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse
 */
- (AWSTask<AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse *> *)describeTrustedAdvisorCheckRefreshStatuses:(AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest *)request;

/**
 <p>Returns the refresh status of the Trusted Advisor checks that have the specified check IDs. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p><note><p>Some checks are refreshed automatically, and their refresh statuses cannot be retrieved by using this operation. Use of the <code>DescribeTrustedAdvisorCheckRefreshStatuses</code> operation for these checks causes an <code>InvalidParameterValue</code> error.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckRefreshStatuses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest
 @see AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse
 */
- (void)describeTrustedAdvisorCheckRefreshStatuses:(AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the results of the Trusted Advisor check that has the specified check ID. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p><p>The response contains a <a>TrustedAdvisorCheckResult</a> object, which contains these three objects:</p><ul><li><p><a>TrustedAdvisorCategorySpecificSummary</a></p></li><li><p><a>TrustedAdvisorResourceDetail</a></p></li><li><p><a>TrustedAdvisorResourcesSummary</a></p></li></ul><p>In addition, the response contains these fields:</p><ul><li><p><b>status.</b> The alert status of the check: "ok" (green), "warning" (yellow), "error" (red), or "not_available".</p></li><li><p><b>timestamp.</b> The time of the last refresh of the check.</p></li><li><p><b>checkId.</b> The unique identifier for the check.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckResult service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeTrustedAdvisorCheckResultRequest
 @see AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse
 */
- (AWSTask<AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse *> *)describeTrustedAdvisorCheckResult:(AWSAWSSupportDescribeTrustedAdvisorCheckResultRequest *)request;

/**
 <p>Returns the results of the Trusted Advisor check that has the specified check ID. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p><p>The response contains a <a>TrustedAdvisorCheckResult</a> object, which contains these three objects:</p><ul><li><p><a>TrustedAdvisorCategorySpecificSummary</a></p></li><li><p><a>TrustedAdvisorResourceDetail</a></p></li><li><p><a>TrustedAdvisorResourcesSummary</a></p></li></ul><p>In addition, the response contains these fields:</p><ul><li><p><b>status.</b> The alert status of the check: "ok" (green), "warning" (yellow), "error" (red), or "not_available".</p></li><li><p><b>timestamp.</b> The time of the last refresh of the check.</p></li><li><p><b>checkId.</b> The unique identifier for the check.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckResult service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeTrustedAdvisorCheckResultRequest
 @see AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse
 */
- (void)describeTrustedAdvisorCheckResult:(AWSAWSSupportDescribeTrustedAdvisorCheckResultRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the summaries of the results of the Trusted Advisor checks that have the specified check IDs. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p><p>The response contains an array of <a>TrustedAdvisorCheckSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckSummaries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeTrustedAdvisorCheckSummariesRequest
 @see AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse
 */
- (AWSTask<AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse *> *)describeTrustedAdvisorCheckSummaries:(AWSAWSSupportDescribeTrustedAdvisorCheckSummariesRequest *)request;

/**
 <p>Returns the summaries of the results of the Trusted Advisor checks that have the specified check IDs. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p><p>The response contains an array of <a>TrustedAdvisorCheckSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorCheckSummaries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeTrustedAdvisorCheckSummariesRequest
 @see AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse
 */
- (void)describeTrustedAdvisorCheckSummaries:(AWSAWSSupportDescribeTrustedAdvisorCheckSummariesRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all available Trusted Advisor checks, including name, ID, category, description, and metadata. You must specify a language code; English ("en") and Japanese ("ja") are currently supported. The response contains a <a>TrustedAdvisorCheckDescription</a> for each check. The region must be set to us-east-1.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorChecks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportDescribeTrustedAdvisorChecksResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeTrustedAdvisorChecksRequest
 @see AWSAWSSupportDescribeTrustedAdvisorChecksResponse
 */
- (AWSTask<AWSAWSSupportDescribeTrustedAdvisorChecksResponse *> *)describeTrustedAdvisorChecks:(AWSAWSSupportDescribeTrustedAdvisorChecksRequest *)request;

/**
 <p>Returns information about all available Trusted Advisor checks, including name, ID, category, description, and metadata. You must specify a language code; English ("en") and Japanese ("ja") are currently supported. The response contains a <a>TrustedAdvisorCheckDescription</a> for each check. The region must be set to us-east-1.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrustedAdvisorChecks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportDescribeTrustedAdvisorChecksRequest
 @see AWSAWSSupportDescribeTrustedAdvisorChecksResponse
 */
- (void)describeTrustedAdvisorChecks:(AWSAWSSupportDescribeTrustedAdvisorChecksRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportDescribeTrustedAdvisorChecksResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Requests a refresh of the Trusted Advisor check that has the specified check ID. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p><note><p>Some checks are refreshed automatically, and they cannot be refreshed by using this operation. Use of the <code>RefreshTrustedAdvisorCheck</code> operation for these checks causes an <code>InvalidParameterValue</code> error.</p></note><p>The response contains a <a>TrustedAdvisorCheckRefreshStatus</a> object, which contains these fields:</p><ul><li><p><b>status.</b> The refresh status of the check: </p><ul><li><p><code>none:</code> The check is not refreshed or the non-success status exceeds the timeout</p></li><li><p><code>enqueued:</code> The check refresh requests has entered the refresh queue</p></li><li><p><code>processing:</code> The check refresh request is picked up by the rule processing engine</p></li><li><p><code>success:</code> The check is successfully refreshed</p></li><li><p><code>abandoned:</code> The check refresh has failed</p></li></ul></li><li><p><b>millisUntilNextRefreshable.</b> The amount of time, in milliseconds, until the check is eligible for refresh.</p></li><li><p><b>checkId.</b> The unique identifier for the check.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the RefreshTrustedAdvisorCheck service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportRefreshTrustedAdvisorCheckResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportRefreshTrustedAdvisorCheckRequest
 @see AWSAWSSupportRefreshTrustedAdvisorCheckResponse
 */
- (AWSTask<AWSAWSSupportRefreshTrustedAdvisorCheckResponse *> *)refreshTrustedAdvisorCheck:(AWSAWSSupportRefreshTrustedAdvisorCheckRequest *)request;

/**
 <p>Requests a refresh of the Trusted Advisor check that has the specified check ID. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p><note><p>Some checks are refreshed automatically, and they cannot be refreshed by using this operation. Use of the <code>RefreshTrustedAdvisorCheck</code> operation for these checks causes an <code>InvalidParameterValue</code> error.</p></note><p>The response contains a <a>TrustedAdvisorCheckRefreshStatus</a> object, which contains these fields:</p><ul><li><p><b>status.</b> The refresh status of the check: </p><ul><li><p><code>none:</code> The check is not refreshed or the non-success status exceeds the timeout</p></li><li><p><code>enqueued:</code> The check refresh requests has entered the refresh queue</p></li><li><p><code>processing:</code> The check refresh request is picked up by the rule processing engine</p></li><li><p><code>success:</code> The check is successfully refreshed</p></li><li><p><code>abandoned:</code> The check refresh has failed</p></li></ul></li><li><p><b>millisUntilNextRefreshable.</b> The amount of time, in milliseconds, until the check is eligible for refresh.</p></li><li><p><b>checkId.</b> The unique identifier for the check.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the RefreshTrustedAdvisorCheck service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`.
 
 @see AWSAWSSupportRefreshTrustedAdvisorCheckRequest
 @see AWSAWSSupportRefreshTrustedAdvisorCheckResponse
 */
- (void)refreshTrustedAdvisorCheck:(AWSAWSSupportRefreshTrustedAdvisorCheckRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportRefreshTrustedAdvisorCheckResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Takes a <code>caseId</code> and returns the initial state of the case along with the state of the case after the call to <a>ResolveCase</a> completed.</p>
 
 @param request A container for the necessary parameters to execute the ResolveCase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSSupportResolveCaseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorCaseIdNotFound`.
 
 @see AWSAWSSupportResolveCaseRequest
 @see AWSAWSSupportResolveCaseResponse
 */
- (AWSTask<AWSAWSSupportResolveCaseResponse *> *)resolveCase:(AWSAWSSupportResolveCaseRequest *)request;

/**
 <p>Takes a <code>caseId</code> and returns the initial state of the case along with the state of the case after the call to <a>ResolveCase</a> completed.</p>
 
 @param request A container for the necessary parameters to execute the ResolveCase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSSupportErrorDomain` domain and the following error code: `AWSAWSSupportErrorInternalServer`, `AWSAWSSupportErrorCaseIdNotFound`.
 
 @see AWSAWSSupportResolveCaseRequest
 @see AWSAWSSupportResolveCaseResponse
 */
- (void)resolveCase:(AWSAWSSupportResolveCaseRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSSupportResolveCaseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
