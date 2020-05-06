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
#import "AWSAWSCodeStarconnectionsModel.h"
#import "AWSAWSCodeStarconnectionsResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSAWSCodeStarconnections
FOUNDATION_EXPORT NSString *const AWSAWSCodeStarconnectionsSDKVersion;

/**
 <p>This AWS CodeStar Connections API Reference provides descriptions and usage examples of the operations and data types for the AWS CodeStar Connections API. You can use the Connections API to work with connections and installations.</p><p><i>Connections</i> are configurations that you use to connect AWS resources to external code repositories. Each connection is a resource that can be given to services such as CodePipeline to connect to a third-party repository such as Bitbucket. For example, you can add the connection in CodePipeline so that it triggers your pipeline when a code change is made to your third-party code repository. Each connection is named and associated with a unique ARN that is used to reference the connection.</p><p>When you create a connection, the console initiates a third-party connection handshake. <i>Installations</i> are the apps that are used to conduct this handshake. For example, the installation for the Bitbucket provider type is the Bitbucket Cloud app. When you create a connection, you can choose an existing installation or create one.</p><p>You can work with connections by calling:</p><ul><li><p><a>CreateConnection</a>, which creates a uniquely named connection that can be referenced by services such as CodePipeline.</p></li><li><p><a>DeleteConnection</a>, which deletes the specified connection.</p></li><li><p><a>GetConnection</a>, which returns information about the connection, including the connection status.</p></li><li><p><a>ListConnections</a>, which lists the connections associated with your account.</p></li></ul><p>For information about how to use AWS CodeStar Connections, see the <a href="https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html">AWS CodePipeline User Guide</a>.</p>
 */
@interface AWSAWSCodeStarconnections : AWSService

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

     let AWSCodeStarconnections = AWSAWSCodeStarconnections.default()

 *Objective-C*

     AWSAWSCodeStarconnections *AWSCodeStarconnections = [AWSAWSCodeStarconnections defaultAWSCodeStarconnections];

 @return The default service client.
 */
+ (instancetype)defaultAWSCodeStarconnections;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAWSCodeStarconnections.register(with: configuration!, forKey: "USWest2AWSCodeStarconnections")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:@"USWest2AWSCodeStarconnections"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AWSCodeStarconnections = AWSAWSCodeStarconnections(forKey: "USWest2AWSCodeStarconnections")

 *Objective-C*

     AWSAWSCodeStarconnections *AWSCodeStarconnections = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:@"USWest2AWSCodeStarconnections"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerAWSCodeStarconnectionsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerAWSCodeStarconnectionsWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAWSCodeStarconnections.register(with: configuration!, forKey: "USWest2AWSCodeStarconnections")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:@"USWest2AWSCodeStarconnections"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AWSCodeStarconnections = AWSAWSCodeStarconnections(forKey: "USWest2AWSCodeStarconnections")

 *Objective-C*

     AWSAWSCodeStarconnections *AWSCodeStarconnections = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:@"USWest2AWSCodeStarconnections"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)AWSCodeStarconnectionsForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeAWSCodeStarconnectionsForKey:(NSString *)key;

/**
 <p>Creates a connection that can then be given to other AWS services like CodePipeline so that it can access third-party code repositories. The connection is in pending status until the third-party connection handshake is completed from the console.</p>
 
 @param request A container for the necessary parameters to execute the CreateConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSCodeStarconnectionsCreateConnectionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorLimitExceeded`.
 
 @see AWSAWSCodeStarconnectionsCreateConnectionInput
 @see AWSAWSCodeStarconnectionsCreateConnectionOutput
 */
- (AWSTask<AWSAWSCodeStarconnectionsCreateConnectionOutput *> *)createConnection:(AWSAWSCodeStarconnectionsCreateConnectionInput *)request;

/**
 <p>Creates a connection that can then be given to other AWS services like CodePipeline so that it can access third-party code repositories. The connection is in pending status until the third-party connection handshake is completed from the console.</p>
 
 @param request A container for the necessary parameters to execute the CreateConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorLimitExceeded`.
 
 @see AWSAWSCodeStarconnectionsCreateConnectionInput
 @see AWSAWSCodeStarconnectionsCreateConnectionOutput
 */
- (void)createConnection:(AWSAWSCodeStarconnectionsCreateConnectionInput *)request completionHandler:(void (^ _Nullable)(AWSAWSCodeStarconnectionsCreateConnectionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The connection to be deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSCodeStarconnectionsDeleteConnectionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorResourceNotFound`.
 
 @see AWSAWSCodeStarconnectionsDeleteConnectionInput
 @see AWSAWSCodeStarconnectionsDeleteConnectionOutput
 */
- (AWSTask<AWSAWSCodeStarconnectionsDeleteConnectionOutput *> *)deleteConnection:(AWSAWSCodeStarconnectionsDeleteConnectionInput *)request;

/**
 <p>The connection to be deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorResourceNotFound`.
 
 @see AWSAWSCodeStarconnectionsDeleteConnectionInput
 @see AWSAWSCodeStarconnectionsDeleteConnectionOutput
 */
- (void)deleteConnection:(AWSAWSCodeStarconnectionsDeleteConnectionInput *)request completionHandler:(void (^ _Nullable)(AWSAWSCodeStarconnectionsDeleteConnectionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the connection ARN and details such as status, owner, and provider type.</p>
 
 @param request A container for the necessary parameters to execute the GetConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSCodeStarconnectionsGetConnectionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorResourceNotFound`.
 
 @see AWSAWSCodeStarconnectionsGetConnectionInput
 @see AWSAWSCodeStarconnectionsGetConnectionOutput
 */
- (AWSTask<AWSAWSCodeStarconnectionsGetConnectionOutput *> *)getConnection:(AWSAWSCodeStarconnectionsGetConnectionInput *)request;

/**
 <p>Returns the connection ARN and details such as status, owner, and provider type.</p>
 
 @param request A container for the necessary parameters to execute the GetConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorResourceNotFound`.
 
 @see AWSAWSCodeStarconnectionsGetConnectionInput
 @see AWSAWSCodeStarconnectionsGetConnectionOutput
 */
- (void)getConnection:(AWSAWSCodeStarconnectionsGetConnectionInput *)request completionHandler:(void (^ _Nullable)(AWSAWSCodeStarconnectionsGetConnectionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the connections associated with your account.</p>
 
 @param request A container for the necessary parameters to execute the ListConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSCodeStarconnectionsListConnectionsOutput`.
 
 @see AWSAWSCodeStarconnectionsListConnectionsInput
 @see AWSAWSCodeStarconnectionsListConnectionsOutput
 */
- (AWSTask<AWSAWSCodeStarconnectionsListConnectionsOutput *> *)listConnections:(AWSAWSCodeStarconnectionsListConnectionsInput *)request;

/**
 <p>Lists the connections associated with your account.</p>
 
 @param request A container for the necessary parameters to execute the ListConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAWSCodeStarconnectionsListConnectionsInput
 @see AWSAWSCodeStarconnectionsListConnectionsOutput
 */
- (void)listConnections:(AWSAWSCodeStarconnectionsListConnectionsInput *)request completionHandler:(void (^ _Nullable)(AWSAWSCodeStarconnectionsListConnectionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the set of key-value pairs (metadata) that are used to manage the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSCodeStarconnectionsListTagsForResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorResourceNotFound`.
 
 @see AWSAWSCodeStarconnectionsListTagsForResourceInput
 @see AWSAWSCodeStarconnectionsListTagsForResourceOutput
 */
- (AWSTask<AWSAWSCodeStarconnectionsListTagsForResourceOutput *> *)listTagsForResource:(AWSAWSCodeStarconnectionsListTagsForResourceInput *)request;

/**
 <p>Gets the set of key-value pairs (metadata) that are used to manage the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorResourceNotFound`.
 
 @see AWSAWSCodeStarconnectionsListTagsForResourceInput
 @see AWSAWSCodeStarconnectionsListTagsForResourceOutput
 */
- (void)listTagsForResource:(AWSAWSCodeStarconnectionsListTagsForResourceInput *)request completionHandler:(void (^ _Nullable)(AWSAWSCodeStarconnectionsListTagsForResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds to or modifies the tags of the given resource. Tags are metadata that can be used to manage a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSCodeStarconnectionsTagResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorResourceNotFound`, `AWSAWSCodeStarconnectionsErrorLimitExceeded`.
 
 @see AWSAWSCodeStarconnectionsTagResourceInput
 @see AWSAWSCodeStarconnectionsTagResourceOutput
 */
- (AWSTask<AWSAWSCodeStarconnectionsTagResourceOutput *> *)tagResource:(AWSAWSCodeStarconnectionsTagResourceInput *)request;

/**
 <p>Adds to or modifies the tags of the given resource. Tags are metadata that can be used to manage a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorResourceNotFound`, `AWSAWSCodeStarconnectionsErrorLimitExceeded`.
 
 @see AWSAWSCodeStarconnectionsTagResourceInput
 @see AWSAWSCodeStarconnectionsTagResourceOutput
 */
- (void)tagResource:(AWSAWSCodeStarconnectionsTagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSAWSCodeStarconnectionsTagResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from an AWS resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSCodeStarconnectionsUntagResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorResourceNotFound`.
 
 @see AWSAWSCodeStarconnectionsUntagResourceInput
 @see AWSAWSCodeStarconnectionsUntagResourceOutput
 */
- (AWSTask<AWSAWSCodeStarconnectionsUntagResourceOutput *> *)untagResource:(AWSAWSCodeStarconnectionsUntagResourceInput *)request;

/**
 <p>Removes tags from an AWS resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSCodeStarconnectionsErrorDomain` domain and the following error code: `AWSAWSCodeStarconnectionsErrorResourceNotFound`.
 
 @see AWSAWSCodeStarconnectionsUntagResourceInput
 @see AWSAWSCodeStarconnectionsUntagResourceOutput
 */
- (void)untagResource:(AWSAWSCodeStarconnectionsUntagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSAWSCodeStarconnectionsUntagResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
