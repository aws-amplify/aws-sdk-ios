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
#import <AWSCore/AWSCore.h>
#import "AWSSESModel.h"
#import "AWSSESResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSES
FOUNDATION_EXPORT NSString *const AWSSESSDKVersion;

/**
 <fullname>Amazon Simple Email Service</fullname><p> This document contains reference information for the <a href="https://aws.amazon.com/ses/">Amazon Simple Email Service</a> (Amazon SES) API, version 2010-12-01. This document is best used in conjunction with the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html">Amazon SES Developer Guide</a>. </p><note><p> For a list of Amazon SES endpoints to use in service requests, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html">Regions and Amazon SES</a> in the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html">Amazon SES Developer Guide</a>.</p></note>
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
 <p>Creates a receipt rule set by cloning an existing one. All receipt rules and configurations are copied to the new receipt rule set and are completely independent of the source rule set.</p><p>For information about setting up rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CloneReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCloneReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCloneReceiptRuleSetRequest
 @see AWSSESCloneReceiptRuleSetResponse
 */
- (AWSTask<AWSSESCloneReceiptRuleSetResponse *> *)cloneReceiptRuleSet:(AWSSESCloneReceiptRuleSetRequest *)request;

/**
 <p>Creates a receipt rule set by cloning an existing one. All receipt rules and configurations are copied to the new receipt rule set and are completely independent of the source rule set.</p><p>For information about setting up rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CloneReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCloneReceiptRuleSetRequest
 @see AWSSESCloneReceiptRuleSetResponse
 */
- (void)cloneReceiptRuleSet:(AWSSESCloneReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCloneReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a configuration set.</p><p>Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateConfigurationSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetAlreadyExists`, `AWSSESErrorInvalidConfigurationSet`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateConfigurationSetRequest
 @see AWSSESCreateConfigurationSetResponse
 */
- (AWSTask<AWSSESCreateConfigurationSetResponse *> *)createConfigurationSet:(AWSSESCreateConfigurationSetRequest *)request;

/**
 <p>Creates a configuration set.</p><p>Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetAlreadyExists`, `AWSSESErrorInvalidConfigurationSet`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateConfigurationSetRequest
 @see AWSSESCreateConfigurationSetResponse
 */
- (void)createConfigurationSet:(AWSSESCreateConfigurationSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateConfigurationSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a configuration set event destination.</p><note><p>When you create or update an event destination, you must provide one, and only one, destination. The destination can be CloudWatch, Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS).</p></note><p>An event destination is the AWS service to which Amazon SES publishes the email sending events associated with a configuration set. For information about using configuration sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationSetEventDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateConfigurationSetEventDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorEventDestinationAlreadyExists`, `AWSSESErrorInvalidCloudWatchDestination`, `AWSSESErrorInvalidFirehoseDestination`, `AWSSESErrorInvalidSNSDestination`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateConfigurationSetEventDestinationRequest
 @see AWSSESCreateConfigurationSetEventDestinationResponse
 */
- (AWSTask<AWSSESCreateConfigurationSetEventDestinationResponse *> *)createConfigurationSetEventDestination:(AWSSESCreateConfigurationSetEventDestinationRequest *)request;

/**
 <p>Creates a configuration set event destination.</p><note><p>When you create or update an event destination, you must provide one, and only one, destination. The destination can be CloudWatch, Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS).</p></note><p>An event destination is the AWS service to which Amazon SES publishes the email sending events associated with a configuration set. For information about using configuration sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationSetEventDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorEventDestinationAlreadyExists`, `AWSSESErrorInvalidCloudWatchDestination`, `AWSSESErrorInvalidFirehoseDestination`, `AWSSESErrorInvalidSNSDestination`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateConfigurationSetEventDestinationRequest
 @see AWSSESCreateConfigurationSetEventDestinationResponse
 */
- (void)createConfigurationSetEventDestination:(AWSSESCreateConfigurationSetEventDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateConfigurationSetEventDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an association between a configuration set and a custom domain for open and click event tracking. </p><p>By default, images and links used for tracking open and click events are hosted on domains operated by Amazon SES. You can configure a subdomain of your own to handle these events. For information about using custom domains, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationSetTrackingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateConfigurationSetTrackingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorTrackingOptionsAlreadyExists`, `AWSSESErrorInvalidTrackingOptions`.
 
 @see AWSSESCreateConfigurationSetTrackingOptionsRequest
 @see AWSSESCreateConfigurationSetTrackingOptionsResponse
 */
- (AWSTask<AWSSESCreateConfigurationSetTrackingOptionsResponse *> *)createConfigurationSetTrackingOptions:(AWSSESCreateConfigurationSetTrackingOptionsRequest *)request;

/**
 <p>Creates an association between a configuration set and a custom domain for open and click event tracking. </p><p>By default, images and links used for tracking open and click events are hosted on domains operated by Amazon SES. You can configure a subdomain of your own to handle these events. For information about using custom domains, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationSetTrackingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorTrackingOptionsAlreadyExists`, `AWSSESErrorInvalidTrackingOptions`.
 
 @see AWSSESCreateConfigurationSetTrackingOptionsRequest
 @see AWSSESCreateConfigurationSetTrackingOptionsResponse
 */
- (void)createConfigurationSetTrackingOptions:(AWSSESCreateConfigurationSetTrackingOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateConfigurationSetTrackingOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new custom verification email template.</p><p>For more information about custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateCustomVerificationEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorCustomVerificationEmailTemplateAlreadyExists`, `AWSSESErrorFromEmailAddressNotVerified`, `AWSSESErrorCustomVerificationEmailInvalidContent`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateCustomVerificationEmailTemplateRequest
 */
- (AWSTask *)createCustomVerificationEmailTemplate:(AWSSESCreateCustomVerificationEmailTemplateRequest *)request;

/**
 <p>Creates a new custom verification email template.</p><p>For more information about custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateCustomVerificationEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorCustomVerificationEmailTemplateAlreadyExists`, `AWSSESErrorFromEmailAddressNotVerified`, `AWSSESErrorCustomVerificationEmailInvalidContent`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateCustomVerificationEmailTemplateRequest
 */
- (void)createCustomVerificationEmailTemplate:(AWSSESCreateCustomVerificationEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new IP address filter.</p><p>For information about setting up IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateReceiptFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorLimitExceeded`, `AWSSESErrorAlreadyExists`.
 
 @see AWSSESCreateReceiptFilterRequest
 @see AWSSESCreateReceiptFilterResponse
 */
- (AWSTask<AWSSESCreateReceiptFilterResponse *> *)createReceiptFilter:(AWSSESCreateReceiptFilterRequest *)request;

/**
 <p>Creates a new IP address filter.</p><p>For information about setting up IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorLimitExceeded`, `AWSSESErrorAlreadyExists`.
 
 @see AWSSESCreateReceiptFilterRequest
 @see AWSSESCreateReceiptFilterResponse
 */
- (void)createReceiptFilter:(AWSSESCreateReceiptFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateReceiptFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a receipt rule.</p><p>For information about setting up receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateReceiptRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidSnsTopic`, `AWSSESErrorInvalidS3Configuration`, `AWSSESErrorInvalidLambdaFunction`, `AWSSESErrorAlreadyExists`, `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateReceiptRuleRequest
 @see AWSSESCreateReceiptRuleResponse
 */
- (AWSTask<AWSSESCreateReceiptRuleResponse *> *)createReceiptRule:(AWSSESCreateReceiptRuleRequest *)request;

/**
 <p>Creates a receipt rule.</p><p>For information about setting up receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidSnsTopic`, `AWSSESErrorInvalidS3Configuration`, `AWSSESErrorInvalidLambdaFunction`, `AWSSESErrorAlreadyExists`, `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateReceiptRuleRequest
 @see AWSSESCreateReceiptRuleResponse
 */
- (void)createReceiptRule:(AWSSESCreateReceiptRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateReceiptRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an empty receipt rule set.</p><p>For information about setting up receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateReceiptRuleSetRequest
 @see AWSSESCreateReceiptRuleSetResponse
 */
- (AWSTask<AWSSESCreateReceiptRuleSetResponse *> *)createReceiptRuleSet:(AWSSESCreateReceiptRuleSetRequest *)request;

/**
 <p>Creates an empty receipt rule set.</p><p>For information about setting up receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateReceiptRuleSetRequest
 @see AWSSESCreateReceiptRuleSetResponse
 */
- (void)createReceiptRuleSet:(AWSSESCreateReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorInvalidTemplate`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateTemplateRequest
 @see AWSSESCreateTemplateResponse
 */
- (AWSTask<AWSSESCreateTemplateResponse *> *)createTemplate:(AWSSESCreateTemplateRequest *)request;

/**
 <p>Creates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorInvalidTemplate`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateTemplateRequest
 @see AWSSESCreateTemplateResponse
 */
- (void)createTemplate:(AWSSESCreateTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a configuration set. Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteConfigurationSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`.
 
 @see AWSSESDeleteConfigurationSetRequest
 @see AWSSESDeleteConfigurationSetResponse
 */
- (AWSTask<AWSSESDeleteConfigurationSetResponse *> *)deleteConfigurationSet:(AWSSESDeleteConfigurationSetRequest *)request;

/**
 <p>Deletes a configuration set. Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`.
 
 @see AWSSESDeleteConfigurationSetRequest
 @see AWSSESDeleteConfigurationSetResponse
 */
- (void)deleteConfigurationSet:(AWSSESDeleteConfigurationSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteConfigurationSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a configuration set event destination. Configuration set event destinations are associated with configuration sets, which enable you to publish email sending events. For information about using configuration sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationSetEventDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteConfigurationSetEventDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorEventDestinationDoesNotExist`.
 
 @see AWSSESDeleteConfigurationSetEventDestinationRequest
 @see AWSSESDeleteConfigurationSetEventDestinationResponse
 */
- (AWSTask<AWSSESDeleteConfigurationSetEventDestinationResponse *> *)deleteConfigurationSetEventDestination:(AWSSESDeleteConfigurationSetEventDestinationRequest *)request;

/**
 <p>Deletes a configuration set event destination. Configuration set event destinations are associated with configuration sets, which enable you to publish email sending events. For information about using configuration sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationSetEventDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorEventDestinationDoesNotExist`.
 
 @see AWSSESDeleteConfigurationSetEventDestinationRequest
 @see AWSSESDeleteConfigurationSetEventDestinationResponse
 */
- (void)deleteConfigurationSetEventDestination:(AWSSESDeleteConfigurationSetEventDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteConfigurationSetEventDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an association between a configuration set and a custom domain for open and click event tracking.</p><p>By default, images and links used for tracking open and click events are hosted on domains operated by Amazon SES. You can configure a subdomain of your own to handle these events. For information about using custom domains, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html">Amazon SES Developer Guide</a>.</p><note><p>Deleting this kind of association will result in emails sent using the specified configuration set to capture open and click events using the standard, Amazon SES-operated domains.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationSetTrackingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteConfigurationSetTrackingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorTrackingOptionsDoesNotExist`.
 
 @see AWSSESDeleteConfigurationSetTrackingOptionsRequest
 @see AWSSESDeleteConfigurationSetTrackingOptionsResponse
 */
- (AWSTask<AWSSESDeleteConfigurationSetTrackingOptionsResponse *> *)deleteConfigurationSetTrackingOptions:(AWSSESDeleteConfigurationSetTrackingOptionsRequest *)request;

/**
 <p>Deletes an association between a configuration set and a custom domain for open and click event tracking.</p><p>By default, images and links used for tracking open and click events are hosted on domains operated by Amazon SES. You can configure a subdomain of your own to handle these events. For information about using custom domains, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html">Amazon SES Developer Guide</a>.</p><note><p>Deleting this kind of association will result in emails sent using the specified configuration set to capture open and click events using the standard, Amazon SES-operated domains.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationSetTrackingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorTrackingOptionsDoesNotExist`.
 
 @see AWSSESDeleteConfigurationSetTrackingOptionsRequest
 @see AWSSESDeleteConfigurationSetTrackingOptionsResponse
 */
- (void)deleteConfigurationSetTrackingOptions:(AWSSESDeleteConfigurationSetTrackingOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteConfigurationSetTrackingOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing custom verification email template. </p><p>For more information about custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCustomVerificationEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSESDeleteCustomVerificationEmailTemplateRequest
 */
- (AWSTask *)deleteCustomVerificationEmailTemplate:(AWSSESDeleteCustomVerificationEmailTemplateRequest *)request;

/**
 <p>Deletes an existing custom verification email template. </p><p>For more information about custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCustomVerificationEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDeleteCustomVerificationEmailTemplateRequest
 */
- (void)deleteCustomVerificationEmailTemplate:(AWSSESDeleteCustomVerificationEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified identity (an email address or a domain) from the list of verified identities.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteIdentityResponse`.
 
 @see AWSSESDeleteIdentityRequest
 @see AWSSESDeleteIdentityResponse
 */
- (AWSTask<AWSSESDeleteIdentityResponse *> *)deleteIdentity:(AWSSESDeleteIdentityRequest *)request;

/**
 <p>Deletes the specified identity (an email address or a domain) from the list of verified identities.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDeleteIdentityRequest
 @see AWSSESDeleteIdentityResponse
 */
- (void)deleteIdentity:(AWSSESDeleteIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified sending authorization policy for the given identity (an email address or a domain). This API returns successfully even if a policy with the specified name does not exist.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentityPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteIdentityPolicyResponse`.
 
 @see AWSSESDeleteIdentityPolicyRequest
 @see AWSSESDeleteIdentityPolicyResponse
 */
- (AWSTask<AWSSESDeleteIdentityPolicyResponse *> *)deleteIdentityPolicy:(AWSSESDeleteIdentityPolicyRequest *)request;

/**
 <p>Deletes the specified sending authorization policy for the given identity (an email address or a domain). This API returns successfully even if a policy with the specified name does not exist.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentityPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDeleteIdentityPolicyRequest
 @see AWSSESDeleteIdentityPolicyResponse
 */
- (void)deleteIdentityPolicy:(AWSSESDeleteIdentityPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteIdentityPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified IP address filter.</p><p>For information about managing IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteReceiptFilterResponse`.
 
 @see AWSSESDeleteReceiptFilterRequest
 @see AWSSESDeleteReceiptFilterResponse
 */
- (AWSTask<AWSSESDeleteReceiptFilterResponse *> *)deleteReceiptFilter:(AWSSESDeleteReceiptFilterRequest *)request;

/**
 <p>Deletes the specified IP address filter.</p><p>For information about managing IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDeleteReceiptFilterRequest
 @see AWSSESDeleteReceiptFilterResponse
 */
- (void)deleteReceiptFilter:(AWSSESDeleteReceiptFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteReceiptFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified receipt rule.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteReceiptRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDeleteReceiptRuleRequest
 @see AWSSESDeleteReceiptRuleResponse
 */
- (AWSTask<AWSSESDeleteReceiptRuleResponse *> *)deleteReceiptRule:(AWSSESDeleteReceiptRuleRequest *)request;

/**
 <p>Deletes the specified receipt rule.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDeleteReceiptRuleRequest
 @see AWSSESDeleteReceiptRuleResponse
 */
- (void)deleteReceiptRule:(AWSSESDeleteReceiptRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteReceiptRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified receipt rule set and all of the receipt rules it contains.</p><note><p>The currently active rule set cannot be deleted.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorCannotDelete`.
 
 @see AWSSESDeleteReceiptRuleSetRequest
 @see AWSSESDeleteReceiptRuleSetResponse
 */
- (AWSTask<AWSSESDeleteReceiptRuleSetResponse *> *)deleteReceiptRuleSet:(AWSSESDeleteReceiptRuleSetRequest *)request;

/**
 <p>Deletes the specified receipt rule set and all of the receipt rules it contains.</p><note><p>The currently active rule set cannot be deleted.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorCannotDelete`.
 
 @see AWSSESDeleteReceiptRuleSetRequest
 @see AWSSESDeleteReceiptRuleSetResponse
 */
- (void)deleteReceiptRuleSet:(AWSSESDeleteReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an email template.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteTemplateResponse`.
 
 @see AWSSESDeleteTemplateRequest
 @see AWSSESDeleteTemplateResponse
 */
- (AWSTask<AWSSESDeleteTemplateResponse *> *)deleteTemplate:(AWSSESDeleteTemplateRequest *)request;

/**
 <p>Deletes an email template.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDeleteTemplateRequest
 @see AWSSESDeleteTemplateResponse
 */
- (void)deleteTemplate:(AWSSESDeleteTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deprecated. Use the <code>DeleteIdentity</code> operation to delete email addresses and domains.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVerifiedEmailAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSESDeleteVerifiedEmailAddressRequest
 */
- (AWSTask *)deleteVerifiedEmailAddress:(AWSSESDeleteVerifiedEmailAddressRequest *)request;

/**
 <p>Deprecated. Use the <code>DeleteIdentity</code> operation to delete email addresses and domains.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVerifiedEmailAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDeleteVerifiedEmailAddressRequest
 */
- (void)deleteVerifiedEmailAddress:(AWSSESDeleteVerifiedEmailAddressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns the metadata and receipt rules for the receipt rule set that is currently active.</p><p>For information about setting up receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActiveReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDescribeActiveReceiptRuleSetResponse`.
 
 @see AWSSESDescribeActiveReceiptRuleSetRequest
 @see AWSSESDescribeActiveReceiptRuleSetResponse
 */
- (AWSTask<AWSSESDescribeActiveReceiptRuleSetResponse *> *)describeActiveReceiptRuleSet:(AWSSESDescribeActiveReceiptRuleSetRequest *)request;

/**
 <p>Returns the metadata and receipt rules for the receipt rule set that is currently active.</p><p>For information about setting up receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeActiveReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESDescribeActiveReceiptRuleSetRequest
 @see AWSSESDescribeActiveReceiptRuleSetResponse
 */
- (void)describeActiveReceiptRuleSet:(AWSSESDescribeActiveReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDescribeActiveReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the details of the specified configuration set. For information about using configuration sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConfigurationSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDescribeConfigurationSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`.
 
 @see AWSSESDescribeConfigurationSetRequest
 @see AWSSESDescribeConfigurationSetResponse
 */
- (AWSTask<AWSSESDescribeConfigurationSetResponse *> *)describeConfigurationSet:(AWSSESDescribeConfigurationSetRequest *)request;

/**
 <p>Returns the details of the specified configuration set. For information about using configuration sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConfigurationSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`.
 
 @see AWSSESDescribeConfigurationSetRequest
 @see AWSSESDescribeConfigurationSetResponse
 */
- (void)describeConfigurationSet:(AWSSESDescribeConfigurationSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDescribeConfigurationSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the details of the specified receipt rule.</p><p>For information about setting up receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReceiptRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDescribeReceiptRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDescribeReceiptRuleRequest
 @see AWSSESDescribeReceiptRuleResponse
 */
- (AWSTask<AWSSESDescribeReceiptRuleResponse *> *)describeReceiptRule:(AWSSESDescribeReceiptRuleRequest *)request;

/**
 <p>Returns the details of the specified receipt rule.</p><p>For information about setting up receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReceiptRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDescribeReceiptRuleRequest
 @see AWSSESDescribeReceiptRuleResponse
 */
- (void)describeReceiptRule:(AWSSESDescribeReceiptRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDescribeReceiptRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the details of the specified receipt rule set.</p><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDescribeReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDescribeReceiptRuleSetRequest
 @see AWSSESDescribeReceiptRuleSetResponse
 */
- (AWSTask<AWSSESDescribeReceiptRuleSetResponse *> *)describeReceiptRuleSet:(AWSSESDescribeReceiptRuleSetRequest *)request;

/**
 <p>Returns the details of the specified receipt rule set.</p><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESDescribeReceiptRuleSetRequest
 @see AWSSESDescribeReceiptRuleSetResponse
 */
- (void)describeReceiptRuleSet:(AWSSESDescribeReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDescribeReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the email sending status of the Amazon SES account for the current region.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetAccountSendingEnabled service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetAccountSendingEnabledResponse`.
 
 @see AWSRequest
 @see AWSSESGetAccountSendingEnabledResponse
 */
- (AWSTask<AWSSESGetAccountSendingEnabledResponse *> *)getAccountSendingEnabled:(AWSRequest *)request;

/**
 <p>Returns the email sending status of the Amazon SES account for the current region.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetAccountSendingEnabled service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRequest
 @see AWSSESGetAccountSendingEnabledResponse
 */
- (void)getAccountSendingEnabled:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetAccountSendingEnabledResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the custom email verification template for the template name you specify.</p><p>For more information about custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetCustomVerificationEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetCustomVerificationEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorCustomVerificationEmailTemplateDoesNotExist`.
 
 @see AWSSESGetCustomVerificationEmailTemplateRequest
 @see AWSSESGetCustomVerificationEmailTemplateResponse
 */
- (AWSTask<AWSSESGetCustomVerificationEmailTemplateResponse *> *)getCustomVerificationEmailTemplate:(AWSSESGetCustomVerificationEmailTemplateRequest *)request;

/**
 <p>Returns the custom email verification template for the template name you specify.</p><p>For more information about custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetCustomVerificationEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorCustomVerificationEmailTemplateDoesNotExist`.
 
 @see AWSSESGetCustomVerificationEmailTemplateRequest
 @see AWSSESGetCustomVerificationEmailTemplateResponse
 */
- (void)getCustomVerificationEmailTemplate:(AWSSESGetCustomVerificationEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetCustomVerificationEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the current status of Easy DKIM signing for an entity. For domain name identities, this operation also returns the DKIM tokens that are required for Easy DKIM signing, and whether Amazon SES has successfully verified that these tokens have been published.</p><p>This operation takes a list of identities as input and returns the following information for each:</p><ul><li><p>Whether Easy DKIM signing is enabled or disabled.</p></li><li><p>A set of DKIM tokens that represent the identity. If the identity is an email address, the tokens represent the domain of that address.</p></li><li><p>Whether Amazon SES has successfully verified the DKIM tokens published in the domain's DNS. This information is only returned for domain name identities, not for email addresses.</p></li></ul><p>This operation is throttled at one request per second and can only get DKIM attributes for up to 100 identities at a time.</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityDkimAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityDkimAttributesResponse`.
 
 @see AWSSESGetIdentityDkimAttributesRequest
 @see AWSSESGetIdentityDkimAttributesResponse
 */
- (AWSTask<AWSSESGetIdentityDkimAttributesResponse *> *)getIdentityDkimAttributes:(AWSSESGetIdentityDkimAttributesRequest *)request;

/**
 <p>Returns the current status of Easy DKIM signing for an entity. For domain name identities, this operation also returns the DKIM tokens that are required for Easy DKIM signing, and whether Amazon SES has successfully verified that these tokens have been published.</p><p>This operation takes a list of identities as input and returns the following information for each:</p><ul><li><p>Whether Easy DKIM signing is enabled or disabled.</p></li><li><p>A set of DKIM tokens that represent the identity. If the identity is an email address, the tokens represent the domain of that address.</p></li><li><p>Whether Amazon SES has successfully verified the DKIM tokens published in the domain's DNS. This information is only returned for domain name identities, not for email addresses.</p></li></ul><p>This operation is throttled at one request per second and can only get DKIM attributes for up to 100 identities at a time.</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityDkimAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESGetIdentityDkimAttributesRequest
 @see AWSSESGetIdentityDkimAttributesResponse
 */
- (void)getIdentityDkimAttributes:(AWSSESGetIdentityDkimAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetIdentityDkimAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the custom MAIL FROM attributes for a list of identities (email addresses : domains).</p><p>This operation is throttled at one request per second and can only get custom MAIL FROM attributes for up to 100 identities at a time.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityMailFromDomainAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityMailFromDomainAttributesResponse`.
 
 @see AWSSESGetIdentityMailFromDomainAttributesRequest
 @see AWSSESGetIdentityMailFromDomainAttributesResponse
 */
- (AWSTask<AWSSESGetIdentityMailFromDomainAttributesResponse *> *)getIdentityMailFromDomainAttributes:(AWSSESGetIdentityMailFromDomainAttributesRequest *)request;

/**
 <p>Returns the custom MAIL FROM attributes for a list of identities (email addresses : domains).</p><p>This operation is throttled at one request per second and can only get custom MAIL FROM attributes for up to 100 identities at a time.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityMailFromDomainAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESGetIdentityMailFromDomainAttributesRequest
 @see AWSSESGetIdentityMailFromDomainAttributesResponse
 */
- (void)getIdentityMailFromDomainAttributes:(AWSSESGetIdentityMailFromDomainAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetIdentityMailFromDomainAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Given a list of verified identities (email addresses and/or domains), returns a structure describing identity notification attributes.</p><p>This operation is throttled at one request per second and can only get notification attributes for up to 100 identities at a time.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityNotificationAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityNotificationAttributesResponse`.
 
 @see AWSSESGetIdentityNotificationAttributesRequest
 @see AWSSESGetIdentityNotificationAttributesResponse
 */
- (AWSTask<AWSSESGetIdentityNotificationAttributesResponse *> *)getIdentityNotificationAttributes:(AWSSESGetIdentityNotificationAttributesRequest *)request;

/**
 <p>Given a list of verified identities (email addresses and/or domains), returns a structure describing identity notification attributes.</p><p>This operation is throttled at one request per second and can only get notification attributes for up to 100 identities at a time.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityNotificationAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESGetIdentityNotificationAttributesRequest
 @see AWSSESGetIdentityNotificationAttributesResponse
 */
- (void)getIdentityNotificationAttributes:(AWSSESGetIdentityNotificationAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetIdentityNotificationAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the requested sending authorization policies for the given identity (an email address or a domain). The policies are returned as a map of policy names to policy contents. You can retrieve a maximum of 20 policies at a time.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityPoliciesResponse`.
 
 @see AWSSESGetIdentityPoliciesRequest
 @see AWSSESGetIdentityPoliciesResponse
 */
- (AWSTask<AWSSESGetIdentityPoliciesResponse *> *)getIdentityPolicies:(AWSSESGetIdentityPoliciesRequest *)request;

/**
 <p>Returns the requested sending authorization policies for the given identity (an email address or a domain). The policies are returned as a map of policy names to policy contents. You can retrieve a maximum of 20 policies at a time.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESGetIdentityPoliciesRequest
 @see AWSSESGetIdentityPoliciesResponse
 */
- (void)getIdentityPolicies:(AWSSESGetIdentityPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetIdentityPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Given a list of identities (email addresses and/or domains), returns the verification status and (for domain identities) the verification token for each identity.</p><p>The verification status of an email address is "Pending" until the email address owner clicks the link within the verification email that Amazon SES sent to that address. If the email address owner clicks the link within 24 hours, the verification status of the email address changes to "Success". If the link is not clicked within 24 hours, the verification status changes to "Failed." In that case, if you still want to verify the email address, you must restart the verification process from the beginning.</p><p>For domain identities, the domain's verification status is "Pending" as Amazon SES searches for the required TXT record in the DNS settings of the domain. When Amazon SES detects the record, the domain's verification status changes to "Success". If Amazon SES is unable to detect the record within 72 hours, the domain's verification status changes to "Failed." In that case, if you still want to verify the domain, you must restart the verification process from the beginning.</p><p>This operation is throttled at one request per second and can only get verification attributes for up to 100 identities at a time.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityVerificationAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityVerificationAttributesResponse`.
 
 @see AWSSESGetIdentityVerificationAttributesRequest
 @see AWSSESGetIdentityVerificationAttributesResponse
 */
- (AWSTask<AWSSESGetIdentityVerificationAttributesResponse *> *)getIdentityVerificationAttributes:(AWSSESGetIdentityVerificationAttributesRequest *)request;

/**
 <p>Given a list of identities (email addresses and/or domains), returns the verification status and (for domain identities) the verification token for each identity.</p><p>The verification status of an email address is "Pending" until the email address owner clicks the link within the verification email that Amazon SES sent to that address. If the email address owner clicks the link within 24 hours, the verification status of the email address changes to "Success". If the link is not clicked within 24 hours, the verification status changes to "Failed." In that case, if you still want to verify the email address, you must restart the verification process from the beginning.</p><p>For domain identities, the domain's verification status is "Pending" as Amazon SES searches for the required TXT record in the DNS settings of the domain. When Amazon SES detects the record, the domain's verification status changes to "Success". If Amazon SES is unable to detect the record within 72 hours, the domain's verification status changes to "Failed." In that case, if you still want to verify the domain, you must restart the verification process from the beginning.</p><p>This operation is throttled at one request per second and can only get verification attributes for up to 100 identities at a time.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityVerificationAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESGetIdentityVerificationAttributesRequest
 @see AWSSESGetIdentityVerificationAttributesResponse
 */
- (void)getIdentityVerificationAttributes:(AWSSESGetIdentityVerificationAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetIdentityVerificationAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the sending limits for the Amazon SES account. </p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetSendQuota service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetSendQuotaResponse`.
 
 @see AWSRequest
 @see AWSSESGetSendQuotaResponse
 */
- (AWSTask<AWSSESGetSendQuotaResponse *> *)getSendQuota:(AWSRequest *)request;

/**
 <p>Provides the sending limits for the Amazon SES account. </p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetSendQuota service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRequest
 @see AWSSESGetSendQuotaResponse
 */
- (void)getSendQuota:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetSendQuotaResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides sending statistics for the current AWS Region. The result is a list of data points, representing the last two weeks of sending activity. Each data point in the list contains statistics for a 15-minute period of time.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetSendStatistics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetSendStatisticsResponse`.
 
 @see AWSRequest
 @see AWSSESGetSendStatisticsResponse
 */
- (AWSTask<AWSSESGetSendStatisticsResponse *> *)getSendStatistics:(AWSRequest *)request;

/**
 <p>Provides sending statistics for the current AWS Region. The result is a list of data points, representing the last two weeks of sending activity. Each data point in the list contains statistics for a 15-minute period of time.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetSendStatistics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRequest
 @see AWSSESGetSendStatisticsResponse
 */
- (void)getSendStatistics:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetSendStatisticsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays the template object (which includes the Subject line, HTML part and text part) for the template you specify.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTemplateDoesNotExist`.
 
 @see AWSSESGetTemplateRequest
 @see AWSSESGetTemplateResponse
 */
- (AWSTask<AWSSESGetTemplateResponse *> *)getTemplate:(AWSSESGetTemplateRequest *)request;

/**
 <p>Displays the template object (which includes the Subject line, HTML part and text part) for the template you specify.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTemplateDoesNotExist`.
 
 @see AWSSESGetTemplateRequest
 @see AWSSESGetTemplateResponse
 */
- (void)getTemplate:(AWSSESGetTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of the configuration sets associated with your Amazon SES account in the current AWS Region. For information about using configuration sets, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Monitoring Your Amazon SES Sending Activity</a> in the <i>Amazon SES Developer Guide.</i></p><p>You can execute this operation no more than once per second. This operation will return up to 1,000 configuration sets each time it is run. If your Amazon SES account has more than 1,000 configuration sets, this operation will also return a NextToken element. You can then execute the <code>ListConfigurationSets</code> operation again, passing the <code>NextToken</code> parameter and the value of the NextToken element to retrieve additional results.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurationSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListConfigurationSetsResponse`.
 
 @see AWSSESListConfigurationSetsRequest
 @see AWSSESListConfigurationSetsResponse
 */
- (AWSTask<AWSSESListConfigurationSetsResponse *> *)listConfigurationSets:(AWSSESListConfigurationSetsRequest *)request;

/**
 <p>Provides a list of the configuration sets associated with your Amazon SES account in the current AWS Region. For information about using configuration sets, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Monitoring Your Amazon SES Sending Activity</a> in the <i>Amazon SES Developer Guide.</i></p><p>You can execute this operation no more than once per second. This operation will return up to 1,000 configuration sets each time it is run. If your Amazon SES account has more than 1,000 configuration sets, this operation will also return a NextToken element. You can then execute the <code>ListConfigurationSets</code> operation again, passing the <code>NextToken</code> parameter and the value of the NextToken element to retrieve additional results.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurationSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESListConfigurationSetsRequest
 @see AWSSESListConfigurationSetsResponse
 */
- (void)listConfigurationSets:(AWSSESListConfigurationSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListConfigurationSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the existing custom verification email templates for your account in the current AWS Region.</p><p>For more information about custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListCustomVerificationEmailTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListCustomVerificationEmailTemplatesResponse`.
 
 @see AWSSESListCustomVerificationEmailTemplatesRequest
 @see AWSSESListCustomVerificationEmailTemplatesResponse
 */
- (AWSTask<AWSSESListCustomVerificationEmailTemplatesResponse *> *)listCustomVerificationEmailTemplates:(AWSSESListCustomVerificationEmailTemplatesRequest *)request;

/**
 <p>Lists the existing custom verification email templates for your account in the current AWS Region.</p><p>For more information about custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListCustomVerificationEmailTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESListCustomVerificationEmailTemplatesRequest
 @see AWSSESListCustomVerificationEmailTemplatesResponse
 */
- (void)listCustomVerificationEmailTemplates:(AWSSESListCustomVerificationEmailTemplatesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListCustomVerificationEmailTemplatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list containing all of the identities (email addresses and domains) for your AWS account in the current AWS Region, regardless of verification status.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListIdentitiesResponse`.
 
 @see AWSSESListIdentitiesRequest
 @see AWSSESListIdentitiesResponse
 */
- (AWSTask<AWSSESListIdentitiesResponse *> *)listIdentities:(AWSSESListIdentitiesRequest *)request;

/**
 <p>Returns a list containing all of the identities (email addresses and domains) for your AWS account in the current AWS Region, regardless of verification status.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESListIdentitiesRequest
 @see AWSSESListIdentitiesResponse
 */
- (void)listIdentities:(AWSSESListIdentitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListIdentitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of sending authorization policies that are attached to the given identity (an email address or a domain). This API returns only a list. If you want the actual policy content, you can use <code>GetIdentityPolicies</code>.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentityPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListIdentityPoliciesResponse`.
 
 @see AWSSESListIdentityPoliciesRequest
 @see AWSSESListIdentityPoliciesResponse
 */
- (AWSTask<AWSSESListIdentityPoliciesResponse *> *)listIdentityPolicies:(AWSSESListIdentityPoliciesRequest *)request;

/**
 <p>Returns a list of sending authorization policies that are attached to the given identity (an email address or a domain). This API returns only a list. If you want the actual policy content, you can use <code>GetIdentityPolicies</code>.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentityPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESListIdentityPoliciesRequest
 @see AWSSESListIdentityPoliciesResponse
 */
- (void)listIdentityPolicies:(AWSSESListIdentityPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListIdentityPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the IP address filters associated with your AWS account in the current AWS Region.</p><p>For information about managing IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListReceiptFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListReceiptFiltersResponse`.
 
 @see AWSSESListReceiptFiltersRequest
 @see AWSSESListReceiptFiltersResponse
 */
- (AWSTask<AWSSESListReceiptFiltersResponse *> *)listReceiptFilters:(AWSSESListReceiptFiltersRequest *)request;

/**
 <p>Lists the IP address filters associated with your AWS account in the current AWS Region.</p><p>For information about managing IP address filters, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListReceiptFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESListReceiptFiltersRequest
 @see AWSSESListReceiptFiltersResponse
 */
- (void)listReceiptFilters:(AWSSESListReceiptFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListReceiptFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the receipt rule sets that exist under your AWS account in the current AWS Region. If there are additional receipt rule sets to be retrieved, you will receive a <code>NextToken</code> that you can provide to the next call to <code>ListReceiptRuleSets</code> to retrieve the additional entries.</p><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListReceiptRuleSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListReceiptRuleSetsResponse`.
 
 @see AWSSESListReceiptRuleSetsRequest
 @see AWSSESListReceiptRuleSetsResponse
 */
- (AWSTask<AWSSESListReceiptRuleSetsResponse *> *)listReceiptRuleSets:(AWSSESListReceiptRuleSetsRequest *)request;

/**
 <p>Lists the receipt rule sets that exist under your AWS account in the current AWS Region. If there are additional receipt rule sets to be retrieved, you will receive a <code>NextToken</code> that you can provide to the next call to <code>ListReceiptRuleSets</code> to retrieve the additional entries.</p><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListReceiptRuleSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESListReceiptRuleSetsRequest
 @see AWSSESListReceiptRuleSetsResponse
 */
- (void)listReceiptRuleSets:(AWSSESListReceiptRuleSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListReceiptRuleSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the email templates present in your Amazon SES account in the current AWS Region.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListTemplatesResponse`.
 
 @see AWSSESListTemplatesRequest
 @see AWSSESListTemplatesResponse
 */
- (AWSTask<AWSSESListTemplatesResponse *> *)listTemplates:(AWSSESListTemplatesRequest *)request;

/**
 <p>Lists the email templates present in your Amazon SES account in the current AWS Region.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESListTemplatesRequest
 @see AWSSESListTemplatesResponse
 */
- (void)listTemplates:(AWSSESListTemplatesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListTemplatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deprecated. Use the <code>ListIdentities</code> operation to list the email addresses and domains associated with your account.</p>
 
 @param request A container for the necessary parameters to execute the ListVerifiedEmailAddresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListVerifiedEmailAddressesResponse`.
 
 @see AWSRequest
 @see AWSSESListVerifiedEmailAddressesResponse
 */
- (AWSTask<AWSSESListVerifiedEmailAddressesResponse *> *)listVerifiedEmailAddresses:(AWSRequest *)request;

/**
 <p>Deprecated. Use the <code>ListIdentities</code> operation to list the email addresses and domains associated with your account.</p>
 
 @param request A container for the necessary parameters to execute the ListVerifiedEmailAddresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRequest
 @see AWSSESListVerifiedEmailAddressesResponse
 */
- (void)listVerifiedEmailAddresses:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListVerifiedEmailAddressesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or updates a sending authorization policy for the specified identity (an email address or a domain).</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the PutIdentityPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutIdentityPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidPolicy`.
 
 @see AWSSESPutIdentityPolicyRequest
 @see AWSSESPutIdentityPolicyResponse
 */
- (AWSTask<AWSSESPutIdentityPolicyResponse *> *)putIdentityPolicy:(AWSSESPutIdentityPolicyRequest *)request;

/**
 <p>Adds or updates a sending authorization policy for the specified identity (an email address or a domain).</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the PutIdentityPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidPolicy`.
 
 @see AWSSESPutIdentityPolicyRequest
 @see AWSSESPutIdentityPolicyResponse
 */
- (void)putIdentityPolicy:(AWSSESPutIdentityPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutIdentityPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reorders the receipt rules within a receipt rule set.</p><note><p>All of the rules in the rule set must be represented in this request. That is, this API will return an error if the reorder request doesn't explicitly position all of the rules.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ReorderReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESReorderReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`.
 
 @see AWSSESReorderReceiptRuleSetRequest
 @see AWSSESReorderReceiptRuleSetResponse
 */
- (AWSTask<AWSSESReorderReceiptRuleSetResponse *> *)reorderReceiptRuleSet:(AWSSESReorderReceiptRuleSetRequest *)request;

/**
 <p>Reorders the receipt rules within a receipt rule set.</p><note><p>All of the rules in the rule set must be represented in this request. That is, this API will return an error if the reorder request doesn't explicitly position all of the rules.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ReorderReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`.
 
 @see AWSSESReorderReceiptRuleSetRequest
 @see AWSSESReorderReceiptRuleSetResponse
 */
- (void)reorderReceiptRuleSet:(AWSSESReorderReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESReorderReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates and sends a bounce message to the sender of an email you received through Amazon SES. You can only use this API on an email up to 24 hours after you receive it.</p><note><p>You cannot use this API to send generic bounces for mail that was not received by Amazon SES.</p></note><p>For information about receiving email through Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SendBounce service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendBounceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`.
 
 @see AWSSESSendBounceRequest
 @see AWSSESSendBounceResponse
 */
- (AWSTask<AWSSESSendBounceResponse *> *)sendBounce:(AWSSESSendBounceRequest *)request;

/**
 <p>Generates and sends a bounce message to the sender of an email you received through Amazon SES. You can only use this API on an email up to 24 hours after you receive it.</p><note><p>You cannot use this API to send generic bounces for mail that was not received by Amazon SES.</p></note><p>For information about receiving email through Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SendBounce service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`.
 
 @see AWSSESSendBounceRequest
 @see AWSSESSendBounceResponse
 */
- (void)sendBounce:(AWSSESSendBounceRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendBounceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Composes an email message to multiple destinations. The message body is created using an email template.</p><p>In order to send email using the <code>SendBulkTemplatedEmail</code> operation, your call to the API must meet the following requirements:</p><ul><li><p>The call must refer to an existing email template. You can create email templates using the <a>CreateTemplate</a> operation.</p></li><li><p>The message must be sent from a verified email address or domain.</p></li><li><p>If your account is still in the Amazon SES sandbox, you may only send to verified addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. For more information, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i></p></li><li><p>The maximum message size is 10 MB.</p></li><li><p>Each <code>Destination</code> parameter must include at least one recipient email address. The recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid (that is, it is not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message will be rejected, even if the message contains other recipients that are valid.</p></li><li><p>The message may not include more than 50 recipients, across the To:, CC: and BCC: fields. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call the <code>SendBulkTemplatedEmail</code> operation several times to send the message to each group.</p></li><li><p>The number of destinations you can contact in a single call to the API may be limited by your account's maximum sending rate.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the SendBulkTemplatedEmail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendBulkTemplatedEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorTemplateDoesNotExist`, `AWSSESErrorConfigurationSetSendingPaused`, `AWSSESErrorAccountSendingPaused`.
 
 @see AWSSESSendBulkTemplatedEmailRequest
 @see AWSSESSendBulkTemplatedEmailResponse
 */
- (AWSTask<AWSSESSendBulkTemplatedEmailResponse *> *)sendBulkTemplatedEmail:(AWSSESSendBulkTemplatedEmailRequest *)request;

/**
 <p>Composes an email message to multiple destinations. The message body is created using an email template.</p><p>In order to send email using the <code>SendBulkTemplatedEmail</code> operation, your call to the API must meet the following requirements:</p><ul><li><p>The call must refer to an existing email template. You can create email templates using the <a>CreateTemplate</a> operation.</p></li><li><p>The message must be sent from a verified email address or domain.</p></li><li><p>If your account is still in the Amazon SES sandbox, you may only send to verified addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. For more information, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i></p></li><li><p>The maximum message size is 10 MB.</p></li><li><p>Each <code>Destination</code> parameter must include at least one recipient email address. The recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid (that is, it is not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message will be rejected, even if the message contains other recipients that are valid.</p></li><li><p>The message may not include more than 50 recipients, across the To:, CC: and BCC: fields. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call the <code>SendBulkTemplatedEmail</code> operation several times to send the message to each group.</p></li><li><p>The number of destinations you can contact in a single call to the API may be limited by your account's maximum sending rate.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the SendBulkTemplatedEmail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorTemplateDoesNotExist`, `AWSSESErrorConfigurationSetSendingPaused`, `AWSSESErrorAccountSendingPaused`.
 
 @see AWSSESSendBulkTemplatedEmailRequest
 @see AWSSESSendBulkTemplatedEmailResponse
 */
- (void)sendBulkTemplatedEmail:(AWSSESSendBulkTemplatedEmailRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendBulkTemplatedEmailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds an email address to the list of identities for your Amazon SES account in the current AWS Region and attempts to verify it. As a result of executing this operation, a customized verification email is sent to the specified address.</p><p>To use this operation, you must first create a custom verification email template. For more information about creating and using custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SendCustomVerificationEmail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendCustomVerificationEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorCustomVerificationEmailTemplateDoesNotExist`, `AWSSESErrorFromEmailAddressNotVerified`, `AWSSESErrorProductionAccessNotGranted`.
 
 @see AWSSESSendCustomVerificationEmailRequest
 @see AWSSESSendCustomVerificationEmailResponse
 */
- (AWSTask<AWSSESSendCustomVerificationEmailResponse *> *)sendCustomVerificationEmail:(AWSSESSendCustomVerificationEmailRequest *)request;

/**
 <p>Adds an email address to the list of identities for your Amazon SES account in the current AWS Region and attempts to verify it. As a result of executing this operation, a customized verification email is sent to the specified address.</p><p>To use this operation, you must first create a custom verification email template. For more information about creating and using custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SendCustomVerificationEmail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorCustomVerificationEmailTemplateDoesNotExist`, `AWSSESErrorFromEmailAddressNotVerified`, `AWSSESErrorProductionAccessNotGranted`.
 
 @see AWSSESSendCustomVerificationEmailRequest
 @see AWSSESSendCustomVerificationEmailResponse
 */
- (void)sendCustomVerificationEmail:(AWSSESSendCustomVerificationEmailRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendCustomVerificationEmailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Composes an email message and immediately queues it for sending. In order to send email using the <code>SendEmail</code> operation, your message must meet the following requirements:</p><ul><li><p>The message must be sent from a verified email address or domain. If you attempt to send email using a non-verified address or domain, the operation will result in an "Email address not verified" error. </p></li><li><p>If your account is still in the Amazon SES sandbox, you may only send to verified addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. For more information, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i></p></li><li><p>The maximum message size is 10 MB.</p></li><li><p>The message must include at least one recipient email address. The recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid (that is, it is not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message will be rejected, even if the message contains other recipients that are valid.</p></li><li><p>The message may not include more than 50 recipients, across the To:, CC: and BCC: fields. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call the <code>SendEmail</code> operation several times to send the message to each group.</p></li></ul><important><p>For every message that you send, the total number of recipients (including each recipient in the To:, CC: and BCC: fields) is counted against the maximum number of emails you can send in a 24-hour period (your <i>sending quota</i>). For more information about sending quotas in Amazon SES, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Managing Your Amazon SES Sending Limits</a> in the <i>Amazon SES Developer Guide.</i></p></important>
 
 @param request A container for the necessary parameters to execute the SendEmail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorConfigurationSetSendingPaused`, `AWSSESErrorAccountSendingPaused`.
 
 @see AWSSESSendEmailRequest
 @see AWSSESSendEmailResponse
 */
- (AWSTask<AWSSESSendEmailResponse *> *)sendEmail:(AWSSESSendEmailRequest *)request;

/**
 <p>Composes an email message and immediately queues it for sending. In order to send email using the <code>SendEmail</code> operation, your message must meet the following requirements:</p><ul><li><p>The message must be sent from a verified email address or domain. If you attempt to send email using a non-verified address or domain, the operation will result in an "Email address not verified" error. </p></li><li><p>If your account is still in the Amazon SES sandbox, you may only send to verified addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. For more information, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i></p></li><li><p>The maximum message size is 10 MB.</p></li><li><p>The message must include at least one recipient email address. The recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid (that is, it is not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message will be rejected, even if the message contains other recipients that are valid.</p></li><li><p>The message may not include more than 50 recipients, across the To:, CC: and BCC: fields. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call the <code>SendEmail</code> operation several times to send the message to each group.</p></li></ul><important><p>For every message that you send, the total number of recipients (including each recipient in the To:, CC: and BCC: fields) is counted against the maximum number of emails you can send in a 24-hour period (your <i>sending quota</i>). For more information about sending quotas in Amazon SES, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Managing Your Amazon SES Sending Limits</a> in the <i>Amazon SES Developer Guide.</i></p></important>
 
 @param request A container for the necessary parameters to execute the SendEmail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorConfigurationSetSendingPaused`, `AWSSESErrorAccountSendingPaused`.
 
 @see AWSSESSendEmailRequest
 @see AWSSESSendEmailResponse
 */
- (void)sendEmail:(AWSSESSendEmailRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendEmailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Composes an email message and immediately queues it for sending.</p><p>This operation is more flexible than the <code>SendEmail</code> API operation. When you use the <code>SendRawEmail</code> operation, you can specify the headers of the message as well as its content. This flexibility is useful, for example, when you want to send a multipart MIME email (such a message that contains both a text and an HTML version). You can also use this operation to send messages that include attachments.</p><p>The <code>SendRawEmail</code> operation has the following requirements:</p><ul><li><p>You can only send email from <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">verified email addresses or domains</a>. If you try to send email from an address that isn't verified, the operation results in an "Email address not verified" error.</p></li><li><p>If your account is still in the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/request-production-access.html">Amazon SES sandbox</a>, you can only send email to other verified addresses in your account, or to addresses that are associated with the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/mailbox-simulator.html">Amazon SES mailbox simulator</a>.</p></li><li><p>The maximum message size, including attachments, is 10 MB.</p></li><li><p>Each message has to include at least one recipient address. A recipient address includes any address on the To:, CC:, or BCC: lines.</p></li><li><p>If you send a single message to more than one recipient address, and one of the recipient addresses isn't in a valid format (that is, it's not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), Amazon SES rejects the entire message, even if the other addresses are valid.</p></li><li><p>Each message can include up to 50 recipient addresses across the To:, CC:, or BCC: lines. If you need to send a single message to more than 50 recipients, you have to split the list of recipient addresses into groups of less than 50 recipients, and send separate messages to each group.</p></li><li><p>Amazon SES allows you to specify 8-bit Content-Transfer-Encoding for MIME message parts. However, if Amazon SES has to modify the contents of your message (for example, if you use open and click tracking), 8-bit content isn't preserved. For this reason, we highly recommend that you encode all content that isn't 7-bit ASCII. For more information, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html#send-email-mime-encoding">MIME Encoding</a> in the <i>Amazon SES Developer Guide</i>.</p></li></ul><p>Additionally, keep the following considerations in mind when using the <code>SendRawEmail</code> operation:</p><ul><li><p>Although you can customize the message headers when using the <code>SendRawEmail</code> operation, Amazon SES will automatically apply its own <code>Message-ID</code> and <code>Date</code> headers; if you passed these headers when creating the message, they will be overwritten by the values that Amazon SES provides.</p></li><li><p>If you are using sending authorization to send on behalf of another user, <code>SendRawEmail</code> enables you to specify the cross-account identity for the email's Source, From, and Return-Path parameters in one of two ways: you can pass optional parameters <code>SourceArn</code>, <code>FromArn</code>, and/or <code>ReturnPathArn</code> to the API, or you can include the following X-headers in the header of your raw email:</p><ul><li><p><code>X-SES-SOURCE-ARN</code></p></li><li><p><code>X-SES-FROM-ARN</code></p></li><li><p><code>X-SES-RETURN-PATH-ARN</code></p></li></ul><important><p>Do not include these X-headers in the DKIM signature; Amazon SES will remove them before sending the email.</p></important><p>For most common sending authorization scenarios, we recommend that you specify the <code>SourceIdentityArn</code> parameter and not the <code>FromIdentityArn</code> or <code>ReturnPathIdentityArn</code> parameters. If you only specify the <code>SourceIdentityArn</code> parameter, Amazon SES will set the From and Return Path addresses to the identity specified in <code>SourceIdentityArn</code>. For more information about sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Using Sending Authorization with Amazon SES</a> in the <i>Amazon SES Developer Guide.</i></p></li><li><p>For every message that you send, the total number of recipients (including each recipient in the To:, CC: and BCC: fields) is counted against the maximum number of emails you can send in a 24-hour period (your <i>sending quota</i>). For more information about sending quotas in Amazon SES, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Managing Your Amazon SES Sending Limits</a> in the <i>Amazon SES Developer Guide.</i></p></li></ul>
 
 @param request A container for the necessary parameters to execute the SendRawEmail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendRawEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorConfigurationSetSendingPaused`, `AWSSESErrorAccountSendingPaused`.
 
 @see AWSSESSendRawEmailRequest
 @see AWSSESSendRawEmailResponse
 */
- (AWSTask<AWSSESSendRawEmailResponse *> *)sendRawEmail:(AWSSESSendRawEmailRequest *)request;

/**
 <p>Composes an email message and immediately queues it for sending.</p><p>This operation is more flexible than the <code>SendEmail</code> API operation. When you use the <code>SendRawEmail</code> operation, you can specify the headers of the message as well as its content. This flexibility is useful, for example, when you want to send a multipart MIME email (such a message that contains both a text and an HTML version). You can also use this operation to send messages that include attachments.</p><p>The <code>SendRawEmail</code> operation has the following requirements:</p><ul><li><p>You can only send email from <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">verified email addresses or domains</a>. If you try to send email from an address that isn't verified, the operation results in an "Email address not verified" error.</p></li><li><p>If your account is still in the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/request-production-access.html">Amazon SES sandbox</a>, you can only send email to other verified addresses in your account, or to addresses that are associated with the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/mailbox-simulator.html">Amazon SES mailbox simulator</a>.</p></li><li><p>The maximum message size, including attachments, is 10 MB.</p></li><li><p>Each message has to include at least one recipient address. A recipient address includes any address on the To:, CC:, or BCC: lines.</p></li><li><p>If you send a single message to more than one recipient address, and one of the recipient addresses isn't in a valid format (that is, it's not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), Amazon SES rejects the entire message, even if the other addresses are valid.</p></li><li><p>Each message can include up to 50 recipient addresses across the To:, CC:, or BCC: lines. If you need to send a single message to more than 50 recipients, you have to split the list of recipient addresses into groups of less than 50 recipients, and send separate messages to each group.</p></li><li><p>Amazon SES allows you to specify 8-bit Content-Transfer-Encoding for MIME message parts. However, if Amazon SES has to modify the contents of your message (for example, if you use open and click tracking), 8-bit content isn't preserved. For this reason, we highly recommend that you encode all content that isn't 7-bit ASCII. For more information, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html#send-email-mime-encoding">MIME Encoding</a> in the <i>Amazon SES Developer Guide</i>.</p></li></ul><p>Additionally, keep the following considerations in mind when using the <code>SendRawEmail</code> operation:</p><ul><li><p>Although you can customize the message headers when using the <code>SendRawEmail</code> operation, Amazon SES will automatically apply its own <code>Message-ID</code> and <code>Date</code> headers; if you passed these headers when creating the message, they will be overwritten by the values that Amazon SES provides.</p></li><li><p>If you are using sending authorization to send on behalf of another user, <code>SendRawEmail</code> enables you to specify the cross-account identity for the email's Source, From, and Return-Path parameters in one of two ways: you can pass optional parameters <code>SourceArn</code>, <code>FromArn</code>, and/or <code>ReturnPathArn</code> to the API, or you can include the following X-headers in the header of your raw email:</p><ul><li><p><code>X-SES-SOURCE-ARN</code></p></li><li><p><code>X-SES-FROM-ARN</code></p></li><li><p><code>X-SES-RETURN-PATH-ARN</code></p></li></ul><important><p>Do not include these X-headers in the DKIM signature; Amazon SES will remove them before sending the email.</p></important><p>For most common sending authorization scenarios, we recommend that you specify the <code>SourceIdentityArn</code> parameter and not the <code>FromIdentityArn</code> or <code>ReturnPathIdentityArn</code> parameters. If you only specify the <code>SourceIdentityArn</code> parameter, Amazon SES will set the From and Return Path addresses to the identity specified in <code>SourceIdentityArn</code>. For more information about sending authorization, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Using Sending Authorization with Amazon SES</a> in the <i>Amazon SES Developer Guide.</i></p></li><li><p>For every message that you send, the total number of recipients (including each recipient in the To:, CC: and BCC: fields) is counted against the maximum number of emails you can send in a 24-hour period (your <i>sending quota</i>). For more information about sending quotas in Amazon SES, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Managing Your Amazon SES Sending Limits</a> in the <i>Amazon SES Developer Guide.</i></p></li></ul>
 
 @param request A container for the necessary parameters to execute the SendRawEmail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorConfigurationSetSendingPaused`, `AWSSESErrorAccountSendingPaused`.
 
 @see AWSSESSendRawEmailRequest
 @see AWSSESSendRawEmailResponse
 */
- (void)sendRawEmail:(AWSSESSendRawEmailRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendRawEmailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Composes an email message using an email template and immediately queues it for sending.</p><p>In order to send email using the <code>SendTemplatedEmail</code> operation, your call to the API must meet the following requirements:</p><ul><li><p>The call must refer to an existing email template. You can create email templates using the <a>CreateTemplate</a> operation.</p></li><li><p>The message must be sent from a verified email address or domain.</p></li><li><p>If your account is still in the Amazon SES sandbox, you may only send to verified addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. For more information, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i></p></li><li><p>The maximum message size is 10 MB.</p></li><li><p>Calls to the <code>SendTemplatedEmail</code> operation may only include one <code>Destination</code> parameter. A destination is a set of recipients who will receive the same version of the email. The <code>Destination</code> parameter can include up to 50 recipients, across the To:, CC: and BCC: fields.</p></li><li><p>The <code>Destination</code> parameter must include at least one recipient email address. The recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid (that is, it is not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message will be rejected, even if the message contains other recipients that are valid.</p></li></ul><important><p>If your call to the <code>SendTemplatedEmail</code> operation includes all of the required parameters, Amazon SES accepts it and returns a Message ID. However, if Amazon SES can't render the email because the template contains errors, it doesn't send the email. Additionally, because it already accepted the message, Amazon SES doesn't return a message stating that it was unable to send the email.</p><p>For these reasons, we highly recommend that you set up Amazon SES to send you notifications when Rendering Failure events occur. For more information, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Sending Personalized Email Using the Amazon SES API</a> in the <i>Amazon Simple Email Service Developer Guide</i>.</p></important>
 
 @param request A container for the necessary parameters to execute the SendTemplatedEmail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendTemplatedEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorTemplateDoesNotExist`, `AWSSESErrorConfigurationSetSendingPaused`, `AWSSESErrorAccountSendingPaused`.
 
 @see AWSSESSendTemplatedEmailRequest
 @see AWSSESSendTemplatedEmailResponse
 */
- (AWSTask<AWSSESSendTemplatedEmailResponse *> *)sendTemplatedEmail:(AWSSESSendTemplatedEmailRequest *)request;

/**
 <p>Composes an email message using an email template and immediately queues it for sending.</p><p>In order to send email using the <code>SendTemplatedEmail</code> operation, your call to the API must meet the following requirements:</p><ul><li><p>The call must refer to an existing email template. You can create email templates using the <a>CreateTemplate</a> operation.</p></li><li><p>The message must be sent from a verified email address or domain.</p></li><li><p>If your account is still in the Amazon SES sandbox, you may only send to verified addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. For more information, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i></p></li><li><p>The maximum message size is 10 MB.</p></li><li><p>Calls to the <code>SendTemplatedEmail</code> operation may only include one <code>Destination</code> parameter. A destination is a set of recipients who will receive the same version of the email. The <code>Destination</code> parameter can include up to 50 recipients, across the To:, CC: and BCC: fields.</p></li><li><p>The <code>Destination</code> parameter must include at least one recipient email address. The recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid (that is, it is not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message will be rejected, even if the message contains other recipients that are valid.</p></li></ul><important><p>If your call to the <code>SendTemplatedEmail</code> operation includes all of the required parameters, Amazon SES accepts it and returns a Message ID. However, if Amazon SES can't render the email because the template contains errors, it doesn't send the email. Additionally, because it already accepted the message, Amazon SES doesn't return a message stating that it was unable to send the email.</p><p>For these reasons, we highly recommend that you set up Amazon SES to send you notifications when Rendering Failure events occur. For more information, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Sending Personalized Email Using the Amazon SES API</a> in the <i>Amazon Simple Email Service Developer Guide</i>.</p></important>
 
 @param request A container for the necessary parameters to execute the SendTemplatedEmail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorTemplateDoesNotExist`, `AWSSESErrorConfigurationSetSendingPaused`, `AWSSESErrorAccountSendingPaused`.
 
 @see AWSSESSendTemplatedEmailRequest
 @see AWSSESSendTemplatedEmailResponse
 */
- (void)sendTemplatedEmail:(AWSSESSendTemplatedEmailRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendTemplatedEmailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the specified receipt rule set as the active receipt rule set.</p><note><p>To disable your email-receiving through Amazon SES completely, you can call this API with RuleSetName set to null.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SetActiveReceiptRuleSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetActiveReceiptRuleSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESSetActiveReceiptRuleSetRequest
 @see AWSSESSetActiveReceiptRuleSetResponse
 */
- (AWSTask<AWSSESSetActiveReceiptRuleSetResponse *> *)setActiveReceiptRuleSet:(AWSSESSetActiveReceiptRuleSetRequest *)request;

/**
 <p>Sets the specified receipt rule set as the active receipt rule set.</p><note><p>To disable your email-receiving through Amazon SES completely, you can call this API with RuleSetName set to null.</p></note><p>For information about managing receipt rule sets, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SetActiveReceiptRuleSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`.
 
 @see AWSSESSetActiveReceiptRuleSetRequest
 @see AWSSESSetActiveReceiptRuleSetResponse
 */
- (void)setActiveReceiptRuleSet:(AWSSESSetActiveReceiptRuleSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetActiveReceiptRuleSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables or disables Easy DKIM signing of email sent from an identity:</p><ul><li><p>If Easy DKIM signing is enabled for a domain name identity (such as <code>example.com</code>), then Amazon SES will DKIM-sign all email sent by addresses under that domain name (for example, <code>user@example.com</code>).</p></li><li><p>If Easy DKIM signing is enabled for an email address, then Amazon SES will DKIM-sign all email sent by that email address.</p></li></ul><p>For email addresses (for example, <code>user@example.com</code>), you can only enable Easy DKIM signing if the corresponding domain (in this case, <code>example.com</code>) has been set up for Easy DKIM using the AWS Console or the <code>VerifyDomainDkim</code> operation.</p><p>You can execute this operation no more than once per second.</p><p>For more information about Easy DKIM signing, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityDkimEnabled service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityDkimEnabledResponse`.
 
 @see AWSSESSetIdentityDkimEnabledRequest
 @see AWSSESSetIdentityDkimEnabledResponse
 */
- (AWSTask<AWSSESSetIdentityDkimEnabledResponse *> *)setIdentityDkimEnabled:(AWSSESSetIdentityDkimEnabledRequest *)request;

/**
 <p>Enables or disables Easy DKIM signing of email sent from an identity:</p><ul><li><p>If Easy DKIM signing is enabled for a domain name identity (such as <code>example.com</code>), then Amazon SES will DKIM-sign all email sent by addresses under that domain name (for example, <code>user@example.com</code>).</p></li><li><p>If Easy DKIM signing is enabled for an email address, then Amazon SES will DKIM-sign all email sent by that email address.</p></li></ul><p>For email addresses (for example, <code>user@example.com</code>), you can only enable Easy DKIM signing if the corresponding domain (in this case, <code>example.com</code>) has been set up for Easy DKIM using the AWS Console or the <code>VerifyDomainDkim</code> operation.</p><p>You can execute this operation no more than once per second.</p><p>For more information about Easy DKIM signing, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityDkimEnabled service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESSetIdentityDkimEnabledRequest
 @see AWSSESSetIdentityDkimEnabledResponse
 */
- (void)setIdentityDkimEnabled:(AWSSESSetIdentityDkimEnabledRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetIdentityDkimEnabledResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Given an identity (an email address or a domain), enables or disables whether Amazon SES forwards bounce and complaint notifications as email. Feedback forwarding can only be disabled when Amazon Simple Notification Service (Amazon SNS) topics are specified for both bounces and complaints.</p><note><p>Feedback forwarding does not apply to delivery notifications. Delivery notifications are only available through Amazon SNS.</p></note><p>You can execute this operation no more than once per second.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityFeedbackForwardingEnabled service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityFeedbackForwardingEnabledResponse`.
 
 @see AWSSESSetIdentityFeedbackForwardingEnabledRequest
 @see AWSSESSetIdentityFeedbackForwardingEnabledResponse
 */
- (AWSTask<AWSSESSetIdentityFeedbackForwardingEnabledResponse *> *)setIdentityFeedbackForwardingEnabled:(AWSSESSetIdentityFeedbackForwardingEnabledRequest *)request;

/**
 <p>Given an identity (an email address or a domain), enables or disables whether Amazon SES forwards bounce and complaint notifications as email. Feedback forwarding can only be disabled when Amazon Simple Notification Service (Amazon SNS) topics are specified for both bounces and complaints.</p><note><p>Feedback forwarding does not apply to delivery notifications. Delivery notifications are only available through Amazon SNS.</p></note><p>You can execute this operation no more than once per second.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityFeedbackForwardingEnabled service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESSetIdentityFeedbackForwardingEnabledRequest
 @see AWSSESSetIdentityFeedbackForwardingEnabledResponse
 */
- (void)setIdentityFeedbackForwardingEnabled:(AWSSESSetIdentityFeedbackForwardingEnabledRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetIdentityFeedbackForwardingEnabledResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Given an identity (an email address or a domain), sets whether Amazon SES includes the original email headers in the Amazon Simple Notification Service (Amazon SNS) notifications of a specified type.</p><p>You can execute this operation no more than once per second.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityHeadersInNotificationsEnabled service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityHeadersInNotificationsEnabledResponse`.
 
 @see AWSSESSetIdentityHeadersInNotificationsEnabledRequest
 @see AWSSESSetIdentityHeadersInNotificationsEnabledResponse
 */
- (AWSTask<AWSSESSetIdentityHeadersInNotificationsEnabledResponse *> *)setIdentityHeadersInNotificationsEnabled:(AWSSESSetIdentityHeadersInNotificationsEnabledRequest *)request;

/**
 <p>Given an identity (an email address or a domain), sets whether Amazon SES includes the original email headers in the Amazon Simple Notification Service (Amazon SNS) notifications of a specified type.</p><p>You can execute this operation no more than once per second.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityHeadersInNotificationsEnabled service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESSetIdentityHeadersInNotificationsEnabledRequest
 @see AWSSESSetIdentityHeadersInNotificationsEnabledResponse
 */
- (void)setIdentityHeadersInNotificationsEnabled:(AWSSESSetIdentityHeadersInNotificationsEnabledRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetIdentityHeadersInNotificationsEnabledResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables or disables the custom MAIL FROM domain setup for a verified identity (an email address or a domain).</p><important><p>To send emails using the specified MAIL FROM domain, you must add an MX record to your MAIL FROM domain's DNS settings. If you want your emails to pass Sender Policy Framework (SPF) checks, you must also add or update an SPF record. For more information, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from-set.html">Amazon SES Developer Guide</a>.</p></important><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityMailFromDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityMailFromDomainResponse`.
 
 @see AWSSESSetIdentityMailFromDomainRequest
 @see AWSSESSetIdentityMailFromDomainResponse
 */
- (AWSTask<AWSSESSetIdentityMailFromDomainResponse *> *)setIdentityMailFromDomain:(AWSSESSetIdentityMailFromDomainRequest *)request;

/**
 <p>Enables or disables the custom MAIL FROM domain setup for a verified identity (an email address or a domain).</p><important><p>To send emails using the specified MAIL FROM domain, you must add an MX record to your MAIL FROM domain's DNS settings. If you want your emails to pass Sender Policy Framework (SPF) checks, you must also add or update an SPF record. For more information, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from-set.html">Amazon SES Developer Guide</a>.</p></important><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityMailFromDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESSetIdentityMailFromDomainRequest
 @see AWSSESSetIdentityMailFromDomainResponse
 */
- (void)setIdentityMailFromDomain:(AWSSESSetIdentityMailFromDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetIdentityMailFromDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets an Amazon Simple Notification Service (Amazon SNS) topic to use when delivering notifications. When you use this operation, you specify a verified identity, such as an email address or domain. When you send an email that uses the chosen identity in the Source field, Amazon SES sends notifications to the topic you specified. You can send bounce, complaint, or delivery notifications (or any combination of the three) to the Amazon SNS topic that you specify.</p><p>You can execute this operation no more than once per second.</p><p>For more information about feedback notification, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityNotificationTopic service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityNotificationTopicResponse`.
 
 @see AWSSESSetIdentityNotificationTopicRequest
 @see AWSSESSetIdentityNotificationTopicResponse
 */
- (AWSTask<AWSSESSetIdentityNotificationTopicResponse *> *)setIdentityNotificationTopic:(AWSSESSetIdentityNotificationTopicRequest *)request;

/**
 <p>Sets an Amazon Simple Notification Service (Amazon SNS) topic to use when delivering notifications. When you use this operation, you specify a verified identity, such as an email address or domain. When you send an email that uses the chosen identity in the Source field, Amazon SES sends notifications to the topic you specified. You can send bounce, complaint, or delivery notifications (or any combination of the three) to the Amazon SNS topic that you specify.</p><p>You can execute this operation no more than once per second.</p><p>For more information about feedback notification, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityNotificationTopic service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESSetIdentityNotificationTopicRequest
 @see AWSSESSetIdentityNotificationTopicResponse
 */
- (void)setIdentityNotificationTopic:(AWSSESSetIdentityNotificationTopicRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetIdentityNotificationTopicResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the position of the specified receipt rule in the receipt rule set.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SetReceiptRulePosition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetReceiptRulePositionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`.
 
 @see AWSSESSetReceiptRulePositionRequest
 @see AWSSESSetReceiptRulePositionResponse
 */
- (AWSTask<AWSSESSetReceiptRulePositionResponse *> *)setReceiptRulePosition:(AWSSESSetReceiptRulePositionRequest *)request;

/**
 <p>Sets the position of the specified receipt rule in the receipt rule set.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SetReceiptRulePosition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`.
 
 @see AWSSESSetReceiptRulePositionRequest
 @see AWSSESSetReceiptRulePositionResponse
 */
- (void)setReceiptRulePosition:(AWSSESSetReceiptRulePositionRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSetReceiptRulePositionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a preview of the MIME content of an email when provided with a template and a set of replacement data.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the TestRenderTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESTestRenderTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTemplateDoesNotExist`, `AWSSESErrorInvalidRenderingParameter`, `AWSSESErrorMissingRenderingAttribute`.
 
 @see AWSSESTestRenderTemplateRequest
 @see AWSSESTestRenderTemplateResponse
 */
- (AWSTask<AWSSESTestRenderTemplateResponse *> *)testRenderTemplate:(AWSSESTestRenderTemplateRequest *)request;

/**
 <p>Creates a preview of the MIME content of an email when provided with a template and a set of replacement data.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the TestRenderTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTemplateDoesNotExist`, `AWSSESErrorInvalidRenderingParameter`, `AWSSESErrorMissingRenderingAttribute`.
 
 @see AWSSESTestRenderTemplateRequest
 @see AWSSESTestRenderTemplateResponse
 */
- (void)testRenderTemplate:(AWSSESTestRenderTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESTestRenderTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables or disables email sending across your entire Amazon SES account in the current AWS Region. You can use this operation in conjunction with Amazon CloudWatch alarms to temporarily pause email sending across your Amazon SES account in a given AWS Region when reputation metrics (such as your bounce or complaint rates) reach certain thresholds.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAccountSendingEnabled service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSESUpdateAccountSendingEnabledRequest
 */
- (AWSTask *)updateAccountSendingEnabled:(AWSSESUpdateAccountSendingEnabledRequest *)request;

/**
 <p>Enables or disables email sending across your entire Amazon SES account in the current AWS Region. You can use this operation in conjunction with Amazon CloudWatch alarms to temporarily pause email sending across your Amazon SES account in a given AWS Region when reputation metrics (such as your bounce or complaint rates) reach certain thresholds.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAccountSendingEnabled service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESUpdateAccountSendingEnabledRequest
 */
- (void)updateAccountSendingEnabled:(AWSSESUpdateAccountSendingEnabledRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the event destination of a configuration set. Event destinations are associated with configuration sets, which enable you to publish email sending events to Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS). For information about using configuration sets, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Monitoring Your Amazon SES Sending Activity</a> in the <i>Amazon SES Developer Guide.</i></p><note><p>When you create or update an event destination, you must provide one, and only one, destination. The destination can be Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS).</p></note><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationSetEventDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESUpdateConfigurationSetEventDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorEventDestinationDoesNotExist`, `AWSSESErrorInvalidCloudWatchDestination`, `AWSSESErrorInvalidFirehoseDestination`, `AWSSESErrorInvalidSNSDestination`.
 
 @see AWSSESUpdateConfigurationSetEventDestinationRequest
 @see AWSSESUpdateConfigurationSetEventDestinationResponse
 */
- (AWSTask<AWSSESUpdateConfigurationSetEventDestinationResponse *> *)updateConfigurationSetEventDestination:(AWSSESUpdateConfigurationSetEventDestinationRequest *)request;

/**
 <p>Updates the event destination of a configuration set. Event destinations are associated with configuration sets, which enable you to publish email sending events to Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS). For information about using configuration sets, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html">Monitoring Your Amazon SES Sending Activity</a> in the <i>Amazon SES Developer Guide.</i></p><note><p>When you create or update an event destination, you must provide one, and only one, destination. The destination can be Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS).</p></note><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationSetEventDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorEventDestinationDoesNotExist`, `AWSSESErrorInvalidCloudWatchDestination`, `AWSSESErrorInvalidFirehoseDestination`, `AWSSESErrorInvalidSNSDestination`.
 
 @see AWSSESUpdateConfigurationSetEventDestinationRequest
 @see AWSSESUpdateConfigurationSetEventDestinationResponse
 */
- (void)updateConfigurationSetEventDestination:(AWSSESUpdateConfigurationSetEventDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSSESUpdateConfigurationSetEventDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables or disables the publishing of reputation metrics for emails sent using a specific configuration set in a given AWS Region. Reputation metrics include bounce and complaint rates. These metrics are published to Amazon CloudWatch. By using CloudWatch, you can create alarms when bounce or complaint rates exceed certain thresholds.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationSetReputationMetricsEnabled service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`.
 
 @see AWSSESUpdateConfigurationSetReputationMetricsEnabledRequest
 */
- (AWSTask *)updateConfigurationSetReputationMetricsEnabled:(AWSSESUpdateConfigurationSetReputationMetricsEnabledRequest *)request;

/**
 <p>Enables or disables the publishing of reputation metrics for emails sent using a specific configuration set in a given AWS Region. Reputation metrics include bounce and complaint rates. These metrics are published to Amazon CloudWatch. By using CloudWatch, you can create alarms when bounce or complaint rates exceed certain thresholds.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationSetReputationMetricsEnabled service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`.
 
 @see AWSSESUpdateConfigurationSetReputationMetricsEnabledRequest
 */
- (void)updateConfigurationSetReputationMetricsEnabled:(AWSSESUpdateConfigurationSetReputationMetricsEnabledRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables or disables email sending for messages sent using a specific configuration set in a given AWS Region. You can use this operation in conjunction with Amazon CloudWatch alarms to temporarily pause email sending for a configuration set when the reputation metrics for that configuration set (such as your bounce on complaint rate) exceed certain thresholds.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationSetSendingEnabled service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`.
 
 @see AWSSESUpdateConfigurationSetSendingEnabledRequest
 */
- (AWSTask *)updateConfigurationSetSendingEnabled:(AWSSESUpdateConfigurationSetSendingEnabledRequest *)request;

/**
 <p>Enables or disables email sending for messages sent using a specific configuration set in a given AWS Region. You can use this operation in conjunction with Amazon CloudWatch alarms to temporarily pause email sending for a configuration set when the reputation metrics for that configuration set (such as your bounce on complaint rate) exceed certain thresholds.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationSetSendingEnabled service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`.
 
 @see AWSSESUpdateConfigurationSetSendingEnabledRequest
 */
- (void)updateConfigurationSetSendingEnabled:(AWSSESUpdateConfigurationSetSendingEnabledRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an association between a configuration set and a custom domain for open and click event tracking. </p><p>By default, images and links used for tracking open and click events are hosted on domains operated by Amazon SES. You can configure a subdomain of your own to handle these events. For information about using custom domains, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationSetTrackingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESUpdateConfigurationSetTrackingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorTrackingOptionsDoesNotExist`, `AWSSESErrorInvalidTrackingOptions`.
 
 @see AWSSESUpdateConfigurationSetTrackingOptionsRequest
 @see AWSSESUpdateConfigurationSetTrackingOptionsResponse
 */
- (AWSTask<AWSSESUpdateConfigurationSetTrackingOptionsResponse *> *)updateConfigurationSetTrackingOptions:(AWSSESUpdateConfigurationSetTrackingOptionsRequest *)request;

/**
 <p>Modifies an association between a configuration set and a custom domain for open and click event tracking. </p><p>By default, images and links used for tracking open and click events are hosted on domains operated by Amazon SES. You can configure a subdomain of your own to handle these events. For information about using custom domains, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationSetTrackingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorConfigurationSetDoesNotExist`, `AWSSESErrorTrackingOptionsDoesNotExist`, `AWSSESErrorInvalidTrackingOptions`.
 
 @see AWSSESUpdateConfigurationSetTrackingOptionsRequest
 @see AWSSESUpdateConfigurationSetTrackingOptionsResponse
 */
- (void)updateConfigurationSetTrackingOptions:(AWSSESUpdateConfigurationSetTrackingOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESUpdateConfigurationSetTrackingOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing custom verification email template.</p><p>For more information about custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCustomVerificationEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorCustomVerificationEmailTemplateDoesNotExist`, `AWSSESErrorFromEmailAddressNotVerified`, `AWSSESErrorCustomVerificationEmailInvalidContent`.
 
 @see AWSSESUpdateCustomVerificationEmailTemplateRequest
 */
- (AWSTask *)updateCustomVerificationEmailTemplate:(AWSSESUpdateCustomVerificationEmailTemplateRequest *)request;

/**
 <p>Updates an existing custom verification email template.</p><p>For more information about custom verification email templates, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCustomVerificationEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorCustomVerificationEmailTemplateDoesNotExist`, `AWSSESErrorFromEmailAddressNotVerified`, `AWSSESErrorCustomVerificationEmailInvalidContent`.
 
 @see AWSSESUpdateCustomVerificationEmailTemplateRequest
 */
- (void)updateCustomVerificationEmailTemplate:(AWSSESUpdateCustomVerificationEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates a receipt rule.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateReceiptRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESUpdateReceiptRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidSnsTopic`, `AWSSESErrorInvalidS3Configuration`, `AWSSESErrorInvalidLambdaFunction`, `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESUpdateReceiptRuleRequest
 @see AWSSESUpdateReceiptRuleResponse
 */
- (AWSTask<AWSSESUpdateReceiptRuleResponse *> *)updateReceiptRule:(AWSSESUpdateReceiptRuleRequest *)request;

/**
 <p>Updates a receipt rule.</p><p>For information about managing receipt rules, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateReceiptRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorInvalidSnsTopic`, `AWSSESErrorInvalidS3Configuration`, `AWSSESErrorInvalidLambdaFunction`, `AWSSESErrorRuleSetDoesNotExist`, `AWSSESErrorRuleDoesNotExist`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESUpdateReceiptRuleRequest
 @see AWSSESUpdateReceiptRuleResponse
 */
- (void)updateReceiptRule:(AWSSESUpdateReceiptRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSSESUpdateReceiptRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESUpdateTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTemplateDoesNotExist`, `AWSSESErrorInvalidTemplate`.
 
 @see AWSSESUpdateTemplateRequest
 @see AWSSESUpdateTemplateResponse
 */
- (AWSTask<AWSSESUpdateTemplateResponse *> *)updateTemplate:(AWSSESUpdateTemplateRequest *)request;

/**
 <p>Updates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTemplateDoesNotExist`, `AWSSESErrorInvalidTemplate`.
 
 @see AWSSESUpdateTemplateRequest
 @see AWSSESUpdateTemplateResponse
 */
- (void)updateTemplate:(AWSSESUpdateTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESUpdateTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a set of DKIM tokens for a domain. DKIM <i>tokens</i> are character strings that represent your domain's identity. Using these tokens, you will need to create DNS CNAME records that point to DKIM public keys hosted by Amazon SES. Amazon Web Services will eventually detect that you have updated your DNS records; this detection process may take up to 72 hours. Upon successful detection, Amazon SES will be able to DKIM-sign email originating from that domain.</p><p>You can execute this operation no more than once per second.</p><p>To enable or disable Easy DKIM signing for a domain, use the <code>SetIdentityDkimEnabled</code> operation.</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the VerifyDomainDkim service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESVerifyDomainDkimResponse`.
 
 @see AWSSESVerifyDomainDkimRequest
 @see AWSSESVerifyDomainDkimResponse
 */
- (AWSTask<AWSSESVerifyDomainDkimResponse *> *)verifyDomainDkim:(AWSSESVerifyDomainDkimRequest *)request;

/**
 <p>Returns a set of DKIM tokens for a domain. DKIM <i>tokens</i> are character strings that represent your domain's identity. Using these tokens, you will need to create DNS CNAME records that point to DKIM public keys hosted by Amazon SES. Amazon Web Services will eventually detect that you have updated your DNS records; this detection process may take up to 72 hours. Upon successful detection, Amazon SES will be able to DKIM-sign email originating from that domain.</p><p>You can execute this operation no more than once per second.</p><p>To enable or disable Easy DKIM signing for a domain, use the <code>SetIdentityDkimEnabled</code> operation.</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the VerifyDomainDkim service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESVerifyDomainDkimRequest
 @see AWSSESVerifyDomainDkimResponse
 */
- (void)verifyDomainDkim:(AWSSESVerifyDomainDkimRequest *)request completionHandler:(void (^ _Nullable)(AWSSESVerifyDomainDkimResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a domain to the list of identities for your Amazon SES account in the current AWS Region and attempts to verify it. For more information about verifying domains, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i></p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyDomainIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESVerifyDomainIdentityResponse`.
 
 @see AWSSESVerifyDomainIdentityRequest
 @see AWSSESVerifyDomainIdentityResponse
 */
- (AWSTask<AWSSESVerifyDomainIdentityResponse *> *)verifyDomainIdentity:(AWSSESVerifyDomainIdentityRequest *)request;

/**
 <p>Adds a domain to the list of identities for your Amazon SES account in the current AWS Region and attempts to verify it. For more information about verifying domains, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i></p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyDomainIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESVerifyDomainIdentityRequest
 @see AWSSESVerifyDomainIdentityResponse
 */
- (void)verifyDomainIdentity:(AWSSESVerifyDomainIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSSESVerifyDomainIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deprecated. Use the <code>VerifyEmailIdentity</code> operation to verify a new email address.</p>
 
 @param request A container for the necessary parameters to execute the VerifyEmailAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSESVerifyEmailAddressRequest
 */
- (AWSTask *)verifyEmailAddress:(AWSSESVerifyEmailAddressRequest *)request;

/**
 <p>Deprecated. Use the <code>VerifyEmailIdentity</code> operation to verify a new email address.</p>
 
 @param request A container for the necessary parameters to execute the VerifyEmailAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSESVerifyEmailAddressRequest
 */
- (void)verifyEmailAddress:(AWSSESVerifyEmailAddressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds an email address to the list of identities for your Amazon SES account in the current AWS region and attempts to verify it. As a result of executing this operation, a verification email is sent to the specified address.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyEmailIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESVerifyEmailIdentityResponse`.
 
 @see AWSSESVerifyEmailIdentityRequest
 @see AWSSESVerifyEmailIdentityResponse
 */
- (AWSTask<AWSSESVerifyEmailIdentityResponse *> *)verifyEmailIdentity:(AWSSESVerifyEmailIdentityRequest *)request;

/**
 <p>Adds an email address to the list of identities for your Amazon SES account in the current AWS region and attempts to verify it. As a result of executing this operation, a verification email is sent to the specified address.</p><p>You can execute this operation no more than once per second.</p>
 
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
