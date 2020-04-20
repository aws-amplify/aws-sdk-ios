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
#import "AWSapigatewayModel.h"
#import "AWSapigatewayResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSapigateway
FOUNDATION_EXPORT NSString *const AWSapigatewaySDKVersion;

/**
 <p>Amazon API Gateway V2</p>
 */
@interface AWSapigateway : AWSService

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

     let apigateway = AWSapigateway.default()

 *Objective-C*

     AWSapigateway *apigateway = [AWSapigateway defaultapigateway];

 @return The default service client.
 */
+ (instancetype)defaultapigateway;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapigateway.register(with: configuration!, forKey: "USWest2apigateway")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapigateway registerapigatewayWithConfiguration:configuration forKey:@"USWest2apigateway"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let apigateway = AWSapigateway(forKey: "USWest2apigateway")

 *Objective-C*

     AWSapigateway *apigateway = [AWSapigateway apigatewayForKey:@"USWest2apigateway"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerapigatewayWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerapigatewayWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapigateway.register(with: configuration!, forKey: "USWest2apigateway")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapigateway registerapigatewayWithConfiguration:configuration forKey:@"USWest2apigateway"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let apigateway = AWSapigateway(forKey: "USWest2apigateway")

 *Objective-C*

     AWSapigateway *apigateway = [AWSapigateway apigatewayForKey:@"USWest2apigateway"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)apigatewayForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeapigatewayForKey:(NSString *)key;

/**
 <p>Creates an Api resource.</p>
 
 @param request A container for the necessary parameters to execute the CreateApi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateApiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateApiRequest
 @see AWSapigatewayCreateApiResponse
 */
- (AWSTask<AWSapigatewayCreateApiResponse *> *)createApi:(AWSapigatewayCreateApiRequest *)request;

/**
 <p>Creates an Api resource.</p>
 
 @param request A container for the necessary parameters to execute the CreateApi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateApiRequest
 @see AWSapigatewayCreateApiResponse
 */
- (void)createApi:(AWSapigatewayCreateApiRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateApiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an API mapping.</p>
 
 @param request A container for the necessary parameters to execute the CreateApiMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateApiMappingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateApiMappingRequest
 @see AWSapigatewayCreateApiMappingResponse
 */
- (AWSTask<AWSapigatewayCreateApiMappingResponse *> *)createApiMapping:(AWSapigatewayCreateApiMappingRequest *)request;

/**
 <p>Creates an API mapping.</p>
 
 @param request A container for the necessary parameters to execute the CreateApiMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateApiMappingRequest
 @see AWSapigatewayCreateApiMappingResponse
 */
- (void)createApiMapping:(AWSapigatewayCreateApiMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateApiMappingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Authorizer for an API.</p>
 
 @param request A container for the necessary parameters to execute the CreateAuthorizer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateAuthorizerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateAuthorizerRequest
 @see AWSapigatewayCreateAuthorizerResponse
 */
- (AWSTask<AWSapigatewayCreateAuthorizerResponse *> *)createAuthorizer:(AWSapigatewayCreateAuthorizerRequest *)request;

/**
 <p>Creates an Authorizer for an API.</p>
 
 @param request A container for the necessary parameters to execute the CreateAuthorizer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateAuthorizerRequest
 @see AWSapigatewayCreateAuthorizerResponse
 */
- (void)createAuthorizer:(AWSapigatewayCreateAuthorizerRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateAuthorizerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Deployment for an API.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateDeploymentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateDeploymentRequest
 @see AWSapigatewayCreateDeploymentResponse
 */
- (AWSTask<AWSapigatewayCreateDeploymentResponse *> *)createDeployment:(AWSapigatewayCreateDeploymentRequest *)request;

/**
 <p>Creates a Deployment for an API.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateDeploymentRequest
 @see AWSapigatewayCreateDeploymentResponse
 */
- (void)createDeployment:(AWSapigatewayCreateDeploymentRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateDeploymentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a domain name.</p>
 
 @param request A container for the necessary parameters to execute the CreateDomainName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateDomainNameResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`, `AWSapigatewayErrorAccessDenied`.
 
 @see AWSapigatewayCreateDomainNameRequest
 @see AWSapigatewayCreateDomainNameResponse
 */
- (AWSTask<AWSapigatewayCreateDomainNameResponse *> *)createDomainName:(AWSapigatewayCreateDomainNameRequest *)request;

/**
 <p>Creates a domain name.</p>
 
 @param request A container for the necessary parameters to execute the CreateDomainName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`, `AWSapigatewayErrorAccessDenied`.
 
 @see AWSapigatewayCreateDomainNameRequest
 @see AWSapigatewayCreateDomainNameResponse
 */
- (void)createDomainName:(AWSapigatewayCreateDomainNameRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateDomainNameResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Integration.</p>
 
 @param request A container for the necessary parameters to execute the CreateIntegration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateIntegrationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateIntegrationRequest
 @see AWSapigatewayCreateIntegrationResult
 */
- (AWSTask<AWSapigatewayCreateIntegrationResult *> *)createIntegration:(AWSapigatewayCreateIntegrationRequest *)request;

/**
 <p>Creates an Integration.</p>
 
 @param request A container for the necessary parameters to execute the CreateIntegration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateIntegrationRequest
 @see AWSapigatewayCreateIntegrationResult
 */
- (void)createIntegration:(AWSapigatewayCreateIntegrationRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateIntegrationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an IntegrationResponses.</p>
 
 @param request A container for the necessary parameters to execute the CreateIntegrationResponse service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateIntegrationResponseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateIntegrationResponseRequest
 @see AWSapigatewayCreateIntegrationResponseResponse
 */
- (AWSTask<AWSapigatewayCreateIntegrationResponseResponse *> *)createIntegrationResponse:(AWSapigatewayCreateIntegrationResponseRequest *)request;

/**
 <p>Creates an IntegrationResponses.</p>
 
 @param request A container for the necessary parameters to execute the CreateIntegrationResponse service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateIntegrationResponseRequest
 @see AWSapigatewayCreateIntegrationResponseResponse
 */
- (void)createIntegrationResponse:(AWSapigatewayCreateIntegrationResponseRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateIntegrationResponseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Model for an API.</p>
 
 @param request A container for the necessary parameters to execute the CreateModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateModelRequest
 @see AWSapigatewayCreateModelResponse
 */
- (AWSTask<AWSapigatewayCreateModelResponse *> *)createModel:(AWSapigatewayCreateModelRequest *)request;

/**
 <p>Creates a Model for an API.</p>
 
 @param request A container for the necessary parameters to execute the CreateModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateModelRequest
 @see AWSapigatewayCreateModelResponse
 */
- (void)createModel:(AWSapigatewayCreateModelRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Route for an API.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateRouteResult`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateRouteRequest
 @see AWSapigatewayCreateRouteResult
 */
- (AWSTask<AWSapigatewayCreateRouteResult *> *)createRoute:(AWSapigatewayCreateRouteRequest *)request;

/**
 <p>Creates a Route for an API.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateRouteRequest
 @see AWSapigatewayCreateRouteResult
 */
- (void)createRoute:(AWSapigatewayCreateRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a RouteResponse for a Route.</p>
 
 @param request A container for the necessary parameters to execute the CreateRouteResponse service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateRouteResponseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateRouteResponseRequest
 @see AWSapigatewayCreateRouteResponseResponse
 */
- (AWSTask<AWSapigatewayCreateRouteResponseResponse *> *)createRouteResponse:(AWSapigatewayCreateRouteResponseRequest *)request;

/**
 <p>Creates a RouteResponse for a Route.</p>
 
 @param request A container for the necessary parameters to execute the CreateRouteResponse service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateRouteResponseRequest
 @see AWSapigatewayCreateRouteResponseResponse
 */
- (void)createRouteResponse:(AWSapigatewayCreateRouteResponseRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateRouteResponseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Stage for an API.</p>
 
 @param request A container for the necessary parameters to execute the CreateStage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateStageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateStageRequest
 @see AWSapigatewayCreateStageResponse
 */
- (AWSTask<AWSapigatewayCreateStageResponse *> *)createStage:(AWSapigatewayCreateStageRequest *)request;

/**
 <p>Creates a Stage for an API.</p>
 
 @param request A container for the necessary parameters to execute the CreateStage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayCreateStageRequest
 @see AWSapigatewayCreateStageResponse
 */
- (void)createStage:(AWSapigatewayCreateStageRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateStageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a VPC link.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcLink service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayCreateVpcLinkResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayCreateVpcLinkRequest
 @see AWSapigatewayCreateVpcLinkResponse
 */
- (AWSTask<AWSapigatewayCreateVpcLinkResponse *> *)createVpcLink:(AWSapigatewayCreateVpcLinkRequest *)request;

/**
 <p>Creates a VPC link.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcLink service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayCreateVpcLinkRequest
 @see AWSapigatewayCreateVpcLinkResponse
 */
- (void)createVpcLink:(AWSapigatewayCreateVpcLinkRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayCreateVpcLinkResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the AccessLogSettings for a Stage. To disable access logging for a Stage, delete its AccessLogSettings.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessLogSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteAccessLogSettingsRequest
 */
- (AWSTask *)deleteAccessLogSettings:(AWSapigatewayDeleteAccessLogSettingsRequest *)request;

/**
 <p>Deletes the AccessLogSettings for a Stage. To disable access logging for a Stage, delete its AccessLogSettings.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessLogSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteAccessLogSettingsRequest
 */
- (void)deleteAccessLogSettings:(AWSapigatewayDeleteAccessLogSettingsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Api resource.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteApiRequest
 */
- (AWSTask *)deleteApi:(AWSapigatewayDeleteApiRequest *)request;

/**
 <p>Deletes an Api resource.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteApiRequest
 */
- (void)deleteApi:(AWSapigatewayDeleteApiRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an API mapping.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApiMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayDeleteApiMappingRequest
 */
- (AWSTask *)deleteApiMapping:(AWSapigatewayDeleteApiMappingRequest *)request;

/**
 <p>Deletes an API mapping.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApiMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayDeleteApiMappingRequest
 */
- (void)deleteApiMapping:(AWSapigatewayDeleteApiMappingRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Authorizer.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAuthorizer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteAuthorizerRequest
 */
- (AWSTask *)deleteAuthorizer:(AWSapigatewayDeleteAuthorizerRequest *)request;

/**
 <p>Deletes an Authorizer.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAuthorizer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteAuthorizerRequest
 */
- (void)deleteAuthorizer:(AWSapigatewayDeleteAuthorizerRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a CORS configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCorsConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteCorsConfigurationRequest
 */
- (AWSTask *)deleteCorsConfiguration:(AWSapigatewayDeleteCorsConfigurationRequest *)request;

/**
 <p>Deletes a CORS configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCorsConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteCorsConfigurationRequest
 */
- (void)deleteCorsConfiguration:(AWSapigatewayDeleteCorsConfigurationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Deployment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteDeploymentRequest
 */
- (AWSTask *)deleteDeployment:(AWSapigatewayDeleteDeploymentRequest *)request;

/**
 <p>Deletes a Deployment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteDeploymentRequest
 */
- (void)deleteDeployment:(AWSapigatewayDeleteDeploymentRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a domain name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDomainName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteDomainNameRequest
 */
- (AWSTask *)deleteDomainName:(AWSapigatewayDeleteDomainNameRequest *)request;

/**
 <p>Deletes a domain name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDomainName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteDomainNameRequest
 */
- (void)deleteDomainName:(AWSapigatewayDeleteDomainNameRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Integration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIntegration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteIntegrationRequest
 */
- (AWSTask *)deleteIntegration:(AWSapigatewayDeleteIntegrationRequest *)request;

/**
 <p>Deletes an Integration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIntegration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteIntegrationRequest
 */
- (void)deleteIntegration:(AWSapigatewayDeleteIntegrationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an IntegrationResponses.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIntegrationResponse service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteIntegrationResponseRequest
 */
- (AWSTask *)deleteIntegrationResponse:(AWSapigatewayDeleteIntegrationResponseRequest *)request;

/**
 <p>Deletes an IntegrationResponses.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIntegrationResponse service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteIntegrationResponseRequest
 */
- (void)deleteIntegrationResponse:(AWSapigatewayDeleteIntegrationResponseRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Model.</p>
 
 @param request A container for the necessary parameters to execute the DeleteModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteModelRequest
 */
- (AWSTask *)deleteModel:(AWSapigatewayDeleteModelRequest *)request;

/**
 <p>Deletes a Model.</p>
 
 @param request A container for the necessary parameters to execute the DeleteModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteModelRequest
 */
- (void)deleteModel:(AWSapigatewayDeleteModelRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Route.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteRouteRequest
 */
- (AWSTask *)deleteRoute:(AWSapigatewayDeleteRouteRequest *)request;

/**
 <p>Deletes a Route.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteRouteRequest
 */
- (void)deleteRoute:(AWSapigatewayDeleteRouteRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a route request parameter.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRouteRequestParameter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteRouteRequestParameterRequest
 */
- (AWSTask *)deleteRouteRequestParameter:(AWSapigatewayDeleteRouteRequestParameterRequest *)request;

/**
 <p>Deletes a route request parameter.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRouteRequestParameter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteRouteRequestParameterRequest
 */
- (void)deleteRouteRequestParameter:(AWSapigatewayDeleteRouteRequestParameterRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a RouteResponse.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRouteResponse service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteRouteResponseRequest
 */
- (AWSTask *)deleteRouteResponse:(AWSapigatewayDeleteRouteResponseRequest *)request;

/**
 <p>Deletes a RouteResponse.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRouteResponse service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteRouteResponseRequest
 */
- (void)deleteRouteResponse:(AWSapigatewayDeleteRouteResponseRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the RouteSettings for a stage.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRouteSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteRouteSettingsRequest
 */
- (AWSTask *)deleteRouteSettings:(AWSapigatewayDeleteRouteSettingsRequest *)request;

/**
 <p>Deletes the RouteSettings for a stage.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRouteSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteRouteSettingsRequest
 */
- (void)deleteRouteSettings:(AWSapigatewayDeleteRouteSettingsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Stage.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteStageRequest
 */
- (AWSTask *)deleteStage:(AWSapigatewayDeleteStageRequest *)request;

/**
 <p>Deletes a Stage.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteStageRequest
 */
- (void)deleteStage:(AWSapigatewayDeleteStageRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a VPC link.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpcLink service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayDeleteVpcLinkResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteVpcLinkRequest
 @see AWSapigatewayDeleteVpcLinkResponse
 */
- (AWSTask<AWSapigatewayDeleteVpcLinkResponse *> *)deleteVpcLink:(AWSapigatewayDeleteVpcLinkRequest *)request;

/**
 <p>Deletes a VPC link.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpcLink service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayDeleteVpcLinkRequest
 @see AWSapigatewayDeleteVpcLinkResponse
 */
- (void)deleteVpcLink:(AWSapigatewayDeleteVpcLinkRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayDeleteVpcLinkResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ExportApi
 
 @param request A container for the necessary parameters to execute the ExportApi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayExportApiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayExportApiRequest
 @see AWSapigatewayExportApiResponse
 */
- (AWSTask<AWSapigatewayExportApiResponse *> *)exportApi:(AWSapigatewayExportApiRequest *)request;

/**
 ExportApi
 
 @param request A container for the necessary parameters to execute the ExportApi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayExportApiRequest
 @see AWSapigatewayExportApiResponse
 */
- (void)exportApi:(AWSapigatewayExportApiRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayExportApiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets an Api resource.</p>
 
 @param request A container for the necessary parameters to execute the GetApi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetApiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetApiRequest
 @see AWSapigatewayGetApiResponse
 */
- (AWSTask<AWSapigatewayGetApiResponse *> *)getApi:(AWSapigatewayGetApiRequest *)request;

/**
 <p>Gets an Api resource.</p>
 
 @param request A container for the necessary parameters to execute the GetApi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetApiRequest
 @see AWSapigatewayGetApiResponse
 */
- (void)getApi:(AWSapigatewayGetApiRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetApiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets an API mapping.</p>
 
 @param request A container for the necessary parameters to execute the GetApiMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetApiMappingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetApiMappingRequest
 @see AWSapigatewayGetApiMappingResponse
 */
- (AWSTask<AWSapigatewayGetApiMappingResponse *> *)getApiMapping:(AWSapigatewayGetApiMappingRequest *)request;

/**
 <p>Gets an API mapping.</p>
 
 @param request A container for the necessary parameters to execute the GetApiMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetApiMappingRequest
 @see AWSapigatewayGetApiMappingResponse
 */
- (void)getApiMapping:(AWSapigatewayGetApiMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetApiMappingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets API mappings.</p>
 
 @param request A container for the necessary parameters to execute the GetApiMappings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetApiMappingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetApiMappingsRequest
 @see AWSapigatewayGetApiMappingsResponse
 */
- (AWSTask<AWSapigatewayGetApiMappingsResponse *> *)getApiMappings:(AWSapigatewayGetApiMappingsRequest *)request;

/**
 <p>Gets API mappings.</p>
 
 @param request A container for the necessary parameters to execute the GetApiMappings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetApiMappingsRequest
 @see AWSapigatewayGetApiMappingsResponse
 */
- (void)getApiMappings:(AWSapigatewayGetApiMappingsRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetApiMappingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a collection of Api resources.</p>
 
 @param request A container for the necessary parameters to execute the GetApis service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetApisResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetApisRequest
 @see AWSapigatewayGetApisResponse
 */
- (AWSTask<AWSapigatewayGetApisResponse *> *)getApis:(AWSapigatewayGetApisRequest *)request;

/**
 <p>Gets a collection of Api resources.</p>
 
 @param request A container for the necessary parameters to execute the GetApis service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetApisRequest
 @see AWSapigatewayGetApisResponse
 */
- (void)getApis:(AWSapigatewayGetApisRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetApisResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets an Authorizer.</p>
 
 @param request A container for the necessary parameters to execute the GetAuthorizer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetAuthorizerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetAuthorizerRequest
 @see AWSapigatewayGetAuthorizerResponse
 */
- (AWSTask<AWSapigatewayGetAuthorizerResponse *> *)getAuthorizer:(AWSapigatewayGetAuthorizerRequest *)request;

/**
 <p>Gets an Authorizer.</p>
 
 @param request A container for the necessary parameters to execute the GetAuthorizer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetAuthorizerRequest
 @see AWSapigatewayGetAuthorizerResponse
 */
- (void)getAuthorizer:(AWSapigatewayGetAuthorizerRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetAuthorizerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the Authorizers for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetAuthorizers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetAuthorizersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetAuthorizersRequest
 @see AWSapigatewayGetAuthorizersResponse
 */
- (AWSTask<AWSapigatewayGetAuthorizersResponse *> *)getAuthorizers:(AWSapigatewayGetAuthorizersRequest *)request;

/**
 <p>Gets the Authorizers for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetAuthorizers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetAuthorizersRequest
 @see AWSapigatewayGetAuthorizersResponse
 */
- (void)getAuthorizers:(AWSapigatewayGetAuthorizersRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetAuthorizersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a Deployment.</p>
 
 @param request A container for the necessary parameters to execute the GetDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetDeploymentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetDeploymentRequest
 @see AWSapigatewayGetDeploymentResponse
 */
- (AWSTask<AWSapigatewayGetDeploymentResponse *> *)getDeployment:(AWSapigatewayGetDeploymentRequest *)request;

/**
 <p>Gets a Deployment.</p>
 
 @param request A container for the necessary parameters to execute the GetDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetDeploymentRequest
 @see AWSapigatewayGetDeploymentResponse
 */
- (void)getDeployment:(AWSapigatewayGetDeploymentRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetDeploymentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the Deployments for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetDeployments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetDeploymentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetDeploymentsRequest
 @see AWSapigatewayGetDeploymentsResponse
 */
- (AWSTask<AWSapigatewayGetDeploymentsResponse *> *)getDeployments:(AWSapigatewayGetDeploymentsRequest *)request;

/**
 <p>Gets the Deployments for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetDeployments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetDeploymentsRequest
 @see AWSapigatewayGetDeploymentsResponse
 */
- (void)getDeployments:(AWSapigatewayGetDeploymentsRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetDeploymentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a domain name.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetDomainNameResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetDomainNameRequest
 @see AWSapigatewayGetDomainNameResponse
 */
- (AWSTask<AWSapigatewayGetDomainNameResponse *> *)getDomainName:(AWSapigatewayGetDomainNameRequest *)request;

/**
 <p>Gets a domain name.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetDomainNameRequest
 @see AWSapigatewayGetDomainNameResponse
 */
- (void)getDomainName:(AWSapigatewayGetDomainNameRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetDomainNameResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the domain names for an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainNames service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetDomainNamesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetDomainNamesRequest
 @see AWSapigatewayGetDomainNamesResponse
 */
- (AWSTask<AWSapigatewayGetDomainNamesResponse *> *)getDomainNames:(AWSapigatewayGetDomainNamesRequest *)request;

/**
 <p>Gets the domain names for an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainNames service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetDomainNamesRequest
 @see AWSapigatewayGetDomainNamesResponse
 */
- (void)getDomainNames:(AWSapigatewayGetDomainNamesRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetDomainNamesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets an Integration.</p>
 
 @param request A container for the necessary parameters to execute the GetIntegration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetIntegrationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetIntegrationRequest
 @see AWSapigatewayGetIntegrationResult
 */
- (AWSTask<AWSapigatewayGetIntegrationResult *> *)getIntegration:(AWSapigatewayGetIntegrationRequest *)request;

/**
 <p>Gets an Integration.</p>
 
 @param request A container for the necessary parameters to execute the GetIntegration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetIntegrationRequest
 @see AWSapigatewayGetIntegrationResult
 */
- (void)getIntegration:(AWSapigatewayGetIntegrationRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetIntegrationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets an IntegrationResponses.</p>
 
 @param request A container for the necessary parameters to execute the GetIntegrationResponse service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetIntegrationResponseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetIntegrationResponseRequest
 @see AWSapigatewayGetIntegrationResponseResponse
 */
- (AWSTask<AWSapigatewayGetIntegrationResponseResponse *> *)getIntegrationResponse:(AWSapigatewayGetIntegrationResponseRequest *)request;

/**
 <p>Gets an IntegrationResponses.</p>
 
 @param request A container for the necessary parameters to execute the GetIntegrationResponse service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetIntegrationResponseRequest
 @see AWSapigatewayGetIntegrationResponseResponse
 */
- (void)getIntegrationResponse:(AWSapigatewayGetIntegrationResponseRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetIntegrationResponseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the IntegrationResponses for an Integration.</p>
 
 @param request A container for the necessary parameters to execute the GetIntegrationResponses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetIntegrationResponsesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetIntegrationResponsesRequest
 @see AWSapigatewayGetIntegrationResponsesResponse
 */
- (AWSTask<AWSapigatewayGetIntegrationResponsesResponse *> *)getIntegrationResponses:(AWSapigatewayGetIntegrationResponsesRequest *)request;

/**
 <p>Gets the IntegrationResponses for an Integration.</p>
 
 @param request A container for the necessary parameters to execute the GetIntegrationResponses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetIntegrationResponsesRequest
 @see AWSapigatewayGetIntegrationResponsesResponse
 */
- (void)getIntegrationResponses:(AWSapigatewayGetIntegrationResponsesRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetIntegrationResponsesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the Integrations for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetIntegrations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetIntegrationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetIntegrationsRequest
 @see AWSapigatewayGetIntegrationsResponse
 */
- (AWSTask<AWSapigatewayGetIntegrationsResponse *> *)getIntegrations:(AWSapigatewayGetIntegrationsRequest *)request;

/**
 <p>Gets the Integrations for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetIntegrations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetIntegrationsRequest
 @see AWSapigatewayGetIntegrationsResponse
 */
- (void)getIntegrations:(AWSapigatewayGetIntegrationsRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetIntegrationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a Model.</p>
 
 @param request A container for the necessary parameters to execute the GetModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetModelRequest
 @see AWSapigatewayGetModelResponse
 */
- (AWSTask<AWSapigatewayGetModelResponse *> *)getModel:(AWSapigatewayGetModelRequest *)request;

/**
 <p>Gets a Model.</p>
 
 @param request A container for the necessary parameters to execute the GetModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetModelRequest
 @see AWSapigatewayGetModelResponse
 */
- (void)getModel:(AWSapigatewayGetModelRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a model template.</p>
 
 @param request A container for the necessary parameters to execute the GetModelTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetModelTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetModelTemplateRequest
 @see AWSapigatewayGetModelTemplateResponse
 */
- (AWSTask<AWSapigatewayGetModelTemplateResponse *> *)getModelTemplate:(AWSapigatewayGetModelTemplateRequest *)request;

/**
 <p>Gets a model template.</p>
 
 @param request A container for the necessary parameters to execute the GetModelTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetModelTemplateRequest
 @see AWSapigatewayGetModelTemplateResponse
 */
- (void)getModelTemplate:(AWSapigatewayGetModelTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetModelTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the Models for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetModelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetModelsRequest
 @see AWSapigatewayGetModelsResponse
 */
- (AWSTask<AWSapigatewayGetModelsResponse *> *)getModels:(AWSapigatewayGetModelsRequest *)request;

/**
 <p>Gets the Models for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetModelsRequest
 @see AWSapigatewayGetModelsResponse
 */
- (void)getModels:(AWSapigatewayGetModelsRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetModelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a Route.</p>
 
 @param request A container for the necessary parameters to execute the GetRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetRouteResult`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetRouteRequest
 @see AWSapigatewayGetRouteResult
 */
- (AWSTask<AWSapigatewayGetRouteResult *> *)getRoute:(AWSapigatewayGetRouteRequest *)request;

/**
 <p>Gets a Route.</p>
 
 @param request A container for the necessary parameters to execute the GetRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetRouteRequest
 @see AWSapigatewayGetRouteResult
 */
- (void)getRoute:(AWSapigatewayGetRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a RouteResponse.</p>
 
 @param request A container for the necessary parameters to execute the GetRouteResponse service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetRouteResponseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetRouteResponseRequest
 @see AWSapigatewayGetRouteResponseResponse
 */
- (AWSTask<AWSapigatewayGetRouteResponseResponse *> *)getRouteResponse:(AWSapigatewayGetRouteResponseRequest *)request;

/**
 <p>Gets a RouteResponse.</p>
 
 @param request A container for the necessary parameters to execute the GetRouteResponse service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetRouteResponseRequest
 @see AWSapigatewayGetRouteResponseResponse
 */
- (void)getRouteResponse:(AWSapigatewayGetRouteResponseRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetRouteResponseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the RouteResponses for a Route.</p>
 
 @param request A container for the necessary parameters to execute the GetRouteResponses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetRouteResponsesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetRouteResponsesRequest
 @see AWSapigatewayGetRouteResponsesResponse
 */
- (AWSTask<AWSapigatewayGetRouteResponsesResponse *> *)getRouteResponses:(AWSapigatewayGetRouteResponsesRequest *)request;

/**
 <p>Gets the RouteResponses for a Route.</p>
 
 @param request A container for the necessary parameters to execute the GetRouteResponses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetRouteResponsesRequest
 @see AWSapigatewayGetRouteResponsesResponse
 */
- (void)getRouteResponses:(AWSapigatewayGetRouteResponsesRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetRouteResponsesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the Routes for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetRoutes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetRoutesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetRoutesRequest
 @see AWSapigatewayGetRoutesResponse
 */
- (AWSTask<AWSapigatewayGetRoutesResponse *> *)getRoutes:(AWSapigatewayGetRoutesRequest *)request;

/**
 <p>Gets the Routes for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetRoutes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetRoutesRequest
 @see AWSapigatewayGetRoutesResponse
 */
- (void)getRoutes:(AWSapigatewayGetRoutesRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetRoutesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a Stage.</p>
 
 @param request A container for the necessary parameters to execute the GetStage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetStageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetStageRequest
 @see AWSapigatewayGetStageResponse
 */
- (AWSTask<AWSapigatewayGetStageResponse *> *)getStage:(AWSapigatewayGetStageRequest *)request;

/**
 <p>Gets a Stage.</p>
 
 @param request A container for the necessary parameters to execute the GetStage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetStageRequest
 @see AWSapigatewayGetStageResponse
 */
- (void)getStage:(AWSapigatewayGetStageRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetStageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the Stages for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetStages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetStagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetStagesRequest
 @see AWSapigatewayGetStagesResponse
 */
- (AWSTask<AWSapigatewayGetStagesResponse *> *)getStages:(AWSapigatewayGetStagesRequest *)request;

/**
 <p>Gets the Stages for an API.</p>
 
 @param request A container for the necessary parameters to execute the GetStages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayGetStagesRequest
 @see AWSapigatewayGetStagesResponse
 */
- (void)getStages:(AWSapigatewayGetStagesRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetStagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a collection of Tag resources.</p>
 
 @param request A container for the necessary parameters to execute the GetTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayGetTagsRequest
 @see AWSapigatewayGetTagsResponse
 */
- (AWSTask<AWSapigatewayGetTagsResponse *> *)getTags:(AWSapigatewayGetTagsRequest *)request;

/**
 <p>Gets a collection of Tag resources.</p>
 
 @param request A container for the necessary parameters to execute the GetTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayGetTagsRequest
 @see AWSapigatewayGetTagsResponse
 */
- (void)getTags:(AWSapigatewayGetTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a VPC link.</p>
 
 @param request A container for the necessary parameters to execute the GetVpcLink service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetVpcLinkResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetVpcLinkRequest
 @see AWSapigatewayGetVpcLinkResponse
 */
- (AWSTask<AWSapigatewayGetVpcLinkResponse *> *)getVpcLink:(AWSapigatewayGetVpcLinkRequest *)request;

/**
 <p>Gets a VPC link.</p>
 
 @param request A container for the necessary parameters to execute the GetVpcLink service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetVpcLinkRequest
 @see AWSapigatewayGetVpcLinkResponse
 */
- (void)getVpcLink:(AWSapigatewayGetVpcLinkRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetVpcLinkResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a collection of VPC links.</p>
 
 @param request A container for the necessary parameters to execute the GetVpcLinks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayGetVpcLinksResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetVpcLinksRequest
 @see AWSapigatewayGetVpcLinksResponse
 */
- (AWSTask<AWSapigatewayGetVpcLinksResponse *> *)getVpcLinks:(AWSapigatewayGetVpcLinksRequest *)request;

/**
 <p>Gets a collection of VPC links.</p>
 
 @param request A container for the necessary parameters to execute the GetVpcLinks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorTooManyRequests`.
 
 @see AWSapigatewayGetVpcLinksRequest
 @see AWSapigatewayGetVpcLinksResponse
 */
- (void)getVpcLinks:(AWSapigatewayGetVpcLinksRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayGetVpcLinksResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports an API.</p>
 
 @param request A container for the necessary parameters to execute the ImportApi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayImportApiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayImportApiRequest
 @see AWSapigatewayImportApiResponse
 */
- (AWSTask<AWSapigatewayImportApiResponse *> *)importApi:(AWSapigatewayImportApiRequest *)request;

/**
 <p>Imports an API.</p>
 
 @param request A container for the necessary parameters to execute the ImportApi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayImportApiRequest
 @see AWSapigatewayImportApiResponse
 */
- (void)importApi:(AWSapigatewayImportApiRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayImportApiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Puts an Api resource.</p>
 
 @param request A container for the necessary parameters to execute the ReimportApi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayReimportApiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayReimportApiRequest
 @see AWSapigatewayReimportApiResponse
 */
- (AWSTask<AWSapigatewayReimportApiResponse *> *)reimportApi:(AWSapigatewayReimportApiRequest *)request;

/**
 <p>Puts an Api resource.</p>
 
 @param request A container for the necessary parameters to execute the ReimportApi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayReimportApiRequest
 @see AWSapigatewayReimportApiResponse
 */
- (void)reimportApi:(AWSapigatewayReimportApiRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayReimportApiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Tag resource to represent a tag.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayTagResourceRequest
 @see AWSapigatewayTagResourceResponse
 */
- (AWSTask<AWSapigatewayTagResourceResponse *> *)tagResource:(AWSapigatewayTagResourceRequest *)request;

/**
 <p>Creates a new Tag resource to represent a tag.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayTagResourceRequest
 @see AWSapigatewayTagResourceResponse
 */
- (void)tagResource:(AWSapigatewayTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Tag.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSapigatewayUntagResourceRequest *)request;

/**
 <p>Deletes a Tag.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUntagResourceRequest
 */
- (void)untagResource:(AWSapigatewayUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates an Api resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApi service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateApiResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateApiRequest
 @see AWSapigatewayUpdateApiResponse
 */
- (AWSTask<AWSapigatewayUpdateApiResponse *> *)updateApi:(AWSapigatewayUpdateApiRequest *)request;

/**
 <p>Updates an Api resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApi service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateApiRequest
 @see AWSapigatewayUpdateApiResponse
 */
- (void)updateApi:(AWSapigatewayUpdateApiRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateApiResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The API mapping.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApiMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateApiMappingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateApiMappingRequest
 @see AWSapigatewayUpdateApiMappingResponse
 */
- (AWSTask<AWSapigatewayUpdateApiMappingResponse *> *)updateApiMapping:(AWSapigatewayUpdateApiMappingRequest *)request;

/**
 <p>The API mapping.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApiMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateApiMappingRequest
 @see AWSapigatewayUpdateApiMappingResponse
 */
- (void)updateApiMapping:(AWSapigatewayUpdateApiMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateApiMappingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an Authorizer.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAuthorizer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateAuthorizerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateAuthorizerRequest
 @see AWSapigatewayUpdateAuthorizerResponse
 */
- (AWSTask<AWSapigatewayUpdateAuthorizerResponse *> *)updateAuthorizer:(AWSapigatewayUpdateAuthorizerRequest *)request;

/**
 <p>Updates an Authorizer.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAuthorizer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateAuthorizerRequest
 @see AWSapigatewayUpdateAuthorizerResponse
 */
- (void)updateAuthorizer:(AWSapigatewayUpdateAuthorizerRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateAuthorizerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a Deployment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateDeploymentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateDeploymentRequest
 @see AWSapigatewayUpdateDeploymentResponse
 */
- (AWSTask<AWSapigatewayUpdateDeploymentResponse *> *)updateDeployment:(AWSapigatewayUpdateDeploymentRequest *)request;

/**
 <p>Updates a Deployment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateDeploymentRequest
 @see AWSapigatewayUpdateDeploymentResponse
 */
- (void)updateDeployment:(AWSapigatewayUpdateDeploymentRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateDeploymentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a domain name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateDomainNameResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateDomainNameRequest
 @see AWSapigatewayUpdateDomainNameResponse
 */
- (AWSTask<AWSapigatewayUpdateDomainNameResponse *> *)updateDomainName:(AWSapigatewayUpdateDomainNameRequest *)request;

/**
 <p>Updates a domain name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateDomainNameRequest
 @see AWSapigatewayUpdateDomainNameResponse
 */
- (void)updateDomainName:(AWSapigatewayUpdateDomainNameRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateDomainNameResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an Integration.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIntegration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateIntegrationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateIntegrationRequest
 @see AWSapigatewayUpdateIntegrationResult
 */
- (AWSTask<AWSapigatewayUpdateIntegrationResult *> *)updateIntegration:(AWSapigatewayUpdateIntegrationRequest *)request;

/**
 <p>Updates an Integration.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIntegration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateIntegrationRequest
 @see AWSapigatewayUpdateIntegrationResult
 */
- (void)updateIntegration:(AWSapigatewayUpdateIntegrationRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateIntegrationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an IntegrationResponses.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIntegrationResponse service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateIntegrationResponseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateIntegrationResponseRequest
 @see AWSapigatewayUpdateIntegrationResponseResponse
 */
- (AWSTask<AWSapigatewayUpdateIntegrationResponseResponse *> *)updateIntegrationResponse:(AWSapigatewayUpdateIntegrationResponseRequest *)request;

/**
 <p>Updates an IntegrationResponses.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIntegrationResponse service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateIntegrationResponseRequest
 @see AWSapigatewayUpdateIntegrationResponseResponse
 */
- (void)updateIntegrationResponse:(AWSapigatewayUpdateIntegrationResponseRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateIntegrationResponseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a Model.</p>
 
 @param request A container for the necessary parameters to execute the UpdateModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateModelRequest
 @see AWSapigatewayUpdateModelResponse
 */
- (AWSTask<AWSapigatewayUpdateModelResponse *> *)updateModel:(AWSapigatewayUpdateModelRequest *)request;

/**
 <p>Updates a Model.</p>
 
 @param request A container for the necessary parameters to execute the UpdateModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateModelRequest
 @see AWSapigatewayUpdateModelResponse
 */
- (void)updateModel:(AWSapigatewayUpdateModelRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a Route.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateRouteResult`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateRouteRequest
 @see AWSapigatewayUpdateRouteResult
 */
- (AWSTask<AWSapigatewayUpdateRouteResult *> *)updateRoute:(AWSapigatewayUpdateRouteRequest *)request;

/**
 <p>Updates a Route.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateRouteRequest
 @see AWSapigatewayUpdateRouteResult
 */
- (void)updateRoute:(AWSapigatewayUpdateRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a RouteResponse.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRouteResponse service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateRouteResponseResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateRouteResponseRequest
 @see AWSapigatewayUpdateRouteResponseResponse
 */
- (AWSTask<AWSapigatewayUpdateRouteResponseResponse *> *)updateRouteResponse:(AWSapigatewayUpdateRouteResponseRequest *)request;

/**
 <p>Updates a RouteResponse.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRouteResponse service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateRouteResponseRequest
 @see AWSapigatewayUpdateRouteResponseResponse
 */
- (void)updateRouteResponse:(AWSapigatewayUpdateRouteResponseRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateRouteResponseResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a Stage.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateStageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateStageRequest
 @see AWSapigatewayUpdateStageResponse
 */
- (AWSTask<AWSapigatewayUpdateStageResponse *> *)updateStage:(AWSapigatewayUpdateStageRequest *)request;

/**
 <p>Updates a Stage.</p>
 
 @param request A container for the necessary parameters to execute the UpdateStage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`, `AWSapigatewayErrorConflict`.
 
 @see AWSapigatewayUpdateStageRequest
 @see AWSapigatewayUpdateStageResponse
 */
- (void)updateStage:(AWSapigatewayUpdateStageRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateStageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a VPC link.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVpcLink service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapigatewayUpdateVpcLinkResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayUpdateVpcLinkRequest
 @see AWSapigatewayUpdateVpcLinkResponse
 */
- (AWSTask<AWSapigatewayUpdateVpcLinkResponse *> *)updateVpcLink:(AWSapigatewayUpdateVpcLinkRequest *)request;

/**
 <p>Updates a VPC link.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVpcLink service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapigatewayErrorDomain` domain and the following error code: `AWSapigatewayErrorNotFound`, `AWSapigatewayErrorTooManyRequests`, `AWSapigatewayErrorBadRequest`.
 
 @see AWSapigatewayUpdateVpcLinkRequest
 @see AWSapigatewayUpdateVpcLinkResponse
 */
- (void)updateVpcLink:(AWSapigatewayUpdateVpcLinkRequest *)request completionHandler:(void (^ _Nullable)(AWSapigatewayUpdateVpcLinkResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
