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
#import "AWSMacieModel.h"
#import "AWSMacieResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSMacie
FOUNDATION_EXPORT NSString *const AWSMacieSDKVersion;

/**
 <fullname>Amazon Macie Classic</fullname><p>Amazon Macie Classic is a security service that uses machine learning to automatically discover, classify, and protect sensitive data in AWS. Macie Classic recognizes sensitive data such as personally identifiable information (PII) or intellectual property, and provides you with dashboards and alerts that give visibility into how this data is being accessed or moved. For more information, see the <a href="https://docs.aws.amazon.com/macie/latest/userguide/what-is-macie.html">Amazon Macie Classic User Guide</a>. </p><p>A new Amazon Macie is now available with significant design improvements and additional features, at a lower price and in most AWS Regions. We encourage you to explore and use the new and improved features, and benefit from the reduced cost. To learn about features and pricing for the new Amazon Macie, see <a href="https://aws.amazon.com/macie/">Amazon Macie</a>.</p>
 */
@interface AWSMacie : AWSService

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

     let Macie = AWSMacie.default()

 *Objective-C*

     AWSMacie *Macie = [AWSMacie defaultMacie];

 @return The default service client.
 */
+ (instancetype)defaultMacie;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMacie.register(with: configuration!, forKey: "USWest2Macie")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMacie registerMacieWithConfiguration:configuration forKey:@"USWest2Macie"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Macie = AWSMacie(forKey: "USWest2Macie")

 *Objective-C*

     AWSMacie *Macie = [AWSMacie MacieForKey:@"USWest2Macie"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerMacieWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerMacieWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMacie.register(with: configuration!, forKey: "USWest2Macie")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMacie registerMacieWithConfiguration:configuration forKey:@"USWest2Macie"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Macie = AWSMacie(forKey: "USWest2Macie")

 *Objective-C*

     AWSMacie *Macie = [AWSMacie MacieForKey:@"USWest2Macie"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)MacieForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeMacieForKey:(NSString *)key;

/**
 <p>Associates a specified AWS account with Amazon Macie Classic as a member account.</p>
 
 @param request A container for the necessary parameters to execute the AssociateMemberAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorLimitExceeded`, `AWSMacieErrorInternal`.
 
 @see AWSMacieAssociateMemberAccountRequest
 */
- (AWSTask *)associateMemberAccount:(AWSMacieAssociateMemberAccountRequest *)request;

/**
 <p>Associates a specified AWS account with Amazon Macie Classic as a member account.</p>
 
 @param request A container for the necessary parameters to execute the AssociateMemberAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorLimitExceeded`, `AWSMacieErrorInternal`.
 
 @see AWSMacieAssociateMemberAccountRequest
 */
- (void)associateMemberAccount:(AWSMacieAssociateMemberAccountRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates specified S3 resources with Amazon Macie Classic for monitoring and data classification. If memberAccountId isn't specified, the action associates specified S3 resources with Macie Classic for the current master account. If memberAccountId is specified, the action associates specified S3 resources with Macie Classic for the specified member account. </p>
 
 @param request A container for the necessary parameters to execute the AssociateS3Resources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMacieAssociateS3ResourcesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorAccessDenied`, `AWSMacieErrorLimitExceeded`, `AWSMacieErrorInternal`.
 
 @see AWSMacieAssociateS3ResourcesRequest
 @see AWSMacieAssociateS3ResourcesResult
 */
- (AWSTask<AWSMacieAssociateS3ResourcesResult *> *)associateS3Resources:(AWSMacieAssociateS3ResourcesRequest *)request;

/**
 <p>Associates specified S3 resources with Amazon Macie Classic for monitoring and data classification. If memberAccountId isn't specified, the action associates specified S3 resources with Macie Classic for the current master account. If memberAccountId is specified, the action associates specified S3 resources with Macie Classic for the specified member account. </p>
 
 @param request A container for the necessary parameters to execute the AssociateS3Resources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorAccessDenied`, `AWSMacieErrorLimitExceeded`, `AWSMacieErrorInternal`.
 
 @see AWSMacieAssociateS3ResourcesRequest
 @see AWSMacieAssociateS3ResourcesResult
 */
- (void)associateS3Resources:(AWSMacieAssociateS3ResourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSMacieAssociateS3ResourcesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified member account from Amazon Macie Classic.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMemberAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorInternal`.
 
 @see AWSMacieDisassociateMemberAccountRequest
 */
- (AWSTask *)disassociateMemberAccount:(AWSMacieDisassociateMemberAccountRequest *)request;

/**
 <p>Removes the specified member account from Amazon Macie Classic.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateMemberAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorInternal`.
 
 @see AWSMacieDisassociateMemberAccountRequest
 */
- (void)disassociateMemberAccount:(AWSMacieDisassociateMemberAccountRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes specified S3 resources from being monitored by Amazon Macie Classic. If memberAccountId isn't specified, the action removes specified S3 resources from Macie Classic for the current master account. If memberAccountId is specified, the action removes specified S3 resources from Macie Classic for the specified member account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateS3Resources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMacieDisassociateS3ResourcesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorAccessDenied`, `AWSMacieErrorInternal`.
 
 @see AWSMacieDisassociateS3ResourcesRequest
 @see AWSMacieDisassociateS3ResourcesResult
 */
- (AWSTask<AWSMacieDisassociateS3ResourcesResult *> *)disassociateS3Resources:(AWSMacieDisassociateS3ResourcesRequest *)request;

/**
 <p>Removes specified S3 resources from being monitored by Amazon Macie Classic. If memberAccountId isn't specified, the action removes specified S3 resources from Macie Classic for the current master account. If memberAccountId is specified, the action removes specified S3 resources from Macie Classic for the specified member account.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateS3Resources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorAccessDenied`, `AWSMacieErrorInternal`.
 
 @see AWSMacieDisassociateS3ResourcesRequest
 @see AWSMacieDisassociateS3ResourcesResult
 */
- (void)disassociateS3Resources:(AWSMacieDisassociateS3ResourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSMacieDisassociateS3ResourcesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all Amazon Macie Classic member accounts for the current Amazon Macie Classic master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMemberAccounts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMacieListMemberAccountsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInternal`, `AWSMacieErrorInvalidInput`.
 
 @see AWSMacieListMemberAccountsRequest
 @see AWSMacieListMemberAccountsResult
 */
- (AWSTask<AWSMacieListMemberAccountsResult *> *)listMemberAccounts:(AWSMacieListMemberAccountsRequest *)request;

/**
 <p>Lists all Amazon Macie Classic member accounts for the current Amazon Macie Classic master account.</p>
 
 @param request A container for the necessary parameters to execute the ListMemberAccounts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInternal`, `AWSMacieErrorInvalidInput`.
 
 @see AWSMacieListMemberAccountsRequest
 @see AWSMacieListMemberAccountsResult
 */
- (void)listMemberAccounts:(AWSMacieListMemberAccountsRequest *)request completionHandler:(void (^ _Nullable)(AWSMacieListMemberAccountsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the S3 resources associated with Amazon Macie Classic. If memberAccountId isn't specified, the action lists the S3 resources associated with Amazon Macie Classic for the current master account. If memberAccountId is specified, the action lists the S3 resources associated with Amazon Macie Classic for the specified member account. </p>
 
 @param request A container for the necessary parameters to execute the ListS3Resources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMacieListS3ResourcesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorAccessDenied`, `AWSMacieErrorInternal`.
 
 @see AWSMacieListS3ResourcesRequest
 @see AWSMacieListS3ResourcesResult
 */
- (AWSTask<AWSMacieListS3ResourcesResult *> *)listS3Resources:(AWSMacieListS3ResourcesRequest *)request;

/**
 <p>Lists all the S3 resources associated with Amazon Macie Classic. If memberAccountId isn't specified, the action lists the S3 resources associated with Amazon Macie Classic for the current master account. If memberAccountId is specified, the action lists the S3 resources associated with Amazon Macie Classic for the specified member account. </p>
 
 @param request A container for the necessary parameters to execute the ListS3Resources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorAccessDenied`, `AWSMacieErrorInternal`.
 
 @see AWSMacieListS3ResourcesRequest
 @see AWSMacieListS3ResourcesResult
 */
- (void)listS3Resources:(AWSMacieListS3ResourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSMacieListS3ResourcesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the classification types for the specified S3 resources. If memberAccountId isn't specified, the action updates the classification types of the S3 resources associated with Amazon Macie Classic for the current master account. If memberAccountId is specified, the action updates the classification types of the S3 resources associated with Amazon Macie Classic for the specified member account. </p>
 
 @param request A container for the necessary parameters to execute the UpdateS3Resources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMacieUpdateS3ResourcesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorAccessDenied`, `AWSMacieErrorInternal`.
 
 @see AWSMacieUpdateS3ResourcesRequest
 @see AWSMacieUpdateS3ResourcesResult
 */
- (AWSTask<AWSMacieUpdateS3ResourcesResult *> *)updateS3Resources:(AWSMacieUpdateS3ResourcesRequest *)request;

/**
 <p>Updates the classification types for the specified S3 resources. If memberAccountId isn't specified, the action updates the classification types of the S3 resources associated with Amazon Macie Classic for the current master account. If memberAccountId is specified, the action updates the classification types of the S3 resources associated with Amazon Macie Classic for the specified member account. </p>
 
 @param request A container for the necessary parameters to execute the UpdateS3Resources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMacieErrorDomain` domain and the following error code: `AWSMacieErrorInvalidInput`, `AWSMacieErrorAccessDenied`, `AWSMacieErrorInternal`.
 
 @see AWSMacieUpdateS3ResourcesRequest
 @see AWSMacieUpdateS3ResourcesResult
 */
- (void)updateS3Resources:(AWSMacieUpdateS3ResourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSMacieUpdateS3ResourcesResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
