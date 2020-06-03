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
#import "AWSElasticsearchserviceModel.h"
#import "AWSElasticsearchserviceResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSElasticsearchservice
FOUNDATION_EXPORT NSString *const AWSElasticsearchserviceSDKVersion;

/**
 <fullname>Amazon Elasticsearch Configuration Service</fullname><p>Use the Amazon Elasticsearch Configuration API to create, configure, and manage Elasticsearch domains.</p><p>For sample code that uses the Configuration API, see the <a href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-configuration-samples.html">Amazon Elasticsearch Service Developer Guide</a>. The guide also contains <a href="https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-request-signing.html">sample code for sending signed HTTP requests to the Elasticsearch APIs</a>.</p><p>The endpoint for configuration service requests is region-specific: es.<i>region</i>.amazonaws.com. For example, es.us-east-1.amazonaws.com. For a current list of supported regions and endpoints, see <a href="http://docs.aws.amazon.com/general/latest/gr/rande.html#elasticsearch-service-regions" target="_blank">Regions and Endpoints</a>.</p>
 */
@interface AWSElasticsearchservice : AWSService

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

     let Elasticsearchservice = AWSElasticsearchservice.default()

 *Objective-C*

     AWSElasticsearchservice *Elasticsearchservice = [AWSElasticsearchservice defaultElasticsearchservice];

 @return The default service client.
 */
+ (instancetype)defaultElasticsearchservice;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSElasticsearchservice.register(with: configuration!, forKey: "USWest2Elasticsearchservice")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:@"USWest2Elasticsearchservice"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Elasticsearchservice = AWSElasticsearchservice(forKey: "USWest2Elasticsearchservice")

 *Objective-C*

     AWSElasticsearchservice *Elasticsearchservice = [AWSElasticsearchservice ElasticsearchserviceForKey:@"USWest2Elasticsearchservice"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerElasticsearchserviceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerElasticsearchserviceWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSElasticsearchservice.register(with: configuration!, forKey: "USWest2Elasticsearchservice")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:@"USWest2Elasticsearchservice"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Elasticsearchservice = AWSElasticsearchservice(forKey: "USWest2Elasticsearchservice")

 *Objective-C*

     AWSElasticsearchservice *Elasticsearchservice = [AWSElasticsearchservice ElasticsearchserviceForKey:@"USWest2Elasticsearchservice"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ElasticsearchserviceForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeElasticsearchserviceForKey:(NSString *)key;

/**
 <p>Allows the destination domain owner to accept an inbound cross-cluster search connection request.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInboundCrossClusterSearchConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionRequest
 @see AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse
 */
- (AWSTask<AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse *> *)acceptInboundCrossClusterSearchConnection:(AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionRequest *)request;

/**
 <p>Allows the destination domain owner to accept an inbound cross-cluster search connection request.</p>
 
 @param request A container for the necessary parameters to execute the AcceptInboundCrossClusterSearchConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionRequest
 @see AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse
 */
- (void)acceptInboundCrossClusterSearchConnection:(AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches tags to an existing Elasticsearch domain. Tags are a set of case-sensitive key value pairs. An Elasticsearch domain may have up to 10 tags. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-awsresorcetagging" target="_blank"> Tagging Amazon Elasticsearch Service Domains for more information.</a></p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceAddTagsRequest
 */
- (AWSTask *)addTags:(AWSElasticsearchserviceAddTagsRequest *)request;

/**
 <p>Attaches tags to an existing Elasticsearch domain. Tags are a set of case-sensitive key value pairs. An Elasticsearch domain may have up to 10 tags. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-awsresorcetagging" target="_blank"> Tagging Amazon Elasticsearch Service Domains for more information.</a></p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceAddTagsRequest
 */
- (void)addTags:(AWSElasticsearchserviceAddTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates a package with an Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceAssociatePackageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorConflict`.
 
 @see AWSElasticsearchserviceAssociatePackageRequest
 @see AWSElasticsearchserviceAssociatePackageResponse
 */
- (AWSTask<AWSElasticsearchserviceAssociatePackageResponse *> *)associatePackage:(AWSElasticsearchserviceAssociatePackageRequest *)request;

/**
 <p>Associates a package with an Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorConflict`.
 
 @see AWSElasticsearchserviceAssociatePackageRequest
 @see AWSElasticsearchserviceAssociatePackageResponse
 */
- (void)associatePackage:(AWSElasticsearchserviceAssociatePackageRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceAssociatePackageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels a scheduled service software update for an Amazon ES domain. You can only perform this operation before the <code>AutomatedUpdateDate</code> and when the <code>UpdateStatus</code> is in the <code>PENDING_UPDATE</code> state.</p>
 
 @param request A container for the necessary parameters to execute the CancelElasticsearchServiceSoftwareUpdate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateRequest
 @see AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse
 */
- (AWSTask<AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse *> *)cancelElasticsearchServiceSoftwareUpdate:(AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateRequest *)request;

/**
 <p>Cancels a scheduled service software update for an Amazon ES domain. You can only perform this operation before the <code>AutomatedUpdateDate</code> and when the <code>UpdateStatus</code> is in the <code>PENDING_UPDATE</code> state.</p>
 
 @param request A container for the necessary parameters to execute the CancelElasticsearchServiceSoftwareUpdate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateRequest
 @see AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse
 */
- (void)cancelElasticsearchServiceSoftwareUpdate:(AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Elasticsearch domain. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains" target="_blank">Creating Elasticsearch Domains</a> in the <i>Amazon Elasticsearch Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateElasticsearchDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceCreateElasticsearchDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorInvalidType`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorResourceAlreadyExists`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceCreateElasticsearchDomainRequest
 @see AWSElasticsearchserviceCreateElasticsearchDomainResponse
 */
- (AWSTask<AWSElasticsearchserviceCreateElasticsearchDomainResponse *> *)createElasticsearchDomain:(AWSElasticsearchserviceCreateElasticsearchDomainRequest *)request;

/**
 <p>Creates a new Elasticsearch domain. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains" target="_blank">Creating Elasticsearch Domains</a> in the <i>Amazon Elasticsearch Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateElasticsearchDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorInvalidType`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorResourceAlreadyExists`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceCreateElasticsearchDomainRequest
 @see AWSElasticsearchserviceCreateElasticsearchDomainResponse
 */
- (void)createElasticsearchDomain:(AWSElasticsearchserviceCreateElasticsearchDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceCreateElasticsearchDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new cross-cluster search connection from a source domain to a destination domain.</p>
 
 @param request A container for the necessary parameters to execute the CreateOutboundCrossClusterSearchConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceAlreadyExists`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionRequest
 @see AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse
 */
- (AWSTask<AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse *> *)createOutboundCrossClusterSearchConnection:(AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionRequest *)request;

/**
 <p>Creates a new cross-cluster search connection from a source domain to a destination domain.</p>
 
 @param request A container for the necessary parameters to execute the CreateOutboundCrossClusterSearchConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceAlreadyExists`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionRequest
 @see AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse
 */
- (void)createOutboundCrossClusterSearchConnection:(AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a package for use with Amazon ES domains.</p>
 
 @param request A container for the necessary parameters to execute the CreatePackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceCreatePackageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorInvalidType`, `AWSElasticsearchserviceErrorResourceAlreadyExists`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceCreatePackageRequest
 @see AWSElasticsearchserviceCreatePackageResponse
 */
- (AWSTask<AWSElasticsearchserviceCreatePackageResponse *> *)createPackage:(AWSElasticsearchserviceCreatePackageRequest *)request;

/**
 <p>Create a package for use with Amazon ES domains.</p>
 
 @param request A container for the necessary parameters to execute the CreatePackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorInvalidType`, `AWSElasticsearchserviceErrorResourceAlreadyExists`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceCreatePackageRequest
 @see AWSElasticsearchserviceCreatePackageResponse
 */
- (void)createPackage:(AWSElasticsearchserviceCreatePackageRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceCreatePackageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Permanently deletes the specified Elasticsearch domain and all of its data. Once a domain is deleted, it cannot be recovered.</p>
 
 @param request A container for the necessary parameters to execute the DeleteElasticsearchDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDeleteElasticsearchDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDeleteElasticsearchDomainRequest
 @see AWSElasticsearchserviceDeleteElasticsearchDomainResponse
 */
- (AWSTask<AWSElasticsearchserviceDeleteElasticsearchDomainResponse *> *)deleteElasticsearchDomain:(AWSElasticsearchserviceDeleteElasticsearchDomainRequest *)request;

/**
 <p>Permanently deletes the specified Elasticsearch domain and all of its data. Once a domain is deleted, it cannot be recovered.</p>
 
 @param request A container for the necessary parameters to execute the DeleteElasticsearchDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDeleteElasticsearchDomainRequest
 @see AWSElasticsearchserviceDeleteElasticsearchDomainResponse
 */
- (void)deleteElasticsearchDomain:(AWSElasticsearchserviceDeleteElasticsearchDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDeleteElasticsearchDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the service-linked role that Elasticsearch Service uses to manage and maintain VPC domains. Role deletion will fail if any existing VPC domains use the role. You must delete any such Elasticsearch domains before deleting the role. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-enabling-slr" target="_blank">Deleting Elasticsearch Service Role</a> in <i>VPC Endpoints for Amazon Elasticsearch Service Domains</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteElasticsearchServiceRole service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSRequest
 */
- (AWSTask *)deleteElasticsearchServiceRole:(AWSRequest *)request;

/**
 <p>Deletes the service-linked role that Elasticsearch Service uses to manage and maintain VPC domains. Role deletion will fail if any existing VPC domains use the role. You must delete any such Elasticsearch domains before deleting the role. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-enabling-slr" target="_blank">Deleting Elasticsearch Service Role</a> in <i>VPC Endpoints for Amazon Elasticsearch Service Domains</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteElasticsearchServiceRole service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSRequest
 */
- (void)deleteElasticsearchServiceRole:(AWSRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Allows the destination domain owner to delete an existing inbound cross-cluster search connection.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInboundCrossClusterSearchConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionRequest
 @see AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse
 */
- (AWSTask<AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse *> *)deleteInboundCrossClusterSearchConnection:(AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionRequest *)request;

/**
 <p>Allows the destination domain owner to delete an existing inbound cross-cluster search connection.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInboundCrossClusterSearchConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionRequest
 @see AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse
 */
- (void)deleteInboundCrossClusterSearchConnection:(AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows the source domain owner to delete an existing outbound cross-cluster search connection.</p>
 
 @param request A container for the necessary parameters to execute the DeleteOutboundCrossClusterSearchConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionRequest
 @see AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse
 */
- (AWSTask<AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse *> *)deleteOutboundCrossClusterSearchConnection:(AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionRequest *)request;

/**
 <p>Allows the source domain owner to delete an existing outbound cross-cluster search connection.</p>
 
 @param request A container for the necessary parameters to execute the DeleteOutboundCrossClusterSearchConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionRequest
 @see AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse
 */
- (void)deleteOutboundCrossClusterSearchConnection:(AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete the package.</p>
 
 @param request A container for the necessary parameters to execute the DeletePackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDeletePackageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorConflict`.
 
 @see AWSElasticsearchserviceDeletePackageRequest
 @see AWSElasticsearchserviceDeletePackageResponse
 */
- (AWSTask<AWSElasticsearchserviceDeletePackageResponse *> *)deletePackage:(AWSElasticsearchserviceDeletePackageRequest *)request;

/**
 <p>Delete the package.</p>
 
 @param request A container for the necessary parameters to execute the DeletePackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorConflict`.
 
 @see AWSElasticsearchserviceDeletePackageRequest
 @see AWSElasticsearchserviceDeletePackageResponse
 */
- (void)deletePackage:(AWSElasticsearchserviceDeletePackageRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDeletePackageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns domain configuration information about the specified Elasticsearch domain, including the domain ID, domain endpoint, and domain ARN.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDescribeElasticsearchDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDescribeElasticsearchDomainRequest
 @see AWSElasticsearchserviceDescribeElasticsearchDomainResponse
 */
- (AWSTask<AWSElasticsearchserviceDescribeElasticsearchDomainResponse *> *)describeElasticsearchDomain:(AWSElasticsearchserviceDescribeElasticsearchDomainRequest *)request;

/**
 <p>Returns domain configuration information about the specified Elasticsearch domain, including the domain ID, domain endpoint, and domain ARN.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDescribeElasticsearchDomainRequest
 @see AWSElasticsearchserviceDescribeElasticsearchDomainResponse
 */
- (void)describeElasticsearchDomain:(AWSElasticsearchserviceDescribeElasticsearchDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDescribeElasticsearchDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides cluster configuration information about the specified Elasticsearch domain, such as the state, creation date, update version, and update date for cluster options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomainConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDescribeElasticsearchDomainConfigRequest
 @see AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse
 */
- (AWSTask<AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse *> *)describeElasticsearchDomainConfig:(AWSElasticsearchserviceDescribeElasticsearchDomainConfigRequest *)request;

/**
 <p>Provides cluster configuration information about the specified Elasticsearch domain, such as the state, creation date, update version, and update date for cluster options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomainConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDescribeElasticsearchDomainConfigRequest
 @see AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse
 */
- (void)describeElasticsearchDomainConfig:(AWSElasticsearchserviceDescribeElasticsearchDomainConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns domain configuration information about the specified Elasticsearch domains, including the domain ID, domain endpoint, and domain ARN.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomains service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDescribeElasticsearchDomainsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDescribeElasticsearchDomainsRequest
 @see AWSElasticsearchserviceDescribeElasticsearchDomainsResponse
 */
- (AWSTask<AWSElasticsearchserviceDescribeElasticsearchDomainsResponse *> *)describeElasticsearchDomains:(AWSElasticsearchserviceDescribeElasticsearchDomainsRequest *)request;

/**
 <p>Returns domain configuration information about the specified Elasticsearch domains, including the domain ID, domain endpoint, and domain ARN.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchDomains service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDescribeElasticsearchDomainsRequest
 @see AWSElasticsearchserviceDescribeElasticsearchDomainsResponse
 */
- (void)describeElasticsearchDomains:(AWSElasticsearchserviceDescribeElasticsearchDomainsRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDescribeElasticsearchDomainsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Describe Elasticsearch Limits for a given InstanceType and ElasticsearchVersion. When modifying existing Domain, specify the <code><a>DomainName</a></code> to know what Limits are supported for modifying. </p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchInstanceTypeLimits service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorInvalidType`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsRequest
 @see AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse
 */
- (AWSTask<AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse *> *)describeElasticsearchInstanceTypeLimits:(AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsRequest *)request;

/**
 <p> Describe Elasticsearch Limits for a given InstanceType and ElasticsearchVersion. When modifying existing Domain, specify the <code><a>DomainName</a></code> to know what Limits are supported for modifying. </p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticsearchInstanceTypeLimits service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorInvalidType`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsRequest
 @see AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse
 */
- (void)describeElasticsearchInstanceTypeLimits:(AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the inbound cross-cluster search connections for a destination domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInboundCrossClusterSearchConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorInvalidPaginationToken`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsRequest
 @see AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse
 */
- (AWSTask<AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse *> *)describeInboundCrossClusterSearchConnections:(AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsRequest *)request;

/**
 <p>Lists all the inbound cross-cluster search connections for a destination domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInboundCrossClusterSearchConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorInvalidPaginationToken`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsRequest
 @see AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse
 */
- (void)describeInboundCrossClusterSearchConnections:(AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the outbound cross-cluster search connections for a source domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOutboundCrossClusterSearchConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorInvalidPaginationToken`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsRequest
 @see AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse
 */
- (AWSTask<AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse *> *)describeOutboundCrossClusterSearchConnections:(AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsRequest *)request;

/**
 <p>Lists all the outbound cross-cluster search connections for a source domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeOutboundCrossClusterSearchConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorInvalidPaginationToken`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsRequest
 @see AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse
 */
- (void)describeOutboundCrossClusterSearchConnections:(AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes all packages available to Amazon ES. Includes options for filtering, limiting the number of results, and pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribePackages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDescribePackagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDescribePackagesRequest
 @see AWSElasticsearchserviceDescribePackagesResponse
 */
- (AWSTask<AWSElasticsearchserviceDescribePackagesResponse *> *)describePackages:(AWSElasticsearchserviceDescribePackagesRequest *)request;

/**
 <p>Describes all packages available to Amazon ES. Includes options for filtering, limiting the number of results, and pagination.</p>
 
 @param request A container for the necessary parameters to execute the DescribePackages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceDescribePackagesRequest
 @see AWSElasticsearchserviceDescribePackagesResponse
 */
- (void)describePackages:(AWSElasticsearchserviceDescribePackagesRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDescribePackagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists available reserved Elasticsearch instance offerings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedElasticsearchInstanceOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsRequest
 @see AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse
 */
- (AWSTask<AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse *> *)describeReservedElasticsearchInstanceOfferings:(AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsRequest *)request;

/**
 <p>Lists available reserved Elasticsearch instance offerings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedElasticsearchInstanceOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsRequest
 @see AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse
 */
- (void)describeReservedElasticsearchInstanceOfferings:(AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about reserved Elasticsearch instances for this account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedElasticsearchInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceDescribeReservedElasticsearchInstancesRequest
 @see AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse
 */
- (AWSTask<AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse *> *)describeReservedElasticsearchInstances:(AWSElasticsearchserviceDescribeReservedElasticsearchInstancesRequest *)request;

/**
 <p>Returns information about reserved Elasticsearch instances for this account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedElasticsearchInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceDescribeReservedElasticsearchInstancesRequest
 @see AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse
 */
- (void)describeReservedElasticsearchInstances:(AWSElasticsearchserviceDescribeReservedElasticsearchInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Dissociates a package from the Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the DissociatePackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceDissociatePackageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorConflict`.
 
 @see AWSElasticsearchserviceDissociatePackageRequest
 @see AWSElasticsearchserviceDissociatePackageResponse
 */
- (AWSTask<AWSElasticsearchserviceDissociatePackageResponse *> *)dissociatePackage:(AWSElasticsearchserviceDissociatePackageRequest *)request;

/**
 <p>Dissociates a package from the Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the DissociatePackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorConflict`.
 
 @see AWSElasticsearchserviceDissociatePackageRequest
 @see AWSElasticsearchserviceDissociatePackageResponse
 */
- (void)dissociatePackage:(AWSElasticsearchserviceDissociatePackageRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceDissociatePackageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of upgrade compatible Elastisearch versions. You can optionally pass a <code><a>DomainName</a></code> to get all upgrade compatible Elasticsearch versions for that specific domain. </p>
 
 @param request A container for the necessary parameters to execute the GetCompatibleElasticsearchVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceGetCompatibleElasticsearchVersionsRequest
 @see AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse
 */
- (AWSTask<AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse *> *)getCompatibleElasticsearchVersions:(AWSElasticsearchserviceGetCompatibleElasticsearchVersionsRequest *)request;

/**
 <p> Returns a list of upgrade compatible Elastisearch versions. You can optionally pass a <code><a>DomainName</a></code> to get all upgrade compatible Elasticsearch versions for that specific domain. </p>
 
 @param request A container for the necessary parameters to execute the GetCompatibleElasticsearchVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceGetCompatibleElasticsearchVersionsRequest
 @see AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse
 */
- (void)getCompatibleElasticsearchVersions:(AWSElasticsearchserviceGetCompatibleElasticsearchVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the complete history of the last 10 upgrades that were performed on the domain.</p>
 
 @param request A container for the necessary parameters to execute the GetUpgradeHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceGetUpgradeHistoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceGetUpgradeHistoryRequest
 @see AWSElasticsearchserviceGetUpgradeHistoryResponse
 */
- (AWSTask<AWSElasticsearchserviceGetUpgradeHistoryResponse *> *)getUpgradeHistory:(AWSElasticsearchserviceGetUpgradeHistoryRequest *)request;

/**
 <p>Retrieves the complete history of the last 10 upgrades that were performed on the domain.</p>
 
 @param request A container for the necessary parameters to execute the GetUpgradeHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceGetUpgradeHistoryRequest
 @see AWSElasticsearchserviceGetUpgradeHistoryResponse
 */
- (void)getUpgradeHistory:(AWSElasticsearchserviceGetUpgradeHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceGetUpgradeHistoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the latest status of the last upgrade or upgrade eligibility check that was performed on the domain.</p>
 
 @param request A container for the necessary parameters to execute the GetUpgradeStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceGetUpgradeStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceGetUpgradeStatusRequest
 @see AWSElasticsearchserviceGetUpgradeStatusResponse
 */
- (AWSTask<AWSElasticsearchserviceGetUpgradeStatusResponse *> *)getUpgradeStatus:(AWSElasticsearchserviceGetUpgradeStatusRequest *)request;

/**
 <p>Retrieves the latest status of the last upgrade or upgrade eligibility check that was performed on the domain.</p>
 
 @param request A container for the necessary parameters to execute the GetUpgradeStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceGetUpgradeStatusRequest
 @see AWSElasticsearchserviceGetUpgradeStatusResponse
 */
- (void)getUpgradeStatus:(AWSElasticsearchserviceGetUpgradeStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceGetUpgradeStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the name of all Elasticsearch domains owned by the current user's account. </p>
 
 @param request A container for the necessary parameters to execute the ListDomainNames service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceListDomainNamesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSRequest
 @see AWSElasticsearchserviceListDomainNamesResponse
 */
- (AWSTask<AWSElasticsearchserviceListDomainNamesResponse *> *)listDomainNames:(AWSRequest *)request;

/**
 <p>Returns the name of all Elasticsearch domains owned by the current user's account. </p>
 
 @param request A container for the necessary parameters to execute the ListDomainNames service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSRequest
 @see AWSElasticsearchserviceListDomainNamesResponse
 */
- (void)listDomainNames:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceListDomainNamesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all Amazon ES domains associated with the package.</p>
 
 @param request A container for the necessary parameters to execute the ListDomainsForPackage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceListDomainsForPackageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceListDomainsForPackageRequest
 @see AWSElasticsearchserviceListDomainsForPackageResponse
 */
- (AWSTask<AWSElasticsearchserviceListDomainsForPackageResponse *> *)listDomainsForPackage:(AWSElasticsearchserviceListDomainsForPackageRequest *)request;

/**
 <p>Lists all Amazon ES domains associated with the package.</p>
 
 @param request A container for the necessary parameters to execute the ListDomainsForPackage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceListDomainsForPackageRequest
 @see AWSElasticsearchserviceListDomainsForPackageResponse
 */
- (void)listDomainsForPackage:(AWSElasticsearchserviceListDomainsForPackageRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceListDomainsForPackageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all Elasticsearch instance types that are supported for given ElasticsearchVersion</p>
 
 @param request A container for the necessary parameters to execute the ListElasticsearchInstanceTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceListElasticsearchInstanceTypesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceListElasticsearchInstanceTypesRequest
 @see AWSElasticsearchserviceListElasticsearchInstanceTypesResponse
 */
- (AWSTask<AWSElasticsearchserviceListElasticsearchInstanceTypesResponse *> *)listElasticsearchInstanceTypes:(AWSElasticsearchserviceListElasticsearchInstanceTypesRequest *)request;

/**
 <p>List all Elasticsearch instance types that are supported for given ElasticsearchVersion</p>
 
 @param request A container for the necessary parameters to execute the ListElasticsearchInstanceTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceListElasticsearchInstanceTypesRequest
 @see AWSElasticsearchserviceListElasticsearchInstanceTypesResponse
 */
- (void)listElasticsearchInstanceTypes:(AWSElasticsearchserviceListElasticsearchInstanceTypesRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceListElasticsearchInstanceTypesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all supported Elasticsearch versions</p>
 
 @param request A container for the necessary parameters to execute the ListElasticsearchVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceListElasticsearchVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceListElasticsearchVersionsRequest
 @see AWSElasticsearchserviceListElasticsearchVersionsResponse
 */
- (AWSTask<AWSElasticsearchserviceListElasticsearchVersionsResponse *> *)listElasticsearchVersions:(AWSElasticsearchserviceListElasticsearchVersionsRequest *)request;

/**
 <p>List all supported Elasticsearch versions</p>
 
 @param request A container for the necessary parameters to execute the ListElasticsearchVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceListElasticsearchVersionsRequest
 @see AWSElasticsearchserviceListElasticsearchVersionsResponse
 */
- (void)listElasticsearchVersions:(AWSElasticsearchserviceListElasticsearchVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceListElasticsearchVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all packages associated with the Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the ListPackagesForDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceListPackagesForDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceListPackagesForDomainRequest
 @see AWSElasticsearchserviceListPackagesForDomainResponse
 */
- (AWSTask<AWSElasticsearchserviceListPackagesForDomainResponse *> *)listPackagesForDomain:(AWSElasticsearchserviceListPackagesForDomainRequest *)request;

/**
 <p>Lists all packages associated with the Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the ListPackagesForDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorAccessDenied`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceListPackagesForDomainRequest
 @see AWSElasticsearchserviceListPackagesForDomainResponse
 */
- (void)listPackagesForDomain:(AWSElasticsearchserviceListPackagesForDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceListPackagesForDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all tags for the given Elasticsearch domain.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceListTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceListTagsRequest
 @see AWSElasticsearchserviceListTagsResponse
 */
- (AWSTask<AWSElasticsearchserviceListTagsResponse *> *)listTags:(AWSElasticsearchserviceListTagsRequest *)request;

/**
 <p>Returns all tags for the given Elasticsearch domain.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceListTagsRequest
 @see AWSElasticsearchserviceListTagsResponse
 */
- (void)listTags:(AWSElasticsearchserviceListTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceListTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows you to purchase reserved Elasticsearch instances.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedElasticsearchInstanceOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorResourceAlreadyExists`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingRequest
 @see AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse
 */
- (AWSTask<AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse *> *)purchaseReservedElasticsearchInstanceOffering:(AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingRequest *)request;

/**
 <p>Allows you to purchase reserved Elasticsearch instances.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedElasticsearchInstanceOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorResourceAlreadyExists`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingRequest
 @see AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse
 */
- (void)purchaseReservedElasticsearchInstanceOffering:(AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows the destination domain owner to reject an inbound cross-cluster search connection request.</p>
 
 @param request A container for the necessary parameters to execute the RejectInboundCrossClusterSearchConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionRequest
 @see AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse
 */
- (AWSTask<AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse *> *)rejectInboundCrossClusterSearchConnection:(AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionRequest *)request;

/**
 <p>Allows the destination domain owner to reject an inbound cross-cluster search connection request.</p>
 
 @param request A container for the necessary parameters to execute the RejectInboundCrossClusterSearchConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorDisabledOperation`.
 
 @see AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionRequest
 @see AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse
 */
- (void)rejectInboundCrossClusterSearchConnection:(AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified set of tags from the specified Elasticsearch domain.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceRemoveTagsRequest
 */
- (AWSTask *)removeTags:(AWSElasticsearchserviceRemoveTagsRequest *)request;

/**
 <p>Removes the specified set of tags from the specified Elasticsearch domain.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceRemoveTagsRequest
 */
- (void)removeTags:(AWSElasticsearchserviceRemoveTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Schedules a service software update for an Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the StartElasticsearchServiceSoftwareUpdate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateRequest
 @see AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse
 */
- (AWSTask<AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse *> *)startElasticsearchServiceSoftwareUpdate:(AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateRequest *)request;

/**
 <p>Schedules a service software update for an Amazon ES domain.</p>
 
 @param request A container for the necessary parameters to execute the StartElasticsearchServiceSoftwareUpdate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateRequest
 @see AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse
 */
- (void)startElasticsearchServiceSoftwareUpdate:(AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the cluster configuration of the specified Elasticsearch domain, setting as setting the instance type and the number of instances. </p>
 
 @param request A container for the necessary parameters to execute the UpdateElasticsearchDomainConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorInvalidType`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceUpdateElasticsearchDomainConfigRequest
 @see AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse
 */
- (AWSTask<AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse *> *)updateElasticsearchDomainConfig:(AWSElasticsearchserviceUpdateElasticsearchDomainConfigRequest *)request;

/**
 <p>Modifies the cluster configuration of the specified Elasticsearch domain, setting as setting the instance type and the number of instances. </p>
 
 @param request A container for the necessary parameters to execute the UpdateElasticsearchDomainConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorInternal`, `AWSElasticsearchserviceErrorInvalidType`, `AWSElasticsearchserviceErrorLimitExceeded`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorValidation`.
 
 @see AWSElasticsearchserviceUpdateElasticsearchDomainConfigRequest
 @see AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse
 */
- (void)updateElasticsearchDomainConfig:(AWSElasticsearchserviceUpdateElasticsearchDomainConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows you to either upgrade your domain or perform an Upgrade eligibility check to a compatible Elasticsearch version.</p>
 
 @param request A container for the necessary parameters to execute the UpgradeElasticsearchDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticsearchserviceUpgradeElasticsearchDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorResourceAlreadyExists`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceUpgradeElasticsearchDomainRequest
 @see AWSElasticsearchserviceUpgradeElasticsearchDomainResponse
 */
- (AWSTask<AWSElasticsearchserviceUpgradeElasticsearchDomainResponse *> *)upgradeElasticsearchDomain:(AWSElasticsearchserviceUpgradeElasticsearchDomainRequest *)request;

/**
 <p>Allows you to either upgrade your domain or perform an Upgrade eligibility check to a compatible Elasticsearch version.</p>
 
 @param request A container for the necessary parameters to execute the UpgradeElasticsearchDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticsearchserviceErrorDomain` domain and the following error code: `AWSElasticsearchserviceErrorBase`, `AWSElasticsearchserviceErrorResourceNotFound`, `AWSElasticsearchserviceErrorResourceAlreadyExists`, `AWSElasticsearchserviceErrorDisabledOperation`, `AWSElasticsearchserviceErrorValidation`, `AWSElasticsearchserviceErrorInternal`.
 
 @see AWSElasticsearchserviceUpgradeElasticsearchDomainRequest
 @see AWSElasticsearchserviceUpgradeElasticsearchDomainResponse
 */
- (void)upgradeElasticsearchDomain:(AWSElasticsearchserviceUpgradeElasticsearchDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSElasticsearchserviceUpgradeElasticsearchDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
