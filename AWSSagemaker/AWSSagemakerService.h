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
#import "AWSSagemakerModel.h"
#import "AWSSagemakerResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSagemaker
FOUNDATION_EXPORT NSString *const AWSSagemakerSDKVersion;

/**
 <p>Provides APIs for creating and managing Amazon SageMaker resources. </p><p>Other Resources:</p><ul><li><p><a href="https://docs.aws.amazon.com/sagemaker/latest/dg/whatis.html#first-time-user">Amazon SageMaker Developer Guide</a></p></li><li><p><a href="https://docs.aws.amazon.com/augmented-ai/2019-11-07/APIReference/Welcome.html">Amazon Augmented AI Runtime API Reference</a></p></li></ul>
 */
@interface AWSSagemaker : AWSService

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

     let Sagemaker = AWSSagemaker.default()

 *Objective-C*

     AWSSagemaker *Sagemaker = [AWSSagemaker defaultSagemaker];

 @return The default service client.
 */
+ (instancetype)defaultSagemaker;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSagemaker.register(with: configuration!, forKey: "USWest2Sagemaker")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:@"USWest2Sagemaker"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Sagemaker = AWSSagemaker(forKey: "USWest2Sagemaker")

 *Objective-C*

     AWSSagemaker *Sagemaker = [AWSSagemaker SagemakerForKey:@"USWest2Sagemaker"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSagemakerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSagemakerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSagemaker.register(with: configuration!, forKey: "USWest2Sagemaker")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:@"USWest2Sagemaker"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Sagemaker = AWSSagemaker(forKey: "USWest2Sagemaker")

 *Objective-C*

     AWSSagemaker *Sagemaker = [AWSSagemaker SagemakerForKey:@"USWest2Sagemaker"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SagemakerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSagemakerForKey:(NSString *)key;

/**
 <p>Adds or overwrites one or more tags for the specified Amazon SageMaker resource. You can add tags to notebook instances, training jobs, hyperparameter tuning jobs, batch transform jobs, models, labeling jobs, work teams, endpoint configurations, and endpoints.</p><p>Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see For more information, see <a href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS Tagging Strategies</a>.</p><note><p>Tags that you add to a hyperparameter tuning job by calling this API are also added to any training jobs that the hyperparameter tuning job launches after you call this API, but not to training jobs that the hyperparameter tuning job launched before you called this API. To make sure that the tags associated with a hyperparameter tuning job are also added to all training jobs that the hyperparameter tuning job launches, add the tags when you first create the tuning job by specifying them in the <code>Tags</code> parameter of <a>CreateHyperParameterTuningJob</a></p></note>
 
 @param request A container for the necessary parameters to execute the AddTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerAddTagsOutput`.
 
 @see AWSSagemakerAddTagsInput
 @see AWSSagemakerAddTagsOutput
 */
- (AWSTask<AWSSagemakerAddTagsOutput *> *)addTags:(AWSSagemakerAddTagsInput *)request;

/**
 <p>Adds or overwrites one or more tags for the specified Amazon SageMaker resource. You can add tags to notebook instances, training jobs, hyperparameter tuning jobs, batch transform jobs, models, labeling jobs, work teams, endpoint configurations, and endpoints.</p><p>Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see For more information, see <a href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS Tagging Strategies</a>.</p><note><p>Tags that you add to a hyperparameter tuning job by calling this API are also added to any training jobs that the hyperparameter tuning job launches after you call this API, but not to training jobs that the hyperparameter tuning job launched before you called this API. To make sure that the tags associated with a hyperparameter tuning job are also added to all training jobs that the hyperparameter tuning job launches, add the tags when you first create the tuning job by specifying them in the <code>Tags</code> parameter of <a>CreateHyperParameterTuningJob</a></p></note>
 
 @param request A container for the necessary parameters to execute the AddTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerAddTagsInput
 @see AWSSagemakerAddTagsOutput
 */
- (void)addTags:(AWSSagemakerAddTagsInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerAddTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a trial component with a trial. A trial component can be associated with multiple trials. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerAssociateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerAssociateTrialComponentRequest
 @see AWSSagemakerAssociateTrialComponentResponse
 */
- (AWSTask<AWSSagemakerAssociateTrialComponentResponse *> *)associateTrialComponent:(AWSSagemakerAssociateTrialComponentRequest *)request;

/**
 <p>Associates a trial component with a trial. A trial component can be associated with multiple trials. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerAssociateTrialComponentRequest
 @see AWSSagemakerAssociateTrialComponentResponse
 */
- (void)associateTrialComponent:(AWSSagemakerAssociateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerAssociateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a machine learning algorithm that you can use in Amazon SageMaker and list in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlgorithm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateAlgorithmOutput`.
 
 @see AWSSagemakerCreateAlgorithmInput
 @see AWSSagemakerCreateAlgorithmOutput
 */
- (AWSTask<AWSSagemakerCreateAlgorithmOutput *> *)createAlgorithm:(AWSSagemakerCreateAlgorithmInput *)request;

/**
 <p>Create a machine learning algorithm that you can use in Amazon SageMaker and list in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlgorithm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerCreateAlgorithmInput
 @see AWSSagemakerCreateAlgorithmOutput
 */
- (void)createAlgorithm:(AWSSagemakerCreateAlgorithmInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateAlgorithmOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a running App for the specified UserProfile. Supported Apps are JupyterServer, KernelGateway, and TensorBoard. This operation is automatically invoked by Amazon SageMaker Studio upon access to the associated Domain, and when new kernel configurations are selected by the user. A user may have multiple Apps active simultaneously. UserProfiles are limited to 5 concurrently running Apps at a time.</p>
 
 @param request A container for the necessary parameters to execute the CreateApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateAppRequest
 @see AWSSagemakerCreateAppResponse
 */
- (AWSTask<AWSSagemakerCreateAppResponse *> *)createApp:(AWSSagemakerCreateAppRequest *)request;

/**
 <p>Creates a running App for the specified UserProfile. Supported Apps are JupyterServer, KernelGateway, and TensorBoard. This operation is automatically invoked by Amazon SageMaker Studio upon access to the associated Domain, and when new kernel configurations are selected by the user. A user may have multiple Apps active simultaneously. UserProfiles are limited to 5 concurrently running Apps at a time.</p>
 
 @param request A container for the necessary parameters to execute the CreateApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateAppRequest
 @see AWSSagemakerCreateAppResponse
 */
- (void)createApp:(AWSSagemakerCreateAppRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AutoPilot job.</p><p>After you run an AutoPilot job, you can find the best performing model by calling , and then deploy that model by following the steps described in <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html">Step 6.1: Deploy the Model to Amazon SageMaker Hosting Services</a>.</p><p>For information about how to use AutoPilot, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html">Use AutoPilot to Automate Model Development</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateAutoMLJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateAutoMLJobRequest
 @see AWSSagemakerCreateAutoMLJobResponse
 */
- (AWSTask<AWSSagemakerCreateAutoMLJobResponse *> *)createAutoMLJob:(AWSSagemakerCreateAutoMLJobRequest *)request;

/**
 <p>Creates an AutoPilot job.</p><p>After you run an AutoPilot job, you can find the best performing model by calling , and then deploy that model by following the steps described in <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html">Step 6.1: Deploy the Model to Amazon SageMaker Hosting Services</a>.</p><p>For information about how to use AutoPilot, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html">Use AutoPilot to Automate Model Development</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateAutoMLJobRequest
 @see AWSSagemakerCreateAutoMLJobResponse
 */
- (void)createAutoMLJob:(AWSSagemakerCreateAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateAutoMLJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Git repository as a resource in your Amazon SageMaker account. You can associate the repository with notebook instances so that you can use Git source control for the notebooks you create. The Git repository is a resource in your Amazon SageMaker account, so it can be associated with more than one notebook instance, and it persists independently from the lifecycle of any notebook instances it is associated with.</p><p>The repository can be hosted either in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository.</p>
 
 @param request A container for the necessary parameters to execute the CreateCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateCodeRepositoryOutput`.
 
 @see AWSSagemakerCreateCodeRepositoryInput
 @see AWSSagemakerCreateCodeRepositoryOutput
 */
- (AWSTask<AWSSagemakerCreateCodeRepositoryOutput *> *)createCodeRepository:(AWSSagemakerCreateCodeRepositoryInput *)request;

/**
 <p>Creates a Git repository as a resource in your Amazon SageMaker account. You can associate the repository with notebook instances so that you can use Git source control for the notebooks you create. The Git repository is a resource in your Amazon SageMaker account, so it can be associated with more than one notebook instance, and it persists independently from the lifecycle of any notebook instances it is associated with.</p><p>The repository can be hosted either in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository.</p>
 
 @param request A container for the necessary parameters to execute the CreateCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerCreateCodeRepositoryInput
 @see AWSSagemakerCreateCodeRepositoryOutput
 */
- (void)createCodeRepository:(AWSSagemakerCreateCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateCodeRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a model compilation job. After the model has been compiled, Amazon SageMaker saves the resulting model artifacts to an Amazon Simple Storage Service (Amazon S3) bucket that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts with AWS IoT Greengrass. In that case, deploy them as an ML resource.</p><p>In the request body, you provide the following:</p><ul><li><p>A name for the compilation job</p></li><li><p> Information about the input model artifacts </p></li><li><p>The output location for the compiled model and the device (target) that the model runs on </p></li><li><p><code>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker assumes to perform the model compilation job</code></p></li></ul><p>You can also provide a <code>Tag</code> to track the model compilation job's resource use and costs. The response body contains the <code>CompilationJobArn</code> for the compiled job.</p><p>To stop a model compilation job, use <a>StopCompilationJob</a>. To get information about a particular model compilation job, use <a>DescribeCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCompilationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateCompilationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateCompilationJobRequest
 @see AWSSagemakerCreateCompilationJobResponse
 */
- (AWSTask<AWSSagemakerCreateCompilationJobResponse *> *)createCompilationJob:(AWSSagemakerCreateCompilationJobRequest *)request;

/**
 <p>Starts a model compilation job. After the model has been compiled, Amazon SageMaker saves the resulting model artifacts to an Amazon Simple Storage Service (Amazon S3) bucket that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts with AWS IoT Greengrass. In that case, deploy them as an ML resource.</p><p>In the request body, you provide the following:</p><ul><li><p>A name for the compilation job</p></li><li><p> Information about the input model artifacts </p></li><li><p>The output location for the compiled model and the device (target) that the model runs on </p></li><li><p><code>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker assumes to perform the model compilation job</code></p></li></ul><p>You can also provide a <code>Tag</code> to track the model compilation job's resource use and costs. The response body contains the <code>CompilationJobArn</code> for the compiled job.</p><p>To stop a model compilation job, use <a>StopCompilationJob</a>. To get information about a particular model compilation job, use <a>DescribeCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCompilationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateCompilationJobRequest
 @see AWSSagemakerCreateCompilationJobResponse
 */
- (void)createCompilationJob:(AWSSagemakerCreateCompilationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateCompilationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a <code>Domain</code> used by SageMaker Studio. A domain consists of an associated directory, a list of authorized users, and a variety of security, application, policy, and Amazon Virtual Private Cloud (VPC) configurations. An AWS account is limited to one domain per region. Users within a domain can share notebook files and other artifacts with each other.</p><p>When a domain is created, an Amazon Elastic File System (EFS) volume is also created for use by all of the users within the domain. Each user receives a private home directory within the EFS for notebooks, Git repositories, and data files.</p><p>All traffic between the domain and the EFS volume is communicated through the specified subnet IDs. All other traffic goes over the Internet through an Amazon SageMaker system VPC. The EFS traffic uses the NFS/TCP protocol over port 2049.</p><important><p>NFS traffic over TCP on port 2049 needs to be allowed in both inbound and outbound rules in order to launch a SageMaker Studio app successfully.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateDomainRequest
 @see AWSSagemakerCreateDomainResponse
 */
- (AWSTask<AWSSagemakerCreateDomainResponse *> *)createDomain:(AWSSagemakerCreateDomainRequest *)request;

/**
 <p>Creates a <code>Domain</code> used by SageMaker Studio. A domain consists of an associated directory, a list of authorized users, and a variety of security, application, policy, and Amazon Virtual Private Cloud (VPC) configurations. An AWS account is limited to one domain per region. Users within a domain can share notebook files and other artifacts with each other.</p><p>When a domain is created, an Amazon Elastic File System (EFS) volume is also created for use by all of the users within the domain. Each user receives a private home directory within the EFS for notebooks, Git repositories, and data files.</p><p>All traffic between the domain and the EFS volume is communicated through the specified subnet IDs. All other traffic goes over the Internet through an Amazon SageMaker system VPC. The EFS traffic uses the NFS/TCP protocol over port 2049.</p><important><p>NFS traffic over TCP on port 2049 needs to be allowed in both inbound and outbound rules in order to launch a SageMaker Studio app successfully.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateDomainRequest
 @see AWSSagemakerCreateDomainResponse
 */
- (void)createDomain:(AWSSagemakerCreateDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an endpoint using the endpoint configuration specified in the request. Amazon SageMaker uses the endpoint to provision resources and deploy models. You create the endpoint configuration with the <a>CreateEndpointConfig</a> API. </p><p> Use this API to deploy models using Amazon SageMaker hosting services. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><note><p> You must not delete an <code>EndpointConfig</code> that is in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p></note><p>The endpoint name must be unique within an AWS Region in your AWS account. </p><p>When it receives the request, Amazon SageMaker creates the endpoint, launches the resources (ML compute instances), and deploys the model(s) on them. </p><note><p>When you call <a>CreateEndpoint</a>, a load call is made to DynamoDB to verify that your endpoint configuration exists. When you read data from a DynamoDB table supporting <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html"><code>Eventually Consistent Reads</code></a>, the response might not reflect the results of a recently completed write operation. The response might include some stale data. If the dependent entities are not yet in DynamoDB, this causes a validation error. If you repeat your read request after a short time, the response should return the latest data. So retry logic is recommended to handle these possible issues. We also recommend that customers call <a>DescribeEndpointConfig</a> before calling <a>CreateEndpoint</a> to minimize the potential impact of a DynamoDB eventually consistent read.</p></note><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Creating</code>. After it creates the endpoint, it sets the status to <code>InService</code>. Amazon SageMaker can then process incoming requests for inferences. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API.</p><p>If any of the models hosted at this endpoint get model data from an Amazon S3 location, Amazon SageMaker uses AWS Security Token Service to download model artifacts from the S3 path you provided. AWS STS is activated in your IAM user account by default. If you previously deactivated AWS STS for a region, you need to reactivate AWS STS for that region. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateEndpointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateEndpointInput
 @see AWSSagemakerCreateEndpointOutput
 */
- (AWSTask<AWSSagemakerCreateEndpointOutput *> *)createEndpoint:(AWSSagemakerCreateEndpointInput *)request;

/**
 <p>Creates an endpoint using the endpoint configuration specified in the request. Amazon SageMaker uses the endpoint to provision resources and deploy models. You create the endpoint configuration with the <a>CreateEndpointConfig</a> API. </p><p> Use this API to deploy models using Amazon SageMaker hosting services. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><note><p> You must not delete an <code>EndpointConfig</code> that is in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p></note><p>The endpoint name must be unique within an AWS Region in your AWS account. </p><p>When it receives the request, Amazon SageMaker creates the endpoint, launches the resources (ML compute instances), and deploys the model(s) on them. </p><note><p>When you call <a>CreateEndpoint</a>, a load call is made to DynamoDB to verify that your endpoint configuration exists. When you read data from a DynamoDB table supporting <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html"><code>Eventually Consistent Reads</code></a>, the response might not reflect the results of a recently completed write operation. The response might include some stale data. If the dependent entities are not yet in DynamoDB, this causes a validation error. If you repeat your read request after a short time, the response should return the latest data. So retry logic is recommended to handle these possible issues. We also recommend that customers call <a>DescribeEndpointConfig</a> before calling <a>CreateEndpoint</a> to minimize the potential impact of a DynamoDB eventually consistent read.</p></note><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Creating</code>. After it creates the endpoint, it sets the status to <code>InService</code>. Amazon SageMaker can then process incoming requests for inferences. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API.</p><p>If any of the models hosted at this endpoint get model data from an Amazon S3 location, Amazon SageMaker uses AWS Security Token Service to download model artifacts from the S3 path you provided. AWS STS is activated in your IAM user account by default. If you previously deactivated AWS STS for a region, you need to reactivate AWS STS for that region. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateEndpointInput
 @see AWSSagemakerCreateEndpointOutput
 */
- (void)createEndpoint:(AWSSagemakerCreateEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an endpoint configuration that Amazon SageMaker hosting services uses to deploy models. In the configuration, you identify one or more models, created using the <code>CreateModel</code> API, to deploy and the resources that you want Amazon SageMaker to provision. Then you call the <a>CreateEndpoint</a> API.</p><note><p> Use this API if you want to use Amazon SageMaker hosting services to deploy models into production. </p></note><p>In the request, you define a <code>ProductionVariant</code>, for each model that you want to deploy. Each <code>ProductionVariant</code> parameter also describes the resources that you want Amazon SageMaker to provision. This includes the number and type of ML compute instances to deploy. </p><p>If you are hosting multiple models, you also assign a <code>VariantWeight</code> to specify how much traffic you want to allocate to each model. For example, suppose that you want to host two models, A and B, and you assign traffic weight 2 for model A and 1 for model B. Amazon SageMaker distributes two-thirds of the traffic to Model A, and one-third to model B. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><note><p>When you call <a>CreateEndpoint</a>, a load call is made to DynamoDB to verify that your endpoint configuration exists. When you read data from a DynamoDB table supporting <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html"><code>Eventually Consistent Reads</code></a>, the response might not reflect the results of a recently completed write operation. The response might include some stale data. If the dependent entities are not yet in DynamoDB, this causes a validation error. If you repeat your read request after a short time, the response should return the latest data. So retry logic is recommended to handle these possible issues. We also recommend that customers call <a>DescribeEndpointConfig</a> before calling <a>CreateEndpoint</a> to minimize the potential impact of a DynamoDB eventually consistent read.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateEndpointConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateEndpointConfigOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateEndpointConfigInput
 @see AWSSagemakerCreateEndpointConfigOutput
 */
- (AWSTask<AWSSagemakerCreateEndpointConfigOutput *> *)createEndpointConfig:(AWSSagemakerCreateEndpointConfigInput *)request;

/**
 <p>Creates an endpoint configuration that Amazon SageMaker hosting services uses to deploy models. In the configuration, you identify one or more models, created using the <code>CreateModel</code> API, to deploy and the resources that you want Amazon SageMaker to provision. Then you call the <a>CreateEndpoint</a> API.</p><note><p> Use this API if you want to use Amazon SageMaker hosting services to deploy models into production. </p></note><p>In the request, you define a <code>ProductionVariant</code>, for each model that you want to deploy. Each <code>ProductionVariant</code> parameter also describes the resources that you want Amazon SageMaker to provision. This includes the number and type of ML compute instances to deploy. </p><p>If you are hosting multiple models, you also assign a <code>VariantWeight</code> to specify how much traffic you want to allocate to each model. For example, suppose that you want to host two models, A and B, and you assign traffic weight 2 for model A and 1 for model B. Amazon SageMaker distributes two-thirds of the traffic to Model A, and one-third to model B. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><note><p>When you call <a>CreateEndpoint</a>, a load call is made to DynamoDB to verify that your endpoint configuration exists. When you read data from a DynamoDB table supporting <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html"><code>Eventually Consistent Reads</code></a>, the response might not reflect the results of a recently completed write operation. The response might include some stale data. If the dependent entities are not yet in DynamoDB, this causes a validation error. If you repeat your read request after a short time, the response should return the latest data. So retry logic is recommended to handle these possible issues. We also recommend that customers call <a>DescribeEndpointConfig</a> before calling <a>CreateEndpoint</a> to minimize the potential impact of a DynamoDB eventually consistent read.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateEndpointConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateEndpointConfigInput
 @see AWSSagemakerCreateEndpointConfigOutput
 */
- (void)createEndpointConfig:(AWSSagemakerCreateEndpointConfigInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateEndpointConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon SageMaker <i>experiment</i>. An experiment is a collection of <i>trials</i> that are observed, compared and evaluated as a group. A trial is a set of steps, called <i>trial components</i>, that produce a machine learning model.</p><p>The goal of an experiment is to determine the components that produce the best model. Multiple trials are performed, each one isolating and measuring the impact of a change to one or more inputs, while keeping the remaining inputs constant.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to experiments, trials, trial components and then use the <a>Search</a> API to search for the tags.</p><p>To add a description to an experiment, specify the optional <code>Description</code> parameter. To add a description later, or to change the description, call the <a>UpdateExperiment</a> API.</p><p>To get a list of all your experiments, call the <a>ListExperiments</a> API. To view an experiment's properties, call the <a>DescribeExperiment</a> API. To get a list of all the trials associated with an experiment, call the <a>ListTrials</a> API. To create a trial call the <a>CreateTrial</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateExperimentRequest
 @see AWSSagemakerCreateExperimentResponse
 */
- (AWSTask<AWSSagemakerCreateExperimentResponse *> *)createExperiment:(AWSSagemakerCreateExperimentRequest *)request;

/**
 <p>Creates an Amazon SageMaker <i>experiment</i>. An experiment is a collection of <i>trials</i> that are observed, compared and evaluated as a group. A trial is a set of steps, called <i>trial components</i>, that produce a machine learning model.</p><p>The goal of an experiment is to determine the components that produce the best model. Multiple trials are performed, each one isolating and measuring the impact of a change to one or more inputs, while keeping the remaining inputs constant.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to experiments, trials, trial components and then use the <a>Search</a> API to search for the tags.</p><p>To add a description to an experiment, specify the optional <code>Description</code> parameter. To add a description later, or to change the description, call the <a>UpdateExperiment</a> API.</p><p>To get a list of all your experiments, call the <a>ListExperiments</a> API. To view an experiment's properties, call the <a>DescribeExperiment</a> API. To get a list of all the trials associated with an experiment, call the <a>ListTrials</a> API. To create a trial call the <a>CreateTrial</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateExperimentRequest
 @see AWSSagemakerCreateExperimentResponse
 */
- (void)createExperiment:(AWSSagemakerCreateExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a flow definition.</p>
 
 @param request A container for the necessary parameters to execute the CreateFlowDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateFlowDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateFlowDefinitionRequest
 @see AWSSagemakerCreateFlowDefinitionResponse
 */
- (AWSTask<AWSSagemakerCreateFlowDefinitionResponse *> *)createFlowDefinition:(AWSSagemakerCreateFlowDefinitionRequest *)request;

/**
 <p>Creates a flow definition.</p>
 
 @param request A container for the necessary parameters to execute the CreateFlowDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateFlowDefinitionRequest
 @see AWSSagemakerCreateFlowDefinitionResponse
 */
- (void)createFlowDefinition:(AWSSagemakerCreateFlowDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateFlowDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Defines the settings you will use for the human review workflow user interface. Reviewers will see a three-panel interface with an instruction area, the item to review, and an input area.</p>
 
 @param request A container for the necessary parameters to execute the CreateHumanTaskUi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateHumanTaskUiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateHumanTaskUiRequest
 @see AWSSagemakerCreateHumanTaskUiResponse
 */
- (AWSTask<AWSSagemakerCreateHumanTaskUiResponse *> *)createHumanTaskUi:(AWSSagemakerCreateHumanTaskUiRequest *)request;

/**
 <p>Defines the settings you will use for the human review workflow user interface. Reviewers will see a three-panel interface with an instruction area, the item to review, and an input area.</p>
 
 @param request A container for the necessary parameters to execute the CreateHumanTaskUi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateHumanTaskUiRequest
 @see AWSSagemakerCreateHumanTaskUiResponse
 */
- (void)createHumanTaskUi:(AWSSagemakerCreateHumanTaskUiRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateHumanTaskUiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a hyperparameter tuning job. A hyperparameter tuning job finds the best version of a model by running many training jobs on your dataset using the algorithm you choose and values for hyperparameters within ranges that you specify. It then chooses the hyperparameter values that result in a model that performs the best, as measured by an objective metric that you choose.</p>
 
 @param request A container for the necessary parameters to execute the CreateHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateHyperParameterTuningJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateHyperParameterTuningJobRequest
 @see AWSSagemakerCreateHyperParameterTuningJobResponse
 */
- (AWSTask<AWSSagemakerCreateHyperParameterTuningJobResponse *> *)createHyperParameterTuningJob:(AWSSagemakerCreateHyperParameterTuningJobRequest *)request;

/**
 <p>Starts a hyperparameter tuning job. A hyperparameter tuning job finds the best version of a model by running many training jobs on your dataset using the algorithm you choose and values for hyperparameters within ranges that you specify. It then chooses the hyperparameter values that result in a model that performs the best, as measured by an objective metric that you choose.</p>
 
 @param request A container for the necessary parameters to execute the CreateHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateHyperParameterTuningJobRequest
 @see AWSSagemakerCreateHyperParameterTuningJobResponse
 */
- (void)createHyperParameterTuningJob:(AWSSagemakerCreateHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateHyperParameterTuningJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a job that uses workers to label the data objects in your input dataset. You can use the labeled data to train machine learning models.</p><p>You can select your workforce from one of three providers:</p><ul><li><p>A private workforce that you create. It can include employees, contractors, and outside experts. Use a private workforce when want the data to stay within your organization or when a specific set of skills is required.</p></li><li><p>One or more vendors that you select from the AWS Marketplace. Vendors provide expertise in specific areas. </p></li><li><p>The Amazon Mechanical Turk workforce. This is the largest workforce, but it should only be used for public data or data that has been stripped of any personally identifiable information.</p></li></ul><p>You can also use <i>automated data labeling</i> to reduce the number of data objects that need to be labeled by a human. Automated data labeling uses <i>active learning</i> to determine if a data object can be labeled by machine or if it needs to be sent to a human worker. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html">Using Automated Data Labeling</a>.</p><p>The data objects to be labeled are contained in an Amazon S3 bucket. You create a <i>manifest file</i> that describes the location of each object. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html">Using Input and Output Data</a>.</p><p>The output can be used as the manifest file for another labeling job or as training data for your machine learning models.</p>
 
 @param request A container for the necessary parameters to execute the CreateLabelingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateLabelingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateLabelingJobRequest
 @see AWSSagemakerCreateLabelingJobResponse
 */
- (AWSTask<AWSSagemakerCreateLabelingJobResponse *> *)createLabelingJob:(AWSSagemakerCreateLabelingJobRequest *)request;

/**
 <p>Creates a job that uses workers to label the data objects in your input dataset. You can use the labeled data to train machine learning models.</p><p>You can select your workforce from one of three providers:</p><ul><li><p>A private workforce that you create. It can include employees, contractors, and outside experts. Use a private workforce when want the data to stay within your organization or when a specific set of skills is required.</p></li><li><p>One or more vendors that you select from the AWS Marketplace. Vendors provide expertise in specific areas. </p></li><li><p>The Amazon Mechanical Turk workforce. This is the largest workforce, but it should only be used for public data or data that has been stripped of any personally identifiable information.</p></li></ul><p>You can also use <i>automated data labeling</i> to reduce the number of data objects that need to be labeled by a human. Automated data labeling uses <i>active learning</i> to determine if a data object can be labeled by machine or if it needs to be sent to a human worker. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html">Using Automated Data Labeling</a>.</p><p>The data objects to be labeled are contained in an Amazon S3 bucket. You create a <i>manifest file</i> that describes the location of each object. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html">Using Input and Output Data</a>.</p><p>The output can be used as the manifest file for another labeling job or as training data for your machine learning models.</p>
 
 @param request A container for the necessary parameters to execute the CreateLabelingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateLabelingJobRequest
 @see AWSSagemakerCreateLabelingJobResponse
 */
- (void)createLabelingJob:(AWSSagemakerCreateLabelingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateLabelingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a model in Amazon SageMaker. In the request, you name the model and describe a primary container. For the primary container, you specify the Docker image that contains inference code, artifacts (from prior training), and a custom environment map that the inference code uses when you deploy the model for predictions.</p><p>Use this API to create a model if you want to use Amazon SageMaker hosting services or run a batch transform job.</p><p>To host your model, you create an endpoint configuration with the <code>CreateEndpointConfig</code> API, and then create an endpoint with the <code>CreateEndpoint</code> API. Amazon SageMaker then deploys all of the containers that you defined for the model in the hosting environment. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><p>To run a batch transform using your model, you start a job with the <code>CreateTransformJob</code> API. Amazon SageMaker uses your model and your dataset to get inferences which are then saved to a specified S3 location.</p><p>In the <code>CreateModel</code> request, you must define a container with the <code>PrimaryContainer</code> parameter.</p><p>In the request, you also provide an IAM role that Amazon SageMaker can assume to access model artifacts and docker image for deployment on ML compute hosting instances or for batch transform jobs. In addition, you also use the IAM role to manage permissions the inference code needs. For example, if the inference code access any other AWS resources, you grant necessary permissions via this role.</p>
 
 @param request A container for the necessary parameters to execute the CreateModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateModelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateModelInput
 @see AWSSagemakerCreateModelOutput
 */
- (AWSTask<AWSSagemakerCreateModelOutput *> *)createModel:(AWSSagemakerCreateModelInput *)request;

/**
 <p>Creates a model in Amazon SageMaker. In the request, you name the model and describe a primary container. For the primary container, you specify the Docker image that contains inference code, artifacts (from prior training), and a custom environment map that the inference code uses when you deploy the model for predictions.</p><p>Use this API to create a model if you want to use Amazon SageMaker hosting services or run a batch transform job.</p><p>To host your model, you create an endpoint configuration with the <code>CreateEndpointConfig</code> API, and then create an endpoint with the <code>CreateEndpoint</code> API. Amazon SageMaker then deploys all of the containers that you defined for the model in the hosting environment. </p><p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a></p><p>To run a batch transform using your model, you start a job with the <code>CreateTransformJob</code> API. Amazon SageMaker uses your model and your dataset to get inferences which are then saved to a specified S3 location.</p><p>In the <code>CreateModel</code> request, you must define a container with the <code>PrimaryContainer</code> parameter.</p><p>In the request, you also provide an IAM role that Amazon SageMaker can assume to access model artifacts and docker image for deployment on ML compute hosting instances or for batch transform jobs. In addition, you also use the IAM role to manage permissions the inference code needs. For example, if the inference code access any other AWS resources, you grant necessary permissions via this role.</p>
 
 @param request A container for the necessary parameters to execute the CreateModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateModelInput
 @see AWSSagemakerCreateModelOutput
 */
- (void)createModel:(AWSSagemakerCreateModelInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateModelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a model package that you can use to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p><p>To create a model package by specifying a Docker container that contains your inference code and the Amazon S3 location of your model artifacts, provide values for <code>InferenceSpecification</code>. To create a model from an algorithm resource that you created or subscribed to in AWS Marketplace, provide a value for <code>SourceAlgorithmSpecification</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateModelPackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateModelPackageOutput`.
 
 @see AWSSagemakerCreateModelPackageInput
 @see AWSSagemakerCreateModelPackageOutput
 */
- (AWSTask<AWSSagemakerCreateModelPackageOutput *> *)createModelPackage:(AWSSagemakerCreateModelPackageInput *)request;

/**
 <p>Creates a model package that you can use to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p><p>To create a model package by specifying a Docker container that contains your inference code and the Amazon S3 location of your model artifacts, provide values for <code>InferenceSpecification</code>. To create a model from an algorithm resource that you created or subscribed to in AWS Marketplace, provide a value for <code>SourceAlgorithmSpecification</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateModelPackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerCreateModelPackageInput
 @see AWSSagemakerCreateModelPackageOutput
 */
- (void)createModelPackage:(AWSSagemakerCreateModelPackageInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateModelPackageOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a schedule that regularly starts Amazon SageMaker Processing Jobs to monitor the data captured for an Amazon SageMaker Endoint.</p>
 
 @param request A container for the necessary parameters to execute the CreateMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateMonitoringScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateMonitoringScheduleRequest
 @see AWSSagemakerCreateMonitoringScheduleResponse
 */
- (AWSTask<AWSSagemakerCreateMonitoringScheduleResponse *> *)createMonitoringSchedule:(AWSSagemakerCreateMonitoringScheduleRequest *)request;

/**
 <p>Creates a schedule that regularly starts Amazon SageMaker Processing Jobs to monitor the data captured for an Amazon SageMaker Endoint.</p>
 
 @param request A container for the necessary parameters to execute the CreateMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateMonitoringScheduleRequest
 @see AWSSagemakerCreateMonitoringScheduleResponse
 */
- (void)createMonitoringSchedule:(AWSSagemakerCreateMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateMonitoringScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon SageMaker notebook instance. A notebook instance is a machine learning (ML) compute instance running on a Jupyter notebook. </p><p>In a <code>CreateNotebookInstance</code> request, specify the type of ML compute instance that you want to run. Amazon SageMaker launches the instance, installs common libraries that you can use to explore datasets for model training, and attaches an ML storage volume to the notebook instance. </p><p>Amazon SageMaker also provides a set of example notebooks. Each notebook demonstrates how to use Amazon SageMaker with a specific algorithm or with a machine learning framework. </p><p>After receiving the request, Amazon SageMaker does the following:</p><ol><li><p>Creates a network interface in the Amazon SageMaker VPC.</p></li><li><p>(Option) If you specified <code>SubnetId</code>, Amazon SageMaker creates a network interface in your own VPC, which is inferred from the subnet ID that you provide in the input. When creating this network interface, Amazon SageMaker attaches the security group that you specified in the request to the network interface that it creates in your VPC.</p></li><li><p>Launches an EC2 instance of the type specified in the request in the Amazon SageMaker VPC. If you specified <code>SubnetId</code> of your VPC, Amazon SageMaker specifies both network interfaces when launching this instance. This enables inbound traffic from your own VPC to the notebook instance, assuming that the security groups allow it.</p></li></ol><p>After creating the notebook instance, Amazon SageMaker returns its Amazon Resource Name (ARN). You can't change the name of a notebook instance after you create it.</p><p>After Amazon SageMaker creates the notebook instance, you can connect to the Jupyter server and work in Jupyter notebooks. For example, you can write code to explore a dataset that you can use for model training, train a model, host models by creating Amazon SageMaker endpoints, and validate hosted models. </p><p>For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateNotebookInstanceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateNotebookInstanceInput
 @see AWSSagemakerCreateNotebookInstanceOutput
 */
- (AWSTask<AWSSagemakerCreateNotebookInstanceOutput *> *)createNotebookInstance:(AWSSagemakerCreateNotebookInstanceInput *)request;

/**
 <p>Creates an Amazon SageMaker notebook instance. A notebook instance is a machine learning (ML) compute instance running on a Jupyter notebook. </p><p>In a <code>CreateNotebookInstance</code> request, specify the type of ML compute instance that you want to run. Amazon SageMaker launches the instance, installs common libraries that you can use to explore datasets for model training, and attaches an ML storage volume to the notebook instance. </p><p>Amazon SageMaker also provides a set of example notebooks. Each notebook demonstrates how to use Amazon SageMaker with a specific algorithm or with a machine learning framework. </p><p>After receiving the request, Amazon SageMaker does the following:</p><ol><li><p>Creates a network interface in the Amazon SageMaker VPC.</p></li><li><p>(Option) If you specified <code>SubnetId</code>, Amazon SageMaker creates a network interface in your own VPC, which is inferred from the subnet ID that you provide in the input. When creating this network interface, Amazon SageMaker attaches the security group that you specified in the request to the network interface that it creates in your VPC.</p></li><li><p>Launches an EC2 instance of the type specified in the request in the Amazon SageMaker VPC. If you specified <code>SubnetId</code> of your VPC, Amazon SageMaker specifies both network interfaces when launching this instance. This enables inbound traffic from your own VPC to the notebook instance, assuming that the security groups allow it.</p></li></ol><p>After creating the notebook instance, Amazon SageMaker returns its Amazon Resource Name (ARN). You can't change the name of a notebook instance after you create it.</p><p>After Amazon SageMaker creates the notebook instance, you can connect to the Jupyter server and work in Jupyter notebooks. For example, you can write code to explore a dataset that you can use for model training, train a model, host models by creating Amazon SageMaker endpoints, and validate hosted models. </p><p>For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateNotebookInstanceInput
 @see AWSSagemakerCreateNotebookInstanceOutput
 */
- (void)createNotebookInstance:(AWSSagemakerCreateNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateNotebookInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a lifecycle configuration that you can associate with a notebook instance. A <i>lifecycle configuration</i> is a collection of shell scripts that run when you create or start a notebook instance.</p><p>Each lifecycle configuration script has a limit of 16384 characters.</p><p>The value of the <code>$PATH</code> environment variable that is available to both scripts is <code>/sbin:bin:/usr/sbin:/usr/bin</code>.</p><p>View CloudWatch Logs for notebook instance lifecycle configurations in log group <code>/aws/sagemaker/NotebookInstances</code> in log stream <code>[notebook-instance-name]/[LifecycleConfigHook]</code>.</p><p>Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for longer than 5 minutes, it fails and the notebook instance is not created or started.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateNotebookInstanceLifecycleConfigInput
 @see AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput
 */
- (AWSTask<AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput *> *)createNotebookInstanceLifecycleConfig:(AWSSagemakerCreateNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Creates a lifecycle configuration that you can associate with a notebook instance. A <i>lifecycle configuration</i> is a collection of shell scripts that run when you create or start a notebook instance.</p><p>Each lifecycle configuration script has a limit of 16384 characters.</p><p>The value of the <code>$PATH</code> environment variable that is available to both scripts is <code>/sbin:bin:/usr/sbin:/usr/bin</code>.</p><p>View CloudWatch Logs for notebook instance lifecycle configurations in log group <code>/aws/sagemaker/NotebookInstances</code> in log stream <code>[notebook-instance-name]/[LifecycleConfigHook]</code>.</p><p>Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for longer than 5 minutes, it fails and the notebook instance is not created or started.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateNotebookInstanceLifecycleConfigInput
 @see AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput
 */
- (void)createNotebookInstanceLifecycleConfig:(AWSSagemakerCreateNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a URL for a specified UserProfile in a Domain. When accessed in a web browser, the user will be automatically signed in to Amazon SageMaker Studio, and granted access to all of the Apps and files associated with the Domain's Amazon Elastic File System (EFS) volume. This operation can only be called when the authentication mode equals IAM. </p>
 
 @param request A container for the necessary parameters to execute the CreatePresignedDomainUrl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreatePresignedDomainUrlResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerCreatePresignedDomainUrlRequest
 @see AWSSagemakerCreatePresignedDomainUrlResponse
 */
- (AWSTask<AWSSagemakerCreatePresignedDomainUrlResponse *> *)createPresignedDomainUrl:(AWSSagemakerCreatePresignedDomainUrlRequest *)request;

/**
 <p>Creates a URL for a specified UserProfile in a Domain. When accessed in a web browser, the user will be automatically signed in to Amazon SageMaker Studio, and granted access to all of the Apps and files associated with the Domain's Amazon Elastic File System (EFS) volume. This operation can only be called when the authentication mode equals IAM. </p>
 
 @param request A container for the necessary parameters to execute the CreatePresignedDomainUrl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerCreatePresignedDomainUrlRequest
 @see AWSSagemakerCreatePresignedDomainUrlResponse
 */
- (void)createPresignedDomainUrl:(AWSSagemakerCreatePresignedDomainUrlRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreatePresignedDomainUrlResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a URL that you can use to connect to the Jupyter server from a notebook instance. In the Amazon SageMaker console, when you choose <code>Open</code> next to a notebook instance, Amazon SageMaker opens a new tab showing the Jupyter server home page from the notebook instance. The console uses this API to get the URL and show the page.</p><p> The IAM role or user used to call this API defines the permissions to access the notebook instance. Once the presigned URL is created, no additional permission is required to access this URL. IAM authorization policies for this API are also enforced for every HTTP request and WebSocket frame that attempts to connect to the notebook instance.</p><p>You can restrict access to this API and to the URL that it returns to a list of IP addresses that you specify. Use the <code>NotIpAddress</code> condition operator and the <code>aws:SourceIP</code> condition context key to specify the list of IP addresses that you want to have access to the notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/security_iam_id-based-policy-examples.html#nbi-ip-filter">Limit Access to a Notebook Instance by IP Address</a>.</p><note><p>The URL that you get from a call to <a>CreatePresignedNotebookInstanceUrl</a> is valid only for 5 minutes. If you try to use the URL after the 5-minute limit expires, you are directed to the AWS console sign-in page.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePresignedNotebookInstanceUrl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreatePresignedNotebookInstanceUrlOutput`.
 
 @see AWSSagemakerCreatePresignedNotebookInstanceUrlInput
 @see AWSSagemakerCreatePresignedNotebookInstanceUrlOutput
 */
- (AWSTask<AWSSagemakerCreatePresignedNotebookInstanceUrlOutput *> *)createPresignedNotebookInstanceUrl:(AWSSagemakerCreatePresignedNotebookInstanceUrlInput *)request;

/**
 <p>Returns a URL that you can use to connect to the Jupyter server from a notebook instance. In the Amazon SageMaker console, when you choose <code>Open</code> next to a notebook instance, Amazon SageMaker opens a new tab showing the Jupyter server home page from the notebook instance. The console uses this API to get the URL and show the page.</p><p> The IAM role or user used to call this API defines the permissions to access the notebook instance. Once the presigned URL is created, no additional permission is required to access this URL. IAM authorization policies for this API are also enforced for every HTTP request and WebSocket frame that attempts to connect to the notebook instance.</p><p>You can restrict access to this API and to the URL that it returns to a list of IP addresses that you specify. Use the <code>NotIpAddress</code> condition operator and the <code>aws:SourceIP</code> condition context key to specify the list of IP addresses that you want to have access to the notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/security_iam_id-based-policy-examples.html#nbi-ip-filter">Limit Access to a Notebook Instance by IP Address</a>.</p><note><p>The URL that you get from a call to <a>CreatePresignedNotebookInstanceUrl</a> is valid only for 5 minutes. If you try to use the URL after the 5-minute limit expires, you are directed to the AWS console sign-in page.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePresignedNotebookInstanceUrl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerCreatePresignedNotebookInstanceUrlInput
 @see AWSSagemakerCreatePresignedNotebookInstanceUrlOutput
 */
- (void)createPresignedNotebookInstanceUrl:(AWSSagemakerCreatePresignedNotebookInstanceUrlInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreatePresignedNotebookInstanceUrlOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a processing job.</p>
 
 @param request A container for the necessary parameters to execute the CreateProcessingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateProcessingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerCreateProcessingJobRequest
 @see AWSSagemakerCreateProcessingJobResponse
 */
- (AWSTask<AWSSagemakerCreateProcessingJobResponse *> *)createProcessingJob:(AWSSagemakerCreateProcessingJobRequest *)request;

/**
 <p>Creates a processing job.</p>
 
 @param request A container for the necessary parameters to execute the CreateProcessingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerCreateProcessingJobRequest
 @see AWSSagemakerCreateProcessingJobResponse
 */
- (void)createProcessingJob:(AWSSagemakerCreateProcessingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateProcessingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a model training job. After training completes, Amazon SageMaker saves the resulting model artifacts to an Amazon S3 location that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts in a machine learning service other than Amazon SageMaker, provided that you know how to use them for inferences. </p><p>In the request body, you provide the following: </p><ul><li><p><code>AlgorithmSpecification</code> - Identifies the training algorithm to use. </p></li><li><p><code>HyperParameters</code> - Specify these algorithm-specific parameters to enable the estimation of model parameters during training. Hyperparameters can be tuned to optimize this learning process. For a list of hyperparameters for each training algorithm provided by Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>. </p></li><li><p><code>InputDataConfig</code> - Describes the training dataset and the Amazon S3, EFS, or FSx location where it is stored.</p></li><li><p><code>OutputDataConfig</code> - Identifies the Amazon S3 bucket where you want Amazon SageMaker to save the results of model training. </p><p/></li><li><p><code>ResourceConfig</code> - Identifies the resources, ML compute instances, and ML storage volumes to deploy for model training. In distributed training, you specify more than one instance. </p></li><li><p><code>EnableManagedSpotTraining</code> - Optimize the cost of training machine learning models by up to 80% by using Amazon EC2 Spot instances. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html">Managed Spot Training</a>. </p></li><li><p><code>RoleARN</code> - The Amazon Resource Number (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during model training. You must grant this role the necessary permissions so that Amazon SageMaker can successfully complete model training. </p></li><li><p><code>StoppingCondition</code> - To help cap training costs, use <code>MaxRuntimeInSeconds</code> to set a time limit for training. Use <code>MaxWaitTimeInSeconds</code> to specify how long you are willing to wait for a managed spot training job to complete. </p></li></ul><p> For more information about Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateTrainingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateTrainingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerCreateTrainingJobRequest
 @see AWSSagemakerCreateTrainingJobResponse
 */
- (AWSTask<AWSSagemakerCreateTrainingJobResponse *> *)createTrainingJob:(AWSSagemakerCreateTrainingJobRequest *)request;

/**
 <p>Starts a model training job. After training completes, Amazon SageMaker saves the resulting model artifacts to an Amazon S3 location that you specify. </p><p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts in a machine learning service other than Amazon SageMaker, provided that you know how to use them for inferences. </p><p>In the request body, you provide the following: </p><ul><li><p><code>AlgorithmSpecification</code> - Identifies the training algorithm to use. </p></li><li><p><code>HyperParameters</code> - Specify these algorithm-specific parameters to enable the estimation of model parameters during training. Hyperparameters can be tuned to optimize this learning process. For a list of hyperparameters for each training algorithm provided by Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>. </p></li><li><p><code>InputDataConfig</code> - Describes the training dataset and the Amazon S3, EFS, or FSx location where it is stored.</p></li><li><p><code>OutputDataConfig</code> - Identifies the Amazon S3 bucket where you want Amazon SageMaker to save the results of model training. </p><p/></li><li><p><code>ResourceConfig</code> - Identifies the resources, ML compute instances, and ML storage volumes to deploy for model training. In distributed training, you specify more than one instance. </p></li><li><p><code>EnableManagedSpotTraining</code> - Optimize the cost of training machine learning models by up to 80% by using Amazon EC2 Spot instances. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html">Managed Spot Training</a>. </p></li><li><p><code>RoleARN</code> - The Amazon Resource Number (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during model training. You must grant this role the necessary permissions so that Amazon SageMaker can successfully complete model training. </p></li><li><p><code>StoppingCondition</code> - To help cap training costs, use <code>MaxRuntimeInSeconds</code> to set a time limit for training. Use <code>MaxWaitTimeInSeconds</code> to specify how long you are willing to wait for a managed spot training job to complete. </p></li></ul><p> For more information about Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateTrainingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerCreateTrainingJobRequest
 @see AWSSagemakerCreateTrainingJobResponse
 */
- (void)createTrainingJob:(AWSSagemakerCreateTrainingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateTrainingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a transform job. A transform job uses a trained model to get inferences on a dataset and saves these results to an Amazon S3 location that you specify.</p><p>To perform batch transformations, you create a transform job and use the data that you have readily available.</p><p>In the request body, you provide the following:</p><ul><li><p><code>TransformJobName</code> - Identifies the transform job. The name must be unique within an AWS Region in an AWS account.</p></li><li><p><code>ModelName</code> - Identifies the model to use. <code>ModelName</code> must be the name of an existing Amazon SageMaker model in the same AWS Region and AWS account. For information on creating a model, see <a>CreateModel</a>.</p></li><li><p><code>TransformInput</code> - Describes the dataset to be transformed and the Amazon S3 location where it is stored.</p></li><li><p><code>TransformOutput</code> - Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.</p></li><li><p><code>TransformResources</code> - Identifies the ML compute instances for the transform job.</p></li></ul><p>For more information about how batch transformation works, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html">Batch Transform</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransformJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateTransformJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerCreateTransformJobRequest
 @see AWSSagemakerCreateTransformJobResponse
 */
- (AWSTask<AWSSagemakerCreateTransformJobResponse *> *)createTransformJob:(AWSSagemakerCreateTransformJobRequest *)request;

/**
 <p>Starts a transform job. A transform job uses a trained model to get inferences on a dataset and saves these results to an Amazon S3 location that you specify.</p><p>To perform batch transformations, you create a transform job and use the data that you have readily available.</p><p>In the request body, you provide the following:</p><ul><li><p><code>TransformJobName</code> - Identifies the transform job. The name must be unique within an AWS Region in an AWS account.</p></li><li><p><code>ModelName</code> - Identifies the model to use. <code>ModelName</code> must be the name of an existing Amazon SageMaker model in the same AWS Region and AWS account. For information on creating a model, see <a>CreateModel</a>.</p></li><li><p><code>TransformInput</code> - Describes the dataset to be transformed and the Amazon S3 location where it is stored.</p></li><li><p><code>TransformOutput</code> - Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.</p></li><li><p><code>TransformResources</code> - Identifies the ML compute instances for the transform job.</p></li></ul><p>For more information about how batch transformation works, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html">Batch Transform</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransformJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerCreateTransformJobRequest
 @see AWSSagemakerCreateTransformJobResponse
 */
- (void)createTransformJob:(AWSSagemakerCreateTransformJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateTransformJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon SageMaker <i>trial</i>. A trial is a set of steps called <i>trial components</i> that produce a machine learning model. A trial is part of a single Amazon SageMaker <i>experiment</i>.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial and then use the <a>Search</a> API to search for the tags.</p><p>To get a list of all your trials, call the <a>ListTrials</a> API. To view a trial's properties, call the <a>DescribeTrial</a> API. To create a trial component, call the <a>CreateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateTrialRequest
 @see AWSSagemakerCreateTrialResponse
 */
- (AWSTask<AWSSagemakerCreateTrialResponse *> *)createTrial:(AWSSagemakerCreateTrialRequest *)request;

/**
 <p>Creates an Amazon SageMaker <i>trial</i>. A trial is a set of steps called <i>trial components</i> that produce a machine learning model. A trial is part of a single Amazon SageMaker <i>experiment</i>.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial and then use the <a>Search</a> API to search for the tags.</p><p>To get a list of all your trials, call the <a>ListTrials</a> API. To view a trial's properties, call the <a>DescribeTrial</a> API. To create a trial component, call the <a>CreateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateTrialRequest
 @see AWSSagemakerCreateTrialResponse
 */
- (void)createTrial:(AWSSagemakerCreateTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a <i>trial component</i>, which is a stage of a machine learning <i>trial</i>. A trial is composed of one or more trial components. A trial component can be used in multiple trials.</p><p>Trial components include pre-processing jobs, training jobs, and batch transform jobs.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial component and then use the <a>Search</a> API to search for the tags.</p><note><p><code>CreateTrialComponent</code> can only be invoked from within an Amazon SageMaker managed environment. This includes Amazon SageMaker training jobs, processing jobs, transform jobs, and Amazon SageMaker notebooks. A call to <code>CreateTrialComponent</code> from outside one of these environments results in an error.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateTrialComponentRequest
 @see AWSSagemakerCreateTrialComponentResponse
 */
- (AWSTask<AWSSagemakerCreateTrialComponentResponse *> *)createTrialComponent:(AWSSagemakerCreateTrialComponentRequest *)request;

/**
 <p>Creates a <i>trial component</i>, which is a stage of a machine learning <i>trial</i>. A trial is composed of one or more trial components. A trial component can be used in multiple trials.</p><p>Trial components include pre-processing jobs, training jobs, and batch transform jobs.</p><p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p><p>You can add tags to a trial component and then use the <a>Search</a> API to search for the tags.</p><note><p><code>CreateTrialComponent</code> can only be invoked from within an Amazon SageMaker managed environment. This includes Amazon SageMaker training jobs, processing jobs, transform jobs, and Amazon SageMaker notebooks. A call to <code>CreateTrialComponent</code> from outside one of these environments results in an error.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateTrialComponentRequest
 @see AWSSagemakerCreateTrialComponentResponse
 */
- (void)createTrialComponent:(AWSSagemakerCreateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a user profile. A user profile represents a single user within a domain, and is the main way to reference a "person" for the purposes of sharing, reporting, and other user-oriented features. This entity is created when a user onboards to Amazon SageMaker Studio. If an administrator invites a person by email or imports them from SSO, a user profile is automatically created. A user profile is the primary holder of settings for an individual user and has a reference to the user's private Amazon Elastic File System (EFS) home directory. </p>
 
 @param request A container for the necessary parameters to execute the CreateUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateUserProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateUserProfileRequest
 @see AWSSagemakerCreateUserProfileResponse
 */
- (AWSTask<AWSSagemakerCreateUserProfileResponse *> *)createUserProfile:(AWSSagemakerCreateUserProfileRequest *)request;

/**
 <p>Creates a user profile. A user profile represents a single user within a domain, and is the main way to reference a "person" for the purposes of sharing, reporting, and other user-oriented features. This entity is created when a user onboards to Amazon SageMaker Studio. If an administrator invites a person by email or imports them from SSO, a user profile is automatically created. A user profile is the primary holder of settings for an individual user and has a reference to the user's private Amazon Elastic File System (EFS) home directory. </p>
 
 @param request A container for the necessary parameters to execute the CreateUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`.
 
 @see AWSSagemakerCreateUserProfileRequest
 @see AWSSagemakerCreateUserProfileResponse
 */
- (void)createUserProfile:(AWSSagemakerCreateUserProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateUserProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new work team for labeling your data. A work team is defined by one or more Amazon Cognito user pools. You must first create the user pools before you can create a work team.</p><p>You cannot create more than 25 work teams in an account and region.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerCreateWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateWorkteamRequest
 @see AWSSagemakerCreateWorkteamResponse
 */
- (AWSTask<AWSSagemakerCreateWorkteamResponse *> *)createWorkteam:(AWSSagemakerCreateWorkteamRequest *)request;

/**
 <p>Creates a new work team for labeling your data. A work team is defined by one or more Amazon Cognito user pools. You must first create the user pools before you can create a work team.</p><p>You cannot create more than 25 work teams in an account and region.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerCreateWorkteamRequest
 @see AWSSagemakerCreateWorkteamResponse
 */
- (void)createWorkteam:(AWSSagemakerCreateWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerCreateWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified algorithm from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlgorithm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSagemakerDeleteAlgorithmInput
 */
- (AWSTask *)deleteAlgorithm:(AWSSagemakerDeleteAlgorithmInput *)request;

/**
 <p>Removes the specified algorithm from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlgorithm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDeleteAlgorithmInput
 */
- (void)deleteAlgorithm:(AWSSagemakerDeleteAlgorithmInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Used to stop and delete an app.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteAppRequest
 */
- (AWSTask *)deleteApp:(AWSSagemakerDeleteAppRequest *)request;

/**
 <p>Used to stop and delete an app.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteAppRequest
 */
- (void)deleteApp:(AWSSagemakerDeleteAppRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Git repository from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSagemakerDeleteCodeRepositoryInput
 */
- (AWSTask *)deleteCodeRepository:(AWSSagemakerDeleteCodeRepositoryInput *)request;

/**
 <p>Deletes the specified Git repository from your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDeleteCodeRepositoryInput
 */
- (void)deleteCodeRepository:(AWSSagemakerDeleteCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Used to delete a domain. If you onboarded with IAM mode, you will need to delete your domain to onboard again using SSO. Use with caution. All of the members of the domain will lose access to their EFS volume, including data, notebooks, and other artifacts. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteDomainRequest
 */
- (AWSTask *)deleteDomain:(AWSSagemakerDeleteDomainRequest *)request;

/**
 <p>Used to delete a domain. If you onboarded with IAM mode, you will need to delete your domain to onboard again using SSO. Use with caution. All of the members of the domain will lose access to their EFS volume, including data, notebooks, and other artifacts. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteDomainRequest
 */
- (void)deleteDomain:(AWSSagemakerDeleteDomainRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an endpoint. Amazon SageMaker frees up all of the resources that were deployed when the endpoint was created. </p><p>Amazon SageMaker retires any custom KMS key grants associated with the endpoint, meaning you don't need to use the <a href="http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html">RevokeGrant</a> API call.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSagemakerDeleteEndpointInput
 */
- (AWSTask *)deleteEndpoint:(AWSSagemakerDeleteEndpointInput *)request;

/**
 <p>Deletes an endpoint. Amazon SageMaker frees up all of the resources that were deployed when the endpoint was created. </p><p>Amazon SageMaker retires any custom KMS key grants associated with the endpoint, meaning you don't need to use the <a href="http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html">RevokeGrant</a> API call.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDeleteEndpointInput
 */
- (void)deleteEndpoint:(AWSSagemakerDeleteEndpointInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an endpoint configuration. The <code>DeleteEndpointConfig</code> API deletes only the specified configuration. It does not delete endpoints created using the configuration. </p><p>You must not delete an <code>EndpointConfig</code> in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. If you delete the <code>EndpointConfig</code> of an endpoint that is active or being created or updated you may lose visibility into the instance type the endpoint is using. The endpoint must be deleted in order to stop incurring charges.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpointConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSagemakerDeleteEndpointConfigInput
 */
- (AWSTask *)deleteEndpointConfig:(AWSSagemakerDeleteEndpointConfigInput *)request;

/**
 <p>Deletes an endpoint configuration. The <code>DeleteEndpointConfig</code> API deletes only the specified configuration. It does not delete endpoints created using the configuration. </p><p>You must not delete an <code>EndpointConfig</code> in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. If you delete the <code>EndpointConfig</code> of an endpoint that is active or being created or updated you may lose visibility into the instance type the endpoint is using. The endpoint must be deleted in order to stop incurring charges.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpointConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDeleteEndpointConfigInput
 */
- (void)deleteEndpointConfig:(AWSSagemakerDeleteEndpointConfigInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon SageMaker experiment. All trials associated with the experiment must be deleted first. Use the <a>ListTrials</a> API to get a list of the trials associated with the experiment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDeleteExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteExperimentRequest
 @see AWSSagemakerDeleteExperimentResponse
 */
- (AWSTask<AWSSagemakerDeleteExperimentResponse *> *)deleteExperiment:(AWSSagemakerDeleteExperimentRequest *)request;

/**
 <p>Deletes an Amazon SageMaker experiment. All trials associated with the experiment must be deleted first. Use the <a>ListTrials</a> API to get a list of the trials associated with the experiment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteExperimentRequest
 @see AWSSagemakerDeleteExperimentResponse
 */
- (void)deleteExperiment:(AWSSagemakerDeleteExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDeleteExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFlowDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDeleteFlowDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteFlowDefinitionRequest
 @see AWSSagemakerDeleteFlowDefinitionResponse
 */
- (AWSTask<AWSSagemakerDeleteFlowDefinitionResponse *> *)deleteFlowDefinition:(AWSSagemakerDeleteFlowDefinitionRequest *)request;

/**
 <p>Deletes the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFlowDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteFlowDefinitionRequest
 @see AWSSagemakerDeleteFlowDefinitionResponse
 */
- (void)deleteFlowDefinition:(AWSSagemakerDeleteFlowDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDeleteFlowDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a model. The <code>DeleteModel</code> API deletes only the model entry that was created in Amazon SageMaker when you called the <a>CreateModel</a> API. It does not delete model artifacts, inference code, or the IAM role that you specified when creating the model. </p>
 
 @param request A container for the necessary parameters to execute the DeleteModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSagemakerDeleteModelInput
 */
- (AWSTask *)deleteModel:(AWSSagemakerDeleteModelInput *)request;

/**
 <p>Deletes a model. The <code>DeleteModel</code> API deletes only the model entry that was created in Amazon SageMaker when you called the <a>CreateModel</a> API. It does not delete model artifacts, inference code, or the IAM role that you specified when creating the model. </p>
 
 @param request A container for the necessary parameters to execute the DeleteModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDeleteModelInput
 */
- (void)deleteModel:(AWSSagemakerDeleteModelInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a model package.</p><p>A model package is used to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p>
 
 @param request A container for the necessary parameters to execute the DeleteModelPackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSagemakerDeleteModelPackageInput
 */
- (AWSTask *)deleteModelPackage:(AWSSagemakerDeleteModelPackageInput *)request;

/**
 <p>Deletes a model package.</p><p>A model package is used to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p>
 
 @param request A container for the necessary parameters to execute the DeleteModelPackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDeleteModelPackageInput
 */
- (void)deleteModelPackage:(AWSSagemakerDeleteModelPackageInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a monitoring schedule. Also stops the schedule had not already been stopped. This does not delete the job execution history of the monitoring schedule. </p>
 
 @param request A container for the necessary parameters to execute the DeleteMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteMonitoringScheduleRequest
 */
- (AWSTask *)deleteMonitoringSchedule:(AWSSagemakerDeleteMonitoringScheduleRequest *)request;

/**
 <p>Deletes a monitoring schedule. Also stops the schedule had not already been stopped. This does not delete the job execution history of the monitoring schedule. </p>
 
 @param request A container for the necessary parameters to execute the DeleteMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteMonitoringScheduleRequest
 */
- (void)deleteMonitoringSchedule:(AWSSagemakerDeleteMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an Amazon SageMaker notebook instance. Before you can delete a notebook instance, you must call the <code>StopNotebookInstance</code> API. </p><important><p>When you delete a notebook instance, you lose all of your data. Amazon SageMaker removes the ML compute instance, and deletes the ML storage volume and the network interface associated with the notebook instance. </p></important>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSagemakerDeleteNotebookInstanceInput
 */
- (AWSTask *)deleteNotebookInstance:(AWSSagemakerDeleteNotebookInstanceInput *)request;

/**
 <p> Deletes an Amazon SageMaker notebook instance. Before you can delete a notebook instance, you must call the <code>StopNotebookInstance</code> API. </p><important><p>When you delete a notebook instance, you lose all of your data. Amazon SageMaker removes the ML compute instance, and deletes the ML storage volume and the network interface associated with the notebook instance. </p></important>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDeleteNotebookInstanceInput
 */
- (void)deleteNotebookInstance:(AWSSagemakerDeleteNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a notebook instance lifecycle configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSagemakerDeleteNotebookInstanceLifecycleConfigInput
 */
- (AWSTask *)deleteNotebookInstanceLifecycleConfig:(AWSSagemakerDeleteNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Deletes a notebook instance lifecycle configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDeleteNotebookInstanceLifecycleConfigInput
 */
- (void)deleteNotebookInstanceLifecycleConfig:(AWSSagemakerDeleteNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified tags from an Amazon SageMaker resource.</p><p>To list a resource's tags, use the <code>ListTags</code> API. </p><note><p>When you call this API to delete tags from a hyperparameter tuning job, the deleted tags are not removed from training jobs that the hyperparameter tuning job launched before you called this API.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDeleteTagsOutput`.
 
 @see AWSSagemakerDeleteTagsInput
 @see AWSSagemakerDeleteTagsOutput
 */
- (AWSTask<AWSSagemakerDeleteTagsOutput *> *)deleteTags:(AWSSagemakerDeleteTagsInput *)request;

/**
 <p>Deletes the specified tags from an Amazon SageMaker resource.</p><p>To list a resource's tags, use the <code>ListTags</code> API. </p><note><p>When you call this API to delete tags from a hyperparameter tuning job, the deleted tags are not removed from training jobs that the hyperparameter tuning job launched before you called this API.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDeleteTagsInput
 @see AWSSagemakerDeleteTagsOutput
 */
- (void)deleteTags:(AWSSagemakerDeleteTagsInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDeleteTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified trial. All trial components that make up the trial must be deleted first. Use the <a>DescribeTrialComponent</a> API to get the list of trial components.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDeleteTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteTrialRequest
 @see AWSSagemakerDeleteTrialResponse
 */
- (AWSTask<AWSSagemakerDeleteTrialResponse *> *)deleteTrial:(AWSSagemakerDeleteTrialRequest *)request;

/**
 <p>Deletes the specified trial. All trial components that make up the trial must be deleted first. Use the <a>DescribeTrialComponent</a> API to get the list of trial components.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteTrialRequest
 @see AWSSagemakerDeleteTrialResponse
 */
- (void)deleteTrial:(AWSSagemakerDeleteTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDeleteTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified trial component. A trial component must be disassociated from all trials before the trial component can be deleted. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDeleteTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteTrialComponentRequest
 @see AWSSagemakerDeleteTrialComponentResponse
 */
- (AWSTask<AWSSagemakerDeleteTrialComponentResponse *> *)deleteTrialComponent:(AWSSagemakerDeleteTrialComponentRequest *)request;

/**
 <p>Deletes the specified trial component. A trial component must be disassociated from all trials before the trial component can be deleted. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteTrialComponentRequest
 @see AWSSagemakerDeleteTrialComponentResponse
 */
- (void)deleteTrialComponent:(AWSSagemakerDeleteTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDeleteTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user profile. When a user profile is deleted, the user loses access to their EFS volume, including data, notebooks, and other artifacts.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteUserProfileRequest
 */
- (AWSTask *)deleteUserProfile:(AWSSagemakerDeleteUserProfileRequest *)request;

/**
 <p>Deletes a user profile. When a user profile is deleted, the user loses access to their EFS volume, including data, notebooks, and other artifacts.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDeleteUserProfileRequest
 */
- (void)deleteUserProfile:(AWSSagemakerDeleteUserProfileRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing work team. This operation can't be undone.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDeleteWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerDeleteWorkteamRequest
 @see AWSSagemakerDeleteWorkteamResponse
 */
- (AWSTask<AWSSagemakerDeleteWorkteamResponse *> *)deleteWorkteam:(AWSSagemakerDeleteWorkteamRequest *)request;

/**
 <p>Deletes an existing work team. This operation can't be undone.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerDeleteWorkteamRequest
 @see AWSSagemakerDeleteWorkteamResponse
 */
- (void)deleteWorkteam:(AWSSagemakerDeleteWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDeleteWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the specified algorithm that is in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlgorithm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeAlgorithmOutput`.
 
 @see AWSSagemakerDescribeAlgorithmInput
 @see AWSSagemakerDescribeAlgorithmOutput
 */
- (AWSTask<AWSSagemakerDescribeAlgorithmOutput *> *)describeAlgorithm:(AWSSagemakerDescribeAlgorithmInput *)request;

/**
 <p>Returns a description of the specified algorithm that is in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlgorithm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDescribeAlgorithmInput
 @see AWSSagemakerDescribeAlgorithmOutput
 */
- (void)describeAlgorithm:(AWSSagemakerDescribeAlgorithmInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeAlgorithmOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the app.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeAppResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeAppRequest
 @see AWSSagemakerDescribeAppResponse
 */
- (AWSTask<AWSSagemakerDescribeAppResponse *> *)describeApp:(AWSSagemakerDescribeAppRequest *)request;

/**
 <p>Describes the app.</p>
 
 @param request A container for the necessary parameters to execute the DescribeApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeAppRequest
 @see AWSSagemakerDescribeAppResponse
 */
- (void)describeApp:(AWSSagemakerDescribeAppRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeAppResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about an Amazon SageMaker job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeAutoMLJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeAutoMLJobRequest
 @see AWSSagemakerDescribeAutoMLJobResponse
 */
- (AWSTask<AWSSagemakerDescribeAutoMLJobResponse *> *)describeAutoMLJob:(AWSSagemakerDescribeAutoMLJobRequest *)request;

/**
 <p>Returns information about an Amazon SageMaker job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeAutoMLJobRequest
 @see AWSSagemakerDescribeAutoMLJobResponse
 */
- (void)describeAutoMLJob:(AWSSagemakerDescribeAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeAutoMLJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets details about the specified Git repository.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeCodeRepositoryOutput`.
 
 @see AWSSagemakerDescribeCodeRepositoryInput
 @see AWSSagemakerDescribeCodeRepositoryOutput
 */
- (AWSTask<AWSSagemakerDescribeCodeRepositoryOutput *> *)describeCodeRepository:(AWSSagemakerDescribeCodeRepositoryInput *)request;

/**
 <p>Gets details about the specified Git repository.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDescribeCodeRepositoryInput
 @see AWSSagemakerDescribeCodeRepositoryOutput
 */
- (void)describeCodeRepository:(AWSSagemakerDescribeCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeCodeRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a model compilation job.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCompilationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeCompilationJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeCompilationJobRequest
 @see AWSSagemakerDescribeCompilationJobResponse
 */
- (AWSTask<AWSSagemakerDescribeCompilationJobResponse *> *)describeCompilationJob:(AWSSagemakerDescribeCompilationJobRequest *)request;

/**
 <p>Returns information about a model compilation job.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCompilationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeCompilationJobRequest
 @see AWSSagemakerDescribeCompilationJobResponse
 */
- (void)describeCompilationJob:(AWSSagemakerDescribeCompilationJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeCompilationJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The description of the domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeDomainRequest
 @see AWSSagemakerDescribeDomainResponse
 */
- (AWSTask<AWSSagemakerDescribeDomainResponse *> *)describeDomain:(AWSSagemakerDescribeDomainRequest *)request;

/**
 <p>The description of the domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeDomainRequest
 @see AWSSagemakerDescribeDomainResponse
 */
- (void)describeDomain:(AWSSagemakerDescribeDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeEndpointOutput`.
 
 @see AWSSagemakerDescribeEndpointInput
 @see AWSSagemakerDescribeEndpointOutput
 */
- (AWSTask<AWSSagemakerDescribeEndpointOutput *> *)describeEndpoint:(AWSSagemakerDescribeEndpointInput *)request;

/**
 <p>Returns the description of an endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDescribeEndpointInput
 @see AWSSagemakerDescribeEndpointOutput
 */
- (void)describeEndpoint:(AWSSagemakerDescribeEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of an endpoint configuration created using the <code>CreateEndpointConfig</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpointConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeEndpointConfigOutput`.
 
 @see AWSSagemakerDescribeEndpointConfigInput
 @see AWSSagemakerDescribeEndpointConfigOutput
 */
- (AWSTask<AWSSagemakerDescribeEndpointConfigOutput *> *)describeEndpointConfig:(AWSSagemakerDescribeEndpointConfigInput *)request;

/**
 <p>Returns the description of an endpoint configuration created using the <code>CreateEndpointConfig</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEndpointConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDescribeEndpointConfigInput
 @see AWSSagemakerDescribeEndpointConfigOutput
 */
- (void)describeEndpointConfig:(AWSSagemakerDescribeEndpointConfigInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeEndpointConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of an experiment's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeExperimentRequest
 @see AWSSagemakerDescribeExperimentResponse
 */
- (AWSTask<AWSSagemakerDescribeExperimentResponse *> *)describeExperiment:(AWSSagemakerDescribeExperimentRequest *)request;

/**
 <p>Provides a list of an experiment's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeExperimentRequest
 @see AWSSagemakerDescribeExperimentResponse
 */
- (void)describeExperiment:(AWSSagemakerDescribeExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFlowDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeFlowDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeFlowDefinitionRequest
 @see AWSSagemakerDescribeFlowDefinitionResponse
 */
- (AWSTask<AWSSagemakerDescribeFlowDefinitionResponse *> *)describeFlowDefinition:(AWSSagemakerDescribeFlowDefinitionRequest *)request;

/**
 <p>Returns information about the specified flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFlowDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeFlowDefinitionRequest
 @see AWSSagemakerDescribeFlowDefinitionResponse
 */
- (void)describeFlowDefinition:(AWSSagemakerDescribeFlowDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeFlowDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the requested human task user interface.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHumanTaskUi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeHumanTaskUiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeHumanTaskUiRequest
 @see AWSSagemakerDescribeHumanTaskUiResponse
 */
- (AWSTask<AWSSagemakerDescribeHumanTaskUiResponse *> *)describeHumanTaskUi:(AWSSagemakerDescribeHumanTaskUiRequest *)request;

/**
 <p>Returns information about the requested human task user interface.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHumanTaskUi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeHumanTaskUiRequest
 @see AWSSagemakerDescribeHumanTaskUiResponse
 */
- (void)describeHumanTaskUi:(AWSSagemakerDescribeHumanTaskUiRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeHumanTaskUiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a description of a hyperparameter tuning job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeHyperParameterTuningJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeHyperParameterTuningJobRequest
 @see AWSSagemakerDescribeHyperParameterTuningJobResponse
 */
- (AWSTask<AWSSagemakerDescribeHyperParameterTuningJobResponse *> *)describeHyperParameterTuningJob:(AWSSagemakerDescribeHyperParameterTuningJobRequest *)request;

/**
 <p>Gets a description of a hyperparameter tuning job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeHyperParameterTuningJobRequest
 @see AWSSagemakerDescribeHyperParameterTuningJobResponse
 */
- (void)describeHyperParameterTuningJob:(AWSSagemakerDescribeHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeHyperParameterTuningJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a labeling job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLabelingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeLabelingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeLabelingJobRequest
 @see AWSSagemakerDescribeLabelingJobResponse
 */
- (AWSTask<AWSSagemakerDescribeLabelingJobResponse *> *)describeLabelingJob:(AWSSagemakerDescribeLabelingJobRequest *)request;

/**
 <p>Gets information about a labeling job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLabelingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeLabelingJobRequest
 @see AWSSagemakerDescribeLabelingJobResponse
 */
- (void)describeLabelingJob:(AWSSagemakerDescribeLabelingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeLabelingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a model that you created using the <code>CreateModel</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeModelOutput`.
 
 @see AWSSagemakerDescribeModelInput
 @see AWSSagemakerDescribeModelOutput
 */
- (AWSTask<AWSSagemakerDescribeModelOutput *> *)describeModel:(AWSSagemakerDescribeModelInput *)request;

/**
 <p>Describes a model that you created using the <code>CreateModel</code> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDescribeModelInput
 @see AWSSagemakerDescribeModelOutput
 */
- (void)describeModel:(AWSSagemakerDescribeModelInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeModelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the specified model package, which is used to create Amazon SageMaker models or list them on AWS Marketplace.</p><p>To create models in Amazon SageMaker, buyers can subscribe to model packages listed on AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModelPackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeModelPackageOutput`.
 
 @see AWSSagemakerDescribeModelPackageInput
 @see AWSSagemakerDescribeModelPackageOutput
 */
- (AWSTask<AWSSagemakerDescribeModelPackageOutput *> *)describeModelPackage:(AWSSagemakerDescribeModelPackageInput *)request;

/**
 <p>Returns a description of the specified model package, which is used to create Amazon SageMaker models or list them on AWS Marketplace.</p><p>To create models in Amazon SageMaker, buyers can subscribe to model packages listed on AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeModelPackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDescribeModelPackageInput
 @see AWSSagemakerDescribeModelPackageOutput
 */
- (void)describeModelPackage:(AWSSagemakerDescribeModelPackageInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeModelPackageOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the schedule for a monitoring job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeMonitoringScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeMonitoringScheduleRequest
 @see AWSSagemakerDescribeMonitoringScheduleResponse
 */
- (AWSTask<AWSSagemakerDescribeMonitoringScheduleResponse *> *)describeMonitoringSchedule:(AWSSagemakerDescribeMonitoringScheduleRequest *)request;

/**
 <p>Describes the schedule for a monitoring job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeMonitoringScheduleRequest
 @see AWSSagemakerDescribeMonitoringScheduleResponse
 */
- (void)describeMonitoringSchedule:(AWSSagemakerDescribeMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeMonitoringScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a notebook instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeNotebookInstanceOutput`.
 
 @see AWSSagemakerDescribeNotebookInstanceInput
 @see AWSSagemakerDescribeNotebookInstanceOutput
 */
- (AWSTask<AWSSagemakerDescribeNotebookInstanceOutput *> *)describeNotebookInstance:(AWSSagemakerDescribeNotebookInstanceInput *)request;

/**
 <p>Returns information about a notebook instance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDescribeNotebookInstanceInput
 @see AWSSagemakerDescribeNotebookInstanceOutput
 */
- (void)describeNotebookInstance:(AWSSagemakerDescribeNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeNotebookInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of a notebook instance lifecycle configuration.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput`.
 
 @see AWSSagemakerDescribeNotebookInstanceLifecycleConfigInput
 @see AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput
 */
- (AWSTask<AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput *> *)describeNotebookInstanceLifecycleConfig:(AWSSagemakerDescribeNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Returns a description of a notebook instance lifecycle configuration.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDescribeNotebookInstanceLifecycleConfigInput
 @see AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput
 */
- (void)describeNotebookInstanceLifecycleConfig:(AWSSagemakerDescribeNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of a processing job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProcessingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeProcessingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeProcessingJobRequest
 @see AWSSagemakerDescribeProcessingJobResponse
 */
- (AWSTask<AWSSagemakerDescribeProcessingJobResponse *> *)describeProcessingJob:(AWSSagemakerDescribeProcessingJobRequest *)request;

/**
 <p>Returns a description of a processing job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProcessingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeProcessingJobRequest
 @see AWSSagemakerDescribeProcessingJobResponse
 */
- (void)describeProcessingJob:(AWSSagemakerDescribeProcessingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeProcessingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a work team provided by a vendor. It returns details about the subscription with a vendor in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubscribedWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeSubscribedWorkteamResponse`.
 
 @see AWSSagemakerDescribeSubscribedWorkteamRequest
 @see AWSSagemakerDescribeSubscribedWorkteamResponse
 */
- (AWSTask<AWSSagemakerDescribeSubscribedWorkteamResponse *> *)describeSubscribedWorkteam:(AWSSagemakerDescribeSubscribedWorkteamRequest *)request;

/**
 <p>Gets information about a work team provided by a vendor. It returns details about the subscription with a vendor in the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubscribedWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDescribeSubscribedWorkteamRequest
 @see AWSSagemakerDescribeSubscribedWorkteamResponse
 */
- (void)describeSubscribedWorkteam:(AWSSagemakerDescribeSubscribedWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeSubscribedWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a training job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrainingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeTrainingJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeTrainingJobRequest
 @see AWSSagemakerDescribeTrainingJobResponse
 */
- (AWSTask<AWSSagemakerDescribeTrainingJobResponse *> *)describeTrainingJob:(AWSSagemakerDescribeTrainingJobRequest *)request;

/**
 <p>Returns information about a training job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrainingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeTrainingJobRequest
 @see AWSSagemakerDescribeTrainingJobResponse
 */
- (void)describeTrainingJob:(AWSSagemakerDescribeTrainingJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeTrainingJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a transform job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransformJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeTransformJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeTransformJobRequest
 @see AWSSagemakerDescribeTransformJobResponse
 */
- (AWSTask<AWSSagemakerDescribeTransformJobResponse *> *)describeTransformJob:(AWSSagemakerDescribeTransformJobRequest *)request;

/**
 <p>Returns information about a transform job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransformJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeTransformJobRequest
 @see AWSSagemakerDescribeTransformJobResponse
 */
- (void)describeTransformJob:(AWSSagemakerDescribeTransformJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeTransformJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of a trial's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeTrialRequest
 @see AWSSagemakerDescribeTrialResponse
 */
- (AWSTask<AWSSagemakerDescribeTrialResponse *> *)describeTrial:(AWSSagemakerDescribeTrialRequest *)request;

/**
 <p>Provides a list of a trial's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeTrialRequest
 @see AWSSagemakerDescribeTrialResponse
 */
- (void)describeTrial:(AWSSagemakerDescribeTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of a trials component's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeTrialComponentRequest
 @see AWSSagemakerDescribeTrialComponentResponse
 */
- (AWSTask<AWSSagemakerDescribeTrialComponentResponse *> *)describeTrialComponent:(AWSSagemakerDescribeTrialComponentRequest *)request;

/**
 <p>Provides a list of a trials component's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeTrialComponentRequest
 @see AWSSagemakerDescribeTrialComponentResponse
 */
- (void)describeTrialComponent:(AWSSagemakerDescribeTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a user profile. For more information, see <code>CreateUserProfile</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeUserProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeUserProfileRequest
 @see AWSSagemakerDescribeUserProfileResponse
 */
- (AWSTask<AWSSagemakerDescribeUserProfileResponse *> *)describeUserProfile:(AWSSagemakerDescribeUserProfileRequest *)request;

/**
 <p>Describes a user profile. For more information, see <code>CreateUserProfile</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDescribeUserProfileRequest
 @see AWSSagemakerDescribeUserProfileResponse
 */
- (void)describeUserProfile:(AWSSagemakerDescribeUserProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeUserProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists private workforce information, including workforce name, Amazon Resource Name (ARN), and, if applicable, allowed IP address ranges (<a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>). Allowable IP address ranges are the IP addresses that workers can use to access tasks. </p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the DescribeWorkforce service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeWorkforceResponse`.
 
 @see AWSSagemakerDescribeWorkforceRequest
 @see AWSSagemakerDescribeWorkforceResponse
 */
- (AWSTask<AWSSagemakerDescribeWorkforceResponse *> *)describeWorkforce:(AWSSagemakerDescribeWorkforceRequest *)request;

/**
 <p>Lists private workforce information, including workforce name, Amazon Resource Name (ARN), and, if applicable, allowed IP address ranges (<a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>). Allowable IP address ranges are the IP addresses that workers can use to access tasks. </p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the DescribeWorkforce service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDescribeWorkforceRequest
 @see AWSSagemakerDescribeWorkforceResponse
 */
- (void)describeWorkforce:(AWSSagemakerDescribeWorkforceRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeWorkforceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a specific work team. You can see information such as the create date, the last updated date, membership information, and the work team's Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the DescribeWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDescribeWorkteamResponse`.
 
 @see AWSSagemakerDescribeWorkteamRequest
 @see AWSSagemakerDescribeWorkteamResponse
 */
- (AWSTask<AWSSagemakerDescribeWorkteamResponse *> *)describeWorkteam:(AWSSagemakerDescribeWorkteamRequest *)request;

/**
 <p>Gets information about a specific work team. You can see information such as the create date, the last updated date, membership information, and the work team's Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the DescribeWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerDescribeWorkteamRequest
 @see AWSSagemakerDescribeWorkteamResponse
 */
- (void)describeWorkteam:(AWSSagemakerDescribeWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDescribeWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a trial component from a trial. This doesn't effect other trials the component is associated with. Before you can delete a component, you must disassociate the component from all trials it is associated with. To associate a trial component with a trial, call the <a>AssociateTrialComponent</a> API.</p><p>To get a list of the trials a component is associated with, use the <a>Search</a> API. Specify <code>ExperimentTrialComponent</code> for the <code>Resource</code> parameter. The list appears in the response under <code>Results.TrialComponent.Parents</code>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerDisassociateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDisassociateTrialComponentRequest
 @see AWSSagemakerDisassociateTrialComponentResponse
 */
- (AWSTask<AWSSagemakerDisassociateTrialComponentResponse *> *)disassociateTrialComponent:(AWSSagemakerDisassociateTrialComponentRequest *)request;

/**
 <p>Disassociates a trial component from a trial. This doesn't effect other trials the component is associated with. Before you can delete a component, you must disassociate the component from all trials it is associated with. To associate a trial component with a trial, call the <a>AssociateTrialComponent</a> API.</p><p>To get a list of the trials a component is associated with, use the <a>Search</a> API. Specify <code>ExperimentTrialComponent</code> for the <code>Resource</code> parameter. The list appears in the response under <code>Results.TrialComponent.Parents</code>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerDisassociateTrialComponentRequest
 @see AWSSagemakerDisassociateTrialComponentResponse
 */
- (void)disassociateTrialComponent:(AWSSagemakerDisassociateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerDisassociateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>An auto-complete API for the search functionality in the Amazon SageMaker console. It returns suggestions of possible matches for the property name to use in <code>Search</code> queries. Provides suggestions for <code>HyperParameters</code>, <code>Tags</code>, and <code>Metrics</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSearchSuggestions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerGetSearchSuggestionsResponse`.
 
 @see AWSSagemakerGetSearchSuggestionsRequest
 @see AWSSagemakerGetSearchSuggestionsResponse
 */
- (AWSTask<AWSSagemakerGetSearchSuggestionsResponse *> *)getSearchSuggestions:(AWSSagemakerGetSearchSuggestionsRequest *)request;

/**
 <p>An auto-complete API for the search functionality in the Amazon SageMaker console. It returns suggestions of possible matches for the property name to use in <code>Search</code> queries. Provides suggestions for <code>HyperParameters</code>, <code>Tags</code>, and <code>Metrics</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSearchSuggestions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerGetSearchSuggestionsRequest
 @see AWSSagemakerGetSearchSuggestionsResponse
 */
- (void)getSearchSuggestions:(AWSSagemakerGetSearchSuggestionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerGetSearchSuggestionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the machine learning algorithms that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListAlgorithms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListAlgorithmsOutput`.
 
 @see AWSSagemakerListAlgorithmsInput
 @see AWSSagemakerListAlgorithmsOutput
 */
- (AWSTask<AWSSagemakerListAlgorithmsOutput *> *)listAlgorithms:(AWSSagemakerListAlgorithmsInput *)request;

/**
 <p>Lists the machine learning algorithms that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListAlgorithms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListAlgorithmsInput
 @see AWSSagemakerListAlgorithmsOutput
 */
- (void)listAlgorithms:(AWSSagemakerListAlgorithmsInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListAlgorithmsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists apps.</p>
 
 @param request A container for the necessary parameters to execute the ListApps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListAppsResponse`.
 
 @see AWSSagemakerListAppsRequest
 @see AWSSagemakerListAppsResponse
 */
- (AWSTask<AWSSagemakerListAppsResponse *> *)listApps:(AWSSagemakerListAppsRequest *)request;

/**
 <p>Lists apps.</p>
 
 @param request A container for the necessary parameters to execute the ListApps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListAppsRequest
 @see AWSSagemakerListAppsResponse
 */
- (void)listApps:(AWSSagemakerListAppsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListAppsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Request a list of jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListAutoMLJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListAutoMLJobsResponse`.
 
 @see AWSSagemakerListAutoMLJobsRequest
 @see AWSSagemakerListAutoMLJobsResponse
 */
- (AWSTask<AWSSagemakerListAutoMLJobsResponse *> *)listAutoMLJobs:(AWSSagemakerListAutoMLJobsRequest *)request;

/**
 <p>Request a list of jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListAutoMLJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListAutoMLJobsRequest
 @see AWSSagemakerListAutoMLJobsResponse
 */
- (void)listAutoMLJobs:(AWSSagemakerListAutoMLJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListAutoMLJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the Candidates created for the job.</p>
 
 @param request A container for the necessary parameters to execute the ListCandidatesForAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListCandidatesForAutoMLJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerListCandidatesForAutoMLJobRequest
 @see AWSSagemakerListCandidatesForAutoMLJobResponse
 */
- (AWSTask<AWSSagemakerListCandidatesForAutoMLJobResponse *> *)listCandidatesForAutoMLJob:(AWSSagemakerListCandidatesForAutoMLJobRequest *)request;

/**
 <p>List the Candidates created for the job.</p>
 
 @param request A container for the necessary parameters to execute the ListCandidatesForAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerListCandidatesForAutoMLJobRequest
 @see AWSSagemakerListCandidatesForAutoMLJobResponse
 */
- (void)listCandidatesForAutoMLJob:(AWSSagemakerListCandidatesForAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListCandidatesForAutoMLJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the Git repositories in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListCodeRepositories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListCodeRepositoriesOutput`.
 
 @see AWSSagemakerListCodeRepositoriesInput
 @see AWSSagemakerListCodeRepositoriesOutput
 */
- (AWSTask<AWSSagemakerListCodeRepositoriesOutput *> *)listCodeRepositories:(AWSSagemakerListCodeRepositoriesInput *)request;

/**
 <p>Gets a list of the Git repositories in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListCodeRepositories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListCodeRepositoriesInput
 @see AWSSagemakerListCodeRepositoriesOutput
 */
- (void)listCodeRepositories:(AWSSagemakerListCodeRepositoriesInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListCodeRepositoriesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists model compilation jobs that satisfy various filters.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about a particular model compilation job you have created, use <a>DescribeCompilationJob</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListCompilationJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListCompilationJobsResponse`.
 
 @see AWSSagemakerListCompilationJobsRequest
 @see AWSSagemakerListCompilationJobsResponse
 */
- (AWSTask<AWSSagemakerListCompilationJobsResponse *> *)listCompilationJobs:(AWSSagemakerListCompilationJobsRequest *)request;

/**
 <p>Lists model compilation jobs that satisfy various filters.</p><p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about a particular model compilation job you have created, use <a>DescribeCompilationJob</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListCompilationJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListCompilationJobsRequest
 @see AWSSagemakerListCompilationJobsResponse
 */
- (void)listCompilationJobs:(AWSSagemakerListCompilationJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListCompilationJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the domains.</p>
 
 @param request A container for the necessary parameters to execute the ListDomains service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListDomainsResponse`.
 
 @see AWSSagemakerListDomainsRequest
 @see AWSSagemakerListDomainsResponse
 */
- (AWSTask<AWSSagemakerListDomainsResponse *> *)listDomains:(AWSSagemakerListDomainsRequest *)request;

/**
 <p>Lists the domains.</p>
 
 @param request A container for the necessary parameters to execute the ListDomains service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListDomainsRequest
 @see AWSSagemakerListDomainsResponse
 */
- (void)listDomains:(AWSSagemakerListDomainsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListDomainsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists endpoint configurations.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpointConfigs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListEndpointConfigsOutput`.
 
 @see AWSSagemakerListEndpointConfigsInput
 @see AWSSagemakerListEndpointConfigsOutput
 */
- (AWSTask<AWSSagemakerListEndpointConfigsOutput *> *)listEndpointConfigs:(AWSSagemakerListEndpointConfigsInput *)request;

/**
 <p>Lists endpoint configurations.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpointConfigs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListEndpointConfigsInput
 @see AWSSagemakerListEndpointConfigsOutput
 */
- (void)listEndpointConfigs:(AWSSagemakerListEndpointConfigsInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListEndpointConfigsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists endpoints.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListEndpointsOutput`.
 
 @see AWSSagemakerListEndpointsInput
 @see AWSSagemakerListEndpointsOutput
 */
- (AWSTask<AWSSagemakerListEndpointsOutput *> *)listEndpoints:(AWSSagemakerListEndpointsInput *)request;

/**
 <p>Lists endpoints.</p>
 
 @param request A container for the necessary parameters to execute the ListEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListEndpointsInput
 @see AWSSagemakerListEndpointsOutput
 */
- (void)listEndpoints:(AWSSagemakerListEndpointsInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListEndpointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the experiments in your account. The list can be filtered to show only experiments that were created in a specific time range. The list can be sorted by experiment name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListExperiments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListExperimentsResponse`.
 
 @see AWSSagemakerListExperimentsRequest
 @see AWSSagemakerListExperimentsResponse
 */
- (AWSTask<AWSSagemakerListExperimentsResponse *> *)listExperiments:(AWSSagemakerListExperimentsRequest *)request;

/**
 <p>Lists all the experiments in your account. The list can be filtered to show only experiments that were created in a specific time range. The list can be sorted by experiment name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListExperiments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListExperimentsRequest
 @see AWSSagemakerListExperimentsResponse
 */
- (void)listExperiments:(AWSSagemakerListExperimentsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListExperimentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the flow definitions in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListFlowDefinitions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListFlowDefinitionsResponse`.
 
 @see AWSSagemakerListFlowDefinitionsRequest
 @see AWSSagemakerListFlowDefinitionsResponse
 */
- (AWSTask<AWSSagemakerListFlowDefinitionsResponse *> *)listFlowDefinitions:(AWSSagemakerListFlowDefinitionsRequest *)request;

/**
 <p>Returns information about the flow definitions in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListFlowDefinitions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListFlowDefinitionsRequest
 @see AWSSagemakerListFlowDefinitionsResponse
 */
- (void)listFlowDefinitions:(AWSSagemakerListFlowDefinitionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListFlowDefinitionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the human task user interfaces in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHumanTaskUis service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListHumanTaskUisResponse`.
 
 @see AWSSagemakerListHumanTaskUisRequest
 @see AWSSagemakerListHumanTaskUisResponse
 */
- (AWSTask<AWSSagemakerListHumanTaskUisResponse *> *)listHumanTaskUis:(AWSSagemakerListHumanTaskUisRequest *)request;

/**
 <p>Returns information about the human task user interfaces in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHumanTaskUis service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListHumanTaskUisRequest
 @see AWSSagemakerListHumanTaskUisResponse
 */
- (void)listHumanTaskUis:(AWSSagemakerListHumanTaskUisRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListHumanTaskUisResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of <a>HyperParameterTuningJobSummary</a> objects that describe the hyperparameter tuning jobs launched in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHyperParameterTuningJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListHyperParameterTuningJobsResponse`.
 
 @see AWSSagemakerListHyperParameterTuningJobsRequest
 @see AWSSagemakerListHyperParameterTuningJobsResponse
 */
- (AWSTask<AWSSagemakerListHyperParameterTuningJobsResponse *> *)listHyperParameterTuningJobs:(AWSSagemakerListHyperParameterTuningJobsRequest *)request;

/**
 <p>Gets a list of <a>HyperParameterTuningJobSummary</a> objects that describe the hyperparameter tuning jobs launched in your account.</p>
 
 @param request A container for the necessary parameters to execute the ListHyperParameterTuningJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListHyperParameterTuningJobsRequest
 @see AWSSagemakerListHyperParameterTuningJobsResponse
 */
- (void)listHyperParameterTuningJobs:(AWSSagemakerListHyperParameterTuningJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListHyperParameterTuningJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of labeling jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListLabelingJobsResponse`.
 
 @see AWSSagemakerListLabelingJobsRequest
 @see AWSSagemakerListLabelingJobsResponse
 */
- (AWSTask<AWSSagemakerListLabelingJobsResponse *> *)listLabelingJobs:(AWSSagemakerListLabelingJobsRequest *)request;

/**
 <p>Gets a list of labeling jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListLabelingJobsRequest
 @see AWSSagemakerListLabelingJobsResponse
 */
- (void)listLabelingJobs:(AWSSagemakerListLabelingJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListLabelingJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of labeling jobs assigned to a specified work team.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobsForWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListLabelingJobsForWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerListLabelingJobsForWorkteamRequest
 @see AWSSagemakerListLabelingJobsForWorkteamResponse
 */
- (AWSTask<AWSSagemakerListLabelingJobsForWorkteamResponse *> *)listLabelingJobsForWorkteam:(AWSSagemakerListLabelingJobsForWorkteamRequest *)request;

/**
 <p>Gets a list of labeling jobs assigned to a specified work team.</p>
 
 @param request A container for the necessary parameters to execute the ListLabelingJobsForWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerListLabelingJobsForWorkteamRequest
 @see AWSSagemakerListLabelingJobsForWorkteamResponse
 */
- (void)listLabelingJobsForWorkteam:(AWSSagemakerListLabelingJobsForWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListLabelingJobsForWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the model packages that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListModelPackages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListModelPackagesOutput`.
 
 @see AWSSagemakerListModelPackagesInput
 @see AWSSagemakerListModelPackagesOutput
 */
- (AWSTask<AWSSagemakerListModelPackagesOutput *> *)listModelPackages:(AWSSagemakerListModelPackagesInput *)request;

/**
 <p>Lists the model packages that have been created.</p>
 
 @param request A container for the necessary parameters to execute the ListModelPackages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListModelPackagesInput
 @see AWSSagemakerListModelPackagesOutput
 */
- (void)listModelPackages:(AWSSagemakerListModelPackagesInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListModelPackagesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists models created with the <a>CreateModel</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListModelsOutput`.
 
 @see AWSSagemakerListModelsInput
 @see AWSSagemakerListModelsOutput
 */
- (AWSTask<AWSSagemakerListModelsOutput *> *)listModels:(AWSSagemakerListModelsInput *)request;

/**
 <p>Lists models created with the <a>CreateModel</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListModelsInput
 @see AWSSagemakerListModelsOutput
 */
- (void)listModels:(AWSSagemakerListModelsInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListModelsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns list of all monitoring job executions.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListMonitoringExecutionsResponse`.
 
 @see AWSSagemakerListMonitoringExecutionsRequest
 @see AWSSagemakerListMonitoringExecutionsResponse
 */
- (AWSTask<AWSSagemakerListMonitoringExecutionsResponse *> *)listMonitoringExecutions:(AWSSagemakerListMonitoringExecutionsRequest *)request;

/**
 <p>Returns list of all monitoring job executions.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListMonitoringExecutionsRequest
 @see AWSSagemakerListMonitoringExecutionsResponse
 */
- (void)listMonitoringExecutions:(AWSSagemakerListMonitoringExecutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListMonitoringExecutionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns list of all monitoring schedules.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringSchedules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListMonitoringSchedulesResponse`.
 
 @see AWSSagemakerListMonitoringSchedulesRequest
 @see AWSSagemakerListMonitoringSchedulesResponse
 */
- (AWSTask<AWSSagemakerListMonitoringSchedulesResponse *> *)listMonitoringSchedules:(AWSSagemakerListMonitoringSchedulesRequest *)request;

/**
 <p>Returns list of all monitoring schedules.</p>
 
 @param request A container for the necessary parameters to execute the ListMonitoringSchedules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListMonitoringSchedulesRequest
 @see AWSSagemakerListMonitoringSchedulesResponse
 */
- (void)listMonitoringSchedules:(AWSSagemakerListMonitoringSchedulesRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListMonitoringSchedulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists notebook instance lifestyle configurations created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstanceLifecycleConfigs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListNotebookInstanceLifecycleConfigsOutput`.
 
 @see AWSSagemakerListNotebookInstanceLifecycleConfigsInput
 @see AWSSagemakerListNotebookInstanceLifecycleConfigsOutput
 */
- (AWSTask<AWSSagemakerListNotebookInstanceLifecycleConfigsOutput *> *)listNotebookInstanceLifecycleConfigs:(AWSSagemakerListNotebookInstanceLifecycleConfigsInput *)request;

/**
 <p>Lists notebook instance lifestyle configurations created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstanceLifecycleConfigs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListNotebookInstanceLifecycleConfigsInput
 @see AWSSagemakerListNotebookInstanceLifecycleConfigsOutput
 */
- (void)listNotebookInstanceLifecycleConfigs:(AWSSagemakerListNotebookInstanceLifecycleConfigsInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListNotebookInstanceLifecycleConfigsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the Amazon SageMaker notebook instances in the requester's account in an AWS Region. </p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListNotebookInstancesOutput`.
 
 @see AWSSagemakerListNotebookInstancesInput
 @see AWSSagemakerListNotebookInstancesOutput
 */
- (AWSTask<AWSSagemakerListNotebookInstancesOutput *> *)listNotebookInstances:(AWSSagemakerListNotebookInstancesInput *)request;

/**
 <p>Returns a list of the Amazon SageMaker notebook instances in the requester's account in an AWS Region. </p>
 
 @param request A container for the necessary parameters to execute the ListNotebookInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListNotebookInstancesInput
 @see AWSSagemakerListNotebookInstancesOutput
 */
- (void)listNotebookInstances:(AWSSagemakerListNotebookInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListNotebookInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists processing jobs that satisfy various filters.</p>
 
 @param request A container for the necessary parameters to execute the ListProcessingJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListProcessingJobsResponse`.
 
 @see AWSSagemakerListProcessingJobsRequest
 @see AWSSagemakerListProcessingJobsResponse
 */
- (AWSTask<AWSSagemakerListProcessingJobsResponse *> *)listProcessingJobs:(AWSSagemakerListProcessingJobsRequest *)request;

/**
 <p>Lists processing jobs that satisfy various filters.</p>
 
 @param request A container for the necessary parameters to execute the ListProcessingJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListProcessingJobsRequest
 @see AWSSagemakerListProcessingJobsResponse
 */
- (void)listProcessingJobs:(AWSSagemakerListProcessingJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListProcessingJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the work teams that you are subscribed to in the AWS Marketplace. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscribedWorkteams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListSubscribedWorkteamsResponse`.
 
 @see AWSSagemakerListSubscribedWorkteamsRequest
 @see AWSSagemakerListSubscribedWorkteamsResponse
 */
- (AWSTask<AWSSagemakerListSubscribedWorkteamsResponse *> *)listSubscribedWorkteams:(AWSSagemakerListSubscribedWorkteamsRequest *)request;

/**
 <p>Gets a list of the work teams that you are subscribed to in the AWS Marketplace. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscribedWorkteams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListSubscribedWorkteamsRequest
 @see AWSSagemakerListSubscribedWorkteamsResponse
 */
- (void)listSubscribedWorkteams:(AWSSagemakerListSubscribedWorkteamsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListSubscribedWorkteamsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the tags for the specified Amazon SageMaker resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListTagsOutput`.
 
 @see AWSSagemakerListTagsInput
 @see AWSSagemakerListTagsOutput
 */
- (AWSTask<AWSSagemakerListTagsOutput *> *)listTags:(AWSSagemakerListTagsInput *)request;

/**
 <p>Returns the tags for the specified Amazon SageMaker resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListTagsInput
 @see AWSSagemakerListTagsOutput
 */
- (void)listTags:(AWSSagemakerListTagsInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists training jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListTrainingJobsResponse`.
 
 @see AWSSagemakerListTrainingJobsRequest
 @see AWSSagemakerListTrainingJobsResponse
 */
- (AWSTask<AWSSagemakerListTrainingJobsResponse *> *)listTrainingJobs:(AWSSagemakerListTrainingJobsRequest *)request;

/**
 <p>Lists training jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListTrainingJobsRequest
 @see AWSSagemakerListTrainingJobsResponse
 */
- (void)listTrainingJobs:(AWSSagemakerListTrainingJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListTrainingJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of <a>TrainingJobSummary</a> objects that describe the training jobs that a hyperparameter tuning job launched.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobsForHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerListTrainingJobsForHyperParameterTuningJobRequest
 @see AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse
 */
- (AWSTask<AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse *> *)listTrainingJobsForHyperParameterTuningJob:(AWSSagemakerListTrainingJobsForHyperParameterTuningJobRequest *)request;

/**
 <p>Gets a list of <a>TrainingJobSummary</a> objects that describe the training jobs that a hyperparameter tuning job launched.</p>
 
 @param request A container for the necessary parameters to execute the ListTrainingJobsForHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerListTrainingJobsForHyperParameterTuningJobRequest
 @see AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse
 */
- (void)listTrainingJobsForHyperParameterTuningJob:(AWSSagemakerListTrainingJobsForHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists transform jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTransformJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListTransformJobsResponse`.
 
 @see AWSSagemakerListTransformJobsRequest
 @see AWSSagemakerListTransformJobsResponse
 */
- (AWSTask<AWSSagemakerListTransformJobsResponse *> *)listTransformJobs:(AWSSagemakerListTransformJobsRequest *)request;

/**
 <p>Lists transform jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListTransformJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListTransformJobsRequest
 @see AWSSagemakerListTransformJobsResponse
 */
- (void)listTransformJobs:(AWSSagemakerListTransformJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListTransformJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the trial components in your account. You can sort the list by trial component name or creation time. You can filter the list to show only components that were created in a specific time range. You can also filter on one of the following:</p><ul><li><p><code>ExperimentName</code></p></li><li><p><code>SourceArn</code></p></li><li><p><code>TrialName</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListTrialComponents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListTrialComponentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerListTrialComponentsRequest
 @see AWSSagemakerListTrialComponentsResponse
 */
- (AWSTask<AWSSagemakerListTrialComponentsResponse *> *)listTrialComponents:(AWSSagemakerListTrialComponentsRequest *)request;

/**
 <p>Lists the trial components in your account. You can sort the list by trial component name or creation time. You can filter the list to show only components that were created in a specific time range. You can also filter on one of the following:</p><ul><li><p><code>ExperimentName</code></p></li><li><p><code>SourceArn</code></p></li><li><p><code>TrialName</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListTrialComponents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerListTrialComponentsRequest
 @see AWSSagemakerListTrialComponentsResponse
 */
- (void)listTrialComponents:(AWSSagemakerListTrialComponentsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListTrialComponentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the trials in your account. Specify an experiment name to limit the list to the trials that are part of that experiment. Specify a trial component name to limit the list to the trials that associated with that trial component. The list can be filtered to show only trials that were created in a specific time range. The list can be sorted by trial name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListTrials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListTrialsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerListTrialsRequest
 @see AWSSagemakerListTrialsResponse
 */
- (AWSTask<AWSSagemakerListTrialsResponse *> *)listTrials:(AWSSagemakerListTrialsRequest *)request;

/**
 <p>Lists the trials in your account. Specify an experiment name to limit the list to the trials that are part of that experiment. Specify a trial component name to limit the list to the trials that associated with that trial component. The list can be filtered to show only trials that were created in a specific time range. The list can be sorted by trial name or creation time.</p>
 
 @param request A container for the necessary parameters to execute the ListTrials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerListTrialsRequest
 @see AWSSagemakerListTrialsResponse
 */
- (void)listTrials:(AWSSagemakerListTrialsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListTrialsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists user profiles.</p>
 
 @param request A container for the necessary parameters to execute the ListUserProfiles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListUserProfilesResponse`.
 
 @see AWSSagemakerListUserProfilesRequest
 @see AWSSagemakerListUserProfilesResponse
 */
- (AWSTask<AWSSagemakerListUserProfilesResponse *> *)listUserProfiles:(AWSSagemakerListUserProfilesRequest *)request;

/**
 <p>Lists user profiles.</p>
 
 @param request A container for the necessary parameters to execute the ListUserProfiles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListUserProfilesRequest
 @see AWSSagemakerListUserProfilesResponse
 */
- (void)listUserProfiles:(AWSSagemakerListUserProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListUserProfilesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of work teams that you have defined in a region. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkteams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerListWorkteamsResponse`.
 
 @see AWSSagemakerListWorkteamsRequest
 @see AWSSagemakerListWorkteamsResponse
 */
- (AWSTask<AWSSagemakerListWorkteamsResponse *> *)listWorkteams:(AWSSagemakerListWorkteamsRequest *)request;

/**
 <p>Gets a list of work teams that you have defined in a region. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkteams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerListWorkteamsRequest
 @see AWSSagemakerListWorkteamsResponse
 */
- (void)listWorkteams:(AWSSagemakerListWorkteamsRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerListWorkteamsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Renders the UI template so that you can preview the worker's experience. </p>
 
 @param request A container for the necessary parameters to execute the RenderUiTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerRenderUiTemplateResponse`.
 
 @see AWSSagemakerRenderUiTemplateRequest
 @see AWSSagemakerRenderUiTemplateResponse
 */
- (AWSTask<AWSSagemakerRenderUiTemplateResponse *> *)renderUiTemplate:(AWSSagemakerRenderUiTemplateRequest *)request;

/**
 <p>Renders the UI template so that you can preview the worker's experience. </p>
 
 @param request A container for the necessary parameters to execute the RenderUiTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerRenderUiTemplateRequest
 @see AWSSagemakerRenderUiTemplateResponse
 */
- (void)renderUiTemplate:(AWSSagemakerRenderUiTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerRenderUiTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Finds Amazon SageMaker resources that match a search query. Matching resources are returned as a list of <code>SearchRecord</code> objects in the response. You can sort the search results by any resource property in a ascending or descending order.</p><p>You can query against the following value types: numeric, text, Boolean, and timestamp.</p>
 
 @param request A container for the necessary parameters to execute the Search service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerSearchResponse`.
 
 @see AWSSagemakerSearchRequest
 @see AWSSagemakerSearchResponse
 */
- (AWSTask<AWSSagemakerSearchResponse *> *)search:(AWSSagemakerSearchRequest *)request;

/**
 <p>Finds Amazon SageMaker resources that match a search query. Matching resources are returned as a list of <code>SearchRecord</code> objects in the response. You can sort the search results by any resource property in a ascending or descending order.</p><p>You can query against the following value types: numeric, text, Boolean, and timestamp.</p>
 
 @param request A container for the necessary parameters to execute the Search service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerSearchRequest
 @see AWSSagemakerSearchResponse
 */
- (void)search:(AWSSagemakerSearchRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerSearchResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a previously stopped monitoring schedule.</p><note><p>New monitoring schedules are immediately started after creation.</p></note>
 
 @param request A container for the necessary parameters to execute the StartMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStartMonitoringScheduleRequest
 */
- (AWSTask *)startMonitoringSchedule:(AWSSagemakerStartMonitoringScheduleRequest *)request;

/**
 <p>Starts a previously stopped monitoring schedule.</p><note><p>New monitoring schedules are immediately started after creation.</p></note>
 
 @param request A container for the necessary parameters to execute the StartMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStartMonitoringScheduleRequest
 */
- (void)startMonitoringSchedule:(AWSSagemakerStartMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Launches an ML compute instance with the latest version of the libraries and attaches your ML storage volume. After configuring the notebook instance, Amazon SageMaker sets the notebook instance status to <code>InService</code>. A notebook instance's status must be <code>InService</code> before you can connect to your Jupyter notebook. </p>
 
 @param request A container for the necessary parameters to execute the StartNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerStartNotebookInstanceInput
 */
- (AWSTask *)startNotebookInstance:(AWSSagemakerStartNotebookInstanceInput *)request;

/**
 <p>Launches an ML compute instance with the latest version of the libraries and attaches your ML storage volume. After configuring the notebook instance, Amazon SageMaker sets the notebook instance status to <code>InService</code>. A notebook instance's status must be <code>InService</code> before you can connect to your Jupyter notebook. </p>
 
 @param request A container for the necessary parameters to execute the StartNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerStartNotebookInstanceInput
 */
- (void)startNotebookInstance:(AWSSagemakerStartNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>A method for forcing the termination of a running job.</p>
 
 @param request A container for the necessary parameters to execute the StopAutoMLJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopAutoMLJobRequest
 */
- (AWSTask *)stopAutoMLJob:(AWSSagemakerStopAutoMLJobRequest *)request;

/**
 <p>A method for forcing the termination of a running job.</p>
 
 @param request A container for the necessary parameters to execute the StopAutoMLJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopAutoMLJobRequest
 */
- (void)stopAutoMLJob:(AWSSagemakerStopAutoMLJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a model compilation job.</p><p> To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal. This gracefully shuts the job down. If the job hasn't stopped, it sends the SIGKILL signal.</p><p>When it receives a <code>StopCompilationJob</code> request, Amazon SageMaker changes the <a>CompilationJobSummary$CompilationJobStatus</a> of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the <a>CompilationJobSummary$CompilationJobStatus</a> to <code>Stopped</code>. </p>
 
 @param request A container for the necessary parameters to execute the StopCompilationJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopCompilationJobRequest
 */
- (AWSTask *)stopCompilationJob:(AWSSagemakerStopCompilationJobRequest *)request;

/**
 <p>Stops a model compilation job.</p><p> To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal. This gracefully shuts the job down. If the job hasn't stopped, it sends the SIGKILL signal.</p><p>When it receives a <code>StopCompilationJob</code> request, Amazon SageMaker changes the <a>CompilationJobSummary$CompilationJobStatus</a> of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the <a>CompilationJobSummary$CompilationJobStatus</a> to <code>Stopped</code>. </p>
 
 @param request A container for the necessary parameters to execute the StopCompilationJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopCompilationJobRequest
 */
- (void)stopCompilationJob:(AWSSagemakerStopCompilationJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a running hyperparameter tuning job and all running training jobs that the tuning job launched.</p><p>All model artifacts output from the training jobs are stored in Amazon Simple Storage Service (Amazon S3). All data that the training jobs write to Amazon CloudWatch Logs are still available in CloudWatch. After the tuning job moves to the <code>Stopped</code> state, it releases all reserved resources for the tuning job.</p>
 
 @param request A container for the necessary parameters to execute the StopHyperParameterTuningJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopHyperParameterTuningJobRequest
 */
- (AWSTask *)stopHyperParameterTuningJob:(AWSSagemakerStopHyperParameterTuningJobRequest *)request;

/**
 <p>Stops a running hyperparameter tuning job and all running training jobs that the tuning job launched.</p><p>All model artifacts output from the training jobs are stored in Amazon Simple Storage Service (Amazon S3). All data that the training jobs write to Amazon CloudWatch Logs are still available in CloudWatch. After the tuning job moves to the <code>Stopped</code> state, it releases all reserved resources for the tuning job.</p>
 
 @param request A container for the necessary parameters to execute the StopHyperParameterTuningJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopHyperParameterTuningJobRequest
 */
- (void)stopHyperParameterTuningJob:(AWSSagemakerStopHyperParameterTuningJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a running labeling job. A job that is stopped cannot be restarted. Any results obtained before the job is stopped are placed in the Amazon S3 output bucket.</p>
 
 @param request A container for the necessary parameters to execute the StopLabelingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopLabelingJobRequest
 */
- (AWSTask *)stopLabelingJob:(AWSSagemakerStopLabelingJobRequest *)request;

/**
 <p>Stops a running labeling job. A job that is stopped cannot be restarted. Any results obtained before the job is stopped are placed in the Amazon S3 output bucket.</p>
 
 @param request A container for the necessary parameters to execute the StopLabelingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopLabelingJobRequest
 */
- (void)stopLabelingJob:(AWSSagemakerStopLabelingJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a previously started monitoring schedule.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopMonitoringScheduleRequest
 */
- (AWSTask *)stopMonitoringSchedule:(AWSSagemakerStopMonitoringScheduleRequest *)request;

/**
 <p>Stops a previously started monitoring schedule.</p>
 
 @param request A container for the necessary parameters to execute the StopMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopMonitoringScheduleRequest
 */
- (void)stopMonitoringSchedule:(AWSSagemakerStopMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Terminates the ML compute instance. Before terminating the instance, Amazon SageMaker disconnects the ML storage volume from it. Amazon SageMaker preserves the ML storage volume. Amazon SageMaker stops charging you for the ML compute instance when you call <code>StopNotebookInstance</code>.</p><p>To access data on the ML storage volume for a notebook instance that has been terminated, call the <code>StartNotebookInstance</code> API. <code>StartNotebookInstance</code> launches another ML compute instance, configures it, and attaches the preserved ML storage volume so you can continue your work. </p>
 
 @param request A container for the necessary parameters to execute the StopNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSagemakerStopNotebookInstanceInput
 */
- (AWSTask *)stopNotebookInstance:(AWSSagemakerStopNotebookInstanceInput *)request;

/**
 <p>Terminates the ML compute instance. Before terminating the instance, Amazon SageMaker disconnects the ML storage volume from it. Amazon SageMaker preserves the ML storage volume. Amazon SageMaker stops charging you for the ML compute instance when you call <code>StopNotebookInstance</code>.</p><p>To access data on the ML storage volume for a notebook instance that has been terminated, call the <code>StartNotebookInstance</code> API. <code>StartNotebookInstance</code> launches another ML compute instance, configures it, and attaches the preserved ML storage volume so you can continue your work. </p>
 
 @param request A container for the necessary parameters to execute the StopNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerStopNotebookInstanceInput
 */
- (void)stopNotebookInstance:(AWSSagemakerStopNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a processing job.</p>
 
 @param request A container for the necessary parameters to execute the StopProcessingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopProcessingJobRequest
 */
- (AWSTask *)stopProcessingJob:(AWSSagemakerStopProcessingJobRequest *)request;

/**
 <p>Stops a processing job.</p>
 
 @param request A container for the necessary parameters to execute the StopProcessingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopProcessingJobRequest
 */
- (void)stopProcessingJob:(AWSSagemakerStopProcessingJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a training job. To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms might use this 120-second window to save the model artifacts, so the results of the training is not lost. </p><p>When it receives a <code>StopTrainingJob</code> request, Amazon SageMaker changes the status of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the status to <code>Stopped</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopTrainingJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopTrainingJobRequest
 */
- (AWSTask *)stopTrainingJob:(AWSSagemakerStopTrainingJobRequest *)request;

/**
 <p>Stops a training job. To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms might use this 120-second window to save the model artifacts, so the results of the training is not lost. </p><p>When it receives a <code>StopTrainingJob</code> request, Amazon SageMaker changes the status of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the status to <code>Stopped</code>.</p>
 
 @param request A container for the necessary parameters to execute the StopTrainingJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopTrainingJobRequest
 */
- (void)stopTrainingJob:(AWSSagemakerStopTrainingJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Stops a transform job.</p><p>When Amazon SageMaker receives a <code>StopTransformJob</code> request, the status of the job changes to <code>Stopping</code>. After Amazon SageMaker stops the job, the status is set to <code>Stopped</code>. When you stop a transform job before it is completed, Amazon SageMaker doesn't store the job's output in Amazon S3.</p>
 
 @param request A container for the necessary parameters to execute the StopTransformJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopTransformJobRequest
 */
- (AWSTask *)stopTransformJob:(AWSSagemakerStopTransformJobRequest *)request;

/**
 <p>Stops a transform job.</p><p>When Amazon SageMaker receives a <code>StopTransformJob</code> request, the status of the job changes to <code>Stopping</code>. After Amazon SageMaker stops the job, the status is set to <code>Stopped</code>. When you stop a transform job before it is completed, Amazon SageMaker doesn't store the job's output in Amazon S3.</p>
 
 @param request A container for the necessary parameters to execute the StopTransformJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerStopTransformJobRequest
 */
- (void)stopTransformJob:(AWSSagemakerStopTransformJobRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified Git repository with the specified values.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCodeRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateCodeRepositoryOutput`.
 
 @see AWSSagemakerUpdateCodeRepositoryInput
 @see AWSSagemakerUpdateCodeRepositoryOutput
 */
- (AWSTask<AWSSagemakerUpdateCodeRepositoryOutput *> *)updateCodeRepository:(AWSSagemakerUpdateCodeRepositoryInput *)request;

/**
 <p>Updates the specified Git repository with the specified values.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCodeRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerUpdateCodeRepositoryInput
 @see AWSSagemakerUpdateCodeRepositoryOutput
 */
- (void)updateCodeRepository:(AWSSagemakerUpdateCodeRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateCodeRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the default settings for new user profiles in the domain.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateDomainRequest
 @see AWSSagemakerUpdateDomainResponse
 */
- (AWSTask<AWSSagemakerUpdateDomainResponse *> *)updateDomain:(AWSSagemakerUpdateDomainRequest *)request;

/**
 <p>Updates the default settings for new user profiles in the domain.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateDomainRequest
 @see AWSSagemakerUpdateDomainResponse
 */
- (void)updateDomain:(AWSSagemakerUpdateDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deploys the new <code>EndpointConfig</code> specified in the request, switches to using newly created endpoint, and then deletes resources provisioned for the endpoint using the previous <code>EndpointConfig</code> (there is no availability loss). </p><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p><note><p>You must not delete an <code>EndpointConfig</code> in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p><p>If you delete the <code>EndpointConfig</code> of an endpoint that is active or being created or updated you may lose visibility into the instance type the endpoint is using. The endpoint must be deleted in order to stop incurring charges.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateEndpointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerUpdateEndpointInput
 @see AWSSagemakerUpdateEndpointOutput
 */
- (AWSTask<AWSSagemakerUpdateEndpointOutput *> *)updateEndpoint:(AWSSagemakerUpdateEndpointInput *)request;

/**
 <p>Deploys the new <code>EndpointConfig</code> specified in the request, switches to using newly created endpoint, and then deletes resources provisioned for the endpoint using the previous <code>EndpointConfig</code> (there is no availability loss). </p><p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p><note><p>You must not delete an <code>EndpointConfig</code> in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p><p>If you delete the <code>EndpointConfig</code> of an endpoint that is active or being created or updated you may lose visibility into the instance type the endpoint is using. The endpoint must be deleted in order to stop incurring charges.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerUpdateEndpointInput
 @see AWSSagemakerUpdateEndpointOutput
 */
- (void)updateEndpoint:(AWSSagemakerUpdateEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates variant weight of one or more variants associated with an existing endpoint, or capacity of one variant associated with an existing endpoint. When it receives the request, Amazon SageMaker sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpointWeightsAndCapacities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerUpdateEndpointWeightsAndCapacitiesInput
 @see AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput
 */
- (AWSTask<AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput *> *)updateEndpointWeightsAndCapacities:(AWSSagemakerUpdateEndpointWeightsAndCapacitiesInput *)request;

/**
 <p>Updates variant weight of one or more variants associated with an existing endpoint, or capacity of one variant associated with an existing endpoint. When it receives the request, Amazon SageMaker sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p>
 
 @param request A container for the necessary parameters to execute the UpdateEndpointWeightsAndCapacities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerUpdateEndpointWeightsAndCapacitiesInput
 @see AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput
 */
- (void)updateEndpointWeightsAndCapacities:(AWSSagemakerUpdateEndpointWeightsAndCapacitiesInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds, updates, or removes the description of an experiment. Updates the display name of an experiment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateExperiment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateExperimentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorConflict`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateExperimentRequest
 @see AWSSagemakerUpdateExperimentResponse
 */
- (AWSTask<AWSSagemakerUpdateExperimentResponse *> *)updateExperiment:(AWSSagemakerUpdateExperimentRequest *)request;

/**
 <p>Adds, updates, or removes the description of an experiment. Updates the display name of an experiment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateExperiment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorConflict`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateExperimentRequest
 @see AWSSagemakerUpdateExperimentResponse
 */
- (void)updateExperiment:(AWSSagemakerUpdateExperimentRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateExperimentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a previously created schedule.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMonitoringSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateMonitoringScheduleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateMonitoringScheduleRequest
 @see AWSSagemakerUpdateMonitoringScheduleResponse
 */
- (AWSTask<AWSSagemakerUpdateMonitoringScheduleResponse *> *)updateMonitoringSchedule:(AWSSagemakerUpdateMonitoringScheduleRequest *)request;

/**
 <p>Updates a previously created schedule.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMonitoringSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateMonitoringScheduleRequest
 @see AWSSagemakerUpdateMonitoringScheduleResponse
 */
- (void)updateMonitoringSchedule:(AWSSagemakerUpdateMonitoringScheduleRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateMonitoringScheduleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a notebook instance. NotebookInstance updates include upgrading or downgrading the ML compute instance used for your notebook instance to accommodate changes in your workload requirements.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateNotebookInstanceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerUpdateNotebookInstanceInput
 @see AWSSagemakerUpdateNotebookInstanceOutput
 */
- (AWSTask<AWSSagemakerUpdateNotebookInstanceOutput *> *)updateNotebookInstance:(AWSSagemakerUpdateNotebookInstanceInput *)request;

/**
 <p>Updates a notebook instance. NotebookInstance updates include upgrading or downgrading the ML compute instance used for your notebook instance to accommodate changes in your workload requirements.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerUpdateNotebookInstanceInput
 @see AWSSagemakerUpdateNotebookInstanceOutput
 */
- (void)updateNotebookInstance:(AWSSagemakerUpdateNotebookInstanceInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateNotebookInstanceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a notebook instance lifecycle configuration created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstanceLifecycleConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerUpdateNotebookInstanceLifecycleConfigInput
 @see AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput
 */
- (AWSTask<AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput *> *)updateNotebookInstanceLifecycleConfig:(AWSSagemakerUpdateNotebookInstanceLifecycleConfigInput *)request;

/**
 <p>Updates a notebook instance lifecycle configuration created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>
 
 @param request A container for the necessary parameters to execute the UpdateNotebookInstanceLifecycleConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerUpdateNotebookInstanceLifecycleConfigInput
 @see AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput
 */
- (void)updateNotebookInstanceLifecycleConfig:(AWSSagemakerUpdateNotebookInstanceLifecycleConfigInput *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the display name of a trial.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrial service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateTrialResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorConflict`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateTrialRequest
 @see AWSSagemakerUpdateTrialResponse
 */
- (AWSTask<AWSSagemakerUpdateTrialResponse *> *)updateTrial:(AWSSagemakerUpdateTrialRequest *)request;

/**
 <p>Updates the display name of a trial.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrial service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorConflict`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateTrialRequest
 @see AWSSagemakerUpdateTrialResponse
 */
- (void)updateTrial:(AWSSagemakerUpdateTrialRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateTrialResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates one or more properties of a trial component.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrialComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateTrialComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorConflict`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateTrialComponentRequest
 @see AWSSagemakerUpdateTrialComponentResponse
 */
- (AWSTask<AWSSagemakerUpdateTrialComponentResponse *> *)updateTrialComponent:(AWSSagemakerUpdateTrialComponentRequest *)request;

/**
 <p>Updates one or more properties of a trial component.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTrialComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorConflict`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateTrialComponentRequest
 @see AWSSagemakerUpdateTrialComponentResponse
 */
- (void)updateTrialComponent:(AWSSagemakerUpdateTrialComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateTrialComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a user profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateUserProfileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateUserProfileRequest
 @see AWSSagemakerUpdateUserProfileResponse
 */
- (AWSTask<AWSSagemakerUpdateUserProfileResponse *> *)updateUserProfile:(AWSSagemakerUpdateUserProfileRequest *)request;

/**
 <p>Updates a user profile.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`, `AWSSagemakerErrorResourceInUse`, `AWSSagemakerErrorResourceNotFound`.
 
 @see AWSSagemakerUpdateUserProfileRequest
 @see AWSSagemakerUpdateUserProfileResponse
 */
- (void)updateUserProfile:(AWSSagemakerUpdateUserProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateUserProfileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Restricts access to tasks assigned to workers in the specified workforce to those within specific ranges of IP addresses. You specify allowed IP addresses by creating a list of up to four <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>.</p><p>By default, a workforce isn't restricted to specific IP addresses. If you specify a range of IP addresses, workers who attempt to access tasks using any IP address outside the specified range are denied access and get a <code>Not Found</code> error message on the worker portal. After restricting access with this operation, you can see the allowed IP values for a private workforce with the operation.</p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateWorkforce service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateWorkforceResponse`.
 
 @see AWSSagemakerUpdateWorkforceRequest
 @see AWSSagemakerUpdateWorkforceResponse
 */
- (AWSTask<AWSSagemakerUpdateWorkforceResponse *> *)updateWorkforce:(AWSSagemakerUpdateWorkforceRequest *)request;

/**
 <p>Restricts access to tasks assigned to workers in the specified workforce to those within specific ranges of IP addresses. You specify allowed IP addresses by creating a list of up to four <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>.</p><p>By default, a workforce isn't restricted to specific IP addresses. If you specify a range of IP addresses, workers who attempt to access tasks using any IP address outside the specified range are denied access and get a <code>Not Found</code> error message on the worker portal. After restricting access with this operation, you can see the allowed IP values for a private workforce with the operation.</p><important><p>This operation applies only to private workforces.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateWorkforce service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSagemakerUpdateWorkforceRequest
 @see AWSSagemakerUpdateWorkforceResponse
 */
- (void)updateWorkforce:(AWSSagemakerUpdateWorkforceRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateWorkforceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing work team with new member definitions or description.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkteam service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSagemakerUpdateWorkteamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerUpdateWorkteamRequest
 @see AWSSagemakerUpdateWorkteamResponse
 */
- (AWSTask<AWSSagemakerUpdateWorkteamResponse *> *)updateWorkteam:(AWSSagemakerUpdateWorkteamRequest *)request;

/**
 <p>Updates an existing work team with new member definitions or description.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkteam service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSagemakerErrorDomain` domain and the following error code: `AWSSagemakerErrorResourceLimitExceeded`.
 
 @see AWSSagemakerUpdateWorkteamRequest
 @see AWSSagemakerUpdateWorkteamResponse
 */
- (void)updateWorkteam:(AWSSagemakerUpdateWorkteamRequest *)request completionHandler:(void (^ _Nullable)(AWSSagemakerUpdateWorkteamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
