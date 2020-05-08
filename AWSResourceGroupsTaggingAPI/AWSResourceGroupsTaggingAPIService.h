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
#import "AWSResourceGroupsTaggingAPIModel.h"
#import "AWSResourceGroupsTaggingAPIResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSResourceGroupsTaggingAPI
FOUNDATION_EXPORT NSString *const AWSResourceGroupsTaggingAPISDKVersion;

/**
 <fullname>Resource Groups Tagging API</fullname><p>This guide describes the API operations for the resource groups tagging.</p><p>A tag is a label that you assign to an AWS resource. A tag consists of a key and a value, both of which you define. For example, if you have two Amazon EC2 instances, you might assign both a tag key of "Stack." But the value of "Stack" might be "Testing" for one and "Production" for the other.</p><p>Tagging can help you organize your resources and enables you to simplify resource management, access management and cost allocation. </p><p>You can use the resource groups tagging API operations to complete the following tasks:</p><ul><li><p>Tag and untag supported resources located in the specified Region for the AWS account.</p></li><li><p>Use tag-based filters to search for resources located in the specified Region for the AWS account.</p></li><li><p>List all existing tag keys in the specified Region for the AWS account.</p></li><li><p>List all existing values for the specified key in the specified Region for the AWS account.</p></li></ul><p>To use resource groups tagging API operations, you must add the following permissions to your IAM policy:</p><ul><li><p><code>tag:GetResources</code></p></li><li><p><code>tag:TagResources</code></p></li><li><p><code>tag:UntagResources</code></p></li><li><p><code>tag:GetTagKeys</code></p></li><li><p><code>tag:GetTagValues</code></p></li></ul><p>You'll also need permissions to access the resources of individual services so that you can tag and untag those resources.</p><p>For more information on IAM policies, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage.html">Managing IAM Policies</a> in the <i>IAM User Guide</i>.</p><p>You can use the Resource Groups Tagging API to tag resources for the following AWS services.</p><ul><li><p>Alexa for Business (a4b)</p></li><li><p>API Gateway</p></li><li><p>Amazon AppStream</p></li><li><p>AWS AppSync</p></li><li><p>AWS App Mesh</p></li><li><p>Amazon Athena</p></li><li><p>Amazon Aurora</p></li><li><p>AWS Backup</p></li><li><p>AWS Certificate Manager</p></li><li><p>AWS Certificate Manager Private CA</p></li><li><p>Amazon Cloud Directory</p></li><li><p>AWS CloudFormation</p></li><li><p>Amazon CloudFront</p></li><li><p>AWS CloudHSM</p></li><li><p>AWS CloudTrail</p></li><li><p>Amazon CloudWatch (alarms only)</p></li><li><p>Amazon CloudWatch Events</p></li><li><p>Amazon CloudWatch Logs</p></li><li><p>AWS CodeBuild</p></li><li><p>AWS CodeCommit</p></li><li><p>AWS CodePipeline</p></li><li><p>AWS CodeStar</p></li><li><p>Amazon Cognito Identity</p></li><li><p>Amazon Cognito User Pools</p></li><li><p>Amazon Comprehend</p></li><li><p>AWS Config</p></li><li><p>AWS Data Exchange</p></li><li><p>AWS Data Pipeline</p></li><li><p>AWS Database Migration Service</p></li><li><p>AWS DataSync</p></li><li><p>AWS Device Farm</p></li><li><p>AWS Direct Connect</p></li><li><p>AWS Directory Service</p></li><li><p>Amazon DynamoDB</p></li><li><p>Amazon EBS</p></li><li><p>Amazon EC2</p></li><li><p>Amazon ECR</p></li><li><p>Amazon ECS</p></li><li><p>Amazon EKS</p></li><li><p>AWS Elastic Beanstalk</p></li><li><p>Amazon Elastic File System</p></li><li><p>Elastic Load Balancing</p></li><li><p>Amazon ElastiCache</p></li><li><p>Amazon Elasticsearch Service</p></li><li><p>AWS Elemental MediaLive</p></li><li><p>AWS Elemental MediaPackage</p></li><li><p>AWS Elemental MediaTailor</p></li><li><p>Amazon EMR</p></li><li><p>Amazon FSx</p></li><li><p>Amazon S3 Glacier</p></li><li><p>AWS Glue</p></li><li><p>Amazon GuardDuty</p></li><li><p>Amazon Inspector</p></li><li><p>AWS IoT Analytics</p></li><li><p>AWS IoT Core</p></li><li><p>AWS IoT Device Defender</p></li><li><p>AWS IoT Device Management</p></li><li><p>AWS IoT Events</p></li><li><p>AWS IoT Greengrass</p></li><li><p>AWS IoT 1-Click</p></li><li><p>AWS IoT Things Graph</p></li><li><p>AWS Key Management Service</p></li><li><p>Amazon Kinesis</p></li><li><p>Amazon Kinesis Data Analytics</p></li><li><p>Amazon Kinesis Data Firehose</p></li><li><p>AWS Lambda</p></li><li><p>AWS License Manager</p></li><li><p>Amazon Machine Learning</p></li><li><p>Amazon MQ</p></li><li><p>Amazon MSK</p></li><li><p>Amazon Neptune</p></li><li><p>AWS OpsWorks</p></li><li><p>AWS Organizations</p></li><li><p>Amazon Quantum Ledger Database (QLDB)</p></li><li><p>Amazon RDS</p></li><li><p>Amazon Redshift</p></li><li><p>AWS Resource Access Manager</p></li><li><p>AWS Resource Groups</p></li><li><p>AWS RoboMaker</p></li><li><p>Amazon Route 53</p></li><li><p>Amazon Route 53 Resolver</p></li><li><p>Amazon S3 (buckets only)</p></li><li><p>Amazon SageMaker</p></li><li><p>AWS Secrets Manager</p></li><li><p>AWS Security Hub</p></li><li><p>AWS Service Catalog</p></li><li><p>Amazon Simple Email Service (SES)</p></li><li><p>Amazon Simple Notification Service (SNS)</p></li><li><p>Amazon Simple Queue Service (SQS)</p></li><li><p>Amazon Simple Workflow Service</p></li><li><p>AWS Step Functions</p></li><li><p>AWS Storage Gateway</p></li><li><p>AWS Systems Manager</p></li><li><p>AWS Transfer for SFTP</p></li><li><p>AWS WAF Regional</p></li><li><p>Amazon VPC</p></li><li><p>Amazon WorkSpaces</p></li></ul>
 */
@interface AWSResourceGroupsTaggingAPI : AWSService

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

     let ResourceGroupsTaggingAPI = AWSResourceGroupsTaggingAPI.default()

 *Objective-C*

     AWSResourceGroupsTaggingAPI *ResourceGroupsTaggingAPI = [AWSResourceGroupsTaggingAPI defaultResourceGroupsTaggingAPI];

 @return The default service client.
 */
+ (instancetype)defaultResourceGroupsTaggingAPI;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSResourceGroupsTaggingAPI.register(with: configuration!, forKey: "USWest2ResourceGroupsTaggingAPI")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:@"USWest2ResourceGroupsTaggingAPI"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ResourceGroupsTaggingAPI = AWSResourceGroupsTaggingAPI(forKey: "USWest2ResourceGroupsTaggingAPI")

 *Objective-C*

     AWSResourceGroupsTaggingAPI *ResourceGroupsTaggingAPI = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:@"USWest2ResourceGroupsTaggingAPI"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerResourceGroupsTaggingAPIWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerResourceGroupsTaggingAPIWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSResourceGroupsTaggingAPI.register(with: configuration!, forKey: "USWest2ResourceGroupsTaggingAPI")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:@"USWest2ResourceGroupsTaggingAPI"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ResourceGroupsTaggingAPI = AWSResourceGroupsTaggingAPI(forKey: "USWest2ResourceGroupsTaggingAPI")

 *Objective-C*

     AWSResourceGroupsTaggingAPI *ResourceGroupsTaggingAPI = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:@"USWest2ResourceGroupsTaggingAPI"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ResourceGroupsTaggingAPIForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeResourceGroupsTaggingAPIForKey:(NSString *)key;

/**
 <p>Describes the status of the <code>StartReportCreation</code> operation. </p><p>You can call this operation only from the organization's master account and from the us-east-1 Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReportCreation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSResourceGroupsTaggingAPIDescribeReportCreationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorConstraintViolation`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`.
 
 @see AWSResourceGroupsTaggingAPIDescribeReportCreationInput
 @see AWSResourceGroupsTaggingAPIDescribeReportCreationOutput
 */
- (AWSTask<AWSResourceGroupsTaggingAPIDescribeReportCreationOutput *> *)describeReportCreation:(AWSResourceGroupsTaggingAPIDescribeReportCreationInput *)request;

/**
 <p>Describes the status of the <code>StartReportCreation</code> operation. </p><p>You can call this operation only from the organization's master account and from the us-east-1 Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReportCreation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorConstraintViolation`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`.
 
 @see AWSResourceGroupsTaggingAPIDescribeReportCreationInput
 @see AWSResourceGroupsTaggingAPIDescribeReportCreationOutput
 */
- (void)describeReportCreation:(AWSResourceGroupsTaggingAPIDescribeReportCreationInput *)request completionHandler:(void (^ _Nullable)(AWSResourceGroupsTaggingAPIDescribeReportCreationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a table that shows counts of resources that are noncompliant with their tag policies.</p><p>For more information on tag policies, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">Tag Policies</a> in the <i>AWS Organizations User Guide.</i></p><p>You can call this operation only from the organization's master account and from the us-east-1 Region.</p>
 
 @param request A container for the necessary parameters to execute the GetComplianceSummary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorConstraintViolation`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`.
 
 @see AWSResourceGroupsTaggingAPIGetComplianceSummaryInput
 @see AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput
 */
- (AWSTask<AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput *> *)getComplianceSummary:(AWSResourceGroupsTaggingAPIGetComplianceSummaryInput *)request;

/**
 <p>Returns a table that shows counts of resources that are noncompliant with their tag policies.</p><p>For more information on tag policies, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">Tag Policies</a> in the <i>AWS Organizations User Guide.</i></p><p>You can call this operation only from the organization's master account and from the us-east-1 Region.</p>
 
 @param request A container for the necessary parameters to execute the GetComplianceSummary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorConstraintViolation`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`.
 
 @see AWSResourceGroupsTaggingAPIGetComplianceSummaryInput
 @see AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput
 */
- (void)getComplianceSummary:(AWSResourceGroupsTaggingAPIGetComplianceSummaryInput *)request completionHandler:(void (^ _Nullable)(AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all the tagged or previously tagged resources that are located in the specified Region for the AWS account.</p><p>Depending on what information you want returned, you can also specify the following:</p><ul><li><p><i>Filters</i> that specify what tags and resource types you want returned. The response includes all tags that are associated with the requested resources.</p></li><li><p>Information about compliance with the account's effective tag policy. For more information on tag policies, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">Tag Policies</a> in the <i>AWS Organizations User Guide.</i></p></li></ul><note><p>You can check the <code>PaginationToken</code> response parameter to determine if a query is complete. Queries occasionally return fewer results on a page than allowed. The <code>PaginationToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display. </p></note>
 
 @param request A container for the necessary parameters to execute the GetResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSResourceGroupsTaggingAPIGetResourcesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorPaginationTokenExpired`.
 
 @see AWSResourceGroupsTaggingAPIGetResourcesInput
 @see AWSResourceGroupsTaggingAPIGetResourcesOutput
 */
- (AWSTask<AWSResourceGroupsTaggingAPIGetResourcesOutput *> *)getResources:(AWSResourceGroupsTaggingAPIGetResourcesInput *)request;

/**
 <p>Returns all the tagged or previously tagged resources that are located in the specified Region for the AWS account.</p><p>Depending on what information you want returned, you can also specify the following:</p><ul><li><p><i>Filters</i> that specify what tags and resource types you want returned. The response includes all tags that are associated with the requested resources.</p></li><li><p>Information about compliance with the account's effective tag policy. For more information on tag policies, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">Tag Policies</a> in the <i>AWS Organizations User Guide.</i></p></li></ul><note><p>You can check the <code>PaginationToken</code> response parameter to determine if a query is complete. Queries occasionally return fewer results on a page than allowed. The <code>PaginationToken</code> response parameter value is <code>null</code><i>only</i> when there are no more results to display. </p></note>
 
 @param request A container for the necessary parameters to execute the GetResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorPaginationTokenExpired`.
 
 @see AWSResourceGroupsTaggingAPIGetResourcesInput
 @see AWSResourceGroupsTaggingAPIGetResourcesOutput
 */
- (void)getResources:(AWSResourceGroupsTaggingAPIGetResourcesInput *)request completionHandler:(void (^ _Nullable)(AWSResourceGroupsTaggingAPIGetResourcesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all tag keys in the specified Region for the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetTagKeys service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSResourceGroupsTaggingAPIGetTagKeysOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorPaginationTokenExpired`.
 
 @see AWSResourceGroupsTaggingAPIGetTagKeysInput
 @see AWSResourceGroupsTaggingAPIGetTagKeysOutput
 */
- (AWSTask<AWSResourceGroupsTaggingAPIGetTagKeysOutput *> *)getTagKeys:(AWSResourceGroupsTaggingAPIGetTagKeysInput *)request;

/**
 <p>Returns all tag keys in the specified Region for the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetTagKeys service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorPaginationTokenExpired`.
 
 @see AWSResourceGroupsTaggingAPIGetTagKeysInput
 @see AWSResourceGroupsTaggingAPIGetTagKeysOutput
 */
- (void)getTagKeys:(AWSResourceGroupsTaggingAPIGetTagKeysInput *)request completionHandler:(void (^ _Nullable)(AWSResourceGroupsTaggingAPIGetTagKeysOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all tag values for the specified key in the specified Region for the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetTagValues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSResourceGroupsTaggingAPIGetTagValuesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorPaginationTokenExpired`.
 
 @see AWSResourceGroupsTaggingAPIGetTagValuesInput
 @see AWSResourceGroupsTaggingAPIGetTagValuesOutput
 */
- (AWSTask<AWSResourceGroupsTaggingAPIGetTagValuesOutput *> *)getTagValues:(AWSResourceGroupsTaggingAPIGetTagValuesInput *)request;

/**
 <p>Returns all tag values for the specified key in the specified Region for the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetTagValues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorPaginationTokenExpired`.
 
 @see AWSResourceGroupsTaggingAPIGetTagValuesInput
 @see AWSResourceGroupsTaggingAPIGetTagValuesOutput
 */
- (void)getTagValues:(AWSResourceGroupsTaggingAPIGetTagValuesInput *)request completionHandler:(void (^ _Nullable)(AWSResourceGroupsTaggingAPIGetTagValuesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates a report that lists all tagged resources in accounts across your organization and tells whether each resource is compliant with the effective tag policy. Compliance data is refreshed daily. </p><p>The generated report is saved to the following location:</p><p><code>s3://example-bucket/AwsTagPolicies/o-exampleorgid/YYYY-MM-ddTHH:mm:ssZ/report.csv</code></p><p>You can call this operation only from the organization's master account and from the us-east-1 Region.</p>
 
 @param request A container for the necessary parameters to execute the StartReportCreation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSResourceGroupsTaggingAPIStartReportCreationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorConcurrentModification`, `AWSResourceGroupsTaggingAPIErrorConstraintViolation`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`.
 
 @see AWSResourceGroupsTaggingAPIStartReportCreationInput
 @see AWSResourceGroupsTaggingAPIStartReportCreationOutput
 */
- (AWSTask<AWSResourceGroupsTaggingAPIStartReportCreationOutput *> *)startReportCreation:(AWSResourceGroupsTaggingAPIStartReportCreationInput *)request;

/**
 <p>Generates a report that lists all tagged resources in accounts across your organization and tells whether each resource is compliant with the effective tag policy. Compliance data is refreshed daily. </p><p>The generated report is saved to the following location:</p><p><code>s3://example-bucket/AwsTagPolicies/o-exampleorgid/YYYY-MM-ddTHH:mm:ssZ/report.csv</code></p><p>You can call this operation only from the organization's master account and from the us-east-1 Region.</p>
 
 @param request A container for the necessary parameters to execute the StartReportCreation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorConcurrentModification`, `AWSResourceGroupsTaggingAPIErrorConstraintViolation`, `AWSResourceGroupsTaggingAPIErrorInternalService`, `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`.
 
 @see AWSResourceGroupsTaggingAPIStartReportCreationInput
 @see AWSResourceGroupsTaggingAPIStartReportCreationOutput
 */
- (void)startReportCreation:(AWSResourceGroupsTaggingAPIStartReportCreationInput *)request completionHandler:(void (^ _Nullable)(AWSResourceGroupsTaggingAPIStartReportCreationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies one or more tags to the specified resources. Note the following:</p><ul><li><p>Not all resources can have tags. For a list of services that support tagging, see <a href="http://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/Welcome.html">this list</a>.</p></li><li><p>Each resource can have up to 50 tags. For other limits, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws_tagging.html#tag-conventions">Tag Naming and Usage Conventions</a> in the <i>AWS General Reference.</i></p></li><li><p>You can only tag resources that are located in the specified Region for the AWS account.</p></li><li><p>To add tags to a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for adding tags. For more information, see <a href="http://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/Welcome.html">this list</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the TagResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSResourceGroupsTaggingAPITagResourcesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`, `AWSResourceGroupsTaggingAPIErrorInternalService`.
 
 @see AWSResourceGroupsTaggingAPITagResourcesInput
 @see AWSResourceGroupsTaggingAPITagResourcesOutput
 */
- (AWSTask<AWSResourceGroupsTaggingAPITagResourcesOutput *> *)tagResources:(AWSResourceGroupsTaggingAPITagResourcesInput *)request;

/**
 <p>Applies one or more tags to the specified resources. Note the following:</p><ul><li><p>Not all resources can have tags. For a list of services that support tagging, see <a href="http://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/Welcome.html">this list</a>.</p></li><li><p>Each resource can have up to 50 tags. For other limits, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws_tagging.html#tag-conventions">Tag Naming and Usage Conventions</a> in the <i>AWS General Reference.</i></p></li><li><p>You can only tag resources that are located in the specified Region for the AWS account.</p></li><li><p>To add tags to a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for adding tags. For more information, see <a href="http://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/Welcome.html">this list</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the TagResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`, `AWSResourceGroupsTaggingAPIErrorInternalService`.
 
 @see AWSResourceGroupsTaggingAPITagResourcesInput
 @see AWSResourceGroupsTaggingAPITagResourcesOutput
 */
- (void)tagResources:(AWSResourceGroupsTaggingAPITagResourcesInput *)request completionHandler:(void (^ _Nullable)(AWSResourceGroupsTaggingAPITagResourcesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tags from the specified resources. When you specify a tag key, the action removes both that key and its associated value. The operation succeeds even if you attempt to remove tags from a resource that were already removed. Note the following:</p><ul><li><p>To remove tags from a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for removing tags. For more information, see <a href="http://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/Welcome.html">this list</a>.</p></li><li><p>You can only tag resources that are located in the specified Region for the AWS account.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UntagResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSResourceGroupsTaggingAPIUntagResourcesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`, `AWSResourceGroupsTaggingAPIErrorInternalService`.
 
 @see AWSResourceGroupsTaggingAPIUntagResourcesInput
 @see AWSResourceGroupsTaggingAPIUntagResourcesOutput
 */
- (AWSTask<AWSResourceGroupsTaggingAPIUntagResourcesOutput *> *)untagResources:(AWSResourceGroupsTaggingAPIUntagResourcesInput *)request;

/**
 <p>Removes the specified tags from the specified resources. When you specify a tag key, the action removes both that key and its associated value. The operation succeeds even if you attempt to remove tags from a resource that were already removed. Note the following:</p><ul><li><p>To remove tags from a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for removing tags. For more information, see <a href="http://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/Welcome.html">this list</a>.</p></li><li><p>You can only tag resources that are located in the specified Region for the AWS account.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UntagResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSResourceGroupsTaggingAPIErrorDomain` domain and the following error code: `AWSResourceGroupsTaggingAPIErrorInvalidParameter`, `AWSResourceGroupsTaggingAPIErrorThrottled`, `AWSResourceGroupsTaggingAPIErrorInternalService`.
 
 @see AWSResourceGroupsTaggingAPIUntagResourcesInput
 @see AWSResourceGroupsTaggingAPIUntagResourcesOutput
 */
- (void)untagResources:(AWSResourceGroupsTaggingAPIUntagResourcesInput *)request completionHandler:(void (^ _Nullable)(AWSResourceGroupsTaggingAPIUntagResourcesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
