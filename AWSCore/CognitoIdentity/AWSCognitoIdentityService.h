/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSCognitoIdentityModel.h"
/**
 <fullname>Amazon Cognito</fullname><p>Amazon Cognito is a web service that delivers scoped temporary credentials to mobile devices and other untrusted environments. Amazon Cognito uniquely identifies a device and supplies the user with a consistent identity over the lifetime of an application.</p><p>Using Amazon Cognito, you can enable authentication with one or more third-party identity providers (Facebook, Google, or Login with Amazon), and you can also choose to support unauthenticated access from your app. Cognito delivers a unique identifier for each user and acts as an OpenID token provider trusted by AWS Security Token Service (STS) to access temporary, limited-privilege AWS credentials.</p><p>To provide end-user credentials, first make an unsigned call to <a>GetId</a>. If the end user is authenticated with one of the supported identity providers, set the <code>Logins</code> map with the identity provider token. <code>GetId</code> returns a unique identifier for the user.</p><p>Next, make an unsigned call to <a>GetCredentialsForIdentity</a>. This call expects the same <code>Logins</code> map as the <code>GetId</code> call, as well as the <code>IdentityID</code> originally returned by <code>GetId</code>. Assuming your identity pool has been configured via the <a>SetIdentityPoolRoles</a> operation, <code>GetCredentialsForIdentity</code> will return AWS credentials for your use. If your pool has not been configured with <code>SetIdentityPoolRoles</code>, or if you want to follow legacy flow, make an unsigned call to <a>GetOpenIdToken</a>, which returns the OpenID token necessary to call STS and retrieve AWS credentials. This call expects the same <code>Logins</code> map as the <code>GetId</code> call, as well as the <code>IdentityID</code> originally returned by <code>GetId</code>. The token returned by <code>GetOpenIdToken</code> can be passed to the STS operation <a href="http://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoleWithWebIdentity.html">AssumeRoleWithWebIdentity</a> to retrieve AWS credentials.</p><p>If you want to use Amazon Cognito in an Android, iOS, or Unity application, you will probably want to make API calls via the AWS Mobile SDK. To learn more, see the <a href="http://docs.aws.amazon.com/mobile/index.html">AWS Mobile SDK Developer Guide</a>.</p>
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

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

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

     let CognitoIdentity = AWSCognitoIdentity.defaultCognitoIdentity()

 *Objective-C*

     AWSCognitoIdentity *CognitoIdentity = [AWSCognitoIdentity defaultCognitoIdentity];

 @return The default service client.
 */
+ (instancetype)defaultCognitoIdentity;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSCognitoIdentity.registerCognitoIdentityWithConfiguration(configuration, forKey: "USWest2CognitoIdentity")

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
 Retrieves the service client associated with the key. You need to call `+ registerCognitoIdentityWithConfiguration:forKey:` before invoking this method. If `+ registerCognitoIdentityWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSCognitoIdentity.registerCognitoIdentityWithConfiguration(configuration, forKey: "USWest2CognitoIdentity")

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
 Instantiates the service client with the given service configuration.
 
 @warning This method has been deprecated. Use `+ registerCognitoIdentityWithConfiguration:forKey:` and `+ CognitoIdentityForKey:` instead.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 
 @warning Unlike the singleton method, you are responsible for maintaining a strong reference to this object. If the service client is released before completing a service request, the request may fail with unspecified errors.
 
 @param configuration The service configuration object.
 
 @return An instance of the service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration __attribute__ ((deprecated("Use '+ registerCognitoIdentityWithConfiguration:forKey:' and '+ CognitoIdentityForKey:' instead.")));

/**
 <p>Creates a new identity pool. The identity pool is a store of user identity information that is specific to your AWS account. The limit on identity pools is 60 per account. You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the CreateIdentityPool service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityIdentityPool`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorLimitExceeded`.
 
 @see AWSCognitoIdentityCreateIdentityPoolInput
 @see AWSCognitoIdentityIdentityPool
 */
- (AWSTask *)createIdentityPool:(AWSCognitoIdentityCreateIdentityPoolInput *)request;

/**
 <p>Deletes a user pool. Once a pool is deleted, users will not be able to authenticate with the pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentityPool service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityDeleteIdentityPoolInput
 */
- (AWSTask *)deleteIdentityPool:(AWSCognitoIdentityDeleteIdentityPoolInput *)request;

/**
 <p>Returns metadata related to the given identity, including when the identity was created and any associated linked logins.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentity service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityIdentityDescription`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityDescribeIdentityInput
 @see AWSCognitoIdentityIdentityDescription
 */
- (AWSTask *)describeIdentity:(AWSCognitoIdentityDescribeIdentityInput *)request;

/**
 <p>Gets details about a particular identity pool, including the pool name, ID description, creation date, and current number of users.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityPool service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityIdentityPool`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityDescribeIdentityPoolInput
 @see AWSCognitoIdentityIdentityPool
 */
- (AWSTask *)describeIdentityPool:(AWSCognitoIdentityDescribeIdentityPoolInput *)request;

/**
 <p>Returns credentials for the the provided identity ID. Any provided logins will be validated against supported login providers. If the token is for cognito-identity.amazonaws.com, it will be passed through to AWS Security Token Service with the appropriate role for the token.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetCredentialsForIdentity service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityGetCredentialsForIdentityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInvalidIdentityPoolConfiguration`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityGetCredentialsForIdentityInput
 @see AWSCognitoIdentityGetCredentialsForIdentityResponse
 */
- (AWSTask *)getCredentialsForIdentity:(AWSCognitoIdentityGetCredentialsForIdentityInput *)request;

/**
 <p>Generates (or retrieves) a Cognito ID. Supplying multiple logins will create an implicit linked account.</p><p>token+";"+tokenSecret.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetId service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityGetIdResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorLimitExceeded`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityGetIdInput
 @see AWSCognitoIdentityGetIdResponse
 */
- (AWSTask *)getId:(AWSCognitoIdentityGetIdInput *)request;

/**
 <p>Gets the roles for an identity pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityPoolRoles service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityGetIdentityPoolRolesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityGetIdentityPoolRolesInput
 @see AWSCognitoIdentityGetIdentityPoolRolesResponse
 */
- (AWSTask *)getIdentityPoolRoles:(AWSCognitoIdentityGetIdentityPoolRolesInput *)request;

/**
 <p>Gets an OpenID token, using a known Cognito ID. This known Cognito ID is returned by <a>GetId</a>. You can optionally add additional logins for the identity. Supplying multiple logins creates an implicit link.</p><p>The OpenId token is valid for 15 minutes.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetOpenIdToken service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityGetOpenIdTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityGetOpenIdTokenInput
 @see AWSCognitoIdentityGetOpenIdTokenResponse
 */
- (AWSTask *)getOpenIdToken:(AWSCognitoIdentityGetOpenIdTokenInput *)request;

/**
 <p>Registers (or retrieves) a Cognito <code>IdentityId</code> and an OpenID Connect token for a user authenticated by your backend authentication process. Supplying multiple logins will create an implicit linked account. You can only specify one developer provider as part of the <code>Logins</code> map, which is linked to the identity pool. The developer provider is the "domain" by which Cognito will refer to your users.</p><p>You can use <code>GetOpenIdTokenForDeveloperIdentity</code> to create a new identity and to link new logins (that is, user credentials issued by a public provider or developer provider) to an existing identity. When you want to create a new identity, the <code>IdentityId</code> should be null. When you want to associate a new login with an existing authenticated/unauthenticated identity, you can do so by providing the existing <code>IdentityId</code>. This API will create the identity in the specified <code>IdentityPoolId</code>.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the GetOpenIdTokenForDeveloperIdentity service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorDeveloperUserAlreadyRegistered`.
 
 @see AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput
 @see AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse
 */
- (AWSTask *)getOpenIdTokenForDeveloperIdentity:(AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput *)request;

/**
 <p>Lists the identities in a pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentities service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityListIdentitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityListIdentitiesInput
 @see AWSCognitoIdentityListIdentitiesResponse
 */
- (AWSTask *)listIdentities:(AWSCognitoIdentityListIdentitiesInput *)request;

/**
 <p>Lists all of the Cognito identity pools registered for your account.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentityPools service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityListIdentityPoolsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityListIdentityPoolsInput
 @see AWSCognitoIdentityListIdentityPoolsResponse
 */
- (AWSTask *)listIdentityPools:(AWSCognitoIdentityListIdentityPoolsInput *)request;

/**
 <p>Retrieves the <code>IdentityID</code> associated with a <code>DeveloperUserIdentifier</code> or the list of <code>DeveloperUserIdentifier</code>s associated with an <code>IdentityId</code> for an existing identity. Either <code>IdentityID</code> or <code>DeveloperUserIdentifier</code> must not be null. If you supply only one of these values, the other value will be searched in the database and returned as a part of the response. If you supply both, <code>DeveloperUserIdentifier</code> will be matched against <code>IdentityID</code>. If the values are verified against the database, the response returns both values and is the same as the request. Otherwise a <code>ResourceConflictException</code> is thrown.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the LookupDeveloperIdentity service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityLookupDeveloperIdentityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityLookupDeveloperIdentityInput
 @see AWSCognitoIdentityLookupDeveloperIdentityResponse
 */
- (AWSTask *)lookupDeveloperIdentity:(AWSCognitoIdentityLookupDeveloperIdentityInput *)request;

/**
 <p>Merges two users having different <code>IdentityId</code>s, existing in the same identity pool, and identified by the same developer provider. You can use this action to request that discrete users be merged and identified as a single user in the Cognito environment. Cognito associates the given source user (<code>SourceUserIdentifier</code>) with the <code>IdentityId</code> of the <code>DestinationUserIdentifier</code>. Only developer-authenticated users can be merged. If the users to be merged are associated with the same public provider, but as two different users, an exception will be thrown.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the MergeDeveloperIdentities service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityMergeDeveloperIdentitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityMergeDeveloperIdentitiesInput
 @see AWSCognitoIdentityMergeDeveloperIdentitiesResponse
 */
- (AWSTask *)mergeDeveloperIdentities:(AWSCognitoIdentityMergeDeveloperIdentitiesInput *)request;

/**
 <p>Sets the roles for an identity pool. These roles are used when making calls to <code>GetCredentialsForIdentity</code> action.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityPoolRoles service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorLimitExceeded`.
 
 @see AWSCognitoIdentitySetIdentityPoolRolesInput
 */
- (AWSTask *)setIdentityPoolRoles:(AWSCognitoIdentitySetIdentityPoolRolesInput *)request;

/**
 <p>Unlinks a <code>DeveloperUserIdentifier</code> from an existing identity. Unlinked developer users will be considered new identities next time they are seen. If, for a given Cognito identity, you remove all federated identities as well as the developer user identifier, the Cognito identity becomes inaccessible.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the UnlinkDeveloperIdentity service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`.
 
 @see AWSCognitoIdentityUnlinkDeveloperIdentityInput
 */
- (AWSTask *)unlinkDeveloperIdentity:(AWSCognitoIdentityUnlinkDeveloperIdentityInput *)request;

/**
 <p>Unlinks a federated identity from an existing account. Unlinked logins will be considered new identities next time they are seen. Removing the last linked login will make this identity inaccessible.</p><p>This is a public API. You do not need any credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the UnlinkIdentity service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorExternalService`.
 
 @see AWSCognitoIdentityUnlinkIdentityInput
 */
- (AWSTask *)unlinkIdentity:(AWSCognitoIdentityUnlinkIdentityInput *)request;

/**
 <p>Updates a user pool.</p><p>You must use AWS Developer credentials to call this API.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIdentityPool service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityIdentityPool`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityErrorDomain` domain and the following error code: `AWSCognitoIdentityErrorInvalidParameter`, `AWSCognitoIdentityErrorResourceNotFound`, `AWSCognitoIdentityErrorNotAuthorized`, `AWSCognitoIdentityErrorResourceConflict`, `AWSCognitoIdentityErrorTooManyRequests`, `AWSCognitoIdentityErrorInternalError`, `AWSCognitoIdentityErrorLimitExceeded`.
 
 @see AWSCognitoIdentityIdentityPool
 @see AWSCognitoIdentityIdentityPool
 */
- (AWSTask *)updateIdentityPool:(AWSCognitoIdentityIdentityPool *)request;

@end
