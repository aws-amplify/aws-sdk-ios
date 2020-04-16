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
#import "AWSmghModel.h"
#import "AWSmghResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSmgh
FOUNDATION_EXPORT NSString *const AWSmghSDKVersion;

/**
 <p>The AWS Migration Hub API methods help to obtain server and application migration status and integrate your resource-specific migration tool by providing a programmatic interface to Migration Hub.</p><p>Remember that you must set your AWS Migration Hub home region before you call any of these APIs, or a <code>HomeRegionNotSetException</code> error will be returned. Also, you must make the API calls while in your home region.</p>
 */
@interface AWSmgh : AWSService

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

     let mgh = AWSmgh.default()

 *Objective-C*

     AWSmgh *mgh = [AWSmgh defaultmgh];

 @return The default service client.
 */
+ (instancetype)defaultmgh;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSmgh.register(with: configuration!, forKey: "USWest2mgh")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSmgh registermghWithConfiguration:configuration forKey:@"USWest2mgh"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let mgh = AWSmgh(forKey: "USWest2mgh")

 *Objective-C*

     AWSmgh *mgh = [AWSmgh mghForKey:@"USWest2mgh"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registermghWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registermghWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSmgh.register(with: configuration!, forKey: "USWest2mgh")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSmgh registermghWithConfiguration:configuration forKey:@"USWest2mgh"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let mgh = AWSmgh(forKey: "USWest2mgh")

 *Objective-C*

     AWSmgh *mgh = [AWSmgh mghForKey:@"USWest2mgh"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)mghForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removemghForKey:(NSString *)key;

/**
 <p>Associates a created artifact of an AWS cloud resource, the target receiving the migration, with the migration task performed by a migration tool. This API has the following traits:</p><ul><li><p>Migration tools can call the <code>AssociateCreatedArtifact</code> operation to indicate which AWS artifact is associated with a migration task.</p></li><li><p>The created artifact name must be provided in ARN (Amazon Resource Name) format which will contain information about type and region; for example: <code>arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b</code>.</p></li><li><p>Examples of the AWS resource behind the created artifact are, AMI's, EC2 instance, or DMS endpoint, etc.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the AssociateCreatedArtifact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghAssociateCreatedArtifactResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghAssociateCreatedArtifactRequest
 @see AWSmghAssociateCreatedArtifactResult
 */
- (AWSTask<AWSmghAssociateCreatedArtifactResult *> *)associateCreatedArtifact:(AWSmghAssociateCreatedArtifactRequest *)request;

/**
 <p>Associates a created artifact of an AWS cloud resource, the target receiving the migration, with the migration task performed by a migration tool. This API has the following traits:</p><ul><li><p>Migration tools can call the <code>AssociateCreatedArtifact</code> operation to indicate which AWS artifact is associated with a migration task.</p></li><li><p>The created artifact name must be provided in ARN (Amazon Resource Name) format which will contain information about type and region; for example: <code>arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b</code>.</p></li><li><p>Examples of the AWS resource behind the created artifact are, AMI's, EC2 instance, or DMS endpoint, etc.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the AssociateCreatedArtifact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghAssociateCreatedArtifactRequest
 @see AWSmghAssociateCreatedArtifactResult
 */
- (void)associateCreatedArtifact:(AWSmghAssociateCreatedArtifactRequest *)request completionHandler:(void (^ _Nullable)(AWSmghAssociateCreatedArtifactResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a discovered resource ID from Application Discovery Service with a migration task.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDiscoveredResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghAssociateDiscoveredResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorPolicyError`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghAssociateDiscoveredResourceRequest
 @see AWSmghAssociateDiscoveredResourceResult
 */
- (AWSTask<AWSmghAssociateDiscoveredResourceResult *> *)associateDiscoveredResource:(AWSmghAssociateDiscoveredResourceRequest *)request;

/**
 <p>Associates a discovered resource ID from Application Discovery Service with a migration task.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDiscoveredResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorPolicyError`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghAssociateDiscoveredResourceRequest
 @see AWSmghAssociateDiscoveredResourceResult
 */
- (void)associateDiscoveredResource:(AWSmghAssociateDiscoveredResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSmghAssociateDiscoveredResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a progress update stream which is an AWS resource used for access control as well as a namespace for migration task names that is implicitly linked to your AWS account. It must uniquely identify the migration tool as it is used for all updates made by the tool; however, it does not need to be unique for each AWS account because it is scoped to the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreateProgressUpdateStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghCreateProgressUpdateStreamResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghCreateProgressUpdateStreamRequest
 @see AWSmghCreateProgressUpdateStreamResult
 */
- (AWSTask<AWSmghCreateProgressUpdateStreamResult *> *)createProgressUpdateStream:(AWSmghCreateProgressUpdateStreamRequest *)request;

/**
 <p>Creates a progress update stream which is an AWS resource used for access control as well as a namespace for migration task names that is implicitly linked to your AWS account. It must uniquely identify the migration tool as it is used for all updates made by the tool; however, it does not need to be unique for each AWS account because it is scoped to the AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreateProgressUpdateStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghCreateProgressUpdateStreamRequest
 @see AWSmghCreateProgressUpdateStreamResult
 */
- (void)createProgressUpdateStream:(AWSmghCreateProgressUpdateStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSmghCreateProgressUpdateStreamResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a progress update stream, including all of its tasks, which was previously created as an AWS resource used for access control. This API has the following traits:</p><ul><li><p>The only parameter needed for <code>DeleteProgressUpdateStream</code> is the stream name (same as a <code>CreateProgressUpdateStream</code> call).</p></li><li><p>The call will return, and a background process will asynchronously delete the stream and all of its resources (tasks, associated resources, resource attributes, created artifacts).</p></li><li><p>If the stream takes time to be deleted, it might still show up on a <code>ListProgressUpdateStreams</code> call.</p></li><li><p><code>CreateProgressUpdateStream</code>, <code>ImportMigrationTask</code>, <code>NotifyMigrationTaskState</code>, and all Associate[*] APIs related to the tasks belonging to the stream will throw "InvalidInputException" if the stream of the same name is in the process of being deleted.</p></li><li><p>Once the stream and all of its resources are deleted, <code>CreateProgressUpdateStream</code> for a stream of the same name will succeed, and that stream will be an entirely new logical resource (without any resources associated with the old stream).</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteProgressUpdateStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghDeleteProgressUpdateStreamResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghDeleteProgressUpdateStreamRequest
 @see AWSmghDeleteProgressUpdateStreamResult
 */
- (AWSTask<AWSmghDeleteProgressUpdateStreamResult *> *)deleteProgressUpdateStream:(AWSmghDeleteProgressUpdateStreamRequest *)request;

/**
 <p>Deletes a progress update stream, including all of its tasks, which was previously created as an AWS resource used for access control. This API has the following traits:</p><ul><li><p>The only parameter needed for <code>DeleteProgressUpdateStream</code> is the stream name (same as a <code>CreateProgressUpdateStream</code> call).</p></li><li><p>The call will return, and a background process will asynchronously delete the stream and all of its resources (tasks, associated resources, resource attributes, created artifacts).</p></li><li><p>If the stream takes time to be deleted, it might still show up on a <code>ListProgressUpdateStreams</code> call.</p></li><li><p><code>CreateProgressUpdateStream</code>, <code>ImportMigrationTask</code>, <code>NotifyMigrationTaskState</code>, and all Associate[*] APIs related to the tasks belonging to the stream will throw "InvalidInputException" if the stream of the same name is in the process of being deleted.</p></li><li><p>Once the stream and all of its resources are deleted, <code>CreateProgressUpdateStream</code> for a stream of the same name will succeed, and that stream will be an entirely new logical resource (without any resources associated with the old stream).</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteProgressUpdateStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghDeleteProgressUpdateStreamRequest
 @see AWSmghDeleteProgressUpdateStreamResult
 */
- (void)deleteProgressUpdateStream:(AWSmghDeleteProgressUpdateStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSmghDeleteProgressUpdateStreamResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the migration status of an application.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApplicationState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghDescribeApplicationStateResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorPolicyError`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghDescribeApplicationStateRequest
 @see AWSmghDescribeApplicationStateResult
 */
- (AWSTask<AWSmghDescribeApplicationStateResult *> *)describeApplicationState:(AWSmghDescribeApplicationStateRequest *)request;

/**
 <p>Gets the migration status of an application.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApplicationState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorPolicyError`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghDescribeApplicationStateRequest
 @see AWSmghDescribeApplicationStateResult
 */
- (void)describeApplicationState:(AWSmghDescribeApplicationStateRequest *)request completionHandler:(void (^ _Nullable)(AWSmghDescribeApplicationStateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of all attributes associated with a specific migration task.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMigrationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghDescribeMigrationTaskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghDescribeMigrationTaskRequest
 @see AWSmghDescribeMigrationTaskResult
 */
- (AWSTask<AWSmghDescribeMigrationTaskResult *> *)describeMigrationTask:(AWSmghDescribeMigrationTaskRequest *)request;

/**
 <p>Retrieves a list of all attributes associated with a specific migration task.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMigrationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghDescribeMigrationTaskRequest
 @see AWSmghDescribeMigrationTaskResult
 */
- (void)describeMigrationTask:(AWSmghDescribeMigrationTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSmghDescribeMigrationTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a created artifact of an AWS resource with a migration task performed by a migration tool that was previously associated. This API has the following traits:</p><ul><li><p>A migration user can call the <code>DisassociateCreatedArtifacts</code> operation to disassociate a created AWS Artifact from a migration task.</p></li><li><p>The created artifact name must be provided in ARN (Amazon Resource Name) format which will contain information about type and region; for example: <code>arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b</code>.</p></li><li><p>Examples of the AWS resource behind the created artifact are, AMI's, EC2 instance, or RDS instance, etc.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DisassociateCreatedArtifact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghDisassociateCreatedArtifactResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghDisassociateCreatedArtifactRequest
 @see AWSmghDisassociateCreatedArtifactResult
 */
- (AWSTask<AWSmghDisassociateCreatedArtifactResult *> *)disassociateCreatedArtifact:(AWSmghDisassociateCreatedArtifactRequest *)request;

/**
 <p>Disassociates a created artifact of an AWS resource with a migration task performed by a migration tool that was previously associated. This API has the following traits:</p><ul><li><p>A migration user can call the <code>DisassociateCreatedArtifacts</code> operation to disassociate a created AWS Artifact from a migration task.</p></li><li><p>The created artifact name must be provided in ARN (Amazon Resource Name) format which will contain information about type and region; for example: <code>arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b</code>.</p></li><li><p>Examples of the AWS resource behind the created artifact are, AMI's, EC2 instance, or RDS instance, etc.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DisassociateCreatedArtifact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghDisassociateCreatedArtifactRequest
 @see AWSmghDisassociateCreatedArtifactResult
 */
- (void)disassociateCreatedArtifact:(AWSmghDisassociateCreatedArtifactRequest *)request completionHandler:(void (^ _Nullable)(AWSmghDisassociateCreatedArtifactResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociate an Application Discovery Service discovered resource from a migration task.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateDiscoveredResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghDisassociateDiscoveredResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghDisassociateDiscoveredResourceRequest
 @see AWSmghDisassociateDiscoveredResourceResult
 */
- (AWSTask<AWSmghDisassociateDiscoveredResourceResult *> *)disassociateDiscoveredResource:(AWSmghDisassociateDiscoveredResourceRequest *)request;

/**
 <p>Disassociate an Application Discovery Service discovered resource from a migration task.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateDiscoveredResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghDisassociateDiscoveredResourceRequest
 @see AWSmghDisassociateDiscoveredResourceResult
 */
- (void)disassociateDiscoveredResource:(AWSmghDisassociateDiscoveredResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSmghDisassociateDiscoveredResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers a new migration task which represents a server, database, etc., being migrated to AWS by a migration tool.</p><p>This API is a prerequisite to calling the <code>NotifyMigrationTaskState</code> API as the migration tool must first register the migration task with Migration Hub.</p>
 
 @param request A container for the necessary parameters to execute the ImportMigrationTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghImportMigrationTaskResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghImportMigrationTaskRequest
 @see AWSmghImportMigrationTaskResult
 */
- (AWSTask<AWSmghImportMigrationTaskResult *> *)importMigrationTask:(AWSmghImportMigrationTaskRequest *)request;

/**
 <p>Registers a new migration task which represents a server, database, etc., being migrated to AWS by a migration tool.</p><p>This API is a prerequisite to calling the <code>NotifyMigrationTaskState</code> API as the migration tool must first register the migration task with Migration Hub.</p>
 
 @param request A container for the necessary parameters to execute the ImportMigrationTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghImportMigrationTaskRequest
 @see AWSmghImportMigrationTaskResult
 */
- (void)importMigrationTask:(AWSmghImportMigrationTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSmghImportMigrationTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the migration statuses for your applications. If you use the optional <code>ApplicationIds</code> parameter, only the migration statuses for those applications will be returned.</p>
 
 @param request A container for the necessary parameters to execute the ListApplicationStates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghListApplicationStatesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghListApplicationStatesRequest
 @see AWSmghListApplicationStatesResult
 */
- (AWSTask<AWSmghListApplicationStatesResult *> *)listApplicationStates:(AWSmghListApplicationStatesRequest *)request;

/**
 <p>Lists all the migration statuses for your applications. If you use the optional <code>ApplicationIds</code> parameter, only the migration statuses for those applications will be returned.</p>
 
 @param request A container for the necessary parameters to execute the ListApplicationStates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghListApplicationStatesRequest
 @see AWSmghListApplicationStatesResult
 */
- (void)listApplicationStates:(AWSmghListApplicationStatesRequest *)request completionHandler:(void (^ _Nullable)(AWSmghListApplicationStatesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the created artifacts attached to a given migration task in an update stream. This API has the following traits:</p><ul><li><p>Gets the list of the created artifacts while migration is taking place.</p></li><li><p>Shows the artifacts created by the migration tool that was associated by the <code>AssociateCreatedArtifact</code> API. </p></li><li><p>Lists created artifacts in a paginated interface. </p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListCreatedArtifacts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghListCreatedArtifactsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghListCreatedArtifactsRequest
 @see AWSmghListCreatedArtifactsResult
 */
- (AWSTask<AWSmghListCreatedArtifactsResult *> *)listCreatedArtifacts:(AWSmghListCreatedArtifactsRequest *)request;

/**
 <p>Lists the created artifacts attached to a given migration task in an update stream. This API has the following traits:</p><ul><li><p>Gets the list of the created artifacts while migration is taking place.</p></li><li><p>Shows the artifacts created by the migration tool that was associated by the <code>AssociateCreatedArtifact</code> API. </p></li><li><p>Lists created artifacts in a paginated interface. </p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListCreatedArtifacts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghListCreatedArtifactsRequest
 @see AWSmghListCreatedArtifactsResult
 */
- (void)listCreatedArtifacts:(AWSmghListCreatedArtifactsRequest *)request completionHandler:(void (^ _Nullable)(AWSmghListCreatedArtifactsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists discovered resources associated with the given <code>MigrationTask</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListDiscoveredResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghListDiscoveredResourcesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghListDiscoveredResourcesRequest
 @see AWSmghListDiscoveredResourcesResult
 */
- (AWSTask<AWSmghListDiscoveredResourcesResult *> *)listDiscoveredResources:(AWSmghListDiscoveredResourcesRequest *)request;

/**
 <p>Lists discovered resources associated with the given <code>MigrationTask</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListDiscoveredResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghListDiscoveredResourcesRequest
 @see AWSmghListDiscoveredResourcesResult
 */
- (void)listDiscoveredResources:(AWSmghListDiscoveredResourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSmghListDiscoveredResourcesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all, or filtered by resource name, migration tasks associated with the user account making this call. This API has the following traits:</p><ul><li><p>Can show a summary list of the most recent migration tasks.</p></li><li><p>Can show a summary list of migration tasks associated with a given discovered resource.</p></li><li><p>Lists migration tasks in a paginated interface.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListMigrationTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghListMigrationTasksResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorPolicyError`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghListMigrationTasksRequest
 @see AWSmghListMigrationTasksResult
 */
- (AWSTask<AWSmghListMigrationTasksResult *> *)listMigrationTasks:(AWSmghListMigrationTasksRequest *)request;

/**
 <p>Lists all, or filtered by resource name, migration tasks associated with the user account making this call. This API has the following traits:</p><ul><li><p>Can show a summary list of the most recent migration tasks.</p></li><li><p>Can show a summary list of migration tasks associated with a given discovered resource.</p></li><li><p>Lists migration tasks in a paginated interface.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListMigrationTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorPolicyError`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghListMigrationTasksRequest
 @see AWSmghListMigrationTasksResult
 */
- (void)listMigrationTasks:(AWSmghListMigrationTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSmghListMigrationTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists progress update streams associated with the user account making this call.</p>
 
 @param request A container for the necessary parameters to execute the ListProgressUpdateStreams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghListProgressUpdateStreamsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghListProgressUpdateStreamsRequest
 @see AWSmghListProgressUpdateStreamsResult
 */
- (AWSTask<AWSmghListProgressUpdateStreamsResult *> *)listProgressUpdateStreams:(AWSmghListProgressUpdateStreamsRequest *)request;

/**
 <p>Lists progress update streams associated with the user account making this call.</p>
 
 @param request A container for the necessary parameters to execute the ListProgressUpdateStreams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorInvalidInput`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghListProgressUpdateStreamsRequest
 @see AWSmghListProgressUpdateStreamsResult
 */
- (void)listProgressUpdateStreams:(AWSmghListProgressUpdateStreamsRequest *)request completionHandler:(void (^ _Nullable)(AWSmghListProgressUpdateStreamsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the migration state of an application. For a given application identified by the value passed to <code>ApplicationId</code>, its status is set or updated by passing one of three values to <code>Status</code>: <code>NOT_STARTED | IN_PROGRESS | COMPLETED</code>.</p>
 
 @param request A container for the necessary parameters to execute the NotifyApplicationState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghNotifyApplicationStateResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorPolicyError`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghNotifyApplicationStateRequest
 @see AWSmghNotifyApplicationStateResult
 */
- (AWSTask<AWSmghNotifyApplicationStateResult *> *)notifyApplicationState:(AWSmghNotifyApplicationStateRequest *)request;

/**
 <p>Sets the migration state of an application. For a given application identified by the value passed to <code>ApplicationId</code>, its status is set or updated by passing one of three values to <code>Status</code>: <code>NOT_STARTED | IN_PROGRESS | COMPLETED</code>.</p>
 
 @param request A container for the necessary parameters to execute the NotifyApplicationState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorPolicyError`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghNotifyApplicationStateRequest
 @see AWSmghNotifyApplicationStateResult
 */
- (void)notifyApplicationState:(AWSmghNotifyApplicationStateRequest *)request completionHandler:(void (^ _Nullable)(AWSmghNotifyApplicationStateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Notifies Migration Hub of the current status, progress, or other detail regarding a migration task. This API has the following traits:</p><ul><li><p>Migration tools will call the <code>NotifyMigrationTaskState</code> API to share the latest progress and status.</p></li><li><p><code>MigrationTaskName</code> is used for addressing updates to the correct target.</p></li><li><p><code>ProgressUpdateStream</code> is used for access control and to provide a namespace for each migration tool.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the NotifyMigrationTaskState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghNotifyMigrationTaskStateResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghNotifyMigrationTaskStateRequest
 @see AWSmghNotifyMigrationTaskStateResult
 */
- (AWSTask<AWSmghNotifyMigrationTaskStateResult *> *)notifyMigrationTaskState:(AWSmghNotifyMigrationTaskStateRequest *)request;

/**
 <p>Notifies Migration Hub of the current status, progress, or other detail regarding a migration task. This API has the following traits:</p><ul><li><p>Migration tools will call the <code>NotifyMigrationTaskState</code> API to share the latest progress and status.</p></li><li><p><code>MigrationTaskName</code> is used for addressing updates to the correct target.</p></li><li><p><code>ProgressUpdateStream</code> is used for access control and to provide a namespace for each migration tool.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the NotifyMigrationTaskState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghNotifyMigrationTaskStateRequest
 @see AWSmghNotifyMigrationTaskStateResult
 */
- (void)notifyMigrationTaskState:(AWSmghNotifyMigrationTaskStateRequest *)request completionHandler:(void (^ _Nullable)(AWSmghNotifyMigrationTaskStateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides identifying details of the resource being migrated so that it can be associated in the Application Discovery Service repository. This association occurs asynchronously after <code>PutResourceAttributes</code> returns.</p><important><ul><li><p>Keep in mind that subsequent calls to PutResourceAttributes will override previously stored attributes. For example, if it is first called with a MAC address, but later, it is desired to <i>add</i> an IP address, it will then be required to call it with <i>both</i> the IP and MAC addresses to prevent overriding the MAC address.</p></li><li><p>Note the instructions regarding the special use case of the <a href="https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#migrationhub-PutResourceAttributes-request-ResourceAttributeList"><code>ResourceAttributeList</code></a> parameter when specifying any "VM" related value.</p></li></ul></important><note><p>Because this is an asynchronous call, it will always return 200, whether an association occurs or not. To confirm if an association was found based on the provided details, call <code>ListDiscoveredResources</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the PutResourceAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmghPutResourceAttributesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghPutResourceAttributesRequest
 @see AWSmghPutResourceAttributesResult
 */
- (AWSTask<AWSmghPutResourceAttributesResult *> *)putResourceAttributes:(AWSmghPutResourceAttributesRequest *)request;

/**
 <p>Provides identifying details of the resource being migrated so that it can be associated in the Application Discovery Service repository. This association occurs asynchronously after <code>PutResourceAttributes</code> returns.</p><important><ul><li><p>Keep in mind that subsequent calls to PutResourceAttributes will override previously stored attributes. For example, if it is first called with a MAC address, but later, it is desired to <i>add</i> an IP address, it will then be required to call it with <i>both</i> the IP and MAC addresses to prevent overriding the MAC address.</p></li><li><p>Note the instructions regarding the special use case of the <a href="https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#migrationhub-PutResourceAttributes-request-ResourceAttributeList"><code>ResourceAttributeList</code></a> parameter when specifying any "VM" related value.</p></li></ul></important><note><p>Because this is an asynchronous call, it will always return 200, whether an association occurs or not. To confirm if an association was found based on the provided details, call <code>ListDiscoveredResources</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the PutResourceAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmghErrorDomain` domain and the following error code: `AWSmghErrorAccessDenied`, `AWSmghErrorThrottling`, `AWSmghErrorInternalServer`, `AWSmghErrorServiceUnavailable`, `AWSmghErrorDryRunOperation`, `AWSmghErrorUnauthorizedOperation`, `AWSmghErrorInvalidInput`, `AWSmghErrorResourceNotFound`, `AWSmghErrorHomeRegionNotSet`.
 
 @see AWSmghPutResourceAttributesRequest
 @see AWSmghPutResourceAttributesResult
 */
- (void)putResourceAttributes:(AWSmghPutResourceAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSmghPutResourceAttributesResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
