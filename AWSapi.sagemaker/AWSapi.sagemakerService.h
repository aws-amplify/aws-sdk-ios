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
#import "AWSapi.sagemakerModel.h"
#import "AWSapi.sagemakerResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSapi.sagemaker
FOUNDATION_EXPORT NSString *const AWSapi.sagemakerSDKVersion;

/**
 <p>Provides APIs for creating and managing Amazon SageMaker resources. </p><p>Other Resources:</p><ul><li><p><a href="https://docs.aws.amazon.com/sagemaker/latest/dg/whatis.html#first-time-user">Amazon SageMaker Developer Guide</a></p></li><li><p><a href="https://docs.aws.amazon.com/augmented-ai/2019-11-07/APIReference/Welcome.html">Amazon Augmented AI Runtime API Reference</a></p></li></ul>
 */
@interface AWSapi.sagemaker : AWSService

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

     let api.sagemaker = AWSapi.sagemaker.default()

 *Objective-C*

     AWSapi.sagemaker *api.sagemaker = [AWSapi.sagemaker defaultapi.sagemaker];

 @return The default service client.
 */
+ (instancetype)defaultapi.sagemaker;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapi.sagemaker.register(with: configuration!, forKey: "USWest2api.sagemaker")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:@"USWest2api.sagemaker"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let api.sagemaker = AWSapi.sagemaker(forKey: "USWest2api.sagemaker")

 *Objective-C*

     AWSapi.sagemaker *api.sagemaker = [AWSapi.sagemaker api.sagemakerForKey:@"USWest2api.sagemaker"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerapi.sagemakerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerapi.sagemakerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapi.sagemaker.register(with: configuration!, forKey: "USWest2api.sagemaker")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:@"USWest2api.sagemaker"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let api.sagemaker = AWSapi.sagemaker(forKey: "USWest2api.sagemaker")

 *Objective-C*

     AWSapi.sagemaker *api.sagemaker = [AWSapi.sagemaker api.sagemakerForKey:@"USWest2api.sagemaker"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)api.sagemakerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeapi.sagemakerForKey:(NSString *)key;

/**
 <p>Adds or overwrites one or more tags for the specified Amazon SageMaker resource. You can add tags to notebook instances, training jobs, hyperparameter tuning jobs, batch transform jobs, models, labeling jobs, work teams, endpoint configurations, and endpoints.</p><p>Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see For more information, see <a href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS Tagging Strategies</a>.</p><note><p>Tags that you add to a hyperparameter tuning job by calling this API are also added to any training jobs that the hyperparameter tuning job launches after you call this API, but not to training jobs that the hyperparameter tuning job launched before you called this API. To make sure that the tags associated with a hyperparameter tuning job are also added to all training jobs that the hyperparameter tuning job launches, add the tags when you first create the tuning job by specifying them in the <code>Tags</code> parameter of <a>CreateHyperParameterTuningJob</a></p></note>
 
 @param request A container for the necessary parameters to execute the AddTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerAddTagsOutput`.
 
 @see AWSapi.sagemakerAddTagsInput
 @see AWSapi.sagemakerAddTagsOutput
 */
- (AWSTask<AWSapi.sagemakerAddTagsOutput *> *)addTags:(AWSapi.sagemakerAddTagsInput *)request;

/**
 <p>Adds or overwrites one or more tags for the specified Amazon SageMaker resource. You can add tags to notebook instances, training jobs, hyperparameter tuning jobs, batch transform jobs, models, labeling jobs, work teams, endpoint configurations, and endpoints.</p><p>Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see For more information, see <a href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS Tagging Strategies</a>.</p><note><p>Tags that you add to a hyperparameter tuning job by calling this API are also added to any training jobs that the hyperparameter tuning job launches after you call this API, but not to training jobs that the hyperparameter tuning job launched before you called this API. To make sure that the tags associated with a hyperparameter tuning job are also added to all training jobs that the hyperparameter tuning job launches, add the tags when you first create the tuning job by specifying them in the <code>Tags</code> parameter of <a>CreateHyperParameterTuningJob</a></p></note>
 
 @param request A container for the necessary parameters to execute the AddTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerAddTagsInput
 @see AWSapi.sagemakerAddTagsOutput
 */
- (void)addTags:(AWSapi.sagemakerAddTagsInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerAddTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a trial component with a trial. A trial component can be associated with multiple trials. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerAssociateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerAssociateTrialComponentRequest
 @see AWSapi.sagemakerAssociateTrialComponentResponse
 */
- (AWSTask<AWSapi.sagemakerAssociateTrialComponentResponse *> *)associateTrialComponent:(AWSapi.sagemakerAssociateTrialComponentRequest *)request;

/**
 <p>Associates a trial component with a trial. A trial component can be associated with multiple trials. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerAssociateTrialComponentRequest
 @see AWSapi.sagemakerAssociateTrialComponentResponse
 */
- (void)associateTrialComponent:(AWSapi.sagemakerAssociateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerAssociateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a machine learning algorithm that you can use in Amazon SageMaker and list in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlgorithm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateAlgorithmOutput`.
 
 @see AWSapi.sagemakerCreateAlgorithmInput
 @see AWSapi.sagemakerCreateAlgorithmOutput
 */
- (AWSTask<AWSapi.sagemakerCreateAlgorithmOutput *> *)createAlgorithm:(AWSapi.sagemakerCreateAlgorithmInput *)request;

/**
 <p>Create a machine learning algorithm that you can use in Amazon SageMaker and list in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlgorithm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerCreateAlgorithmInput
 @see AWSapi.sagemakerCreateAlgorithmOutput
 */
- (void)createAlgorithm:(AWSapi.sagemakerCreateAlgorithmInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateAlgorithmOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a running App for the specified UserProfile. Supported Apps are JupyterServer and KernelGateway. This operation is automatically invoked by Amazon SageMaker Amazon SageMaker Studio (Studio) upon access to the associated Studio Domain, and when new kernel configurations are selected by the user. A user may have multiple Apps active simultaneously. Apps will automatically terminate and be deleted when stopped from within Studio, or when the DeleteApp API is manually called. UserProfiles are limited to 5 concurrently running Apps at a time.</p>
 
 @param request A container for the necessary parameters to execute the CreateApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateAppRequest
 @see AWSapi.sagemakerCreateAppResponse
 */
- (AWSTask<AWSapi.sagemakerCreateAppResponse *> *)createApp:(AWSapi.sagemakerCreateAppRequest *)request;

/**
 <p>Creates a running App for the specified UserProfile. Supported Apps are JupyterServer and KernelGateway. This operation is automatically invoked by Amazon SageMaker Amazon SageMaker Studio (Studio) upon access to the associated Studio Domain, and when new kernel configurations are selected by the user. A user may have multiple Apps active simultaneously. Apps will automatically terminate and be deleted when stopped from within Studio, or when the DeleteApp API is manually called. UserProfiles are limited to 5 concurrently running Apps at a time.</p>
 
 @param request A container for the necessary parameters to execute the CreateApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateAppRequest
 @see AWSapi.sagemakerCreateAppResponse
 */
- (void)createApp:(AWSapi.sagemakerCreateAppRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AutoPilot job.</p><p>After you run an AutoPilot job, you can find the best performing model by calling , and then deploy that model by following the steps described in <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html">Step 6.1: Deploy the Model to Amazon SageMaker Hosting Services</a>.</p><p>For information about how to use AutoPilot, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html">Use AutoPilot to Automate Model Development</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateAutoMLJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateAutoMLJobRequest
 @see AWSapi.sagemakerCreateAutoMLJobResponse
 */
- (AWSTask<AWSapi.sagemakerCreateAutoMLJobResponse *> *)createAutoMLJob:(AWSapi.sagemakerCreateAutoMLJobRequest *)request;

/**
 <p>Creates an AutoPilot job.</p><p>After you run an AutoPilot job, you can find the best performing model by calling , and then deploy that model by following the steps described in <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html">Step 6.1: Deploy the Model to Amazon SageMaker Hosting Services</a>.</p><p>For information about how to use AutoPilot, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html">Use AutoPilot to Automate Model Development</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateAutoMLJobRequest
 @see AWSapi.sagemakerCreateAutoMLJobResponse
 */
- (void)createAutoMLJob:(AWSapi.sagemakerCreateAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateAutoMLJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Git repository as a resource in your Amazon SageMaker account. You can associate the repository with notebook instances so that you can use Git source control for the notebooks you create. The Git repository is a resource in your Amazon SageMaker account, so it can be associated with more than one notebook instance, and it persists independently from the lifecycle of any notebook instances it is associated with.</p><p>The repository can be hosted either in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository.</p>
 
 @param request A container for the necessary parameters to execute the CreateCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateCodeRepositoryOutput`.
 
 @see AWSapi.sagemakerCreateCodeRepositoryInput
 @see AWSapi.sagemakerCreateCodeRepositoryOutput
 */
- (AWSTask<AWSapi.sagemakerCreateCodeRepositoryOutput *> *)createCodeRepository:(AWSapi.sagemakerCreateCodeRepositoryInput *)request;

/**
 <p>Creates a Git repository as a resource in your Amazon SageMaker account. You can associate the repository with notebook instances so that you can use Git source control for the notebooks you create. The Git repository is a resource in your Amazon SageMaker account, so it can be associated with more than one notebook instance, and it persists independently from the lifecycle of any notebook instances it is associated with.</p><p>The repository can be hosted either in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository.</p>
 
 @param request A container for the necessary parameters to execute the CreateCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerCreateCodeRepositoryInput
 @see AWSapi.sagemakerCreateCodeRepositoryOutput
 */
- (void)createCodeRepository:(AWSapi.sagemakerCreateCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateCodeRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a model compilation job. After the model has been compiled, Amazon SageMaker saves the resulting model artifacts to an Amazon Simple Storage Service (Amazon S3) bucket that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts with AWS IoT Greengrass. In that case, deploy them as an ML resource.</p><p>In the request body, you provide the following:</p><ul><li><p>A name for the compilation job</p></li><li><p> Information about the input model artifacts </p></li><li><p>The output location for the compiled model and the device (target) that the model runs on </p></li><li><p><code>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker assumes to perform the model compilation job</code></p></li></ul><p>You can also provide a <code>Tag</code> to track the model compilation job's resource use and costs. The response body contains the <code>CompilationJobArn</code> for the compiled job.</p><p>To stop a model compilation job, use <a>StopCompilationJob</a>. To get information about a particular model compilation job, use <a>DescribeCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCompilationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateCompilationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateCompilationJobRequest
 @see AWSapi.sagemakerCreateCompilationJobResponse
 */
- (AWSTask<AWSapi.sagemakerCreateCompilationJobResponse *> *)createCompilationJob:(AWSapi.sagemakerCreateCompilationJobRequest *)request;

/**
 <p>Starts a model compilation job. After the model has been compiled, Amazon SageMaker saves the resulting model artifacts to an Amazon Simple Storage Service (Amazon S3) bucket that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts with AWS IoT Greengrass. In that case, deploy them as an ML resource.</p><p>In the request body, you provide the following:</p><ul><li><p>A name for the compilation job</p></li><li><p> Information about the input model artifacts </p></li><li><p>The output location for the compiled model and the device (target) that the model runs on </p></li><li><p><code>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker assumes to perform the model compilation job</code></p></li></ul><p>You can also provide a <code>Tag</code> to track the model compilation job's resource use and costs. The response body contains the <code>CompilationJobArn</code> for the compiled job.</p><p>To stop a model compilation job, use <a>StopCompilationJob</a>. To get information about a particular model compilation job, use <a>DescribeCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCompilationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateCompilationJobRequest
 @see AWSapi.sagemakerCreateCompilationJobResponse
 */
- (void)createCompilationJob:(AWSapi.sagemakerCreateCompilationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateCompilationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Domain for Amazon SageMaker Amazon SageMaker Studio (Studio), which can be accessed by end-users in a web browser. A Domain has an associated directory, list of authorized users, and a variety of security, application, policies, and Amazon Virtual Private Cloud configurations. An AWS account is limited to one Domain, per region. Users within a domain can share notebook files and other artifacts with each other. When a Domain is created, an Amazon Elastic File System (EFS) is also created for use by all of the users within the Domain. Each user receives a private home directory within the EFS for notebooks, Git repositories, and data files. </p>
 
 @param request A container for the necessary parameters to execute the CreateDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateDomainRequest
 @see AWSapi.sagemakerCreateDomainResponse
 */
- (AWSTask<AWSapi.sagemakerCreateDomainResponse *> *)createDomain:(AWSapi.sagemakerCreateDomainRequest *)request;

/**
 <p>Creates a Domain for Amazon SageMaker Amazon SageMaker Studio (Studio), which can be accessed by end-users in a web browser. A Domain has an associated directory, list of authorized users, and a variety of security, application, policies, and Amazon Virtual Private Cloud configurations. An AWS account is limited to one Domain, per region. Users within a domain can share notebook files and other artifacts with each other. When a Domain is created, an Amazon Elastic File System (EFS) is also created for use by all of the users within the Domain. Each user receives a private home directory within the EFS for notebooks, Git repositories, and data files. </p>
 
 @param request A container for the necessary parameters to execute the CreateDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateDomainRequest
 @see AWSapi.sagemakerCreateDomainResponse
 */
- (void)createDomain:(AWSapi.sagemakerCreateDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an endpoint using the endpoint configuration specified in the request. Amazon SageMaker uses the endpoint to provision resources and deploy models. You create the endpoint configuration with the <a>CreateEndpointConfig</a> API. </p><p> Use this API to deploy models using Amazon SageMaker hosting services. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><note><p> You must not delete an <code>EndpointConfig</code> that is in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p></note><p>The endpoint name must be unique within an AWS Region in your AWS account. </p><p>When it receives the request, Amazon SageMaker creates the endpoint, launches the resources (ML compute instances), and deploys the model(s) on them. </p><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Creating</code>. After it creates the endpoint, it sets the status to <code>InService</code>. Amazon SageMaker can then process incoming requests for inferences. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API.</p><p>If any of the models hosted at this endpoint get model data from an Amazon S3 location, Amazon SageMaker uses AWS Security Token Service to download model artifacts from the S3 path you provided. AWS STS is activated in your IAM user account by default. If you previously deactivated AWS STS for a region, you need to reactivate AWS STS for that region. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateEndpointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateEndpointInput
 @see AWSapi.sagemakerCreateEndpointOutput
 */
- (AWSTask<AWSapi.sagemakerCreateEndpointOutput *> *)createEndpoint:(AWSapi.sagemakerCreateEndpointInput *)request;

/**
 <p>Creates an endpoint using the endpoint configuration specified in the request. Amazon SageMaker uses the endpoint to provision resources and deploy models. You create the endpoint configuration with the <a>CreateEndpointConfig</a> API. </p><p> Use this API to deploy models using Amazon SageMaker hosting services. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><note><p> You must not delete an <code>EndpointConfig</code> that is in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p></note><p>The endpoint name must be unique within an AWS Region in your AWS account. </p><p>When it receives the request, Amazon SageMaker creates the endpoint, launches the resources (ML compute instances), and deploys the model(s) on them. </p><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Creating</code>. After it creates the endpoint, it sets the status to <code>InService</code>. Amazon SageMaker can then process incoming requests for inferences. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API.</p><p>If any of the models hosted at this endpoint get model data from an Amazon S3 location, Amazon SageMaker uses AWS Security Token Service to download model artifacts from the S3 path you provided. AWS STS is activated in your IAM user account by default. If you previously deactivated AWS STS for a region, you need to reactivate AWS STS for that region. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateEndpointInput
 @see AWSapi.sagemakerCreateEndpointOutput
 */
- (void)createEndpoint:(AWSapi.sagemakerCreateEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an endpoint configuration that Amazon SageMaker hosting services uses to deploy models. In the configuration, you identify one or more models, created using the <code>CreateModel</code> API, to deploy and the resources that you want Amazon SageMaker to provision. Then you call the <a>CreateEndpoint</a> API.</p><note><p> Use this API if you want to use Amazon SageMaker hosting services to deploy models into production. </p></note><p>In the request, you define a <code>ProductionVariant</code>, for each model that you want to deploy. Each <code>ProductionVariant</code> parameter also describes the resources that you want Amazon SageMaker to provision. This includes the number and type of ML compute instances to deploy. </p><p>If you are hosting multiple models, you also assign a <code>VariantWeight</code> to specify how much traffic you want to allocate to each model. For example, suppose that you want to host two models, A and B, and you assign traffic weight 2 for model A and 1 for model B. Amazon SageMaker distributes two-thirds of the traffic to Model A, and one-third to model B. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p>
 
 @param request A container for the necessary parameters to execute the CreateEndpointConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateEndpointConfigOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateEndpointConfigInput
 @see AWSapi.sagemakerCreateEndpointConfigOutput
 */
- (AWSTask<AWSapi.sagemakerCreateEndpointConfigOutput *> *)createEndpointConfig:(AWSapi.sagemakerCreateEndpointConfigInput *)request;

/**
 <p>Creates an endpoint configuration that Amazon SageMaker hosting services uses to deploy models. In the configuration, you identify one or more models, created using the <code>CreateModel</code> API, to deploy and the resources that you want Amazon SageMaker to provision. Then you call the <a>CreateEndpoint</a> API.</p><note><p> Use this API if you want to use Amazon SageMaker hosting services to deploy models into production. </p></note><p>In the request, you define a <code>ProductionVariant</code>, for each model that you want to deploy. Each <code>ProductionVariant</code> parameter also describes the resources that you want Amazon SageMaker to provision. This includes the number and type of ML compute instances to deploy. </p><p>If you are hosting multiple models, you also assign a <code>VariantWeight</code> to specify how much traffic you want to allocate to each model. For example, suppose that you want to host two models, A and B, and you assign traffic weight 2 for model A and 1 for model B. Amazon SageMaker distributes two-thirds of the traffic to Model A, and one-third to model B. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p>
 
 @param request A container for the necessary parameters to execute the CreateEndpointConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateEndpointConfigInput
 @see AWSapi.sagemakerCreateEndpointConfigOutput
 */
- (void)createEndpointConfig:(AWSapi.sagemakerCreateEndpointConfigInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateEndpointConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon SageMaker <i>experiment</i>. An experiment is a collection of <i>trials</i> that are observed, compared and evaluated as a group. A trial is a set of steps, called <i>trial components</i>, that produce a machine learning model.</p><p>The goal of an experiment is to determine the components that produce the best model. Multiple trials are performed, each one isolating and measuring the impact of a change to one or more inputs, while keeping the remaining inputs constant.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to experiments, trials, trial components and then use the <a>Search</a> API to search for the tags.</p><p>To add a description to an experiment, specify the optional <code>Description</code> parameter. To add a description later, or to change the description, call the <a>UpdateExperiment</a> API.</p><p>To get a list of all your experiments, call the <a>ListExperiments</a> API. To view an experiment's properties, call the <a>DescribeExperiment</a> API. To get a list of all the trials associated with an experiment, call the <a>ListTrials</a> API. To create a trial call the <a>CreateTrial</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateExperimentRequest
 @see AWSapi.sagemakerCreateExperimentResponse
 */
- (AWSTask<AWSapi.sagemakerCreateExperimentResponse *> *)createExperiment:(AWSapi.sagemakerCreateExperimentRequest *)request;

/**
 <p>Creates an Amazon SageMaker <i>experiment</i>. An experiment is a collection of <i>trials</i> that are observed, compared and evaluated as a group. A trial is a set of steps, called <i>trial components</i>, that produce a machine learning model.</p><p>The goal of an experiment is to determine the components that produce the best model. Multiple trials are performed, each one isolating and measuring the impact of a change to one or more inputs, while keeping the remaining inputs constant.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to experiments, trials, trial components and then use the <a>Search</a> API to search for the tags.</p><p>To add a description to an experiment, specify the optional <code>Description</code> parameter. To add a description later, or to change the description, call the <a>UpdateExperiment</a> API.</p><p>To get a list of all your experiments, call the <a>ListExperiments</a> API. To view an experiment's properties, call the <a>DescribeExperiment</a> API. To get a list of all the trials associated with an experiment, call the <a>ListTrials</a> API. To create a trial call the <a>CreateTrial</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateExperimentRequest
 @see AWSapi.sagemakerCreateExperimentResponse
 */
- (void)createExperiment:(AWSapi.sagemakerCreateExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a flow definition.</p>
 
 @param request A container for the necessary parameters to execute the CreateFlowDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateFlowDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateFlowDefinitionRequest
 @see AWSapi.sagemakerCreateFlowDefinitionResponse
 */
- (AWSTask<AWSapi.sagemakerCreateFlowDefinitionResponse *> *)createFlowDefinition:(AWSapi.sagemakerCreateFlowDefinitionRequest *)request;

/**
 <p>Creates a flow definition.</p>
 
 @param request A container for the necessary parameters to execute the CreateFlowDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateFlowDefinitionRequest
 @see AWSapi.sagemakerCreateFlowDefinitionResponse
 */
- (void)createFlowDefinition:(AWSapi.sagemakerCreateFlowDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateFlowDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Defines the settings you will use for the human review workflow user interface. Reviewers will see a three-panel interface with an instruction area, the item to review, and an input area.</p>
 
 @param request A container for the necessary parameters to execute the CreateHumanTaskUi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateHumanTaskUiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateHumanTaskUiRequest
 @see AWSapi.sagemakerCreateHumanTaskUiResponse
 */
- (AWSTask<AWSapi.sagemakerCreateHumanTaskUiResponse *> *)createHumanTaskUi:(AWSapi.sagemakerCreateHumanTaskUiRequest *)request;

/**
 <p>Defines the settings you will use for the human review workflow user interface. Reviewers will see a three-panel interface with an instruction area, the item to review, and an input area.</p>
 
 @param request A container for the necessary parameters to execute the CreateHumanTaskUi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateHumanTaskUiRequest
 @see AWSapi.sagemakerCreateHumanTaskUiResponse
 */
- (void)createHumanTaskUi:(AWSapi.sagemakerCreateHumanTaskUiRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateHumanTaskUiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a hyperparameter tuning job. A hyperparameter tuning job finds the best version of a model by running many training jobs on your dataset using the algorithm you choose and values for hyperparameters within ranges that you specify. It then chooses the hyperparameter values that result in a model that performs the best, as measured by an objective metric that you choose.</p>
 
 @param request A container for the necessary parameters to execute the CreateHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateHyperParameterTuningJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateHyperParameterTuningJobRequest
 @see AWSapi.sagemakerCreateHyperParameterTuningJobResponse
 */
- (AWSTask<AWSapi.sagemakerCreateHyperParameterTuningJobResponse *> *)createHyperParameterTuningJob:(AWSapi.sagemakerCreateHyperParameterTuningJobRequest *)request;

/**
 <p>Starts a hyperparameter tuning job. A hyperparameter tuning job finds the best version of a model by running many training jobs on your dataset using the algorithm you choose and values for hyperparameters within ranges that you specify. It then chooses the hyperparameter values that result in a model that performs the best, as measured by an objective metric that you choose.</p>
 
 @param request A container for the necessary parameters to execute the CreateHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateHyperParameterTuningJobRequest
 @see AWSapi.sagemakerCreateHyperParameterTuningJobResponse
 */
- (void)createHyperParameterTuningJob:(AWSapi.sagemakerCreateHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateHyperParameterTuningJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a job that uses workers to label the data objects in your input dataset. You can use the labeled data to train machine learning models.</p><p>You can select your workforce from one of three providers:</p><ul><li><p>A private workforce that you create. It can include employees, contractors, and outside experts. Use a private workforce when want the data to stay within your organization or when a specific set of skills is required.</p></li><li><p>One or more vendors that you select from the AWS Marketplace. Vendors provide expertise in specific areas. </p></li><li><p>The Amazon Mechanical Turk workforce. This is the largest workforce, but it should only be used for public data or data that has been stripped of any personally identifiable information.</p></li></ul><p>You can also use <i>automated data labeling</i> to reduce the number of data objects that need to be labeled by a human. Automated data labeling uses <i>active learning</i> to determine if a data object can be labeled by machine or if it needs to be sent to a human worker. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html">Using Automated Data Labeling</a>.</p><p>The data objects to be labeled are contained in an Amazon S3 bucket. You create a <i>manifest file</i> that describes the location of each object. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html">Using Input and Output Data</a>.</p><p>The output can be used as the manifest file for another labeling job or as training data for your machine learning models.</p>
 
 @param request A container for the necessary parameters to execute the CreateLabelingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateLabelingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateLabelingJobRequest
 @see AWSapi.sagemakerCreateLabelingJobResponse
 */
- (AWSTask<AWSapi.sagemakerCreateLabelingJobResponse *> *)createLabelingJob:(AWSapi.sagemakerCreateLabelingJobRequest *)request;

/**
 <p>Creates a job that uses workers to label the data objects in your input dataset. You can use the labeled data to train machine learning models.</p><p>You can select your workforce from one of three providers:</p><ul><li><p>A private workforce that you create. It can include employees, contractors, and outside experts. Use a private workforce when want the data to stay within your organization or when a specific set of skills is required.</p></li><li><p>One or more vendors that you select from the AWS Marketplace. Vendors provide expertise in specific areas. </p></li><li><p>The Amazon Mechanical Turk workforce. This is the largest workforce, but it should only be used for public data or data that has been stripped of any personally identifiable information.</p></li></ul><p>You can also use <i>automated data labeling</i> to reduce the number of data objects that need to be labeled by a human. Automated data labeling uses <i>active learning</i> to determine if a data object can be labeled by machine or if it needs to be sent to a human worker. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html">Using Automated Data Labeling</a>.</p><p>The data objects to be labeled are contained in an Amazon S3 bucket. You create a <i>manifest file</i> that describes the location of each object. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html">Using Input and Output Data</a>.</p><p>The output can be used as the manifest file for another labeling job or as training data for your machine learning models.</p>
 
 @param request A container for the necessary parameters to execute the CreateLabelingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateLabelingJobRequest
 @see AWSapi.sagemakerCreateLabelingJobResponse
 */
- (void)createLabelingJob:(AWSapi.sagemakerCreateLabelingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateLabelingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a model in Amazon SageMaker. In the request, you name the model and describe a primary container. For the primary container, you specify the Docker image that contains inference code, artifacts (from prior training), and a custom environment map that the inference code uses when you deploy the model for predictions.</p><p>Use this API to create a model if you want to use Amazon SageMaker hosting services or run a batch transform job.</p><p>To host your model, you create an endpoint configuration with the <code>CreateEndpointConfig</code> API, and then create an endpoint with the <code>CreateEndpoint</code> API. Amazon SageMaker then deploys all of the containers that you defined for the model in the hosting environment. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><p>To run a batch transform using your model, you start a job with the <code>CreateTransformJob</code> API. Amazon SageMaker uses your model and your dataset to get inferences which are then saved to a specified S3 location.</p><p>In the <code>CreateModel</code> request, you must define a container with the <code>PrimaryContainer</code> parameter.</p><p>In the request, you also provide an IAM role that Amazon SageMaker can assume to access model artifacts and docker image for deployment on ML compute hosting instances or for batch transform jobs. In addition, you also use the IAM role to manage permissions the inference code needs. For example, if the inference code access any other AWS resources, you grant necessary permissions via this role.</p>
 
 @param request A container for the necessary parameters to execute the CreateModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateModelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateModelInput
 @see AWSapi.sagemakerCreateModelOutput
 */
- (AWSTask<AWSapi.sagemakerCreateModelOutput *> *)createModel:(AWSapi.sagemakerCreateModelInput *)request;

/**
 <p>Creates a model in Amazon SageMaker. In the request, you name the model and describe a primary container. For the primary container, you specify the Docker image that contains inference code, artifacts (from prior training), and a custom environment map that the inference code uses when you deploy the model for predictions.</p><p>Use this API to create a model if you want to use Amazon SageMaker hosting services or run a batch transform job.</p><p>To host your model, you create an endpoint configuration with the <code>CreateEndpointConfig</code> API, and then create an endpoint with the <code>CreateEndpoint</code> API. Amazon SageMaker then deploys all of the containers that you defined for the model in the hosting environment. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><p>To run a batch transform using your model, you start a job with the <code>CreateTransformJob</code> API. Amazon SageMaker uses your model and your dataset to get inferences which are then saved to a specified S3 location.</p><p>In the <code>CreateModel</code> request, you must define a container with the <code>PrimaryContainer</code> parameter.</p><p>In the request, you also provide an IAM role that Amazon SageMaker can assume to access model artifacts and docker image for deployment on ML compute hosting instances or for batch transform jobs. In addition, you also use the IAM role to manage permissions the inference code needs. For example, if the inference code access any other AWS resources, you grant necessary permissions via this role.</p>
 
 @param request A container for the necessary parameters to execute the CreateModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateModelInput
 @see AWSapi.sagemakerCreateModelOutput
 */
- (void)createModel:(AWSapi.sagemakerCreateModelInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateModelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a model package that you can use to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p><p>To create a model package by specifying a Docker container that contains your inference code and the Amazon S3 location of your model artifacts, provide values for <code>InferenceSpecification</code>. To create a model from an algorithm resource that you created or subscribed to in AWS Marketplace, provide a value for <code>SourceAlgorithmSpecification</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateModelPackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateModelPackageOutput`.
 
 @see AWSapi.sagemakerCreateModelPackageInput
 @see AWSapi.sagemakerCreateModelPackageOutput
 */
- (AWSTask<AWSapi.sagemakerCreateModelPackageOutput *> *)createModelPackage:(AWSapi.sagemakerCreateModelPackageInput *)request;

/**
 <p>Creates a model package that you can use to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p><p>To create a model package by specifying a Docker container that contains your inference code and the Amazon S3 location of your model artifacts, provide values for <code>InferenceSpecification</code>. To create a model from an algorithm resource that you created or subscribed to in AWS Marketplace, provide a value for <code>SourceAlgorithmSpecification</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateModelPackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerCreateModelPackageInput
 @see AWSapi.sagemakerCreateModelPackageOutput
 */
- (void)createModelPackage:(AWSapi.sagemakerCreateModelPackageInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateModelPackageOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a schedule that regularly starts Amazon SageMaker Processing Jobs to monitor the data captured for an Amazon SageMaker Endoint.</p>
 
 @param request A container for the necessary parameters to execute the CreateMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateMonitoringScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateMonitoringScheduleRequest
 @see AWSapi.sagemakerCreateMonitoringScheduleResponse
 */
- (AWSTask<AWSapi.sagemakerCreateMonitoringScheduleResponse *> *)createMonitoringSchedule:(AWSapi.sagemakerCreateMonitoringScheduleRequest *)request;

/**
 <p>Creates a schedule that regularly starts Amazon SageMaker Processing Jobs to monitor the data captured for an Amazon SageMaker Endoint.</p>
 
 @param request A container for the necessary parameters to execute the CreateMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateMonitoringScheduleRequest
 @see AWSapi.sagemakerCreateMonitoringScheduleResponse
 */
- (void)createMonitoringSchedule:(AWSapi.sagemakerCreateMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateMonitoringScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon SageMaker notebook instance. A notebook instance is a machine learning (ML) compute instance running on a Jupyter notebook. </p><p>In a <code>CreateNotebookInstance</code> request, specify the type of ML compute instance that you want to run. Amazon SageMaker launches the instance, installs common libraries that you can use to explore datasets for model training, and attaches an ML storage volume to the notebook instance. </p><p>Amazon SageMaker also provides a set of example notebooks. Each notebook demonstrates how to use Amazon SageMaker with a specific algorithm or with a machine learning framework. </p><p>After receiving the request, Amazon SageMaker does the following:</p><ol><li><p>Creates a network interface in the Amazon SageMaker VPC.</p></li><li><p>(Option) If you specified <code>SubnetId</code>, Amazon SageMaker creates a network interface in your own VPC, which is inferred from the subnet ID that you provide in the input. When creating this network interface, Amazon SageMaker attaches the security group that you specified in the request to the network interface that it creates in your VPC.</p></li><li><p>Launches an EC2 instance of the type specified in the request in the Amazon SageMaker VPC. If you specified <code>SubnetId</code> of your VPC, Amazon SageMaker specifies both network interfaces when launching this instance. This enables inbound traffic from your own VPC to the notebook instance, assuming that the security groups allow it.</p></li></ol><p>After creating the notebook instance, Amazon SageMaker returns its Amazon Resource Name (ARN). You can't change the name of a notebook instance after you create it.</p><p>After Amazon SageMaker creates the notebook instance, you can connect to the Jupyter server and work in Jupyter notebooks. For example, you can write code to explore a dataset that you can use for model training, train a model, host models by creating Amazon SageMaker endpoints, and validate hosted models. </p><p>For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateNotebookInstanceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateNotebookInstanceInput
 @see AWSapi.sagemakerCreateNotebookInstanceOutput
 */
- (AWSTask<AWSapi.sagemakerCreateNotebookInstanceOutput *> *)createNotebookInstance:(AWSapi.sagemakerCreateNotebookInstanceInput *)request;

/**
 <p>Creates an Amazon SageMaker notebook instance. A notebook instance is a machine learning (ML) compute instance running on a Jupyter notebook. </p><p>In a <code>CreateNotebookInstance</code> request, specify the type of ML compute instance that you want to run. Amazon SageMaker launches the instance, installs common libraries that you can use to explore datasets for model training, and attaches an ML storage volume to the notebook instance. </p><p>Amazon SageMaker also provides a set of example notebooks. Each notebook demonstrates how to use Amazon SageMaker with a specific algorithm or with a machine learning framework. </p><p>After receiving the request, Amazon SageMaker does the following:</p><ol><li><p>Creates a network interface in the Amazon SageMaker VPC.</p></li><li><p>(Option) If you specified <code>SubnetId</code>, Amazon SageMaker creates a network interface in your own VPC, which is inferred from the subnet ID that you provide in the input. When creating this network interface, Amazon SageMaker attaches the security group that you specified in the request to the network interface that it creates in your VPC.</p></li><li><p>Launches an EC2 instance of the type specified in the request in the Amazon SageMaker VPC. If you specified <code>SubnetId</code> of your VPC, Amazon SageMaker specifies both network interfaces when launching this instance. This enables inbound traffic from your own VPC to the notebook instance, assuming that the security groups allow it.</p></li></ol><p>After creating the notebook instance, Amazon SageMaker returns its Amazon Resource Name (ARN). You can't change the name of a notebook instance after you create it.</p><p>After Amazon SageMaker creates the notebook instance, you can connect to the Jupyter server and work in Jupyter notebooks. For example, you can write code to explore a dataset that you can use for model training, train a model, host models by creating Amazon SageMaker endpoints, and validate hosted models. </p><p>For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateNotebookInstanceInput
 @see AWSapi.sagemakerCreateNotebookInstanceOutput
 */
- (void)createNotebookInstance:(AWSapi.sagemakerCreateNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateNotebookInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a lifecycle configuration that you can associate with a notebook instance. A <i>lifecycle configuration</i> is a collection of shell scripts that run when you create or start a notebook instance.</p><p>Each lifecycle configuration script has a limit of 16384 characters.</p><p>The value of the <code>$PATH</code> environment variable that is available to both scripts is <code>/sbin:bin:/usr/sbin:/usr/bin</code>.</p><p>View CloudWatch Logs for notebook instance lifecycle configurations in log group <code>/aws/sagemaker/NotebookInstances</code> in log stream <code>[notebook-instance-name]/[LifecycleConfigHook]</code>.</p><p>Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for longer than 5 minutes, it fails and the notebook instance is not created or started.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigInput
 @see AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput
 */
- (AWSTask<AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput *> *)createNotebookInstanceLifecycleConfig:(AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Creates a lifecycle configuration that you can associate with a notebook instance. A <i>lifecycle configuration</i> is a collection of shell scripts that run when you create or start a notebook instance.</p><p>Each lifecycle configuration script has a limit of 16384 characters.</p><p>The value of the <code>$PATH</code> environment variable that is available to both scripts is <code>/sbin:bin:/usr/sbin:/usr/bin</code>.</p><p>View CloudWatch Logs for notebook instance lifecycle configurations in log group <code>/aws/sagemaker/NotebookInstances</code> in log stream <code>[notebook-instance-name]/[LifecycleConfigHook]</code>.</p><p>Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for longer than 5 minutes, it fails and the notebook instance is not created or started.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigInput
 @see AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput
 */
- (void)createNotebookInstanceLifecycleConfig:(AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a URL for a specified UserProfile in a Domain. When accessed in a web browser, the user will be automatically signed in to Amazon SageMaker Amazon SageMaker Studio (Studio), and granted access to all of the Apps and files associated with that Amazon Elastic File System (EFS). This operation can only be called when AuthMode equals IAM. </p>
 
 @param request A container for the necessary parameters to execute the CreatePresignedDomainUrl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreatePresignedDomainUrlResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerCreatePresignedDomainUrlRequest
 @see AWSapi.sagemakerCreatePresignedDomainUrlResponse
 */
- (AWSTask<AWSapi.sagemakerCreatePresignedDomainUrlResponse *> *)createPresignedDomainUrl:(AWSapi.sagemakerCreatePresignedDomainUrlRequest *)request;

/**
 <p>Creates a URL for a specified UserProfile in a Domain. When accessed in a web browser, the user will be automatically signed in to Amazon SageMaker Amazon SageMaker Studio (Studio), and granted access to all of the Apps and files associated with that Amazon Elastic File System (EFS). This operation can only be called when AuthMode equals IAM. </p>
 
 @param request A container for the necessary parameters to execute the CreatePresignedDomainUrl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerCreatePresignedDomainUrlRequest
 @see AWSapi.sagemakerCreatePresignedDomainUrlResponse
 */
- (void)createPresignedDomainUrl:(AWSapi.sagemakerCreatePresignedDomainUrlRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreatePresignedDomainUrlResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a URL that you can use to connect to the Jupyter server from a notebook instance. In the Amazon SageMaker console, when you choose <code>Open</code> next to a notebook instance, Amazon SageMaker opens a new tab showing the Jupyter server home page from the notebook instance. The console uses this API to get the URL and show the page.</p><p>IAM authorization policies for this API are also enforced for every HTTP request and WebSocket frame that attempts to connect to the notebook instance.For example, you can restrict access to this API and to the URL that it returns to a list of IP addresses that you specify. Use the <code>NotIpAddress</code> condition operator and the <code>aws:SourceIP</code> condition context key to specify the list of IP addresses that you want to have access to the notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/security_iam_id-based-policy-examples.html#nbi-ip-filter">Limit Access to a Notebook Instance by IP Address</a>.</p><note><p>The URL that you get from a call to <a>CreatePresignedNotebookInstanceUrl</a> is valid only for 5 minutes. If you try to use the URL after the 5-minute limit expires, you are directed to the AWS console sign-in page.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePresignedNotebookInstanceUrl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput`.
 
 @see AWSapi.sagemakerCreatePresignedNotebookInstanceUrlInput
 @see AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput
 */
- (AWSTask<AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput *> *)createPresignedNotebookInstanceUrl:(AWSapi.sagemakerCreatePresignedNotebookInstanceUrlInput *)request;

/**
 <p>Returns a URL that you can use to connect to the Jupyter server from a notebook instance. In the Amazon SageMaker console, when you choose <code>Open</code> next to a notebook instance, Amazon SageMaker opens a new tab showing the Jupyter server home page from the notebook instance. The console uses this API to get the URL and show the page.</p><p>IAM authorization policies for this API are also enforced for every HTTP request and WebSocket frame that attempts to connect to the notebook instance.For example, you can restrict access to this API and to the URL that it returns to a list of IP addresses that you specify. Use the <code>NotIpAddress</code> condition operator and the <code>aws:SourceIP</code> condition context key to specify the list of IP addresses that you want to have access to the notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/security_iam_id-based-policy-examples.html#nbi-ip-filter">Limit Access to a Notebook Instance by IP Address</a>.</p><note><p>The URL that you get from a call to <a>CreatePresignedNotebookInstanceUrl</a> is valid only for 5 minutes. If you try to use the URL after the 5-minute limit expires, you are directed to the AWS console sign-in page.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePresignedNotebookInstanceUrl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerCreatePresignedNotebookInstanceUrlInput
 @see AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput
 */
- (void)createPresignedNotebookInstanceUrl:(AWSapi.sagemakerCreatePresignedNotebookInstanceUrlInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a processing job.</p>
 
 @param request A container for the necessary parameters to execute the CreateProcessingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateProcessingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerCreateProcessingJobRequest
 @see AWSapi.sagemakerCreateProcessingJobResponse
 */
- (AWSTask<AWSapi.sagemakerCreateProcessingJobResponse *> *)createProcessingJob:(AWSapi.sagemakerCreateProcessingJobRequest *)request;

/**
 <p>Creates a processing job.</p>
 
 @param request A container for the necessary parameters to execute the CreateProcessingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerCreateProcessingJobRequest
 @see AWSapi.sagemakerCreateProcessingJobResponse
 */
- (void)createProcessingJob:(AWSapi.sagemakerCreateProcessingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateProcessingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a model training job. After training completes, Amazon SageMaker saves the resulting model artifacts to an Amazon S3 location that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts in a machine learning service other than Amazon SageMaker, provided that you know how to use them for inferences. </p><p>In the request body, you provide the following: </p><ul><li><p><code>AlgorithmSpecification</code> - Identifies the training algorithm to use. </p></li><li><p><code>HyperParameters</code> - Specify these algorithm-specific parameters to enable the estimation of model parameters during training. Hyperparameters can be tuned to optimize this learning process. For a list of hyperparameters for each training algorithm provided by Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>. </p></li><li><p><code>InputDataConfig</code> - Describes the training dataset and the Amazon S3, EFS, or FSx location where it is stored.</p></li><li><p><code>OutputDataConfig</code> - Identifies the Amazon S3 bucket where you want Amazon SageMaker to save the results of model training. </p><p/></li><li><p><code>ResourceConfig</code> - Identifies the resources, ML compute instances, and ML storage volumes to deploy for model training. In distributed training, you specify more than one instance. </p></li><li><p><code>EnableManagedSpotTraining</code> - Optimize the cost of training machine learning models by up to 80% by using Amazon EC2 Spot instances. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html">Managed Spot Training</a>. </p></li><li><p><code>RoleARN</code> - The Amazon Resource Number (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during model training. You must grant this role the necessary permissions so that Amazon SageMaker can successfully complete model training. </p></li><li><p><code>StoppingCondition</code> - To help cap training costs, use <code>MaxRuntimeInSeconds</code> to set a time limit for training. Use <code>MaxWaitTimeInSeconds</code> to specify how long you are willing to wait for a managed spot training job to complete. </p></li></ul><p> For more information about Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateTrainingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateTrainingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerCreateTrainingJobRequest
 @see AWSapi.sagemakerCreateTrainingJobResponse
 */
- (AWSTask<AWSapi.sagemakerCreateTrainingJobResponse *> *)createTrainingJob:(AWSapi.sagemakerCreateTrainingJobRequest *)request;

/**
 <p>Starts a model training job. After training completes, Amazon SageMaker saves the resulting model artifacts to an Amazon S3 location that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts in a machine learning service other than Amazon SageMaker, provided that you know how to use them for inferences. </p><p>In the request body, you provide the following: </p><ul><li><p><code>AlgorithmSpecification</code> - Identifies the training algorithm to use. </p></li><li><p><code>HyperParameters</code> - Specify these algorithm-specific parameters to enable the estimation of model parameters during training. Hyperparameters can be tuned to optimize this learning process. For a list of hyperparameters for each training algorithm provided by Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>. </p></li><li><p><code>InputDataConfig</code> - Describes the training dataset and the Amazon S3, EFS, or FSx location where it is stored.</p></li><li><p><code>OutputDataConfig</code> - Identifies the Amazon S3 bucket where you want Amazon SageMaker to save the results of model training. </p><p/></li><li><p><code>ResourceConfig</code> - Identifies the resources, ML compute instances, and ML storage volumes to deploy for model training. In distributed training, you specify more than one instance. </p></li><li><p><code>EnableManagedSpotTraining</code> - Optimize the cost of training machine learning models by up to 80% by using Amazon EC2 Spot instances. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html">Managed Spot Training</a>. </p></li><li><p><code>RoleARN</code> - The Amazon Resource Number (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during model training. You must grant this role the necessary permissions so that Amazon SageMaker can successfully complete model training. </p></li><li><p><code>StoppingCondition</code> - To help cap training costs, use <code>MaxRuntimeInSeconds</code> to set a time limit for training. Use <code>MaxWaitTimeInSeconds</code> to specify how long you are willing to wait for a managed spot training job to complete. </p></li></ul><p> For more information about Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateTrainingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerCreateTrainingJobRequest
 @see AWSapi.sagemakerCreateTrainingJobResponse
 */
- (void)createTrainingJob:(AWSapi.sagemakerCreateTrainingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateTrainingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a transform job. A transform job uses a trained model to get inferences on a dataset and saves these results to an Amazon S3 location that you specify.</p><p>To perform batch transformations, you create a transform job and use the data that you have readily available.</p><p>In the request body, you provide the following:</p><ul><li><p><code>TransformJobName</code> - Identifies the transform job. The name must be unique within an AWS Region in an AWS account.</p></li><li><p><code>ModelName</code> - Identifies the model to use. <code>ModelName</code> must be the name of an existing Amazon SageMaker model in the same AWS Region and AWS account. For information on creating a model, see <a>CreateModel</a>.</p></li><li><p><code>TransformInput</code> - Describes the dataset to be transformed and the Amazon S3 location where it is stored.</p></li><li><p><code>TransformOutput</code> - Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.</p></li><li><p><code>TransformResources</code> - Identifies the ML compute instances for the transform job.</p></li></ul><p>For more information about how batch transformation works, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html">Batch Transform</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransformJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateTransformJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerCreateTransformJobRequest
 @see AWSapi.sagemakerCreateTransformJobResponse
 */
- (AWSTask<AWSapi.sagemakerCreateTransformJobResponse *> *)createTransformJob:(AWSapi.sagemakerCreateTransformJobRequest *)request;

/**
 <p>Starts a transform job. A transform job uses a trained model to get inferences on a dataset and saves these results to an Amazon S3 location that you specify.</p><p>To perform batch transformations, you create a transform job and use the data that you have readily available.</p><p>In the request body, you provide the following:</p><ul><li><p><code>TransformJobName</code> - Identifies the transform job. The name must be unique within an AWS Region in an AWS account.</p></li><li><p><code>ModelName</code> - Identifies the model to use. <code>ModelName</code> must be the name of an existing Amazon SageMaker model in the same AWS Region and AWS account. For information on creating a model, see <a>CreateModel</a>.</p></li><li><p><code>TransformInput</code> - Describes the dataset to be transformed and the Amazon S3 location where it is stored.</p></li><li><p><code>TransformOutput</code> - Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.</p></li><li><p><code>TransformResources</code> - Identifies the ML compute instances for the transform job.</p></li></ul><p>For more information about how batch transformation works, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html">Batch Transform</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransformJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerCreateTransformJobRequest
 @see AWSapi.sagemakerCreateTransformJobResponse
 */
- (void)createTransformJob:(AWSapi.sagemakerCreateTransformJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateTransformJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon SageMaker <i>trial</i>. A trial is a set of steps called <i>trial components</i> that produce a machine learning model. A trial is part of a single Amazon SageMaker <i>experiment</i>.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial and then use the <a>Search</a> API to search for the tags.</p><p>To get a list of all your trials, call the <a>ListTrials</a> API. To view a trial's properties, call the <a>DescribeTrial</a> API. To create a trial component, call the <a>CreateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateTrialRequest
 @see AWSapi.sagemakerCreateTrialResponse
 */
- (AWSTask<AWSapi.sagemakerCreateTrialResponse *> *)createTrial:(AWSapi.sagemakerCreateTrialRequest *)request;

/**
 <p>Creates an Amazon SageMaker <i>trial</i>. A trial is a set of steps called <i>trial components</i> that produce a machine learning model. A trial is part of a single Amazon SageMaker <i>experiment</i>.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial and then use the <a>Search</a> API to search for the tags.</p><p>To get a list of all your trials, call the <a>ListTrials</a> API. To view a trial's properties, call the <a>DescribeTrial</a> API. To create a trial component, call the <a>CreateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateTrialRequest
 @see AWSapi.sagemakerCreateTrialResponse
 */
- (void)createTrial:(AWSapi.sagemakerCreateTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a <i>trial component</i>, which is a stage of a machine learning <i>trial</i>. A trial is composed of one or more trial components. A trial component can be used in multiple trials.</p><p>Trial components include pre-processing jobs, training jobs, and batch transform jobs.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial component and then use the <a>Search</a> API to search for the tags.</p><note><p><code>CreateTrialComponent</code> can only be invoked from within an Amazon SageMaker managed environment. This includes Amazon SageMaker training jobs, processing jobs, transform jobs, and Amazon SageMaker notebooks. A call to <code>CreateTrialComponent</code> from outside one of these environments results in an error.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateTrialComponentRequest
 @see AWSapi.sagemakerCreateTrialComponentResponse
 */
- (AWSTask<AWSapi.sagemakerCreateTrialComponentResponse *> *)createTrialComponent:(AWSapi.sagemakerCreateTrialComponentRequest *)request;

/**
 <p>Creates a <i>trial component</i>, which is a stage of a machine learning <i>trial</i>. A trial is composed of one or more trial components. A trial component can be used in multiple trials.</p><p>Trial components include pre-processing jobs, training jobs, and batch transform jobs.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial component and then use the <a>Search</a> API to search for the tags.</p><note><p><code>CreateTrialComponent</code> can only be invoked from within an Amazon SageMaker managed environment. This includes Amazon SageMaker training jobs, processing jobs, transform jobs, and Amazon SageMaker notebooks. A call to <code>CreateTrialComponent</code> from outside one of these environments results in an error.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateTrialComponentRequest
 @see AWSapi.sagemakerCreateTrialComponentResponse
 */
- (void)createTrialComponent:(AWSapi.sagemakerCreateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new user profile. A user profile represents a single user within a Domain, and is the main way to reference a "person" for the purposes of sharing, reporting and other user-oriented features. This entity is created during on-boarding. If an administrator invites a person by email or imports them from SSO, a new UserProfile is automatically created. This entity is the primary holder of settings for an individual user and has a reference to the user's private Amazon Elastic File System (EFS) home directory. </p>
 
 @param request A container for the necessary parameters to execute the CreateUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateUserProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateUserProfileRequest
 @see AWSapi.sagemakerCreateUserProfileResponse
 */
- (AWSTask<AWSapi.sagemakerCreateUserProfileResponse *> *)createUserProfile:(AWSapi.sagemakerCreateUserProfileRequest *)request;

/**
 <p>Creates a new user profile. A user profile represents a single user within a Domain, and is the main way to reference a "person" for the purposes of sharing, reporting and other user-oriented features. This entity is created during on-boarding. If an administrator invites a person by email or imports them from SSO, a new UserProfile is automatically created. This entity is the primary holder of settings for an individual user and has a reference to the user's private Amazon Elastic File System (EFS) home directory. </p>
 
 @param request A container for the necessary parameters to execute the CreateUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`.
 
 @see AWSapi.sagemakerCreateUserProfileRequest
 @see AWSapi.sagemakerCreateUserProfileResponse
 */
- (void)createUserProfile:(AWSapi.sagemakerCreateUserProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateUserProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new work team for labeling your data. A work team is defined by one or more Amazon Cognito user pools. You must first create the user pools before you can create a work team.</p><p>You cannot create more than 25 work teams in an account and region.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerCreateWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateWorkteamRequest
 @see AWSapi.sagemakerCreateWorkteamResponse
 */
- (AWSTask<AWSapi.sagemakerCreateWorkteamResponse *> *)createWorkteam:(AWSapi.sagemakerCreateWorkteamRequest *)request;

/**
 <p>Creates a new work team for labeling your data. A work team is defined by one or more Amazon Cognito user pools. You must first create the user pools before you can create a work team.</p><p>You cannot create more than 25 work teams in an account and region.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerCreateWorkteamRequest
 @see AWSapi.sagemakerCreateWorkteamResponse
 */
- (void)createWorkteam:(AWSapi.sagemakerCreateWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerCreateWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified algorithm from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlgorithm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSapi.sagemakerDeleteAlgorithmInput
 */
- (AWSTask *)deleteAlgorithm:(AWSapi.sagemakerDeleteAlgorithmInput *)request;

/**
 <p>Removes the specified algorithm from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlgorithm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDeleteAlgorithmInput
 */
- (void)deleteAlgorithm:(AWSapi.sagemakerDeleteAlgorithmInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Used to stop and delete an app.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteAppRequest
 */
- (AWSTask *)deleteApp:(AWSapi.sagemakerDeleteAppRequest *)request;

/**
 <p>Used to stop and delete an app.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteAppRequest
 */
- (void)deleteApp:(AWSapi.sagemakerDeleteAppRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Git repository from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSapi.sagemakerDeleteCodeRepositoryInput
 */
- (AWSTask *)deleteCodeRepository:(AWSapi.sagemakerDeleteCodeRepositoryInput *)request;

/**
 <p>Deletes the specified Git repository from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDeleteCodeRepositoryInput
 */
- (void)deleteCodeRepository:(AWSapi.sagemakerDeleteCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Used to delete a domain. If you on-boarded with IAM mode, you will need to delete your domain to on-board again using SSO. Use with caution. All of the members of the domain will lose access to their EFS volume, including data, notebooks, and other artifacts. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteDomainRequest
 */
- (AWSTask *)deleteDomain:(AWSapi.sagemakerDeleteDomainRequest *)request;

/**
 <p>Used to delete a domain. If you on-boarded with IAM mode, you will need to delete your domain to on-board again using SSO. Use with caution. All of the members of the domain will lose access to their EFS volume, including data, notebooks, and other artifacts. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteDomainRequest
 */
- (void)deleteDomain:(AWSapi.sagemakerDeleteDomainRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an endpoint. Amazon SageMaker frees up all of the resources that were deployed when the endpoint was created. </p><p>Amazon SageMaker retires any custom KMS key grants associated with the endpoint, meaning you don't need to use the <a href="http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html">RevokeGrant</a> API call.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSapi.sagemakerDeleteEndpointInput
 */
- (AWSTask *)deleteEndpoint:(AWSapi.sagemakerDeleteEndpointInput *)request;

/**
 <p>Deletes an endpoint. Amazon SageMaker frees up all of the resources that were deployed when the endpoint was created. </p><p>Amazon SageMaker retires any custom KMS key grants associated with the endpoint, meaning you don't need to use the <a href="http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html">RevokeGrant</a> API call.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDeleteEndpointInput
 */
- (void)deleteEndpoint:(AWSapi.sagemakerDeleteEndpointInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an endpoint configuration. The <code>DeleteEndpointConfig</code> API deletes only the specified configuration. It does not delete endpoints created using the configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpointConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSapi.sagemakerDeleteEndpointConfigInput
 */
- (AWSTask *)deleteEndpointConfig:(AWSapi.sagemakerDeleteEndpointConfigInput *)request;

/**
 <p>Deletes an endpoint configuration. The <code>DeleteEndpointConfig</code> API deletes only the specified configuration. It does not delete endpoints created using the configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpointConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDeleteEndpointConfigInput
 */
- (void)deleteEndpointConfig:(AWSapi.sagemakerDeleteEndpointConfigInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon SageMaker experiment. All trials associated with the experiment must be deleted first. Use the <a>ListTrials</a> API to get a list of the trials associated with the experiment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDeleteExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteExperimentRequest
 @see AWSapi.sagemakerDeleteExperimentResponse
 */
- (AWSTask<AWSapi.sagemakerDeleteExperimentResponse *> *)deleteExperiment:(AWSapi.sagemakerDeleteExperimentRequest *)request;

/**
 <p>Deletes an Amazon SageMaker experiment. All trials associated with the experiment must be deleted first. Use the <a>ListTrials</a> API to get a list of the trials associated with the experiment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteExperimentRequest
 @see AWSapi.sagemakerDeleteExperimentResponse
 */
- (void)deleteExperiment:(AWSapi.sagemakerDeleteExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDeleteExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFlowDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDeleteFlowDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteFlowDefinitionRequest
 @see AWSapi.sagemakerDeleteFlowDefinitionResponse
 */
- (AWSTask<AWSapi.sagemakerDeleteFlowDefinitionResponse *> *)deleteFlowDefinition:(AWSapi.sagemakerDeleteFlowDefinitionRequest *)request;

/**
 <p>Deletes the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFlowDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteFlowDefinitionRequest
 @see AWSapi.sagemakerDeleteFlowDefinitionResponse
 */
- (void)deleteFlowDefinition:(AWSapi.sagemakerDeleteFlowDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDeleteFlowDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a model. The <code>DeleteModel</code> API deletes only the model entry that was created in Amazon SageMaker when you called the <a>CreateModel</a> API. It does not delete model artifacts, inference code, or the IAM role that you specified when creating the model. </p>
 
 @param request A container for the necessary parameters to execute the DeleteModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSapi.sagemakerDeleteModelInput
 */
- (AWSTask *)deleteModel:(AWSapi.sagemakerDeleteModelInput *)request;

/**
 <p>Deletes a model. The <code>DeleteModel</code> API deletes only the model entry that was created in Amazon SageMaker when you called the <a>CreateModel</a> API. It does not delete model artifacts, inference code, or the IAM role that you specified when creating the model. </p>
 
 @param request A container for the necessary parameters to execute the DeleteModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDeleteModelInput
 */
- (void)deleteModel:(AWSapi.sagemakerDeleteModelInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a model package.</p><p>A model package is used to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p>
 
 @param request A container for the necessary parameters to execute the DeleteModelPackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSapi.sagemakerDeleteModelPackageInput
 */
- (AWSTask *)deleteModelPackage:(AWSapi.sagemakerDeleteModelPackageInput *)request;

/**
 <p>Deletes a model package.</p><p>A model package is used to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p>
 
 @param request A container for the necessary parameters to execute the DeleteModelPackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDeleteModelPackageInput
 */
- (void)deleteModelPackage:(AWSapi.sagemakerDeleteModelPackageInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a monitoring schedule. Also stops the schedule had not already been stopped. This does not delete the job execution history of the monitoring schedule. </p>
 
 @param request A container for the necessary parameters to execute the DeleteMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteMonitoringScheduleRequest
 */
- (AWSTask *)deleteMonitoringSchedule:(AWSapi.sagemakerDeleteMonitoringScheduleRequest *)request;

/**
 <p>Deletes a monitoring schedule. Also stops the schedule had not already been stopped. This does not delete the job execution history of the monitoring schedule. </p>
 
 @param request A container for the necessary parameters to execute the DeleteMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteMonitoringScheduleRequest
 */
- (void)deleteMonitoringSchedule:(AWSapi.sagemakerDeleteMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an Amazon SageMaker notebook instance. Before you can delete a notebook instance, you must call the <code>StopNotebookInstance</code> API. </p><important><p>When you delete a notebook instance, you lose all of your data. Amazon SageMaker removes the ML compute instance, and deletes the ML storage volume and the network interface associated with the notebook instance. </p></important>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSapi.sagemakerDeleteNotebookInstanceInput
 */
- (AWSTask *)deleteNotebookInstance:(AWSapi.sagemakerDeleteNotebookInstanceInput *)request;

/**
 <p> Deletes an Amazon SageMaker notebook instance. Before you can delete a notebook instance, you must call the <code>StopNotebookInstance</code> API. </p><important><p>When you delete a notebook instance, you lose all of your data. Amazon SageMaker removes the ML compute instance, and deletes the ML storage volume and the network interface associated with the notebook instance. </p></important>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDeleteNotebookInstanceInput
 */
- (void)deleteNotebookInstance:(AWSapi.sagemakerDeleteNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a notebook instance lifecycle configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSapi.sagemakerDeleteNotebookInstanceLifecycleConfigInput
 */
- (AWSTask *)deleteNotebookInstanceLifecycleConfig:(AWSapi.sagemakerDeleteNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Deletes a notebook instance lifecycle configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDeleteNotebookInstanceLifecycleConfigInput
 */
- (void)deleteNotebookInstanceLifecycleConfig:(AWSapi.sagemakerDeleteNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified tags from an Amazon SageMaker resource.</p><p>To list a resource's tags, use the <code>ListTags</code> API. </p><note><p>When you call this API to delete tags from a hyperparameter tuning job, the deleted tags are not removed from training jobs that the hyperparameter tuning job launched before you called this API.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDeleteTagsOutput`.
 
 @see AWSapi.sagemakerDeleteTagsInput
 @see AWSapi.sagemakerDeleteTagsOutput
 */
- (AWSTask<AWSapi.sagemakerDeleteTagsOutput *> *)deleteTags:(AWSapi.sagemakerDeleteTagsInput *)request;

/**
 <p>Deletes the specified tags from an Amazon SageMaker resource.</p><p>To list a resource's tags, use the <code>ListTags</code> API. </p><note><p>When you call this API to delete tags from a hyperparameter tuning job, the deleted tags are not removed from training jobs that the hyperparameter tuning job launched before you called this API.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDeleteTagsInput
 @see AWSapi.sagemakerDeleteTagsOutput
 */
- (void)deleteTags:(AWSapi.sagemakerDeleteTagsInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDeleteTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified trial. All trial components that make up the trial must be deleted first. Use the <a>DescribeTrialComponent</a> API to get the list of trial components.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDeleteTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteTrialRequest
 @see AWSapi.sagemakerDeleteTrialResponse
 */
- (AWSTask<AWSapi.sagemakerDeleteTrialResponse *> *)deleteTrial:(AWSapi.sagemakerDeleteTrialRequest *)request;

/**
 <p>Deletes the specified trial. All trial components that make up the trial must be deleted first. Use the <a>DescribeTrialComponent</a> API to get the list of trial components.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteTrialRequest
 @see AWSapi.sagemakerDeleteTrialResponse
 */
- (void)deleteTrial:(AWSapi.sagemakerDeleteTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDeleteTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified trial component. A trial component must be disassociated from all trials before the trial component can be deleted. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDeleteTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteTrialComponentRequest
 @see AWSapi.sagemakerDeleteTrialComponentResponse
 */
- (AWSTask<AWSapi.sagemakerDeleteTrialComponentResponse *> *)deleteTrialComponent:(AWSapi.sagemakerDeleteTrialComponentRequest *)request;

/**
 <p>Deletes the specified trial component. A trial component must be disassociated from all trials before the trial component can be deleted. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteTrialComponentRequest
 @see AWSapi.sagemakerDeleteTrialComponentResponse
 */
- (void)deleteTrialComponent:(AWSapi.sagemakerDeleteTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDeleteTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user profile.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteUserProfileRequest
 */
- (AWSTask *)deleteUserProfile:(AWSapi.sagemakerDeleteUserProfileRequest *)request;

/**
 <p>Deletes a user profile.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDeleteUserProfileRequest
 */
- (void)deleteUserProfile:(AWSapi.sagemakerDeleteUserProfileRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing work team. This operation can't be undone.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDeleteWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerDeleteWorkteamRequest
 @see AWSapi.sagemakerDeleteWorkteamResponse
 */
- (AWSTask<AWSapi.sagemakerDeleteWorkteamResponse *> *)deleteWorkteam:(AWSapi.sagemakerDeleteWorkteamRequest *)request;

/**
 <p>Deletes an existing work team. This operation can't be undone.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerDeleteWorkteamRequest
 @see AWSapi.sagemakerDeleteWorkteamResponse
 */
- (void)deleteWorkteam:(AWSapi.sagemakerDeleteWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDeleteWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the specified algorithm that is in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlgorithm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeAlgorithmOutput`.
 
 @see AWSapi.sagemakerDescribeAlgorithmInput
 @see AWSapi.sagemakerDescribeAlgorithmOutput
 */
- (AWSTask<AWSapi.sagemakerDescribeAlgorithmOutput *> *)describeAlgorithm:(AWSapi.sagemakerDescribeAlgorithmInput *)request;

/**
 <p>Returns a description of the specified algorithm that is in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlgorithm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDescribeAlgorithmInput
 @see AWSapi.sagemakerDescribeAlgorithmOutput
 */
- (void)describeAlgorithm:(AWSapi.sagemakerDescribeAlgorithmInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeAlgorithmOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the app.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeAppRequest
 @see AWSapi.sagemakerDescribeAppResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeAppResponse *> *)describeApp:(AWSapi.sagemakerDescribeAppRequest *)request;

/**
 <p>Describes the app.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeAppRequest
 @see AWSapi.sagemakerDescribeAppResponse
 */
- (void)describeApp:(AWSapi.sagemakerDescribeAppRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about an Amazon SageMaker job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeAutoMLJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeAutoMLJobRequest
 @see AWSapi.sagemakerDescribeAutoMLJobResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeAutoMLJobResponse *> *)describeAutoMLJob:(AWSapi.sagemakerDescribeAutoMLJobRequest *)request;

/**
 <p>Returns information about an Amazon SageMaker job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeAutoMLJobRequest
 @see AWSapi.sagemakerDescribeAutoMLJobResponse
 */
- (void)describeAutoMLJob:(AWSapi.sagemakerDescribeAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeAutoMLJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets details about the specified Git repository.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeCodeRepositoryOutput`.
 
 @see AWSapi.sagemakerDescribeCodeRepositoryInput
 @see AWSapi.sagemakerDescribeCodeRepositoryOutput
 */
- (AWSTask<AWSapi.sagemakerDescribeCodeRepositoryOutput *> *)describeCodeRepository:(AWSapi.sagemakerDescribeCodeRepositoryInput *)request;

/**
 <p>Gets details about the specified Git repository.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDescribeCodeRepositoryInput
 @see AWSapi.sagemakerDescribeCodeRepositoryOutput
 */
- (void)describeCodeRepository:(AWSapi.sagemakerDescribeCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeCodeRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a model compilation job.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCompilationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeCompilationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeCompilationJobRequest
 @see AWSapi.sagemakerDescribeCompilationJobResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeCompilationJobResponse *> *)describeCompilationJob:(AWSapi.sagemakerDescribeCompilationJobRequest *)request;

/**
 <p>Returns information about a model compilation job.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCompilationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeCompilationJobRequest
 @see AWSapi.sagemakerDescribeCompilationJobResponse
 */
- (void)describeCompilationJob:(AWSapi.sagemakerDescribeCompilationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeCompilationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The desciption of the domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeDomainRequest
 @see AWSapi.sagemakerDescribeDomainResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeDomainResponse *> *)describeDomain:(AWSapi.sagemakerDescribeDomainRequest *)request;

/**
 <p>The desciption of the domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeDomainRequest
 @see AWSapi.sagemakerDescribeDomainResponse
 */
- (void)describeDomain:(AWSapi.sagemakerDescribeDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeEndpointOutput`.
 
 @see AWSapi.sagemakerDescribeEndpointInput
 @see AWSapi.sagemakerDescribeEndpointOutput
 */
- (AWSTask<AWSapi.sagemakerDescribeEndpointOutput *> *)describeEndpoint:(AWSapi.sagemakerDescribeEndpointInput *)request;

/**
 <p>Returns the description of an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDescribeEndpointInput
 @see AWSapi.sagemakerDescribeEndpointOutput
 */
- (void)describeEndpoint:(AWSapi.sagemakerDescribeEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of an endpoint configuration created using the <code>CreateEndpointConfig</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpointConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeEndpointConfigOutput`.
 
 @see AWSapi.sagemakerDescribeEndpointConfigInput
 @see AWSapi.sagemakerDescribeEndpointConfigOutput
 */
- (AWSTask<AWSapi.sagemakerDescribeEndpointConfigOutput *> *)describeEndpointConfig:(AWSapi.sagemakerDescribeEndpointConfigInput *)request;

/**
 <p>Returns the description of an endpoint configuration created using the <code>CreateEndpointConfig</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpointConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDescribeEndpointConfigInput
 @see AWSapi.sagemakerDescribeEndpointConfigOutput
 */
- (void)describeEndpointConfig:(AWSapi.sagemakerDescribeEndpointConfigInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeEndpointConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of an experiment's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeExperimentRequest
 @see AWSapi.sagemakerDescribeExperimentResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeExperimentResponse *> *)describeExperiment:(AWSapi.sagemakerDescribeExperimentRequest *)request;

/**
 <p>Provides a list of an experiment's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeExperimentRequest
 @see AWSapi.sagemakerDescribeExperimentResponse
 */
- (void)describeExperiment:(AWSapi.sagemakerDescribeExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFlowDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeFlowDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeFlowDefinitionRequest
 @see AWSapi.sagemakerDescribeFlowDefinitionResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeFlowDefinitionResponse *> *)describeFlowDefinition:(AWSapi.sagemakerDescribeFlowDefinitionRequest *)request;

/**
 <p>Returns information about the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFlowDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeFlowDefinitionRequest
 @see AWSapi.sagemakerDescribeFlowDefinitionResponse
 */
- (void)describeFlowDefinition:(AWSapi.sagemakerDescribeFlowDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeFlowDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the requested human task user interface.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHumanTaskUi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeHumanTaskUiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeHumanTaskUiRequest
 @see AWSapi.sagemakerDescribeHumanTaskUiResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeHumanTaskUiResponse *> *)describeHumanTaskUi:(AWSapi.sagemakerDescribeHumanTaskUiRequest *)request;

/**
 <p>Returns information about the requested human task user interface.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHumanTaskUi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeHumanTaskUiRequest
 @see AWSapi.sagemakerDescribeHumanTaskUiResponse
 */
- (void)describeHumanTaskUi:(AWSapi.sagemakerDescribeHumanTaskUiRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeHumanTaskUiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a description of a hyperparameter tuning job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeHyperParameterTuningJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeHyperParameterTuningJobRequest
 @see AWSapi.sagemakerDescribeHyperParameterTuningJobResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeHyperParameterTuningJobResponse *> *)describeHyperParameterTuningJob:(AWSapi.sagemakerDescribeHyperParameterTuningJobRequest *)request;

/**
 <p>Gets a description of a hyperparameter tuning job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeHyperParameterTuningJobRequest
 @see AWSapi.sagemakerDescribeHyperParameterTuningJobResponse
 */
- (void)describeHyperParameterTuningJob:(AWSapi.sagemakerDescribeHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeHyperParameterTuningJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a labeling job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLabelingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeLabelingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeLabelingJobRequest
 @see AWSapi.sagemakerDescribeLabelingJobResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeLabelingJobResponse *> *)describeLabelingJob:(AWSapi.sagemakerDescribeLabelingJobRequest *)request;

/**
 <p>Gets information about a labeling job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLabelingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeLabelingJobRequest
 @see AWSapi.sagemakerDescribeLabelingJobResponse
 */
- (void)describeLabelingJob:(AWSapi.sagemakerDescribeLabelingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeLabelingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a model that you created using the <code>CreateModel</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeModelOutput`.
 
 @see AWSapi.sagemakerDescribeModelInput
 @see AWSapi.sagemakerDescribeModelOutput
 */
- (AWSTask<AWSapi.sagemakerDescribeModelOutput *> *)describeModel:(AWSapi.sagemakerDescribeModelInput *)request;

/**
 <p>Describes a model that you created using the <code>CreateModel</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDescribeModelInput
 @see AWSapi.sagemakerDescribeModelOutput
 */
- (void)describeModel:(AWSapi.sagemakerDescribeModelInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeModelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the specified model package, which is used to create Amazon SageMaker models or list them on AWS Marketplace.</p><p>To create models in Amazon SageMaker, buyers can subscribe to model packages listed on AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModelPackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeModelPackageOutput`.
 
 @see AWSapi.sagemakerDescribeModelPackageInput
 @see AWSapi.sagemakerDescribeModelPackageOutput
 */
- (AWSTask<AWSapi.sagemakerDescribeModelPackageOutput *> *)describeModelPackage:(AWSapi.sagemakerDescribeModelPackageInput *)request;

/**
 <p>Returns a description of the specified model package, which is used to create Amazon SageMaker models or list them on AWS Marketplace.</p><p>To create models in Amazon SageMaker, buyers can subscribe to model packages listed on AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModelPackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDescribeModelPackageInput
 @see AWSapi.sagemakerDescribeModelPackageOutput
 */
- (void)describeModelPackage:(AWSapi.sagemakerDescribeModelPackageInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeModelPackageOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the schedule for a monitoring job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeMonitoringScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeMonitoringScheduleRequest
 @see AWSapi.sagemakerDescribeMonitoringScheduleResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeMonitoringScheduleResponse *> *)describeMonitoringSchedule:(AWSapi.sagemakerDescribeMonitoringScheduleRequest *)request;

/**
 <p>Describes the schedule for a monitoring job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeMonitoringScheduleRequest
 @see AWSapi.sagemakerDescribeMonitoringScheduleResponse
 */
- (void)describeMonitoringSchedule:(AWSapi.sagemakerDescribeMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeMonitoringScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a notebook instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeNotebookInstanceOutput`.
 
 @see AWSapi.sagemakerDescribeNotebookInstanceInput
 @see AWSapi.sagemakerDescribeNotebookInstanceOutput
 */
- (AWSTask<AWSapi.sagemakerDescribeNotebookInstanceOutput *> *)describeNotebookInstance:(AWSapi.sagemakerDescribeNotebookInstanceInput *)request;

/**
 <p>Returns information about a notebook instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDescribeNotebookInstanceInput
 @see AWSapi.sagemakerDescribeNotebookInstanceOutput
 */
- (void)describeNotebookInstance:(AWSapi.sagemakerDescribeNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeNotebookInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of a notebook instance lifecycle configuration.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput`.
 
 @see AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigInput
 @see AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput
 */
- (AWSTask<AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput *> *)describeNotebookInstanceLifecycleConfig:(AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Returns a description of a notebook instance lifecycle configuration.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigInput
 @see AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput
 */
- (void)describeNotebookInstanceLifecycleConfig:(AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of a processing job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProcessingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeProcessingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeProcessingJobRequest
 @see AWSapi.sagemakerDescribeProcessingJobResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeProcessingJobResponse *> *)describeProcessingJob:(AWSapi.sagemakerDescribeProcessingJobRequest *)request;

/**
 <p>Returns a description of a processing job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProcessingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeProcessingJobRequest
 @see AWSapi.sagemakerDescribeProcessingJobResponse
 */
- (void)describeProcessingJob:(AWSapi.sagemakerDescribeProcessingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeProcessingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a work team provided by a vendor. It returns details about the subscription with a vendor in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubscribedWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeSubscribedWorkteamResponse`.
 
 @see AWSapi.sagemakerDescribeSubscribedWorkteamRequest
 @see AWSapi.sagemakerDescribeSubscribedWorkteamResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeSubscribedWorkteamResponse *> *)describeSubscribedWorkteam:(AWSapi.sagemakerDescribeSubscribedWorkteamRequest *)request;

/**
 <p>Gets information about a work team provided by a vendor. It returns details about the subscription with a vendor in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubscribedWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDescribeSubscribedWorkteamRequest
 @see AWSapi.sagemakerDescribeSubscribedWorkteamResponse
 */
- (void)describeSubscribedWorkteam:(AWSapi.sagemakerDescribeSubscribedWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeSubscribedWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a training job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrainingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeTrainingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeTrainingJobRequest
 @see AWSapi.sagemakerDescribeTrainingJobResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeTrainingJobResponse *> *)describeTrainingJob:(AWSapi.sagemakerDescribeTrainingJobRequest *)request;

/**
 <p>Returns information about a training job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrainingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeTrainingJobRequest
 @see AWSapi.sagemakerDescribeTrainingJobResponse
 */
- (void)describeTrainingJob:(AWSapi.sagemakerDescribeTrainingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeTrainingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a transform job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransformJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeTransformJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeTransformJobRequest
 @see AWSapi.sagemakerDescribeTransformJobResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeTransformJobResponse *> *)describeTransformJob:(AWSapi.sagemakerDescribeTransformJobRequest *)request;

/**
 <p>Returns information about a transform job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransformJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeTransformJobRequest
 @see AWSapi.sagemakerDescribeTransformJobResponse
 */
- (void)describeTransformJob:(AWSapi.sagemakerDescribeTransformJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeTransformJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of a trial's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeTrialRequest
 @see AWSapi.sagemakerDescribeTrialResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeTrialResponse *> *)describeTrial:(AWSapi.sagemakerDescribeTrialRequest *)request;

/**
 <p>Provides a list of a trial's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeTrialRequest
 @see AWSapi.sagemakerDescribeTrialResponse
 */
- (void)describeTrial:(AWSapi.sagemakerDescribeTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of a trials component's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeTrialComponentRequest
 @see AWSapi.sagemakerDescribeTrialComponentResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeTrialComponentResponse *> *)describeTrialComponent:(AWSapi.sagemakerDescribeTrialComponentRequest *)request;

/**
 <p>Provides a list of a trials component's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeTrialComponentRequest
 @see AWSapi.sagemakerDescribeTrialComponentResponse
 */
- (void)describeTrialComponent:(AWSapi.sagemakerDescribeTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the user profile.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeUserProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeUserProfileRequest
 @see AWSapi.sagemakerDescribeUserProfileResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeUserProfileResponse *> *)describeUserProfile:(AWSapi.sagemakerDescribeUserProfileRequest *)request;

/**
 <p>Describes the user profile.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDescribeUserProfileRequest
 @see AWSapi.sagemakerDescribeUserProfileResponse
 */
- (void)describeUserProfile:(AWSapi.sagemakerDescribeUserProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeUserProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists private workforce information, including workforce name, Amazon Resource Name (ARN), and, if applicable, allowed IP address ranges (<a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>). Allowable IP address ranges are the IP addresses that workers can use to access tasks. </p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the DescribeWorkforce service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeWorkforceResponse`.
 
 @see AWSapi.sagemakerDescribeWorkforceRequest
 @see AWSapi.sagemakerDescribeWorkforceResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeWorkforceResponse *> *)describeWorkforce:(AWSapi.sagemakerDescribeWorkforceRequest *)request;

/**
 <p>Lists private workforce information, including workforce name, Amazon Resource Name (ARN), and, if applicable, allowed IP address ranges (<a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>). Allowable IP address ranges are the IP addresses that workers can use to access tasks. </p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the DescribeWorkforce service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDescribeWorkforceRequest
 @see AWSapi.sagemakerDescribeWorkforceResponse
 */
- (void)describeWorkforce:(AWSapi.sagemakerDescribeWorkforceRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeWorkforceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a specific work team. You can see information such as the create date, the last updated date, membership information, and the work team's Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the DescribeWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDescribeWorkteamResponse`.
 
 @see AWSapi.sagemakerDescribeWorkteamRequest
 @see AWSapi.sagemakerDescribeWorkteamResponse
 */
- (AWSTask<AWSapi.sagemakerDescribeWorkteamResponse *> *)describeWorkteam:(AWSapi.sagemakerDescribeWorkteamRequest *)request;

/**
 <p>Gets information about a specific work team. You can see information such as the create date, the last updated date, membership information, and the work team's Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the DescribeWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerDescribeWorkteamRequest
 @see AWSapi.sagemakerDescribeWorkteamResponse
 */
- (void)describeWorkteam:(AWSapi.sagemakerDescribeWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDescribeWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a trial component from a trial. This doesn't effect other trials the component is associated with. Before you can delete a component, you must disassociate the component from all trials it is associated with. To associate a trial component with a trial, call the <a>AssociateTrialComponent</a> API.</p><p>To get a list of the trials a component is associated with, use the <a>Search</a> API. Specify <code>ExperimentTrialComponent</code> for the <code>Resource</code> parameter. The list appears in the response under <code>Results.TrialComponent.Parents</code>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerDisassociateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDisassociateTrialComponentRequest
 @see AWSapi.sagemakerDisassociateTrialComponentResponse
 */
- (AWSTask<AWSapi.sagemakerDisassociateTrialComponentResponse *> *)disassociateTrialComponent:(AWSapi.sagemakerDisassociateTrialComponentRequest *)request;

/**
 <p>Disassociates a trial component from a trial. This doesn't effect other trials the component is associated with. Before you can delete a component, you must disassociate the component from all trials it is associated with. To associate a trial component with a trial, call the <a>AssociateTrialComponent</a> API.</p><p>To get a list of the trials a component is associated with, use the <a>Search</a> API. Specify <code>ExperimentTrialComponent</code> for the <code>Resource</code> parameter. The list appears in the response under <code>Results.TrialComponent.Parents</code>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerDisassociateTrialComponentRequest
 @see AWSapi.sagemakerDisassociateTrialComponentResponse
 */
- (void)disassociateTrialComponent:(AWSapi.sagemakerDisassociateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerDisassociateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>An auto-complete API for the search functionality in the Amazon SageMaker console. It returns suggestions of possible matches for the property name to use in <code>Search</code> queries. Provides suggestions for <code>HyperParameters</code>, <code>Tags</code>, and <code>Metrics</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSearchSuggestions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerGetSearchSuggestionsResponse`.
 
 @see AWSapi.sagemakerGetSearchSuggestionsRequest
 @see AWSapi.sagemakerGetSearchSuggestionsResponse
 */
- (AWSTask<AWSapi.sagemakerGetSearchSuggestionsResponse *> *)getSearchSuggestions:(AWSapi.sagemakerGetSearchSuggestionsRequest *)request;

/**
 <p>An auto-complete API for the search functionality in the Amazon SageMaker console. It returns suggestions of possible matches for the property name to use in <code>Search</code> queries. Provides suggestions for <code>HyperParameters</code>, <code>Tags</code>, and <code>Metrics</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSearchSuggestions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerGetSearchSuggestionsRequest
 @see AWSapi.sagemakerGetSearchSuggestionsResponse
 */
- (void)getSearchSuggestions:(AWSapi.sagemakerGetSearchSuggestionsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerGetSearchSuggestionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the machine learning algorithms that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListAlgorithms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListAlgorithmsOutput`.
 
 @see AWSapi.sagemakerListAlgorithmsInput
 @see AWSapi.sagemakerListAlgorithmsOutput
 */
- (AWSTask<AWSapi.sagemakerListAlgorithmsOutput *> *)listAlgorithms:(AWSapi.sagemakerListAlgorithmsInput *)request;

/**
 <p>Lists the machine learning algorithms that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListAlgorithms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListAlgorithmsInput
 @see AWSapi.sagemakerListAlgorithmsOutput
 */
- (void)listAlgorithms:(AWSapi.sagemakerListAlgorithmsInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListAlgorithmsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists apps.</p>
 
 @param request A container for the necessary parameters to execute the ListApps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListAppsResponse`.
 
 @see AWSapi.sagemakerListAppsRequest
 @see AWSapi.sagemakerListAppsResponse
 */
- (AWSTask<AWSapi.sagemakerListAppsResponse *> *)listApps:(AWSapi.sagemakerListAppsRequest *)request;

/**
 <p>Lists apps.</p>
 
 @param request A container for the necessary parameters to execute the ListApps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListAppsRequest
 @see AWSapi.sagemakerListAppsResponse
 */
- (void)listApps:(AWSapi.sagemakerListAppsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListAppsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Request a list of jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListAutoMLJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListAutoMLJobsResponse`.
 
 @see AWSapi.sagemakerListAutoMLJobsRequest
 @see AWSapi.sagemakerListAutoMLJobsResponse
 */
- (AWSTask<AWSapi.sagemakerListAutoMLJobsResponse *> *)listAutoMLJobs:(AWSapi.sagemakerListAutoMLJobsRequest *)request;

/**
 <p>Request a list of jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListAutoMLJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListAutoMLJobsRequest
 @see AWSapi.sagemakerListAutoMLJobsResponse
 */
- (void)listAutoMLJobs:(AWSapi.sagemakerListAutoMLJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListAutoMLJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the Candidates created for the job.</p>
 
 @param request A container for the necessary parameters to execute the ListCandidatesForAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListCandidatesForAutoMLJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerListCandidatesForAutoMLJobRequest
 @see AWSapi.sagemakerListCandidatesForAutoMLJobResponse
 */
- (AWSTask<AWSapi.sagemakerListCandidatesForAutoMLJobResponse *> *)listCandidatesForAutoMLJob:(AWSapi.sagemakerListCandidatesForAutoMLJobRequest *)request;

/**
 <p>List the Candidates created for the job.</p>
 
 @param request A container for the necessary parameters to execute the ListCandidatesForAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerListCandidatesForAutoMLJobRequest
 @see AWSapi.sagemakerListCandidatesForAutoMLJobResponse
 */
- (void)listCandidatesForAutoMLJob:(AWSapi.sagemakerListCandidatesForAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListCandidatesForAutoMLJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the Git repositories in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListCodeRepositories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListCodeRepositoriesOutput`.
 
 @see AWSapi.sagemakerListCodeRepositoriesInput
 @see AWSapi.sagemakerListCodeRepositoriesOutput
 */
- (AWSTask<AWSapi.sagemakerListCodeRepositoriesOutput *> *)listCodeRepositories:(AWSapi.sagemakerListCodeRepositoriesInput *)request;

/**
 <p>Gets a list of the Git repositories in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListCodeRepositories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListCodeRepositoriesInput
 @see AWSapi.sagemakerListCodeRepositoriesOutput
 */
- (void)listCodeRepositories:(AWSapi.sagemakerListCodeRepositoriesInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListCodeRepositoriesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists model compilation jobs that satisfy various filters.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about a particular model compilation job you have created, use <a>DescribeCompilationJob</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListCompilationJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListCompilationJobsResponse`.
 
 @see AWSapi.sagemakerListCompilationJobsRequest
 @see AWSapi.sagemakerListCompilationJobsResponse
 */
- (AWSTask<AWSapi.sagemakerListCompilationJobsResponse *> *)listCompilationJobs:(AWSapi.sagemakerListCompilationJobsRequest *)request;

/**
 <p>Lists model compilation jobs that satisfy various filters.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about a particular model compilation job you have created, use <a>DescribeCompilationJob</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListCompilationJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListCompilationJobsRequest
 @see AWSapi.sagemakerListCompilationJobsResponse
 */
- (void)listCompilationJobs:(AWSapi.sagemakerListCompilationJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListCompilationJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the domains.</p>
 
 @param request A container for the necessary parameters to execute the ListDomains service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListDomainsResponse`.
 
 @see AWSapi.sagemakerListDomainsRequest
 @see AWSapi.sagemakerListDomainsResponse
 */
- (AWSTask<AWSapi.sagemakerListDomainsResponse *> *)listDomains:(AWSapi.sagemakerListDomainsRequest *)request;

/**
 <p>Lists the domains.</p>
 
 @param request A container for the necessary parameters to execute the ListDomains service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListDomainsRequest
 @see AWSapi.sagemakerListDomainsResponse
 */
- (void)listDomains:(AWSapi.sagemakerListDomainsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListDomainsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists endpoint configurations.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpointConfigs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListEndpointConfigsOutput`.
 
 @see AWSapi.sagemakerListEndpointConfigsInput
 @see AWSapi.sagemakerListEndpointConfigsOutput
 */
- (AWSTask<AWSapi.sagemakerListEndpointConfigsOutput *> *)listEndpointConfigs:(AWSapi.sagemakerListEndpointConfigsInput *)request;

/**
 <p>Lists endpoint configurations.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpointConfigs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListEndpointConfigsInput
 @see AWSapi.sagemakerListEndpointConfigsOutput
 */
- (void)listEndpointConfigs:(AWSapi.sagemakerListEndpointConfigsInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListEndpointConfigsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists endpoints.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListEndpointsOutput`.
 
 @see AWSapi.sagemakerListEndpointsInput
 @see AWSapi.sagemakerListEndpointsOutput
 */
- (AWSTask<AWSapi.sagemakerListEndpointsOutput *> *)listEndpoints:(AWSapi.sagemakerListEndpointsInput *)request;

/**
 <p>Lists endpoints.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListEndpointsInput
 @see AWSapi.sagemakerListEndpointsOutput
 */
- (void)listEndpoints:(AWSapi.sagemakerListEndpointsInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListEndpointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the experiments in your account. The list can be filtered to show only experiments that were created in a specific time range. The list can be sorted by experiment name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListExperiments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListExperimentsResponse`.
 
 @see AWSapi.sagemakerListExperimentsRequest
 @see AWSapi.sagemakerListExperimentsResponse
 */
- (AWSTask<AWSapi.sagemakerListExperimentsResponse *> *)listExperiments:(AWSapi.sagemakerListExperimentsRequest *)request;

/**
 <p>Lists all the experiments in your account. The list can be filtered to show only experiments that were created in a specific time range. The list can be sorted by experiment name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListExperiments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListExperimentsRequest
 @see AWSapi.sagemakerListExperimentsResponse
 */
- (void)listExperiments:(AWSapi.sagemakerListExperimentsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListExperimentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the flow definitions in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListFlowDefinitions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListFlowDefinitionsResponse`.
 
 @see AWSapi.sagemakerListFlowDefinitionsRequest
 @see AWSapi.sagemakerListFlowDefinitionsResponse
 */
- (AWSTask<AWSapi.sagemakerListFlowDefinitionsResponse *> *)listFlowDefinitions:(AWSapi.sagemakerListFlowDefinitionsRequest *)request;

/**
 <p>Returns information about the flow definitions in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListFlowDefinitions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListFlowDefinitionsRequest
 @see AWSapi.sagemakerListFlowDefinitionsResponse
 */
- (void)listFlowDefinitions:(AWSapi.sagemakerListFlowDefinitionsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListFlowDefinitionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the human task user interfaces in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHumanTaskUis service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListHumanTaskUisResponse`.
 
 @see AWSapi.sagemakerListHumanTaskUisRequest
 @see AWSapi.sagemakerListHumanTaskUisResponse
 */
- (AWSTask<AWSapi.sagemakerListHumanTaskUisResponse *> *)listHumanTaskUis:(AWSapi.sagemakerListHumanTaskUisRequest *)request;

/**
 <p>Returns information about the human task user interfaces in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHumanTaskUis service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListHumanTaskUisRequest
 @see AWSapi.sagemakerListHumanTaskUisResponse
 */
- (void)listHumanTaskUis:(AWSapi.sagemakerListHumanTaskUisRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListHumanTaskUisResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of <a>HyperParameterTuningJobSummary</a> objects that describe the hyperparameter tuning jobs launched in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHyperParameterTuningJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListHyperParameterTuningJobsResponse`.
 
 @see AWSapi.sagemakerListHyperParameterTuningJobsRequest
 @see AWSapi.sagemakerListHyperParameterTuningJobsResponse
 */
- (AWSTask<AWSapi.sagemakerListHyperParameterTuningJobsResponse *> *)listHyperParameterTuningJobs:(AWSapi.sagemakerListHyperParameterTuningJobsRequest *)request;

/**
 <p>Gets a list of <a>HyperParameterTuningJobSummary</a> objects that describe the hyperparameter tuning jobs launched in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHyperParameterTuningJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListHyperParameterTuningJobsRequest
 @see AWSapi.sagemakerListHyperParameterTuningJobsResponse
 */
- (void)listHyperParameterTuningJobs:(AWSapi.sagemakerListHyperParameterTuningJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListHyperParameterTuningJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of labeling jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListLabelingJobsResponse`.
 
 @see AWSapi.sagemakerListLabelingJobsRequest
 @see AWSapi.sagemakerListLabelingJobsResponse
 */
- (AWSTask<AWSapi.sagemakerListLabelingJobsResponse *> *)listLabelingJobs:(AWSapi.sagemakerListLabelingJobsRequest *)request;

/**
 <p>Gets a list of labeling jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListLabelingJobsRequest
 @see AWSapi.sagemakerListLabelingJobsResponse
 */
- (void)listLabelingJobs:(AWSapi.sagemakerListLabelingJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListLabelingJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of labeling jobs assigned to a specified work team.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobsForWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListLabelingJobsForWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerListLabelingJobsForWorkteamRequest
 @see AWSapi.sagemakerListLabelingJobsForWorkteamResponse
 */
- (AWSTask<AWSapi.sagemakerListLabelingJobsForWorkteamResponse *> *)listLabelingJobsForWorkteam:(AWSapi.sagemakerListLabelingJobsForWorkteamRequest *)request;

/**
 <p>Gets a list of labeling jobs assigned to a specified work team.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobsForWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerListLabelingJobsForWorkteamRequest
 @see AWSapi.sagemakerListLabelingJobsForWorkteamResponse
 */
- (void)listLabelingJobsForWorkteam:(AWSapi.sagemakerListLabelingJobsForWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListLabelingJobsForWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the model packages that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListModelPackages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListModelPackagesOutput`.
 
 @see AWSapi.sagemakerListModelPackagesInput
 @see AWSapi.sagemakerListModelPackagesOutput
 */
- (AWSTask<AWSapi.sagemakerListModelPackagesOutput *> *)listModelPackages:(AWSapi.sagemakerListModelPackagesInput *)request;

/**
 <p>Lists the model packages that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListModelPackages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListModelPackagesInput
 @see AWSapi.sagemakerListModelPackagesOutput
 */
- (void)listModelPackages:(AWSapi.sagemakerListModelPackagesInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListModelPackagesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists models created with the <a>CreateModel</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListModelsOutput`.
 
 @see AWSapi.sagemakerListModelsInput
 @see AWSapi.sagemakerListModelsOutput
 */
- (AWSTask<AWSapi.sagemakerListModelsOutput *> *)listModels:(AWSapi.sagemakerListModelsInput *)request;

/**
 <p>Lists models created with the <a>CreateModel</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListModelsInput
 @see AWSapi.sagemakerListModelsOutput
 */
- (void)listModels:(AWSapi.sagemakerListModelsInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListModelsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns list of all monitoring job executions.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListMonitoringExecutionsResponse`.
 
 @see AWSapi.sagemakerListMonitoringExecutionsRequest
 @see AWSapi.sagemakerListMonitoringExecutionsResponse
 */
- (AWSTask<AWSapi.sagemakerListMonitoringExecutionsResponse *> *)listMonitoringExecutions:(AWSapi.sagemakerListMonitoringExecutionsRequest *)request;

/**
 <p>Returns list of all monitoring job executions.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListMonitoringExecutionsRequest
 @see AWSapi.sagemakerListMonitoringExecutionsResponse
 */
- (void)listMonitoringExecutions:(AWSapi.sagemakerListMonitoringExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListMonitoringExecutionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns list of all monitoring schedules.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringSchedules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListMonitoringSchedulesResponse`.
 
 @see AWSapi.sagemakerListMonitoringSchedulesRequest
 @see AWSapi.sagemakerListMonitoringSchedulesResponse
 */
- (AWSTask<AWSapi.sagemakerListMonitoringSchedulesResponse *> *)listMonitoringSchedules:(AWSapi.sagemakerListMonitoringSchedulesRequest *)request;

/**
 <p>Returns list of all monitoring schedules.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringSchedules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListMonitoringSchedulesRequest
 @see AWSapi.sagemakerListMonitoringSchedulesResponse
 */
- (void)listMonitoringSchedules:(AWSapi.sagemakerListMonitoringSchedulesRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListMonitoringSchedulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists notebook instance lifestyle configurations created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstanceLifecycleConfigs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput`.
 
 @see AWSapi.sagemakerListNotebookInstanceLifecycleConfigsInput
 @see AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput
 */
- (AWSTask<AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput *> *)listNotebookInstanceLifecycleConfigs:(AWSapi.sagemakerListNotebookInstanceLifecycleConfigsInput *)request;

/**
 <p>Lists notebook instance lifestyle configurations created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstanceLifecycleConfigs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListNotebookInstanceLifecycleConfigsInput
 @see AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput
 */
- (void)listNotebookInstanceLifecycleConfigs:(AWSapi.sagemakerListNotebookInstanceLifecycleConfigsInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the Amazon SageMaker notebook instances in the requester's account in an AWS Region. </p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListNotebookInstancesOutput`.
 
 @see AWSapi.sagemakerListNotebookInstancesInput
 @see AWSapi.sagemakerListNotebookInstancesOutput
 */
- (AWSTask<AWSapi.sagemakerListNotebookInstancesOutput *> *)listNotebookInstances:(AWSapi.sagemakerListNotebookInstancesInput *)request;

/**
 <p>Returns a list of the Amazon SageMaker notebook instances in the requester's account in an AWS Region. </p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListNotebookInstancesInput
 @see AWSapi.sagemakerListNotebookInstancesOutput
 */
- (void)listNotebookInstances:(AWSapi.sagemakerListNotebookInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListNotebookInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists processing jobs that satisfy various filters.</p>
 
 @param request A container for the necessary parameters to execute the ListProcessingJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListProcessingJobsResponse`.
 
 @see AWSapi.sagemakerListProcessingJobsRequest
 @see AWSapi.sagemakerListProcessingJobsResponse
 */
- (AWSTask<AWSapi.sagemakerListProcessingJobsResponse *> *)listProcessingJobs:(AWSapi.sagemakerListProcessingJobsRequest *)request;

/**
 <p>Lists processing jobs that satisfy various filters.</p>
 
 @param request A container for the necessary parameters to execute the ListProcessingJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListProcessingJobsRequest
 @see AWSapi.sagemakerListProcessingJobsResponse
 */
- (void)listProcessingJobs:(AWSapi.sagemakerListProcessingJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListProcessingJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the work teams that you are subscribed to in the AWS Marketplace. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscribedWorkteams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListSubscribedWorkteamsResponse`.
 
 @see AWSapi.sagemakerListSubscribedWorkteamsRequest
 @see AWSapi.sagemakerListSubscribedWorkteamsResponse
 */
- (AWSTask<AWSapi.sagemakerListSubscribedWorkteamsResponse *> *)listSubscribedWorkteams:(AWSapi.sagemakerListSubscribedWorkteamsRequest *)request;

/**
 <p>Gets a list of the work teams that you are subscribed to in the AWS Marketplace. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscribedWorkteams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListSubscribedWorkteamsRequest
 @see AWSapi.sagemakerListSubscribedWorkteamsResponse
 */
- (void)listSubscribedWorkteams:(AWSapi.sagemakerListSubscribedWorkteamsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListSubscribedWorkteamsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the tags for the specified Amazon SageMaker resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListTagsOutput`.
 
 @see AWSapi.sagemakerListTagsInput
 @see AWSapi.sagemakerListTagsOutput
 */
- (AWSTask<AWSapi.sagemakerListTagsOutput *> *)listTags:(AWSapi.sagemakerListTagsInput *)request;

/**
 <p>Returns the tags for the specified Amazon SageMaker resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListTagsInput
 @see AWSapi.sagemakerListTagsOutput
 */
- (void)listTags:(AWSapi.sagemakerListTagsInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists training jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListTrainingJobsResponse`.
 
 @see AWSapi.sagemakerListTrainingJobsRequest
 @see AWSapi.sagemakerListTrainingJobsResponse
 */
- (AWSTask<AWSapi.sagemakerListTrainingJobsResponse *> *)listTrainingJobs:(AWSapi.sagemakerListTrainingJobsRequest *)request;

/**
 <p>Lists training jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListTrainingJobsRequest
 @see AWSapi.sagemakerListTrainingJobsResponse
 */
- (void)listTrainingJobs:(AWSapi.sagemakerListTrainingJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListTrainingJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of <a>TrainingJobSummary</a> objects that describe the training jobs that a hyperparameter tuning job launched.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobsForHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobRequest
 @see AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse
 */
- (AWSTask<AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse *> *)listTrainingJobsForHyperParameterTuningJob:(AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobRequest *)request;

/**
 <p>Gets a list of <a>TrainingJobSummary</a> objects that describe the training jobs that a hyperparameter tuning job launched.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobsForHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobRequest
 @see AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse
 */
- (void)listTrainingJobsForHyperParameterTuningJob:(AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists transform jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTransformJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListTransformJobsResponse`.
 
 @see AWSapi.sagemakerListTransformJobsRequest
 @see AWSapi.sagemakerListTransformJobsResponse
 */
- (AWSTask<AWSapi.sagemakerListTransformJobsResponse *> *)listTransformJobs:(AWSapi.sagemakerListTransformJobsRequest *)request;

/**
 <p>Lists transform jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTransformJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListTransformJobsRequest
 @see AWSapi.sagemakerListTransformJobsResponse
 */
- (void)listTransformJobs:(AWSapi.sagemakerListTransformJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListTransformJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the trial components in your account. You can sort the list by trial component name or creation time. You can filter the list to show only components that were created in a specific time range. You can also filter on one of the following:</p><ul><li><p><code>ExperimentName</code></p></li><li><p><code>SourceArn</code></p></li><li><p><code>TrialName</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListTrialComponents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListTrialComponentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerListTrialComponentsRequest
 @see AWSapi.sagemakerListTrialComponentsResponse
 */
- (AWSTask<AWSapi.sagemakerListTrialComponentsResponse *> *)listTrialComponents:(AWSapi.sagemakerListTrialComponentsRequest *)request;

/**
 <p>Lists the trial components in your account. You can sort the list by trial component name or creation time. You can filter the list to show only components that were created in a specific time range. You can also filter on one of the following:</p><ul><li><p><code>ExperimentName</code></p></li><li><p><code>SourceArn</code></p></li><li><p><code>TrialName</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListTrialComponents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerListTrialComponentsRequest
 @see AWSapi.sagemakerListTrialComponentsResponse
 */
- (void)listTrialComponents:(AWSapi.sagemakerListTrialComponentsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListTrialComponentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the trials in your account. Specify an experiment name to limit the list to the trials that are part of that experiment. Specify a trial component name to limit the list to the trials that associated with that trial component. The list can be filtered to show only trials that were created in a specific time range. The list can be sorted by trial name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListTrials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListTrialsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerListTrialsRequest
 @see AWSapi.sagemakerListTrialsResponse
 */
- (AWSTask<AWSapi.sagemakerListTrialsResponse *> *)listTrials:(AWSapi.sagemakerListTrialsRequest *)request;

/**
 <p>Lists the trials in your account. Specify an experiment name to limit the list to the trials that are part of that experiment. Specify a trial component name to limit the list to the trials that associated with that trial component. The list can be filtered to show only trials that were created in a specific time range. The list can be sorted by trial name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListTrials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerListTrialsRequest
 @see AWSapi.sagemakerListTrialsResponse
 */
- (void)listTrials:(AWSapi.sagemakerListTrialsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListTrialsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists user profiles.</p>
 
 @param request A container for the necessary parameters to execute the ListUserProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListUserProfilesResponse`.
 
 @see AWSapi.sagemakerListUserProfilesRequest
 @see AWSapi.sagemakerListUserProfilesResponse
 */
- (AWSTask<AWSapi.sagemakerListUserProfilesResponse *> *)listUserProfiles:(AWSapi.sagemakerListUserProfilesRequest *)request;

/**
 <p>Lists user profiles.</p>
 
 @param request A container for the necessary parameters to execute the ListUserProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListUserProfilesRequest
 @see AWSapi.sagemakerListUserProfilesResponse
 */
- (void)listUserProfiles:(AWSapi.sagemakerListUserProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListUserProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of work teams that you have defined in a region. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkteams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerListWorkteamsResponse`.
 
 @see AWSapi.sagemakerListWorkteamsRequest
 @see AWSapi.sagemakerListWorkteamsResponse
 */
- (AWSTask<AWSapi.sagemakerListWorkteamsResponse *> *)listWorkteams:(AWSapi.sagemakerListWorkteamsRequest *)request;

/**
 <p>Gets a list of work teams that you have defined in a region. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkteams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerListWorkteamsRequest
 @see AWSapi.sagemakerListWorkteamsResponse
 */
- (void)listWorkteams:(AWSapi.sagemakerListWorkteamsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerListWorkteamsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Renders the UI template so that you can preview the worker's experience. </p>
 
 @param request A container for the necessary parameters to execute the RenderUiTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerRenderUiTemplateResponse`.
 
 @see AWSapi.sagemakerRenderUiTemplateRequest
 @see AWSapi.sagemakerRenderUiTemplateResponse
 */
- (AWSTask<AWSapi.sagemakerRenderUiTemplateResponse *> *)renderUiTemplate:(AWSapi.sagemakerRenderUiTemplateRequest *)request;

/**
 <p>Renders the UI template so that you can preview the worker's experience. </p>
 
 @param request A container for the necessary parameters to execute the RenderUiTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerRenderUiTemplateRequest
 @see AWSapi.sagemakerRenderUiTemplateResponse
 */
- (void)renderUiTemplate:(AWSapi.sagemakerRenderUiTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerRenderUiTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Finds Amazon SageMaker resources that match a search query. Matching resources are returned as a list of <code>SearchRecord</code> objects in the response. You can sort the search results by any resource property in a ascending or descending order.</p><p>You can query against the following value types: numeric, text, Boolean, and timestamp.</p>
 
 @param request A container for the necessary parameters to execute the Search service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerSearchResponse`.
 
 @see AWSapi.sagemakerSearchRequest
 @see AWSapi.sagemakerSearchResponse
 */
- (AWSTask<AWSapi.sagemakerSearchResponse *> *)search:(AWSapi.sagemakerSearchRequest *)request;

/**
 <p>Finds Amazon SageMaker resources that match a search query. Matching resources are returned as a list of <code>SearchRecord</code> objects in the response. You can sort the search results by any resource property in a ascending or descending order.</p><p>You can query against the following value types: numeric, text, Boolean, and timestamp.</p>
 
 @param request A container for the necessary parameters to execute the Search service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerSearchRequest
 @see AWSapi.sagemakerSearchResponse
 */
- (void)search:(AWSapi.sagemakerSearchRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerSearchResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a previously stopped monitoring schedule.</p><note><p>New monitoring schedules are immediately started after creation.</p></note>
 
 @param request A container for the necessary parameters to execute the StartMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStartMonitoringScheduleRequest
 */
- (AWSTask *)startMonitoringSchedule:(AWSapi.sagemakerStartMonitoringScheduleRequest *)request;

/**
 <p>Starts a previously stopped monitoring schedule.</p><note><p>New monitoring schedules are immediately started after creation.</p></note>
 
 @param request A container for the necessary parameters to execute the StartMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStartMonitoringScheduleRequest
 */
- (void)startMonitoringSchedule:(AWSapi.sagemakerStartMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Launches an ML compute instance with the latest version of the libraries and attaches your ML storage volume. After configuring the notebook instance, Amazon SageMaker sets the notebook instance status to <code>InService</code>. A notebook instance's status must be <code>InService</code> before you can connect to your Jupyter notebook. </p>
 
 @param request A container for the necessary parameters to execute the StartNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerStartNotebookInstanceInput
 */
- (AWSTask *)startNotebookInstance:(AWSapi.sagemakerStartNotebookInstanceInput *)request;

/**
 <p>Launches an ML compute instance with the latest version of the libraries and attaches your ML storage volume. After configuring the notebook instance, Amazon SageMaker sets the notebook instance status to <code>InService</code>. A notebook instance's status must be <code>InService</code> before you can connect to your Jupyter notebook. </p>
 
 @param request A container for the necessary parameters to execute the StartNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerStartNotebookInstanceInput
 */
- (void)startNotebookInstance:(AWSapi.sagemakerStartNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>A method for forcing the termination of a running job.</p>
 
 @param request A container for the necessary parameters to execute the StopAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopAutoMLJobRequest
 */
- (AWSTask *)stopAutoMLJob:(AWSapi.sagemakerStopAutoMLJobRequest *)request;

/**
 <p>A method for forcing the termination of a running job.</p>
 
 @param request A container for the necessary parameters to execute the StopAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopAutoMLJobRequest
 */
- (void)stopAutoMLJob:(AWSapi.sagemakerStopAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a model compilation job.</p><p> To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal. This gracefully shuts the job down. If the job hasn't stopped, it sends the SIGKILL signal.</p><p>When it receives a <code>StopCompilationJob</code> request, Amazon SageMaker changes the <a>CompilationJobSummary$CompilationJobStatus</a> of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the <a>CompilationJobSummary$CompilationJobStatus</a> to <code>Stopped</code>. </p>
 
 @param request A container for the necessary parameters to execute the StopCompilationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopCompilationJobRequest
 */
- (AWSTask *)stopCompilationJob:(AWSapi.sagemakerStopCompilationJobRequest *)request;

/**
 <p>Stops a model compilation job.</p><p> To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal. This gracefully shuts the job down. If the job hasn't stopped, it sends the SIGKILL signal.</p><p>When it receives a <code>StopCompilationJob</code> request, Amazon SageMaker changes the <a>CompilationJobSummary$CompilationJobStatus</a> of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the <a>CompilationJobSummary$CompilationJobStatus</a> to <code>Stopped</code>. </p>
 
 @param request A container for the necessary parameters to execute the StopCompilationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopCompilationJobRequest
 */
- (void)stopCompilationJob:(AWSapi.sagemakerStopCompilationJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a running hyperparameter tuning job and all running training jobs that the tuning job launched.</p><p>All model artifacts output from the training jobs are stored in Amazon Simple Storage Service (Amazon S3). All data that the training jobs write to Amazon CloudWatch Logs are still available in CloudWatch. After the tuning job moves to the <code>Stopped</code> state, it releases all reserved resources for the tuning job.</p>
 
 @param request A container for the necessary parameters to execute the StopHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopHyperParameterTuningJobRequest
 */
- (AWSTask *)stopHyperParameterTuningJob:(AWSapi.sagemakerStopHyperParameterTuningJobRequest *)request;

/**
 <p>Stops a running hyperparameter tuning job and all running training jobs that the tuning job launched.</p><p>All model artifacts output from the training jobs are stored in Amazon Simple Storage Service (Amazon S3). All data that the training jobs write to Amazon CloudWatch Logs are still available in CloudWatch. After the tuning job moves to the <code>Stopped</code> state, it releases all reserved resources for the tuning job.</p>
 
 @param request A container for the necessary parameters to execute the StopHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopHyperParameterTuningJobRequest
 */
- (void)stopHyperParameterTuningJob:(AWSapi.sagemakerStopHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a running labeling job. A job that is stopped cannot be restarted. Any results obtained before the job is stopped are placed in the Amazon S3 output bucket.</p>
 
 @param request A container for the necessary parameters to execute the StopLabelingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopLabelingJobRequest
 */
- (AWSTask *)stopLabelingJob:(AWSapi.sagemakerStopLabelingJobRequest *)request;

/**
 <p>Stops a running labeling job. A job that is stopped cannot be restarted. Any results obtained before the job is stopped are placed in the Amazon S3 output bucket.</p>
 
 @param request A container for the necessary parameters to execute the StopLabelingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopLabelingJobRequest
 */
- (void)stopLabelingJob:(AWSapi.sagemakerStopLabelingJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a previously started monitoring schedule.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopMonitoringScheduleRequest
 */
- (AWSTask *)stopMonitoringSchedule:(AWSapi.sagemakerStopMonitoringScheduleRequest *)request;

/**
 <p>Stops a previously started monitoring schedule.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopMonitoringScheduleRequest
 */
- (void)stopMonitoringSchedule:(AWSapi.sagemakerStopMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Terminates the ML compute instance. Before terminating the instance, Amazon SageMaker disconnects the ML storage volume from it. Amazon SageMaker preserves the ML storage volume. Amazon SageMaker stops charging you for the ML compute instance when you call <code>StopNotebookInstance</code>.</p><p>To access data on the ML storage volume for a notebook instance that has been terminated, call the <code>StartNotebookInstance</code> API. <code>StartNotebookInstance</code> launches another ML compute instance, configures it, and attaches the preserved ML storage volume so you can continue your work. </p>
 
 @param request A container for the necessary parameters to execute the StopNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSapi.sagemakerStopNotebookInstanceInput
 */
- (AWSTask *)stopNotebookInstance:(AWSapi.sagemakerStopNotebookInstanceInput *)request;

/**
 <p>Terminates the ML compute instance. Before terminating the instance, Amazon SageMaker disconnects the ML storage volume from it. Amazon SageMaker preserves the ML storage volume. Amazon SageMaker stops charging you for the ML compute instance when you call <code>StopNotebookInstance</code>.</p><p>To access data on the ML storage volume for a notebook instance that has been terminated, call the <code>StartNotebookInstance</code> API. <code>StartNotebookInstance</code> launches another ML compute instance, configures it, and attaches the preserved ML storage volume so you can continue your work. </p>
 
 @param request A container for the necessary parameters to execute the StopNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerStopNotebookInstanceInput
 */
- (void)stopNotebookInstance:(AWSapi.sagemakerStopNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a processing job.</p>
 
 @param request A container for the necessary parameters to execute the StopProcessingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopProcessingJobRequest
 */
- (AWSTask *)stopProcessingJob:(AWSapi.sagemakerStopProcessingJobRequest *)request;

/**
 <p>Stops a processing job.</p>
 
 @param request A container for the necessary parameters to execute the StopProcessingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopProcessingJobRequest
 */
- (void)stopProcessingJob:(AWSapi.sagemakerStopProcessingJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a training job. To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms might use this 120-second window to save the model artifacts, so the results of the training is not lost. </p><p>When it receives a <code>StopTrainingJob</code> request, Amazon SageMaker changes the status of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the status to <code>Stopped</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopTrainingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopTrainingJobRequest
 */
- (AWSTask *)stopTrainingJob:(AWSapi.sagemakerStopTrainingJobRequest *)request;

/**
 <p>Stops a training job. To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms might use this 120-second window to save the model artifacts, so the results of the training is not lost. </p><p>When it receives a <code>StopTrainingJob</code> request, Amazon SageMaker changes the status of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the status to <code>Stopped</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopTrainingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopTrainingJobRequest
 */
- (void)stopTrainingJob:(AWSapi.sagemakerStopTrainingJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a transform job.</p><p>When Amazon SageMaker receives a <code>StopTransformJob</code> request, the status of the job changes to <code>Stopping</code>. After Amazon SageMaker stops the job, the status is set to <code>Stopped</code>. When you stop a transform job before it is completed, Amazon SageMaker doesn't store the job's output in Amazon S3.</p>
 
 @param request A container for the necessary parameters to execute the StopTransformJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopTransformJobRequest
 */
- (AWSTask *)stopTransformJob:(AWSapi.sagemakerStopTransformJobRequest *)request;

/**
 <p>Stops a transform job.</p><p>When Amazon SageMaker receives a <code>StopTransformJob</code> request, the status of the job changes to <code>Stopping</code>. After Amazon SageMaker stops the job, the status is set to <code>Stopped</code>. When you stop a transform job before it is completed, Amazon SageMaker doesn't store the job's output in Amazon S3.</p>
 
 @param request A container for the necessary parameters to execute the StopTransformJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerStopTransformJobRequest
 */
- (void)stopTransformJob:(AWSapi.sagemakerStopTransformJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified Git repository with the specified values.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateCodeRepositoryOutput`.
 
 @see AWSapi.sagemakerUpdateCodeRepositoryInput
 @see AWSapi.sagemakerUpdateCodeRepositoryOutput
 */
- (AWSTask<AWSapi.sagemakerUpdateCodeRepositoryOutput *> *)updateCodeRepository:(AWSapi.sagemakerUpdateCodeRepositoryInput *)request;

/**
 <p>Updates the specified Git repository with the specified values.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerUpdateCodeRepositoryInput
 @see AWSapi.sagemakerUpdateCodeRepositoryOutput
 */
- (void)updateCodeRepository:(AWSapi.sagemakerUpdateCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateCodeRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a domain. Changes will impact all of the people in the domain.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateDomainRequest
 @see AWSapi.sagemakerUpdateDomainResponse
 */
- (AWSTask<AWSapi.sagemakerUpdateDomainResponse *> *)updateDomain:(AWSapi.sagemakerUpdateDomainRequest *)request;

/**
 <p>Updates a domain. Changes will impact all of the people in the domain.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateDomainRequest
 @see AWSapi.sagemakerUpdateDomainResponse
 */
- (void)updateDomain:(AWSapi.sagemakerUpdateDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deploys the new <code>EndpointConfig</code> specified in the request, switches to using newly created endpoint, and then deletes resources provisioned for the endpoint using the previous <code>EndpointConfig</code> (there is no availability loss). </p><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p><note><p>You must not delete an <code>EndpointConfig</code> in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateEndpointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerUpdateEndpointInput
 @see AWSapi.sagemakerUpdateEndpointOutput
 */
- (AWSTask<AWSapi.sagemakerUpdateEndpointOutput *> *)updateEndpoint:(AWSapi.sagemakerUpdateEndpointInput *)request;

/**
 <p>Deploys the new <code>EndpointConfig</code> specified in the request, switches to using newly created endpoint, and then deletes resources provisioned for the endpoint using the previous <code>EndpointConfig</code> (there is no availability loss). </p><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p><note><p>You must not delete an <code>EndpointConfig</code> in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerUpdateEndpointInput
 @see AWSapi.sagemakerUpdateEndpointOutput
 */
- (void)updateEndpoint:(AWSapi.sagemakerUpdateEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates variant weight of one or more variants associated with an existing endpoint, or capacity of one variant associated with an existing endpoint. When it receives the request, Amazon SageMaker sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpointWeightsAndCapacities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesInput
 @see AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput
 */
- (AWSTask<AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput *> *)updateEndpointWeightsAndCapacities:(AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesInput *)request;

/**
 <p>Updates variant weight of one or more variants associated with an existing endpoint, or capacity of one variant associated with an existing endpoint. When it receives the request, Amazon SageMaker sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpointWeightsAndCapacities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesInput
 @see AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput
 */
- (void)updateEndpointWeightsAndCapacities:(AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds, updates, or removes the description of an experiment. Updates the display name of an experiment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorConflict`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateExperimentRequest
 @see AWSapi.sagemakerUpdateExperimentResponse
 */
- (AWSTask<AWSapi.sagemakerUpdateExperimentResponse *> *)updateExperiment:(AWSapi.sagemakerUpdateExperimentRequest *)request;

/**
 <p>Adds, updates, or removes the description of an experiment. Updates the display name of an experiment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorConflict`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateExperimentRequest
 @see AWSapi.sagemakerUpdateExperimentResponse
 */
- (void)updateExperiment:(AWSapi.sagemakerUpdateExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a previously created schedule.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateMonitoringScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateMonitoringScheduleRequest
 @see AWSapi.sagemakerUpdateMonitoringScheduleResponse
 */
- (AWSTask<AWSapi.sagemakerUpdateMonitoringScheduleResponse *> *)updateMonitoringSchedule:(AWSapi.sagemakerUpdateMonitoringScheduleRequest *)request;

/**
 <p>Updates a previously created schedule.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateMonitoringScheduleRequest
 @see AWSapi.sagemakerUpdateMonitoringScheduleResponse
 */
- (void)updateMonitoringSchedule:(AWSapi.sagemakerUpdateMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateMonitoringScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a notebook instance. NotebookInstance updates include upgrading or downgrading the ML compute instance used for your notebook instance to accommodate changes in your workload requirements.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateNotebookInstanceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerUpdateNotebookInstanceInput
 @see AWSapi.sagemakerUpdateNotebookInstanceOutput
 */
- (AWSTask<AWSapi.sagemakerUpdateNotebookInstanceOutput *> *)updateNotebookInstance:(AWSapi.sagemakerUpdateNotebookInstanceInput *)request;

/**
 <p>Updates a notebook instance. NotebookInstance updates include upgrading or downgrading the ML compute instance used for your notebook instance to accommodate changes in your workload requirements.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerUpdateNotebookInstanceInput
 @see AWSapi.sagemakerUpdateNotebookInstanceOutput
 */
- (void)updateNotebookInstance:(AWSapi.sagemakerUpdateNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateNotebookInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a notebook instance lifecycle configuration created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigInput
 @see AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput
 */
- (AWSTask<AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput *> *)updateNotebookInstanceLifecycleConfig:(AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Updates a notebook instance lifecycle configuration created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigInput
 @see AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput
 */
- (void)updateNotebookInstanceLifecycleConfig:(AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the display name of a trial.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorConflict`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateTrialRequest
 @see AWSapi.sagemakerUpdateTrialResponse
 */
- (AWSTask<AWSapi.sagemakerUpdateTrialResponse *> *)updateTrial:(AWSapi.sagemakerUpdateTrialRequest *)request;

/**
 <p>Updates the display name of a trial.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorConflict`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateTrialRequest
 @see AWSapi.sagemakerUpdateTrialResponse
 */
- (void)updateTrial:(AWSapi.sagemakerUpdateTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates one or more properties of a trial component.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorConflict`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateTrialComponentRequest
 @see AWSapi.sagemakerUpdateTrialComponentResponse
 */
- (AWSTask<AWSapi.sagemakerUpdateTrialComponentResponse *> *)updateTrialComponent:(AWSapi.sagemakerUpdateTrialComponentRequest *)request;

/**
 <p>Updates one or more properties of a trial component.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorConflict`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateTrialComponentRequest
 @see AWSapi.sagemakerUpdateTrialComponentResponse
 */
- (void)updateTrialComponent:(AWSapi.sagemakerUpdateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a user profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateUserProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateUserProfileRequest
 @see AWSapi.sagemakerUpdateUserProfileResponse
 */
- (AWSTask<AWSapi.sagemakerUpdateUserProfileResponse *> *)updateUserProfile:(AWSapi.sagemakerUpdateUserProfileRequest *)request;

/**
 <p>Updates a user profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`, `AWSapi.sagemakerErrorResourceInUse`, `AWSapi.sagemakerErrorResourceNotFound`.
 
 @see AWSapi.sagemakerUpdateUserProfileRequest
 @see AWSapi.sagemakerUpdateUserProfileResponse
 */
- (void)updateUserProfile:(AWSapi.sagemakerUpdateUserProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateUserProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Restricts access to tasks assigned to workers in the specified workforce to those within specific ranges of IP addresses. You specify allowed IP addresses by creating a list of up to four <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>.</p><p>By default, a workforce isn't restricted to specific IP addresses. If you specify a range of IP addresses, workers who attempt to access tasks using any IP address outside the specified range are denied access and get a <code>Not Found</code> error message on the worker portal. After restricting access with this operation, you can see the allowed IP values for a private workforce with the operation.</p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateWorkforce service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateWorkforceResponse`.
 
 @see AWSapi.sagemakerUpdateWorkforceRequest
 @see AWSapi.sagemakerUpdateWorkforceResponse
 */
- (AWSTask<AWSapi.sagemakerUpdateWorkforceResponse *> *)updateWorkforce:(AWSapi.sagemakerUpdateWorkforceRequest *)request;

/**
 <p>Restricts access to tasks assigned to workers in the specified workforce to those within specific ranges of IP addresses. You specify allowed IP addresses by creating a list of up to four <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>.</p><p>By default, a workforce isn't restricted to specific IP addresses. If you specify a range of IP addresses, workers who attempt to access tasks using any IP address outside the specified range are denied access and get a <code>Not Found</code> error message on the worker portal. After restricting access with this operation, you can see the allowed IP values for a private workforce with the operation.</p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateWorkforce service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSapi.sagemakerUpdateWorkforceRequest
 @see AWSapi.sagemakerUpdateWorkforceResponse
 */
- (void)updateWorkforce:(AWSapi.sagemakerUpdateWorkforceRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateWorkforceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing work team with new member definitions or description.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.sagemakerUpdateWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerUpdateWorkteamRequest
 @see AWSapi.sagemakerUpdateWorkteamResponse
 */
- (AWSTask<AWSapi.sagemakerUpdateWorkteamResponse *> *)updateWorkteam:(AWSapi.sagemakerUpdateWorkteamRequest *)request;

/**
 <p>Updates an existing work team with new member definitions or description.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.sagemakerErrorDomain` domain and the following error code: `AWSapi.sagemakerErrorResourceLimitExceeded`.
 
 @see AWSapi.sagemakerUpdateWorkteamRequest
 @see AWSapi.sagemakerUpdateWorkteamResponse
 */
- (void)updateWorkteam:(AWSapi.sagemakerUpdateWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.sagemakerUpdateWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
