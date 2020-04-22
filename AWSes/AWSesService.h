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
#import "AWSesModel.h"
#import "AWSesResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSes
FOUNDATION_EXPORT NSString *const AWSesSDKVersion;

/**
 <fullname>Amazon Elasticsearch Configuration Service</fullname><p>Use the Amazon Elasticsearch Configuration API to create, configure, and manage Elasticsearch domains.</p><p>For sample code that uses the Configuration API, see the <a href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-configuration-samples.html">Amazon Elasticsearch Service Developer Guide</a>. The guide also contains <a href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-request-signing.html">sample code for sending signed HTTP requests to the Elasticsearch APIs</a>.</p><p>The endpoint for configuration service requests is region-specific: es.<i>region</i>.amazonaws.com. For example, es.us-east-1.amazonaws.com. For a current list of supported regions and endpoints, see <a href="http://docs.aws.amazon.com/general/latest/gr/rande.html#elasticsearch-service-regions" target="_blank">Regions and Endpoints</a>.</p>
 */
@interface AWSes : AWSService

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

     let es = AWSes.default()

 *Objective-C*

     AWSes *es = [AWSes defaultes];

 @return The default service client.
 */
+ (instancetype)defaultes;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSes.register(with: configuration!, forKey: "USWest2es")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSes registeresWithConfiguration:configuration forKey:@"USWest2es"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let es = AWSes(forKey: "USWest2es")

 *Objective-C*

     AWSes *es = [AWSes esForKey:@"USWest2es"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registeresWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registeresWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSes.register(with: configuration!, forKey: "USWest2es")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSes registeresWithConfiguration:configuration forKey:@"USWest2es"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let es = AWSes(forKey: "USWest2es")

 *Objective-C*

     AWSes *es = [AWSes esForKey:@"USWest2es"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)esForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeesForKey:(NSString *)key;

/**
 <p>Attaches tags to an existing Elasticsearch domain. Tags are a set of case-sensitive key value pairs. An Elasticsearch domain may have up to 10 tags. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-awsresorcetagging" target="_blank"> Tagging Amazon Elasticsearch Service Domains for more information.</a></p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorLimitExceeded`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesAddTagsRequest
 */
- (AWSTask *)addTags:(AWSesAddTagsRequest *)request;

/**
 <p>Attaches tags to an existing Elasticsearch domain. Tags are a set of case-sensitive key value pairs. An Elasticsearch domain may have up to 10 tags. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-awsresorcetagging" target="_blank"> Tagging Amazon Elasticsearch Service Domains for more information.</a></p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorLimitExceeded`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesAddTagsRequest
 */
- (void)addTags:(AWSesAddTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates a package with an Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesAssociatePackageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`, `AWSesErrorConflict`.
 
 @see AWSesAssociatePackageRequest
 @see AWSesAssociatePackageResponse
 */
- (AWSTask<AWSesAssociatePackageResponse *> *)associatePackage:(AWSesAssociatePackageRequest *)request;

/**
 <p>Associates a package with an Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`, `AWSesErrorConflict`.
 
 @see AWSesAssociatePackageRequest
 @see AWSesAssociatePackageResponse
 */
- (void)associatePackage:(AWSesAssociatePackageRequest *)request completionHandler:(void (^ _Nullable)(AWSesAssociatePackageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels a scheduled service software update for an Amazon ES domain. You can only perform this operation before the <code>AutomatedUpdateDate</code> and when the <code>UpdateStatus</code> is in the <code>PENDING_UPDATE</code> state.</p>
 
 @param request A container for the necessary parameters to execute the CancelElasticsearchServiceSoftwareUpdate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesCancelElasticsearchServiceSoftwareUpdateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesCancelElasticsearchServiceSoftwareUpdateRequest
 @see AWSesCancelElasticsearchServiceSoftwareUpdateResponse
 */
- (AWSTask<AWSesCancelElasticsearchServiceSoftwareUpdateResponse *> *)cancelElasticsearchServiceSoftwareUpdate:(AWSesCancelElasticsearchServiceSoftwareUpdateRequest *)request;

/**
 <p>Cancels a scheduled service software update for an Amazon ES domain. You can only perform this operation before the <code>AutomatedUpdateDate</code> and when the <code>UpdateStatus</code> is in the <code>PENDING_UPDATE</code> state.</p>
 
 @param request A container for the necessary parameters to execute the CancelElasticsearchServiceSoftwareUpdate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesCancelElasticsearchServiceSoftwareUpdateRequest
 @see AWSesCancelElasticsearchServiceSoftwareUpdateResponse
 */
- (void)cancelElasticsearchServiceSoftwareUpdate:(AWSesCancelElasticsearchServiceSoftwareUpdateRequest *)request completionHandler:(void (^ _Nullable)(AWSesCancelElasticsearchServiceSoftwareUpdateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Elasticsearch domain. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains" target="_blank">Creating Elasticsearch Domains</a> in the <i>Amazon Elasticsearch Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateElasticsearchDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesCreateElasticsearchDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorDisabledOperation`, `AWSesErrorInternal`, `AWSesErrorInvalidType`, `AWSesErrorLimitExceeded`, `AWSesErrorResourceAlreadyExists`, `AWSesErrorValidation`.
 
 @see AWSesCreateElasticsearchDomainRequest
 @see AWSesCreateElasticsearchDomainResponse
 */
- (AWSTask<AWSesCreateElasticsearchDomainResponse *> *)createElasticsearchDomain:(AWSesCreateElasticsearchDomainRequest *)request;

/**
 <p>Creates a new Elasticsearch domain. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains" target="_blank">Creating Elasticsearch Domains</a> in the <i>Amazon Elasticsearch Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateElasticsearchDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorDisabledOperation`, `AWSesErrorInternal`, `AWSesErrorInvalidType`, `AWSesErrorLimitExceeded`, `AWSesErrorResourceAlreadyExists`, `AWSesErrorValidation`.
 
 @see AWSesCreateElasticsearchDomainRequest
 @see AWSesCreateElasticsearchDomainResponse
 */
- (void)createElasticsearchDomain:(AWSesCreateElasticsearchDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSesCreateElasticsearchDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a package for use with Amazon ES domains.</p>
 
 @param request A container for the necessary parameters to execute the CreatePackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesCreatePackageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorLimitExceeded`, `AWSesErrorInvalidType`, `AWSesErrorResourceAlreadyExists`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`.
 
 @see AWSesCreatePackageRequest
 @see AWSesCreatePackageResponse
 */
- (AWSTask<AWSesCreatePackageResponse *> *)createPackage:(AWSesCreatePackageRequest *)request;

/**
 <p>Create a package for use with Amazon ES domains.</p>
 
 @param request A container for the necessary parameters to execute the CreatePackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorLimitExceeded`, `AWSesErrorInvalidType`, `AWSesErrorResourceAlreadyExists`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`.
 
 @see AWSesCreatePackageRequest
 @see AWSesCreatePackageResponse
 */
- (void)createPackage:(AWSesCreatePackageRequest *)request completionHandler:(void (^ _Nullable)(AWSesCreatePackageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Permanently deletes the specified Elasticsearch domain and all of its data. Once a domain is deleted, it cannot be recovered.</p>
 
 @param request A container for the necessary parameters to execute the DeleteElasticsearchDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesDeleteElasticsearchDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesDeleteElasticsearchDomainRequest
 @see AWSesDeleteElasticsearchDomainResponse
 */
- (AWSTask<AWSesDeleteElasticsearchDomainResponse *> *)deleteElasticsearchDomain:(AWSesDeleteElasticsearchDomainRequest *)request;

/**
 <p>Permanently deletes the specified Elasticsearch domain and all of its data. Once a domain is deleted, it cannot be recovered.</p>
 
 @param request A container for the necessary parameters to execute the DeleteElasticsearchDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesDeleteElasticsearchDomainRequest
 @see AWSesDeleteElasticsearchDomainResponse
 */
- (void)deleteElasticsearchDomain:(AWSesDeleteElasticsearchDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSesDeleteElasticsearchDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the service-linked role that Elasticsearch Service uses to manage and maintain VPC domains. Role deletion will fail if any existing VPC domains use the role. You must delete any such Elasticsearch domains before deleting the role. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-enabling-slr" target="_blank">Deleting Elasticsearch Service Role</a> in <i>VPC Endpoints for Amazon Elasticsearch Service Domains</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteElasticsearchServiceRole service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorValidation`.
 
 @see AWSRequest
 */
- (AWSTask *)deleteElasticsearchServiceRole:(AWSRequest *)request;

/**
 <p>Deletes the service-linked role that Elasticsearch Service uses to manage and maintain VPC domains. Role deletion will fail if any existing VPC domains use the role. You must delete any such Elasticsearch domains before deleting the role. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-enabling-slr" target="_blank">Deleting Elasticsearch Service Role</a> in <i>VPC Endpoints for Amazon Elasticsearch Service Domains</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteElasticsearchServiceRole service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorValidation`.
 
 @see AWSRequest
 */
- (void)deleteElasticsearchServiceRole:(AWSRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete the package.</p>
 
 @param request A container for the necessary parameters to execute the DeletePackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesDeletePackageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`, `AWSesErrorConflict`.
 
 @see AWSesDeletePackageRequest
 @see AWSesDeletePackageResponse
 */
- (AWSTask<AWSesDeletePackageResponse *> *)deletePackage:(AWSesDeletePackageRequest *)request;

/**
 <p>Delete the package.</p>
 
 @param request A container for the necessary parameters to execute the DeletePackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`, `AWSesErrorConflict`.
 
 @see AWSesDeletePackageRequest
 @see AWSesDeletePackageResponse
 */
- (void)deletePackage:(AWSesDeletePackageRequest *)request completionHandler:(void (^ _Nullable)(AWSesDeletePackageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns domain configuration information about the specified Elasticsearch domain, including the domain ID, domain endpoint, and domain ARN.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesDescribeElasticsearchDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesDescribeElasticsearchDomainRequest
 @see AWSesDescribeElasticsearchDomainResponse
 */
- (AWSTask<AWSesDescribeElasticsearchDomainResponse *> *)describeElasticsearchDomain:(AWSesDescribeElasticsearchDomainRequest *)request;

/**
 <p>Returns domain configuration information about the specified Elasticsearch domain, including the domain ID, domain endpoint, and domain ARN.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesDescribeElasticsearchDomainRequest
 @see AWSesDescribeElasticsearchDomainResponse
 */
- (void)describeElasticsearchDomain:(AWSesDescribeElasticsearchDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSesDescribeElasticsearchDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides cluster configuration information about the specified Elasticsearch domain, such as the state, creation date, update version, and update date for cluster options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomainConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesDescribeElasticsearchDomainConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesDescribeElasticsearchDomainConfigRequest
 @see AWSesDescribeElasticsearchDomainConfigResponse
 */
- (AWSTask<AWSesDescribeElasticsearchDomainConfigResponse *> *)describeElasticsearchDomainConfig:(AWSesDescribeElasticsearchDomainConfigRequest *)request;

/**
 <p>Provides cluster configuration information about the specified Elasticsearch domain, such as the state, creation date, update version, and update date for cluster options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomainConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesDescribeElasticsearchDomainConfigRequest
 @see AWSesDescribeElasticsearchDomainConfigResponse
 */
- (void)describeElasticsearchDomainConfig:(AWSesDescribeElasticsearchDomainConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSesDescribeElasticsearchDomainConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns domain configuration information about the specified Elasticsearch domains, including the domain ID, domain endpoint, and domain ARN.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomains service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesDescribeElasticsearchDomainsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorValidation`.
 
 @see AWSesDescribeElasticsearchDomainsRequest
 @see AWSesDescribeElasticsearchDomainsResponse
 */
- (AWSTask<AWSesDescribeElasticsearchDomainsResponse *> *)describeElasticsearchDomains:(AWSesDescribeElasticsearchDomainsRequest *)request;

/**
 <p>Returns domain configuration information about the specified Elasticsearch domains, including the domain ID, domain endpoint, and domain ARN.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomains service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorValidation`.
 
 @see AWSesDescribeElasticsearchDomainsRequest
 @see AWSesDescribeElasticsearchDomainsResponse
 */
- (void)describeElasticsearchDomains:(AWSesDescribeElasticsearchDomainsRequest *)request completionHandler:(void (^ _Nullable)(AWSesDescribeElasticsearchDomainsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Describe Elasticsearch Limits for a given InstanceType and ElasticsearchVersion. When modifying existing Domain, specify the <code><a>DomainName</a></code> to know what Limits are supported for modifying. </p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchInstanceTypeLimits service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesDescribeElasticsearchInstanceTypeLimitsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorInvalidType`, `AWSesErrorLimitExceeded`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesDescribeElasticsearchInstanceTypeLimitsRequest
 @see AWSesDescribeElasticsearchInstanceTypeLimitsResponse
 */
- (AWSTask<AWSesDescribeElasticsearchInstanceTypeLimitsResponse *> *)describeElasticsearchInstanceTypeLimits:(AWSesDescribeElasticsearchInstanceTypeLimitsRequest *)request;

/**
 <p> Describe Elasticsearch Limits for a given InstanceType and ElasticsearchVersion. When modifying existing Domain, specify the <code><a>DomainName</a></code> to know what Limits are supported for modifying. </p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchInstanceTypeLimits service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorInvalidType`, `AWSesErrorLimitExceeded`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesDescribeElasticsearchInstanceTypeLimitsRequest
 @see AWSesDescribeElasticsearchInstanceTypeLimitsResponse
 */
- (void)describeElasticsearchInstanceTypeLimits:(AWSesDescribeElasticsearchInstanceTypeLimitsRequest *)request completionHandler:(void (^ _Nullable)(AWSesDescribeElasticsearchInstanceTypeLimitsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes all packages available to Amazon ES. Includes options for filtering, limiting the number of results, and pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribePackages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesDescribePackagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`.
 
 @see AWSesDescribePackagesRequest
 @see AWSesDescribePackagesResponse
 */
- (AWSTask<AWSesDescribePackagesResponse *> *)describePackages:(AWSesDescribePackagesRequest *)request;

/**
 <p>Describes all packages available to Amazon ES. Includes options for filtering, limiting the number of results, and pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribePackages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`.
 
 @see AWSesDescribePackagesRequest
 @see AWSesDescribePackagesResponse
 */
- (void)describePackages:(AWSesDescribePackagesRequest *)request completionHandler:(void (^ _Nullable)(AWSesDescribePackagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists available reserved Elasticsearch instance offerings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedElasticsearchInstanceOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesDescribeReservedElasticsearchInstanceOfferingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorResourceNotFound`, `AWSesErrorValidation`, `AWSesErrorDisabledOperation`, `AWSesErrorInternal`.
 
 @see AWSesDescribeReservedElasticsearchInstanceOfferingsRequest
 @see AWSesDescribeReservedElasticsearchInstanceOfferingsResponse
 */
- (AWSTask<AWSesDescribeReservedElasticsearchInstanceOfferingsResponse *> *)describeReservedElasticsearchInstanceOfferings:(AWSesDescribeReservedElasticsearchInstanceOfferingsRequest *)request;

/**
 <p>Lists available reserved Elasticsearch instance offerings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedElasticsearchInstanceOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorResourceNotFound`, `AWSesErrorValidation`, `AWSesErrorDisabledOperation`, `AWSesErrorInternal`.
 
 @see AWSesDescribeReservedElasticsearchInstanceOfferingsRequest
 @see AWSesDescribeReservedElasticsearchInstanceOfferingsResponse
 */
- (void)describeReservedElasticsearchInstanceOfferings:(AWSesDescribeReservedElasticsearchInstanceOfferingsRequest *)request completionHandler:(void (^ _Nullable)(AWSesDescribeReservedElasticsearchInstanceOfferingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about reserved Elasticsearch instances for this account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedElasticsearchInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesDescribeReservedElasticsearchInstancesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorResourceNotFound`, `AWSesErrorInternal`, `AWSesErrorValidation`, `AWSesErrorDisabledOperation`.
 
 @see AWSesDescribeReservedElasticsearchInstancesRequest
 @see AWSesDescribeReservedElasticsearchInstancesResponse
 */
- (AWSTask<AWSesDescribeReservedElasticsearchInstancesResponse *> *)describeReservedElasticsearchInstances:(AWSesDescribeReservedElasticsearchInstancesRequest *)request;

/**
 <p>Returns information about reserved Elasticsearch instances for this account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedElasticsearchInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorResourceNotFound`, `AWSesErrorInternal`, `AWSesErrorValidation`, `AWSesErrorDisabledOperation`.
 
 @see AWSesDescribeReservedElasticsearchInstancesRequest
 @see AWSesDescribeReservedElasticsearchInstancesResponse
 */
- (void)describeReservedElasticsearchInstances:(AWSesDescribeReservedElasticsearchInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSesDescribeReservedElasticsearchInstancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Dissociates a package from the Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the DissociatePackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesDissociatePackageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`, `AWSesErrorConflict`.
 
 @see AWSesDissociatePackageRequest
 @see AWSesDissociatePackageResponse
 */
- (AWSTask<AWSesDissociatePackageResponse *> *)dissociatePackage:(AWSesDissociatePackageRequest *)request;

/**
 <p>Dissociates a package from the Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the DissociatePackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`, `AWSesErrorConflict`.
 
 @see AWSesDissociatePackageRequest
 @see AWSesDissociatePackageResponse
 */
- (void)dissociatePackage:(AWSesDissociatePackageRequest *)request completionHandler:(void (^ _Nullable)(AWSesDissociatePackageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of upgrade compatible Elastisearch versions. You can optionally pass a <code><a>DomainName</a></code> to get all upgrade compatible Elasticsearch versions for that specific domain. </p>
 
 @param request A container for the necessary parameters to execute the GetCompatibleElasticsearchVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesGetCompatibleElasticsearchVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorResourceNotFound`, `AWSesErrorDisabledOperation`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesGetCompatibleElasticsearchVersionsRequest
 @see AWSesGetCompatibleElasticsearchVersionsResponse
 */
- (AWSTask<AWSesGetCompatibleElasticsearchVersionsResponse *> *)getCompatibleElasticsearchVersions:(AWSesGetCompatibleElasticsearchVersionsRequest *)request;

/**
 <p> Returns a list of upgrade compatible Elastisearch versions. You can optionally pass a <code><a>DomainName</a></code> to get all upgrade compatible Elasticsearch versions for that specific domain. </p>
 
 @param request A container for the necessary parameters to execute the GetCompatibleElasticsearchVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorResourceNotFound`, `AWSesErrorDisabledOperation`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesGetCompatibleElasticsearchVersionsRequest
 @see AWSesGetCompatibleElasticsearchVersionsResponse
 */
- (void)getCompatibleElasticsearchVersions:(AWSesGetCompatibleElasticsearchVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSesGetCompatibleElasticsearchVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the complete history of the last 10 upgrades that were performed on the domain.</p>
 
 @param request A container for the necessary parameters to execute the GetUpgradeHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesGetUpgradeHistoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorResourceNotFound`, `AWSesErrorDisabledOperation`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesGetUpgradeHistoryRequest
 @see AWSesGetUpgradeHistoryResponse
 */
- (AWSTask<AWSesGetUpgradeHistoryResponse *> *)getUpgradeHistory:(AWSesGetUpgradeHistoryRequest *)request;

/**
 <p>Retrieves the complete history of the last 10 upgrades that were performed on the domain.</p>
 
 @param request A container for the necessary parameters to execute the GetUpgradeHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorResourceNotFound`, `AWSesErrorDisabledOperation`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesGetUpgradeHistoryRequest
 @see AWSesGetUpgradeHistoryResponse
 */
- (void)getUpgradeHistory:(AWSesGetUpgradeHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSesGetUpgradeHistoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the latest status of the last upgrade or upgrade eligibility check that was performed on the domain.</p>
 
 @param request A container for the necessary parameters to execute the GetUpgradeStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesGetUpgradeStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorResourceNotFound`, `AWSesErrorDisabledOperation`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesGetUpgradeStatusRequest
 @see AWSesGetUpgradeStatusResponse
 */
- (AWSTask<AWSesGetUpgradeStatusResponse *> *)getUpgradeStatus:(AWSesGetUpgradeStatusRequest *)request;

/**
 <p>Retrieves the latest status of the last upgrade or upgrade eligibility check that was performed on the domain.</p>
 
 @param request A container for the necessary parameters to execute the GetUpgradeStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorResourceNotFound`, `AWSesErrorDisabledOperation`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesGetUpgradeStatusRequest
 @see AWSesGetUpgradeStatusResponse
 */
- (void)getUpgradeStatus:(AWSesGetUpgradeStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSesGetUpgradeStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the name of all Elasticsearch domains owned by the current user's account. </p>
 
 @param request A container for the necessary parameters to execute the ListDomainNames service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesListDomainNamesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorValidation`.
 
 @see AWSRequest
 @see AWSesListDomainNamesResponse
 */
- (AWSTask<AWSesListDomainNamesResponse *> *)listDomainNames:(AWSRequest *)request;

/**
 <p>Returns the name of all Elasticsearch domains owned by the current user's account. </p>
 
 @param request A container for the necessary parameters to execute the ListDomainNames service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorValidation`.
 
 @see AWSRequest
 @see AWSesListDomainNamesResponse
 */
- (void)listDomainNames:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSesListDomainNamesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all Amazon ES domains associated with the package.</p>
 
 @param request A container for the necessary parameters to execute the ListDomainsForPackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesListDomainsForPackageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`.
 
 @see AWSesListDomainsForPackageRequest
 @see AWSesListDomainsForPackageResponse
 */
- (AWSTask<AWSesListDomainsForPackageResponse *> *)listDomainsForPackage:(AWSesListDomainsForPackageRequest *)request;

/**
 <p>Lists all Amazon ES domains associated with the package.</p>
 
 @param request A container for the necessary parameters to execute the ListDomainsForPackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`.
 
 @see AWSesListDomainsForPackageRequest
 @see AWSesListDomainsForPackageResponse
 */
- (void)listDomainsForPackage:(AWSesListDomainsForPackageRequest *)request completionHandler:(void (^ _Nullable)(AWSesListDomainsForPackageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all Elasticsearch instance types that are supported for given ElasticsearchVersion</p>
 
 @param request A container for the necessary parameters to execute the ListElasticsearchInstanceTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesListElasticsearchInstanceTypesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesListElasticsearchInstanceTypesRequest
 @see AWSesListElasticsearchInstanceTypesResponse
 */
- (AWSTask<AWSesListElasticsearchInstanceTypesResponse *> *)listElasticsearchInstanceTypes:(AWSesListElasticsearchInstanceTypesRequest *)request;

/**
 <p>List all Elasticsearch instance types that are supported for given ElasticsearchVersion</p>
 
 @param request A container for the necessary parameters to execute the ListElasticsearchInstanceTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesListElasticsearchInstanceTypesRequest
 @see AWSesListElasticsearchInstanceTypesResponse
 */
- (void)listElasticsearchInstanceTypes:(AWSesListElasticsearchInstanceTypesRequest *)request completionHandler:(void (^ _Nullable)(AWSesListElasticsearchInstanceTypesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all supported Elasticsearch versions</p>
 
 @param request A container for the necessary parameters to execute the ListElasticsearchVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesListElasticsearchVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesListElasticsearchVersionsRequest
 @see AWSesListElasticsearchVersionsResponse
 */
- (AWSTask<AWSesListElasticsearchVersionsResponse *> *)listElasticsearchVersions:(AWSesListElasticsearchVersionsRequest *)request;

/**
 <p>List all supported Elasticsearch versions</p>
 
 @param request A container for the necessary parameters to execute the ListElasticsearchVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesListElasticsearchVersionsRequest
 @see AWSesListElasticsearchVersionsResponse
 */
- (void)listElasticsearchVersions:(AWSesListElasticsearchVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSesListElasticsearchVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all packages associated with the Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the ListPackagesForDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesListPackagesForDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`.
 
 @see AWSesListPackagesForDomainRequest
 @see AWSesListPackagesForDomainResponse
 */
- (AWSTask<AWSesListPackagesForDomainResponse *> *)listPackagesForDomain:(AWSesListPackagesForDomainRequest *)request;

/**
 <p>Lists all packages associated with the Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the ListPackagesForDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorAccessDenied`, `AWSesErrorValidation`.
 
 @see AWSesListPackagesForDomainRequest
 @see AWSesListPackagesForDomainResponse
 */
- (void)listPackagesForDomain:(AWSesListPackagesForDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSesListPackagesForDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all tags for the given Elasticsearch domain.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesListTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesListTagsRequest
 @see AWSesListTagsResponse
 */
- (AWSTask<AWSesListTagsResponse *> *)listTags:(AWSesListTagsRequest *)request;

/**
 <p>Returns all tags for the given Elasticsearch domain.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesListTagsRequest
 @see AWSesListTagsResponse
 */
- (void)listTags:(AWSesListTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSesListTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows you to purchase reserved Elasticsearch instances.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedElasticsearchInstanceOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesPurchaseReservedElasticsearchInstanceOfferingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorResourceNotFound`, `AWSesErrorResourceAlreadyExists`, `AWSesErrorLimitExceeded`, `AWSesErrorDisabledOperation`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesPurchaseReservedElasticsearchInstanceOfferingRequest
 @see AWSesPurchaseReservedElasticsearchInstanceOfferingResponse
 */
- (AWSTask<AWSesPurchaseReservedElasticsearchInstanceOfferingResponse *> *)purchaseReservedElasticsearchInstanceOffering:(AWSesPurchaseReservedElasticsearchInstanceOfferingRequest *)request;

/**
 <p>Allows you to purchase reserved Elasticsearch instances.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedElasticsearchInstanceOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorResourceNotFound`, `AWSesErrorResourceAlreadyExists`, `AWSesErrorLimitExceeded`, `AWSesErrorDisabledOperation`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesPurchaseReservedElasticsearchInstanceOfferingRequest
 @see AWSesPurchaseReservedElasticsearchInstanceOfferingResponse
 */
- (void)purchaseReservedElasticsearchInstanceOffering:(AWSesPurchaseReservedElasticsearchInstanceOfferingRequest *)request completionHandler:(void (^ _Nullable)(AWSesPurchaseReservedElasticsearchInstanceOfferingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified set of tags from the specified Elasticsearch domain.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesRemoveTagsRequest
 */
- (AWSTask *)removeTags:(AWSesRemoveTagsRequest *)request;

/**
 <p>Removes the specified set of tags from the specified Elasticsearch domain.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesRemoveTagsRequest
 */
- (void)removeTags:(AWSesRemoveTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Schedules a service software update for an Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the StartElasticsearchServiceSoftwareUpdate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesStartElasticsearchServiceSoftwareUpdateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesStartElasticsearchServiceSoftwareUpdateRequest
 @see AWSesStartElasticsearchServiceSoftwareUpdateResponse
 */
- (AWSTask<AWSesStartElasticsearchServiceSoftwareUpdateResponse *> *)startElasticsearchServiceSoftwareUpdate:(AWSesStartElasticsearchServiceSoftwareUpdateRequest *)request;

/**
 <p>Schedules a service software update for an Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the StartElasticsearchServiceSoftwareUpdate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesStartElasticsearchServiceSoftwareUpdateRequest
 @see AWSesStartElasticsearchServiceSoftwareUpdateResponse
 */
- (void)startElasticsearchServiceSoftwareUpdate:(AWSesStartElasticsearchServiceSoftwareUpdateRequest *)request completionHandler:(void (^ _Nullable)(AWSesStartElasticsearchServiceSoftwareUpdateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the cluster configuration of the specified Elasticsearch domain, setting as setting the instance type and the number of instances. </p>
 
 @param request A container for the necessary parameters to execute the UpdateElasticsearchDomainConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesUpdateElasticsearchDomainConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorInvalidType`, `AWSesErrorLimitExceeded`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesUpdateElasticsearchDomainConfigRequest
 @see AWSesUpdateElasticsearchDomainConfigResponse
 */
- (AWSTask<AWSesUpdateElasticsearchDomainConfigResponse *> *)updateElasticsearchDomainConfig:(AWSesUpdateElasticsearchDomainConfigRequest *)request;

/**
 <p>Modifies the cluster configuration of the specified Elasticsearch domain, setting as setting the instance type and the number of instances. </p>
 
 @param request A container for the necessary parameters to execute the UpdateElasticsearchDomainConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorInternal`, `AWSesErrorInvalidType`, `AWSesErrorLimitExceeded`, `AWSesErrorResourceNotFound`, `AWSesErrorValidation`.
 
 @see AWSesUpdateElasticsearchDomainConfigRequest
 @see AWSesUpdateElasticsearchDomainConfigResponse
 */
- (void)updateElasticsearchDomainConfig:(AWSesUpdateElasticsearchDomainConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSesUpdateElasticsearchDomainConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows you to either upgrade your domain or perform an Upgrade eligibility check to a compatible Elasticsearch version.</p>
 
 @param request A container for the necessary parameters to execute the UpgradeElasticsearchDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSesUpgradeElasticsearchDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorResourceNotFound`, `AWSesErrorResourceAlreadyExists`, `AWSesErrorDisabledOperation`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesUpgradeElasticsearchDomainRequest
 @see AWSesUpgradeElasticsearchDomainResponse
 */
- (AWSTask<AWSesUpgradeElasticsearchDomainResponse *> *)upgradeElasticsearchDomain:(AWSesUpgradeElasticsearchDomainRequest *)request;

/**
 <p>Allows you to either upgrade your domain or perform an Upgrade eligibility check to a compatible Elasticsearch version.</p>
 
 @param request A container for the necessary parameters to execute the UpgradeElasticsearchDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSesErrorDomain` domain and the following error code: `AWSesErrorBase`, `AWSesErrorResourceNotFound`, `AWSesErrorResourceAlreadyExists`, `AWSesErrorDisabledOperation`, `AWSesErrorValidation`, `AWSesErrorInternal`.
 
 @see AWSesUpgradeElasticsearchDomainRequest
 @see AWSesUpgradeElasticsearchDomainResponse
 */
- (void)upgradeElasticsearchDomain:(AWSesUpgradeElasticsearchDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSesUpgradeElasticsearchDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
