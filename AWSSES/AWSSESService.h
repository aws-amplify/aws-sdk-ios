//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSSESModel.h"
#import "AWSSESResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>Amazon Simple Email Service</fullname><p> This is the API Reference for Amazon Simple Email Service (Amazon SES). This documentation is intended to be used in conjunction with the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html">Amazon SES Developer Guide</a>. </p><note><p> For a list of Amazon SES endpoints to use in service requests, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html">Regions and Amazon SES</a> in the Amazon SES Developer Guide. </p></note>
 */
@interface AWSSES : AWSService

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

     let SES = AWSSES.default()

 *Objective-C*

     AWSSES *SES = [AWSSES defaultSES];

 @return The default service client.
 */
+ (instancetype)defaultSES;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSES.register(with: configuration!, forKey: "USWest2SES")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSES registerSESWithConfiguration:configuration forKey:@"USWest2SES"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SES = AWSSES(forKey: "USWest2SES")

 *Objective-C*

     AWSSES *SES = [AWSSES SESForKey:@"USWest2SES"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSESWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSESWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSES.register(with: configuration!, forKey: "USWest2SES")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSES registerSESWithConfiguration:configuration forKey:@"USWest2SES"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SES = AWSSES(forKey: "USWest2SES")

 *Objective-C*

     AWSSES *SES = [AWSSES SESForKey:@"USWest2SES"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SESForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSESForKey:(NSString *)key;

/**
 <p>Creates a receipt rule set by cloning an existing one. All receipt rules and configurations are copied to the new receipt rule set and are completely independent of the source rule set.</p><p>For information about setting up rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the CloneReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCloneReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCloneReceiptRuleSetRequest
 @see AWSSESCloneReceiptRuleSetResponse
 */
- (AWSTask<AWSSESCloneReceiptRuleSetResponse *> *)cloneReceiptRuleSet:(AWSSESCloneReceiptRuleSetRequest *)request;

/**
 <p>Creates a receipt rule set by cloning an existing one. All receipt rules and configurations are copied to the new receipt rule set and are completely independent of the source rule set.</p><p>For information about setting up rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the CloneReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCloneReceiptRuleSetRequest
 @see AWSSESCloneReceiptRuleSetResponse
 */
- (void)cloneReceiptRuleSet:(AWSSESCloneReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCloneReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new IP address filter.</p><p>For information about setting up IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateReceiptFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorLimitExceeded`, `AWSSESErrorAlreadyExists`.
 
 @see AWSSESCreateReceiptFilterRequest
 @see AWSSESCreateReceiptFilterResponse
 */
- (AWSTask<AWSSESCreateReceiptFilterResponse *> *)createReceiptFilter:(AWSSESCreateReceiptFilterRequest *)request;

/**
 <p>Creates a new IP address filter.</p><p>For information about setting up IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorLimitExceeded`, `AWSSESErrorAlreadyExists`.
 
 @see AWSSESCreateReceiptFilterRequest
 @see AWSSESCreateReceiptFilterResponse
 */
- (void)createReceiptFilter:(AWSSESCreateReceiptFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateReceiptFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a receipt rule.</p><p>For information about setting up receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateReceiptRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidSnsTopic`, `AWSSESErrorInvalidS3Configuration`, `AWSSESErrorInvalidLambdaFunction`, `AWSSESErrorAlreadyExists`, `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateReceiptRuleRequest
 @see AWSSESCreateReceiptRuleResponse
 */
- (AWSTask<AWSSESCreateReceiptRuleResponse *> *)createReceiptRule:(AWSSESCreateReceiptRuleRequest *)request;

/**
 <p>Creates a receipt rule.</p><p>For information about setting up receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidSnsTopic`, `AWSSESErrorInvalidS3Configuration`, `AWSSESErrorInvalidLambdaFunction`, `AWSSESErrorAlreadyExists`, `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateReceiptRuleRequest
 @see AWSSESCreateReceiptRuleResponse
 */
- (void)createReceiptRule:(AWSSESCreateReceiptRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateReceiptRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an empty receipt rule set.</p><p>For information about setting up receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateReceiptRuleSetRequest
 @see AWSSESCreateReceiptRuleSetResponse
 */
- (AWSTask<AWSSESCreateReceiptRuleSetResponse *> *)createReceiptRuleSet:(AWSSESCreateReceiptRuleSetRequest *)request;

/**
 <p>Creates an empty receipt rule set.</p><p>For information about setting up receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateReceiptRuleSetRequest
 @see AWSSESCreateReceiptRuleSetResponse
 */
- (void)createReceiptRuleSet:(AWSSESCreateReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified identity (an email address or a domain) from the list of verified identities.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteIdentityResponse`.
 
 @see AWSSESDeleteIdentityRequest
 @see AWSSESDeleteIdentityResponse
 */
- (AWSTask<AWSSESDeleteIdentityResponse *> *)deleteIdentity:(AWSSESDeleteIdentityRequest *)request;

/**
 <p>Deletes the specified identity (an email address or a domain) from the list of verified identities.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDeleteIdentityRequest
 @see AWSSESDeleteIdentityResponse
 */
- (void)deleteIdentity:(AWSSESDeleteIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified sending authorization policy for the given identity (an email address or a domain). This API returns successfully even if a policy with the specified name does not exist.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentityPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteIdentityPolicyResponse`.
 
 @see AWSSESDeleteIdentityPolicyRequest
 @see AWSSESDeleteIdentityPolicyResponse
 */
- (AWSTask<AWSSESDeleteIdentityPolicyResponse *> *)deleteIdentityPolicy:(AWSSESDeleteIdentityPolicyRequest *)request;

/**
 <p>Deletes the specified sending authorization policy for the given identity (an email address or a domain). This API returns successfully even if a policy with the specified name does not exist.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentityPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDeleteIdentityPolicyRequest
 @see AWSSESDeleteIdentityPolicyResponse
 */
- (void)deleteIdentityPolicy:(AWSSESDeleteIdentityPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteIdentityPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified IP address filter.</p><p>For information about managing IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteReceiptFilterResponse`.
 
 @see AWSSESDeleteReceiptFilterRequest
 @see AWSSESDeleteReceiptFilterResponse
 */
- (AWSTask<AWSSESDeleteReceiptFilterResponse *> *)deleteReceiptFilter:(AWSSESDeleteReceiptFilterRequest *)request;

/**
 <p>Deletes the specified IP address filter.</p><p>For information about managing IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDeleteReceiptFilterRequest
 @see AWSSESDeleteReceiptFilterResponse
 */
- (void)deleteReceiptFilter:(AWSSESDeleteReceiptFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteReceiptFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified receipt rule.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteReceiptRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDeleteReceiptRuleRequest
 @see AWSSESDeleteReceiptRuleResponse
 */
- (AWSTask<AWSSESDeleteReceiptRuleResponse *> *)deleteReceiptRule:(AWSSESDeleteReceiptRuleRequest *)request;

/**
 <p>Deletes the specified receipt rule.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDeleteReceiptRuleRequest
 @see AWSSESDeleteReceiptRuleResponse
 */
- (void)deleteReceiptRule:(AWSSESDeleteReceiptRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteReceiptRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified receipt rule set and all of the receipt rules it contains.</p><note><p>The currently active rule set cannot be deleted.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorCannotDelete`.
 
 @see AWSSESDeleteReceiptRuleSetRequest
 @see AWSSESDeleteReceiptRuleSetResponse
 */
- (AWSTask<AWSSESDeleteReceiptRuleSetResponse *> *)deleteReceiptRuleSet:(AWSSESDeleteReceiptRuleSetRequest *)request;

/**
 <p>Deletes the specified receipt rule set and all of the receipt rules it contains.</p><note><p>The currently active rule set cannot be deleted.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorCannotDelete`.
 
 @see AWSSESDeleteReceiptRuleSetRequest
 @see AWSSESDeleteReceiptRuleSetResponse
 */
- (void)deleteReceiptRuleSet:(AWSSESDeleteReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified email address from the list of verified addresses.</p><important><p>The DeleteVerifiedEmailAddress action is deprecated as of the May 15, 2012 release of Domain Verification. The DeleteIdentity action is now preferred.</p></important><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVerifiedEmailAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSESDeleteVerifiedEmailAddressRequest
 */
- (AWSTask *)deleteVerifiedEmailAddress:(AWSSESDeleteVerifiedEmailAddressRequest *)request;

/**
 <p>Deletes the specified email address from the list of verified addresses.</p><important><p>The DeleteVerifiedEmailAddress action is deprecated as of the May 15, 2012 release of Domain Verification. The DeleteIdentity action is now preferred.</p></important><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVerifiedEmailAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDeleteVerifiedEmailAddressRequest
 */
- (void)deleteVerifiedEmailAddress:(AWSSESDeleteVerifiedEmailAddressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns the metadata and receipt rules for the receipt rule set that is currently active.</p><p>For information about setting up receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActiveReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDescribeActiveReceiptRuleSetResponse`.
 
 @see AWSSESDescribeActiveReceiptRuleSetRequest
 @see AWSSESDescribeActiveReceiptRuleSetResponse
 */
- (AWSTask<AWSSESDescribeActiveReceiptRuleSetResponse *> *)describeActiveReceiptRuleSet:(AWSSESDescribeActiveReceiptRuleSetRequest *)request;

/**
 <p>Returns the metadata and receipt rules for the receipt rule set that is currently active.</p><p>For information about setting up receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActiveReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDescribeActiveReceiptRuleSetRequest
 @see AWSSESDescribeActiveReceiptRuleSetResponse
 */
- (void)describeActiveReceiptRuleSet:(AWSSESDescribeActiveReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDescribeActiveReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the details of the specified receipt rule.</p><p>For information about setting up receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReceiptRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDescribeReceiptRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDescribeReceiptRuleRequest
 @see AWSSESDescribeReceiptRuleResponse
 */
- (AWSTask<AWSSESDescribeReceiptRuleResponse *> *)describeReceiptRule:(AWSSESDescribeReceiptRuleRequest *)request;

/**
 <p>Returns the details of the specified receipt rule.</p><p>For information about setting up receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReceiptRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDescribeReceiptRuleRequest
 @see AWSSESDescribeReceiptRuleResponse
 */
- (void)describeReceiptRule:(AWSSESDescribeReceiptRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDescribeReceiptRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the details of the specified receipt rule set.</p><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDescribeReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDescribeReceiptRuleSetRequest
 @see AWSSESDescribeReceiptRuleSetResponse
 */
- (AWSTask<AWSSESDescribeReceiptRuleSetResponse *> *)describeReceiptRuleSet:(AWSSESDescribeReceiptRuleSetRequest *)request;

/**
 <p>Returns the details of the specified receipt rule set.</p><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDescribeReceiptRuleSetRequest
 @see AWSSESDescribeReceiptRuleSetResponse
 */
- (void)describeReceiptRuleSet:(AWSSESDescribeReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDescribeReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the current status of Easy DKIM signing for an entity. For domain name identities, this action also returns the DKIM tokens that are required for Easy DKIM signing, and whether Amazon SES has successfully verified that these tokens have been published.</p><p>This action takes a list of identities as input and returns the following information for each:</p><ul><li><p>Whether Easy DKIM signing is enabled or disabled.</p></li><li><p>A set of DKIM tokens that represent the identity. If the identity is an email address, the tokens represent the domain of that address.</p></li><li><p>Whether Amazon SES has successfully verified the DKIM tokens published in the domain's DNS. This information is only returned for domain name identities, not for email addresses.</p></li></ul><p>This action is throttled at one request per second and can only get DKIM attributes for up to 100 identities at a time.</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityDkimAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityDkimAttributesResponse`.
 
 @see AWSSESGetIdentityDkimAttributesRequest
 @see AWSSESGetIdentityDkimAttributesResponse
 */
- (AWSTask<AWSSESGetIdentityDkimAttributesResponse *> *)getIdentityDkimAttributes:(AWSSESGetIdentityDkimAttributesRequest *)request;

/**
 <p>Returns the current status of Easy DKIM signing for an entity. For domain name identities, this action also returns the DKIM tokens that are required for Easy DKIM signing, and whether Amazon SES has successfully verified that these tokens have been published.</p><p>This action takes a list of identities as input and returns the following information for each:</p><ul><li><p>Whether Easy DKIM signing is enabled or disabled.</p></li><li><p>A set of DKIM tokens that represent the identity. If the identity is an email address, the tokens represent the domain of that address.</p></li><li><p>Whether Amazon SES has successfully verified the DKIM tokens published in the domain's DNS. This information is only returned for domain name identities, not for email addresses.</p></li></ul><p>This action is throttled at one request per second and can only get DKIM attributes for up to 100 identities at a time.</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityDkimAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESGetIdentityDkimAttributesRequest
 @see AWSSESGetIdentityDkimAttributesResponse
 */
- (void)getIdentityDkimAttributes:(AWSSESGetIdentityDkimAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetIdentityDkimAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the custom MAIL FROM attributes for a list of identities (email addresses and/or domains).</p><p>This action is throttled at one request per second and can only get custom MAIL FROM attributes for up to 100 identities at a time.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityMailFromDomainAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityMailFromDomainAttributesResponse`.
 
 @see AWSSESGetIdentityMailFromDomainAttributesRequest
 @see AWSSESGetIdentityMailFromDomainAttributesResponse
 */
- (AWSTask<AWSSESGetIdentityMailFromDomainAttributesResponse *> *)getIdentityMailFromDomainAttributes:(AWSSESGetIdentityMailFromDomainAttributesRequest *)request;

/**
 <p>Returns the custom MAIL FROM attributes for a list of identities (email addresses and/or domains).</p><p>This action is throttled at one request per second and can only get custom MAIL FROM attributes for up to 100 identities at a time.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityMailFromDomainAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESGetIdentityMailFromDomainAttributesRequest
 @see AWSSESGetIdentityMailFromDomainAttributesResponse
 */
- (void)getIdentityMailFromDomainAttributes:(AWSSESGetIdentityMailFromDomainAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetIdentityMailFromDomainAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Given a list of verified identities (email addresses and/or domains), returns a structure describing identity notification attributes.</p><p>This action is throttled at one request per second and can only get notification attributes for up to 100 identities at a time.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityNotificationAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityNotificationAttributesResponse`.
 
 @see AWSSESGetIdentityNotificationAttributesRequest
 @see AWSSESGetIdentityNotificationAttributesResponse
 */
- (AWSTask<AWSSESGetIdentityNotificationAttributesResponse *> *)getIdentityNotificationAttributes:(AWSSESGetIdentityNotificationAttributesRequest *)request;

/**
 <p>Given a list of verified identities (email addresses and/or domains), returns a structure describing identity notification attributes.</p><p>This action is throttled at one request per second and can only get notification attributes for up to 100 identities at a time.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityNotificationAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESGetIdentityNotificationAttributesRequest
 @see AWSSESGetIdentityNotificationAttributesResponse
 */
- (void)getIdentityNotificationAttributes:(AWSSESGetIdentityNotificationAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetIdentityNotificationAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the requested sending authorization policies for the given identity (an email address or a domain). The policies are returned as a map of policy names to policy contents. You can retrieve a maximum of 20 policies at a time.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityPoliciesResponse`.
 
 @see AWSSESGetIdentityPoliciesRequest
 @see AWSSESGetIdentityPoliciesResponse
 */
- (AWSTask<AWSSESGetIdentityPoliciesResponse *> *)getIdentityPolicies:(AWSSESGetIdentityPoliciesRequest *)request;

/**
 <p>Returns the requested sending authorization policies for the given identity (an email address or a domain). The policies are returned as a map of policy names to policy contents. You can retrieve a maximum of 20 policies at a time.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESGetIdentityPoliciesRequest
 @see AWSSESGetIdentityPoliciesResponse
 */
- (void)getIdentityPolicies:(AWSSESGetIdentityPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetIdentityPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Given a list of identities (email addresses and/or domains), returns the verification status and (for domain identities) the verification token for each identity.</p><p>This action is throttled at one request per second and can only get verification attributes for up to 100 identities at a time.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityVerificationAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityVerificationAttributesResponse`.
 
 @see AWSSESGetIdentityVerificationAttributesRequest
 @see AWSSESGetIdentityVerificationAttributesResponse
 */
- (AWSTask<AWSSESGetIdentityVerificationAttributesResponse *> *)getIdentityVerificationAttributes:(AWSSESGetIdentityVerificationAttributesRequest *)request;

/**
 <p>Given a list of identities (email addresses and/or domains), returns the verification status and (for domain identities) the verification token for each identity.</p><p>This action is throttled at one request per second and can only get verification attributes for up to 100 identities at a time.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityVerificationAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESGetIdentityVerificationAttributesRequest
 @see AWSSESGetIdentityVerificationAttributesResponse
 */
- (void)getIdentityVerificationAttributes:(AWSSESGetIdentityVerificationAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetIdentityVerificationAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the user's current sending limits.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the GetSendQuota service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetSendQuotaResponse`.
 
 @see AWSRequest
 @see AWSSESGetSendQuotaResponse
 */
- (AWSTask<AWSSESGetSendQuotaResponse *> *)getSendQuota:(AWSRequest *)request;

/**
 <p>Returns the user's current sending limits.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the GetSendQuota service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRequest
 @see AWSSESGetSendQuotaResponse
 */
- (void)getSendQuota:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetSendQuotaResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the user's sending statistics. The result is a list of data points, representing the last two weeks of sending activity.</p><p>Each data point in the list contains statistics for a 15-minute interval.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the GetSendStatistics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetSendStatisticsResponse`.
 
 @see AWSRequest
 @see AWSSESGetSendStatisticsResponse
 */
- (AWSTask<AWSSESGetSendStatisticsResponse *> *)getSendStatistics:(AWSRequest *)request;

/**
 <p>Returns the user's sending statistics. The result is a list of data points, representing the last two weeks of sending activity.</p><p>Each data point in the list contains statistics for a 15-minute interval.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the GetSendStatistics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRequest
 @see AWSSESGetSendStatisticsResponse
 */
- (void)getSendStatistics:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetSendStatisticsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list containing all of the identities (email addresses and domains) for your AWS account, regardless of verification status.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListIdentitiesResponse`.
 
 @see AWSSESListIdentitiesRequest
 @see AWSSESListIdentitiesResponse
 */
- (AWSTask<AWSSESListIdentitiesResponse *> *)listIdentities:(AWSSESListIdentitiesRequest *)request;

/**
 <p>Returns a list containing all of the identities (email addresses and domains) for your AWS account, regardless of verification status.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESListIdentitiesRequest
 @see AWSSESListIdentitiesResponse
 */
- (void)listIdentities:(AWSSESListIdentitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListIdentitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of sending authorization policies that are attached to the given identity (an email address or a domain). This API returns only a list. If you want the actual policy content, you can use <code>GetIdentityPolicies</code>.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentityPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListIdentityPoliciesResponse`.
 
 @see AWSSESListIdentityPoliciesRequest
 @see AWSSESListIdentityPoliciesResponse
 */
- (AWSTask<AWSSESListIdentityPoliciesResponse *> *)listIdentityPolicies:(AWSSESListIdentityPoliciesRequest *)request;

/**
 <p>Returns a list of sending authorization policies that are attached to the given identity (an email address or a domain). This API returns only a list. If you want the actual policy content, you can use <code>GetIdentityPolicies</code>.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentityPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESListIdentityPoliciesRequest
 @see AWSSESListIdentityPoliciesResponse
 */
- (void)listIdentityPolicies:(AWSSESListIdentityPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListIdentityPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the IP address filters associated with your AWS account.</p><p>For information about managing IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListReceiptFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListReceiptFiltersResponse`.
 
 @see AWSSESListReceiptFiltersRequest
 @see AWSSESListReceiptFiltersResponse
 */
- (AWSTask<AWSSESListReceiptFiltersResponse *> *)listReceiptFilters:(AWSSESListReceiptFiltersRequest *)request;

/**
 <p>Lists the IP address filters associated with your AWS account.</p><p>For information about managing IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListReceiptFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESListReceiptFiltersRequest
 @see AWSSESListReceiptFiltersResponse
 */
- (void)listReceiptFilters:(AWSSESListReceiptFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListReceiptFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the receipt rule sets that exist under your AWS account. If there are additional receipt rule sets to be retrieved, you will receive a <code>NextToken</code> that you can provide to the next call to <code>ListReceiptRuleSets</code> to retrieve the additional entries.</p><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListReceiptRuleSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListReceiptRuleSetsResponse`.
 
 @see AWSSESListReceiptRuleSetsRequest
 @see AWSSESListReceiptRuleSetsResponse
 */
- (AWSTask<AWSSESListReceiptRuleSetsResponse *> *)listReceiptRuleSets:(AWSSESListReceiptRuleSetsRequest *)request;

/**
 <p>Lists the receipt rule sets that exist under your AWS account. If there are additional receipt rule sets to be retrieved, you will receive a <code>NextToken</code> that you can provide to the next call to <code>ListReceiptRuleSets</code> to retrieve the additional entries.</p><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListReceiptRuleSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESListReceiptRuleSetsRequest
 @see AWSSESListReceiptRuleSetsResponse
 */
- (void)listReceiptRuleSets:(AWSSESListReceiptRuleSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListReceiptRuleSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list containing all of the email addresses that have been verified.</p><important><p>The ListVerifiedEmailAddresses action is deprecated as of the May 15, 2012 release of Domain Verification. The ListIdentities action is now preferred.</p></important><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListVerifiedEmailAddresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListVerifiedEmailAddressesResponse`.
 
 @see AWSRequest
 @see AWSSESListVerifiedEmailAddressesResponse
 */
- (AWSTask<AWSSESListVerifiedEmailAddressesResponse *> *)listVerifiedEmailAddresses:(AWSRequest *)request;

/**
 <p>Returns a list containing all of the email addresses that have been verified.</p><important><p>The ListVerifiedEmailAddresses action is deprecated as of the May 15, 2012 release of Domain Verification. The ListIdentities action is now preferred.</p></important><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListVerifiedEmailAddresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRequest
 @see AWSSESListVerifiedEmailAddressesResponse
 */
- (void)listVerifiedEmailAddresses:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListVerifiedEmailAddressesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or updates a sending authorization policy for the specified identity (an email address or a domain).</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the PutIdentityPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutIdentityPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidPolicy`.
 
 @see AWSSESPutIdentityPolicyRequest
 @see AWSSESPutIdentityPolicyResponse
 */
- (AWSTask<AWSSESPutIdentityPolicyResponse *> *)putIdentityPolicy:(AWSSESPutIdentityPolicyRequest *)request;

/**
 <p>Adds or updates a sending authorization policy for the specified identity (an email address or a domain).</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the PutIdentityPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidPolicy`.
 
 @see AWSSESPutIdentityPolicyRequest
 @see AWSSESPutIdentityPolicyResponse
 */
- (void)putIdentityPolicy:(AWSSESPutIdentityPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutIdentityPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reorders the receipt rules within a receipt rule set.</p><note><p>All of the rules in the rule set must be represented in this request. That is, this API will return an error if the reorder request doesn't explicitly position all of the rules.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ReorderReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESReorderReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`.
 
 @see AWSSESReorderReceiptRuleSetRequest
 @see AWSSESReorderReceiptRuleSetResponse
 */
- (AWSTask<AWSSESReorderReceiptRuleSetResponse *> *)reorderReceiptRuleSet:(AWSSESReorderReceiptRuleSetRequest *)request;

/**
 <p>Reorders the receipt rules within a receipt rule set.</p><note><p>All of the rules in the rule set must be represented in this request. That is, this API will return an error if the reorder request doesn't explicitly position all of the rules.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ReorderReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`.
 
 @see AWSSESReorderReceiptRuleSetRequest
 @see AWSSESReorderReceiptRuleSetResponse
 */
- (void)reorderReceiptRuleSet:(AWSSESReorderReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESReorderReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates and sends a bounce message to the sender of an email you received through Amazon SES. You can only use this API on an email up to 24 hours after you receive it.</p><note><p>You cannot use this API to send generic bounces for mail that was not received by Amazon SES.</p></note><p>For information about receiving email through Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the SendBounce service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendBounceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`.
 
 @see AWSSESSendBounceRequest
 @see AWSSESSendBounceResponse
 */
- (AWSTask<AWSSESSendBounceResponse *> *)sendBounce:(AWSSESSendBounceRequest *)request;

/**
 <p>Generates and sends a bounce message to the sender of an email you received through Amazon SES. You can only use this API on an email up to 24 hours after you receive it.</p><note><p>You cannot use this API to send generic bounces for mail that was not received by Amazon SES.</p></note><p>For information about receiving email through Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the SendBounce service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`.
 
 @see AWSSESSendBounceRequest
 @see AWSSESSendBounceResponse
 */
- (void)sendBounce:(AWSSESSendBounceRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendBounceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Composes an email message based on input data, and then immediately queues the message for sending.</p><p>There are several important points to know about <code>SendEmail</code>:</p><ul><li><p>You can only send email from verified email addresses and domains; otherwise, you will get an "Email address not verified" error. If your account is still in the Amazon SES sandbox, you must also verify every recipient email address except for the recipients provided by the Amazon SES mailbox simulator. For more information, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Amazon SES Developer Guide</a>.</p></li><li><p>The total size of the message cannot exceed 10 MB. This includes any attachments that are part of the message.</p></li><li><p>Amazon SES has a limit on the total number of recipients per message. The combined number of To:, CC: and BCC: email addresses cannot exceed 50. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call Amazon SES repeatedly to send the message to each group.</p></li><li><p>For every message that you send, the total number of recipients (To:, CC: and BCC:) is counted against your sending quota - the maximum number of emails you can send in a 24-hour period. For information about your sending quota, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Amazon SES Developer Guide</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the SendEmail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`.
 
 @see AWSSESSendEmailRequest
 @see AWSSESSendEmailResponse
 */
- (AWSTask<AWSSESSendEmailResponse *> *)sendEmail:(AWSSESSendEmailRequest *)request;

/**
 <p>Composes an email message based on input data, and then immediately queues the message for sending.</p><p>There are several important points to know about <code>SendEmail</code>:</p><ul><li><p>You can only send email from verified email addresses and domains; otherwise, you will get an "Email address not verified" error. If your account is still in the Amazon SES sandbox, you must also verify every recipient email address except for the recipients provided by the Amazon SES mailbox simulator. For more information, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Amazon SES Developer Guide</a>.</p></li><li><p>The total size of the message cannot exceed 10 MB. This includes any attachments that are part of the message.</p></li><li><p>Amazon SES has a limit on the total number of recipients per message. The combined number of To:, CC: and BCC: email addresses cannot exceed 50. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call Amazon SES repeatedly to send the message to each group.</p></li><li><p>For every message that you send, the total number of recipients (To:, CC: and BCC:) is counted against your sending quota - the maximum number of emails you can send in a 24-hour period. For information about your sending quota, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Amazon SES Developer Guide</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the SendEmail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`.
 
 @see AWSSESSendEmailRequest
 @see AWSSESSendEmailResponse
 */
- (void)sendEmail:(AWSSESSendEmailRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendEmailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends an email message, with header and content specified by the client. The <code>SendRawEmail</code> action is useful for sending multipart MIME emails. The raw text of the message must comply with Internet email standards; otherwise, the message cannot be sent. </p><p>There are several important points to know about <code>SendRawEmail</code>:</p><ul><li><p>You can only send email from verified email addresses and domains; otherwise, you will get an "Email address not verified" error. If your account is still in the Amazon SES sandbox, you must also verify every recipient email address except for the recipients provided by the Amazon SES mailbox simulator. For more information, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Amazon SES Developer Guide</a>.</p></li><li><p>The total size of the message cannot exceed 10 MB. This includes any attachments that are part of the message.</p></li><li><p>Amazon SES has a limit on the total number of recipients per message. The combined number of To:, CC: and BCC: email addresses cannot exceed 50. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call Amazon SES repeatedly to send the message to each group.</p></li><li><p>The To:, CC:, and BCC: headers in the raw message can contain a group list. Note that each recipient in a group list counts towards the 50-recipient limit.</p></li><li><p>Amazon SES overrides any Message-ID and Date headers you provide.</p></li><li><p>For every message that you send, the total number of recipients (To:, CC: and BCC:) is counted against your sending quota - the maximum number of emails you can send in a 24-hour period. For information about your sending quota, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Amazon SES Developer Guide</a>.</p></li><li><p>If you are using sending authorization to send on behalf of another user, <code>SendRawEmail</code> enables you to specify the cross-account identity for the email's "Source," "From," and "Return-Path" parameters in one of two ways: you can pass optional parameters <code>SourceArn</code>, <code>FromArn</code>, and/or <code>ReturnPathArn</code> to the API, or you can include the following X-headers in the header of your raw email:</p><ul><li><p><code>X-SES-SOURCE-ARN</code></p></li><li><p><code>X-SES-FROM-ARN</code></p></li><li><p><code>X-SES-RETURN-PATH-ARN</code></p></li></ul><important><p>Do not include these X-headers in the DKIM signature, because they are removed by Amazon SES before sending the email.</p></important><p>For the most common sending authorization use case, we recommend that you specify the <code>SourceIdentityArn</code> and do not specify either the <code>FromIdentityArn</code> or <code>ReturnPathIdentityArn</code>. (The same note applies to the corresponding X-headers.) If you only specify the <code>SourceIdentityArn</code>, Amazon SES will simply set the "From" address and the "Return Path" address to the identity specified in <code>SourceIdentityArn</code>. For more information about sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the SendRawEmail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendRawEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`.
 
 @see AWSSESSendRawEmailRequest
 @see AWSSESSendRawEmailResponse
 */
- (AWSTask<AWSSESSendRawEmailResponse *> *)sendRawEmail:(AWSSESSendRawEmailRequest *)request;

/**
 <p>Sends an email message, with header and content specified by the client. The <code>SendRawEmail</code> action is useful for sending multipart MIME emails. The raw text of the message must comply with Internet email standards; otherwise, the message cannot be sent. </p><p>There are several important points to know about <code>SendRawEmail</code>:</p><ul><li><p>You can only send email from verified email addresses and domains; otherwise, you will get an "Email address not verified" error. If your account is still in the Amazon SES sandbox, you must also verify every recipient email address except for the recipients provided by the Amazon SES mailbox simulator. For more information, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Amazon SES Developer Guide</a>.</p></li><li><p>The total size of the message cannot exceed 10 MB. This includes any attachments that are part of the message.</p></li><li><p>Amazon SES has a limit on the total number of recipients per message. The combined number of To:, CC: and BCC: email addresses cannot exceed 50. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call Amazon SES repeatedly to send the message to each group.</p></li><li><p>The To:, CC:, and BCC: headers in the raw message can contain a group list. Note that each recipient in a group list counts towards the 50-recipient limit.</p></li><li><p>Amazon SES overrides any Message-ID and Date headers you provide.</p></li><li><p>For every message that you send, the total number of recipients (To:, CC: and BCC:) is counted against your sending quota - the maximum number of emails you can send in a 24-hour period. For information about your sending quota, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Amazon SES Developer Guide</a>.</p></li><li><p>If you are using sending authorization to send on behalf of another user, <code>SendRawEmail</code> enables you to specify the cross-account identity for the email's "Source," "From," and "Return-Path" parameters in one of two ways: you can pass optional parameters <code>SourceArn</code>, <code>FromArn</code>, and/or <code>ReturnPathArn</code> to the API, or you can include the following X-headers in the header of your raw email:</p><ul><li><p><code>X-SES-SOURCE-ARN</code></p></li><li><p><code>X-SES-FROM-ARN</code></p></li><li><p><code>X-SES-RETURN-PATH-ARN</code></p></li></ul><important><p>Do not include these X-headers in the DKIM signature, because they are removed by Amazon SES before sending the email.</p></important><p>For the most common sending authorization use case, we recommend that you specify the <code>SourceIdentityArn</code> and do not specify either the <code>FromIdentityArn</code> or <code>ReturnPathIdentityArn</code>. (The same note applies to the corresponding X-headers.) If you only specify the <code>SourceIdentityArn</code>, Amazon SES will simply set the "From" address and the "Return Path" address to the identity specified in <code>SourceIdentityArn</code>. For more information about sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the SendRawEmail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`.
 
 @see AWSSESSendRawEmailRequest
 @see AWSSESSendRawEmailResponse
 */
- (void)sendRawEmail:(AWSSESSendRawEmailRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendRawEmailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the specified receipt rule set as the active receipt rule set.</p><note><p>To disable your email-receiving through Amazon SES completely, you can call this API with RuleSetName set to null.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the SetActiveReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetActiveReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESSetActiveReceiptRuleSetRequest
 @see AWSSESSetActiveReceiptRuleSetResponse
 */
- (AWSTask<AWSSESSetActiveReceiptRuleSetResponse *> *)setActiveReceiptRuleSet:(AWSSESSetActiveReceiptRuleSetRequest *)request;

/**
 <p>Sets the specified receipt rule set as the active receipt rule set.</p><note><p>To disable your email-receiving through Amazon SES completely, you can call this API with RuleSetName set to null.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the SetActiveReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESSetActiveReceiptRuleSetRequest
 @see AWSSESSetActiveReceiptRuleSetResponse
 */
- (void)setActiveReceiptRuleSet:(AWSSESSetActiveReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetActiveReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables or disables Easy DKIM signing of email sent from an identity:</p><ul><li><p>If Easy DKIM signing is enabled for a domain name identity (e.g., <code>example.com</code>), then Amazon SES will DKIM-sign all email sent by addresses under that domain name (e.g., <code>user@example.com</code>).</p></li><li><p>If Easy DKIM signing is enabled for an email address, then Amazon SES will DKIM-sign all email sent by that email address.</p></li></ul><p>For email addresses (e.g., <code>user@example.com</code>), you can only enable Easy DKIM signing if the corresponding domain (e.g., <code>example.com</code>) has been set up for Easy DKIM using the AWS Console or the <code>VerifyDomainDkim</code> action.</p><p>This action is throttled at one request per second.</p><p>For more information about Easy DKIM signing, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityDkimEnabled service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityDkimEnabledResponse`.
 
 @see AWSSESSetIdentityDkimEnabledRequest
 @see AWSSESSetIdentityDkimEnabledResponse
 */
- (AWSTask<AWSSESSetIdentityDkimEnabledResponse *> *)setIdentityDkimEnabled:(AWSSESSetIdentityDkimEnabledRequest *)request;

/**
 <p>Enables or disables Easy DKIM signing of email sent from an identity:</p><ul><li><p>If Easy DKIM signing is enabled for a domain name identity (e.g., <code>example.com</code>), then Amazon SES will DKIM-sign all email sent by addresses under that domain name (e.g., <code>user@example.com</code>).</p></li><li><p>If Easy DKIM signing is enabled for an email address, then Amazon SES will DKIM-sign all email sent by that email address.</p></li></ul><p>For email addresses (e.g., <code>user@example.com</code>), you can only enable Easy DKIM signing if the corresponding domain (e.g., <code>example.com</code>) has been set up for Easy DKIM using the AWS Console or the <code>VerifyDomainDkim</code> action.</p><p>This action is throttled at one request per second.</p><p>For more information about Easy DKIM signing, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityDkimEnabled service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESSetIdentityDkimEnabledRequest
 @see AWSSESSetIdentityDkimEnabledResponse
 */
- (void)setIdentityDkimEnabled:(AWSSESSetIdentityDkimEnabledRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetIdentityDkimEnabledResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Given an identity (an email address or a domain), enables or disables whether Amazon SES forwards bounce and complaint notifications as email. Feedback forwarding can only be disabled when Amazon Simple Notification Service (Amazon SNS) topics are specified for both bounces and complaints.</p><note><p>Feedback forwarding does not apply to delivery notifications. Delivery notifications are only available through Amazon SNS.</p></note><p>This action is throttled at one request per second.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityFeedbackForwardingEnabled service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityFeedbackForwardingEnabledResponse`.
 
 @see AWSSESSetIdentityFeedbackForwardingEnabledRequest
 @see AWSSESSetIdentityFeedbackForwardingEnabledResponse
 */
- (AWSTask<AWSSESSetIdentityFeedbackForwardingEnabledResponse *> *)setIdentityFeedbackForwardingEnabled:(AWSSESSetIdentityFeedbackForwardingEnabledRequest *)request;

/**
 <p>Given an identity (an email address or a domain), enables or disables whether Amazon SES forwards bounce and complaint notifications as email. Feedback forwarding can only be disabled when Amazon Simple Notification Service (Amazon SNS) topics are specified for both bounces and complaints.</p><note><p>Feedback forwarding does not apply to delivery notifications. Delivery notifications are only available through Amazon SNS.</p></note><p>This action is throttled at one request per second.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityFeedbackForwardingEnabled service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESSetIdentityFeedbackForwardingEnabledRequest
 @see AWSSESSetIdentityFeedbackForwardingEnabledResponse
 */
- (void)setIdentityFeedbackForwardingEnabled:(AWSSESSetIdentityFeedbackForwardingEnabledRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetIdentityFeedbackForwardingEnabledResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Given an identity (an email address or a domain), sets whether Amazon SES includes the original email headers in the Amazon Simple Notification Service (Amazon SNS) notifications of a specified type.</p><p>This action is throttled at one request per second.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityHeadersInNotificationsEnabled service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityHeadersInNotificationsEnabledResponse`.
 
 @see AWSSESSetIdentityHeadersInNotificationsEnabledRequest
 @see AWSSESSetIdentityHeadersInNotificationsEnabledResponse
 */
- (AWSTask<AWSSESSetIdentityHeadersInNotificationsEnabledResponse *> *)setIdentityHeadersInNotificationsEnabled:(AWSSESSetIdentityHeadersInNotificationsEnabledRequest *)request;

/**
 <p>Given an identity (an email address or a domain), sets whether Amazon SES includes the original email headers in the Amazon Simple Notification Service (Amazon SNS) notifications of a specified type.</p><p>This action is throttled at one request per second.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityHeadersInNotificationsEnabled service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESSetIdentityHeadersInNotificationsEnabledRequest
 @see AWSSESSetIdentityHeadersInNotificationsEnabledResponse
 */
- (void)setIdentityHeadersInNotificationsEnabled:(AWSSESSetIdentityHeadersInNotificationsEnabledRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetIdentityHeadersInNotificationsEnabledResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables or disables the custom MAIL FROM domain setup for a verified identity (an email address or a domain).</p><important><p>To send emails using the specified MAIL FROM domain, you must add an MX record to your MAIL FROM domain's DNS settings. If you want your emails to pass Sender Policy Framework (SPF) checks, you must also add or update an SPF record. For more information, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from-set.html">Amazon SES Developer Guide</a>.</p></important><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityMailFromDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityMailFromDomainResponse`.
 
 @see AWSSESSetIdentityMailFromDomainRequest
 @see AWSSESSetIdentityMailFromDomainResponse
 */
- (AWSTask<AWSSESSetIdentityMailFromDomainResponse *> *)setIdentityMailFromDomain:(AWSSESSetIdentityMailFromDomainRequest *)request;

/**
 <p>Enables or disables the custom MAIL FROM domain setup for a verified identity (an email address or a domain).</p><important><p>To send emails using the specified MAIL FROM domain, you must add an MX record to your MAIL FROM domain's DNS settings. If you want your emails to pass Sender Policy Framework (SPF) checks, you must also add or update an SPF record. For more information, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from-set.html">Amazon SES Developer Guide</a>.</p></important><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityMailFromDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESSetIdentityMailFromDomainRequest
 @see AWSSESSetIdentityMailFromDomainResponse
 */
- (void)setIdentityMailFromDomain:(AWSSESSetIdentityMailFromDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetIdentityMailFromDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Given an identity (an email address or a domain), sets the Amazon Simple Notification Service (Amazon SNS) topic to which Amazon SES will publish bounce, complaint, and/or delivery notifications for emails sent with that identity as the <code>Source</code>.</p><note><p>Unless feedback forwarding is enabled, you must specify Amazon SNS topics for bounce and complaint notifications. For more information, see <code>SetIdentityFeedbackForwardingEnabled</code>.</p></note><p>This action is throttled at one request per second.</p><p>For more information about feedback notification, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityNotificationTopic service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityNotificationTopicResponse`.
 
 @see AWSSESSetIdentityNotificationTopicRequest
 @see AWSSESSetIdentityNotificationTopicResponse
 */
- (AWSTask<AWSSESSetIdentityNotificationTopicResponse *> *)setIdentityNotificationTopic:(AWSSESSetIdentityNotificationTopicRequest *)request;

/**
 <p>Given an identity (an email address or a domain), sets the Amazon Simple Notification Service (Amazon SNS) topic to which Amazon SES will publish bounce, complaint, and/or delivery notifications for emails sent with that identity as the <code>Source</code>.</p><note><p>Unless feedback forwarding is enabled, you must specify Amazon SNS topics for bounce and complaint notifications. For more information, see <code>SetIdentityFeedbackForwardingEnabled</code>.</p></note><p>This action is throttled at one request per second.</p><p>For more information about feedback notification, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityNotificationTopic service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESSetIdentityNotificationTopicRequest
 @see AWSSESSetIdentityNotificationTopicResponse
 */
- (void)setIdentityNotificationTopic:(AWSSESSetIdentityNotificationTopicRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetIdentityNotificationTopicResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the position of the specified receipt rule in the receipt rule set.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the SetReceiptRulePosition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetReceiptRulePositionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`.
 
 @see AWSSESSetReceiptRulePositionRequest
 @see AWSSESSetReceiptRulePositionResponse
 */
- (AWSTask<AWSSESSetReceiptRulePositionResponse *> *)setReceiptRulePosition:(AWSSESSetReceiptRulePositionRequest *)request;

/**
 <p>Sets the position of the specified receipt rule in the receipt rule set.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the SetReceiptRulePosition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`.
 
 @see AWSSESSetReceiptRulePositionRequest
 @see AWSSESSetReceiptRulePositionResponse
 */
- (void)setReceiptRulePosition:(AWSSESSetReceiptRulePositionRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetReceiptRulePositionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a receipt rule.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateReceiptRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESUpdateReceiptRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidSnsTopic`, `AWSSESErrorInvalidS3Configuration`, `AWSSESErrorInvalidLambdaFunction`, `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESUpdateReceiptRuleRequest
 @see AWSSESUpdateReceiptRuleResponse
 */
- (AWSTask<AWSSESUpdateReceiptRuleResponse *> *)updateReceiptRule:(AWSSESUpdateReceiptRuleRequest *)request;

/**
 <p>Updates a receipt rule.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateReceiptRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidSnsTopic`, `AWSSESErrorInvalidS3Configuration`, `AWSSESErrorInvalidLambdaFunction`, `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESUpdateReceiptRuleRequest
 @see AWSSESUpdateReceiptRuleResponse
 */
- (void)updateReceiptRule:(AWSSESUpdateReceiptRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSSESUpdateReceiptRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a set of DKIM tokens for a domain. DKIM <i>tokens</i> are character strings that represent your domain's identity. Using these tokens, you will need to create DNS CNAME records that point to DKIM public keys hosted by Amazon SES. Amazon Web Services will eventually detect that you have updated your DNS records; this detection process may take up to 72 hours. Upon successful detection, Amazon SES will be able to DKIM-sign email originating from that domain.</p><p>This action is throttled at one request per second.</p><p>To enable or disable Easy DKIM signing for a domain, use the <code>SetIdentityDkimEnabled</code> action.</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the VerifyDomainDkim service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESVerifyDomainDkimResponse`.
 
 @see AWSSESVerifyDomainDkimRequest
 @see AWSSESVerifyDomainDkimResponse
 */
- (AWSTask<AWSSESVerifyDomainDkimResponse *> *)verifyDomainDkim:(AWSSESVerifyDomainDkimRequest *)request;

/**
 <p>Returns a set of DKIM tokens for a domain. DKIM <i>tokens</i> are character strings that represent your domain's identity. Using these tokens, you will need to create DNS CNAME records that point to DKIM public keys hosted by Amazon SES. Amazon Web Services will eventually detect that you have updated your DNS records; this detection process may take up to 72 hours. Upon successful detection, Amazon SES will be able to DKIM-sign email originating from that domain.</p><p>This action is throttled at one request per second.</p><p>To enable or disable Easy DKIM signing for a domain, use the <code>SetIdentityDkimEnabled</code> action.</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the VerifyDomainDkim service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESVerifyDomainDkimRequest
 @see AWSSESVerifyDomainDkimResponse
 */
- (void)verifyDomainDkim:(AWSSESVerifyDomainDkimRequest *)request completionHandler:(void (^ _Nullable)(AWSSESVerifyDomainDkimResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Verifies a domain.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyDomainIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESVerifyDomainIdentityResponse`.
 
 @see AWSSESVerifyDomainIdentityRequest
 @see AWSSESVerifyDomainIdentityResponse
 */
- (AWSTask<AWSSESVerifyDomainIdentityResponse *> *)verifyDomainIdentity:(AWSSESVerifyDomainIdentityRequest *)request;

/**
 <p>Verifies a domain.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyDomainIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESVerifyDomainIdentityRequest
 @see AWSSESVerifyDomainIdentityResponse
 */
- (void)verifyDomainIdentity:(AWSSESVerifyDomainIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSSESVerifyDomainIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Verifies an email address. This action causes a confirmation email message to be sent to the specified address.</p><important><p>The VerifyEmailAddress action is deprecated as of the May 15, 2012 release of Domain Verification. The VerifyEmailIdentity action is now preferred.</p></important><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyEmailAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSESVerifyEmailAddressRequest
 */
- (AWSTask *)verifyEmailAddress:(AWSSESVerifyEmailAddressRequest *)request;

/**
 <p>Verifies an email address. This action causes a confirmation email message to be sent to the specified address.</p><important><p>The VerifyEmailAddress action is deprecated as of the May 15, 2012 release of Domain Verification. The VerifyEmailIdentity action is now preferred.</p></important><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyEmailAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESVerifyEmailAddressRequest
 */
- (void)verifyEmailAddress:(AWSSESVerifyEmailAddressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Verifies an email address. This action causes a confirmation email message to be sent to the specified address.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyEmailIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESVerifyEmailIdentityResponse`.
 
 @see AWSSESVerifyEmailIdentityRequest
 @see AWSSESVerifyEmailIdentityResponse
 */
- (AWSTask<AWSSESVerifyEmailIdentityResponse *> *)verifyEmailIdentity:(AWSSESVerifyEmailIdentityRequest *)request;

/**
 <p>Verifies an email address. This action causes a confirmation email message to be sent to the specified address.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyEmailIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESVerifyEmailIdentityRequest
 @see AWSSESVerifyEmailIdentityResponse
 */
- (void)verifyEmailIdentity:(AWSSESVerifyEmailIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSSESVerifyEmailIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
