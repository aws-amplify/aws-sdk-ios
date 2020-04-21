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
#import "AWSroute53domainsModel.h"
#import "AWSroute53domainsResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSroute53domains
FOUNDATION_EXPORT NSString *const AWSroute53domainsSDKVersion;

/**
 <p>Amazon Route 53 API actions let you register domain names and perform related operations.</p>
 */
@interface AWSroute53domains : AWSService

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

     let route53domains = AWSroute53domains.default()

 *Objective-C*

     AWSroute53domains *route53domains = [AWSroute53domains defaultroute53domains];

 @return The default service client.
 */
+ (instancetype)defaultroute53domains;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSroute53domains.register(with: configuration!, forKey: "USWest2route53domains")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:@"USWest2route53domains"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let route53domains = AWSroute53domains(forKey: "USWest2route53domains")

 *Objective-C*

     AWSroute53domains *route53domains = [AWSroute53domains route53domainsForKey:@"USWest2route53domains"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerroute53domainsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerroute53domainsWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSroute53domains.register(with: configuration!, forKey: "USWest2route53domains")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:@"USWest2route53domains"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let route53domains = AWSroute53domains(forKey: "USWest2route53domains")

 *Objective-C*

     AWSroute53domains *route53domains = [AWSroute53domains route53domainsForKey:@"USWest2route53domains"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)route53domainsForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeroute53domainsForKey:(NSString *)key;

/**
 <p>Accepts the transfer of a domain from another AWS account to the current AWS account. You initiate a transfer between AWS accounts using <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>. </p><p>Use either <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a> or <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> to determine whether the operation succeeded. <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>
 
 @param request A container for the necessary parameters to execute the AcceptDomainTransferFromAnotherAwsAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorDomainLimitExceeded`.
 
 @see AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountRequest
 @see AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse
 */
- (AWSTask<AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse *> *)acceptDomainTransferFromAnotherAwsAccount:(AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountRequest *)request;

/**
 <p>Accepts the transfer of a domain from another AWS account to the current AWS account. You initiate a transfer between AWS accounts using <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>. </p><p>Use either <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a> or <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> to determine whether the operation succeeded. <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>
 
 @param request A container for the necessary parameters to execute the AcceptDomainTransferFromAnotherAwsAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorDomainLimitExceeded`.
 
 @see AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountRequest
 @see AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse
 */
- (void)acceptDomainTransferFromAnotherAwsAccount:(AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels the transfer of a domain from the current AWS account to another AWS account. You initiate a transfer between AWS accounts using <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>. </p><important><p>You must cancel the transfer before the other AWS account accepts the transfer using <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html">AcceptDomainTransferFromAnotherAwsAccount</a>.</p></important><p>Use either <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a> or <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> to determine whether the operation succeeded. <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>
 
 @param request A container for the necessary parameters to execute the CancelDomainTransferToAnotherAwsAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`.
 
 @see AWSroute53domainsCancelDomainTransferToAnotherAwsAccountRequest
 @see AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse
 */
- (AWSTask<AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse *> *)cancelDomainTransferToAnotherAwsAccount:(AWSroute53domainsCancelDomainTransferToAnotherAwsAccountRequest *)request;

/**
 <p>Cancels the transfer of a domain from the current AWS account to another AWS account. You initiate a transfer between AWS accounts using <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>. </p><important><p>You must cancel the transfer before the other AWS account accepts the transfer using <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html">AcceptDomainTransferFromAnotherAwsAccount</a>.</p></important><p>Use either <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a> or <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> to determine whether the operation succeeded. <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>
 
 @param request A container for the necessary parameters to execute the CancelDomainTransferToAnotherAwsAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`.
 
 @see AWSroute53domainsCancelDomainTransferToAnotherAwsAccountRequest
 @see AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse
 */
- (void)cancelDomainTransferToAnotherAwsAccount:(AWSroute53domainsCancelDomainTransferToAnotherAwsAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation checks the availability of one domain name. Note that if the availability status of a domain is pending, you must submit another request to determine the availability of the domain name.</p>
 
 @param request A container for the necessary parameters to execute the CheckDomainAvailability service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsCheckDomainAvailabilityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsCheckDomainAvailabilityRequest
 @see AWSroute53domainsCheckDomainAvailabilityResponse
 */
- (AWSTask<AWSroute53domainsCheckDomainAvailabilityResponse *> *)checkDomainAvailability:(AWSroute53domainsCheckDomainAvailabilityRequest *)request;

/**
 <p>This operation checks the availability of one domain name. Note that if the availability status of a domain is pending, you must submit another request to determine the availability of the domain name.</p>
 
 @param request A container for the necessary parameters to execute the CheckDomainAvailability service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsCheckDomainAvailabilityRequest
 @see AWSroute53domainsCheckDomainAvailabilityResponse
 */
- (void)checkDomainAvailability:(AWSroute53domainsCheckDomainAvailabilityRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsCheckDomainAvailabilityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Checks whether a domain name can be transferred to Amazon Route 53. </p>
 
 @param request A container for the necessary parameters to execute the CheckDomainTransferability service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsCheckDomainTransferabilityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsCheckDomainTransferabilityRequest
 @see AWSroute53domainsCheckDomainTransferabilityResponse
 */
- (AWSTask<AWSroute53domainsCheckDomainTransferabilityResponse *> *)checkDomainTransferability:(AWSroute53domainsCheckDomainTransferabilityRequest *)request;

/**
 <p>Checks whether a domain name can be transferred to Amazon Route 53. </p>
 
 @param request A container for the necessary parameters to execute the CheckDomainTransferability service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsCheckDomainTransferabilityRequest
 @see AWSroute53domainsCheckDomainTransferabilityResponse
 */
- (void)checkDomainTransferability:(AWSroute53domainsCheckDomainTransferabilityRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsCheckDomainTransferabilityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation deletes the specified tags for a domain.</p><p>All tag operations are eventually consistent; subsequent operations might not immediately represent all issued operations.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTagsForDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsDeleteTagsForDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsDeleteTagsForDomainRequest
 @see AWSroute53domainsDeleteTagsForDomainResponse
 */
- (AWSTask<AWSroute53domainsDeleteTagsForDomainResponse *> *)deleteTagsForDomain:(AWSroute53domainsDeleteTagsForDomainRequest *)request;

/**
 <p>This operation deletes the specified tags for a domain.</p><p>All tag operations are eventually consistent; subsequent operations might not immediately represent all issued operations.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTagsForDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsDeleteTagsForDomainRequest
 @see AWSroute53domainsDeleteTagsForDomainResponse
 */
- (void)deleteTagsForDomain:(AWSroute53domainsDeleteTagsForDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsDeleteTagsForDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation disables automatic renewal of domain registration for the specified domain.</p>
 
 @param request A container for the necessary parameters to execute the DisableDomainAutoRenew service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsDisableDomainAutoRenewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsDisableDomainAutoRenewRequest
 @see AWSroute53domainsDisableDomainAutoRenewResponse
 */
- (AWSTask<AWSroute53domainsDisableDomainAutoRenewResponse *> *)disableDomainAutoRenew:(AWSroute53domainsDisableDomainAutoRenewRequest *)request;

/**
 <p>This operation disables automatic renewal of domain registration for the specified domain.</p>
 
 @param request A container for the necessary parameters to execute the DisableDomainAutoRenew service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsDisableDomainAutoRenewRequest
 @see AWSroute53domainsDisableDomainAutoRenewResponse
 */
- (void)disableDomainAutoRenew:(AWSroute53domainsDisableDomainAutoRenewRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsDisableDomainAutoRenewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation removes the transfer lock on the domain (specifically the <code>clientTransferProhibited</code> status) to allow domain transfers. We recommend you refrain from performing this action unless you intend to transfer the domain to a different registrar. Successful submission returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>
 
 @param request A container for the necessary parameters to execute the DisableDomainTransferLock service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsDisableDomainTransferLockResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsDisableDomainTransferLockRequest
 @see AWSroute53domainsDisableDomainTransferLockResponse
 */
- (AWSTask<AWSroute53domainsDisableDomainTransferLockResponse *> *)disableDomainTransferLock:(AWSroute53domainsDisableDomainTransferLockRequest *)request;

/**
 <p>This operation removes the transfer lock on the domain (specifically the <code>clientTransferProhibited</code> status) to allow domain transfers. We recommend you refrain from performing this action unless you intend to transfer the domain to a different registrar. Successful submission returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>
 
 @param request A container for the necessary parameters to execute the DisableDomainTransferLock service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsDisableDomainTransferLockRequest
 @see AWSroute53domainsDisableDomainTransferLockResponse
 */
- (void)disableDomainTransferLock:(AWSroute53domainsDisableDomainTransferLockRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsDisableDomainTransferLockResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation configures Amazon Route 53 to automatically renew the specified domain before the domain registration expires. The cost of renewing your domain registration is billed to your AWS account.</p><p>The period during which you can renew a domain name varies by TLD. For a list of TLDs and their renewal policies, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains That You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>. Route 53 requires that you renew before the end of the renewal period so we can complete processing before the deadline.</p>
 
 @param request A container for the necessary parameters to execute the EnableDomainAutoRenew service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsEnableDomainAutoRenewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`, `AWSroute53domainsErrorTLDRulesViolation`.
 
 @see AWSroute53domainsEnableDomainAutoRenewRequest
 @see AWSroute53domainsEnableDomainAutoRenewResponse
 */
- (AWSTask<AWSroute53domainsEnableDomainAutoRenewResponse *> *)enableDomainAutoRenew:(AWSroute53domainsEnableDomainAutoRenewRequest *)request;

/**
 <p>This operation configures Amazon Route 53 to automatically renew the specified domain before the domain registration expires. The cost of renewing your domain registration is billed to your AWS account.</p><p>The period during which you can renew a domain name varies by TLD. For a list of TLDs and their renewal policies, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains That You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>. Route 53 requires that you renew before the end of the renewal period so we can complete processing before the deadline.</p>
 
 @param request A container for the necessary parameters to execute the EnableDomainAutoRenew service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`, `AWSroute53domainsErrorTLDRulesViolation`.
 
 @see AWSroute53domainsEnableDomainAutoRenewRequest
 @see AWSroute53domainsEnableDomainAutoRenewResponse
 */
- (void)enableDomainAutoRenew:(AWSroute53domainsEnableDomainAutoRenewRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsEnableDomainAutoRenewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation sets the transfer lock on the domain (specifically the <code>clientTransferProhibited</code> status) to prevent domain transfers. Successful submission returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>
 
 @param request A container for the necessary parameters to execute the EnableDomainTransferLock service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsEnableDomainTransferLockResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsEnableDomainTransferLockRequest
 @see AWSroute53domainsEnableDomainTransferLockResponse
 */
- (AWSTask<AWSroute53domainsEnableDomainTransferLockResponse *> *)enableDomainTransferLock:(AWSroute53domainsEnableDomainTransferLockRequest *)request;

/**
 <p>This operation sets the transfer lock on the domain (specifically the <code>clientTransferProhibited</code> status) to prevent domain transfers. Successful submission returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>
 
 @param request A container for the necessary parameters to execute the EnableDomainTransferLock service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsEnableDomainTransferLockRequest
 @see AWSroute53domainsEnableDomainTransferLockResponse
 */
- (void)enableDomainTransferLock:(AWSroute53domainsEnableDomainTransferLockRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsEnableDomainTransferLockResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For operations that require confirmation that the email address for the registrant contact is valid, such as registering a new domain, this operation returns information about whether the registrant contact has responded.</p><p>If you want us to resend the email, use the <code>ResendContactReachabilityEmail</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetContactReachabilityStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsGetContactReachabilityStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsGetContactReachabilityStatusRequest
 @see AWSroute53domainsGetContactReachabilityStatusResponse
 */
- (AWSTask<AWSroute53domainsGetContactReachabilityStatusResponse *> *)getContactReachabilityStatus:(AWSroute53domainsGetContactReachabilityStatusRequest *)request;

/**
 <p>For operations that require confirmation that the email address for the registrant contact is valid, such as registering a new domain, this operation returns information about whether the registrant contact has responded.</p><p>If you want us to resend the email, use the <code>ResendContactReachabilityEmail</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetContactReachabilityStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsGetContactReachabilityStatusRequest
 @see AWSroute53domainsGetContactReachabilityStatusResponse
 */
- (void)getContactReachabilityStatus:(AWSroute53domainsGetContactReachabilityStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsGetContactReachabilityStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns detailed information about a specified domain that is associated with the current AWS account. Contact information for the domain is also returned as part of the output.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainDetail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsGetDomainDetailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsGetDomainDetailRequest
 @see AWSroute53domainsGetDomainDetailResponse
 */
- (AWSTask<AWSroute53domainsGetDomainDetailResponse *> *)getDomainDetail:(AWSroute53domainsGetDomainDetailRequest *)request;

/**
 <p>This operation returns detailed information about a specified domain that is associated with the current AWS account. Contact information for the domain is also returned as part of the output.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainDetail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsGetDomainDetailRequest
 @see AWSroute53domainsGetDomainDetailResponse
 */
- (void)getDomainDetail:(AWSroute53domainsGetDomainDetailRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsGetDomainDetailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The GetDomainSuggestions operation returns a list of suggested domain names.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainSuggestions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsGetDomainSuggestionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsGetDomainSuggestionsRequest
 @see AWSroute53domainsGetDomainSuggestionsResponse
 */
- (AWSTask<AWSroute53domainsGetDomainSuggestionsResponse *> *)getDomainSuggestions:(AWSroute53domainsGetDomainSuggestionsRequest *)request;

/**
 <p>The GetDomainSuggestions operation returns a list of suggested domain names.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainSuggestions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsGetDomainSuggestionsRequest
 @see AWSroute53domainsGetDomainSuggestionsResponse
 */
- (void)getDomainSuggestions:(AWSroute53domainsGetDomainSuggestionsRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsGetDomainSuggestionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns the current status of an operation that is not completed.</p>
 
 @param request A container for the necessary parameters to execute the GetOperationDetail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsGetOperationDetailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`.
 
 @see AWSroute53domainsGetOperationDetailRequest
 @see AWSroute53domainsGetOperationDetailResponse
 */
- (AWSTask<AWSroute53domainsGetOperationDetailResponse *> *)getOperationDetail:(AWSroute53domainsGetOperationDetailRequest *)request;

/**
 <p>This operation returns the current status of an operation that is not completed.</p>
 
 @param request A container for the necessary parameters to execute the GetOperationDetail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`.
 
 @see AWSroute53domainsGetOperationDetailRequest
 @see AWSroute53domainsGetOperationDetailResponse
 */
- (void)getOperationDetail:(AWSroute53domainsGetOperationDetailRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsGetOperationDetailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns all the domain names registered with Amazon Route 53 for the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDomains service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsListDomainsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`.
 
 @see AWSroute53domainsListDomainsRequest
 @see AWSroute53domainsListDomainsResponse
 */
- (AWSTask<AWSroute53domainsListDomainsResponse *> *)listDomains:(AWSroute53domainsListDomainsRequest *)request;

/**
 <p>This operation returns all the domain names registered with Amazon Route 53 for the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDomains service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`.
 
 @see AWSroute53domainsListDomainsRequest
 @see AWSroute53domainsListDomainsResponse
 */
- (void)listDomains:(AWSroute53domainsListDomainsRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsListDomainsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all of the operations that return an operation ID and that have ever been performed on domains that were registered by the current account. </p>
 
 @param request A container for the necessary parameters to execute the ListOperations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsListOperationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`.
 
 @see AWSroute53domainsListOperationsRequest
 @see AWSroute53domainsListOperationsResponse
 */
- (AWSTask<AWSroute53domainsListOperationsResponse *> *)listOperations:(AWSroute53domainsListOperationsRequest *)request;

/**
 <p>Returns information about all of the operations that return an operation ID and that have ever been performed on domains that were registered by the current account. </p>
 
 @param request A container for the necessary parameters to execute the ListOperations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`.
 
 @see AWSroute53domainsListOperationsRequest
 @see AWSroute53domainsListOperationsResponse
 */
- (void)listOperations:(AWSroute53domainsListOperationsRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsListOperationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns all of the tags that are associated with the specified domain.</p><p>All tag operations are eventually consistent; subsequent operations might not immediately represent all issued operations.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsListTagsForDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsListTagsForDomainRequest
 @see AWSroute53domainsListTagsForDomainResponse
 */
- (AWSTask<AWSroute53domainsListTagsForDomainResponse *> *)listTagsForDomain:(AWSroute53domainsListTagsForDomainRequest *)request;

/**
 <p>This operation returns all of the tags that are associated with the specified domain.</p><p>All tag operations are eventually consistent; subsequent operations might not immediately represent all issued operations.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsListTagsForDomainRequest
 @see AWSroute53domainsListTagsForDomainResponse
 */
- (void)listTagsForDomain:(AWSroute53domainsListTagsForDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsListTagsForDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation registers a domain. Domains are registered either by Amazon Registrar (for .com, .net, and .org domains) or by our registrar associate, Gandi (for all other domains). For some top-level domains (TLDs), this operation requires extra parameters.</p><p>When you register a domain, Amazon Route 53 does the following:</p><ul><li><p>Creates a Route 53 hosted zone that has the same name as the domain. Route 53 assigns four name servers to your hosted zone and automatically updates your domain registration with the names of these name servers.</p></li><li><p>Enables autorenew, so your domain registration will renew automatically each year. We'll notify you in advance of the renewal date so you can choose whether to renew the registration.</p></li><li><p>Optionally enables privacy protection, so WHOIS queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you don't enable privacy protection, WHOIS queries return the information that you entered for the registrant, admin, and tech contacts.</p></li><li><p>If registration is successful, returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant is notified by email.</p></li><li><p>Charges your AWS account an amount based on the top-level domain. For more information, see <a href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the RegisterDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsRegisterDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorDomainLimitExceeded`, `AWSroute53domainsErrorOperationLimitExceeded`.
 
 @see AWSroute53domainsRegisterDomainRequest
 @see AWSroute53domainsRegisterDomainResponse
 */
- (AWSTask<AWSroute53domainsRegisterDomainResponse *> *)registerDomain:(AWSroute53domainsRegisterDomainRequest *)request;

/**
 <p>This operation registers a domain. Domains are registered either by Amazon Registrar (for .com, .net, and .org domains) or by our registrar associate, Gandi (for all other domains). For some top-level domains (TLDs), this operation requires extra parameters.</p><p>When you register a domain, Amazon Route 53 does the following:</p><ul><li><p>Creates a Route 53 hosted zone that has the same name as the domain. Route 53 assigns four name servers to your hosted zone and automatically updates your domain registration with the names of these name servers.</p></li><li><p>Enables autorenew, so your domain registration will renew automatically each year. We'll notify you in advance of the renewal date so you can choose whether to renew the registration.</p></li><li><p>Optionally enables privacy protection, so WHOIS queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you don't enable privacy protection, WHOIS queries return the information that you entered for the registrant, admin, and tech contacts.</p></li><li><p>If registration is successful, returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant is notified by email.</p></li><li><p>Charges your AWS account an amount based on the top-level domain. For more information, see <a href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the RegisterDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorDomainLimitExceeded`, `AWSroute53domainsErrorOperationLimitExceeded`.
 
 @see AWSroute53domainsRegisterDomainRequest
 @see AWSroute53domainsRegisterDomainResponse
 */
- (void)registerDomain:(AWSroute53domainsRegisterDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsRegisterDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Rejects the transfer of a domain from another AWS account to the current AWS account. You initiate a transfer between AWS accounts using <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>. </p><p>Use either <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a> or <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> to determine whether the operation succeeded. <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>
 
 @param request A container for the necessary parameters to execute the RejectDomainTransferFromAnotherAwsAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`.
 
 @see AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountRequest
 @see AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse
 */
- (AWSTask<AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse *> *)rejectDomainTransferFromAnotherAwsAccount:(AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountRequest *)request;

/**
 <p>Rejects the transfer of a domain from another AWS account to the current AWS account. You initiate a transfer between AWS accounts using <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>. </p><p>Use either <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a> or <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> to determine whether the operation succeeded. <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>
 
 @param request A container for the necessary parameters to execute the RejectDomainTransferFromAnotherAwsAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`.
 
 @see AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountRequest
 @see AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse
 */
- (void)rejectDomainTransferFromAnotherAwsAccount:(AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation renews a domain for the specified number of years. The cost of renewing your domain is billed to your AWS account.</p><p>We recommend that you renew your domain several weeks before the expiration date. Some TLD registries delete domains before the expiration date if you haven't renewed far enough in advance. For more information about renewing domain registration, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-renew.html">Renewing Registration for a Domain</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RenewDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsRenewDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`.
 
 @see AWSroute53domainsRenewDomainRequest
 @see AWSroute53domainsRenewDomainResponse
 */
- (AWSTask<AWSroute53domainsRenewDomainResponse *> *)renewDomain:(AWSroute53domainsRenewDomainRequest *)request;

/**
 <p>This operation renews a domain for the specified number of years. The cost of renewing your domain is billed to your AWS account.</p><p>We recommend that you renew your domain several weeks before the expiration date. Some TLD registries delete domains before the expiration date if you haven't renewed far enough in advance. For more information about renewing domain registration, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-renew.html">Renewing Registration for a Domain</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RenewDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`.
 
 @see AWSroute53domainsRenewDomainRequest
 @see AWSroute53domainsRenewDomainResponse
 */
- (void)renewDomain:(AWSroute53domainsRenewDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsRenewDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For operations that require confirmation that the email address for the registrant contact is valid, such as registering a new domain, this operation resends the confirmation email to the current email address for the registrant contact.</p>
 
 @param request A container for the necessary parameters to execute the ResendContactReachabilityEmail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsResendContactReachabilityEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsResendContactReachabilityEmailRequest
 @see AWSroute53domainsResendContactReachabilityEmailResponse
 */
- (AWSTask<AWSroute53domainsResendContactReachabilityEmailResponse *> *)resendContactReachabilityEmail:(AWSroute53domainsResendContactReachabilityEmailRequest *)request;

/**
 <p>For operations that require confirmation that the email address for the registrant contact is valid, such as registering a new domain, this operation resends the confirmation email to the current email address for the registrant contact.</p>
 
 @param request A container for the necessary parameters to execute the ResendContactReachabilityEmail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsResendContactReachabilityEmailRequest
 @see AWSroute53domainsResendContactReachabilityEmailResponse
 */
- (void)resendContactReachabilityEmail:(AWSroute53domainsResendContactReachabilityEmailRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsResendContactReachabilityEmailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns the AuthCode for the domain. To transfer a domain to another registrar, you provide this value to the new registrar.</p>
 
 @param request A container for the necessary parameters to execute the RetrieveDomainAuthCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsRetrieveDomainAuthCodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsRetrieveDomainAuthCodeRequest
 @see AWSroute53domainsRetrieveDomainAuthCodeResponse
 */
- (AWSTask<AWSroute53domainsRetrieveDomainAuthCodeResponse *> *)retrieveDomainAuthCode:(AWSroute53domainsRetrieveDomainAuthCodeRequest *)request;

/**
 <p>This operation returns the AuthCode for the domain. To transfer a domain to another registrar, you provide this value to the new registrar.</p>
 
 @param request A container for the necessary parameters to execute the RetrieveDomainAuthCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsRetrieveDomainAuthCodeRequest
 @see AWSroute53domainsRetrieveDomainAuthCodeResponse
 */
- (void)retrieveDomainAuthCode:(AWSroute53domainsRetrieveDomainAuthCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsRetrieveDomainAuthCodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Transfers a domain from another registrar to Amazon Route 53. When the transfer is complete, the domain is registered either with Amazon Registrar (for .com, .net, and .org domains) or with our registrar associate, Gandi (for all other TLDs).</p><p>For more information about transferring domains, see the following topics:</p><ul><li><p>For transfer requirements, a detailed procedure, and information about viewing the status of a domain that you're transferring to Route 53, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-to-route-53.html">Transferring Registration for a Domain to Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p></li><li><p>For information about how to transfer a domain from one AWS account to another, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>. </p></li><li><p>For information about how to transfer a domain to another domain registrar, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-from-route-53.html">Transferring a Domain from Amazon Route 53 to Another Registrar</a> in the <i>Amazon Route 53 Developer Guide</i>.</p></li></ul><p>If the registrar for your domain is also the DNS service provider for the domain, we highly recommend that you transfer your DNS service to Route 53 or to another DNS service provider before you transfer your registration. Some registrars provide free DNS service when you purchase a domain registration. When you transfer the registration, the previous registrar will not renew your domain registration and could end your DNS service at any time.</p><important><p>If the registrar for your domain is also the DNS service provider for the domain and you don't transfer DNS service to another provider, your website, email, and the web applications associated with the domain might become unavailable.</p></important><p>If the transfer is successful, this method returns an operation ID that you can use to track the progress and completion of the action. If the transfer doesn't complete successfully, the domain registrant will be notified by email.</p>
 
 @param request A container for the necessary parameters to execute the TransferDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsTransferDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorDomainLimitExceeded`, `AWSroute53domainsErrorOperationLimitExceeded`.
 
 @see AWSroute53domainsTransferDomainRequest
 @see AWSroute53domainsTransferDomainResponse
 */
- (AWSTask<AWSroute53domainsTransferDomainResponse *> *)transferDomain:(AWSroute53domainsTransferDomainRequest *)request;

/**
 <p>Transfers a domain from another registrar to Amazon Route 53. When the transfer is complete, the domain is registered either with Amazon Registrar (for .com, .net, and .org domains) or with our registrar associate, Gandi (for all other TLDs).</p><p>For more information about transferring domains, see the following topics:</p><ul><li><p>For transfer requirements, a detailed procedure, and information about viewing the status of a domain that you're transferring to Route 53, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-to-route-53.html">Transferring Registration for a Domain to Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p></li><li><p>For information about how to transfer a domain from one AWS account to another, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>. </p></li><li><p>For information about how to transfer a domain to another domain registrar, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-from-route-53.html">Transferring a Domain from Amazon Route 53 to Another Registrar</a> in the <i>Amazon Route 53 Developer Guide</i>.</p></li></ul><p>If the registrar for your domain is also the DNS service provider for the domain, we highly recommend that you transfer your DNS service to Route 53 or to another DNS service provider before you transfer your registration. Some registrars provide free DNS service when you purchase a domain registration. When you transfer the registration, the previous registrar will not renew your domain registration and could end your DNS service at any time.</p><important><p>If the registrar for your domain is also the DNS service provider for the domain and you don't transfer DNS service to another provider, your website, email, and the web applications associated with the domain might become unavailable.</p></important><p>If the transfer is successful, this method returns an operation ID that you can use to track the progress and completion of the action. If the transfer doesn't complete successfully, the domain registrant will be notified by email.</p>
 
 @param request A container for the necessary parameters to execute the TransferDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorUnsupportedTLD`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorDomainLimitExceeded`, `AWSroute53domainsErrorOperationLimitExceeded`.
 
 @see AWSroute53domainsTransferDomainRequest
 @see AWSroute53domainsTransferDomainResponse
 */
- (void)transferDomain:(AWSroute53domainsTransferDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsTransferDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Transfers a domain from the current AWS account to another AWS account. Note the following:</p><ul><li><p>The AWS account that you're transferring the domain to must accept the transfer. If the other account doesn't accept the transfer within 3 days, we cancel the transfer. See <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html">AcceptDomainTransferFromAnotherAwsAccount</a>. </p></li><li><p>You can cancel the transfer before the other account accepts it. See <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_CancelDomainTransferToAnotherAwsAccount.html">CancelDomainTransferToAnotherAwsAccount</a>. </p></li><li><p>The other account can reject the transfer. See <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_RejectDomainTransferFromAnotherAwsAccount.html">RejectDomainTransferFromAnotherAwsAccount</a>. </p></li></ul><important><p>When you transfer a domain from one AWS account to another, Route 53 doesn't transfer the hosted zone that is associated with the domain. DNS resolution isn't affected if the domain and the hosted zone are owned by separate accounts, so transferring the hosted zone is optional. For information about transferring the hosted zone to another AWS account, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-migrating.html">Migrating a Hosted Zone to a Different AWS Account</a> in the <i>Amazon Route 53 Developer Guide</i>.</p></important><p>Use either <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a> or <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> to determine whether the operation succeeded. <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>
 
 @param request A container for the necessary parameters to execute the TransferDomainToAnotherAwsAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsTransferDomainToAnotherAwsAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorDuplicateRequest`.
 
 @see AWSroute53domainsTransferDomainToAnotherAwsAccountRequest
 @see AWSroute53domainsTransferDomainToAnotherAwsAccountResponse
 */
- (AWSTask<AWSroute53domainsTransferDomainToAnotherAwsAccountResponse *> *)transferDomainToAnotherAwsAccount:(AWSroute53domainsTransferDomainToAnotherAwsAccountRequest *)request;

/**
 <p>Transfers a domain from the current AWS account to another AWS account. Note the following:</p><ul><li><p>The AWS account that you're transferring the domain to must accept the transfer. If the other account doesn't accept the transfer within 3 days, we cancel the transfer. See <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html">AcceptDomainTransferFromAnotherAwsAccount</a>. </p></li><li><p>You can cancel the transfer before the other account accepts it. See <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_CancelDomainTransferToAnotherAwsAccount.html">CancelDomainTransferToAnotherAwsAccount</a>. </p></li><li><p>The other account can reject the transfer. See <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_RejectDomainTransferFromAnotherAwsAccount.html">RejectDomainTransferFromAnotherAwsAccount</a>. </p></li></ul><important><p>When you transfer a domain from one AWS account to another, Route 53 doesn't transfer the hosted zone that is associated with the domain. DNS resolution isn't affected if the domain and the hosted zone are owned by separate accounts, so transferring the hosted zone is optional. For information about transferring the hosted zone to another AWS account, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-migrating.html">Migrating a Hosted Zone to a Different AWS Account</a> in the <i>Amazon Route 53 Developer Guide</i>.</p></important><p>Use either <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a> or <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> to determine whether the operation succeeded. <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>
 
 @param request A container for the necessary parameters to execute the TransferDomainToAnotherAwsAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorDuplicateRequest`.
 
 @see AWSroute53domainsTransferDomainToAnotherAwsAccountRequest
 @see AWSroute53domainsTransferDomainToAnotherAwsAccountResponse
 */
- (void)transferDomainToAnotherAwsAccount:(AWSroute53domainsTransferDomainToAnotherAwsAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsTransferDomainToAnotherAwsAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation updates the contact information for a particular domain. You must specify information for at least one contact: registrant, administrator, or technical.</p><p>If the update is successful, this method returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainContact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsUpdateDomainContactResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsUpdateDomainContactRequest
 @see AWSroute53domainsUpdateDomainContactResponse
 */
- (AWSTask<AWSroute53domainsUpdateDomainContactResponse *> *)updateDomainContact:(AWSroute53domainsUpdateDomainContactRequest *)request;

/**
 <p>This operation updates the contact information for a particular domain. You must specify information for at least one contact: registrant, administrator, or technical.</p><p>If the update is successful, this method returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainContact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsUpdateDomainContactRequest
 @see AWSroute53domainsUpdateDomainContactResponse
 */
- (void)updateDomainContact:(AWSroute53domainsUpdateDomainContactRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsUpdateDomainContactResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation updates the specified domain contact's privacy setting. When privacy protection is enabled, contact information such as email address is replaced either with contact information for Amazon Registrar (for .com, .net, and .org domains) or with contact information for our registrar associate, Gandi.</p><p>This operation affects only the contact information for the specified contact type (registrant, administrator, or tech). If the request succeeds, Amazon Route 53 returns an operation ID that you can use with <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> to track the progress and completion of the action. If the request doesn't complete successfully, the domain registrant will be notified by email.</p><important><p>By disabling the privacy service via API, you consent to the publication of the contact information provided for this domain via the public WHOIS database. You certify that you are the registrant of this domain name and have the authority to make this decision. You may withdraw your consent at any time by enabling privacy protection using either <code>UpdateDomainContactPrivacy</code> or the Route 53 console. Enabling privacy protection removes the contact information provided for this domain from the WHOIS database. For more information on our privacy practices, see <a href="https://aws.amazon.com/privacy/">https://aws.amazon.com/privacy/</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateDomainContactPrivacy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsUpdateDomainContactPrivacyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsUpdateDomainContactPrivacyRequest
 @see AWSroute53domainsUpdateDomainContactPrivacyResponse
 */
- (AWSTask<AWSroute53domainsUpdateDomainContactPrivacyResponse *> *)updateDomainContactPrivacy:(AWSroute53domainsUpdateDomainContactPrivacyRequest *)request;

/**
 <p>This operation updates the specified domain contact's privacy setting. When privacy protection is enabled, contact information such as email address is replaced either with contact information for Amazon Registrar (for .com, .net, and .org domains) or with contact information for our registrar associate, Gandi.</p><p>This operation affects only the contact information for the specified contact type (registrant, administrator, or tech). If the request succeeds, Amazon Route 53 returns an operation ID that you can use with <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> to track the progress and completion of the action. If the request doesn't complete successfully, the domain registrant will be notified by email.</p><important><p>By disabling the privacy service via API, you consent to the publication of the contact information provided for this domain via the public WHOIS database. You certify that you are the registrant of this domain name and have the authority to make this decision. You may withdraw your consent at any time by enabling privacy protection using either <code>UpdateDomainContactPrivacy</code> or the Route 53 console. Enabling privacy protection removes the contact information provided for this domain from the WHOIS database. For more information on our privacy practices, see <a href="https://aws.amazon.com/privacy/">https://aws.amazon.com/privacy/</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateDomainContactPrivacy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsUpdateDomainContactPrivacyRequest
 @see AWSroute53domainsUpdateDomainContactPrivacyResponse
 */
- (void)updateDomainContactPrivacy:(AWSroute53domainsUpdateDomainContactPrivacyRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsUpdateDomainContactPrivacyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation replaces the current set of name servers for the domain with the specified set of name servers. If you use Amazon Route 53 as your DNS service, specify the four name servers in the delegation set for the hosted zone for the domain.</p><p>If successful, this operation returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainNameservers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsUpdateDomainNameserversResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsUpdateDomainNameserversRequest
 @see AWSroute53domainsUpdateDomainNameserversResponse
 */
- (AWSTask<AWSroute53domainsUpdateDomainNameserversResponse *> *)updateDomainNameservers:(AWSroute53domainsUpdateDomainNameserversRequest *)request;

/**
 <p>This operation replaces the current set of name servers for the domain with the specified set of name servers. If you use Amazon Route 53 as your DNS service, specify the four name servers in the delegation set for the hosted zone for the domain.</p><p>If successful, this operation returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainNameservers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorDuplicateRequest`, `AWSroute53domainsErrorTLDRulesViolation`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsUpdateDomainNameserversRequest
 @see AWSroute53domainsUpdateDomainNameserversResponse
 */
- (void)updateDomainNameservers:(AWSroute53domainsUpdateDomainNameserversRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsUpdateDomainNameserversResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation adds or updates tags for a specified domain.</p><p>All tag operations are eventually consistent; subsequent operations might not immediately represent all issued operations.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTagsForDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsUpdateTagsForDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsUpdateTagsForDomainRequest
 @see AWSroute53domainsUpdateTagsForDomainResponse
 */
- (AWSTask<AWSroute53domainsUpdateTagsForDomainResponse *> *)updateTagsForDomain:(AWSroute53domainsUpdateTagsForDomainRequest *)request;

/**
 <p>This operation adds or updates tags for a specified domain.</p><p>All tag operations are eventually consistent; subsequent operations might not immediately represent all issued operations.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTagsForDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`, `AWSroute53domainsErrorOperationLimitExceeded`, `AWSroute53domainsErrorUnsupportedTLD`.
 
 @see AWSroute53domainsUpdateTagsForDomainRequest
 @see AWSroute53domainsUpdateTagsForDomainResponse
 */
- (void)updateTagsForDomain:(AWSroute53domainsUpdateTagsForDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsUpdateTagsForDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all the domain-related billing records for the current AWS account for a specified period</p>
 
 @param request A container for the necessary parameters to execute the ViewBilling service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSroute53domainsViewBillingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`.
 
 @see AWSroute53domainsViewBillingRequest
 @see AWSroute53domainsViewBillingResponse
 */
- (AWSTask<AWSroute53domainsViewBillingResponse *> *)viewBilling:(AWSroute53domainsViewBillingRequest *)request;

/**
 <p>Returns all the domain-related billing records for the current AWS account for a specified period</p>
 
 @param request A container for the necessary parameters to execute the ViewBilling service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSroute53domainsErrorDomain` domain and the following error code: `AWSroute53domainsErrorInvalidInput`.
 
 @see AWSroute53domainsViewBillingRequest
 @see AWSroute53domainsViewBillingResponse
 */
- (void)viewBilling:(AWSroute53domainsViewBillingRequest *)request completionHandler:(void (^ _Nullable)(AWSroute53domainsViewBillingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
