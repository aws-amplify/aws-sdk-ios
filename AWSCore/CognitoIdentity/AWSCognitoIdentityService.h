//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSCore.h"
#import "AWSCognitoIdentityModel.h"
#import "AWSCognitoIdentityResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>Amazon Cognito Federated Identities</fullname><p>Amazon Cognito Federated Identities is a web service that delivers scoped temporary credentials to mobile devices and other untrusted environments. It uniquely identifies a device and supplies the user with a consistent identity over the lifetime of an application.</p><p>Using Amazon Cognito Federated Identities, you can enable authentication with one or more third-party identity providers (Facebook, Google, or Login with Amazon) or an Amazon Cognito user pool, and you can also choose to support unauthenticated access from your app. Cognito delivers a unique identifier for each user and acts as an OpenID token provider trusted by AWS Security Token Service (STS) to access temporary, limited-privilege AWS credentials.</p><p>For a description of the authentication flow from the Amazon Cognito Developer Guide see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html">Authentication Flow</a>.</p><p>For more information see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html">Amazon Cognito Federated Identities</a>.</p>
 */
@interface AWSCognitoIdentity : AWSService

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

     let CognitoIdentity = AWSCognitoIdentity.default()

 *Objective-C*

     AWSCognitoIdentity *CognitoIdentity = [AWSCognitoIdentity defaultCognitoIdentity];

 @return The default service client.
 */
+ (instancetype)defaultCognitoIdentity;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCognitoIdentity.register(with: configuration!, forKey: "USWest2CognitoIdentity")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:@"USWest2CognitoIdentity"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CognitoIdentity = AWSCognitoIdentity(forKey: "USWest2CognitoIdentity")

 *Objective-C*

     AWSCognitoIdentity *CognitoIdentity = [AWSCognitoIdentity CognitoIdentityForKey:@"USWest2CognitoIdentity"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCognitoIdentityWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCognitoIdentityWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCognitoIdentity.register(with: configuration!, forKey: "USWest2CognitoIdentity")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:@"USWest2CognitoIdentity"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CognitoIdentity = AWSCognitoIdentity(forKey: "USWest2CognitoIdentity")

 *Objective-C*

     AWSCognitoIdentity *CognitoIdentity = [AWSCognitoIdentity CognitoIdentityForKey:@"USWest2CognitoIdentity"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CognitoIdentityForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCognitoIdentityForKey:(NSString *)key;

/**
 <p>Creates a new identity pool. The identity pool is a store of user identity information that is specific to your AWS account. The keys for <code>SupportedLoginProviders</code> are as follows:</p><ul><li><p>Facebook: <code>graph.facebook.com</code></p></li><li><p>Google: <code>accounts.google.com</code></p></li><li><p>Amazon: <code>www.amazon.com</code></p></li><li><p>Twitter: <code>api.twitter.com</code></p></li><li><p>Digits: <code>www.digits.com</code></p></li></ul><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the CreateIdentityPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityIdentityPool`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorLimitExceeded`.
 
 @see AWSCognitoIdentityCreateIdentityPoolInput
 @see AWSCognitoIdentityIdentityPool
 */
- (AWSTask<AWSCognitoIdentityIdentityPool *> *)createIdentityPool:(AWSCognitoIdentityCreateIdentityPoolInput *)request;

/**
 <p>Creates a new identity pool. The identity pool is a store of user identity information that is specific to your AWS account. The keys for <code>SupportedLoginProviders</code> are as follows:</p><ul><li><p>Facebook: <code>graph.facebook.com</code></p></li><li><p>Google: <code>accounts.google.com</code></p></li><li><p>Amazon: <code>www.amazon.com</code></p></li><li><p>Twitter: <code>api.twitter.com</code></p></li><li><p>Digits: <code>www.digits.com</code></p></li></ul><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the CreateIdentityPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorLimitExceeded`.
 
 @see AWSCognitoIdentityCreateIdentityPoolInput
 @see AWSCognitoIdentityIdentityPool
 */
- (void)createIdentityPool:(AWSCognitoIdentityCreateIdentityPoolInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityIdentityPool * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes identities from an identity pool. You can specify a list of 1-60 identities that you want to delete.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityDeleteIdentitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityDeleteIdentitiesInput
 @see AWSCognitoIdentityDeleteIdentitiesResponse
 */
- (AWSTask<AWSCognitoIdentityDeleteIdentitiesResponse *> *)deleteIdentities:(AWSCognitoIdentityDeleteIdentitiesInput *)request;

/**
 <p>Deletes identities from an identity pool. You can specify a list of 1-60 identities that you want to delete.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityDeleteIdentitiesInput
 @see AWSCognitoIdentityDeleteIdentitiesResponse
 */
- (void)deleteIdentities:(AWSCognitoIdentityDeleteIdentitiesInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityDeleteIdentitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an identity pool. Once a pool is deleted, users will not be able to authenticate with the pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentityPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityDeleteIdentityPoolInput
 */
- (AWSTask *)deleteIdentityPool:(AWSCognitoIdentityDeleteIdentityPoolInput *)request;

/**
 <p>Deletes an identity pool. Once a pool is deleted, users will not be able to authenticate with the pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentityPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityDeleteIdentityPoolInput
 */
- (void)deleteIdentityPool:(AWSCognitoIdentityDeleteIdentityPoolInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata related to the given identity, including when the identity was created and any associated linked logins.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityIdentityDescription`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityDescribeIdentityInput
 @see AWSCognitoIdentityIdentityDescription
 */
- (AWSTask<AWSCognitoIdentityIdentityDescription *> *)describeIdentity:(AWSCognitoIdentityDescribeIdentityInput *)request;

/**
 <p>Returns metadata related to the given identity, including when the identity was created and any associated linked logins.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityDescribeIdentityInput
 @see AWSCognitoIdentityIdentityDescription
 */
- (void)describeIdentity:(AWSCognitoIdentityDescribeIdentityInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityIdentityDescription * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets details about a particular identity pool, including the pool name, ID description, creation date, and current number of users.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityIdentityPool`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityDescribeIdentityPoolInput
 @see AWSCognitoIdentityIdentityPool
 */
- (AWSTask<AWSCognitoIdentityIdentityPool *> *)describeIdentityPool:(AWSCognitoIdentityDescribeIdentityPoolInput *)request;

/**
 <p>Gets details about a particular identity pool, including the pool name, ID description, creation date, and current number of users.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityDescribeIdentityPoolInput
 @see AWSCognitoIdentityIdentityPool
 */
- (void)describeIdentityPool:(AWSCognitoIdentityDescribeIdentityPoolInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityIdentityPool * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns credentials for the provided identity ID. Any provided logins will be validated against supported login providers. If the token is for cognito-identity.amazonaws.com, it will be passed through to AWS Security Token Service with the appropriate role for the token.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetCredentialsForIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityGetCredentialsForIdentityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInvalidIdentityPoolConfiguration`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityGetCredentialsForIdentityInput
 @see AWSCognitoIdentityGetCredentialsForIdentityResponse
 */
- (AWSTask<AWSCognitoIdentityGetCredentialsForIdentityResponse *> *)getCredentialsForIdentity:(AWSCognitoIdentityGetCredentialsForIdentityInput *)request;

/**
 <p>Returns credentials for the provided identity ID. Any provided logins will be validated against supported login providers. If the token is for cognito-identity.amazonaws.com, it will be passed through to AWS Security Token Service with the appropriate role for the token.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetCredentialsForIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInvalidIdentityPoolConfiguration`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityGetCredentialsForIdentityInput
 @see AWSCognitoIdentityGetCredentialsForIdentityResponse
 */
- (void)getCredentialsForIdentity:(AWSCognitoIdentityGetCredentialsForIdentityInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityGetCredentialsForIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates (or retrieves) a Cognito ID. Supplying multiple logins will create an implicit linked account.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetId service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityGetIdResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorLimitExceeded`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityGetIdInput
 @see AWSCognitoIdentityGetIdResponse
 */
- (AWSTask<AWSCognitoIdentityGetIdResponse *> *)getId:(AWSCognitoIdentityGetIdInput *)request;

/**
 <p>Generates (or retrieves) a Cognito ID. Supplying multiple logins will create an implicit linked account.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetId service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorLimitExceeded`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityGetIdInput
 @see AWSCognitoIdentityGetIdResponse
 */
- (void)getId:(AWSCognitoIdentityGetIdInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityGetIdResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the roles for an identity pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityPoolRoles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityGetIdentityPoolRolesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityGetIdentityPoolRolesInput
 @see AWSCognitoIdentityGetIdentityPoolRolesResponse
 */
- (AWSTask<AWSCognitoIdentityGetIdentityPoolRolesResponse *> *)getIdentityPoolRoles:(AWSCognitoIdentityGetIdentityPoolRolesInput *)request;

/**
 <p>Gets the roles for an identity pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityPoolRoles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityGetIdentityPoolRolesInput
 @see AWSCognitoIdentityGetIdentityPoolRolesResponse
 */
- (void)getIdentityPoolRoles:(AWSCognitoIdentityGetIdentityPoolRolesInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityGetIdentityPoolRolesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets an OpenID token, using a known Cognito ID. This known Cognito ID is returned by <a>GetId</a>. You can optionally add additional logins for the identity. Supplying multiple logins creates an implicit link.</p><p>The OpenId token is valid for 10 minutes.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetOpenIdToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityGetOpenIdTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityGetOpenIdTokenInput
 @see AWSCognitoIdentityGetOpenIdTokenResponse
 */
- (AWSTask<AWSCognitoIdentityGetOpenIdTokenResponse *> *)getOpenIdToken:(AWSCognitoIdentityGetOpenIdTokenInput *)request;

/**
 <p>Gets an OpenID token, using a known Cognito ID. This known Cognito ID is returned by <a>GetId</a>. You can optionally add additional logins for the identity. Supplying multiple logins creates an implicit link.</p><p>The OpenId token is valid for 10 minutes.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetOpenIdToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityGetOpenIdTokenInput
 @see AWSCognitoIdentityGetOpenIdTokenResponse
 */
- (void)getOpenIdToken:(AWSCognitoIdentityGetOpenIdTokenInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityGetOpenIdTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers (or retrieves) a Cognito <code>IdentityId</code> and an OpenID Connect token for a user authenticated by your backend authentication process. Supplying multiple logins will create an implicit linked account. You can only specify one developer provider as part of the <code>Logins</code> map, which is linked to the identity pool. The developer provider is the "domain" by which Cognito will refer to your users.</p><p>You can use <code>GetOpenIdTokenForDeveloperIdentity</code> to create a new identity and to link new logins (that is, user credentials issued by a public provider or developer provider) to an existing identity. When you want to create a new identity, the <code>IdentityId</code> should be null. When you want to associate a new login with an existing authenticated/unauthenticated identity, you can do so by providing the existing <code>IdentityId</code>. This API will create the identity in the specified <code>IdentityPoolId</code>.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetOpenIdTokenForDeveloperIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorDeveloperUserAlreadyRegistered`.
 
 @see AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput
 @see AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse
 */
- (AWSTask<AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse *> *)getOpenIdTokenForDeveloperIdentity:(AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput *)request;

/**
 <p>Registers (or retrieves) a Cognito <code>IdentityId</code> and an OpenID Connect token for a user authenticated by your backend authentication process. Supplying multiple logins will create an implicit linked account. You can only specify one developer provider as part of the <code>Logins</code> map, which is linked to the identity pool. The developer provider is the "domain" by which Cognito will refer to your users.</p><p>You can use <code>GetOpenIdTokenForDeveloperIdentity</code> to create a new identity and to link new logins (that is, user credentials issued by a public provider or developer provider) to an existing identity. When you want to create a new identity, the <code>IdentityId</code> should be null. When you want to associate a new login with an existing authenticated/unauthenticated identity, you can do so by providing the existing <code>IdentityId</code>. This API will create the identity in the specified <code>IdentityPoolId</code>.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetOpenIdTokenForDeveloperIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorDeveloperUserAlreadyRegistered`.
 
 @see AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput
 @see AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse
 */
- (void)getOpenIdTokenForDeveloperIdentity:(AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the identities in an identity pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityListIdentitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityListIdentitiesInput
 @see AWSCognitoIdentityListIdentitiesResponse
 */
- (AWSTask<AWSCognitoIdentityListIdentitiesResponse *> *)listIdentities:(AWSCognitoIdentityListIdentitiesInput *)request;

/**
 <p>Lists the identities in an identity pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityListIdentitiesInput
 @see AWSCognitoIdentityListIdentitiesResponse
 */
- (void)listIdentities:(AWSCognitoIdentityListIdentitiesInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityListIdentitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the Cognito identity pools registered for your account.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentityPools service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityListIdentityPoolsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityListIdentityPoolsInput
 @see AWSCognitoIdentityListIdentityPoolsResponse
 */
- (AWSTask<AWSCognitoIdentityListIdentityPoolsResponse *> *)listIdentityPools:(AWSCognitoIdentityListIdentityPoolsInput *)request;

/**
 <p>Lists all of the Cognito identity pools registered for your account.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentityPools service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityListIdentityPoolsInput
 @see AWSCognitoIdentityListIdentityPoolsResponse
 */
- (void)listIdentityPools:(AWSCognitoIdentityListIdentityPoolsInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityListIdentityPoolsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags that are assigned to an Amazon Cognito identity pool.</p><p>A tag is a label that you can apply to identity pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.</p><p>You can use this action up to 10 times per second, per account.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityListTagsForResourceInput
 @see AWSCognitoIdentityListTagsForResourceResponse
 */
- (AWSTask<AWSCognitoIdentityListTagsForResourceResponse *> *)listTagsForResource:(AWSCognitoIdentityListTagsForResourceInput *)request;

/**
 <p>Lists the tags that are assigned to an Amazon Cognito identity pool.</p><p>A tag is a label that you can apply to identity pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.</p><p>You can use this action up to 10 times per second, per account.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityListTagsForResourceInput
 @see AWSCognitoIdentityListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSCognitoIdentityListTagsForResourceInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the <code>IdentityID</code> associated with a <code>DeveloperUserIdentifier</code> or the list of <code>DeveloperUserIdentifier</code> values associated with an <code>IdentityId</code> for an existing identity. Either <code>IdentityID</code> or <code>DeveloperUserIdentifier</code> must not be null. If you supply only one of these values, the other value will be searched in the database and returned as a part of the response. If you supply both, <code>DeveloperUserIdentifier</code> will be matched against <code>IdentityID</code>. If the values are verified against the database, the response returns both values and is the same as the request. Otherwise a <code>ResourceConflictException</code> is thrown.</p><p><code>LookupDeveloperIdentity</code> is intended for low-throughput control plane operations: for example, to enable customer service to locate an identity ID by username. If you are using it for higher-volume operations such as user authentication, your requests are likely to be throttled. <a>GetOpenIdTokenForDeveloperIdentity</a> is a better option for higher-volume operations for user authentication.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the LookupDeveloperIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityLookupDeveloperIdentityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityLookupDeveloperIdentityInput
 @see AWSCognitoIdentityLookupDeveloperIdentityResponse
 */
- (AWSTask<AWSCognitoIdentityLookupDeveloperIdentityResponse *> *)lookupDeveloperIdentity:(AWSCognitoIdentityLookupDeveloperIdentityInput *)request;

/**
 <p>Retrieves the <code>IdentityID</code> associated with a <code>DeveloperUserIdentifier</code> or the list of <code>DeveloperUserIdentifier</code> values associated with an <code>IdentityId</code> for an existing identity. Either <code>IdentityID</code> or <code>DeveloperUserIdentifier</code> must not be null. If you supply only one of these values, the other value will be searched in the database and returned as a part of the response. If you supply both, <code>DeveloperUserIdentifier</code> will be matched against <code>IdentityID</code>. If the values are verified against the database, the response returns both values and is the same as the request. Otherwise a <code>ResourceConflictException</code> is thrown.</p><p><code>LookupDeveloperIdentity</code> is intended for low-throughput control plane operations: for example, to enable customer service to locate an identity ID by username. If you are using it for higher-volume operations such as user authentication, your requests are likely to be throttled. <a>GetOpenIdTokenForDeveloperIdentity</a> is a better option for higher-volume operations for user authentication.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the LookupDeveloperIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityLookupDeveloperIdentityInput
 @see AWSCognitoIdentityLookupDeveloperIdentityResponse
 */
- (void)lookupDeveloperIdentity:(AWSCognitoIdentityLookupDeveloperIdentityInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityLookupDeveloperIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Merges two users having different <code>IdentityId</code>s, existing in the same identity pool, and identified by the same developer provider. You can use this action to request that discrete users be merged and identified as a single user in the Cognito environment. Cognito associates the given source user (<code>SourceUserIdentifier</code>) with the <code>IdentityId</code> of the <code>DestinationUserIdentifier</code>. Only developer-authenticated users can be merged. If the users to be merged are associated with the same public provider, but as two different users, an exception will be thrown.</p><p>The number of linked logins is limited to 20. So, the number of linked logins for the source user, <code>SourceUserIdentifier</code>, and the destination user, <code>DestinationUserIdentifier</code>, together should not be larger than 20. Otherwise, an exception will be thrown.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the MergeDeveloperIdentities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityMergeDeveloperIdentitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityMergeDeveloperIdentitiesInput
 @see AWSCognitoIdentityMergeDeveloperIdentitiesResponse
 */
- (AWSTask<AWSCognitoIdentityMergeDeveloperIdentitiesResponse *> *)mergeDeveloperIdentities:(AWSCognitoIdentityMergeDeveloperIdentitiesInput *)request;

/**
 <p>Merges two users having different <code>IdentityId</code>s, existing in the same identity pool, and identified by the same developer provider. You can use this action to request that discrete users be merged and identified as a single user in the Cognito environment. Cognito associates the given source user (<code>SourceUserIdentifier</code>) with the <code>IdentityId</code> of the <code>DestinationUserIdentifier</code>. Only developer-authenticated users can be merged. If the users to be merged are associated with the same public provider, but as two different users, an exception will be thrown.</p><p>The number of linked logins is limited to 20. So, the number of linked logins for the source user, <code>SourceUserIdentifier</code>, and the destination user, <code>DestinationUserIdentifier</code>, together should not be larger than 20. Otherwise, an exception will be thrown.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the MergeDeveloperIdentities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityMergeDeveloperIdentitiesInput
 @see AWSCognitoIdentityMergeDeveloperIdentitiesResponse
 */
- (void)mergeDeveloperIdentities:(AWSCognitoIdentityMergeDeveloperIdentitiesInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityMergeDeveloperIdentitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the roles for an identity pool. These roles are used when making calls to <a>GetCredentialsForIdentity</a> action.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityPoolRoles service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorConcurrentModification`.
 
 @see AWSCognitoIdentitySetIdentityPoolRolesInput
 */
- (AWSTask *)setIdentityPoolRoles:(AWSCognitoIdentitySetIdentityPoolRolesInput *)request;

/**
 <p>Sets the roles for an identity pool. These roles are used when making calls to <a>GetCredentialsForIdentity</a> action.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityPoolRoles service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorConcurrentModification`.
 
 @see AWSCognitoIdentitySetIdentityPoolRolesInput
 */
- (void)setIdentityPoolRoles:(AWSCognitoIdentitySetIdentityPoolRolesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Assigns a set of tags to an Amazon Cognito identity pool. A tag is a label that you can use to categorize and manage identity pools in different ways, such as by purpose, owner, environment, or other criteria.</p><p>Each tag consists of a key and value, both of which you define. A key is a general category for more specific values. For example, if you have two versions of an identity pool, one for testing and another for production, you might assign an <code>Environment</code> tag key to both identity pools. The value of this key might be <code>Test</code> for one identity pool and <code>Production</code> for the other.</p><p>Tags are useful for cost tracking and access control. You can activate your tags so that they appear on the Billing and Cost Management console, where you can track the costs associated with your identity pools. In an IAM policy, you can constrain permissions for identity pools based on specific tags or tag values.</p><p>You can use this action up to 5 times per second, per account. An identity pool can have as many as 50 tags.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityTagResourceInput
 @see AWSCognitoIdentityTagResourceResponse
 */
- (AWSTask<AWSCognitoIdentityTagResourceResponse *> *)tagResource:(AWSCognitoIdentityTagResourceInput *)request;

/**
 <p>Assigns a set of tags to an Amazon Cognito identity pool. A tag is a label that you can use to categorize and manage identity pools in different ways, such as by purpose, owner, environment, or other criteria.</p><p>Each tag consists of a key and value, both of which you define. A key is a general category for more specific values. For example, if you have two versions of an identity pool, one for testing and another for production, you might assign an <code>Environment</code> tag key to both identity pools. The value of this key might be <code>Test</code> for one identity pool and <code>Production</code> for the other.</p><p>Tags are useful for cost tracking and access control. You can activate your tags so that they appear on the Billing and Cost Management console, where you can track the costs associated with your identity pools. In an IAM policy, you can constrain permissions for identity pools based on specific tags or tag values.</p><p>You can use this action up to 5 times per second, per account. An identity pool can have as many as 50 tags.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityTagResourceInput
 @see AWSCognitoIdentityTagResourceResponse
 */
- (void)tagResource:(AWSCognitoIdentityTagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Unlinks a <code>DeveloperUserIdentifier</code> from an existing identity. Unlinked developer users will be considered new identities next time they are seen. If, for a given Cognito identity, you remove all federated identities as well as the developer user identifier, the Cognito identity becomes inaccessible.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the UnlinkDeveloperIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityUnlinkDeveloperIdentityInput
 */
- (AWSTask *)unlinkDeveloperIdentity:(AWSCognitoIdentityUnlinkDeveloperIdentityInput *)request;

/**
 <p>Unlinks a <code>DeveloperUserIdentifier</code> from an existing identity. Unlinked developer users will be considered new identities next time they are seen. If, for a given Cognito identity, you remove all federated identities as well as the developer user identifier, the Cognito identity becomes inaccessible.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the UnlinkDeveloperIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityUnlinkDeveloperIdentityInput
 */
- (void)unlinkDeveloperIdentity:(AWSCognitoIdentityUnlinkDeveloperIdentityInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Unlinks a federated identity from an existing account. Unlinked logins will be considered new identities next time they are seen. Removing the last linked login will make this identity inaccessible.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the UnlinkIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityUnlinkIdentityInput
 */
- (AWSTask *)unlinkIdentity:(AWSCognitoIdentityUnlinkIdentityInput *)request;

/**
 <p>Unlinks a federated identity from an existing account. Unlinked logins will be considered new identities next time they are seen. Removing the last linked login will make this identity inaccessible.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the UnlinkIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityUnlinkIdentityInput
 */
- (void)unlinkIdentity:(AWSCognitoIdentityUnlinkIdentityInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tags from an Amazon Cognito identity pool. You can use this action up to 5 times per second, per account</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityUntagResourceInput
 @see AWSCognitoIdentityUntagResourceResponse
 */
- (AWSTask<AWSCognitoIdentityUntagResourceResponse *> *)untagResource:(AWSCognitoIdentityUntagResourceInput *)request;

/**
 <p>Removes the specified tags from an Amazon Cognito identity pool. You can use this action up to 5 times per second, per account</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityUntagResourceInput
 @see AWSCognitoIdentityUntagResourceResponse
 */
- (void)untagResource:(AWSCognitoIdentityUntagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an identity pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIdentityPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityIdentityPool`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorConcurrentModification`, `AWSCognitoIdentityErrorLimitExceeded`.
 
 @see AWSCognitoIdentityIdentityPool
 @see AWSCognitoIdentityIdentityPool
 */
- (AWSTask<AWSCognitoIdentityIdentityPool *> *)updateIdentityPool:(AWSCognitoIdentityIdentityPool *)request;

/**
 <p>Updates an identity pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIdentityPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorConcurrentModification`, `AWSCognitoIdentityErrorLimitExceeded`.
 
 @see AWSCognitoIdentityIdentityPool
 @see AWSCognitoIdentityIdentityPool
 */
- (void)updateIdentityPool:(AWSCognitoIdentityIdentityPool *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityIdentityPool * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
