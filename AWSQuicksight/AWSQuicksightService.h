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
#import "AWSQuicksightModel.h"
#import "AWSQuicksightResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSQuicksight
FOUNDATION_EXPORT NSString *const AWSQuicksightSDKVersion;

/**
 <fullname>Amazon QuickSight API Reference</fullname><p>Amazon QuickSight is a fully managed, serverless business intelligence service for the AWS Cloud that makes it easy to extend data and insights to every user in your organization. This API reference contains documentation for a programming interface that you can use to manage Amazon QuickSight. </p>
 */
@interface AWSQuicksight : AWSService

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

     let Quicksight = AWSQuicksight.default()

 *Objective-C*

     AWSQuicksight *Quicksight = [AWSQuicksight defaultQuicksight];

 @return The default service client.
 */
+ (instancetype)defaultQuicksight;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSQuicksight.register(with: configuration!, forKey: "USWest2Quicksight")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:@"USWest2Quicksight"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Quicksight = AWSQuicksight(forKey: "USWest2Quicksight")

 *Objective-C*

     AWSQuicksight *Quicksight = [AWSQuicksight QuicksightForKey:@"USWest2Quicksight"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerQuicksightWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerQuicksightWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSQuicksight.register(with: configuration!, forKey: "USWest2Quicksight")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:@"USWest2Quicksight"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Quicksight = AWSQuicksight(forKey: "USWest2Quicksight")

 *Objective-C*

     AWSQuicksight *Quicksight = [AWSQuicksight QuicksightForKey:@"USWest2Quicksight"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)QuicksightForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeQuicksightForKey:(NSString *)key;

/**
 <p>Cancels an ongoing ingestion of data into SPICE.</p>
 
 @param request A container for the necessary parameters to execute the CancelIngestion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightCancelIngestionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCancelIngestionRequest
 @see AWSQuicksightCancelIngestionResponse
 */
- (AWSTask<AWSQuicksightCancelIngestionResponse *> *)cancelIngestion:(AWSQuicksightCancelIngestionRequest *)request;

/**
 <p>Cancels an ongoing ingestion of data into SPICE.</p>
 
 @param request A container for the necessary parameters to execute the CancelIngestion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCancelIngestionRequest
 @see AWSQuicksightCancelIngestionResponse
 */
- (void)cancelIngestion:(AWSQuicksightCancelIngestionRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightCancelIngestionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a dashboard from a template. To first create a template, see the CreateTemplate API operation.</p><p>A dashboard is an entity in QuickSight that identifies QuickSight reports, created from analyses. You can share QuickSight dashboards. With the right permissions, you can create scheduled email reports from them. The <code>CreateDashboard</code>, <code>DescribeDashboard</code>, and <code>ListDashboardsByUser</code> API operations act on the dashboard entity. If you have the correct permissions, you can create a dashboard from a template that exists in a different AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreateDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightCreateDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateDashboardRequest
 @see AWSQuicksightCreateDashboardResponse
 */
- (AWSTask<AWSQuicksightCreateDashboardResponse *> *)createDashboard:(AWSQuicksightCreateDashboardRequest *)request;

/**
 <p>Creates a dashboard from a template. To first create a template, see the CreateTemplate API operation.</p><p>A dashboard is an entity in QuickSight that identifies QuickSight reports, created from analyses. You can share QuickSight dashboards. With the right permissions, you can create scheduled email reports from them. The <code>CreateDashboard</code>, <code>DescribeDashboard</code>, and <code>ListDashboardsByUser</code> API operations act on the dashboard entity. If you have the correct permissions, you can create a dashboard from a template that exists in a different AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreateDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateDashboardRequest
 @see AWSQuicksightCreateDashboardResponse
 */
- (void)createDashboard:(AWSQuicksightCreateDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightCreateDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a dataset.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightCreateDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateDataSetRequest
 @see AWSQuicksightCreateDataSetResponse
 */
- (AWSTask<AWSQuicksightCreateDataSetResponse *> *)createDataSet:(AWSQuicksightCreateDataSetRequest *)request;

/**
 <p>Creates a dataset.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateDataSetRequest
 @see AWSQuicksightCreateDataSetResponse
 */
- (void)createDataSet:(AWSQuicksightCreateDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightCreateDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a data source.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightCreateDataSourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateDataSourceRequest
 @see AWSQuicksightCreateDataSourceResponse
 */
- (AWSTask<AWSQuicksightCreateDataSourceResponse *> *)createDataSource:(AWSQuicksightCreateDataSourceRequest *)request;

/**
 <p>Creates a data source.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateDataSourceRequest
 @see AWSQuicksightCreateDataSourceResponse
 */
- (void)createDataSource:(AWSQuicksightCreateDataSourceRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightCreateDataSourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon QuickSight group.</p><p>The permissions resource is <code>arn:aws:quicksight:us-east-1:<i>&lt;relevant-aws-account-id&gt;</i>:group/default/<i>&lt;group-name&gt;</i></code>.</p><p>The response is a group object.</p>
 
 @param request A container for the necessary parameters to execute the CreateGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightCreateGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightCreateGroupRequest
 @see AWSQuicksightCreateGroupResponse
 */
- (AWSTask<AWSQuicksightCreateGroupResponse *> *)createGroup:(AWSQuicksightCreateGroupRequest *)request;

/**
 <p>Creates an Amazon QuickSight group.</p><p>The permissions resource is <code>arn:aws:quicksight:us-east-1:<i>&lt;relevant-aws-account-id&gt;</i>:group/default/<i>&lt;group-name&gt;</i></code>.</p><p>The response is a group object.</p>
 
 @param request A container for the necessary parameters to execute the CreateGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightCreateGroupRequest
 @see AWSQuicksightCreateGroupResponse
 */
- (void)createGroup:(AWSQuicksightCreateGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightCreateGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds an Amazon QuickSight user to an Amazon QuickSight group. </p>
 
 @param request A container for the necessary parameters to execute the CreateGroupMembership service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightCreateGroupMembershipResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightCreateGroupMembershipRequest
 @see AWSQuicksightCreateGroupMembershipResponse
 */
- (AWSTask<AWSQuicksightCreateGroupMembershipResponse *> *)createGroupMembership:(AWSQuicksightCreateGroupMembershipRequest *)request;

/**
 <p>Adds an Amazon QuickSight user to an Amazon QuickSight group. </p>
 
 @param request A container for the necessary parameters to execute the CreateGroupMembership service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightCreateGroupMembershipRequest
 @see AWSQuicksightCreateGroupMembershipResponse
 */
- (void)createGroupMembership:(AWSQuicksightCreateGroupMembershipRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightCreateGroupMembershipResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an assignment with one specified IAM policy, identified by its Amazon Resource Name (ARN). This policy will be assigned to specified groups or users of Amazon QuickSight. The users and groups need to be in the same namespace. </p>
 
 @param request A container for the necessary parameters to execute the CreateIAMPolicyAssignment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightCreateIAMPolicyAssignmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConcurrentUpdating`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateIAMPolicyAssignmentRequest
 @see AWSQuicksightCreateIAMPolicyAssignmentResponse
 */
- (AWSTask<AWSQuicksightCreateIAMPolicyAssignmentResponse *> *)createIAMPolicyAssignment:(AWSQuicksightCreateIAMPolicyAssignmentRequest *)request;

/**
 <p>Creates an assignment with one specified IAM policy, identified by its Amazon Resource Name (ARN). This policy will be assigned to specified groups or users of Amazon QuickSight. The users and groups need to be in the same namespace. </p>
 
 @param request A container for the necessary parameters to execute the CreateIAMPolicyAssignment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConcurrentUpdating`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateIAMPolicyAssignmentRequest
 @see AWSQuicksightCreateIAMPolicyAssignmentResponse
 */
- (void)createIAMPolicyAssignment:(AWSQuicksightCreateIAMPolicyAssignmentRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightCreateIAMPolicyAssignmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates and starts a new SPICE ingestion on a dataset</p><p>Any ingestions operating on tagged datasets inherit the same tags automatically for use in access control. For an example, see <a href="https://aws.amazon.com/premiumsupport/knowledge-center/iam-ec2-resource-tags/">How do I create an IAM policy to control access to Amazon EC2 resources using tags?</a> in the AWS Knowledge Center. Tags are visible on the tagged dataset, but not on the ingestion resource.</p>
 
 @param request A container for the necessary parameters to execute the CreateIngestion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightCreateIngestionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateIngestionRequest
 @see AWSQuicksightCreateIngestionResponse
 */
- (AWSTask<AWSQuicksightCreateIngestionResponse *> *)createIngestion:(AWSQuicksightCreateIngestionRequest *)request;

/**
 <p>Creates and starts a new SPICE ingestion on a dataset</p><p>Any ingestions operating on tagged datasets inherit the same tags automatically for use in access control. For an example, see <a href="https://aws.amazon.com/premiumsupport/knowledge-center/iam-ec2-resource-tags/">How do I create an IAM policy to control access to Amazon EC2 resources using tags?</a> in the AWS Knowledge Center. Tags are visible on the tagged dataset, but not on the ingestion resource.</p>
 
 @param request A container for the necessary parameters to execute the CreateIngestion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateIngestionRequest
 @see AWSQuicksightCreateIngestionResponse
 */
- (void)createIngestion:(AWSQuicksightCreateIngestionRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightCreateIngestionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a template from an existing QuickSight analysis or template. You can use the resulting template to create a dashboard.</p><p>A <i>template</i> is an entity in QuickSight that encapsulates the metadata required to create an analysis and that you can use to create s dashboard. A template adds a layer of abstraction by using placeholders to replace the dataset associated with the analysis. You can use templates to create dashboards by replacing dataset placeholders with datasets that follow the same schema that was used to create the source analysis and template.</p>
 
 @param request A container for the necessary parameters to execute the CreateTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightCreateTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateTemplateRequest
 @see AWSQuicksightCreateTemplateResponse
 */
- (AWSTask<AWSQuicksightCreateTemplateResponse *> *)createTemplate:(AWSQuicksightCreateTemplateRequest *)request;

/**
 <p>Creates a template from an existing QuickSight analysis or template. You can use the resulting template to create a dashboard.</p><p>A <i>template</i> is an entity in QuickSight that encapsulates the metadata required to create an analysis and that you can use to create s dashboard. A template adds a layer of abstraction by using placeholders to replace the dataset associated with the analysis. You can use templates to create dashboards by replacing dataset placeholders with datasets that follow the same schema that was used to create the source analysis and template.</p>
 
 @param request A container for the necessary parameters to execute the CreateTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateTemplateRequest
 @see AWSQuicksightCreateTemplateResponse
 */
- (void)createTemplate:(AWSQuicksightCreateTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightCreateTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a template alias for a template.</p>
 
 @param request A container for the necessary parameters to execute the CreateTemplateAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightCreateTemplateAliasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateTemplateAliasRequest
 @see AWSQuicksightCreateTemplateAliasResponse
 */
- (AWSTask<AWSQuicksightCreateTemplateAliasResponse *> *)createTemplateAlias:(AWSQuicksightCreateTemplateAliasRequest *)request;

/**
 <p>Creates a template alias for a template.</p>
 
 @param request A container for the necessary parameters to execute the CreateTemplateAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightCreateTemplateAliasRequest
 @see AWSQuicksightCreateTemplateAliasResponse
 */
- (void)createTemplateAlias:(AWSQuicksightCreateTemplateAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightCreateTemplateAliasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDeleteDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteDashboardRequest
 @see AWSQuicksightDeleteDashboardResponse
 */
- (AWSTask<AWSQuicksightDeleteDashboardResponse *> *)deleteDashboard:(AWSQuicksightDeleteDashboardRequest *)request;

/**
 <p>Deletes a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteDashboardRequest
 @see AWSQuicksightDeleteDashboardResponse
 */
- (void)deleteDashboard:(AWSQuicksightDeleteDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDeleteDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a dataset.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDeleteDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteDataSetRequest
 @see AWSQuicksightDeleteDataSetResponse
 */
- (AWSTask<AWSQuicksightDeleteDataSetResponse *> *)deleteDataSet:(AWSQuicksightDeleteDataSetRequest *)request;

/**
 <p>Deletes a dataset.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteDataSetRequest
 @see AWSQuicksightDeleteDataSetResponse
 */
- (void)deleteDataSet:(AWSQuicksightDeleteDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDeleteDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the data source permanently. This action breaks all the datasets that reference the deleted data source.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDeleteDataSourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteDataSourceRequest
 @see AWSQuicksightDeleteDataSourceResponse
 */
- (AWSTask<AWSQuicksightDeleteDataSourceResponse *> *)deleteDataSource:(AWSQuicksightDeleteDataSourceRequest *)request;

/**
 <p>Deletes the data source permanently. This action breaks all the datasets that reference the deleted data source.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteDataSourceRequest
 @see AWSQuicksightDeleteDataSourceResponse
 */
- (void)deleteDataSource:(AWSQuicksightDeleteDataSourceRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDeleteDataSourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a user group from Amazon QuickSight. </p>
 
 @param request A container for the necessary parameters to execute the DeleteGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDeleteGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDeleteGroupRequest
 @see AWSQuicksightDeleteGroupResponse
 */
- (AWSTask<AWSQuicksightDeleteGroupResponse *> *)deleteGroup:(AWSQuicksightDeleteGroupRequest *)request;

/**
 <p>Removes a user group from Amazon QuickSight. </p>
 
 @param request A container for the necessary parameters to execute the DeleteGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDeleteGroupRequest
 @see AWSQuicksightDeleteGroupResponse
 */
- (void)deleteGroup:(AWSQuicksightDeleteGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDeleteGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a user from a group so that the user is no longer a member of the group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGroupMembership service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDeleteGroupMembershipResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDeleteGroupMembershipRequest
 @see AWSQuicksightDeleteGroupMembershipResponse
 */
- (AWSTask<AWSQuicksightDeleteGroupMembershipResponse *> *)deleteGroupMembership:(AWSQuicksightDeleteGroupMembershipRequest *)request;

/**
 <p>Removes a user from a group so that the user is no longer a member of the group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGroupMembership service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDeleteGroupMembershipRequest
 @see AWSQuicksightDeleteGroupMembershipResponse
 */
- (void)deleteGroupMembership:(AWSQuicksightDeleteGroupMembershipRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDeleteGroupMembershipResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing IAM policy assignment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIAMPolicyAssignment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDeleteIAMPolicyAssignmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConcurrentUpdating`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteIAMPolicyAssignmentRequest
 @see AWSQuicksightDeleteIAMPolicyAssignmentResponse
 */
- (AWSTask<AWSQuicksightDeleteIAMPolicyAssignmentResponse *> *)deleteIAMPolicyAssignment:(AWSQuicksightDeleteIAMPolicyAssignmentRequest *)request;

/**
 <p>Deletes an existing IAM policy assignment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIAMPolicyAssignment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConcurrentUpdating`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteIAMPolicyAssignmentRequest
 @see AWSQuicksightDeleteIAMPolicyAssignmentResponse
 */
- (void)deleteIAMPolicyAssignment:(AWSQuicksightDeleteIAMPolicyAssignmentRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDeleteIAMPolicyAssignmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a template.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDeleteTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteTemplateRequest
 @see AWSQuicksightDeleteTemplateResponse
 */
- (AWSTask<AWSQuicksightDeleteTemplateResponse *> *)deleteTemplate:(AWSQuicksightDeleteTemplateRequest *)request;

/**
 <p>Deletes a template.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteTemplateRequest
 @see AWSQuicksightDeleteTemplateResponse
 */
- (void)deleteTemplate:(AWSQuicksightDeleteTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDeleteTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the item that the specified template alias points to. If you provide a specific alias, you delete the version of the template that the alias points to.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTemplateAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDeleteTemplateAliasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteTemplateAliasRequest
 @see AWSQuicksightDeleteTemplateAliasResponse
 */
- (AWSTask<AWSQuicksightDeleteTemplateAliasResponse *> *)deleteTemplateAlias:(AWSQuicksightDeleteTemplateAliasRequest *)request;

/**
 <p>Deletes the item that the specified template alias points to. If you provide a specific alias, you delete the version of the template that the alias points to.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTemplateAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDeleteTemplateAliasRequest
 @see AWSQuicksightDeleteTemplateAliasResponse
 */
- (void)deleteTemplateAlias:(AWSQuicksightDeleteTemplateAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDeleteTemplateAliasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the Amazon QuickSight user that is associated with the identity of the AWS Identity and Access Management (IAM) user or role that's making the call. The IAM user isn't deleted as a result of this call. </p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDeleteUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDeleteUserRequest
 @see AWSQuicksightDeleteUserResponse
 */
- (AWSTask<AWSQuicksightDeleteUserResponse *> *)deleteUser:(AWSQuicksightDeleteUserRequest *)request;

/**
 <p>Deletes the Amazon QuickSight user that is associated with the identity of the AWS Identity and Access Management (IAM) user or role that's making the call. The IAM user isn't deleted as a result of this call. </p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDeleteUserRequest
 @see AWSQuicksightDeleteUserResponse
 */
- (void)deleteUser:(AWSQuicksightDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDeleteUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user identified by its principal ID. </p>
 
 @param request A container for the necessary parameters to execute the DeleteUserByPrincipalId service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDeleteUserByPrincipalIdResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDeleteUserByPrincipalIdRequest
 @see AWSQuicksightDeleteUserByPrincipalIdResponse
 */
- (AWSTask<AWSQuicksightDeleteUserByPrincipalIdResponse *> *)deleteUserByPrincipalId:(AWSQuicksightDeleteUserByPrincipalIdRequest *)request;

/**
 <p>Deletes a user identified by its principal ID. </p>
 
 @param request A container for the necessary parameters to execute the DeleteUserByPrincipalId service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDeleteUserByPrincipalIdRequest
 @see AWSQuicksightDeleteUserByPrincipalIdResponse
 */
- (void)deleteUserByPrincipalId:(AWSQuicksightDeleteUserByPrincipalIdRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDeleteUserByPrincipalIdResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a summary for a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDashboardRequest
 @see AWSQuicksightDescribeDashboardResponse
 */
- (AWSTask<AWSQuicksightDescribeDashboardResponse *> *)describeDashboard:(AWSQuicksightDescribeDashboardRequest *)request;

/**
 <p>Provides a summary for a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDashboardRequest
 @see AWSQuicksightDescribeDashboardResponse
 */
- (void)describeDashboard:(AWSQuicksightDescribeDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes read and write permissions for a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDashboardPermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeDashboardPermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDashboardPermissionsRequest
 @see AWSQuicksightDescribeDashboardPermissionsResponse
 */
- (AWSTask<AWSQuicksightDescribeDashboardPermissionsResponse *> *)describeDashboardPermissions:(AWSQuicksightDescribeDashboardPermissionsRequest *)request;

/**
 <p>Describes read and write permissions for a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDashboardPermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDashboardPermissionsRequest
 @see AWSQuicksightDescribeDashboardPermissionsResponse
 */
- (void)describeDashboardPermissions:(AWSQuicksightDescribeDashboardPermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeDashboardPermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a dataset. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDataSetRequest
 @see AWSQuicksightDescribeDataSetResponse
 */
- (AWSTask<AWSQuicksightDescribeDataSetResponse *> *)describeDataSet:(AWSQuicksightDescribeDataSetRequest *)request;

/**
 <p>Describes a dataset. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDataSetRequest
 @see AWSQuicksightDescribeDataSetResponse
 */
- (void)describeDataSet:(AWSQuicksightDescribeDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the permissions on a dataset.</p><p>The permissions resource is <code>arn:aws:quicksight:region:aws-account-id:dataset/data-set-id</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSetPermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeDataSetPermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDataSetPermissionsRequest
 @see AWSQuicksightDescribeDataSetPermissionsResponse
 */
- (AWSTask<AWSQuicksightDescribeDataSetPermissionsResponse *> *)describeDataSetPermissions:(AWSQuicksightDescribeDataSetPermissionsRequest *)request;

/**
 <p>Describes the permissions on a dataset.</p><p>The permissions resource is <code>arn:aws:quicksight:region:aws-account-id:dataset/data-set-id</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSetPermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDataSetPermissionsRequest
 @see AWSQuicksightDescribeDataSetPermissionsResponse
 */
- (void)describeDataSetPermissions:(AWSQuicksightDescribeDataSetPermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeDataSetPermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a data source.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeDataSourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDataSourceRequest
 @see AWSQuicksightDescribeDataSourceResponse
 */
- (AWSTask<AWSQuicksightDescribeDataSourceResponse *> *)describeDataSource:(AWSQuicksightDescribeDataSourceRequest *)request;

/**
 <p>Describes a data source.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDataSourceRequest
 @see AWSQuicksightDescribeDataSourceResponse
 */
- (void)describeDataSource:(AWSQuicksightDescribeDataSourceRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeDataSourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the resource permissions for a data source.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSourcePermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeDataSourcePermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDataSourcePermissionsRequest
 @see AWSQuicksightDescribeDataSourcePermissionsResponse
 */
- (AWSTask<AWSQuicksightDescribeDataSourcePermissionsResponse *> *)describeDataSourcePermissions:(AWSQuicksightDescribeDataSourcePermissionsRequest *)request;

/**
 <p>Describes the resource permissions for a data source.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSourcePermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeDataSourcePermissionsRequest
 @see AWSQuicksightDescribeDataSourcePermissionsResponse
 */
- (void)describeDataSourcePermissions:(AWSQuicksightDescribeDataSourcePermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeDataSourcePermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an Amazon QuickSight group's description and Amazon Resource Name (ARN). </p>
 
 @param request A container for the necessary parameters to execute the DescribeGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDescribeGroupRequest
 @see AWSQuicksightDescribeGroupResponse
 */
- (AWSTask<AWSQuicksightDescribeGroupResponse *> *)describeGroup:(AWSQuicksightDescribeGroupRequest *)request;

/**
 <p>Returns an Amazon QuickSight group's description and Amazon Resource Name (ARN). </p>
 
 @param request A container for the necessary parameters to execute the DescribeGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDescribeGroupRequest
 @see AWSQuicksightDescribeGroupResponse
 */
- (void)describeGroup:(AWSQuicksightDescribeGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes an existing IAM policy assignment, as specified by the assignment name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIAMPolicyAssignment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeIAMPolicyAssignmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeIAMPolicyAssignmentRequest
 @see AWSQuicksightDescribeIAMPolicyAssignmentResponse
 */
- (AWSTask<AWSQuicksightDescribeIAMPolicyAssignmentResponse *> *)describeIAMPolicyAssignment:(AWSQuicksightDescribeIAMPolicyAssignmentRequest *)request;

/**
 <p>Describes an existing IAM policy assignment, as specified by the assignment name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIAMPolicyAssignment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeIAMPolicyAssignmentRequest
 @see AWSQuicksightDescribeIAMPolicyAssignmentResponse
 */
- (void)describeIAMPolicyAssignment:(AWSQuicksightDescribeIAMPolicyAssignmentRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeIAMPolicyAssignmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a SPICE ingestion.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIngestion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeIngestionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeIngestionRequest
 @see AWSQuicksightDescribeIngestionResponse
 */
- (AWSTask<AWSQuicksightDescribeIngestionResponse *> *)describeIngestion:(AWSQuicksightDescribeIngestionRequest *)request;

/**
 <p>Describes a SPICE ingestion.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIngestion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeIngestionRequest
 @see AWSQuicksightDescribeIngestionResponse
 */
- (void)describeIngestion:(AWSQuicksightDescribeIngestionRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeIngestionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a template's metadata.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeTemplateRequest
 @see AWSQuicksightDescribeTemplateResponse
 */
- (AWSTask<AWSQuicksightDescribeTemplateResponse *> *)describeTemplate:(AWSQuicksightDescribeTemplateRequest *)request;

/**
 <p>Describes a template's metadata.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeTemplateRequest
 @see AWSQuicksightDescribeTemplateResponse
 */
- (void)describeTemplate:(AWSQuicksightDescribeTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the template alias for a template.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTemplateAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeTemplateAliasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeTemplateAliasRequest
 @see AWSQuicksightDescribeTemplateAliasResponse
 */
- (AWSTask<AWSQuicksightDescribeTemplateAliasResponse *> *)describeTemplateAlias:(AWSQuicksightDescribeTemplateAliasRequest *)request;

/**
 <p>Describes the template alias for a template.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTemplateAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeTemplateAliasRequest
 @see AWSQuicksightDescribeTemplateAliasResponse
 */
- (void)describeTemplateAlias:(AWSQuicksightDescribeTemplateAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeTemplateAliasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes read and write permissions on a template.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTemplatePermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeTemplatePermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeTemplatePermissionsRequest
 @see AWSQuicksightDescribeTemplatePermissionsResponse
 */
- (AWSTask<AWSQuicksightDescribeTemplatePermissionsResponse *> *)describeTemplatePermissions:(AWSQuicksightDescribeTemplatePermissionsRequest *)request;

/**
 <p>Describes read and write permissions on a template.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTemplatePermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightDescribeTemplatePermissionsRequest
 @see AWSQuicksightDescribeTemplatePermissionsResponse
 */
- (void)describeTemplatePermissions:(AWSQuicksightDescribeTemplatePermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeTemplatePermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a user, given the user name. </p>
 
 @param request A container for the necessary parameters to execute the DescribeUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightDescribeUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDescribeUserRequest
 @see AWSQuicksightDescribeUserResponse
 */
- (AWSTask<AWSQuicksightDescribeUserResponse *> *)describeUser:(AWSQuicksightDescribeUserRequest *)request;

/**
 <p>Returns information about a user, given the user name. </p>
 
 @param request A container for the necessary parameters to execute the DescribeUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightDescribeUserRequest
 @see AWSQuicksightDescribeUserResponse
 */
- (void)describeUser:(AWSQuicksightDescribeUserRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightDescribeUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates a server-side embeddable URL and authorization code. For this process to work properly, first configure the dashboards and user permissions. For more information, see <a href="https://docs.aws.amazon.com/quicksight/latest/user/embedding-dashboards.html">Embedding Amazon QuickSight Dashboards</a> in the <i>Amazon QuickSight User Guide</i> or <a href="https://docs.aws.amazon.com/quicksight/latest/APIReference/qs-dev-embedded-dashboards.html">Embedding Amazon QuickSight Dashboards</a> in the <i>Amazon QuickSight API Reference</i>.</p><p>Currently, you can use <code>GetDashboardEmbedURL</code> only from the server, not from the user’s browser.</p>
 
 @param request A container for the necessary parameters to execute the GetDashboardEmbedUrl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightGetDashboardEmbedUrlResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorDomainNotWhitelisted`, `AWSQuicksightErrorQuickSightUserNotFound`, `AWSQuicksightErrorIdentityTypeNotSupported`, `AWSQuicksightErrorSessionLifetimeInMinutesInvalid`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightGetDashboardEmbedUrlRequest
 @see AWSQuicksightGetDashboardEmbedUrlResponse
 */
- (AWSTask<AWSQuicksightGetDashboardEmbedUrlResponse *> *)getDashboardEmbedUrl:(AWSQuicksightGetDashboardEmbedUrlRequest *)request;

/**
 <p>Generates a server-side embeddable URL and authorization code. For this process to work properly, first configure the dashboards and user permissions. For more information, see <a href="https://docs.aws.amazon.com/quicksight/latest/user/embedding-dashboards.html">Embedding Amazon QuickSight Dashboards</a> in the <i>Amazon QuickSight User Guide</i> or <a href="https://docs.aws.amazon.com/quicksight/latest/APIReference/qs-dev-embedded-dashboards.html">Embedding Amazon QuickSight Dashboards</a> in the <i>Amazon QuickSight API Reference</i>.</p><p>Currently, you can use <code>GetDashboardEmbedURL</code> only from the server, not from the user’s browser.</p>
 
 @param request A container for the necessary parameters to execute the GetDashboardEmbedUrl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorDomainNotWhitelisted`, `AWSQuicksightErrorQuickSightUserNotFound`, `AWSQuicksightErrorIdentityTypeNotSupported`, `AWSQuicksightErrorSessionLifetimeInMinutesInvalid`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightGetDashboardEmbedUrlRequest
 @see AWSQuicksightGetDashboardEmbedUrlResponse
 */
- (void)getDashboardEmbedUrl:(AWSQuicksightGetDashboardEmbedUrlRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightGetDashboardEmbedUrlResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the versions of the dashboards in the QuickSight subscription.</p>
 
 @param request A container for the necessary parameters to execute the ListDashboardVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListDashboardVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListDashboardVersionsRequest
 @see AWSQuicksightListDashboardVersionsResponse
 */
- (AWSTask<AWSQuicksightListDashboardVersionsResponse *> *)listDashboardVersions:(AWSQuicksightListDashboardVersionsRequest *)request;

/**
 <p>Lists all the versions of the dashboards in the QuickSight subscription.</p>
 
 @param request A container for the necessary parameters to execute the ListDashboardVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListDashboardVersionsRequest
 @see AWSQuicksightListDashboardVersionsResponse
 */
- (void)listDashboardVersions:(AWSQuicksightListDashboardVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListDashboardVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists dashboards in an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDashboards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListDashboardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListDashboardsRequest
 @see AWSQuicksightListDashboardsResponse
 */
- (AWSTask<AWSQuicksightListDashboardsResponse *> *)listDashboards:(AWSQuicksightListDashboardsRequest *)request;

/**
 <p>Lists dashboards in an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDashboards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListDashboardsRequest
 @see AWSQuicksightListDashboardsResponse
 */
- (void)listDashboards:(AWSQuicksightListDashboardsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListDashboardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the datasets belonging to the current AWS account in an AWS Region.</p><p>The permissions resource is <code>arn:aws:quicksight:region:aws-account-id:dataset/*</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListDataSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListDataSetsRequest
 @see AWSQuicksightListDataSetsResponse
 */
- (AWSTask<AWSQuicksightListDataSetsResponse *> *)listDataSets:(AWSQuicksightListDataSetsRequest *)request;

/**
 <p>Lists all of the datasets belonging to the current AWS account in an AWS Region.</p><p>The permissions resource is <code>arn:aws:quicksight:region:aws-account-id:dataset/*</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListDataSetsRequest
 @see AWSQuicksightListDataSetsResponse
 */
- (void)listDataSets:(AWSQuicksightListDataSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListDataSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists data sources in current AWS Region that belong to this AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListDataSourcesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListDataSourcesRequest
 @see AWSQuicksightListDataSourcesResponse
 */
- (AWSTask<AWSQuicksightListDataSourcesResponse *> *)listDataSources:(AWSQuicksightListDataSourcesRequest *)request;

/**
 <p>Lists data sources in current AWS Region that belong to this AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDataSources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListDataSourcesRequest
 @see AWSQuicksightListDataSourcesResponse
 */
- (void)listDataSources:(AWSQuicksightListDataSourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListDataSourcesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists member users in a group.</p>
 
 @param request A container for the necessary parameters to execute the ListGroupMemberships service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListGroupMembershipsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightListGroupMembershipsRequest
 @see AWSQuicksightListGroupMembershipsResponse
 */
- (AWSTask<AWSQuicksightListGroupMembershipsResponse *> *)listGroupMemberships:(AWSQuicksightListGroupMembershipsRequest *)request;

/**
 <p>Lists member users in a group.</p>
 
 @param request A container for the necessary parameters to execute the ListGroupMemberships service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightListGroupMembershipsRequest
 @see AWSQuicksightListGroupMembershipsResponse
 */
- (void)listGroupMemberships:(AWSQuicksightListGroupMembershipsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListGroupMembershipsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all user groups in Amazon QuickSight. </p>
 
 @param request A container for the necessary parameters to execute the ListGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightListGroupsRequest
 @see AWSQuicksightListGroupsResponse
 */
- (AWSTask<AWSQuicksightListGroupsResponse *> *)listGroups:(AWSQuicksightListGroupsRequest *)request;

/**
 <p>Lists all user groups in Amazon QuickSight. </p>
 
 @param request A container for the necessary parameters to execute the ListGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightListGroupsRequest
 @see AWSQuicksightListGroupsResponse
 */
- (void)listGroups:(AWSQuicksightListGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists IAM policy assignments in the current Amazon QuickSight account.</p>
 
 @param request A container for the necessary parameters to execute the ListIAMPolicyAssignments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListIAMPolicyAssignmentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListIAMPolicyAssignmentsRequest
 @see AWSQuicksightListIAMPolicyAssignmentsResponse
 */
- (AWSTask<AWSQuicksightListIAMPolicyAssignmentsResponse *> *)listIAMPolicyAssignments:(AWSQuicksightListIAMPolicyAssignmentsRequest *)request;

/**
 <p>Lists IAM policy assignments in the current Amazon QuickSight account.</p>
 
 @param request A container for the necessary parameters to execute the ListIAMPolicyAssignments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListIAMPolicyAssignmentsRequest
 @see AWSQuicksightListIAMPolicyAssignmentsResponse
 */
- (void)listIAMPolicyAssignments:(AWSQuicksightListIAMPolicyAssignmentsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListIAMPolicyAssignmentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the IAM policy assignments, including the Amazon Resource Names (ARNs) for the IAM policies assigned to the specified user and group or groups that the user belongs to.</p>
 
 @param request A container for the necessary parameters to execute the ListIAMPolicyAssignmentsForUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListIAMPolicyAssignmentsForUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConcurrentUpdating`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListIAMPolicyAssignmentsForUserRequest
 @see AWSQuicksightListIAMPolicyAssignmentsForUserResponse
 */
- (AWSTask<AWSQuicksightListIAMPolicyAssignmentsForUserResponse *> *)listIAMPolicyAssignmentsForUser:(AWSQuicksightListIAMPolicyAssignmentsForUserRequest *)request;

/**
 <p>Lists all the IAM policy assignments, including the Amazon Resource Names (ARNs) for the IAM policies assigned to the specified user and group or groups that the user belongs to.</p>
 
 @param request A container for the necessary parameters to execute the ListIAMPolicyAssignmentsForUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConcurrentUpdating`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListIAMPolicyAssignmentsForUserRequest
 @see AWSQuicksightListIAMPolicyAssignmentsForUserResponse
 */
- (void)listIAMPolicyAssignmentsForUser:(AWSQuicksightListIAMPolicyAssignmentsForUserRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListIAMPolicyAssignmentsForUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the history of SPICE ingestions for a dataset.</p>
 
 @param request A container for the necessary parameters to execute the ListIngestions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListIngestionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListIngestionsRequest
 @see AWSQuicksightListIngestionsResponse
 */
- (AWSTask<AWSQuicksightListIngestionsResponse *> *)listIngestions:(AWSQuicksightListIngestionsRequest *)request;

/**
 <p>Lists the history of SPICE ingestions for a dataset.</p>
 
 @param request A container for the necessary parameters to execute the ListIngestions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListIngestionsRequest
 @see AWSQuicksightListIngestionsResponse
 */
- (void)listIngestions:(AWSQuicksightListIngestionsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListIngestionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags assigned to a resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListTagsForResourceRequest
 @see AWSQuicksightListTagsForResourceResponse
 */
- (AWSTask<AWSQuicksightListTagsForResourceResponse *> *)listTagsForResource:(AWSQuicksightListTagsForResourceRequest *)request;

/**
 <p>Lists the tags assigned to a resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListTagsForResourceRequest
 @see AWSQuicksightListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSQuicksightListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the aliases of a template.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplateAliases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListTemplateAliasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListTemplateAliasesRequest
 @see AWSQuicksightListTemplateAliasesResponse
 */
- (AWSTask<AWSQuicksightListTemplateAliasesResponse *> *)listTemplateAliases:(AWSQuicksightListTemplateAliasesRequest *)request;

/**
 <p>Lists all the aliases of a template.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplateAliases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListTemplateAliasesRequest
 @see AWSQuicksightListTemplateAliasesResponse
 */
- (void)listTemplateAliases:(AWSQuicksightListTemplateAliasesRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListTemplateAliasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the versions of the templates in the current Amazon QuickSight account.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplateVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListTemplateVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListTemplateVersionsRequest
 @see AWSQuicksightListTemplateVersionsResponse
 */
- (AWSTask<AWSQuicksightListTemplateVersionsResponse *> *)listTemplateVersions:(AWSQuicksightListTemplateVersionsRequest *)request;

/**
 <p>Lists all the versions of the templates in the current Amazon QuickSight account.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplateVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListTemplateVersionsRequest
 @see AWSQuicksightListTemplateVersionsResponse
 */
- (void)listTemplateVersions:(AWSQuicksightListTemplateVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListTemplateVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the templates in the current Amazon QuickSight account.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListTemplatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListTemplatesRequest
 @see AWSQuicksightListTemplatesResponse
 */
- (AWSTask<AWSQuicksightListTemplatesResponse *> *)listTemplates:(AWSQuicksightListTemplatesRequest *)request;

/**
 <p>Lists all the templates in the current Amazon QuickSight account.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightListTemplatesRequest
 @see AWSQuicksightListTemplatesResponse
 */
- (void)listTemplates:(AWSQuicksightListTemplatesRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListTemplatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the Amazon QuickSight groups that an Amazon QuickSight user is a member of.</p>
 
 @param request A container for the necessary parameters to execute the ListUserGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListUserGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightListUserGroupsRequest
 @see AWSQuicksightListUserGroupsResponse
 */
- (AWSTask<AWSQuicksightListUserGroupsResponse *> *)listUserGroups:(AWSQuicksightListUserGroupsRequest *)request;

/**
 <p>Lists the Amazon QuickSight groups that an Amazon QuickSight user is a member of.</p>
 
 @param request A container for the necessary parameters to execute the ListUserGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightListUserGroupsRequest
 @see AWSQuicksightListUserGroupsResponse
 */
- (void)listUserGroups:(AWSQuicksightListUserGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListUserGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of all of the Amazon QuickSight users belonging to this account. </p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightListUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightListUsersRequest
 @see AWSQuicksightListUsersResponse
 */
- (AWSTask<AWSQuicksightListUsersResponse *> *)listUsers:(AWSQuicksightListUsersRequest *)request;

/**
 <p>Returns a list of all of the Amazon QuickSight users belonging to this account. </p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightListUsersRequest
 @see AWSQuicksightListUsersResponse
 */
- (void)listUsers:(AWSQuicksightListUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightListUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon QuickSight user, whose identity is associated with the AWS Identity and Access Management (IAM) identity or role specified in the request. </p>
 
 @param request A container for the necessary parameters to execute the RegisterUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightRegisterUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightRegisterUserRequest
 @see AWSQuicksightRegisterUserResponse
 */
- (AWSTask<AWSQuicksightRegisterUserResponse *> *)registerUser:(AWSQuicksightRegisterUserRequest *)request;

/**
 <p>Creates an Amazon QuickSight user, whose identity is associated with the AWS Identity and Access Management (IAM) identity or role specified in the request. </p>
 
 @param request A container for the necessary parameters to execute the RegisterUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightRegisterUserRequest
 @see AWSQuicksightRegisterUserResponse
 */
- (void)registerUser:(AWSQuicksightRegisterUserRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightRegisterUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searchs for dashboards that belong to a user. </p>
 
 @param request A container for the necessary parameters to execute the SearchDashboards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightSearchDashboardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightSearchDashboardsRequest
 @see AWSQuicksightSearchDashboardsResponse
 */
- (AWSTask<AWSQuicksightSearchDashboardsResponse *> *)searchDashboards:(AWSQuicksightSearchDashboardsRequest *)request;

/**
 <p>Searchs for dashboards that belong to a user. </p>
 
 @param request A container for the necessary parameters to execute the SearchDashboards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInvalidNextToken`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightSearchDashboardsRequest
 @see AWSQuicksightSearchDashboardsResponse
 */
- (void)searchDashboards:(AWSQuicksightSearchDashboardsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightSearchDashboardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns one or more tags (key-value pairs) to the specified QuickSight resource. </p><p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values. You can use the <code>TagResource</code> operation with a resource that already has tags. If you specify a new tag key for the resource, this tag is appended to the list of tags associated with the resource. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag.</p><p>You can associate as many as 50 tags with a resource. QuickSight supports tagging on data set, data source, dashboard, and template. </p><p>Tagging for QuickSight works in a similar way to tagging for other AWS services, except for the following:</p><ul><li><p>You can't use tags to track AWS costs for QuickSight. This restriction is because QuickSight costs are based on users and SPICE capacity, which aren't taggable resources.</p></li><li><p>QuickSight doesn't currently support the Tag Editor for AWS Resource Groups.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightTagResourceRequest
 @see AWSQuicksightTagResourceResponse
 */
- (AWSTask<AWSQuicksightTagResourceResponse *> *)tagResource:(AWSQuicksightTagResourceRequest *)request;

/**
 <p>Assigns one or more tags (key-value pairs) to the specified QuickSight resource. </p><p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values. You can use the <code>TagResource</code> operation with a resource that already has tags. If you specify a new tag key for the resource, this tag is appended to the list of tags associated with the resource. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag.</p><p>You can associate as many as 50 tags with a resource. QuickSight supports tagging on data set, data source, dashboard, and template. </p><p>Tagging for QuickSight works in a similar way to tagging for other AWS services, except for the following:</p><ul><li><p>You can't use tags to track AWS costs for QuickSight. This restriction is because QuickSight costs are based on users and SPICE capacity, which aren't taggable resources.</p></li><li><p>QuickSight doesn't currently support the Tag Editor for AWS Resource Groups.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightTagResourceRequest
 @see AWSQuicksightTagResourceResponse
 */
- (void)tagResource:(AWSQuicksightTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a tag or tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUntagResourceRequest
 @see AWSQuicksightUntagResourceResponse
 */
- (AWSTask<AWSQuicksightUntagResourceResponse *> *)untagResource:(AWSQuicksightUntagResourceRequest *)request;

/**
 <p>Removes a tag or tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUntagResourceRequest
 @see AWSQuicksightUntagResourceResponse
 */
- (void)untagResource:(AWSQuicksightUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a dashboard in an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDashboardRequest
 @see AWSQuicksightUpdateDashboardResponse
 */
- (AWSTask<AWSQuicksightUpdateDashboardResponse *> *)updateDashboard:(AWSQuicksightUpdateDashboardRequest *)request;

/**
 <p>Updates a dashboard in an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDashboardRequest
 @see AWSQuicksightUpdateDashboardResponse
 */
- (void)updateDashboard:(AWSQuicksightUpdateDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates read and write permissions on a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDashboardPermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateDashboardPermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDashboardPermissionsRequest
 @see AWSQuicksightUpdateDashboardPermissionsResponse
 */
- (AWSTask<AWSQuicksightUpdateDashboardPermissionsResponse *> *)updateDashboardPermissions:(AWSQuicksightUpdateDashboardPermissionsRequest *)request;

/**
 <p>Updates read and write permissions on a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDashboardPermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDashboardPermissionsRequest
 @see AWSQuicksightUpdateDashboardPermissionsResponse
 */
- (void)updateDashboardPermissions:(AWSQuicksightUpdateDashboardPermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateDashboardPermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the published version of a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDashboardPublishedVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateDashboardPublishedVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDashboardPublishedVersionRequest
 @see AWSQuicksightUpdateDashboardPublishedVersionResponse
 */
- (AWSTask<AWSQuicksightUpdateDashboardPublishedVersionResponse *> *)updateDashboardPublishedVersion:(AWSQuicksightUpdateDashboardPublishedVersionRequest *)request;

/**
 <p>Updates the published version of a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDashboardPublishedVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDashboardPublishedVersionRequest
 @see AWSQuicksightUpdateDashboardPublishedVersionResponse
 */
- (void)updateDashboardPublishedVersion:(AWSQuicksightUpdateDashboardPublishedVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateDashboardPublishedVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a dataset.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateDataSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDataSetRequest
 @see AWSQuicksightUpdateDataSetResponse
 */
- (AWSTask<AWSQuicksightUpdateDataSetResponse *> *)updateDataSet:(AWSQuicksightUpdateDataSetRequest *)request;

/**
 <p>Updates a dataset.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDataSetRequest
 @see AWSQuicksightUpdateDataSetResponse
 */
- (void)updateDataSet:(AWSQuicksightUpdateDataSetRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateDataSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the permissions on a dataset.</p><p>The permissions resource is <code>arn:aws:quicksight:region:aws-account-id:dataset/data-set-id</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSetPermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateDataSetPermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDataSetPermissionsRequest
 @see AWSQuicksightUpdateDataSetPermissionsResponse
 */
- (AWSTask<AWSQuicksightUpdateDataSetPermissionsResponse *> *)updateDataSetPermissions:(AWSQuicksightUpdateDataSetPermissionsRequest *)request;

/**
 <p>Updates the permissions on a dataset.</p><p>The permissions resource is <code>arn:aws:quicksight:region:aws-account-id:dataset/data-set-id</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSetPermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDataSetPermissionsRequest
 @see AWSQuicksightUpdateDataSetPermissionsResponse
 */
- (void)updateDataSetPermissions:(AWSQuicksightUpdateDataSetPermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateDataSetPermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a data source.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateDataSourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDataSourceRequest
 @see AWSQuicksightUpdateDataSourceResponse
 */
- (AWSTask<AWSQuicksightUpdateDataSourceResponse *> *)updateDataSource:(AWSQuicksightUpdateDataSourceRequest *)request;

/**
 <p>Updates a data source.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDataSourceRequest
 @see AWSQuicksightUpdateDataSourceResponse
 */
- (void)updateDataSource:(AWSQuicksightUpdateDataSourceRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateDataSourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the permissions to a data source.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSourcePermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateDataSourcePermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDataSourcePermissionsRequest
 @see AWSQuicksightUpdateDataSourcePermissionsResponse
 */
- (AWSTask<AWSQuicksightUpdateDataSourcePermissionsResponse *> *)updateDataSourcePermissions:(AWSQuicksightUpdateDataSourcePermissionsRequest *)request;

/**
 <p>Updates the permissions to a data source.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSourcePermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateDataSourcePermissionsRequest
 @see AWSQuicksightUpdateDataSourcePermissionsResponse
 */
- (void)updateDataSourcePermissions:(AWSQuicksightUpdateDataSourcePermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateDataSourcePermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes a group description. </p>
 
 @param request A container for the necessary parameters to execute the UpdateGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightUpdateGroupRequest
 @see AWSQuicksightUpdateGroupResponse
 */
- (AWSTask<AWSQuicksightUpdateGroupResponse *> *)updateGroup:(AWSQuicksightUpdateGroupRequest *)request;

/**
 <p>Changes a group description. </p>
 
 @param request A container for the necessary parameters to execute the UpdateGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorPreconditionNotMet`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightUpdateGroupRequest
 @see AWSQuicksightUpdateGroupResponse
 */
- (void)updateGroup:(AWSQuicksightUpdateGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing IAM policy assignment. This operation updates only the optional parameter or parameters that are specified in the request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIAMPolicyAssignment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateIAMPolicyAssignmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConcurrentUpdating`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateIAMPolicyAssignmentRequest
 @see AWSQuicksightUpdateIAMPolicyAssignmentResponse
 */
- (AWSTask<AWSQuicksightUpdateIAMPolicyAssignmentResponse *> *)updateIAMPolicyAssignment:(AWSQuicksightUpdateIAMPolicyAssignmentRequest *)request;

/**
 <p>Updates an existing IAM policy assignment. This operation updates only the optional parameter or parameters that are specified in the request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIAMPolicyAssignment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConcurrentUpdating`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateIAMPolicyAssignmentRequest
 @see AWSQuicksightUpdateIAMPolicyAssignmentResponse
 */
- (void)updateIAMPolicyAssignment:(AWSQuicksightUpdateIAMPolicyAssignmentRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateIAMPolicyAssignmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a template from an existing Amazon QuickSight analysis or another template.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateTemplateRequest
 @see AWSQuicksightUpdateTemplateResponse
 */
- (AWSTask<AWSQuicksightUpdateTemplateResponse *> *)updateTemplate:(AWSQuicksightUpdateTemplateRequest *)request;

/**
 <p>Updates a template from an existing Amazon QuickSight analysis or another template.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceExists`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorLimitExceeded`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateTemplateRequest
 @see AWSQuicksightUpdateTemplateResponse
 */
- (void)updateTemplate:(AWSQuicksightUpdateTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the template alias of a template.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTemplateAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateTemplateAliasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateTemplateAliasRequest
 @see AWSQuicksightUpdateTemplateAliasResponse
 */
- (AWSTask<AWSQuicksightUpdateTemplateAliasResponse *> *)updateTemplateAlias:(AWSQuicksightUpdateTemplateAliasRequest *)request;

/**
 <p>Updates the template alias of a template.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTemplateAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateTemplateAliasRequest
 @see AWSQuicksightUpdateTemplateAliasResponse
 */
- (void)updateTemplateAlias:(AWSQuicksightUpdateTemplateAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateTemplateAliasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the resource permissions for a template.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTemplatePermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateTemplatePermissionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateTemplatePermissionsRequest
 @see AWSQuicksightUpdateTemplatePermissionsResponse
 */
- (AWSTask<AWSQuicksightUpdateTemplatePermissionsResponse *> *)updateTemplatePermissions:(AWSQuicksightUpdateTemplatePermissionsRequest *)request;

/**
 <p>Updates the resource permissions for a template.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTemplatePermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorConflict`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorUnsupportedUserEdition`, `AWSQuicksightErrorInternalFailure`.
 
 @see AWSQuicksightUpdateTemplatePermissionsRequest
 @see AWSQuicksightUpdateTemplatePermissionsResponse
 */
- (void)updateTemplatePermissions:(AWSQuicksightUpdateTemplatePermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateTemplatePermissionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an Amazon QuickSight user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQuicksightUpdateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightUpdateUserRequest
 @see AWSQuicksightUpdateUserResponse
 */
- (AWSTask<AWSQuicksightUpdateUserResponse *> *)updateUser:(AWSQuicksightUpdateUserRequest *)request;

/**
 <p>Updates an Amazon QuickSight user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQuicksightErrorDomain` domain and the following error code: `AWSQuicksightErrorAccessDenied`, `AWSQuicksightErrorInvalidParameterValue`, `AWSQuicksightErrorResourceNotFound`, `AWSQuicksightErrorThrottling`, `AWSQuicksightErrorInternalFailure`, `AWSQuicksightErrorResourceUnavailable`.
 
 @see AWSQuicksightUpdateUserRequest
 @see AWSQuicksightUpdateUserResponse
 */
- (void)updateUser:(AWSQuicksightUpdateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSQuicksightUpdateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
