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
#import "AWSSageMakerServiceModel.h"
#import "AWSSageMakerServiceResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSageMakerService
FOUNDATION_EXPORT NSString *const AWSSageMakerServiceSDKVersion;

/**
 <p>Provides APIs for creating and managing Amazon SageMaker resources. </p><p>Other Resources:</p><ul><li><p><a href="https://docs.aws.amazon.com/sagemaker/latest/dg/whatis.html#first-time-user">Amazon SageMaker Developer Guide</a></p></li><li><p><a href="https://docs.aws.amazon.com/augmented-ai/2019-11-07/APIReference/Welcome.html">Amazon Augmented AI Runtime API Reference</a></p></li></ul>
 */
@interface AWSSageMakerService : AWSService

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

     let SageMakerService = AWSSageMakerService.default()

 *Objective-C*

     AWSSageMakerService *SageMakerService = [AWSSageMakerService defaultSageMakerService];

 @return The default service client.
 */
+ (instancetype)defaultSageMakerService;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSageMakerService.register(with: configuration!, forKey: "USWest2SageMakerService")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:@"USWest2SageMakerService"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SageMakerService = AWSSageMakerService(forKey: "USWest2SageMakerService")

 *Objective-C*

     AWSSageMakerService *SageMakerService = [AWSSageMakerService SageMakerServiceForKey:@"USWest2SageMakerService"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSageMakerServiceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSageMakerServiceWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSageMakerService.register(with: configuration!, forKey: "USWest2SageMakerService")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:@"USWest2SageMakerService"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SageMakerService = AWSSageMakerService(forKey: "USWest2SageMakerService")

 *Objective-C*

     AWSSageMakerService *SageMakerService = [AWSSageMakerService SageMakerServiceForKey:@"USWest2SageMakerService"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SageMakerServiceForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSageMakerServiceForKey:(NSString *)key;

/**
 <p>Adds or overwrites one or more tags for the specified Amazon SageMaker resource. You can add tags to notebook instances, training jobs, hyperparameter tuning jobs, batch transform jobs, models, labeling jobs, work teams, endpoint configurations, and endpoints.</p><p>Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see For more information, see <a href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS Tagging Strategies</a>.</p><note><p>Tags that you add to a hyperparameter tuning job by calling this API are also added to any training jobs that the hyperparameter tuning job launches after you call this API, but not to training jobs that the hyperparameter tuning job launched before you called this API. To make sure that the tags associated with a hyperparameter tuning job are also added to all training jobs that the hyperparameter tuning job launches, add the tags when you first create the tuning job by specifying them in the <code>Tags</code> parameter of <a>CreateHyperParameterTuningJob</a></p></note>
 
 @param request A container for the necessary parameters to execute the AddTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceAddTagsOutput`.
 
 @see AWSSageMakerServiceAddTagsInput
 @see AWSSageMakerServiceAddTagsOutput
 */
- (AWSTask<AWSSageMakerServiceAddTagsOutput *> *)addTags:(AWSSageMakerServiceAddTagsInput *)request;

/**
 <p>Adds or overwrites one or more tags for the specified Amazon SageMaker resource. You can add tags to notebook instances, training jobs, hyperparameter tuning jobs, batch transform jobs, models, labeling jobs, work teams, endpoint configurations, and endpoints.</p><p>Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see For more information, see <a href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS Tagging Strategies</a>.</p><note><p>Tags that you add to a hyperparameter tuning job by calling this API are also added to any training jobs that the hyperparameter tuning job launches after you call this API, but not to training jobs that the hyperparameter tuning job launched before you called this API. To make sure that the tags associated with a hyperparameter tuning job are also added to all training jobs that the hyperparameter tuning job launches, add the tags when you first create the tuning job by specifying them in the <code>Tags</code> parameter of <a>CreateHyperParameterTuningJob</a></p></note>
 
 @param request A container for the necessary parameters to execute the AddTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceAddTagsInput
 @see AWSSageMakerServiceAddTagsOutput
 */
- (void)addTags:(AWSSageMakerServiceAddTagsInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceAddTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a trial component with a trial. A trial component can be associated with multiple trials. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceAssociateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceAssociateTrialComponentRequest
 @see AWSSageMakerServiceAssociateTrialComponentResponse
 */
- (AWSTask<AWSSageMakerServiceAssociateTrialComponentResponse *> *)associateTrialComponent:(AWSSageMakerServiceAssociateTrialComponentRequest *)request;

/**
 <p>Associates a trial component with a trial. A trial component can be associated with multiple trials. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceAssociateTrialComponentRequest
 @see AWSSageMakerServiceAssociateTrialComponentResponse
 */
- (void)associateTrialComponent:(AWSSageMakerServiceAssociateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceAssociateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a machine learning algorithm that you can use in Amazon SageMaker and list in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlgorithm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateAlgorithmOutput`.
 
 @see AWSSageMakerServiceCreateAlgorithmInput
 @see AWSSageMakerServiceCreateAlgorithmOutput
 */
- (AWSTask<AWSSageMakerServiceCreateAlgorithmOutput *> *)createAlgorithm:(AWSSageMakerServiceCreateAlgorithmInput *)request;

/**
 <p>Create a machine learning algorithm that you can use in Amazon SageMaker and list in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlgorithm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceCreateAlgorithmInput
 @see AWSSageMakerServiceCreateAlgorithmOutput
 */
- (void)createAlgorithm:(AWSSageMakerServiceCreateAlgorithmInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateAlgorithmOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a running App for the specified UserProfile. Supported Apps are <code>JupyterServer</code>, <code>KernelGateway</code>, and <code>TensorBoard</code>. This operation is automatically invoked by Amazon SageMaker Studio upon access to the associated Studio Domain, and when new kernel configurations are selected by the user. A user may have multiple Apps active simultaneously. Apps will automatically terminate and be deleted when stopped from within Studio, or when the DeleteApp API is manually called. UserProfiles are limited to 5 concurrently running Apps at a time.</p>
 
 @param request A container for the necessary parameters to execute the CreateApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateAppRequest
 @see AWSSageMakerServiceCreateAppResponse
 */
- (AWSTask<AWSSageMakerServiceCreateAppResponse *> *)createApp:(AWSSageMakerServiceCreateAppRequest *)request;

/**
 <p>Creates a running App for the specified UserProfile. Supported Apps are <code>JupyterServer</code>, <code>KernelGateway</code>, and <code>TensorBoard</code>. This operation is automatically invoked by Amazon SageMaker Studio upon access to the associated Studio Domain, and when new kernel configurations are selected by the user. A user may have multiple Apps active simultaneously. Apps will automatically terminate and be deleted when stopped from within Studio, or when the DeleteApp API is manually called. UserProfiles are limited to 5 concurrently running Apps at a time.</p>
 
 @param request A container for the necessary parameters to execute the CreateApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateAppRequest
 @see AWSSageMakerServiceCreateAppResponse
 */
- (void)createApp:(AWSSageMakerServiceCreateAppRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AutoPilot job.</p><p>After you run an AutoPilot job, you can find the best performing model by calling , and then deploy that model by following the steps described in <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html">Step 6.1: Deploy the Model to Amazon SageMaker Hosting Services</a>.</p><p>For information about how to use AutoPilot, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html">Use AutoPilot to Automate Model Development</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateAutoMLJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateAutoMLJobRequest
 @see AWSSageMakerServiceCreateAutoMLJobResponse
 */
- (AWSTask<AWSSageMakerServiceCreateAutoMLJobResponse *> *)createAutoMLJob:(AWSSageMakerServiceCreateAutoMLJobRequest *)request;

/**
 <p>Creates an AutoPilot job.</p><p>After you run an AutoPilot job, you can find the best performing model by calling , and then deploy that model by following the steps described in <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html">Step 6.1: Deploy the Model to Amazon SageMaker Hosting Services</a>.</p><p>For information about how to use AutoPilot, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html">Use AutoPilot to Automate Model Development</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateAutoMLJobRequest
 @see AWSSageMakerServiceCreateAutoMLJobResponse
 */
- (void)createAutoMLJob:(AWSSageMakerServiceCreateAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateAutoMLJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Git repository as a resource in your Amazon SageMaker account. You can associate the repository with notebook instances so that you can use Git source control for the notebooks you create. The Git repository is a resource in your Amazon SageMaker account, so it can be associated with more than one notebook instance, and it persists independently from the lifecycle of any notebook instances it is associated with.</p><p>The repository can be hosted either in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository.</p>
 
 @param request A container for the necessary parameters to execute the CreateCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateCodeRepositoryOutput`.
 
 @see AWSSageMakerServiceCreateCodeRepositoryInput
 @see AWSSageMakerServiceCreateCodeRepositoryOutput
 */
- (AWSTask<AWSSageMakerServiceCreateCodeRepositoryOutput *> *)createCodeRepository:(AWSSageMakerServiceCreateCodeRepositoryInput *)request;

/**
 <p>Creates a Git repository as a resource in your Amazon SageMaker account. You can associate the repository with notebook instances so that you can use Git source control for the notebooks you create. The Git repository is a resource in your Amazon SageMaker account, so it can be associated with more than one notebook instance, and it persists independently from the lifecycle of any notebook instances it is associated with.</p><p>The repository can be hosted either in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository.</p>
 
 @param request A container for the necessary parameters to execute the CreateCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceCreateCodeRepositoryInput
 @see AWSSageMakerServiceCreateCodeRepositoryOutput
 */
- (void)createCodeRepository:(AWSSageMakerServiceCreateCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateCodeRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a model compilation job. After the model has been compiled, Amazon SageMaker saves the resulting model artifacts to an Amazon Simple Storage Service (Amazon S3) bucket that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts with AWS IoT Greengrass. In that case, deploy them as an ML resource.</p><p>In the request body, you provide the following:</p><ul><li><p>A name for the compilation job</p></li><li><p> Information about the input model artifacts </p></li><li><p>The output location for the compiled model and the device (target) that the model runs on </p></li><li><p><code>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker assumes to perform the model compilation job</code></p></li></ul><p>You can also provide a <code>Tag</code> to track the model compilation job's resource use and costs. The response body contains the <code>CompilationJobArn</code> for the compiled job.</p><p>To stop a model compilation job, use <a>StopCompilationJob</a>. To get information about a particular model compilation job, use <a>DescribeCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCompilationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateCompilationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateCompilationJobRequest
 @see AWSSageMakerServiceCreateCompilationJobResponse
 */
- (AWSTask<AWSSageMakerServiceCreateCompilationJobResponse *> *)createCompilationJob:(AWSSageMakerServiceCreateCompilationJobRequest *)request;

/**
 <p>Starts a model compilation job. After the model has been compiled, Amazon SageMaker saves the resulting model artifacts to an Amazon Simple Storage Service (Amazon S3) bucket that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts with AWS IoT Greengrass. In that case, deploy them as an ML resource.</p><p>In the request body, you provide the following:</p><ul><li><p>A name for the compilation job</p></li><li><p> Information about the input model artifacts </p></li><li><p>The output location for the compiled model and the device (target) that the model runs on </p></li><li><p><code>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker assumes to perform the model compilation job</code></p></li></ul><p>You can also provide a <code>Tag</code> to track the model compilation job's resource use and costs. The response body contains the <code>CompilationJobArn</code> for the compiled job.</p><p>To stop a model compilation job, use <a>StopCompilationJob</a>. To get information about a particular model compilation job, use <a>DescribeCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCompilationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateCompilationJobRequest
 @see AWSSageMakerServiceCreateCompilationJobResponse
 */
- (void)createCompilationJob:(AWSSageMakerServiceCreateCompilationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateCompilationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Domain for Amazon SageMaker Studio, which can be accessed by end-users in a web browser. A Domain has an associated directory, list of authorized users, and a variety of security, application, policies, and Amazon Virtual Private Cloud configurations. An AWS account is limited to one Domain, per region. Users within a domain can share notebook files and other artifacts with each other. When a Domain is created, an Amazon Elastic File System (EFS) is also created for use by all of the users within the Domain. Each user receives a private home directory within the EFS for notebooks, Git repositories, and data files. </p>
 
 @param request A container for the necessary parameters to execute the CreateDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateDomainRequest
 @see AWSSageMakerServiceCreateDomainResponse
 */
- (AWSTask<AWSSageMakerServiceCreateDomainResponse *> *)createDomain:(AWSSageMakerServiceCreateDomainRequest *)request;

/**
 <p>Creates a Domain for Amazon SageMaker Studio, which can be accessed by end-users in a web browser. A Domain has an associated directory, list of authorized users, and a variety of security, application, policies, and Amazon Virtual Private Cloud configurations. An AWS account is limited to one Domain, per region. Users within a domain can share notebook files and other artifacts with each other. When a Domain is created, an Amazon Elastic File System (EFS) is also created for use by all of the users within the Domain. Each user receives a private home directory within the EFS for notebooks, Git repositories, and data files. </p>
 
 @param request A container for the necessary parameters to execute the CreateDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateDomainRequest
 @see AWSSageMakerServiceCreateDomainResponse
 */
- (void)createDomain:(AWSSageMakerServiceCreateDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an endpoint using the endpoint configuration specified in the request. Amazon SageMaker uses the endpoint to provision resources and deploy models. You create the endpoint configuration with the <a>CreateEndpointConfig</a> API. </p><p> Use this API to deploy models using Amazon SageMaker hosting services. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><note><p> You must not delete an <code>EndpointConfig</code> that is in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p></note><p>The endpoint name must be unique within an AWS Region in your AWS account. </p><p>When it receives the request, Amazon SageMaker creates the endpoint, launches the resources (ML compute instances), and deploys the model(s) on them. </p><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Creating</code>. After it creates the endpoint, it sets the status to <code>InService</code>. Amazon SageMaker can then process incoming requests for inferences. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API.</p><p>If any of the models hosted at this endpoint get model data from an Amazon S3 location, Amazon SageMaker uses AWS Security Token Service to download model artifacts from the S3 path you provided. AWS STS is activated in your IAM user account by default. If you previously deactivated AWS STS for a region, you need to reactivate AWS STS for that region. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateEndpointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateEndpointInput
 @see AWSSageMakerServiceCreateEndpointOutput
 */
- (AWSTask<AWSSageMakerServiceCreateEndpointOutput *> *)createEndpoint:(AWSSageMakerServiceCreateEndpointInput *)request;

/**
 <p>Creates an endpoint using the endpoint configuration specified in the request. Amazon SageMaker uses the endpoint to provision resources and deploy models. You create the endpoint configuration with the <a>CreateEndpointConfig</a> API. </p><p> Use this API to deploy models using Amazon SageMaker hosting services. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><note><p> You must not delete an <code>EndpointConfig</code> that is in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p></note><p>The endpoint name must be unique within an AWS Region in your AWS account. </p><p>When it receives the request, Amazon SageMaker creates the endpoint, launches the resources (ML compute instances), and deploys the model(s) on them. </p><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Creating</code>. After it creates the endpoint, it sets the status to <code>InService</code>. Amazon SageMaker can then process incoming requests for inferences. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API.</p><p>If any of the models hosted at this endpoint get model data from an Amazon S3 location, Amazon SageMaker uses AWS Security Token Service to download model artifacts from the S3 path you provided. AWS STS is activated in your IAM user account by default. If you previously deactivated AWS STS for a region, you need to reactivate AWS STS for that region. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateEndpointInput
 @see AWSSageMakerServiceCreateEndpointOutput
 */
- (void)createEndpoint:(AWSSageMakerServiceCreateEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an endpoint configuration that Amazon SageMaker hosting services uses to deploy models. In the configuration, you identify one or more models, created using the <code>CreateModel</code> API, to deploy and the resources that you want Amazon SageMaker to provision. Then you call the <a>CreateEndpoint</a> API.</p><note><p> Use this API if you want to use Amazon SageMaker hosting services to deploy models into production. </p></note><p>In the request, you define a <code>ProductionVariant</code>, for each model that you want to deploy. Each <code>ProductionVariant</code> parameter also describes the resources that you want Amazon SageMaker to provision. This includes the number and type of ML compute instances to deploy. </p><p>If you are hosting multiple models, you also assign a <code>VariantWeight</code> to specify how much traffic you want to allocate to each model. For example, suppose that you want to host two models, A and B, and you assign traffic weight 2 for model A and 1 for model B. Amazon SageMaker distributes two-thirds of the traffic to Model A, and one-third to model B. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p>
 
 @param request A container for the necessary parameters to execute the CreateEndpointConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateEndpointConfigOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateEndpointConfigInput
 @see AWSSageMakerServiceCreateEndpointConfigOutput
 */
- (AWSTask<AWSSageMakerServiceCreateEndpointConfigOutput *> *)createEndpointConfig:(AWSSageMakerServiceCreateEndpointConfigInput *)request;

/**
 <p>Creates an endpoint configuration that Amazon SageMaker hosting services uses to deploy models. In the configuration, you identify one or more models, created using the <code>CreateModel</code> API, to deploy and the resources that you want Amazon SageMaker to provision. Then you call the <a>CreateEndpoint</a> API.</p><note><p> Use this API if you want to use Amazon SageMaker hosting services to deploy models into production. </p></note><p>In the request, you define a <code>ProductionVariant</code>, for each model that you want to deploy. Each <code>ProductionVariant</code> parameter also describes the resources that you want Amazon SageMaker to provision. This includes the number and type of ML compute instances to deploy. </p><p>If you are hosting multiple models, you also assign a <code>VariantWeight</code> to specify how much traffic you want to allocate to each model. For example, suppose that you want to host two models, A and B, and you assign traffic weight 2 for model A and 1 for model B. Amazon SageMaker distributes two-thirds of the traffic to Model A, and one-third to model B. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p>
 
 @param request A container for the necessary parameters to execute the CreateEndpointConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateEndpointConfigInput
 @see AWSSageMakerServiceCreateEndpointConfigOutput
 */
- (void)createEndpointConfig:(AWSSageMakerServiceCreateEndpointConfigInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateEndpointConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon SageMaker <i>experiment</i>. An experiment is a collection of <i>trials</i> that are observed, compared and evaluated as a group. A trial is a set of steps, called <i>trial components</i>, that produce a machine learning model.</p><p>The goal of an experiment is to determine the components that produce the best model. Multiple trials are performed, each one isolating and measuring the impact of a change to one or more inputs, while keeping the remaining inputs constant.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to experiments, trials, trial components and then use the <a>Search</a> API to search for the tags.</p><p>To add a description to an experiment, specify the optional <code>Description</code> parameter. To add a description later, or to change the description, call the <a>UpdateExperiment</a> API.</p><p>To get a list of all your experiments, call the <a>ListExperiments</a> API. To view an experiment's properties, call the <a>DescribeExperiment</a> API. To get a list of all the trials associated with an experiment, call the <a>ListTrials</a> API. To create a trial call the <a>CreateTrial</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateExperimentRequest
 @see AWSSageMakerServiceCreateExperimentResponse
 */
- (AWSTask<AWSSageMakerServiceCreateExperimentResponse *> *)createExperiment:(AWSSageMakerServiceCreateExperimentRequest *)request;

/**
 <p>Creates an Amazon SageMaker <i>experiment</i>. An experiment is a collection of <i>trials</i> that are observed, compared and evaluated as a group. A trial is a set of steps, called <i>trial components</i>, that produce a machine learning model.</p><p>The goal of an experiment is to determine the components that produce the best model. Multiple trials are performed, each one isolating and measuring the impact of a change to one or more inputs, while keeping the remaining inputs constant.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to experiments, trials, trial components and then use the <a>Search</a> API to search for the tags.</p><p>To add a description to an experiment, specify the optional <code>Description</code> parameter. To add a description later, or to change the description, call the <a>UpdateExperiment</a> API.</p><p>To get a list of all your experiments, call the <a>ListExperiments</a> API. To view an experiment's properties, call the <a>DescribeExperiment</a> API. To get a list of all the trials associated with an experiment, call the <a>ListTrials</a> API. To create a trial call the <a>CreateTrial</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateExperimentRequest
 @see AWSSageMakerServiceCreateExperimentResponse
 */
- (void)createExperiment:(AWSSageMakerServiceCreateExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a flow definition.</p>
 
 @param request A container for the necessary parameters to execute the CreateFlowDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateFlowDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateFlowDefinitionRequest
 @see AWSSageMakerServiceCreateFlowDefinitionResponse
 */
- (AWSTask<AWSSageMakerServiceCreateFlowDefinitionResponse *> *)createFlowDefinition:(AWSSageMakerServiceCreateFlowDefinitionRequest *)request;

/**
 <p>Creates a flow definition.</p>
 
 @param request A container for the necessary parameters to execute the CreateFlowDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateFlowDefinitionRequest
 @see AWSSageMakerServiceCreateFlowDefinitionResponse
 */
- (void)createFlowDefinition:(AWSSageMakerServiceCreateFlowDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateFlowDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Defines the settings you will use for the human review workflow user interface. Reviewers will see a three-panel interface with an instruction area, the item to review, and an input area.</p>
 
 @param request A container for the necessary parameters to execute the CreateHumanTaskUi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateHumanTaskUiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateHumanTaskUiRequest
 @see AWSSageMakerServiceCreateHumanTaskUiResponse
 */
- (AWSTask<AWSSageMakerServiceCreateHumanTaskUiResponse *> *)createHumanTaskUi:(AWSSageMakerServiceCreateHumanTaskUiRequest *)request;

/**
 <p>Defines the settings you will use for the human review workflow user interface. Reviewers will see a three-panel interface with an instruction area, the item to review, and an input area.</p>
 
 @param request A container for the necessary parameters to execute the CreateHumanTaskUi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateHumanTaskUiRequest
 @see AWSSageMakerServiceCreateHumanTaskUiResponse
 */
- (void)createHumanTaskUi:(AWSSageMakerServiceCreateHumanTaskUiRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateHumanTaskUiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a hyperparameter tuning job. A hyperparameter tuning job finds the best version of a model by running many training jobs on your dataset using the algorithm you choose and values for hyperparameters within ranges that you specify. It then chooses the hyperparameter values that result in a model that performs the best, as measured by an objective metric that you choose.</p>
 
 @param request A container for the necessary parameters to execute the CreateHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateHyperParameterTuningJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateHyperParameterTuningJobRequest
 @see AWSSageMakerServiceCreateHyperParameterTuningJobResponse
 */
- (AWSTask<AWSSageMakerServiceCreateHyperParameterTuningJobResponse *> *)createHyperParameterTuningJob:(AWSSageMakerServiceCreateHyperParameterTuningJobRequest *)request;

/**
 <p>Starts a hyperparameter tuning job. A hyperparameter tuning job finds the best version of a model by running many training jobs on your dataset using the algorithm you choose and values for hyperparameters within ranges that you specify. It then chooses the hyperparameter values that result in a model that performs the best, as measured by an objective metric that you choose.</p>
 
 @param request A container for the necessary parameters to execute the CreateHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateHyperParameterTuningJobRequest
 @see AWSSageMakerServiceCreateHyperParameterTuningJobResponse
 */
- (void)createHyperParameterTuningJob:(AWSSageMakerServiceCreateHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateHyperParameterTuningJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a job that uses workers to label the data objects in your input dataset. You can use the labeled data to train machine learning models.</p><p>You can select your workforce from one of three providers:</p><ul><li><p>A private workforce that you create. It can include employees, contractors, and outside experts. Use a private workforce when want the data to stay within your organization or when a specific set of skills is required.</p></li><li><p>One or more vendors that you select from the AWS Marketplace. Vendors provide expertise in specific areas. </p></li><li><p>The Amazon Mechanical Turk workforce. This is the largest workforce, but it should only be used for public data or data that has been stripped of any personally identifiable information.</p></li></ul><p>You can also use <i>automated data labeling</i> to reduce the number of data objects that need to be labeled by a human. Automated data labeling uses <i>active learning</i> to determine if a data object can be labeled by machine or if it needs to be sent to a human worker. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html">Using Automated Data Labeling</a>.</p><p>The data objects to be labeled are contained in an Amazon S3 bucket. You create a <i>manifest file</i> that describes the location of each object. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html">Using Input and Output Data</a>.</p><p>The output can be used as the manifest file for another labeling job or as training data for your machine learning models.</p>
 
 @param request A container for the necessary parameters to execute the CreateLabelingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateLabelingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateLabelingJobRequest
 @see AWSSageMakerServiceCreateLabelingJobResponse
 */
- (AWSTask<AWSSageMakerServiceCreateLabelingJobResponse *> *)createLabelingJob:(AWSSageMakerServiceCreateLabelingJobRequest *)request;

/**
 <p>Creates a job that uses workers to label the data objects in your input dataset. You can use the labeled data to train machine learning models.</p><p>You can select your workforce from one of three providers:</p><ul><li><p>A private workforce that you create. It can include employees, contractors, and outside experts. Use a private workforce when want the data to stay within your organization or when a specific set of skills is required.</p></li><li><p>One or more vendors that you select from the AWS Marketplace. Vendors provide expertise in specific areas. </p></li><li><p>The Amazon Mechanical Turk workforce. This is the largest workforce, but it should only be used for public data or data that has been stripped of any personally identifiable information.</p></li></ul><p>You can also use <i>automated data labeling</i> to reduce the number of data objects that need to be labeled by a human. Automated data labeling uses <i>active learning</i> to determine if a data object can be labeled by machine or if it needs to be sent to a human worker. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html">Using Automated Data Labeling</a>.</p><p>The data objects to be labeled are contained in an Amazon S3 bucket. You create a <i>manifest file</i> that describes the location of each object. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html">Using Input and Output Data</a>.</p><p>The output can be used as the manifest file for another labeling job or as training data for your machine learning models.</p>
 
 @param request A container for the necessary parameters to execute the CreateLabelingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateLabelingJobRequest
 @see AWSSageMakerServiceCreateLabelingJobResponse
 */
- (void)createLabelingJob:(AWSSageMakerServiceCreateLabelingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateLabelingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a model in Amazon SageMaker. In the request, you name the model and describe a primary container. For the primary container, you specify the Docker image that contains inference code, artifacts (from prior training), and a custom environment map that the inference code uses when you deploy the model for predictions.</p><p>Use this API to create a model if you want to use Amazon SageMaker hosting services or run a batch transform job.</p><p>To host your model, you create an endpoint configuration with the <code>CreateEndpointConfig</code> API, and then create an endpoint with the <code>CreateEndpoint</code> API. Amazon SageMaker then deploys all of the containers that you defined for the model in the hosting environment. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><p>To run a batch transform using your model, you start a job with the <code>CreateTransformJob</code> API. Amazon SageMaker uses your model and your dataset to get inferences which are then saved to a specified S3 location.</p><p>In the <code>CreateModel</code> request, you must define a container with the <code>PrimaryContainer</code> parameter.</p><p>In the request, you also provide an IAM role that Amazon SageMaker can assume to access model artifacts and docker image for deployment on ML compute hosting instances or for batch transform jobs. In addition, you also use the IAM role to manage permissions the inference code needs. For example, if the inference code access any other AWS resources, you grant necessary permissions via this role.</p>
 
 @param request A container for the necessary parameters to execute the CreateModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateModelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateModelInput
 @see AWSSageMakerServiceCreateModelOutput
 */
- (AWSTask<AWSSageMakerServiceCreateModelOutput *> *)createModel:(AWSSageMakerServiceCreateModelInput *)request;

/**
 <p>Creates a model in Amazon SageMaker. In the request, you name the model and describe a primary container. For the primary container, you specify the Docker image that contains inference code, artifacts (from prior training), and a custom environment map that the inference code uses when you deploy the model for predictions.</p><p>Use this API to create a model if you want to use Amazon SageMaker hosting services or run a batch transform job.</p><p>To host your model, you create an endpoint configuration with the <code>CreateEndpointConfig</code> API, and then create an endpoint with the <code>CreateEndpoint</code> API. Amazon SageMaker then deploys all of the containers that you defined for the model in the hosting environment. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><p>To run a batch transform using your model, you start a job with the <code>CreateTransformJob</code> API. Amazon SageMaker uses your model and your dataset to get inferences which are then saved to a specified S3 location.</p><p>In the <code>CreateModel</code> request, you must define a container with the <code>PrimaryContainer</code> parameter.</p><p>In the request, you also provide an IAM role that Amazon SageMaker can assume to access model artifacts and docker image for deployment on ML compute hosting instances or for batch transform jobs. In addition, you also use the IAM role to manage permissions the inference code needs. For example, if the inference code access any other AWS resources, you grant necessary permissions via this role.</p>
 
 @param request A container for the necessary parameters to execute the CreateModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateModelInput
 @see AWSSageMakerServiceCreateModelOutput
 */
- (void)createModel:(AWSSageMakerServiceCreateModelInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateModelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a model package that you can use to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p><p>To create a model package by specifying a Docker container that contains your inference code and the Amazon S3 location of your model artifacts, provide values for <code>InferenceSpecification</code>. To create a model from an algorithm resource that you created or subscribed to in AWS Marketplace, provide a value for <code>SourceAlgorithmSpecification</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateModelPackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateModelPackageOutput`.
 
 @see AWSSageMakerServiceCreateModelPackageInput
 @see AWSSageMakerServiceCreateModelPackageOutput
 */
- (AWSTask<AWSSageMakerServiceCreateModelPackageOutput *> *)createModelPackage:(AWSSageMakerServiceCreateModelPackageInput *)request;

/**
 <p>Creates a model package that you can use to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p><p>To create a model package by specifying a Docker container that contains your inference code and the Amazon S3 location of your model artifacts, provide values for <code>InferenceSpecification</code>. To create a model from an algorithm resource that you created or subscribed to in AWS Marketplace, provide a value for <code>SourceAlgorithmSpecification</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateModelPackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceCreateModelPackageInput
 @see AWSSageMakerServiceCreateModelPackageOutput
 */
- (void)createModelPackage:(AWSSageMakerServiceCreateModelPackageInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateModelPackageOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a schedule that regularly starts Amazon SageMaker Processing Jobs to monitor the data captured for an Amazon SageMaker Endoint.</p>
 
 @param request A container for the necessary parameters to execute the CreateMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateMonitoringScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateMonitoringScheduleRequest
 @see AWSSageMakerServiceCreateMonitoringScheduleResponse
 */
- (AWSTask<AWSSageMakerServiceCreateMonitoringScheduleResponse *> *)createMonitoringSchedule:(AWSSageMakerServiceCreateMonitoringScheduleRequest *)request;

/**
 <p>Creates a schedule that regularly starts Amazon SageMaker Processing Jobs to monitor the data captured for an Amazon SageMaker Endoint.</p>
 
 @param request A container for the necessary parameters to execute the CreateMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateMonitoringScheduleRequest
 @see AWSSageMakerServiceCreateMonitoringScheduleResponse
 */
- (void)createMonitoringSchedule:(AWSSageMakerServiceCreateMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateMonitoringScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon SageMaker notebook instance. A notebook instance is a machine learning (ML) compute instance running on a Jupyter notebook. </p><p>In a <code>CreateNotebookInstance</code> request, specify the type of ML compute instance that you want to run. Amazon SageMaker launches the instance, installs common libraries that you can use to explore datasets for model training, and attaches an ML storage volume to the notebook instance. </p><p>Amazon SageMaker also provides a set of example notebooks. Each notebook demonstrates how to use Amazon SageMaker with a specific algorithm or with a machine learning framework. </p><p>After receiving the request, Amazon SageMaker does the following:</p><ol><li><p>Creates a network interface in the Amazon SageMaker VPC.</p></li><li><p>(Option) If you specified <code>SubnetId</code>, Amazon SageMaker creates a network interface in your own VPC, which is inferred from the subnet ID that you provide in the input. When creating this network interface, Amazon SageMaker attaches the security group that you specified in the request to the network interface that it creates in your VPC.</p></li><li><p>Launches an EC2 instance of the type specified in the request in the Amazon SageMaker VPC. If you specified <code>SubnetId</code> of your VPC, Amazon SageMaker specifies both network interfaces when launching this instance. This enables inbound traffic from your own VPC to the notebook instance, assuming that the security groups allow it.</p></li></ol><p>After creating the notebook instance, Amazon SageMaker returns its Amazon Resource Name (ARN). You can't change the name of a notebook instance after you create it.</p><p>After Amazon SageMaker creates the notebook instance, you can connect to the Jupyter server and work in Jupyter notebooks. For example, you can write code to explore a dataset that you can use for model training, train a model, host models by creating Amazon SageMaker endpoints, and validate hosted models. </p><p>For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateNotebookInstanceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateNotebookInstanceInput
 @see AWSSageMakerServiceCreateNotebookInstanceOutput
 */
- (AWSTask<AWSSageMakerServiceCreateNotebookInstanceOutput *> *)createNotebookInstance:(AWSSageMakerServiceCreateNotebookInstanceInput *)request;

/**
 <p>Creates an Amazon SageMaker notebook instance. A notebook instance is a machine learning (ML) compute instance running on a Jupyter notebook. </p><p>In a <code>CreateNotebookInstance</code> request, specify the type of ML compute instance that you want to run. Amazon SageMaker launches the instance, installs common libraries that you can use to explore datasets for model training, and attaches an ML storage volume to the notebook instance. </p><p>Amazon SageMaker also provides a set of example notebooks. Each notebook demonstrates how to use Amazon SageMaker with a specific algorithm or with a machine learning framework. </p><p>After receiving the request, Amazon SageMaker does the following:</p><ol><li><p>Creates a network interface in the Amazon SageMaker VPC.</p></li><li><p>(Option) If you specified <code>SubnetId</code>, Amazon SageMaker creates a network interface in your own VPC, which is inferred from the subnet ID that you provide in the input. When creating this network interface, Amazon SageMaker attaches the security group that you specified in the request to the network interface that it creates in your VPC.</p></li><li><p>Launches an EC2 instance of the type specified in the request in the Amazon SageMaker VPC. If you specified <code>SubnetId</code> of your VPC, Amazon SageMaker specifies both network interfaces when launching this instance. This enables inbound traffic from your own VPC to the notebook instance, assuming that the security groups allow it.</p></li></ol><p>After creating the notebook instance, Amazon SageMaker returns its Amazon Resource Name (ARN). You can't change the name of a notebook instance after you create it.</p><p>After Amazon SageMaker creates the notebook instance, you can connect to the Jupyter server and work in Jupyter notebooks. For example, you can write code to explore a dataset that you can use for model training, train a model, host models by creating Amazon SageMaker endpoints, and validate hosted models. </p><p>For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateNotebookInstanceInput
 @see AWSSageMakerServiceCreateNotebookInstanceOutput
 */
- (void)createNotebookInstance:(AWSSageMakerServiceCreateNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateNotebookInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a lifecycle configuration that you can associate with a notebook instance. A <i>lifecycle configuration</i> is a collection of shell scripts that run when you create or start a notebook instance.</p><p>Each lifecycle configuration script has a limit of 16384 characters.</p><p>The value of the <code>$PATH</code> environment variable that is available to both scripts is <code>/sbin:bin:/usr/sbin:/usr/bin</code>.</p><p>View CloudWatch Logs for notebook instance lifecycle configurations in log group <code>/aws/sagemaker/NotebookInstances</code> in log stream <code>[notebook-instance-name]/[LifecycleConfigHook]</code>.</p><p>Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for longer than 5 minutes, it fails and the notebook instance is not created or started.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigInput
 @see AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput
 */
- (AWSTask<AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput *> *)createNotebookInstanceLifecycleConfig:(AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Creates a lifecycle configuration that you can associate with a notebook instance. A <i>lifecycle configuration</i> is a collection of shell scripts that run when you create or start a notebook instance.</p><p>Each lifecycle configuration script has a limit of 16384 characters.</p><p>The value of the <code>$PATH</code> environment variable that is available to both scripts is <code>/sbin:bin:/usr/sbin:/usr/bin</code>.</p><p>View CloudWatch Logs for notebook instance lifecycle configurations in log group <code>/aws/sagemaker/NotebookInstances</code> in log stream <code>[notebook-instance-name]/[LifecycleConfigHook]</code>.</p><p>Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for longer than 5 minutes, it fails and the notebook instance is not created or started.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigInput
 @see AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput
 */
- (void)createNotebookInstanceLifecycleConfig:(AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a URL for a specified UserProfile in a Domain. When accessed in a web browser, the user will be automatically signed in to Amazon SageMaker Studio, and granted access to all of the Apps and files associated with that Amazon Elastic File System (EFS). This operation can only be called when AuthMode equals IAM. </p>
 
 @param request A container for the necessary parameters to execute the CreatePresignedDomainUrl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreatePresignedDomainUrlResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceCreatePresignedDomainUrlRequest
 @see AWSSageMakerServiceCreatePresignedDomainUrlResponse
 */
- (AWSTask<AWSSageMakerServiceCreatePresignedDomainUrlResponse *> *)createPresignedDomainUrl:(AWSSageMakerServiceCreatePresignedDomainUrlRequest *)request;

/**
 <p>Creates a URL for a specified UserProfile in a Domain. When accessed in a web browser, the user will be automatically signed in to Amazon SageMaker Studio, and granted access to all of the Apps and files associated with that Amazon Elastic File System (EFS). This operation can only be called when AuthMode equals IAM. </p>
 
 @param request A container for the necessary parameters to execute the CreatePresignedDomainUrl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceCreatePresignedDomainUrlRequest
 @see AWSSageMakerServiceCreatePresignedDomainUrlResponse
 */
- (void)createPresignedDomainUrl:(AWSSageMakerServiceCreatePresignedDomainUrlRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreatePresignedDomainUrlResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a URL that you can use to connect to the Jupyter server from a notebook instance. In the Amazon SageMaker console, when you choose <code>Open</code> next to a notebook instance, Amazon SageMaker opens a new tab showing the Jupyter server home page from the notebook instance. The console uses this API to get the URL and show the page.</p><p>IAM authorization policies for this API are also enforced for every HTTP request and WebSocket frame that attempts to connect to the notebook instance.For example, you can restrict access to this API and to the URL that it returns to a list of IP addresses that you specify. Use the <code>NotIpAddress</code> condition operator and the <code>aws:SourceIP</code> condition context key to specify the list of IP addresses that you want to have access to the notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/security_iam_id-based-policy-examples.html#nbi-ip-filter">Limit Access to a Notebook Instance by IP Address</a>.</p><note><p>The URL that you get from a call to <a>CreatePresignedNotebookInstanceUrl</a> is valid only for 5 minutes. If you try to use the URL after the 5-minute limit expires, you are directed to the AWS console sign-in page.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePresignedNotebookInstanceUrl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput`.
 
 @see AWSSageMakerServiceCreatePresignedNotebookInstanceUrlInput
 @see AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput
 */
- (AWSTask<AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput *> *)createPresignedNotebookInstanceUrl:(AWSSageMakerServiceCreatePresignedNotebookInstanceUrlInput *)request;

/**
 <p>Returns a URL that you can use to connect to the Jupyter server from a notebook instance. In the Amazon SageMaker console, when you choose <code>Open</code> next to a notebook instance, Amazon SageMaker opens a new tab showing the Jupyter server home page from the notebook instance. The console uses this API to get the URL and show the page.</p><p>IAM authorization policies for this API are also enforced for every HTTP request and WebSocket frame that attempts to connect to the notebook instance.For example, you can restrict access to this API and to the URL that it returns to a list of IP addresses that you specify. Use the <code>NotIpAddress</code> condition operator and the <code>aws:SourceIP</code> condition context key to specify the list of IP addresses that you want to have access to the notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/security_iam_id-based-policy-examples.html#nbi-ip-filter">Limit Access to a Notebook Instance by IP Address</a>.</p><note><p>The URL that you get from a call to <a>CreatePresignedNotebookInstanceUrl</a> is valid only for 5 minutes. If you try to use the URL after the 5-minute limit expires, you are directed to the AWS console sign-in page.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePresignedNotebookInstanceUrl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceCreatePresignedNotebookInstanceUrlInput
 @see AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput
 */
- (void)createPresignedNotebookInstanceUrl:(AWSSageMakerServiceCreatePresignedNotebookInstanceUrlInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a processing job.</p>
 
 @param request A container for the necessary parameters to execute the CreateProcessingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateProcessingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceCreateProcessingJobRequest
 @see AWSSageMakerServiceCreateProcessingJobResponse
 */
- (AWSTask<AWSSageMakerServiceCreateProcessingJobResponse *> *)createProcessingJob:(AWSSageMakerServiceCreateProcessingJobRequest *)request;

/**
 <p>Creates a processing job.</p>
 
 @param request A container for the necessary parameters to execute the CreateProcessingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceCreateProcessingJobRequest
 @see AWSSageMakerServiceCreateProcessingJobResponse
 */
- (void)createProcessingJob:(AWSSageMakerServiceCreateProcessingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateProcessingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a model training job. After training completes, Amazon SageMaker saves the resulting model artifacts to an Amazon S3 location that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts in a machine learning service other than Amazon SageMaker, provided that you know how to use them for inferences. </p><p>In the request body, you provide the following: </p><ul><li><p><code>AlgorithmSpecification</code> - Identifies the training algorithm to use. </p></li><li><p><code>HyperParameters</code> - Specify these algorithm-specific parameters to enable the estimation of model parameters during training. Hyperparameters can be tuned to optimize this learning process. For a list of hyperparameters for each training algorithm provided by Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>. </p></li><li><p><code>InputDataConfig</code> - Describes the training dataset and the Amazon S3, EFS, or FSx location where it is stored.</p></li><li><p><code>OutputDataConfig</code> - Identifies the Amazon S3 bucket where you want Amazon SageMaker to save the results of model training. </p><p/></li><li><p><code>ResourceConfig</code> - Identifies the resources, ML compute instances, and ML storage volumes to deploy for model training. In distributed training, you specify more than one instance. </p></li><li><p><code>EnableManagedSpotTraining</code> - Optimize the cost of training machine learning models by up to 80% by using Amazon EC2 Spot instances. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html">Managed Spot Training</a>. </p></li><li><p><code>RoleARN</code> - The Amazon Resource Number (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during model training. You must grant this role the necessary permissions so that Amazon SageMaker can successfully complete model training. </p></li><li><p><code>StoppingCondition</code> - To help cap training costs, use <code>MaxRuntimeInSeconds</code> to set a time limit for training. Use <code>MaxWaitTimeInSeconds</code> to specify how long you are willing to wait for a managed spot training job to complete. </p></li></ul><p> For more information about Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateTrainingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateTrainingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceCreateTrainingJobRequest
 @see AWSSageMakerServiceCreateTrainingJobResponse
 */
- (AWSTask<AWSSageMakerServiceCreateTrainingJobResponse *> *)createTrainingJob:(AWSSageMakerServiceCreateTrainingJobRequest *)request;

/**
 <p>Starts a model training job. After training completes, Amazon SageMaker saves the resulting model artifacts to an Amazon S3 location that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts in a machine learning service other than Amazon SageMaker, provided that you know how to use them for inferences. </p><p>In the request body, you provide the following: </p><ul><li><p><code>AlgorithmSpecification</code> - Identifies the training algorithm to use. </p></li><li><p><code>HyperParameters</code> - Specify these algorithm-specific parameters to enable the estimation of model parameters during training. Hyperparameters can be tuned to optimize this learning process. For a list of hyperparameters for each training algorithm provided by Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>. </p></li><li><p><code>InputDataConfig</code> - Describes the training dataset and the Amazon S3, EFS, or FSx location where it is stored.</p></li><li><p><code>OutputDataConfig</code> - Identifies the Amazon S3 bucket where you want Amazon SageMaker to save the results of model training. </p><p/></li><li><p><code>ResourceConfig</code> - Identifies the resources, ML compute instances, and ML storage volumes to deploy for model training. In distributed training, you specify more than one instance. </p></li><li><p><code>EnableManagedSpotTraining</code> - Optimize the cost of training machine learning models by up to 80% by using Amazon EC2 Spot instances. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html">Managed Spot Training</a>. </p></li><li><p><code>RoleARN</code> - The Amazon Resource Number (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during model training. You must grant this role the necessary permissions so that Amazon SageMaker can successfully complete model training. </p></li><li><p><code>StoppingCondition</code> - To help cap training costs, use <code>MaxRuntimeInSeconds</code> to set a time limit for training. Use <code>MaxWaitTimeInSeconds</code> to specify how long you are willing to wait for a managed spot training job to complete. </p></li></ul><p> For more information about Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateTrainingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceCreateTrainingJobRequest
 @see AWSSageMakerServiceCreateTrainingJobResponse
 */
- (void)createTrainingJob:(AWSSageMakerServiceCreateTrainingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateTrainingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a transform job. A transform job uses a trained model to get inferences on a dataset and saves these results to an Amazon S3 location that you specify.</p><p>To perform batch transformations, you create a transform job and use the data that you have readily available.</p><p>In the request body, you provide the following:</p><ul><li><p><code>TransformJobName</code> - Identifies the transform job. The name must be unique within an AWS Region in an AWS account.</p></li><li><p><code>ModelName</code> - Identifies the model to use. <code>ModelName</code> must be the name of an existing Amazon SageMaker model in the same AWS Region and AWS account. For information on creating a model, see <a>CreateModel</a>.</p></li><li><p><code>TransformInput</code> - Describes the dataset to be transformed and the Amazon S3 location where it is stored.</p></li><li><p><code>TransformOutput</code> - Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.</p></li><li><p><code>TransformResources</code> - Identifies the ML compute instances for the transform job.</p></li></ul><p>For more information about how batch transformation works, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html">Batch Transform</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransformJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateTransformJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceCreateTransformJobRequest
 @see AWSSageMakerServiceCreateTransformJobResponse
 */
- (AWSTask<AWSSageMakerServiceCreateTransformJobResponse *> *)createTransformJob:(AWSSageMakerServiceCreateTransformJobRequest *)request;

/**
 <p>Starts a transform job. A transform job uses a trained model to get inferences on a dataset and saves these results to an Amazon S3 location that you specify.</p><p>To perform batch transformations, you create a transform job and use the data that you have readily available.</p><p>In the request body, you provide the following:</p><ul><li><p><code>TransformJobName</code> - Identifies the transform job. The name must be unique within an AWS Region in an AWS account.</p></li><li><p><code>ModelName</code> - Identifies the model to use. <code>ModelName</code> must be the name of an existing Amazon SageMaker model in the same AWS Region and AWS account. For information on creating a model, see <a>CreateModel</a>.</p></li><li><p><code>TransformInput</code> - Describes the dataset to be transformed and the Amazon S3 location where it is stored.</p></li><li><p><code>TransformOutput</code> - Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.</p></li><li><p><code>TransformResources</code> - Identifies the ML compute instances for the transform job.</p></li></ul><p>For more information about how batch transformation works, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html">Batch Transform</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransformJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceCreateTransformJobRequest
 @see AWSSageMakerServiceCreateTransformJobResponse
 */
- (void)createTransformJob:(AWSSageMakerServiceCreateTransformJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateTransformJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon SageMaker <i>trial</i>. A trial is a set of steps called <i>trial components</i> that produce a machine learning model. A trial is part of a single Amazon SageMaker <i>experiment</i>.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial and then use the <a>Search</a> API to search for the tags.</p><p>To get a list of all your trials, call the <a>ListTrials</a> API. To view a trial's properties, call the <a>DescribeTrial</a> API. To create a trial component, call the <a>CreateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateTrialRequest
 @see AWSSageMakerServiceCreateTrialResponse
 */
- (AWSTask<AWSSageMakerServiceCreateTrialResponse *> *)createTrial:(AWSSageMakerServiceCreateTrialRequest *)request;

/**
 <p>Creates an Amazon SageMaker <i>trial</i>. A trial is a set of steps called <i>trial components</i> that produce a machine learning model. A trial is part of a single Amazon SageMaker <i>experiment</i>.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial and then use the <a>Search</a> API to search for the tags.</p><p>To get a list of all your trials, call the <a>ListTrials</a> API. To view a trial's properties, call the <a>DescribeTrial</a> API. To create a trial component, call the <a>CreateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateTrialRequest
 @see AWSSageMakerServiceCreateTrialResponse
 */
- (void)createTrial:(AWSSageMakerServiceCreateTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a <i>trial component</i>, which is a stage of a machine learning <i>trial</i>. A trial is composed of one or more trial components. A trial component can be used in multiple trials.</p><p>Trial components include pre-processing jobs, training jobs, and batch transform jobs.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial component and then use the <a>Search</a> API to search for the tags.</p><note><p><code>CreateTrialComponent</code> can only be invoked from within an Amazon SageMaker managed environment. This includes Amazon SageMaker training jobs, processing jobs, transform jobs, and Amazon SageMaker notebooks. A call to <code>CreateTrialComponent</code> from outside one of these environments results in an error.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateTrialComponentRequest
 @see AWSSageMakerServiceCreateTrialComponentResponse
 */
- (AWSTask<AWSSageMakerServiceCreateTrialComponentResponse *> *)createTrialComponent:(AWSSageMakerServiceCreateTrialComponentRequest *)request;

/**
 <p>Creates a <i>trial component</i>, which is a stage of a machine learning <i>trial</i>. A trial is composed of one or more trial components. A trial component can be used in multiple trials.</p><p>Trial components include pre-processing jobs, training jobs, and batch transform jobs.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial component and then use the <a>Search</a> API to search for the tags.</p><note><p><code>CreateTrialComponent</code> can only be invoked from within an Amazon SageMaker managed environment. This includes Amazon SageMaker training jobs, processing jobs, transform jobs, and Amazon SageMaker notebooks. A call to <code>CreateTrialComponent</code> from outside one of these environments results in an error.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateTrialComponentRequest
 @see AWSSageMakerServiceCreateTrialComponentResponse
 */
- (void)createTrialComponent:(AWSSageMakerServiceCreateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a user profile. A user profile represents a single user within a Domain, and is the main way to reference a "person" for the purposes of sharing, reporting and other user-oriented features. This entity is created during on-boarding to Amazon SageMaker Studio. If an administrator invites a person by email or imports them from SSO, a UserProfile is automatically created. </p><p> This entity is the primary holder of settings for an individual user and, through the domain, has a reference to the user's private Amazon Elastic File System (EFS) home directory. </p>
 
 @param request A container for the necessary parameters to execute the CreateUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateUserProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateUserProfileRequest
 @see AWSSageMakerServiceCreateUserProfileResponse
 */
- (AWSTask<AWSSageMakerServiceCreateUserProfileResponse *> *)createUserProfile:(AWSSageMakerServiceCreateUserProfileRequest *)request;

/**
 <p>Creates a user profile. A user profile represents a single user within a Domain, and is the main way to reference a "person" for the purposes of sharing, reporting and other user-oriented features. This entity is created during on-boarding to Amazon SageMaker Studio. If an administrator invites a person by email or imports them from SSO, a UserProfile is automatically created. </p><p> This entity is the primary holder of settings for an individual user and, through the domain, has a reference to the user's private Amazon Elastic File System (EFS) home directory. </p>
 
 @param request A container for the necessary parameters to execute the CreateUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`.
 
 @see AWSSageMakerServiceCreateUserProfileRequest
 @see AWSSageMakerServiceCreateUserProfileResponse
 */
- (void)createUserProfile:(AWSSageMakerServiceCreateUserProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateUserProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new work team for labeling your data. A work team is defined by one or more Amazon Cognito user pools. You must first create the user pools before you can create a work team.</p><p>You cannot create more than 25 work teams in an account and region.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceCreateWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateWorkteamRequest
 @see AWSSageMakerServiceCreateWorkteamResponse
 */
- (AWSTask<AWSSageMakerServiceCreateWorkteamResponse *> *)createWorkteam:(AWSSageMakerServiceCreateWorkteamRequest *)request;

/**
 <p>Creates a new work team for labeling your data. A work team is defined by one or more Amazon Cognito user pools. You must first create the user pools before you can create a work team.</p><p>You cannot create more than 25 work teams in an account and region.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceCreateWorkteamRequest
 @see AWSSageMakerServiceCreateWorkteamResponse
 */
- (void)createWorkteam:(AWSSageMakerServiceCreateWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceCreateWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified algorithm from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlgorithm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSageMakerServiceDeleteAlgorithmInput
 */
- (AWSTask *)deleteAlgorithm:(AWSSageMakerServiceDeleteAlgorithmInput *)request;

/**
 <p>Removes the specified algorithm from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlgorithm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDeleteAlgorithmInput
 */
- (void)deleteAlgorithm:(AWSSageMakerServiceDeleteAlgorithmInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Used to stop and delete an app.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteAppRequest
 */
- (AWSTask *)deleteApp:(AWSSageMakerServiceDeleteAppRequest *)request;

/**
 <p>Used to stop and delete an app.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteAppRequest
 */
- (void)deleteApp:(AWSSageMakerServiceDeleteAppRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Git repository from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSageMakerServiceDeleteCodeRepositoryInput
 */
- (AWSTask *)deleteCodeRepository:(AWSSageMakerServiceDeleteCodeRepositoryInput *)request;

/**
 <p>Deletes the specified Git repository from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDeleteCodeRepositoryInput
 */
- (void)deleteCodeRepository:(AWSSageMakerServiceDeleteCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Used to delete a domain. Use with caution. If <code>RetentionPolicy</code> is set to <code>Delete</code>, all of the members of the domain will lose access to their EFS volume, including data, notebooks, and other artifacts. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteDomainRequest
 */
- (AWSTask *)deleteDomain:(AWSSageMakerServiceDeleteDomainRequest *)request;

/**
 <p>Used to delete a domain. Use with caution. If <code>RetentionPolicy</code> is set to <code>Delete</code>, all of the members of the domain will lose access to their EFS volume, including data, notebooks, and other artifacts. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteDomainRequest
 */
- (void)deleteDomain:(AWSSageMakerServiceDeleteDomainRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an endpoint. Amazon SageMaker frees up all of the resources that were deployed when the endpoint was created. </p><p>Amazon SageMaker retires any custom KMS key grants associated with the endpoint, meaning you don't need to use the <a href="http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html">RevokeGrant</a> API call.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSageMakerServiceDeleteEndpointInput
 */
- (AWSTask *)deleteEndpoint:(AWSSageMakerServiceDeleteEndpointInput *)request;

/**
 <p>Deletes an endpoint. Amazon SageMaker frees up all of the resources that were deployed when the endpoint was created. </p><p>Amazon SageMaker retires any custom KMS key grants associated with the endpoint, meaning you don't need to use the <a href="http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html">RevokeGrant</a> API call.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDeleteEndpointInput
 */
- (void)deleteEndpoint:(AWSSageMakerServiceDeleteEndpointInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an endpoint configuration. The <code>DeleteEndpointConfig</code> API deletes only the specified configuration. It does not delete endpoints created using the configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpointConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSageMakerServiceDeleteEndpointConfigInput
 */
- (AWSTask *)deleteEndpointConfig:(AWSSageMakerServiceDeleteEndpointConfigInput *)request;

/**
 <p>Deletes an endpoint configuration. The <code>DeleteEndpointConfig</code> API deletes only the specified configuration. It does not delete endpoints created using the configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpointConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDeleteEndpointConfigInput
 */
- (void)deleteEndpointConfig:(AWSSageMakerServiceDeleteEndpointConfigInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon SageMaker experiment. All trials associated with the experiment must be deleted first. Use the <a>ListTrials</a> API to get a list of the trials associated with the experiment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDeleteExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteExperimentRequest
 @see AWSSageMakerServiceDeleteExperimentResponse
 */
- (AWSTask<AWSSageMakerServiceDeleteExperimentResponse *> *)deleteExperiment:(AWSSageMakerServiceDeleteExperimentRequest *)request;

/**
 <p>Deletes an Amazon SageMaker experiment. All trials associated with the experiment must be deleted first. Use the <a>ListTrials</a> API to get a list of the trials associated with the experiment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteExperimentRequest
 @see AWSSageMakerServiceDeleteExperimentResponse
 */
- (void)deleteExperiment:(AWSSageMakerServiceDeleteExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDeleteExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFlowDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDeleteFlowDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteFlowDefinitionRequest
 @see AWSSageMakerServiceDeleteFlowDefinitionResponse
 */
- (AWSTask<AWSSageMakerServiceDeleteFlowDefinitionResponse *> *)deleteFlowDefinition:(AWSSageMakerServiceDeleteFlowDefinitionRequest *)request;

/**
 <p>Deletes the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFlowDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteFlowDefinitionRequest
 @see AWSSageMakerServiceDeleteFlowDefinitionResponse
 */
- (void)deleteFlowDefinition:(AWSSageMakerServiceDeleteFlowDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDeleteFlowDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a model. The <code>DeleteModel</code> API deletes only the model entry that was created in Amazon SageMaker when you called the <a>CreateModel</a> API. It does not delete model artifacts, inference code, or the IAM role that you specified when creating the model. </p>
 
 @param request A container for the necessary parameters to execute the DeleteModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSageMakerServiceDeleteModelInput
 */
- (AWSTask *)deleteModel:(AWSSageMakerServiceDeleteModelInput *)request;

/**
 <p>Deletes a model. The <code>DeleteModel</code> API deletes only the model entry that was created in Amazon SageMaker when you called the <a>CreateModel</a> API. It does not delete model artifacts, inference code, or the IAM role that you specified when creating the model. </p>
 
 @param request A container for the necessary parameters to execute the DeleteModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDeleteModelInput
 */
- (void)deleteModel:(AWSSageMakerServiceDeleteModelInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a model package.</p><p>A model package is used to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p>
 
 @param request A container for the necessary parameters to execute the DeleteModelPackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSageMakerServiceDeleteModelPackageInput
 */
- (AWSTask *)deleteModelPackage:(AWSSageMakerServiceDeleteModelPackageInput *)request;

/**
 <p>Deletes a model package.</p><p>A model package is used to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p>
 
 @param request A container for the necessary parameters to execute the DeleteModelPackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDeleteModelPackageInput
 */
- (void)deleteModelPackage:(AWSSageMakerServiceDeleteModelPackageInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a monitoring schedule. Also stops the schedule had not already been stopped. This does not delete the job execution history of the monitoring schedule. </p>
 
 @param request A container for the necessary parameters to execute the DeleteMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteMonitoringScheduleRequest
 */
- (AWSTask *)deleteMonitoringSchedule:(AWSSageMakerServiceDeleteMonitoringScheduleRequest *)request;

/**
 <p>Deletes a monitoring schedule. Also stops the schedule had not already been stopped. This does not delete the job execution history of the monitoring schedule. </p>
 
 @param request A container for the necessary parameters to execute the DeleteMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteMonitoringScheduleRequest
 */
- (void)deleteMonitoringSchedule:(AWSSageMakerServiceDeleteMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an Amazon SageMaker notebook instance. Before you can delete a notebook instance, you must call the <code>StopNotebookInstance</code> API. </p><important><p>When you delete a notebook instance, you lose all of your data. Amazon SageMaker removes the ML compute instance, and deletes the ML storage volume and the network interface associated with the notebook instance. </p></important>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSageMakerServiceDeleteNotebookInstanceInput
 */
- (AWSTask *)deleteNotebookInstance:(AWSSageMakerServiceDeleteNotebookInstanceInput *)request;

/**
 <p> Deletes an Amazon SageMaker notebook instance. Before you can delete a notebook instance, you must call the <code>StopNotebookInstance</code> API. </p><important><p>When you delete a notebook instance, you lose all of your data. Amazon SageMaker removes the ML compute instance, and deletes the ML storage volume and the network interface associated with the notebook instance. </p></important>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDeleteNotebookInstanceInput
 */
- (void)deleteNotebookInstance:(AWSSageMakerServiceDeleteNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a notebook instance lifecycle configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSageMakerServiceDeleteNotebookInstanceLifecycleConfigInput
 */
- (AWSTask *)deleteNotebookInstanceLifecycleConfig:(AWSSageMakerServiceDeleteNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Deletes a notebook instance lifecycle configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDeleteNotebookInstanceLifecycleConfigInput
 */
- (void)deleteNotebookInstanceLifecycleConfig:(AWSSageMakerServiceDeleteNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified tags from an Amazon SageMaker resource.</p><p>To list a resource's tags, use the <code>ListTags</code> API. </p><note><p>When you call this API to delete tags from a hyperparameter tuning job, the deleted tags are not removed from training jobs that the hyperparameter tuning job launched before you called this API.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDeleteTagsOutput`.
 
 @see AWSSageMakerServiceDeleteTagsInput
 @see AWSSageMakerServiceDeleteTagsOutput
 */
- (AWSTask<AWSSageMakerServiceDeleteTagsOutput *> *)deleteTags:(AWSSageMakerServiceDeleteTagsInput *)request;

/**
 <p>Deletes the specified tags from an Amazon SageMaker resource.</p><p>To list a resource's tags, use the <code>ListTags</code> API. </p><note><p>When you call this API to delete tags from a hyperparameter tuning job, the deleted tags are not removed from training jobs that the hyperparameter tuning job launched before you called this API.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDeleteTagsInput
 @see AWSSageMakerServiceDeleteTagsOutput
 */
- (void)deleteTags:(AWSSageMakerServiceDeleteTagsInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDeleteTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified trial. All trial components that make up the trial must be deleted first. Use the <a>DescribeTrialComponent</a> API to get the list of trial components.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDeleteTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteTrialRequest
 @see AWSSageMakerServiceDeleteTrialResponse
 */
- (AWSTask<AWSSageMakerServiceDeleteTrialResponse *> *)deleteTrial:(AWSSageMakerServiceDeleteTrialRequest *)request;

/**
 <p>Deletes the specified trial. All trial components that make up the trial must be deleted first. Use the <a>DescribeTrialComponent</a> API to get the list of trial components.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteTrialRequest
 @see AWSSageMakerServiceDeleteTrialResponse
 */
- (void)deleteTrial:(AWSSageMakerServiceDeleteTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDeleteTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified trial component. A trial component must be disassociated from all trials before the trial component can be deleted. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDeleteTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteTrialComponentRequest
 @see AWSSageMakerServiceDeleteTrialComponentResponse
 */
- (AWSTask<AWSSageMakerServiceDeleteTrialComponentResponse *> *)deleteTrialComponent:(AWSSageMakerServiceDeleteTrialComponentRequest *)request;

/**
 <p>Deletes the specified trial component. A trial component must be disassociated from all trials before the trial component can be deleted. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteTrialComponentRequest
 @see AWSSageMakerServiceDeleteTrialComponentResponse
 */
- (void)deleteTrialComponent:(AWSSageMakerServiceDeleteTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDeleteTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user profile.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteUserProfileRequest
 */
- (AWSTask *)deleteUserProfile:(AWSSageMakerServiceDeleteUserProfileRequest *)request;

/**
 <p>Deletes a user profile.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDeleteUserProfileRequest
 */
- (void)deleteUserProfile:(AWSSageMakerServiceDeleteUserProfileRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing work team. This operation can't be undone.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDeleteWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceDeleteWorkteamRequest
 @see AWSSageMakerServiceDeleteWorkteamResponse
 */
- (AWSTask<AWSSageMakerServiceDeleteWorkteamResponse *> *)deleteWorkteam:(AWSSageMakerServiceDeleteWorkteamRequest *)request;

/**
 <p>Deletes an existing work team. This operation can't be undone.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceDeleteWorkteamRequest
 @see AWSSageMakerServiceDeleteWorkteamResponse
 */
- (void)deleteWorkteam:(AWSSageMakerServiceDeleteWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDeleteWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the specified algorithm that is in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlgorithm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeAlgorithmOutput`.
 
 @see AWSSageMakerServiceDescribeAlgorithmInput
 @see AWSSageMakerServiceDescribeAlgorithmOutput
 */
- (AWSTask<AWSSageMakerServiceDescribeAlgorithmOutput *> *)describeAlgorithm:(AWSSageMakerServiceDescribeAlgorithmInput *)request;

/**
 <p>Returns a description of the specified algorithm that is in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlgorithm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDescribeAlgorithmInput
 @see AWSSageMakerServiceDescribeAlgorithmOutput
 */
- (void)describeAlgorithm:(AWSSageMakerServiceDescribeAlgorithmInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeAlgorithmOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the app.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeAppRequest
 @see AWSSageMakerServiceDescribeAppResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeAppResponse *> *)describeApp:(AWSSageMakerServiceDescribeAppRequest *)request;

/**
 <p>Describes the app.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeAppRequest
 @see AWSSageMakerServiceDescribeAppResponse
 */
- (void)describeApp:(AWSSageMakerServiceDescribeAppRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about an Amazon SageMaker job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeAutoMLJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeAutoMLJobRequest
 @see AWSSageMakerServiceDescribeAutoMLJobResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeAutoMLJobResponse *> *)describeAutoMLJob:(AWSSageMakerServiceDescribeAutoMLJobRequest *)request;

/**
 <p>Returns information about an Amazon SageMaker job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeAutoMLJobRequest
 @see AWSSageMakerServiceDescribeAutoMLJobResponse
 */
- (void)describeAutoMLJob:(AWSSageMakerServiceDescribeAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeAutoMLJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets details about the specified Git repository.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeCodeRepositoryOutput`.
 
 @see AWSSageMakerServiceDescribeCodeRepositoryInput
 @see AWSSageMakerServiceDescribeCodeRepositoryOutput
 */
- (AWSTask<AWSSageMakerServiceDescribeCodeRepositoryOutput *> *)describeCodeRepository:(AWSSageMakerServiceDescribeCodeRepositoryInput *)request;

/**
 <p>Gets details about the specified Git repository.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDescribeCodeRepositoryInput
 @see AWSSageMakerServiceDescribeCodeRepositoryOutput
 */
- (void)describeCodeRepository:(AWSSageMakerServiceDescribeCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeCodeRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a model compilation job.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCompilationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeCompilationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeCompilationJobRequest
 @see AWSSageMakerServiceDescribeCompilationJobResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeCompilationJobResponse *> *)describeCompilationJob:(AWSSageMakerServiceDescribeCompilationJobRequest *)request;

/**
 <p>Returns information about a model compilation job.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCompilationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeCompilationJobRequest
 @see AWSSageMakerServiceDescribeCompilationJobResponse
 */
- (void)describeCompilationJob:(AWSSageMakerServiceDescribeCompilationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeCompilationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The desciption of the domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeDomainRequest
 @see AWSSageMakerServiceDescribeDomainResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeDomainResponse *> *)describeDomain:(AWSSageMakerServiceDescribeDomainRequest *)request;

/**
 <p>The desciption of the domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeDomainRequest
 @see AWSSageMakerServiceDescribeDomainResponse
 */
- (void)describeDomain:(AWSSageMakerServiceDescribeDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeEndpointOutput`.
 
 @see AWSSageMakerServiceDescribeEndpointInput
 @see AWSSageMakerServiceDescribeEndpointOutput
 */
- (AWSTask<AWSSageMakerServiceDescribeEndpointOutput *> *)describeEndpoint:(AWSSageMakerServiceDescribeEndpointInput *)request;

/**
 <p>Returns the description of an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDescribeEndpointInput
 @see AWSSageMakerServiceDescribeEndpointOutput
 */
- (void)describeEndpoint:(AWSSageMakerServiceDescribeEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of an endpoint configuration created using the <code>CreateEndpointConfig</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpointConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeEndpointConfigOutput`.
 
 @see AWSSageMakerServiceDescribeEndpointConfigInput
 @see AWSSageMakerServiceDescribeEndpointConfigOutput
 */
- (AWSTask<AWSSageMakerServiceDescribeEndpointConfigOutput *> *)describeEndpointConfig:(AWSSageMakerServiceDescribeEndpointConfigInput *)request;

/**
 <p>Returns the description of an endpoint configuration created using the <code>CreateEndpointConfig</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpointConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDescribeEndpointConfigInput
 @see AWSSageMakerServiceDescribeEndpointConfigOutput
 */
- (void)describeEndpointConfig:(AWSSageMakerServiceDescribeEndpointConfigInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeEndpointConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of an experiment's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeExperimentRequest
 @see AWSSageMakerServiceDescribeExperimentResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeExperimentResponse *> *)describeExperiment:(AWSSageMakerServiceDescribeExperimentRequest *)request;

/**
 <p>Provides a list of an experiment's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeExperimentRequest
 @see AWSSageMakerServiceDescribeExperimentResponse
 */
- (void)describeExperiment:(AWSSageMakerServiceDescribeExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFlowDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeFlowDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeFlowDefinitionRequest
 @see AWSSageMakerServiceDescribeFlowDefinitionResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeFlowDefinitionResponse *> *)describeFlowDefinition:(AWSSageMakerServiceDescribeFlowDefinitionRequest *)request;

/**
 <p>Returns information about the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFlowDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeFlowDefinitionRequest
 @see AWSSageMakerServiceDescribeFlowDefinitionResponse
 */
- (void)describeFlowDefinition:(AWSSageMakerServiceDescribeFlowDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeFlowDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the requested human task user interface.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHumanTaskUi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeHumanTaskUiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeHumanTaskUiRequest
 @see AWSSageMakerServiceDescribeHumanTaskUiResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeHumanTaskUiResponse *> *)describeHumanTaskUi:(AWSSageMakerServiceDescribeHumanTaskUiRequest *)request;

/**
 <p>Returns information about the requested human task user interface.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHumanTaskUi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeHumanTaskUiRequest
 @see AWSSageMakerServiceDescribeHumanTaskUiResponse
 */
- (void)describeHumanTaskUi:(AWSSageMakerServiceDescribeHumanTaskUiRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeHumanTaskUiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a description of a hyperparameter tuning job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeHyperParameterTuningJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeHyperParameterTuningJobRequest
 @see AWSSageMakerServiceDescribeHyperParameterTuningJobResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeHyperParameterTuningJobResponse *> *)describeHyperParameterTuningJob:(AWSSageMakerServiceDescribeHyperParameterTuningJobRequest *)request;

/**
 <p>Gets a description of a hyperparameter tuning job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeHyperParameterTuningJobRequest
 @see AWSSageMakerServiceDescribeHyperParameterTuningJobResponse
 */
- (void)describeHyperParameterTuningJob:(AWSSageMakerServiceDescribeHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeHyperParameterTuningJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a labeling job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLabelingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeLabelingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeLabelingJobRequest
 @see AWSSageMakerServiceDescribeLabelingJobResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeLabelingJobResponse *> *)describeLabelingJob:(AWSSageMakerServiceDescribeLabelingJobRequest *)request;

/**
 <p>Gets information about a labeling job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLabelingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeLabelingJobRequest
 @see AWSSageMakerServiceDescribeLabelingJobResponse
 */
- (void)describeLabelingJob:(AWSSageMakerServiceDescribeLabelingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeLabelingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a model that you created using the <code>CreateModel</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeModelOutput`.
 
 @see AWSSageMakerServiceDescribeModelInput
 @see AWSSageMakerServiceDescribeModelOutput
 */
- (AWSTask<AWSSageMakerServiceDescribeModelOutput *> *)describeModel:(AWSSageMakerServiceDescribeModelInput *)request;

/**
 <p>Describes a model that you created using the <code>CreateModel</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDescribeModelInput
 @see AWSSageMakerServiceDescribeModelOutput
 */
- (void)describeModel:(AWSSageMakerServiceDescribeModelInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeModelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the specified model package, which is used to create Amazon SageMaker models or list them on AWS Marketplace.</p><p>To create models in Amazon SageMaker, buyers can subscribe to model packages listed on AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModelPackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeModelPackageOutput`.
 
 @see AWSSageMakerServiceDescribeModelPackageInput
 @see AWSSageMakerServiceDescribeModelPackageOutput
 */
- (AWSTask<AWSSageMakerServiceDescribeModelPackageOutput *> *)describeModelPackage:(AWSSageMakerServiceDescribeModelPackageInput *)request;

/**
 <p>Returns a description of the specified model package, which is used to create Amazon SageMaker models or list them on AWS Marketplace.</p><p>To create models in Amazon SageMaker, buyers can subscribe to model packages listed on AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModelPackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDescribeModelPackageInput
 @see AWSSageMakerServiceDescribeModelPackageOutput
 */
- (void)describeModelPackage:(AWSSageMakerServiceDescribeModelPackageInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeModelPackageOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the schedule for a monitoring job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeMonitoringScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeMonitoringScheduleRequest
 @see AWSSageMakerServiceDescribeMonitoringScheduleResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeMonitoringScheduleResponse *> *)describeMonitoringSchedule:(AWSSageMakerServiceDescribeMonitoringScheduleRequest *)request;

/**
 <p>Describes the schedule for a monitoring job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeMonitoringScheduleRequest
 @see AWSSageMakerServiceDescribeMonitoringScheduleResponse
 */
- (void)describeMonitoringSchedule:(AWSSageMakerServiceDescribeMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeMonitoringScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a notebook instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeNotebookInstanceOutput`.
 
 @see AWSSageMakerServiceDescribeNotebookInstanceInput
 @see AWSSageMakerServiceDescribeNotebookInstanceOutput
 */
- (AWSTask<AWSSageMakerServiceDescribeNotebookInstanceOutput *> *)describeNotebookInstance:(AWSSageMakerServiceDescribeNotebookInstanceInput *)request;

/**
 <p>Returns information about a notebook instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDescribeNotebookInstanceInput
 @see AWSSageMakerServiceDescribeNotebookInstanceOutput
 */
- (void)describeNotebookInstance:(AWSSageMakerServiceDescribeNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeNotebookInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of a notebook instance lifecycle configuration.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput`.
 
 @see AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigInput
 @see AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput
 */
- (AWSTask<AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput *> *)describeNotebookInstanceLifecycleConfig:(AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Returns a description of a notebook instance lifecycle configuration.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigInput
 @see AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput
 */
- (void)describeNotebookInstanceLifecycleConfig:(AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of a processing job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProcessingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeProcessingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeProcessingJobRequest
 @see AWSSageMakerServiceDescribeProcessingJobResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeProcessingJobResponse *> *)describeProcessingJob:(AWSSageMakerServiceDescribeProcessingJobRequest *)request;

/**
 <p>Returns a description of a processing job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProcessingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeProcessingJobRequest
 @see AWSSageMakerServiceDescribeProcessingJobResponse
 */
- (void)describeProcessingJob:(AWSSageMakerServiceDescribeProcessingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeProcessingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a work team provided by a vendor. It returns details about the subscription with a vendor in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubscribedWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeSubscribedWorkteamResponse`.
 
 @see AWSSageMakerServiceDescribeSubscribedWorkteamRequest
 @see AWSSageMakerServiceDescribeSubscribedWorkteamResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeSubscribedWorkteamResponse *> *)describeSubscribedWorkteam:(AWSSageMakerServiceDescribeSubscribedWorkteamRequest *)request;

/**
 <p>Gets information about a work team provided by a vendor. It returns details about the subscription with a vendor in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubscribedWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDescribeSubscribedWorkteamRequest
 @see AWSSageMakerServiceDescribeSubscribedWorkteamResponse
 */
- (void)describeSubscribedWorkteam:(AWSSageMakerServiceDescribeSubscribedWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeSubscribedWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a training job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrainingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeTrainingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeTrainingJobRequest
 @see AWSSageMakerServiceDescribeTrainingJobResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeTrainingJobResponse *> *)describeTrainingJob:(AWSSageMakerServiceDescribeTrainingJobRequest *)request;

/**
 <p>Returns information about a training job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrainingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeTrainingJobRequest
 @see AWSSageMakerServiceDescribeTrainingJobResponse
 */
- (void)describeTrainingJob:(AWSSageMakerServiceDescribeTrainingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeTrainingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a transform job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransformJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeTransformJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeTransformJobRequest
 @see AWSSageMakerServiceDescribeTransformJobResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeTransformJobResponse *> *)describeTransformJob:(AWSSageMakerServiceDescribeTransformJobRequest *)request;

/**
 <p>Returns information about a transform job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransformJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeTransformJobRequest
 @see AWSSageMakerServiceDescribeTransformJobResponse
 */
- (void)describeTransformJob:(AWSSageMakerServiceDescribeTransformJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeTransformJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of a trial's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeTrialRequest
 @see AWSSageMakerServiceDescribeTrialResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeTrialResponse *> *)describeTrial:(AWSSageMakerServiceDescribeTrialRequest *)request;

/**
 <p>Provides a list of a trial's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeTrialRequest
 @see AWSSageMakerServiceDescribeTrialResponse
 */
- (void)describeTrial:(AWSSageMakerServiceDescribeTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of a trials component's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeTrialComponentRequest
 @see AWSSageMakerServiceDescribeTrialComponentResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeTrialComponentResponse *> *)describeTrialComponent:(AWSSageMakerServiceDescribeTrialComponentRequest *)request;

/**
 <p>Provides a list of a trials component's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeTrialComponentRequest
 @see AWSSageMakerServiceDescribeTrialComponentResponse
 */
- (void)describeTrialComponent:(AWSSageMakerServiceDescribeTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the user profile.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeUserProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeUserProfileRequest
 @see AWSSageMakerServiceDescribeUserProfileResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeUserProfileResponse *> *)describeUserProfile:(AWSSageMakerServiceDescribeUserProfileRequest *)request;

/**
 <p>Describes the user profile.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDescribeUserProfileRequest
 @see AWSSageMakerServiceDescribeUserProfileResponse
 */
- (void)describeUserProfile:(AWSSageMakerServiceDescribeUserProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeUserProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists private workforce information, including workforce name, Amazon Resource Name (ARN), and, if applicable, allowed IP address ranges (<a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>). Allowable IP address ranges are the IP addresses that workers can use to access tasks. </p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the DescribeWorkforce service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeWorkforceResponse`.
 
 @see AWSSageMakerServiceDescribeWorkforceRequest
 @see AWSSageMakerServiceDescribeWorkforceResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeWorkforceResponse *> *)describeWorkforce:(AWSSageMakerServiceDescribeWorkforceRequest *)request;

/**
 <p>Lists private workforce information, including workforce name, Amazon Resource Name (ARN), and, if applicable, allowed IP address ranges (<a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>). Allowable IP address ranges are the IP addresses that workers can use to access tasks. </p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the DescribeWorkforce service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDescribeWorkforceRequest
 @see AWSSageMakerServiceDescribeWorkforceResponse
 */
- (void)describeWorkforce:(AWSSageMakerServiceDescribeWorkforceRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeWorkforceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a specific work team. You can see information such as the create date, the last updated date, membership information, and the work team's Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the DescribeWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDescribeWorkteamResponse`.
 
 @see AWSSageMakerServiceDescribeWorkteamRequest
 @see AWSSageMakerServiceDescribeWorkteamResponse
 */
- (AWSTask<AWSSageMakerServiceDescribeWorkteamResponse *> *)describeWorkteam:(AWSSageMakerServiceDescribeWorkteamRequest *)request;

/**
 <p>Gets information about a specific work team. You can see information such as the create date, the last updated date, membership information, and the work team's Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the DescribeWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceDescribeWorkteamRequest
 @see AWSSageMakerServiceDescribeWorkteamResponse
 */
- (void)describeWorkteam:(AWSSageMakerServiceDescribeWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDescribeWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a trial component from a trial. This doesn't effect other trials the component is associated with. Before you can delete a component, you must disassociate the component from all trials it is associated with. To associate a trial component with a trial, call the <a>AssociateTrialComponent</a> API.</p><p>To get a list of the trials a component is associated with, use the <a>Search</a> API. Specify <code>ExperimentTrialComponent</code> for the <code>Resource</code> parameter. The list appears in the response under <code>Results.TrialComponent.Parents</code>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceDisassociateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDisassociateTrialComponentRequest
 @see AWSSageMakerServiceDisassociateTrialComponentResponse
 */
- (AWSTask<AWSSageMakerServiceDisassociateTrialComponentResponse *> *)disassociateTrialComponent:(AWSSageMakerServiceDisassociateTrialComponentRequest *)request;

/**
 <p>Disassociates a trial component from a trial. This doesn't effect other trials the component is associated with. Before you can delete a component, you must disassociate the component from all trials it is associated with. To associate a trial component with a trial, call the <a>AssociateTrialComponent</a> API.</p><p>To get a list of the trials a component is associated with, use the <a>Search</a> API. Specify <code>ExperimentTrialComponent</code> for the <code>Resource</code> parameter. The list appears in the response under <code>Results.TrialComponent.Parents</code>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceDisassociateTrialComponentRequest
 @see AWSSageMakerServiceDisassociateTrialComponentResponse
 */
- (void)disassociateTrialComponent:(AWSSageMakerServiceDisassociateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceDisassociateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>An auto-complete API for the search functionality in the Amazon SageMaker console. It returns suggestions of possible matches for the property name to use in <code>Search</code> queries. Provides suggestions for <code>HyperParameters</code>, <code>Tags</code>, and <code>Metrics</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSearchSuggestions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceGetSearchSuggestionsResponse`.
 
 @see AWSSageMakerServiceGetSearchSuggestionsRequest
 @see AWSSageMakerServiceGetSearchSuggestionsResponse
 */
- (AWSTask<AWSSageMakerServiceGetSearchSuggestionsResponse *> *)getSearchSuggestions:(AWSSageMakerServiceGetSearchSuggestionsRequest *)request;

/**
 <p>An auto-complete API for the search functionality in the Amazon SageMaker console. It returns suggestions of possible matches for the property name to use in <code>Search</code> queries. Provides suggestions for <code>HyperParameters</code>, <code>Tags</code>, and <code>Metrics</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSearchSuggestions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceGetSearchSuggestionsRequest
 @see AWSSageMakerServiceGetSearchSuggestionsResponse
 */
- (void)getSearchSuggestions:(AWSSageMakerServiceGetSearchSuggestionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceGetSearchSuggestionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the machine learning algorithms that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListAlgorithms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListAlgorithmsOutput`.
 
 @see AWSSageMakerServiceListAlgorithmsInput
 @see AWSSageMakerServiceListAlgorithmsOutput
 */
- (AWSTask<AWSSageMakerServiceListAlgorithmsOutput *> *)listAlgorithms:(AWSSageMakerServiceListAlgorithmsInput *)request;

/**
 <p>Lists the machine learning algorithms that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListAlgorithms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListAlgorithmsInput
 @see AWSSageMakerServiceListAlgorithmsOutput
 */
- (void)listAlgorithms:(AWSSageMakerServiceListAlgorithmsInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListAlgorithmsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists apps.</p>
 
 @param request A container for the necessary parameters to execute the ListApps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListAppsResponse`.
 
 @see AWSSageMakerServiceListAppsRequest
 @see AWSSageMakerServiceListAppsResponse
 */
- (AWSTask<AWSSageMakerServiceListAppsResponse *> *)listApps:(AWSSageMakerServiceListAppsRequest *)request;

/**
 <p>Lists apps.</p>
 
 @param request A container for the necessary parameters to execute the ListApps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListAppsRequest
 @see AWSSageMakerServiceListAppsResponse
 */
- (void)listApps:(AWSSageMakerServiceListAppsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListAppsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Request a list of jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListAutoMLJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListAutoMLJobsResponse`.
 
 @see AWSSageMakerServiceListAutoMLJobsRequest
 @see AWSSageMakerServiceListAutoMLJobsResponse
 */
- (AWSTask<AWSSageMakerServiceListAutoMLJobsResponse *> *)listAutoMLJobs:(AWSSageMakerServiceListAutoMLJobsRequest *)request;

/**
 <p>Request a list of jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListAutoMLJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListAutoMLJobsRequest
 @see AWSSageMakerServiceListAutoMLJobsResponse
 */
- (void)listAutoMLJobs:(AWSSageMakerServiceListAutoMLJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListAutoMLJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the Candidates created for the job.</p>
 
 @param request A container for the necessary parameters to execute the ListCandidatesForAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListCandidatesForAutoMLJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceListCandidatesForAutoMLJobRequest
 @see AWSSageMakerServiceListCandidatesForAutoMLJobResponse
 */
- (AWSTask<AWSSageMakerServiceListCandidatesForAutoMLJobResponse *> *)listCandidatesForAutoMLJob:(AWSSageMakerServiceListCandidatesForAutoMLJobRequest *)request;

/**
 <p>List the Candidates created for the job.</p>
 
 @param request A container for the necessary parameters to execute the ListCandidatesForAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceListCandidatesForAutoMLJobRequest
 @see AWSSageMakerServiceListCandidatesForAutoMLJobResponse
 */
- (void)listCandidatesForAutoMLJob:(AWSSageMakerServiceListCandidatesForAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListCandidatesForAutoMLJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the Git repositories in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListCodeRepositories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListCodeRepositoriesOutput`.
 
 @see AWSSageMakerServiceListCodeRepositoriesInput
 @see AWSSageMakerServiceListCodeRepositoriesOutput
 */
- (AWSTask<AWSSageMakerServiceListCodeRepositoriesOutput *> *)listCodeRepositories:(AWSSageMakerServiceListCodeRepositoriesInput *)request;

/**
 <p>Gets a list of the Git repositories in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListCodeRepositories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListCodeRepositoriesInput
 @see AWSSageMakerServiceListCodeRepositoriesOutput
 */
- (void)listCodeRepositories:(AWSSageMakerServiceListCodeRepositoriesInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListCodeRepositoriesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists model compilation jobs that satisfy various filters.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about a particular model compilation job you have created, use <a>DescribeCompilationJob</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListCompilationJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListCompilationJobsResponse`.
 
 @see AWSSageMakerServiceListCompilationJobsRequest
 @see AWSSageMakerServiceListCompilationJobsResponse
 */
- (AWSTask<AWSSageMakerServiceListCompilationJobsResponse *> *)listCompilationJobs:(AWSSageMakerServiceListCompilationJobsRequest *)request;

/**
 <p>Lists model compilation jobs that satisfy various filters.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about a particular model compilation job you have created, use <a>DescribeCompilationJob</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListCompilationJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListCompilationJobsRequest
 @see AWSSageMakerServiceListCompilationJobsResponse
 */
- (void)listCompilationJobs:(AWSSageMakerServiceListCompilationJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListCompilationJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the domains.</p>
 
 @param request A container for the necessary parameters to execute the ListDomains service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListDomainsResponse`.
 
 @see AWSSageMakerServiceListDomainsRequest
 @see AWSSageMakerServiceListDomainsResponse
 */
- (AWSTask<AWSSageMakerServiceListDomainsResponse *> *)listDomains:(AWSSageMakerServiceListDomainsRequest *)request;

/**
 <p>Lists the domains.</p>
 
 @param request A container for the necessary parameters to execute the ListDomains service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListDomainsRequest
 @see AWSSageMakerServiceListDomainsResponse
 */
- (void)listDomains:(AWSSageMakerServiceListDomainsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListDomainsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists endpoint configurations.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpointConfigs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListEndpointConfigsOutput`.
 
 @see AWSSageMakerServiceListEndpointConfigsInput
 @see AWSSageMakerServiceListEndpointConfigsOutput
 */
- (AWSTask<AWSSageMakerServiceListEndpointConfigsOutput *> *)listEndpointConfigs:(AWSSageMakerServiceListEndpointConfigsInput *)request;

/**
 <p>Lists endpoint configurations.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpointConfigs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListEndpointConfigsInput
 @see AWSSageMakerServiceListEndpointConfigsOutput
 */
- (void)listEndpointConfigs:(AWSSageMakerServiceListEndpointConfigsInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListEndpointConfigsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists endpoints.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListEndpointsOutput`.
 
 @see AWSSageMakerServiceListEndpointsInput
 @see AWSSageMakerServiceListEndpointsOutput
 */
- (AWSTask<AWSSageMakerServiceListEndpointsOutput *> *)listEndpoints:(AWSSageMakerServiceListEndpointsInput *)request;

/**
 <p>Lists endpoints.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListEndpointsInput
 @see AWSSageMakerServiceListEndpointsOutput
 */
- (void)listEndpoints:(AWSSageMakerServiceListEndpointsInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListEndpointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the experiments in your account. The list can be filtered to show only experiments that were created in a specific time range. The list can be sorted by experiment name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListExperiments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListExperimentsResponse`.
 
 @see AWSSageMakerServiceListExperimentsRequest
 @see AWSSageMakerServiceListExperimentsResponse
 */
- (AWSTask<AWSSageMakerServiceListExperimentsResponse *> *)listExperiments:(AWSSageMakerServiceListExperimentsRequest *)request;

/**
 <p>Lists all the experiments in your account. The list can be filtered to show only experiments that were created in a specific time range. The list can be sorted by experiment name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListExperiments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListExperimentsRequest
 @see AWSSageMakerServiceListExperimentsResponse
 */
- (void)listExperiments:(AWSSageMakerServiceListExperimentsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListExperimentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the flow definitions in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListFlowDefinitions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListFlowDefinitionsResponse`.
 
 @see AWSSageMakerServiceListFlowDefinitionsRequest
 @see AWSSageMakerServiceListFlowDefinitionsResponse
 */
- (AWSTask<AWSSageMakerServiceListFlowDefinitionsResponse *> *)listFlowDefinitions:(AWSSageMakerServiceListFlowDefinitionsRequest *)request;

/**
 <p>Returns information about the flow definitions in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListFlowDefinitions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListFlowDefinitionsRequest
 @see AWSSageMakerServiceListFlowDefinitionsResponse
 */
- (void)listFlowDefinitions:(AWSSageMakerServiceListFlowDefinitionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListFlowDefinitionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the human task user interfaces in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHumanTaskUis service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListHumanTaskUisResponse`.
 
 @see AWSSageMakerServiceListHumanTaskUisRequest
 @see AWSSageMakerServiceListHumanTaskUisResponse
 */
- (AWSTask<AWSSageMakerServiceListHumanTaskUisResponse *> *)listHumanTaskUis:(AWSSageMakerServiceListHumanTaskUisRequest *)request;

/**
 <p>Returns information about the human task user interfaces in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHumanTaskUis service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListHumanTaskUisRequest
 @see AWSSageMakerServiceListHumanTaskUisResponse
 */
- (void)listHumanTaskUis:(AWSSageMakerServiceListHumanTaskUisRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListHumanTaskUisResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of <a>HyperParameterTuningJobSummary</a> objects that describe the hyperparameter tuning jobs launched in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHyperParameterTuningJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListHyperParameterTuningJobsResponse`.
 
 @see AWSSageMakerServiceListHyperParameterTuningJobsRequest
 @see AWSSageMakerServiceListHyperParameterTuningJobsResponse
 */
- (AWSTask<AWSSageMakerServiceListHyperParameterTuningJobsResponse *> *)listHyperParameterTuningJobs:(AWSSageMakerServiceListHyperParameterTuningJobsRequest *)request;

/**
 <p>Gets a list of <a>HyperParameterTuningJobSummary</a> objects that describe the hyperparameter tuning jobs launched in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHyperParameterTuningJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListHyperParameterTuningJobsRequest
 @see AWSSageMakerServiceListHyperParameterTuningJobsResponse
 */
- (void)listHyperParameterTuningJobs:(AWSSageMakerServiceListHyperParameterTuningJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListHyperParameterTuningJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of labeling jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListLabelingJobsResponse`.
 
 @see AWSSageMakerServiceListLabelingJobsRequest
 @see AWSSageMakerServiceListLabelingJobsResponse
 */
- (AWSTask<AWSSageMakerServiceListLabelingJobsResponse *> *)listLabelingJobs:(AWSSageMakerServiceListLabelingJobsRequest *)request;

/**
 <p>Gets a list of labeling jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListLabelingJobsRequest
 @see AWSSageMakerServiceListLabelingJobsResponse
 */
- (void)listLabelingJobs:(AWSSageMakerServiceListLabelingJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListLabelingJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of labeling jobs assigned to a specified work team.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobsForWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListLabelingJobsForWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceListLabelingJobsForWorkteamRequest
 @see AWSSageMakerServiceListLabelingJobsForWorkteamResponse
 */
- (AWSTask<AWSSageMakerServiceListLabelingJobsForWorkteamResponse *> *)listLabelingJobsForWorkteam:(AWSSageMakerServiceListLabelingJobsForWorkteamRequest *)request;

/**
 <p>Gets a list of labeling jobs assigned to a specified work team.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobsForWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceListLabelingJobsForWorkteamRequest
 @see AWSSageMakerServiceListLabelingJobsForWorkteamResponse
 */
- (void)listLabelingJobsForWorkteam:(AWSSageMakerServiceListLabelingJobsForWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListLabelingJobsForWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the model packages that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListModelPackages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListModelPackagesOutput`.
 
 @see AWSSageMakerServiceListModelPackagesInput
 @see AWSSageMakerServiceListModelPackagesOutput
 */
- (AWSTask<AWSSageMakerServiceListModelPackagesOutput *> *)listModelPackages:(AWSSageMakerServiceListModelPackagesInput *)request;

/**
 <p>Lists the model packages that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListModelPackages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListModelPackagesInput
 @see AWSSageMakerServiceListModelPackagesOutput
 */
- (void)listModelPackages:(AWSSageMakerServiceListModelPackagesInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListModelPackagesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists models created with the <a>CreateModel</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListModelsOutput`.
 
 @see AWSSageMakerServiceListModelsInput
 @see AWSSageMakerServiceListModelsOutput
 */
- (AWSTask<AWSSageMakerServiceListModelsOutput *> *)listModels:(AWSSageMakerServiceListModelsInput *)request;

/**
 <p>Lists models created with the <a>CreateModel</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListModelsInput
 @see AWSSageMakerServiceListModelsOutput
 */
- (void)listModels:(AWSSageMakerServiceListModelsInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListModelsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns list of all monitoring job executions.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListMonitoringExecutionsResponse`.
 
 @see AWSSageMakerServiceListMonitoringExecutionsRequest
 @see AWSSageMakerServiceListMonitoringExecutionsResponse
 */
- (AWSTask<AWSSageMakerServiceListMonitoringExecutionsResponse *> *)listMonitoringExecutions:(AWSSageMakerServiceListMonitoringExecutionsRequest *)request;

/**
 <p>Returns list of all monitoring job executions.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListMonitoringExecutionsRequest
 @see AWSSageMakerServiceListMonitoringExecutionsResponse
 */
- (void)listMonitoringExecutions:(AWSSageMakerServiceListMonitoringExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListMonitoringExecutionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns list of all monitoring schedules.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringSchedules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListMonitoringSchedulesResponse`.
 
 @see AWSSageMakerServiceListMonitoringSchedulesRequest
 @see AWSSageMakerServiceListMonitoringSchedulesResponse
 */
- (AWSTask<AWSSageMakerServiceListMonitoringSchedulesResponse *> *)listMonitoringSchedules:(AWSSageMakerServiceListMonitoringSchedulesRequest *)request;

/**
 <p>Returns list of all monitoring schedules.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringSchedules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListMonitoringSchedulesRequest
 @see AWSSageMakerServiceListMonitoringSchedulesResponse
 */
- (void)listMonitoringSchedules:(AWSSageMakerServiceListMonitoringSchedulesRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListMonitoringSchedulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists notebook instance lifestyle configurations created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstanceLifecycleConfigs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput`.
 
 @see AWSSageMakerServiceListNotebookInstanceLifecycleConfigsInput
 @see AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput
 */
- (AWSTask<AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput *> *)listNotebookInstanceLifecycleConfigs:(AWSSageMakerServiceListNotebookInstanceLifecycleConfigsInput *)request;

/**
 <p>Lists notebook instance lifestyle configurations created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstanceLifecycleConfigs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListNotebookInstanceLifecycleConfigsInput
 @see AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput
 */
- (void)listNotebookInstanceLifecycleConfigs:(AWSSageMakerServiceListNotebookInstanceLifecycleConfigsInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the Amazon SageMaker notebook instances in the requester's account in an AWS Region. </p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListNotebookInstancesOutput`.
 
 @see AWSSageMakerServiceListNotebookInstancesInput
 @see AWSSageMakerServiceListNotebookInstancesOutput
 */
- (AWSTask<AWSSageMakerServiceListNotebookInstancesOutput *> *)listNotebookInstances:(AWSSageMakerServiceListNotebookInstancesInput *)request;

/**
 <p>Returns a list of the Amazon SageMaker notebook instances in the requester's account in an AWS Region. </p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListNotebookInstancesInput
 @see AWSSageMakerServiceListNotebookInstancesOutput
 */
- (void)listNotebookInstances:(AWSSageMakerServiceListNotebookInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListNotebookInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists processing jobs that satisfy various filters.</p>
 
 @param request A container for the necessary parameters to execute the ListProcessingJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListProcessingJobsResponse`.
 
 @see AWSSageMakerServiceListProcessingJobsRequest
 @see AWSSageMakerServiceListProcessingJobsResponse
 */
- (AWSTask<AWSSageMakerServiceListProcessingJobsResponse *> *)listProcessingJobs:(AWSSageMakerServiceListProcessingJobsRequest *)request;

/**
 <p>Lists processing jobs that satisfy various filters.</p>
 
 @param request A container for the necessary parameters to execute the ListProcessingJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListProcessingJobsRequest
 @see AWSSageMakerServiceListProcessingJobsResponse
 */
- (void)listProcessingJobs:(AWSSageMakerServiceListProcessingJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListProcessingJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the work teams that you are subscribed to in the AWS Marketplace. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscribedWorkteams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListSubscribedWorkteamsResponse`.
 
 @see AWSSageMakerServiceListSubscribedWorkteamsRequest
 @see AWSSageMakerServiceListSubscribedWorkteamsResponse
 */
- (AWSTask<AWSSageMakerServiceListSubscribedWorkteamsResponse *> *)listSubscribedWorkteams:(AWSSageMakerServiceListSubscribedWorkteamsRequest *)request;

/**
 <p>Gets a list of the work teams that you are subscribed to in the AWS Marketplace. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscribedWorkteams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListSubscribedWorkteamsRequest
 @see AWSSageMakerServiceListSubscribedWorkteamsResponse
 */
- (void)listSubscribedWorkteams:(AWSSageMakerServiceListSubscribedWorkteamsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListSubscribedWorkteamsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the tags for the specified Amazon SageMaker resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListTagsOutput`.
 
 @see AWSSageMakerServiceListTagsInput
 @see AWSSageMakerServiceListTagsOutput
 */
- (AWSTask<AWSSageMakerServiceListTagsOutput *> *)listTags:(AWSSageMakerServiceListTagsInput *)request;

/**
 <p>Returns the tags for the specified Amazon SageMaker resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListTagsInput
 @see AWSSageMakerServiceListTagsOutput
 */
- (void)listTags:(AWSSageMakerServiceListTagsInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists training jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListTrainingJobsResponse`.
 
 @see AWSSageMakerServiceListTrainingJobsRequest
 @see AWSSageMakerServiceListTrainingJobsResponse
 */
- (AWSTask<AWSSageMakerServiceListTrainingJobsResponse *> *)listTrainingJobs:(AWSSageMakerServiceListTrainingJobsRequest *)request;

/**
 <p>Lists training jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListTrainingJobsRequest
 @see AWSSageMakerServiceListTrainingJobsResponse
 */
- (void)listTrainingJobs:(AWSSageMakerServiceListTrainingJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListTrainingJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of <a>TrainingJobSummary</a> objects that describe the training jobs that a hyperparameter tuning job launched.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobsForHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobRequest
 @see AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse
 */
- (AWSTask<AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse *> *)listTrainingJobsForHyperParameterTuningJob:(AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobRequest *)request;

/**
 <p>Gets a list of <a>TrainingJobSummary</a> objects that describe the training jobs that a hyperparameter tuning job launched.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobsForHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobRequest
 @see AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse
 */
- (void)listTrainingJobsForHyperParameterTuningJob:(AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists transform jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTransformJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListTransformJobsResponse`.
 
 @see AWSSageMakerServiceListTransformJobsRequest
 @see AWSSageMakerServiceListTransformJobsResponse
 */
- (AWSTask<AWSSageMakerServiceListTransformJobsResponse *> *)listTransformJobs:(AWSSageMakerServiceListTransformJobsRequest *)request;

/**
 <p>Lists transform jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTransformJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListTransformJobsRequest
 @see AWSSageMakerServiceListTransformJobsResponse
 */
- (void)listTransformJobs:(AWSSageMakerServiceListTransformJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListTransformJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the trial components in your account. You can sort the list by trial component name or creation time. You can filter the list to show only components that were created in a specific time range. You can also filter on one of the following:</p><ul><li><p><code>ExperimentName</code></p></li><li><p><code>SourceArn</code></p></li><li><p><code>TrialName</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListTrialComponents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListTrialComponentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceListTrialComponentsRequest
 @see AWSSageMakerServiceListTrialComponentsResponse
 */
- (AWSTask<AWSSageMakerServiceListTrialComponentsResponse *> *)listTrialComponents:(AWSSageMakerServiceListTrialComponentsRequest *)request;

/**
 <p>Lists the trial components in your account. You can sort the list by trial component name or creation time. You can filter the list to show only components that were created in a specific time range. You can also filter on one of the following:</p><ul><li><p><code>ExperimentName</code></p></li><li><p><code>SourceArn</code></p></li><li><p><code>TrialName</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListTrialComponents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceListTrialComponentsRequest
 @see AWSSageMakerServiceListTrialComponentsResponse
 */
- (void)listTrialComponents:(AWSSageMakerServiceListTrialComponentsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListTrialComponentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the trials in your account. Specify an experiment name to limit the list to the trials that are part of that experiment. Specify a trial component name to limit the list to the trials that associated with that trial component. The list can be filtered to show only trials that were created in a specific time range. The list can be sorted by trial name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListTrials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListTrialsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceListTrialsRequest
 @see AWSSageMakerServiceListTrialsResponse
 */
- (AWSTask<AWSSageMakerServiceListTrialsResponse *> *)listTrials:(AWSSageMakerServiceListTrialsRequest *)request;

/**
 <p>Lists the trials in your account. Specify an experiment name to limit the list to the trials that are part of that experiment. Specify a trial component name to limit the list to the trials that associated with that trial component. The list can be filtered to show only trials that were created in a specific time range. The list can be sorted by trial name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListTrials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceListTrialsRequest
 @see AWSSageMakerServiceListTrialsResponse
 */
- (void)listTrials:(AWSSageMakerServiceListTrialsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListTrialsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists user profiles.</p>
 
 @param request A container for the necessary parameters to execute the ListUserProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListUserProfilesResponse`.
 
 @see AWSSageMakerServiceListUserProfilesRequest
 @see AWSSageMakerServiceListUserProfilesResponse
 */
- (AWSTask<AWSSageMakerServiceListUserProfilesResponse *> *)listUserProfiles:(AWSSageMakerServiceListUserProfilesRequest *)request;

/**
 <p>Lists user profiles.</p>
 
 @param request A container for the necessary parameters to execute the ListUserProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListUserProfilesRequest
 @see AWSSageMakerServiceListUserProfilesResponse
 */
- (void)listUserProfiles:(AWSSageMakerServiceListUserProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListUserProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of work teams that you have defined in a region. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkteams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceListWorkteamsResponse`.
 
 @see AWSSageMakerServiceListWorkteamsRequest
 @see AWSSageMakerServiceListWorkteamsResponse
 */
- (AWSTask<AWSSageMakerServiceListWorkteamsResponse *> *)listWorkteams:(AWSSageMakerServiceListWorkteamsRequest *)request;

/**
 <p>Gets a list of work teams that you have defined in a region. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkteams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceListWorkteamsRequest
 @see AWSSageMakerServiceListWorkteamsResponse
 */
- (void)listWorkteams:(AWSSageMakerServiceListWorkteamsRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceListWorkteamsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Renders the UI template so that you can preview the worker's experience. </p>
 
 @param request A container for the necessary parameters to execute the RenderUiTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceRenderUiTemplateResponse`.
 
 @see AWSSageMakerServiceRenderUiTemplateRequest
 @see AWSSageMakerServiceRenderUiTemplateResponse
 */
- (AWSTask<AWSSageMakerServiceRenderUiTemplateResponse *> *)renderUiTemplate:(AWSSageMakerServiceRenderUiTemplateRequest *)request;

/**
 <p>Renders the UI template so that you can preview the worker's experience. </p>
 
 @param request A container for the necessary parameters to execute the RenderUiTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceRenderUiTemplateRequest
 @see AWSSageMakerServiceRenderUiTemplateResponse
 */
- (void)renderUiTemplate:(AWSSageMakerServiceRenderUiTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceRenderUiTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Finds Amazon SageMaker resources that match a search query. Matching resources are returned as a list of <code>SearchRecord</code> objects in the response. You can sort the search results by any resource property in a ascending or descending order.</p><p>You can query against the following value types: numeric, text, Boolean, and timestamp.</p>
 
 @param request A container for the necessary parameters to execute the Search service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceSearchResponse`.
 
 @see AWSSageMakerServiceSearchRequest
 @see AWSSageMakerServiceSearchResponse
 */
- (AWSTask<AWSSageMakerServiceSearchResponse *> *)search:(AWSSageMakerServiceSearchRequest *)request;

/**
 <p>Finds Amazon SageMaker resources that match a search query. Matching resources are returned as a list of <code>SearchRecord</code> objects in the response. You can sort the search results by any resource property in a ascending or descending order.</p><p>You can query against the following value types: numeric, text, Boolean, and timestamp.</p>
 
 @param request A container for the necessary parameters to execute the Search service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceSearchRequest
 @see AWSSageMakerServiceSearchResponse
 */
- (void)search:(AWSSageMakerServiceSearchRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceSearchResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a previously stopped monitoring schedule.</p><note><p>New monitoring schedules are immediately started after creation.</p></note>
 
 @param request A container for the necessary parameters to execute the StartMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStartMonitoringScheduleRequest
 */
- (AWSTask *)startMonitoringSchedule:(AWSSageMakerServiceStartMonitoringScheduleRequest *)request;

/**
 <p>Starts a previously stopped monitoring schedule.</p><note><p>New monitoring schedules are immediately started after creation.</p></note>
 
 @param request A container for the necessary parameters to execute the StartMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStartMonitoringScheduleRequest
 */
- (void)startMonitoringSchedule:(AWSSageMakerServiceStartMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Launches an ML compute instance with the latest version of the libraries and attaches your ML storage volume. After configuring the notebook instance, Amazon SageMaker sets the notebook instance status to <code>InService</code>. A notebook instance's status must be <code>InService</code> before you can connect to your Jupyter notebook. </p>
 
 @param request A container for the necessary parameters to execute the StartNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceStartNotebookInstanceInput
 */
- (AWSTask *)startNotebookInstance:(AWSSageMakerServiceStartNotebookInstanceInput *)request;

/**
 <p>Launches an ML compute instance with the latest version of the libraries and attaches your ML storage volume. After configuring the notebook instance, Amazon SageMaker sets the notebook instance status to <code>InService</code>. A notebook instance's status must be <code>InService</code> before you can connect to your Jupyter notebook. </p>
 
 @param request A container for the necessary parameters to execute the StartNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceStartNotebookInstanceInput
 */
- (void)startNotebookInstance:(AWSSageMakerServiceStartNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>A method for forcing the termination of a running job.</p>
 
 @param request A container for the necessary parameters to execute the StopAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopAutoMLJobRequest
 */
- (AWSTask *)stopAutoMLJob:(AWSSageMakerServiceStopAutoMLJobRequest *)request;

/**
 <p>A method for forcing the termination of a running job.</p>
 
 @param request A container for the necessary parameters to execute the StopAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopAutoMLJobRequest
 */
- (void)stopAutoMLJob:(AWSSageMakerServiceStopAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a model compilation job.</p><p> To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal. This gracefully shuts the job down. If the job hasn't stopped, it sends the SIGKILL signal.</p><p>When it receives a <code>StopCompilationJob</code> request, Amazon SageMaker changes the <a>CompilationJobSummary$CompilationJobStatus</a> of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the <a>CompilationJobSummary$CompilationJobStatus</a> to <code>Stopped</code>. </p>
 
 @param request A container for the necessary parameters to execute the StopCompilationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopCompilationJobRequest
 */
- (AWSTask *)stopCompilationJob:(AWSSageMakerServiceStopCompilationJobRequest *)request;

/**
 <p>Stops a model compilation job.</p><p> To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal. This gracefully shuts the job down. If the job hasn't stopped, it sends the SIGKILL signal.</p><p>When it receives a <code>StopCompilationJob</code> request, Amazon SageMaker changes the <a>CompilationJobSummary$CompilationJobStatus</a> of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the <a>CompilationJobSummary$CompilationJobStatus</a> to <code>Stopped</code>. </p>
 
 @param request A container for the necessary parameters to execute the StopCompilationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopCompilationJobRequest
 */
- (void)stopCompilationJob:(AWSSageMakerServiceStopCompilationJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a running hyperparameter tuning job and all running training jobs that the tuning job launched.</p><p>All model artifacts output from the training jobs are stored in Amazon Simple Storage Service (Amazon S3). All data that the training jobs write to Amazon CloudWatch Logs are still available in CloudWatch. After the tuning job moves to the <code>Stopped</code> state, it releases all reserved resources for the tuning job.</p>
 
 @param request A container for the necessary parameters to execute the StopHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopHyperParameterTuningJobRequest
 */
- (AWSTask *)stopHyperParameterTuningJob:(AWSSageMakerServiceStopHyperParameterTuningJobRequest *)request;

/**
 <p>Stops a running hyperparameter tuning job and all running training jobs that the tuning job launched.</p><p>All model artifacts output from the training jobs are stored in Amazon Simple Storage Service (Amazon S3). All data that the training jobs write to Amazon CloudWatch Logs are still available in CloudWatch. After the tuning job moves to the <code>Stopped</code> state, it releases all reserved resources for the tuning job.</p>
 
 @param request A container for the necessary parameters to execute the StopHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopHyperParameterTuningJobRequest
 */
- (void)stopHyperParameterTuningJob:(AWSSageMakerServiceStopHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a running labeling job. A job that is stopped cannot be restarted. Any results obtained before the job is stopped are placed in the Amazon S3 output bucket.</p>
 
 @param request A container for the necessary parameters to execute the StopLabelingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopLabelingJobRequest
 */
- (AWSTask *)stopLabelingJob:(AWSSageMakerServiceStopLabelingJobRequest *)request;

/**
 <p>Stops a running labeling job. A job that is stopped cannot be restarted. Any results obtained before the job is stopped are placed in the Amazon S3 output bucket.</p>
 
 @param request A container for the necessary parameters to execute the StopLabelingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopLabelingJobRequest
 */
- (void)stopLabelingJob:(AWSSageMakerServiceStopLabelingJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a previously started monitoring schedule.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopMonitoringScheduleRequest
 */
- (AWSTask *)stopMonitoringSchedule:(AWSSageMakerServiceStopMonitoringScheduleRequest *)request;

/**
 <p>Stops a previously started monitoring schedule.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopMonitoringScheduleRequest
 */
- (void)stopMonitoringSchedule:(AWSSageMakerServiceStopMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Terminates the ML compute instance. Before terminating the instance, Amazon SageMaker disconnects the ML storage volume from it. Amazon SageMaker preserves the ML storage volume. Amazon SageMaker stops charging you for the ML compute instance when you call <code>StopNotebookInstance</code>.</p><p>To access data on the ML storage volume for a notebook instance that has been terminated, call the <code>StartNotebookInstance</code> API. <code>StartNotebookInstance</code> launches another ML compute instance, configures it, and attaches the preserved ML storage volume so you can continue your work. </p>
 
 @param request A container for the necessary parameters to execute the StopNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSageMakerServiceStopNotebookInstanceInput
 */
- (AWSTask *)stopNotebookInstance:(AWSSageMakerServiceStopNotebookInstanceInput *)request;

/**
 <p>Terminates the ML compute instance. Before terminating the instance, Amazon SageMaker disconnects the ML storage volume from it. Amazon SageMaker preserves the ML storage volume. Amazon SageMaker stops charging you for the ML compute instance when you call <code>StopNotebookInstance</code>.</p><p>To access data on the ML storage volume for a notebook instance that has been terminated, call the <code>StartNotebookInstance</code> API. <code>StartNotebookInstance</code> launches another ML compute instance, configures it, and attaches the preserved ML storage volume so you can continue your work. </p>
 
 @param request A container for the necessary parameters to execute the StopNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceStopNotebookInstanceInput
 */
- (void)stopNotebookInstance:(AWSSageMakerServiceStopNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a processing job.</p>
 
 @param request A container for the necessary parameters to execute the StopProcessingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopProcessingJobRequest
 */
- (AWSTask *)stopProcessingJob:(AWSSageMakerServiceStopProcessingJobRequest *)request;

/**
 <p>Stops a processing job.</p>
 
 @param request A container for the necessary parameters to execute the StopProcessingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopProcessingJobRequest
 */
- (void)stopProcessingJob:(AWSSageMakerServiceStopProcessingJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a training job. To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms might use this 120-second window to save the model artifacts, so the results of the training is not lost. </p><p>When it receives a <code>StopTrainingJob</code> request, Amazon SageMaker changes the status of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the status to <code>Stopped</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopTrainingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopTrainingJobRequest
 */
- (AWSTask *)stopTrainingJob:(AWSSageMakerServiceStopTrainingJobRequest *)request;

/**
 <p>Stops a training job. To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms might use this 120-second window to save the model artifacts, so the results of the training is not lost. </p><p>When it receives a <code>StopTrainingJob</code> request, Amazon SageMaker changes the status of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the status to <code>Stopped</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopTrainingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopTrainingJobRequest
 */
- (void)stopTrainingJob:(AWSSageMakerServiceStopTrainingJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a transform job.</p><p>When Amazon SageMaker receives a <code>StopTransformJob</code> request, the status of the job changes to <code>Stopping</code>. After Amazon SageMaker stops the job, the status is set to <code>Stopped</code>. When you stop a transform job before it is completed, Amazon SageMaker doesn't store the job's output in Amazon S3.</p>
 
 @param request A container for the necessary parameters to execute the StopTransformJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopTransformJobRequest
 */
- (AWSTask *)stopTransformJob:(AWSSageMakerServiceStopTransformJobRequest *)request;

/**
 <p>Stops a transform job.</p><p>When Amazon SageMaker receives a <code>StopTransformJob</code> request, the status of the job changes to <code>Stopping</code>. After Amazon SageMaker stops the job, the status is set to <code>Stopped</code>. When you stop a transform job before it is completed, Amazon SageMaker doesn't store the job's output in Amazon S3.</p>
 
 @param request A container for the necessary parameters to execute the StopTransformJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceStopTransformJobRequest
 */
- (void)stopTransformJob:(AWSSageMakerServiceStopTransformJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified Git repository with the specified values.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateCodeRepositoryOutput`.
 
 @see AWSSageMakerServiceUpdateCodeRepositoryInput
 @see AWSSageMakerServiceUpdateCodeRepositoryOutput
 */
- (AWSTask<AWSSageMakerServiceUpdateCodeRepositoryOutput *> *)updateCodeRepository:(AWSSageMakerServiceUpdateCodeRepositoryInput *)request;

/**
 <p>Updates the specified Git repository with the specified values.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceUpdateCodeRepositoryInput
 @see AWSSageMakerServiceUpdateCodeRepositoryOutput
 */
- (void)updateCodeRepository:(AWSSageMakerServiceUpdateCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateCodeRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a domain. Changes will impact all of the people in the domain.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateDomainRequest
 @see AWSSageMakerServiceUpdateDomainResponse
 */
- (AWSTask<AWSSageMakerServiceUpdateDomainResponse *> *)updateDomain:(AWSSageMakerServiceUpdateDomainRequest *)request;

/**
 <p>Updates a domain. Changes will impact all of the people in the domain.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateDomainRequest
 @see AWSSageMakerServiceUpdateDomainResponse
 */
- (void)updateDomain:(AWSSageMakerServiceUpdateDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deploys the new <code>EndpointConfig</code> specified in the request, switches to using newly created endpoint, and then deletes resources provisioned for the endpoint using the previous <code>EndpointConfig</code> (there is no availability loss). </p><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p><note><p>You must not delete an <code>EndpointConfig</code> in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateEndpointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceUpdateEndpointInput
 @see AWSSageMakerServiceUpdateEndpointOutput
 */
- (AWSTask<AWSSageMakerServiceUpdateEndpointOutput *> *)updateEndpoint:(AWSSageMakerServiceUpdateEndpointInput *)request;

/**
 <p>Deploys the new <code>EndpointConfig</code> specified in the request, switches to using newly created endpoint, and then deletes resources provisioned for the endpoint using the previous <code>EndpointConfig</code> (there is no availability loss). </p><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p><note><p>You must not delete an <code>EndpointConfig</code> in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceUpdateEndpointInput
 @see AWSSageMakerServiceUpdateEndpointOutput
 */
- (void)updateEndpoint:(AWSSageMakerServiceUpdateEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates variant weight of one or more variants associated with an existing endpoint, or capacity of one variant associated with an existing endpoint. When it receives the request, Amazon SageMaker sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpointWeightsAndCapacities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesInput
 @see AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput
 */
- (AWSTask<AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput *> *)updateEndpointWeightsAndCapacities:(AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesInput *)request;

/**
 <p>Updates variant weight of one or more variants associated with an existing endpoint, or capacity of one variant associated with an existing endpoint. When it receives the request, Amazon SageMaker sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpointWeightsAndCapacities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesInput
 @see AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput
 */
- (void)updateEndpointWeightsAndCapacities:(AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds, updates, or removes the description of an experiment. Updates the display name of an experiment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorConflict`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateExperimentRequest
 @see AWSSageMakerServiceUpdateExperimentResponse
 */
- (AWSTask<AWSSageMakerServiceUpdateExperimentResponse *> *)updateExperiment:(AWSSageMakerServiceUpdateExperimentRequest *)request;

/**
 <p>Adds, updates, or removes the description of an experiment. Updates the display name of an experiment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorConflict`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateExperimentRequest
 @see AWSSageMakerServiceUpdateExperimentResponse
 */
- (void)updateExperiment:(AWSSageMakerServiceUpdateExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a previously created schedule.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateMonitoringScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateMonitoringScheduleRequest
 @see AWSSageMakerServiceUpdateMonitoringScheduleResponse
 */
- (AWSTask<AWSSageMakerServiceUpdateMonitoringScheduleResponse *> *)updateMonitoringSchedule:(AWSSageMakerServiceUpdateMonitoringScheduleRequest *)request;

/**
 <p>Updates a previously created schedule.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateMonitoringScheduleRequest
 @see AWSSageMakerServiceUpdateMonitoringScheduleResponse
 */
- (void)updateMonitoringSchedule:(AWSSageMakerServiceUpdateMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateMonitoringScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a notebook instance. NotebookInstance updates include upgrading or downgrading the ML compute instance used for your notebook instance to accommodate changes in your workload requirements.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateNotebookInstanceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceUpdateNotebookInstanceInput
 @see AWSSageMakerServiceUpdateNotebookInstanceOutput
 */
- (AWSTask<AWSSageMakerServiceUpdateNotebookInstanceOutput *> *)updateNotebookInstance:(AWSSageMakerServiceUpdateNotebookInstanceInput *)request;

/**
 <p>Updates a notebook instance. NotebookInstance updates include upgrading or downgrading the ML compute instance used for your notebook instance to accommodate changes in your workload requirements.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceUpdateNotebookInstanceInput
 @see AWSSageMakerServiceUpdateNotebookInstanceOutput
 */
- (void)updateNotebookInstance:(AWSSageMakerServiceUpdateNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateNotebookInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a notebook instance lifecycle configuration created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigInput
 @see AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput
 */
- (AWSTask<AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput *> *)updateNotebookInstanceLifecycleConfig:(AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Updates a notebook instance lifecycle configuration created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigInput
 @see AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput
 */
- (void)updateNotebookInstanceLifecycleConfig:(AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the display name of a trial.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorConflict`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateTrialRequest
 @see AWSSageMakerServiceUpdateTrialResponse
 */
- (AWSTask<AWSSageMakerServiceUpdateTrialResponse *> *)updateTrial:(AWSSageMakerServiceUpdateTrialRequest *)request;

/**
 <p>Updates the display name of a trial.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorConflict`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateTrialRequest
 @see AWSSageMakerServiceUpdateTrialResponse
 */
- (void)updateTrial:(AWSSageMakerServiceUpdateTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates one or more properties of a trial component.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorConflict`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateTrialComponentRequest
 @see AWSSageMakerServiceUpdateTrialComponentResponse
 */
- (AWSTask<AWSSageMakerServiceUpdateTrialComponentResponse *> *)updateTrialComponent:(AWSSageMakerServiceUpdateTrialComponentRequest *)request;

/**
 <p>Updates one or more properties of a trial component.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorConflict`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateTrialComponentRequest
 @see AWSSageMakerServiceUpdateTrialComponentResponse
 */
- (void)updateTrialComponent:(AWSSageMakerServiceUpdateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a user profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateUserProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateUserProfileRequest
 @see AWSSageMakerServiceUpdateUserProfileResponse
 */
- (AWSTask<AWSSageMakerServiceUpdateUserProfileResponse *> *)updateUserProfile:(AWSSageMakerServiceUpdateUserProfileRequest *)request;

/**
 <p>Updates a user profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`, `AWSSageMakerServiceErrorResourceInUse`, `AWSSageMakerServiceErrorResourceNotFound`.
 
 @see AWSSageMakerServiceUpdateUserProfileRequest
 @see AWSSageMakerServiceUpdateUserProfileResponse
 */
- (void)updateUserProfile:(AWSSageMakerServiceUpdateUserProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateUserProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Restricts access to tasks assigned to workers in the specified workforce to those within specific ranges of IP addresses. You specify allowed IP addresses by creating a list of up to four <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>.</p><p>By default, a workforce isn't restricted to specific IP addresses. If you specify a range of IP addresses, workers who attempt to access tasks using any IP address outside the specified range are denied access and get a <code>Not Found</code> error message on the worker portal. After restricting access with this operation, you can see the allowed IP values for a private workforce with the operation.</p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateWorkforce service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateWorkforceResponse`.
 
 @see AWSSageMakerServiceUpdateWorkforceRequest
 @see AWSSageMakerServiceUpdateWorkforceResponse
 */
- (AWSTask<AWSSageMakerServiceUpdateWorkforceResponse *> *)updateWorkforce:(AWSSageMakerServiceUpdateWorkforceRequest *)request;

/**
 <p>Restricts access to tasks assigned to workers in the specified workforce to those within specific ranges of IP addresses. You specify allowed IP addresses by creating a list of up to four <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>.</p><p>By default, a workforce isn't restricted to specific IP addresses. If you specify a range of IP addresses, workers who attempt to access tasks using any IP address outside the specified range are denied access and get a <code>Not Found</code> error message on the worker portal. After restricting access with this operation, you can see the allowed IP values for a private workforce with the operation.</p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateWorkforce service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSageMakerServiceUpdateWorkforceRequest
 @see AWSSageMakerServiceUpdateWorkforceResponse
 */
- (void)updateWorkforce:(AWSSageMakerServiceUpdateWorkforceRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateWorkforceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing work team with new member definitions or description.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerServiceUpdateWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceUpdateWorkteamRequest
 @see AWSSageMakerServiceUpdateWorkteamResponse
 */
- (AWSTask<AWSSageMakerServiceUpdateWorkteamResponse *> *)updateWorkteam:(AWSSageMakerServiceUpdateWorkteamRequest *)request;

/**
 <p>Updates an existing work team with new member definitions or description.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerServiceErrorDomain` domain and the following error code: `AWSSageMakerServiceErrorResourceLimitExceeded`.
 
 @see AWSSageMakerServiceUpdateWorkteamRequest
 @see AWSSageMakerServiceUpdateWorkteamResponse
 */
- (void)updateWorkteam:(AWSSageMakerServiceUpdateWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSageMakerServiceUpdateWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
