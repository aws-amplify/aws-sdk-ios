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
#import "AWSaccess-analyzerModel.h"
#import "AWSaccess-analyzerResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSaccess-analyzer
FOUNDATION_EXPORT NSString *const AWSaccess-analyzerSDKVersion;

/**
 <p>AWS IAM Access Analyzer helps identify potential resource-access risks by enabling you to identify any policies that grant access to an external principal. It does this by using logic-based reasoning to analyze resource-based policies in your AWS environment. An external principal can be another AWS account, a root user, an IAM user or role, a federated user, an AWS service, or an anonymous user. This guide describes the AWS IAM Access Analyzer operations that you can call programmatically. For general information about Access Analyzer, see the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html">AWS IAM Access Analyzer section of the IAM User Guide</a>.</p><p>To start using Access Analyzer, you first need to create an analyzer.</p>
 */
@interface AWSaccess-analyzer : AWSService

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

     let access-analyzer = AWSaccess-analyzer.default()

 *Objective-C*

     AWSaccess-analyzer *access-analyzer = [AWSaccess-analyzer defaultaccess-analyzer];

 @return The default service client.
 */
+ (instancetype)defaultaccess-analyzer;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSaccess-analyzer.register(with: configuration!, forKey: "USWest2access-analyzer")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:@"USWest2access-analyzer"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let access-analyzer = AWSaccess-analyzer(forKey: "USWest2access-analyzer")

 *Objective-C*

     AWSaccess-analyzer *access-analyzer = [AWSaccess-analyzer access-analyzerForKey:@"USWest2access-analyzer"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registeraccess-analyzerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registeraccess-analyzerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSaccess-analyzer.register(with: configuration!, forKey: "USWest2access-analyzer")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:@"USWest2access-analyzer"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let access-analyzer = AWSaccess-analyzer(forKey: "USWest2access-analyzer")

 *Objective-C*

     AWSaccess-analyzer *access-analyzer = [AWSaccess-analyzer access-analyzerForKey:@"USWest2access-analyzer"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)access-analyzerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeaccess-analyzerForKey:(NSString *)key;

/**
 <p>Creates an analyzer for your account.</p>
 
 @param request A container for the necessary parameters to execute the CreateAnalyzer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerCreateAnalyzerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorConflict`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorServiceQuotaExceeded`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerCreateAnalyzerRequest
 @see AWSaccess-analyzerCreateAnalyzerResponse
 */
- (AWSTask<AWSaccess-analyzerCreateAnalyzerResponse *> *)createAnalyzer:(AWSaccess-analyzerCreateAnalyzerRequest *)request;

/**
 <p>Creates an analyzer for your account.</p>
 
 @param request A container for the necessary parameters to execute the CreateAnalyzer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorConflict`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorServiceQuotaExceeded`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerCreateAnalyzerRequest
 @see AWSaccess-analyzerCreateAnalyzerResponse
 */
- (void)createAnalyzer:(AWSaccess-analyzerCreateAnalyzerRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerCreateAnalyzerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an archive rule for the specified analyzer. Archive rules automatically archive findings that meet the criteria you define when you create the rule.</p>
 
 @param request A container for the necessary parameters to execute the CreateArchiveRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorConflict`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorServiceQuotaExceeded`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerCreateArchiveRuleRequest
 */
- (AWSTask *)createArchiveRule:(AWSaccess-analyzerCreateArchiveRuleRequest *)request;

/**
 <p>Creates an archive rule for the specified analyzer. Archive rules automatically archive findings that meet the criteria you define when you create the rule.</p>
 
 @param request A container for the necessary parameters to execute the CreateArchiveRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorConflict`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorServiceQuotaExceeded`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerCreateArchiveRuleRequest
 */
- (void)createArchiveRule:(AWSaccess-analyzerCreateArchiveRuleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified analyzer. When you delete an analyzer, Access Analyzer is disabled for the account in the current or specific Region. All findings that were generated by the analyzer are deleted. You cannot undo this action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAnalyzer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerDeleteAnalyzerRequest
 */
- (AWSTask *)deleteAnalyzer:(AWSaccess-analyzerDeleteAnalyzerRequest *)request;

/**
 <p>Deletes the specified analyzer. When you delete an analyzer, Access Analyzer is disabled for the account in the current or specific Region. All findings that were generated by the analyzer are deleted. You cannot undo this action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAnalyzer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerDeleteAnalyzerRequest
 */
- (void)deleteAnalyzer:(AWSaccess-analyzerDeleteAnalyzerRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified archive rule.</p>
 
 @param request A container for the necessary parameters to execute the DeleteArchiveRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerDeleteArchiveRuleRequest
 */
- (AWSTask *)deleteArchiveRule:(AWSaccess-analyzerDeleteArchiveRuleRequest *)request;

/**
 <p>Deletes the specified archive rule.</p>
 
 @param request A container for the necessary parameters to execute the DeleteArchiveRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerDeleteArchiveRuleRequest
 */
- (void)deleteArchiveRule:(AWSaccess-analyzerDeleteArchiveRuleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a resource that was analyzed.</p>
 
 @param request A container for the necessary parameters to execute the GetAnalyzedResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerGetAnalyzedResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerGetAnalyzedResourceRequest
 @see AWSaccess-analyzerGetAnalyzedResourceResponse
 */
- (AWSTask<AWSaccess-analyzerGetAnalyzedResourceResponse *> *)getAnalyzedResource:(AWSaccess-analyzerGetAnalyzedResourceRequest *)request;

/**
 <p>Retrieves information about a resource that was analyzed.</p>
 
 @param request A container for the necessary parameters to execute the GetAnalyzedResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerGetAnalyzedResourceRequest
 @see AWSaccess-analyzerGetAnalyzedResourceResponse
 */
- (void)getAnalyzedResource:(AWSaccess-analyzerGetAnalyzedResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerGetAnalyzedResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the specified analyzer.</p>
 
 @param request A container for the necessary parameters to execute the GetAnalyzer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerGetAnalyzerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerGetAnalyzerRequest
 @see AWSaccess-analyzerGetAnalyzerResponse
 */
- (AWSTask<AWSaccess-analyzerGetAnalyzerResponse *> *)getAnalyzer:(AWSaccess-analyzerGetAnalyzerRequest *)request;

/**
 <p>Retrieves information about the specified analyzer.</p>
 
 @param request A container for the necessary parameters to execute the GetAnalyzer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerGetAnalyzerRequest
 @see AWSaccess-analyzerGetAnalyzerResponse
 */
- (void)getAnalyzer:(AWSaccess-analyzerGetAnalyzerRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerGetAnalyzerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about an archive rule.</p>
 
 @param request A container for the necessary parameters to execute the GetArchiveRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerGetArchiveRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerGetArchiveRuleRequest
 @see AWSaccess-analyzerGetArchiveRuleResponse
 */
- (AWSTask<AWSaccess-analyzerGetArchiveRuleResponse *> *)getArchiveRule:(AWSaccess-analyzerGetArchiveRuleRequest *)request;

/**
 <p>Retrieves information about an archive rule.</p>
 
 @param request A container for the necessary parameters to execute the GetArchiveRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerGetArchiveRuleRequest
 @see AWSaccess-analyzerGetArchiveRuleResponse
 */
- (void)getArchiveRule:(AWSaccess-analyzerGetArchiveRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerGetArchiveRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the specified finding.</p>
 
 @param request A container for the necessary parameters to execute the GetFinding service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerGetFindingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerGetFindingRequest
 @see AWSaccess-analyzerGetFindingResponse
 */
- (AWSTask<AWSaccess-analyzerGetFindingResponse *> *)getFinding:(AWSaccess-analyzerGetFindingRequest *)request;

/**
 <p>Retrieves information about the specified finding.</p>
 
 @param request A container for the necessary parameters to execute the GetFinding service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerGetFindingRequest
 @see AWSaccess-analyzerGetFindingResponse
 */
- (void)getFinding:(AWSaccess-analyzerGetFindingRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerGetFindingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of resources of the specified type that have been analyzed by the specified analyzer..</p>
 
 @param request A container for the necessary parameters to execute the ListAnalyzedResources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerListAnalyzedResourcesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerListAnalyzedResourcesRequest
 @see AWSaccess-analyzerListAnalyzedResourcesResponse
 */
- (AWSTask<AWSaccess-analyzerListAnalyzedResourcesResponse *> *)listAnalyzedResources:(AWSaccess-analyzerListAnalyzedResourcesRequest *)request;

/**
 <p>Retrieves a list of resources of the specified type that have been analyzed by the specified analyzer..</p>
 
 @param request A container for the necessary parameters to execute the ListAnalyzedResources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerListAnalyzedResourcesRequest
 @see AWSaccess-analyzerListAnalyzedResourcesResponse
 */
- (void)listAnalyzedResources:(AWSaccess-analyzerListAnalyzedResourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerListAnalyzedResourcesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of analyzers.</p>
 
 @param request A container for the necessary parameters to execute the ListAnalyzers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerListAnalyzersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerListAnalyzersRequest
 @see AWSaccess-analyzerListAnalyzersResponse
 */
- (AWSTask<AWSaccess-analyzerListAnalyzersResponse *> *)listAnalyzers:(AWSaccess-analyzerListAnalyzersRequest *)request;

/**
 <p>Retrieves a list of analyzers.</p>
 
 @param request A container for the necessary parameters to execute the ListAnalyzers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerListAnalyzersRequest
 @see AWSaccess-analyzerListAnalyzersResponse
 */
- (void)listAnalyzers:(AWSaccess-analyzerListAnalyzersRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerListAnalyzersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of archive rules created for the specified analyzer.</p>
 
 @param request A container for the necessary parameters to execute the ListArchiveRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerListArchiveRulesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerListArchiveRulesRequest
 @see AWSaccess-analyzerListArchiveRulesResponse
 */
- (AWSTask<AWSaccess-analyzerListArchiveRulesResponse *> *)listArchiveRules:(AWSaccess-analyzerListArchiveRulesRequest *)request;

/**
 <p>Retrieves a list of archive rules created for the specified analyzer.</p>
 
 @param request A container for the necessary parameters to execute the ListArchiveRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerListArchiveRulesRequest
 @see AWSaccess-analyzerListArchiveRulesResponse
 */
- (void)listArchiveRules:(AWSaccess-analyzerListArchiveRulesRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerListArchiveRulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of findings generated by the specified analyzer.</p>
 
 @param request A container for the necessary parameters to execute the ListFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerListFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerListFindingsRequest
 @see AWSaccess-analyzerListFindingsResponse
 */
- (AWSTask<AWSaccess-analyzerListFindingsResponse *> *)listFindings:(AWSaccess-analyzerListFindingsRequest *)request;

/**
 <p>Retrieves a list of findings generated by the specified analyzer.</p>
 
 @param request A container for the necessary parameters to execute the ListFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerListFindingsRequest
 @see AWSaccess-analyzerListFindingsResponse
 */
- (void)listFindings:(AWSaccess-analyzerListFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerListFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of tags applied to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerListTagsForResourceRequest
 @see AWSaccess-analyzerListTagsForResourceResponse
 */
- (AWSTask<AWSaccess-analyzerListTagsForResourceResponse *> *)listTagsForResource:(AWSaccess-analyzerListTagsForResourceRequest *)request;

/**
 <p>Retrieves a list of tags applied to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerListTagsForResourceRequest
 @see AWSaccess-analyzerListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSaccess-analyzerListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Immediately starts a scan of the policies applied to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the StartResourceScan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerStartResourceScanRequest
 */
- (AWSTask *)startResourceScan:(AWSaccess-analyzerStartResourceScanRequest *)request;

/**
 <p>Immediately starts a scan of the policies applied to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the StartResourceScan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerStartResourceScanRequest
 */
- (void)startResourceScan:(AWSaccess-analyzerStartResourceScanRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds a tag to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerTagResourceRequest
 @see AWSaccess-analyzerTagResourceResponse
 */
- (AWSTask<AWSaccess-analyzerTagResourceResponse *> *)tagResource:(AWSaccess-analyzerTagResourceRequest *)request;

/**
 <p>Adds a tag to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerTagResourceRequest
 @see AWSaccess-analyzerTagResourceResponse
 */
- (void)tagResource:(AWSaccess-analyzerTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a tag from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSaccess-analyzerUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerUntagResourceRequest
 @see AWSaccess-analyzerUntagResourceResponse
 */
- (AWSTask<AWSaccess-analyzerUntagResourceResponse *> *)untagResource:(AWSaccess-analyzerUntagResourceRequest *)request;

/**
 <p>Removes a tag from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerUntagResourceRequest
 @see AWSaccess-analyzerUntagResourceResponse
 */
- (void)untagResource:(AWSaccess-analyzerUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSaccess-analyzerUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the criteria and values for the specified archive rule.</p>
 
 @param request A container for the necessary parameters to execute the UpdateArchiveRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerUpdateArchiveRuleRequest
 */
- (AWSTask *)updateArchiveRule:(AWSaccess-analyzerUpdateArchiveRuleRequest *)request;

/**
 <p>Updates the criteria and values for the specified archive rule.</p>
 
 @param request A container for the necessary parameters to execute the UpdateArchiveRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerUpdateArchiveRuleRequest
 */
- (void)updateArchiveRule:(AWSaccess-analyzerUpdateArchiveRuleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the status for the specified findings.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerUpdateFindingsRequest
 */
- (AWSTask *)updateFindings:(AWSaccess-analyzerUpdateFindingsRequest *)request;

/**
 <p>Updates the status for the specified findings.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSaccess-analyzerErrorDomain` domain and the following error code: `AWSaccess-analyzerErrorResourceNotFound`, `AWSaccess-analyzerErrorValidation`, `AWSaccess-analyzerErrorInternalServer`, `AWSaccess-analyzerErrorThrottling`, `AWSaccess-analyzerErrorAccessDenied`.
 
 @see AWSaccess-analyzerUpdateFindingsRequest
 */
- (void)updateFindings:(AWSaccess-analyzerUpdateFindingsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
