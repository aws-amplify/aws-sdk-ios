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
#import "AWSServicecatalogModel.h"
#import "AWSServicecatalogResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSServicecatalog
FOUNDATION_EXPORT NSString *const AWSServicecatalogSDKVersion;

/**
 <fullname>AWS Service Catalog</fullname><p><a href="https://aws.amazon.com/servicecatalog/">AWS Service Catalog</a> enables organizations to create and manage catalogs of IT services that are approved for use on AWS. To get the most out of this documentation, you should be familiar with the terminology discussed in <a href="http://docs.aws.amazon.com/servicecatalog/latest/adminguide/what-is_concepts.html">AWS Service Catalog Concepts</a>.</p>
 */
@interface AWSServicecatalog : AWSService

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

     let Servicecatalog = AWSServicecatalog.default()

 *Objective-C*

     AWSServicecatalog *Servicecatalog = [AWSServicecatalog defaultServicecatalog];

 @return The default service client.
 */
+ (instancetype)defaultServicecatalog;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSServicecatalog.register(with: configuration!, forKey: "USWest2Servicecatalog")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:@"USWest2Servicecatalog"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Servicecatalog = AWSServicecatalog(forKey: "USWest2Servicecatalog")

 *Objective-C*

     AWSServicecatalog *Servicecatalog = [AWSServicecatalog ServicecatalogForKey:@"USWest2Servicecatalog"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerServicecatalogWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerServicecatalogWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSServicecatalog.register(with: configuration!, forKey: "USWest2Servicecatalog")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:@"USWest2Servicecatalog"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Servicecatalog = AWSServicecatalog(forKey: "USWest2Servicecatalog")

 *Objective-C*

     AWSServicecatalog *Servicecatalog = [AWSServicecatalog ServicecatalogForKey:@"USWest2Servicecatalog"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ServicecatalogForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeServicecatalogForKey:(NSString *)key;

/**
 <p>Accepts an offer to share the specified portfolio.</p>
 
 @param request A container for the necessary parameters to execute the AcceptPortfolioShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogAcceptPortfolioShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogAcceptPortfolioShareInput
 @see AWSServicecatalogAcceptPortfolioShareOutput
 */
- (AWSTask<AWSServicecatalogAcceptPortfolioShareOutput *> *)acceptPortfolioShare:(AWSServicecatalogAcceptPortfolioShareInput *)request;

/**
 <p>Accepts an offer to share the specified portfolio.</p>
 
 @param request A container for the necessary parameters to execute the AcceptPortfolioShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogAcceptPortfolioShareInput
 @see AWSServicecatalogAcceptPortfolioShareOutput
 */
- (void)acceptPortfolioShare:(AWSServicecatalogAcceptPortfolioShareInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogAcceptPortfolioShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified budget with the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the AssociateBudgetWithResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogAssociateBudgetWithResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorDuplicateResource`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogAssociateBudgetWithResourceInput
 @see AWSServicecatalogAssociateBudgetWithResourceOutput
 */
- (AWSTask<AWSServicecatalogAssociateBudgetWithResourceOutput *> *)associateBudgetWithResource:(AWSServicecatalogAssociateBudgetWithResourceInput *)request;

/**
 <p>Associates the specified budget with the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the AssociateBudgetWithResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorDuplicateResource`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogAssociateBudgetWithResourceInput
 @see AWSServicecatalogAssociateBudgetWithResourceOutput
 */
- (void)associateBudgetWithResource:(AWSServicecatalogAssociateBudgetWithResourceInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogAssociateBudgetWithResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified principal ARN with the specified portfolio.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePrincipalWithPortfolio service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogAssociatePrincipalWithPortfolioOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogAssociatePrincipalWithPortfolioInput
 @see AWSServicecatalogAssociatePrincipalWithPortfolioOutput
 */
- (AWSTask<AWSServicecatalogAssociatePrincipalWithPortfolioOutput *> *)associatePrincipalWithPortfolio:(AWSServicecatalogAssociatePrincipalWithPortfolioInput *)request;

/**
 <p>Associates the specified principal ARN with the specified portfolio.</p>
 
 @param request A container for the necessary parameters to execute the AssociatePrincipalWithPortfolio service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogAssociatePrincipalWithPortfolioInput
 @see AWSServicecatalogAssociatePrincipalWithPortfolioOutput
 */
- (void)associatePrincipalWithPortfolio:(AWSServicecatalogAssociatePrincipalWithPortfolioInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogAssociatePrincipalWithPortfolioOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified product with the specified portfolio.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the AssociateProductWithPortfolio service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogAssociateProductWithPortfolioOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogAssociateProductWithPortfolioInput
 @see AWSServicecatalogAssociateProductWithPortfolioOutput
 */
- (AWSTask<AWSServicecatalogAssociateProductWithPortfolioOutput *> *)associateProductWithPortfolio:(AWSServicecatalogAssociateProductWithPortfolioInput *)request;

/**
 <p>Associates the specified product with the specified portfolio.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the AssociateProductWithPortfolio service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogAssociateProductWithPortfolioInput
 @see AWSServicecatalogAssociateProductWithPortfolioOutput
 */
- (void)associateProductWithPortfolio:(AWSServicecatalogAssociateProductWithPortfolioInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogAssociateProductWithPortfolioOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a self-service action with a provisioning artifact.</p>
 
 @param request A container for the necessary parameters to execute the AssociateServiceActionWithProvisioningArtifact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorDuplicateResource`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogAssociateServiceActionWithProvisioningArtifactInput
 @see AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput
 */
- (AWSTask<AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput *> *)associateServiceActionWithProvisioningArtifact:(AWSServicecatalogAssociateServiceActionWithProvisioningArtifactInput *)request;

/**
 <p>Associates a self-service action with a provisioning artifact.</p>
 
 @param request A container for the necessary parameters to execute the AssociateServiceActionWithProvisioningArtifact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorDuplicateResource`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogAssociateServiceActionWithProvisioningArtifactInput
 @see AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput
 */
- (void)associateServiceActionWithProvisioningArtifact:(AWSServicecatalogAssociateServiceActionWithProvisioningArtifactInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associate the specified TagOption with the specified portfolio or product.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTagOptionWithResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogAssociateTagOptionWithResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorDuplicateResource`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogAssociateTagOptionWithResourceInput
 @see AWSServicecatalogAssociateTagOptionWithResourceOutput
 */
- (AWSTask<AWSServicecatalogAssociateTagOptionWithResourceOutput *> *)associateTagOptionWithResource:(AWSServicecatalogAssociateTagOptionWithResourceInput *)request;

/**
 <p>Associate the specified TagOption with the specified portfolio or product.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTagOptionWithResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorDuplicateResource`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogAssociateTagOptionWithResourceInput
 @see AWSServicecatalogAssociateTagOptionWithResourceOutput
 */
- (void)associateTagOptionWithResource:(AWSServicecatalogAssociateTagOptionWithResourceInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogAssociateTagOptionWithResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates multiple self-service actions with provisioning artifacts.</p>
 
 @param request A container for the necessary parameters to execute the BatchAssociateServiceActionWithProvisioningArtifact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactInput
 @see AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput
 */
- (AWSTask<AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput *> *)batchAssociateServiceActionWithProvisioningArtifact:(AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactInput *)request;

/**
 <p>Associates multiple self-service actions with provisioning artifacts.</p>
 
 @param request A container for the necessary parameters to execute the BatchAssociateServiceActionWithProvisioningArtifact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactInput
 @see AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput
 */
- (void)batchAssociateServiceActionWithProvisioningArtifact:(AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a batch of self-service actions from the specified provisioning artifact.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisassociateServiceActionFromProvisioningArtifact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactInput
 @see AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput
 */
- (AWSTask<AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput *> *)batchDisassociateServiceActionFromProvisioningArtifact:(AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactInput *)request;

/**
 <p>Disassociates a batch of self-service actions from the specified provisioning artifact.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisassociateServiceActionFromProvisioningArtifact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactInput
 @see AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput
 */
- (void)batchDisassociateServiceActionFromProvisioningArtifact:(AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies the specified source product to the specified target product or a new product.</p><p>You can copy a product to the same account or another account. You can copy a product to the same region or another region.</p><p>This operation is performed asynchronously. To track the progress of the operation, use <a>DescribeCopyProductStatus</a>.</p>
 
 @param request A container for the necessary parameters to execute the CopyProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogReplicateProductOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogReplicateProductInput
 @see AWSServicecatalogReplicateProductOutput
 */
- (AWSTask<AWSServicecatalogReplicateProductOutput *> *)replicateProduct:(AWSServicecatalogReplicateProductInput *)request;

/**
 <p>Copies the specified source product to the specified target product or a new product.</p><p>You can copy a product to the same account or another account. You can copy a product to the same region or another region.</p><p>This operation is performed asynchronously. To track the progress of the operation, use <a>DescribeCopyProductStatus</a>.</p>
 
 @param request A container for the necessary parameters to execute the CopyProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogReplicateProductInput
 @see AWSServicecatalogReplicateProductOutput
 */
- (void)replicateProduct:(AWSServicecatalogReplicateProductInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogReplicateProductOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a constraint.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the CreateConstraint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogCreateConstraintOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorDuplicateResource`.
 
 @see AWSServicecatalogCreateConstraintInput
 @see AWSServicecatalogCreateConstraintOutput
 */
- (AWSTask<AWSServicecatalogCreateConstraintOutput *> *)createConstraint:(AWSServicecatalogCreateConstraintInput *)request;

/**
 <p>Creates a constraint.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the CreateConstraint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorDuplicateResource`.
 
 @see AWSServicecatalogCreateConstraintInput
 @see AWSServicecatalogCreateConstraintOutput
 */
- (void)createConstraint:(AWSServicecatalogCreateConstraintInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogCreateConstraintOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a portfolio.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the CreatePortfolio service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogCreatePortfolioOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogCreatePortfolioInput
 @see AWSServicecatalogCreatePortfolioOutput
 */
- (AWSTask<AWSServicecatalogCreatePortfolioOutput *> *)createPortfolio:(AWSServicecatalogCreatePortfolioInput *)request;

/**
 <p>Creates a portfolio.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the CreatePortfolio service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogCreatePortfolioInput
 @see AWSServicecatalogCreatePortfolioOutput
 */
- (void)createPortfolio:(AWSServicecatalogCreatePortfolioInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogCreatePortfolioOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Shares the specified portfolio with the specified account or organization node. Shares to an organization node can only be created by the master account of an organization or by a delegated administrator. You can share portfolios to an organization, an organizational unit, or a specific account.</p><p>Note that if a delegated admin is de-registered, they can no longer create portfolio shares.</p><p><code>AWSOrganizationsAccess</code> must be enabled in order to create a portfolio share to an organization node.</p>
 
 @param request A container for the necessary parameters to execute the CreatePortfolioShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogCreatePortfolioShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorOperationNotSupported`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogCreatePortfolioShareInput
 @see AWSServicecatalogCreatePortfolioShareOutput
 */
- (AWSTask<AWSServicecatalogCreatePortfolioShareOutput *> *)createPortfolioShare:(AWSServicecatalogCreatePortfolioShareInput *)request;

/**
 <p>Shares the specified portfolio with the specified account or organization node. Shares to an organization node can only be created by the master account of an organization or by a delegated administrator. You can share portfolios to an organization, an organizational unit, or a specific account.</p><p>Note that if a delegated admin is de-registered, they can no longer create portfolio shares.</p><p><code>AWSOrganizationsAccess</code> must be enabled in order to create a portfolio share to an organization node.</p>
 
 @param request A container for the necessary parameters to execute the CreatePortfolioShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorOperationNotSupported`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogCreatePortfolioShareInput
 @see AWSServicecatalogCreatePortfolioShareOutput
 */
- (void)createPortfolioShare:(AWSServicecatalogCreatePortfolioShareInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogCreatePortfolioShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a product.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the CreateProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogCreateProductOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogCreateProductInput
 @see AWSServicecatalogCreateProductOutput
 */
- (AWSTask<AWSServicecatalogCreateProductOutput *> *)createProduct:(AWSServicecatalogCreateProductInput *)request;

/**
 <p>Creates a product.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the CreateProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogCreateProductInput
 @see AWSServicecatalogCreateProductOutput
 */
- (void)createProduct:(AWSServicecatalogCreateProductInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogCreateProductOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a plan. A plan includes the list of resources to be created (when provisioning a new product) or modified (when updating a provisioned product) when the plan is executed.</p><p>You can create one plan per provisioned product. To create a plan for an existing provisioned product, the product status must be AVAILBLE or TAINTED.</p><p>To view the resource changes in the change set, use <a>DescribeProvisionedProductPlan</a>. To create or modify the provisioned product, use <a>ExecuteProvisionedProductPlan</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateProvisionedProductPlan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogCreateProvisionedProductPlanOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogCreateProvisionedProductPlanInput
 @see AWSServicecatalogCreateProvisionedProductPlanOutput
 */
- (AWSTask<AWSServicecatalogCreateProvisionedProductPlanOutput *> *)createProvisionedProductPlan:(AWSServicecatalogCreateProvisionedProductPlanInput *)request;

/**
 <p>Creates a plan. A plan includes the list of resources to be created (when provisioning a new product) or modified (when updating a provisioned product) when the plan is executed.</p><p>You can create one plan per provisioned product. To create a plan for an existing provisioned product, the product status must be AVAILBLE or TAINTED.</p><p>To view the resource changes in the change set, use <a>DescribeProvisionedProductPlan</a>. To create or modify the provisioned product, use <a>ExecuteProvisionedProductPlan</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateProvisionedProductPlan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogCreateProvisionedProductPlanInput
 @see AWSServicecatalogCreateProvisionedProductPlanOutput
 */
- (void)createProvisionedProductPlan:(AWSServicecatalogCreateProvisionedProductPlanInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogCreateProvisionedProductPlanOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a provisioning artifact (also known as a version) for the specified product.</p><p>You cannot create a provisioning artifact for a product that was shared with you.</p>
 
 @param request A container for the necessary parameters to execute the CreateProvisioningArtifact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogCreateProvisioningArtifactOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogCreateProvisioningArtifactInput
 @see AWSServicecatalogCreateProvisioningArtifactOutput
 */
- (AWSTask<AWSServicecatalogCreateProvisioningArtifactOutput *> *)createProvisioningArtifact:(AWSServicecatalogCreateProvisioningArtifactInput *)request;

/**
 <p>Creates a provisioning artifact (also known as a version) for the specified product.</p><p>You cannot create a provisioning artifact for a product that was shared with you.</p>
 
 @param request A container for the necessary parameters to execute the CreateProvisioningArtifact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogCreateProvisioningArtifactInput
 @see AWSServicecatalogCreateProvisioningArtifactOutput
 */
- (void)createProvisioningArtifact:(AWSServicecatalogCreateProvisioningArtifactInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogCreateProvisioningArtifactOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a self-service action.</p>
 
 @param request A container for the necessary parameters to execute the CreateServiceAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogCreateServiceActionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogCreateServiceActionInput
 @see AWSServicecatalogCreateServiceActionOutput
 */
- (AWSTask<AWSServicecatalogCreateServiceActionOutput *> *)createServiceAction:(AWSServicecatalogCreateServiceActionInput *)request;

/**
 <p>Creates a self-service action.</p>
 
 @param request A container for the necessary parameters to execute the CreateServiceAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogCreateServiceActionInput
 @see AWSServicecatalogCreateServiceActionOutput
 */
- (void)createServiceAction:(AWSServicecatalogCreateServiceActionInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogCreateServiceActionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a TagOption.</p>
 
 @param request A container for the necessary parameters to execute the CreateTagOption service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogCreateTagOptionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorDuplicateResource`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogCreateTagOptionInput
 @see AWSServicecatalogCreateTagOptionOutput
 */
- (AWSTask<AWSServicecatalogCreateTagOptionOutput *> *)createTagOption:(AWSServicecatalogCreateTagOptionInput *)request;

/**
 <p>Creates a TagOption.</p>
 
 @param request A container for the necessary parameters to execute the CreateTagOption service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorDuplicateResource`, `AWSServicecatalogErrorLimitExceeded`.
 
 @see AWSServicecatalogCreateTagOptionInput
 @see AWSServicecatalogCreateTagOptionOutput
 */
- (void)createTagOption:(AWSServicecatalogCreateTagOptionInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogCreateTagOptionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified constraint.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConstraint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDeleteConstraintOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDeleteConstraintInput
 @see AWSServicecatalogDeleteConstraintOutput
 */
- (AWSTask<AWSServicecatalogDeleteConstraintOutput *> *)deleteConstraint:(AWSServicecatalogDeleteConstraintInput *)request;

/**
 <p>Deletes the specified constraint.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConstraint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDeleteConstraintInput
 @see AWSServicecatalogDeleteConstraintOutput
 */
- (void)deleteConstraint:(AWSServicecatalogDeleteConstraintInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDeleteConstraintOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified portfolio.</p><p>You cannot delete a portfolio if it was shared with you or if it has associated products, users, constraints, or shared accounts.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the DeletePortfolio service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDeletePortfolioOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceInUse`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogDeletePortfolioInput
 @see AWSServicecatalogDeletePortfolioOutput
 */
- (AWSTask<AWSServicecatalogDeletePortfolioOutput *> *)deletePortfolio:(AWSServicecatalogDeletePortfolioInput *)request;

/**
 <p>Deletes the specified portfolio.</p><p>You cannot delete a portfolio if it was shared with you or if it has associated products, users, constraints, or shared accounts.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the DeletePortfolio service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceInUse`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogDeletePortfolioInput
 @see AWSServicecatalogDeletePortfolioOutput
 */
- (void)deletePortfolio:(AWSServicecatalogDeletePortfolioInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDeletePortfolioOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops sharing the specified portfolio with the specified account or organization node. Shares to an organization node can only be deleted by the master account of an organization or by a delegated administrator.</p><p>Note that if a delegated admin is de-registered, portfolio shares created from that account are removed.</p>
 
 @param request A container for the necessary parameters to execute the DeletePortfolioShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDeletePortfolioShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorOperationNotSupported`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogDeletePortfolioShareInput
 @see AWSServicecatalogDeletePortfolioShareOutput
 */
- (AWSTask<AWSServicecatalogDeletePortfolioShareOutput *> *)deletePortfolioShare:(AWSServicecatalogDeletePortfolioShareInput *)request;

/**
 <p>Stops sharing the specified portfolio with the specified account or organization node. Shares to an organization node can only be deleted by the master account of an organization or by a delegated administrator.</p><p>Note that if a delegated admin is de-registered, portfolio shares created from that account are removed.</p>
 
 @param request A container for the necessary parameters to execute the DeletePortfolioShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorOperationNotSupported`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogDeletePortfolioShareInput
 @see AWSServicecatalogDeletePortfolioShareOutput
 */
- (void)deletePortfolioShare:(AWSServicecatalogDeletePortfolioShareInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDeletePortfolioShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified product.</p><p>You cannot delete a product if it was shared with you or is associated with a portfolio.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDeleteProductOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorResourceInUse`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogDeleteProductInput
 @see AWSServicecatalogDeleteProductOutput
 */
- (AWSTask<AWSServicecatalogDeleteProductOutput *> *)deleteProduct:(AWSServicecatalogDeleteProductInput *)request;

/**
 <p>Deletes the specified product.</p><p>You cannot delete a product if it was shared with you or is associated with a portfolio.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorResourceInUse`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogDeleteProductInput
 @see AWSServicecatalogDeleteProductOutput
 */
- (void)deleteProduct:(AWSServicecatalogDeleteProductInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDeleteProductOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified plan.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProvisionedProductPlan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDeleteProvisionedProductPlanOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDeleteProvisionedProductPlanInput
 @see AWSServicecatalogDeleteProvisionedProductPlanOutput
 */
- (AWSTask<AWSServicecatalogDeleteProvisionedProductPlanOutput *> *)deleteProvisionedProductPlan:(AWSServicecatalogDeleteProvisionedProductPlanInput *)request;

/**
 <p>Deletes the specified plan.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProvisionedProductPlan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDeleteProvisionedProductPlanInput
 @see AWSServicecatalogDeleteProvisionedProductPlanOutput
 */
- (void)deleteProvisionedProductPlan:(AWSServicecatalogDeleteProvisionedProductPlanInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDeleteProvisionedProductPlanOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified provisioning artifact (also known as a version) for the specified product.</p><p>You cannot delete a provisioning artifact associated with a product that was shared with you. You cannot delete the last provisioning artifact for a product, because a product must have at least one provisioning artifact.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProvisioningArtifact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDeleteProvisioningArtifactOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorResourceInUse`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDeleteProvisioningArtifactInput
 @see AWSServicecatalogDeleteProvisioningArtifactOutput
 */
- (AWSTask<AWSServicecatalogDeleteProvisioningArtifactOutput *> *)deleteProvisioningArtifact:(AWSServicecatalogDeleteProvisioningArtifactInput *)request;

/**
 <p>Deletes the specified provisioning artifact (also known as a version) for the specified product.</p><p>You cannot delete a provisioning artifact associated with a product that was shared with you. You cannot delete the last provisioning artifact for a product, because a product must have at least one provisioning artifact.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProvisioningArtifact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorResourceInUse`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDeleteProvisioningArtifactInput
 @see AWSServicecatalogDeleteProvisioningArtifactOutput
 */
- (void)deleteProvisioningArtifact:(AWSServicecatalogDeleteProvisioningArtifactInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDeleteProvisioningArtifactOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a self-service action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteServiceAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDeleteServiceActionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorResourceInUse`.
 
 @see AWSServicecatalogDeleteServiceActionInput
 @see AWSServicecatalogDeleteServiceActionOutput
 */
- (AWSTask<AWSServicecatalogDeleteServiceActionOutput *> *)deleteServiceAction:(AWSServicecatalogDeleteServiceActionInput *)request;

/**
 <p>Deletes a self-service action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteServiceAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorResourceInUse`.
 
 @see AWSServicecatalogDeleteServiceActionInput
 @see AWSServicecatalogDeleteServiceActionOutput
 */
- (void)deleteServiceAction:(AWSServicecatalogDeleteServiceActionInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDeleteServiceActionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified TagOption.</p><p>You cannot delete a TagOption if it is associated with a product or portfolio.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTagOption service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDeleteTagOptionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceInUse`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDeleteTagOptionInput
 @see AWSServicecatalogDeleteTagOptionOutput
 */
- (AWSTask<AWSServicecatalogDeleteTagOptionOutput *> *)deleteTagOption:(AWSServicecatalogDeleteTagOptionInput *)request;

/**
 <p>Deletes the specified TagOption.</p><p>You cannot delete a TagOption if it is associated with a product or portfolio.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTagOption service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceInUse`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDeleteTagOptionInput
 @see AWSServicecatalogDeleteTagOptionOutput
 */
- (void)deleteTagOption:(AWSServicecatalogDeleteTagOptionInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDeleteTagOptionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified constraint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConstraint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeConstraintOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeConstraintInput
 @see AWSServicecatalogDescribeConstraintOutput
 */
- (AWSTask<AWSServicecatalogDescribeConstraintOutput *> *)describeConstraint:(AWSServicecatalogDescribeConstraintInput *)request;

/**
 <p>Gets information about the specified constraint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConstraint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeConstraintInput
 @see AWSServicecatalogDescribeConstraintOutput
 */
- (void)describeConstraint:(AWSServicecatalogDescribeConstraintInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeConstraintOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the status of the specified copy product operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCopyProductStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeCopyProductStatusOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeCopyProductStatusInput
 @see AWSServicecatalogDescribeCopyProductStatusOutput
 */
- (AWSTask<AWSServicecatalogDescribeCopyProductStatusOutput *> *)describeCopyProductStatus:(AWSServicecatalogDescribeCopyProductStatusInput *)request;

/**
 <p>Gets the status of the specified copy product operation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCopyProductStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeCopyProductStatusInput
 @see AWSServicecatalogDescribeCopyProductStatusOutput
 */
- (void)describeCopyProductStatus:(AWSServicecatalogDescribeCopyProductStatusInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeCopyProductStatusOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified portfolio.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the DescribePortfolio service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribePortfolioOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribePortfolioInput
 @see AWSServicecatalogDescribePortfolioOutput
 */
- (AWSTask<AWSServicecatalogDescribePortfolioOutput *> *)describePortfolio:(AWSServicecatalogDescribePortfolioInput *)request;

/**
 <p>Gets information about the specified portfolio.</p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the DescribePortfolio service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribePortfolioInput
 @see AWSServicecatalogDescribePortfolioOutput
 */
- (void)describePortfolio:(AWSServicecatalogDescribePortfolioInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribePortfolioOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the status of the specified portfolio share operation. This API can only be called by the master account in the organization or by a delegated admin.</p>
 
 @param request A container for the necessary parameters to execute the DescribePortfolioShareStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribePortfolioShareStatusOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogDescribePortfolioShareStatusInput
 @see AWSServicecatalogDescribePortfolioShareStatusOutput
 */
- (AWSTask<AWSServicecatalogDescribePortfolioShareStatusOutput *> *)describePortfolioShareStatus:(AWSServicecatalogDescribePortfolioShareStatusInput *)request;

/**
 <p>Gets the status of the specified portfolio share operation. This API can only be called by the master account in the organization or by a delegated admin.</p>
 
 @param request A container for the necessary parameters to execute the DescribePortfolioShareStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogDescribePortfolioShareStatusInput
 @see AWSServicecatalogDescribePortfolioShareStatusOutput
 */
- (void)describePortfolioShareStatus:(AWSServicecatalogDescribePortfolioShareStatusInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribePortfolioShareStatusOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified product.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeProductOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDescribeProductInput
 @see AWSServicecatalogDescribeProductOutput
 */
- (AWSTask<AWSServicecatalogDescribeProductOutput *> *)describeProduct:(AWSServicecatalogDescribeProductInput *)request;

/**
 <p>Gets information about the specified product.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDescribeProductInput
 @see AWSServicecatalogDescribeProductOutput
 */
- (void)describeProduct:(AWSServicecatalogDescribeProductInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeProductOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified product. This operation is run with administrator access.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProductAsAdmin service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeProductAsAdminOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDescribeProductAsAdminInput
 @see AWSServicecatalogDescribeProductAsAdminOutput
 */
- (AWSTask<AWSServicecatalogDescribeProductAsAdminOutput *> *)describeProductAsAdmin:(AWSServicecatalogDescribeProductAsAdminInput *)request;

/**
 <p>Gets information about the specified product. This operation is run with administrator access.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProductAsAdmin service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDescribeProductAsAdminInput
 @see AWSServicecatalogDescribeProductAsAdminOutput
 */
- (void)describeProductAsAdmin:(AWSServicecatalogDescribeProductAsAdminInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeProductAsAdminOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified product.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProductView service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeProductViewOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDescribeProductViewInput
 @see AWSServicecatalogDescribeProductViewOutput
 */
- (AWSTask<AWSServicecatalogDescribeProductViewOutput *> *)describeProductView:(AWSServicecatalogDescribeProductViewInput *)request;

/**
 <p>Gets information about the specified product.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProductView service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDescribeProductViewInput
 @see AWSServicecatalogDescribeProductViewOutput
 */
- (void)describeProductView:(AWSServicecatalogDescribeProductViewInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeProductViewOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified provisioned product.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProvisionedProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeProvisionedProductOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeProvisionedProductInput
 @see AWSServicecatalogDescribeProvisionedProductOutput
 */
- (AWSTask<AWSServicecatalogDescribeProvisionedProductOutput *> *)describeProvisionedProduct:(AWSServicecatalogDescribeProvisionedProductInput *)request;

/**
 <p>Gets information about the specified provisioned product.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProvisionedProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeProvisionedProductInput
 @see AWSServicecatalogDescribeProvisionedProductOutput
 */
- (void)describeProvisionedProduct:(AWSServicecatalogDescribeProvisionedProductInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeProvisionedProductOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the resource changes for the specified plan.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProvisionedProductPlan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeProvisionedProductPlanOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDescribeProvisionedProductPlanInput
 @see AWSServicecatalogDescribeProvisionedProductPlanOutput
 */
- (AWSTask<AWSServicecatalogDescribeProvisionedProductPlanOutput *> *)describeProvisionedProductPlan:(AWSServicecatalogDescribeProvisionedProductPlanInput *)request;

/**
 <p>Gets information about the resource changes for the specified plan.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProvisionedProductPlan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDescribeProvisionedProductPlanInput
 @see AWSServicecatalogDescribeProvisionedProductPlanOutput
 */
- (void)describeProvisionedProductPlan:(AWSServicecatalogDescribeProvisionedProductPlanInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeProvisionedProductPlanOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified provisioning artifact (also known as a version) for the specified product.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProvisioningArtifact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeProvisioningArtifactOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDescribeProvisioningArtifactInput
 @see AWSServicecatalogDescribeProvisioningArtifactOutput
 */
- (AWSTask<AWSServicecatalogDescribeProvisioningArtifactOutput *> *)describeProvisioningArtifact:(AWSServicecatalogDescribeProvisioningArtifactInput *)request;

/**
 <p>Gets information about the specified provisioning artifact (also known as a version) for the specified product.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProvisioningArtifact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDescribeProvisioningArtifactInput
 @see AWSServicecatalogDescribeProvisioningArtifactOutput
 */
- (void)describeProvisioningArtifact:(AWSServicecatalogDescribeProvisioningArtifactInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeProvisioningArtifactOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the configuration required to provision the specified product using the specified provisioning artifact.</p><p>If the output contains a TagOption key with an empty list of values, there is a TagOption conflict for that key. The end user cannot take action to fix the conflict, and launch is not blocked. In subsequent calls to <a>ProvisionProduct</a>, do not include conflicted TagOption keys as tags, or this causes the error "Parameter validation failed: Missing required parameter in Tags[<i>N</i>]:<i>Value</i>". Tag the provisioned product with the value <code>sc-tagoption-conflict-portfolioId-productId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProvisioningParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeProvisioningParametersOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeProvisioningParametersInput
 @see AWSServicecatalogDescribeProvisioningParametersOutput
 */
- (AWSTask<AWSServicecatalogDescribeProvisioningParametersOutput *> *)describeProvisioningParameters:(AWSServicecatalogDescribeProvisioningParametersInput *)request;

/**
 <p>Gets information about the configuration required to provision the specified product using the specified provisioning artifact.</p><p>If the output contains a TagOption key with an empty list of values, there is a TagOption conflict for that key. The end user cannot take action to fix the conflict, and launch is not blocked. In subsequent calls to <a>ProvisionProduct</a>, do not include conflicted TagOption keys as tags, or this causes the error "Parameter validation failed: Missing required parameter in Tags[<i>N</i>]:<i>Value</i>". Tag the provisioned product with the value <code>sc-tagoption-conflict-portfolioId-productId</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProvisioningParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeProvisioningParametersInput
 @see AWSServicecatalogDescribeProvisioningParametersOutput
 */
- (void)describeProvisioningParameters:(AWSServicecatalogDescribeProvisioningParametersInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeProvisioningParametersOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified request operation.</p><p>Use this operation after calling a request operation (for example, <a>ProvisionProduct</a>, <a>TerminateProvisionedProduct</a>, or <a>UpdateProvisionedProduct</a>). </p><note><p>If a provisioned product was transferred to a new owner using <a>UpdateProvisionedProductProperties</a>, the new owner will be able to describe all past records for that product. The previous owner will no longer be able to describe the records, but will be able to use <a>ListRecordHistory</a> to see the product's history from when he was the owner.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeRecord service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeRecordOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeRecordInput
 @see AWSServicecatalogDescribeRecordOutput
 */
- (AWSTask<AWSServicecatalogDescribeRecordOutput *> *)describeRecord:(AWSServicecatalogDescribeRecordInput *)request;

/**
 <p>Gets information about the specified request operation.</p><p>Use this operation after calling a request operation (for example, <a>ProvisionProduct</a>, <a>TerminateProvisionedProduct</a>, or <a>UpdateProvisionedProduct</a>). </p><note><p>If a provisioned product was transferred to a new owner using <a>UpdateProvisionedProductProperties</a>, the new owner will be able to describe all past records for that product. The previous owner will no longer be able to describe the records, but will be able to use <a>ListRecordHistory</a> to see the product's history from when he was the owner.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeRecord service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeRecordInput
 @see AWSServicecatalogDescribeRecordOutput
 */
- (void)describeRecord:(AWSServicecatalogDescribeRecordInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeRecordOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a self-service action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeServiceAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeServiceActionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeServiceActionInput
 @see AWSServicecatalogDescribeServiceActionOutput
 */
- (AWSTask<AWSServicecatalogDescribeServiceActionOutput *> *)describeServiceAction:(AWSServicecatalogDescribeServiceActionInput *)request;

/**
 <p>Describes a self-service action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeServiceAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeServiceActionInput
 @see AWSServicecatalogDescribeServiceActionOutput
 */
- (void)describeServiceAction:(AWSServicecatalogDescribeServiceActionInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeServiceActionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Finds the default parameters for a specific self-service action on a specific provisioned product and returns a map of the results to the user.</p>
 
 @param request A container for the necessary parameters to execute the DescribeServiceActionExecutionParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeServiceActionExecutionParametersOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeServiceActionExecutionParametersInput
 @see AWSServicecatalogDescribeServiceActionExecutionParametersOutput
 */
- (AWSTask<AWSServicecatalogDescribeServiceActionExecutionParametersOutput *> *)describeServiceActionExecutionParameters:(AWSServicecatalogDescribeServiceActionExecutionParametersInput *)request;

/**
 <p>Finds the default parameters for a specific self-service action on a specific provisioned product and returns a map of the results to the user.</p>
 
 @param request A container for the necessary parameters to execute the DescribeServiceActionExecutionParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeServiceActionExecutionParametersInput
 @see AWSServicecatalogDescribeServiceActionExecutionParametersOutput
 */
- (void)describeServiceActionExecutionParameters:(AWSServicecatalogDescribeServiceActionExecutionParametersInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeServiceActionExecutionParametersOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the specified TagOption.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTagOption service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDescribeTagOptionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeTagOptionInput
 @see AWSServicecatalogDescribeTagOptionOutput
 */
- (AWSTask<AWSServicecatalogDescribeTagOptionOutput *> *)describeTagOption:(AWSServicecatalogDescribeTagOptionInput *)request;

/**
 <p>Gets information about the specified TagOption.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTagOption service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDescribeTagOptionInput
 @see AWSServicecatalogDescribeTagOptionOutput
 */
- (void)describeTagOption:(AWSServicecatalogDescribeTagOptionInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDescribeTagOptionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disable portfolio sharing through AWS Organizations feature. This feature will not delete your current shares but it will prevent you from creating new shares throughout your organization. Current shares will not be in sync with your organization structure if it changes after calling this API. This API can only be called by the master account in the organization.</p><p>This API can't be invoked if there are active delegated administrators in the organization.</p><p>Note that a delegated administrator is not authorized to invoke <code>DisableAWSOrganizationsAccess</code>.</p>
 
 @param request A container for the necessary parameters to execute the DisableAWSOrganizationsAccess service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDisableAWSOrganizationsAccessOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogDisableAWSOrganizationsAccessInput
 @see AWSServicecatalogDisableAWSOrganizationsAccessOutput
 */
- (AWSTask<AWSServicecatalogDisableAWSOrganizationsAccessOutput *> *)disableAWSOrganizationsAccess:(AWSServicecatalogDisableAWSOrganizationsAccessInput *)request;

/**
 <p>Disable portfolio sharing through AWS Organizations feature. This feature will not delete your current shares but it will prevent you from creating new shares throughout your organization. Current shares will not be in sync with your organization structure if it changes after calling this API. This API can only be called by the master account in the organization.</p><p>This API can't be invoked if there are active delegated administrators in the organization.</p><p>Note that a delegated administrator is not authorized to invoke <code>DisableAWSOrganizationsAccess</code>.</p>
 
 @param request A container for the necessary parameters to execute the DisableAWSOrganizationsAccess service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogDisableAWSOrganizationsAccessInput
 @see AWSServicecatalogDisableAWSOrganizationsAccessOutput
 */
- (void)disableAWSOrganizationsAccess:(AWSServicecatalogDisableAWSOrganizationsAccessInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDisableAWSOrganizationsAccessOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified budget from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateBudgetFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDisassociateBudgetFromResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDisassociateBudgetFromResourceInput
 @see AWSServicecatalogDisassociateBudgetFromResourceOutput
 */
- (AWSTask<AWSServicecatalogDisassociateBudgetFromResourceOutput *> *)disassociateBudgetFromResource:(AWSServicecatalogDisassociateBudgetFromResourceInput *)request;

/**
 <p>Disassociates the specified budget from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateBudgetFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDisassociateBudgetFromResourceInput
 @see AWSServicecatalogDisassociateBudgetFromResourceOutput
 */
- (void)disassociateBudgetFromResource:(AWSServicecatalogDisassociateBudgetFromResourceInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDisassociateBudgetFromResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a previously associated principal ARN from a specified portfolio.</p>
 
 @param request A container for the necessary parameters to execute the DisassociatePrincipalFromPortfolio service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDisassociatePrincipalFromPortfolioOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDisassociatePrincipalFromPortfolioInput
 @see AWSServicecatalogDisassociatePrincipalFromPortfolioOutput
 */
- (AWSTask<AWSServicecatalogDisassociatePrincipalFromPortfolioOutput *> *)disassociatePrincipalFromPortfolio:(AWSServicecatalogDisassociatePrincipalFromPortfolioInput *)request;

/**
 <p>Disassociates a previously associated principal ARN from a specified portfolio.</p>
 
 @param request A container for the necessary parameters to execute the DisassociatePrincipalFromPortfolio service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDisassociatePrincipalFromPortfolioInput
 @see AWSServicecatalogDisassociatePrincipalFromPortfolioOutput
 */
- (void)disassociatePrincipalFromPortfolio:(AWSServicecatalogDisassociatePrincipalFromPortfolioInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDisassociatePrincipalFromPortfolioOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified product from the specified portfolio. </p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateProductFromPortfolio service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDisassociateProductFromPortfolioOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorResourceInUse`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDisassociateProductFromPortfolioInput
 @see AWSServicecatalogDisassociateProductFromPortfolioOutput
 */
- (AWSTask<AWSServicecatalogDisassociateProductFromPortfolioOutput *> *)disassociateProductFromPortfolio:(AWSServicecatalogDisassociateProductFromPortfolioInput *)request;

/**
 <p>Disassociates the specified product from the specified portfolio. </p><p>A delegated admin is authorized to invoke this command.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateProductFromPortfolio service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorResourceInUse`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogDisassociateProductFromPortfolioInput
 @see AWSServicecatalogDisassociateProductFromPortfolioOutput
 */
- (void)disassociateProductFromPortfolio:(AWSServicecatalogDisassociateProductFromPortfolioInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDisassociateProductFromPortfolioOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified self-service action association from the specified provisioning artifact.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateServiceActionFromProvisioningArtifact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactInput
 @see AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput
 */
- (AWSTask<AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput *> *)disassociateServiceActionFromProvisioningArtifact:(AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactInput *)request;

/**
 <p>Disassociates the specified self-service action association from the specified provisioning artifact.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateServiceActionFromProvisioningArtifact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactInput
 @see AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput
 */
- (void)disassociateServiceActionFromProvisioningArtifact:(AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified TagOption from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTagOptionFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogDisassociateTagOptionFromResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDisassociateTagOptionFromResourceInput
 @see AWSServicecatalogDisassociateTagOptionFromResourceOutput
 */
- (AWSTask<AWSServicecatalogDisassociateTagOptionFromResourceOutput *> *)disassociateTagOptionFromResource:(AWSServicecatalogDisassociateTagOptionFromResourceInput *)request;

/**
 <p>Disassociates the specified TagOption from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTagOptionFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogDisassociateTagOptionFromResourceInput
 @see AWSServicecatalogDisassociateTagOptionFromResourceOutput
 */
- (void)disassociateTagOptionFromResource:(AWSServicecatalogDisassociateTagOptionFromResourceInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogDisassociateTagOptionFromResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enable portfolio sharing feature through AWS Organizations. This API will allow Service Catalog to receive updates on your organization in order to sync your shares with the current structure. This API can only be called by the master account in the organization.</p><p>By calling this API Service Catalog will make a call to organizations:EnableAWSServiceAccess on your behalf so that your shares can be in sync with any changes in your AWS Organizations structure.</p><p>Note that a delegated administrator is not authorized to invoke <code>EnableAWSOrganizationsAccess</code>.</p>
 
 @param request A container for the necessary parameters to execute the EnableAWSOrganizationsAccess service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogEnableAWSOrganizationsAccessOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogEnableAWSOrganizationsAccessInput
 @see AWSServicecatalogEnableAWSOrganizationsAccessOutput
 */
- (AWSTask<AWSServicecatalogEnableAWSOrganizationsAccessOutput *> *)enableAWSOrganizationsAccess:(AWSServicecatalogEnableAWSOrganizationsAccessInput *)request;

/**
 <p>Enable portfolio sharing feature through AWS Organizations. This API will allow Service Catalog to receive updates on your organization in order to sync your shares with the current structure. This API can only be called by the master account in the organization.</p><p>By calling this API Service Catalog will make a call to organizations:EnableAWSServiceAccess on your behalf so that your shares can be in sync with any changes in your AWS Organizations structure.</p><p>Note that a delegated administrator is not authorized to invoke <code>EnableAWSOrganizationsAccess</code>.</p>
 
 @param request A container for the necessary parameters to execute the EnableAWSOrganizationsAccess service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogEnableAWSOrganizationsAccessInput
 @see AWSServicecatalogEnableAWSOrganizationsAccessOutput
 */
- (void)enableAWSOrganizationsAccess:(AWSServicecatalogEnableAWSOrganizationsAccessInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogEnableAWSOrganizationsAccessOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provisions or modifies a product based on the resource changes for the specified plan.</p>
 
 @param request A container for the necessary parameters to execute the ExecuteProvisionedProductPlan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogExecuteProvisionedProductPlanOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogExecuteProvisionedProductPlanInput
 @see AWSServicecatalogExecuteProvisionedProductPlanOutput
 */
- (AWSTask<AWSServicecatalogExecuteProvisionedProductPlanOutput *> *)executeProvisionedProductPlan:(AWSServicecatalogExecuteProvisionedProductPlanInput *)request;

/**
 <p>Provisions or modifies a product based on the resource changes for the specified plan.</p>
 
 @param request A container for the necessary parameters to execute the ExecuteProvisionedProductPlan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogExecuteProvisionedProductPlanInput
 @see AWSServicecatalogExecuteProvisionedProductPlanOutput
 */
- (void)executeProvisionedProductPlan:(AWSServicecatalogExecuteProvisionedProductPlanInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogExecuteProvisionedProductPlanOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Executes a self-service action against a provisioned product.</p>
 
 @param request A container for the necessary parameters to execute the ExecuteProvisionedProductServiceAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogExecuteProvisionedProductServiceActionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogExecuteProvisionedProductServiceActionInput
 @see AWSServicecatalogExecuteProvisionedProductServiceActionOutput
 */
- (AWSTask<AWSServicecatalogExecuteProvisionedProductServiceActionOutput *> *)executeProvisionedProductServiceAction:(AWSServicecatalogExecuteProvisionedProductServiceActionInput *)request;

/**
 <p>Executes a self-service action against a provisioned product.</p>
 
 @param request A container for the necessary parameters to execute the ExecuteProvisionedProductServiceAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogExecuteProvisionedProductServiceActionInput
 @see AWSServicecatalogExecuteProvisionedProductServiceActionOutput
 */
- (void)executeProvisionedProductServiceAction:(AWSServicecatalogExecuteProvisionedProductServiceActionInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogExecuteProvisionedProductServiceActionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the Access Status for AWS Organization portfolio share feature. This API can only be called by the master account in the organization or by a delegated admin.</p>
 
 @param request A container for the necessary parameters to execute the GetAWSOrganizationsAccessStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogGetAWSOrganizationsAccessStatusOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogGetAWSOrganizationsAccessStatusInput
 @see AWSServicecatalogGetAWSOrganizationsAccessStatusOutput
 */
- (AWSTask<AWSServicecatalogGetAWSOrganizationsAccessStatusOutput *> *)getAWSOrganizationsAccessStatus:(AWSServicecatalogGetAWSOrganizationsAccessStatusInput *)request;

/**
 <p>Get the Access Status for AWS Organization portfolio share feature. This API can only be called by the master account in the organization or by a delegated admin.</p>
 
 @param request A container for the necessary parameters to execute the GetAWSOrganizationsAccessStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogGetAWSOrganizationsAccessStatusInput
 @see AWSServicecatalogGetAWSOrganizationsAccessStatusOutput
 */
- (void)getAWSOrganizationsAccessStatus:(AWSServicecatalogGetAWSOrganizationsAccessStatusInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogGetAWSOrganizationsAccessStatusOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all portfolios for which sharing was accepted by this account.</p>
 
 @param request A container for the necessary parameters to execute the ListAcceptedPortfolioShares service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListAcceptedPortfolioSharesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogListAcceptedPortfolioSharesInput
 @see AWSServicecatalogListAcceptedPortfolioSharesOutput
 */
- (AWSTask<AWSServicecatalogListAcceptedPortfolioSharesOutput *> *)listAcceptedPortfolioShares:(AWSServicecatalogListAcceptedPortfolioSharesInput *)request;

/**
 <p>Lists all portfolios for which sharing was accepted by this account.</p>
 
 @param request A container for the necessary parameters to execute the ListAcceptedPortfolioShares service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogListAcceptedPortfolioSharesInput
 @see AWSServicecatalogListAcceptedPortfolioSharesOutput
 */
- (void)listAcceptedPortfolioShares:(AWSServicecatalogListAcceptedPortfolioSharesInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListAcceptedPortfolioSharesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the budgets associated to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListBudgetsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListBudgetsForResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListBudgetsForResourceInput
 @see AWSServicecatalogListBudgetsForResourceOutput
 */
- (AWSTask<AWSServicecatalogListBudgetsForResourceOutput *> *)listBudgetsForResource:(AWSServicecatalogListBudgetsForResourceInput *)request;

/**
 <p>Lists all the budgets associated to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListBudgetsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListBudgetsForResourceInput
 @see AWSServicecatalogListBudgetsForResourceOutput
 */
- (void)listBudgetsForResource:(AWSServicecatalogListBudgetsForResourceInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListBudgetsForResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the constraints for the specified portfolio and product.</p>
 
 @param request A container for the necessary parameters to execute the ListConstraintsForPortfolio service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListConstraintsForPortfolioOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListConstraintsForPortfolioInput
 @see AWSServicecatalogListConstraintsForPortfolioOutput
 */
- (AWSTask<AWSServicecatalogListConstraintsForPortfolioOutput *> *)listConstraintsForPortfolio:(AWSServicecatalogListConstraintsForPortfolioInput *)request;

/**
 <p>Lists the constraints for the specified portfolio and product.</p>
 
 @param request A container for the necessary parameters to execute the ListConstraintsForPortfolio service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListConstraintsForPortfolioInput
 @see AWSServicecatalogListConstraintsForPortfolioOutput
 */
- (void)listConstraintsForPortfolio:(AWSServicecatalogListConstraintsForPortfolioInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListConstraintsForPortfolioOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the paths to the specified product. A path is how the user has access to a specified product, and is necessary when provisioning a product. A path also determines the constraints put on the product.</p>
 
 @param request A container for the necessary parameters to execute the ListLaunchPaths service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListLaunchPathsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogListLaunchPathsInput
 @see AWSServicecatalogListLaunchPathsOutput
 */
- (AWSTask<AWSServicecatalogListLaunchPathsOutput *> *)listLaunchPaths:(AWSServicecatalogListLaunchPathsInput *)request;

/**
 <p>Lists the paths to the specified product. A path is how the user has access to a specified product, and is necessary when provisioning a product. A path also determines the constraints put on the product.</p>
 
 @param request A container for the necessary parameters to execute the ListLaunchPaths service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogListLaunchPathsInput
 @see AWSServicecatalogListLaunchPathsOutput
 */
- (void)listLaunchPaths:(AWSServicecatalogListLaunchPathsInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListLaunchPathsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the organization nodes that have access to the specified portfolio. This API can only be called by the master account in the organization or by a delegated admin.</p><p>If a delegated admin is de-registered, they can no longer perform this operation.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizationPortfolioAccess service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListOrganizationPortfolioAccessOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogListOrganizationPortfolioAccessInput
 @see AWSServicecatalogListOrganizationPortfolioAccessOutput
 */
- (AWSTask<AWSServicecatalogListOrganizationPortfolioAccessOutput *> *)listOrganizationPortfolioAccess:(AWSServicecatalogListOrganizationPortfolioAccessInput *)request;

/**
 <p>Lists the organization nodes that have access to the specified portfolio. This API can only be called by the master account in the organization or by a delegated admin.</p><p>If a delegated admin is de-registered, they can no longer perform this operation.</p>
 
 @param request A container for the necessary parameters to execute the ListOrganizationPortfolioAccess service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorOperationNotSupported`.
 
 @see AWSServicecatalogListOrganizationPortfolioAccessInput
 @see AWSServicecatalogListOrganizationPortfolioAccessOutput
 */
- (void)listOrganizationPortfolioAccess:(AWSServicecatalogListOrganizationPortfolioAccessInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListOrganizationPortfolioAccessOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the account IDs that have access to the specified portfolio.</p><p>A delegated admin can list the accounts that have access to the shared portfolio. Note that if a delegated admin is de-registered, they can no longer perform this operation.</p>
 
 @param request A container for the necessary parameters to execute the ListPortfolioAccess service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListPortfolioAccessOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListPortfolioAccessInput
 @see AWSServicecatalogListPortfolioAccessOutput
 */
- (AWSTask<AWSServicecatalogListPortfolioAccessOutput *> *)listPortfolioAccess:(AWSServicecatalogListPortfolioAccessInput *)request;

/**
 <p>Lists the account IDs that have access to the specified portfolio.</p><p>A delegated admin can list the accounts that have access to the shared portfolio. Note that if a delegated admin is de-registered, they can no longer perform this operation.</p>
 
 @param request A container for the necessary parameters to execute the ListPortfolioAccess service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListPortfolioAccessInput
 @see AWSServicecatalogListPortfolioAccessOutput
 */
- (void)listPortfolioAccess:(AWSServicecatalogListPortfolioAccessInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListPortfolioAccessOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all portfolios in the catalog.</p>
 
 @param request A container for the necessary parameters to execute the ListPortfolios service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListPortfoliosOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListPortfoliosInput
 @see AWSServicecatalogListPortfoliosOutput
 */
- (AWSTask<AWSServicecatalogListPortfoliosOutput *> *)listPortfolios:(AWSServicecatalogListPortfoliosInput *)request;

/**
 <p>Lists all portfolios in the catalog.</p>
 
 @param request A container for the necessary parameters to execute the ListPortfolios service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListPortfoliosInput
 @see AWSServicecatalogListPortfoliosOutput
 */
- (void)listPortfolios:(AWSServicecatalogListPortfoliosInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListPortfoliosOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all portfolios that the specified product is associated with.</p>
 
 @param request A container for the necessary parameters to execute the ListPortfoliosForProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListPortfoliosForProductOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogListPortfoliosForProductInput
 @see AWSServicecatalogListPortfoliosForProductOutput
 */
- (AWSTask<AWSServicecatalogListPortfoliosForProductOutput *> *)listPortfoliosForProduct:(AWSServicecatalogListPortfoliosForProductInput *)request;

/**
 <p>Lists all portfolios that the specified product is associated with.</p>
 
 @param request A container for the necessary parameters to execute the ListPortfoliosForProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogListPortfoliosForProductInput
 @see AWSServicecatalogListPortfoliosForProductOutput
 */
- (void)listPortfoliosForProduct:(AWSServicecatalogListPortfoliosForProductInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListPortfoliosForProductOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all principal ARNs associated with the specified portfolio.</p>
 
 @param request A container for the necessary parameters to execute the ListPrincipalsForPortfolio service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListPrincipalsForPortfolioOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListPrincipalsForPortfolioInput
 @see AWSServicecatalogListPrincipalsForPortfolioOutput
 */
- (AWSTask<AWSServicecatalogListPrincipalsForPortfolioOutput *> *)listPrincipalsForPortfolio:(AWSServicecatalogListPrincipalsForPortfolioInput *)request;

/**
 <p>Lists all principal ARNs associated with the specified portfolio.</p>
 
 @param request A container for the necessary parameters to execute the ListPrincipalsForPortfolio service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListPrincipalsForPortfolioInput
 @see AWSServicecatalogListPrincipalsForPortfolioOutput
 */
- (void)listPrincipalsForPortfolio:(AWSServicecatalogListPrincipalsForPortfolioInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListPrincipalsForPortfolioOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the plans for the specified provisioned product or all plans to which the user has access.</p>
 
 @param request A container for the necessary parameters to execute the ListProvisionedProductPlans service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListProvisionedProductPlansOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListProvisionedProductPlansInput
 @see AWSServicecatalogListProvisionedProductPlansOutput
 */
- (AWSTask<AWSServicecatalogListProvisionedProductPlansOutput *> *)listProvisionedProductPlans:(AWSServicecatalogListProvisionedProductPlansInput *)request;

/**
 <p>Lists the plans for the specified provisioned product or all plans to which the user has access.</p>
 
 @param request A container for the necessary parameters to execute the ListProvisionedProductPlans service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListProvisionedProductPlansInput
 @see AWSServicecatalogListProvisionedProductPlansOutput
 */
- (void)listProvisionedProductPlans:(AWSServicecatalogListProvisionedProductPlansInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListProvisionedProductPlansOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all provisioning artifacts (also known as versions) for the specified product.</p>
 
 @param request A container for the necessary parameters to execute the ListProvisioningArtifacts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListProvisioningArtifactsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListProvisioningArtifactsInput
 @see AWSServicecatalogListProvisioningArtifactsOutput
 */
- (AWSTask<AWSServicecatalogListProvisioningArtifactsOutput *> *)listProvisioningArtifacts:(AWSServicecatalogListProvisioningArtifactsInput *)request;

/**
 <p>Lists all provisioning artifacts (also known as versions) for the specified product.</p>
 
 @param request A container for the necessary parameters to execute the ListProvisioningArtifacts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListProvisioningArtifactsInput
 @see AWSServicecatalogListProvisioningArtifactsOutput
 */
- (void)listProvisioningArtifacts:(AWSServicecatalogListProvisioningArtifactsInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListProvisioningArtifactsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all provisioning artifacts (also known as versions) for the specified self-service action.</p>
 
 @param request A container for the necessary parameters to execute the ListProvisioningArtifactsForServiceAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListProvisioningArtifactsForServiceActionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListProvisioningArtifactsForServiceActionInput
 @see AWSServicecatalogListProvisioningArtifactsForServiceActionOutput
 */
- (AWSTask<AWSServicecatalogListProvisioningArtifactsForServiceActionOutput *> *)listProvisioningArtifactsForServiceAction:(AWSServicecatalogListProvisioningArtifactsForServiceActionInput *)request;

/**
 <p>Lists all provisioning artifacts (also known as versions) for the specified self-service action.</p>
 
 @param request A container for the necessary parameters to execute the ListProvisioningArtifactsForServiceAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListProvisioningArtifactsForServiceActionInput
 @see AWSServicecatalogListProvisioningArtifactsForServiceActionOutput
 */
- (void)listProvisioningArtifactsForServiceAction:(AWSServicecatalogListProvisioningArtifactsForServiceActionInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListProvisioningArtifactsForServiceActionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the specified requests or all performed requests.</p>
 
 @param request A container for the necessary parameters to execute the ListRecordHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListRecordHistoryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListRecordHistoryInput
 @see AWSServicecatalogListRecordHistoryOutput
 */
- (AWSTask<AWSServicecatalogListRecordHistoryOutput *> *)listRecordHistory:(AWSServicecatalogListRecordHistoryInput *)request;

/**
 <p>Lists the specified requests or all performed requests.</p>
 
 @param request A container for the necessary parameters to execute the ListRecordHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListRecordHistoryInput
 @see AWSServicecatalogListRecordHistoryOutput
 */
- (void)listRecordHistory:(AWSServicecatalogListRecordHistoryInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListRecordHistoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the resources associated with the specified TagOption.</p>
 
 @param request A container for the necessary parameters to execute the ListResourcesForTagOption service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListResourcesForTagOptionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListResourcesForTagOptionInput
 @see AWSServicecatalogListResourcesForTagOptionOutput
 */
- (AWSTask<AWSServicecatalogListResourcesForTagOptionOutput *> *)listResourcesForTagOption:(AWSServicecatalogListResourcesForTagOptionInput *)request;

/**
 <p>Lists the resources associated with the specified TagOption.</p>
 
 @param request A container for the necessary parameters to execute the ListResourcesForTagOption service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListResourcesForTagOptionInput
 @see AWSServicecatalogListResourcesForTagOptionOutput
 */
- (void)listResourcesForTagOption:(AWSServicecatalogListResourcesForTagOptionInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListResourcesForTagOptionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all self-service actions.</p>
 
 @param request A container for the necessary parameters to execute the ListServiceActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListServiceActionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListServiceActionsInput
 @see AWSServicecatalogListServiceActionsOutput
 */
- (AWSTask<AWSServicecatalogListServiceActionsOutput *> *)listServiceActions:(AWSServicecatalogListServiceActionsInput *)request;

/**
 <p>Lists all self-service actions.</p>
 
 @param request A container for the necessary parameters to execute the ListServiceActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListServiceActionsInput
 @see AWSServicecatalogListServiceActionsOutput
 */
- (void)listServiceActions:(AWSServicecatalogListServiceActionsInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListServiceActionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a paginated list of self-service actions associated with the specified Product ID and Provisioning Artifact ID.</p>
 
 @param request A container for the necessary parameters to execute the ListServiceActionsForProvisioningArtifact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListServiceActionsForProvisioningArtifactOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListServiceActionsForProvisioningArtifactInput
 @see AWSServicecatalogListServiceActionsForProvisioningArtifactOutput
 */
- (AWSTask<AWSServicecatalogListServiceActionsForProvisioningArtifactOutput *> *)listServiceActionsForProvisioningArtifact:(AWSServicecatalogListServiceActionsForProvisioningArtifactInput *)request;

/**
 <p>Returns a paginated list of self-service actions associated with the specified Product ID and Provisioning Artifact ID.</p>
 
 @param request A container for the necessary parameters to execute the ListServiceActionsForProvisioningArtifact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListServiceActionsForProvisioningArtifactInput
 @see AWSServicecatalogListServiceActionsForProvisioningArtifactOutput
 */
- (void)listServiceActionsForProvisioningArtifact:(AWSServicecatalogListServiceActionsForProvisioningArtifactInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListServiceActionsForProvisioningArtifactOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns summary information about stack instances that are associated with the specified <code>CFN_STACKSET</code> type provisioned product. You can filter for stack instances that are associated with a specific AWS account name or region. </p>
 
 @param request A container for the necessary parameters to execute the ListStackInstancesForProvisionedProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListStackInstancesForProvisionedProductOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogListStackInstancesForProvisionedProductInput
 @see AWSServicecatalogListStackInstancesForProvisionedProductOutput
 */
- (AWSTask<AWSServicecatalogListStackInstancesForProvisionedProductOutput *> *)listStackInstancesForProvisionedProduct:(AWSServicecatalogListStackInstancesForProvisionedProductInput *)request;

/**
 <p>Returns summary information about stack instances that are associated with the specified <code>CFN_STACKSET</code> type provisioned product. You can filter for stack instances that are associated with a specific AWS account name or region. </p>
 
 @param request A container for the necessary parameters to execute the ListStackInstancesForProvisionedProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogListStackInstancesForProvisionedProductInput
 @see AWSServicecatalogListStackInstancesForProvisionedProductOutput
 */
- (void)listStackInstancesForProvisionedProduct:(AWSServicecatalogListStackInstancesForProvisionedProductInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListStackInstancesForProvisionedProductOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the specified TagOptions or all TagOptions.</p>
 
 @param request A container for the necessary parameters to execute the ListTagOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogListTagOptionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListTagOptionsInput
 @see AWSServicecatalogListTagOptionsOutput
 */
- (AWSTask<AWSServicecatalogListTagOptionsOutput *> *)listTagOptions:(AWSServicecatalogListTagOptionsInput *)request;

/**
 <p>Lists the specified TagOptions or all TagOptions.</p>
 
 @param request A container for the necessary parameters to execute the ListTagOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogListTagOptionsInput
 @see AWSServicecatalogListTagOptionsOutput
 */
- (void)listTagOptions:(AWSServicecatalogListTagOptionsInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogListTagOptionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provisions the specified product.</p><p>A provisioned product is a resourced instance of a product. For example, provisioning a product based on a CloudFormation template launches a CloudFormation stack and its underlying resources. You can check the status of this request using <a>DescribeRecord</a>.</p><p>If the request contains a tag key with an empty list of values, there is a tag conflict for that key. Do not include conflicted keys as tags, or this causes the error "Parameter validation failed: Missing required parameter in Tags[<i>N</i>]:<i>Value</i>".</p>
 
 @param request A container for the necessary parameters to execute the ProvisionProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogProvisionProductOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorDuplicateResource`.
 
 @see AWSServicecatalogProvisionProductInput
 @see AWSServicecatalogProvisionProductOutput
 */
- (AWSTask<AWSServicecatalogProvisionProductOutput *> *)provisionProduct:(AWSServicecatalogProvisionProductInput *)request;

/**
 <p>Provisions the specified product.</p><p>A provisioned product is a resourced instance of a product. For example, provisioning a product based on a CloudFormation template launches a CloudFormation stack and its underlying resources. You can check the status of this request using <a>DescribeRecord</a>.</p><p>If the request contains a tag key with an empty list of values, there is a tag conflict for that key. Do not include conflicted keys as tags, or this causes the error "Parameter validation failed: Missing required parameter in Tags[<i>N</i>]:<i>Value</i>".</p>
 
 @param request A container for the necessary parameters to execute the ProvisionProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorDuplicateResource`.
 
 @see AWSServicecatalogProvisionProductInput
 @see AWSServicecatalogProvisionProductOutput
 */
- (void)provisionProduct:(AWSServicecatalogProvisionProductInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogProvisionProductOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Rejects an offer to share the specified portfolio.</p>
 
 @param request A container for the necessary parameters to execute the RejectPortfolioShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogRejectPortfolioShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogRejectPortfolioShareInput
 @see AWSServicecatalogRejectPortfolioShareOutput
 */
- (AWSTask<AWSServicecatalogRejectPortfolioShareOutput *> *)rejectPortfolioShare:(AWSServicecatalogRejectPortfolioShareInput *)request;

/**
 <p>Rejects an offer to share the specified portfolio.</p>
 
 @param request A container for the necessary parameters to execute the RejectPortfolioShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogRejectPortfolioShareInput
 @see AWSServicecatalogRejectPortfolioShareOutput
 */
- (void)rejectPortfolioShare:(AWSServicecatalogRejectPortfolioShareInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogRejectPortfolioShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the provisioned products that are available (not terminated).</p><p>To use additional filtering, see <a>SearchProvisionedProducts</a>.</p>
 
 @param request A container for the necessary parameters to execute the ScanProvisionedProducts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogScanProvisionedProductsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogScanProvisionedProductsInput
 @see AWSServicecatalogScanProvisionedProductsOutput
 */
- (AWSTask<AWSServicecatalogScanProvisionedProductsOutput *> *)scanProvisionedProducts:(AWSServicecatalogScanProvisionedProductsInput *)request;

/**
 <p>Lists the provisioned products that are available (not terminated).</p><p>To use additional filtering, see <a>SearchProvisionedProducts</a>.</p>
 
 @param request A container for the necessary parameters to execute the ScanProvisionedProducts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogScanProvisionedProductsInput
 @see AWSServicecatalogScanProvisionedProductsOutput
 */
- (void)scanProvisionedProducts:(AWSServicecatalogScanProvisionedProductsInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogScanProvisionedProductsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the products to which the caller has access.</p>
 
 @param request A container for the necessary parameters to execute the SearchProducts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogSearchProductsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogSearchProductsInput
 @see AWSServicecatalogSearchProductsOutput
 */
- (AWSTask<AWSServicecatalogSearchProductsOutput *> *)searchProducts:(AWSServicecatalogSearchProductsInput *)request;

/**
 <p>Gets information about the products to which the caller has access.</p>
 
 @param request A container for the necessary parameters to execute the SearchProducts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogSearchProductsInput
 @see AWSServicecatalogSearchProductsOutput
 */
- (void)searchProducts:(AWSServicecatalogSearchProductsInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogSearchProductsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the products for the specified portfolio or all products.</p>
 
 @param request A container for the necessary parameters to execute the SearchProductsAsAdmin service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogSearchProductsAsAdminOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogSearchProductsAsAdminInput
 @see AWSServicecatalogSearchProductsAsAdminOutput
 */
- (AWSTask<AWSServicecatalogSearchProductsAsAdminOutput *> *)searchProductsAsAdmin:(AWSServicecatalogSearchProductsAsAdminInput *)request;

/**
 <p>Gets information about the products for the specified portfolio or all products.</p>
 
 @param request A container for the necessary parameters to execute the SearchProductsAsAdmin service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogSearchProductsAsAdminInput
 @see AWSServicecatalogSearchProductsAsAdminOutput
 */
- (void)searchProductsAsAdmin:(AWSServicecatalogSearchProductsAsAdminInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogSearchProductsAsAdminOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the provisioned products that meet the specified criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchProvisionedProducts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogSearchProvisionedProductsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogSearchProvisionedProductsInput
 @see AWSServicecatalogSearchProvisionedProductsOutput
 */
- (AWSTask<AWSServicecatalogSearchProvisionedProductsOutput *> *)searchProvisionedProducts:(AWSServicecatalogSearchProvisionedProductsInput *)request;

/**
 <p>Gets information about the provisioned products that meet the specified criteria.</p>
 
 @param request A container for the necessary parameters to execute the SearchProvisionedProducts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogSearchProvisionedProductsInput
 @see AWSServicecatalogSearchProvisionedProductsOutput
 */
- (void)searchProvisionedProducts:(AWSServicecatalogSearchProvisionedProductsInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogSearchProvisionedProductsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Terminates the specified provisioned product.</p><p>This operation does not delete any records associated with the provisioned product.</p><p>You can check the status of this request using <a>DescribeRecord</a>.</p>
 
 @param request A container for the necessary parameters to execute the TerminateProvisionedProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogTerminateProvisionedProductOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogTerminateProvisionedProductInput
 @see AWSServicecatalogTerminateProvisionedProductOutput
 */
- (AWSTask<AWSServicecatalogTerminateProvisionedProductOutput *> *)terminateProvisionedProduct:(AWSServicecatalogTerminateProvisionedProductInput *)request;

/**
 <p>Terminates the specified provisioned product.</p><p>This operation does not delete any records associated with the provisioned product.</p><p>You can check the status of this request using <a>DescribeRecord</a>.</p>
 
 @param request A container for the necessary parameters to execute the TerminateProvisionedProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogTerminateProvisionedProductInput
 @see AWSServicecatalogTerminateProvisionedProductOutput
 */
- (void)terminateProvisionedProduct:(AWSServicecatalogTerminateProvisionedProductInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogTerminateProvisionedProductOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified constraint.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConstraint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogUpdateConstraintOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogUpdateConstraintInput
 @see AWSServicecatalogUpdateConstraintOutput
 */
- (AWSTask<AWSServicecatalogUpdateConstraintOutput *> *)updateConstraint:(AWSServicecatalogUpdateConstraintInput *)request;

/**
 <p>Updates the specified constraint.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConstraint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogUpdateConstraintInput
 @see AWSServicecatalogUpdateConstraintOutput
 */
- (void)updateConstraint:(AWSServicecatalogUpdateConstraintInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogUpdateConstraintOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified portfolio.</p><p>You cannot update a product that was shared with you.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePortfolio service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogUpdatePortfolioOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogUpdatePortfolioInput
 @see AWSServicecatalogUpdatePortfolioOutput
 */
- (AWSTask<AWSServicecatalogUpdatePortfolioOutput *> *)updatePortfolio:(AWSServicecatalogUpdatePortfolioInput *)request;

/**
 <p>Updates the specified portfolio.</p><p>You cannot update a product that was shared with you.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePortfolio service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorLimitExceeded`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogUpdatePortfolioInput
 @see AWSServicecatalogUpdatePortfolioOutput
 */
- (void)updatePortfolio:(AWSServicecatalogUpdatePortfolioInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogUpdatePortfolioOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified product.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogUpdateProductOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogUpdateProductInput
 @see AWSServicecatalogUpdateProductOutput
 */
- (AWSTask<AWSServicecatalogUpdateProductOutput *> *)updateProduct:(AWSServicecatalogUpdateProductInput *)request;

/**
 <p>Updates the specified product.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorTagOptionNotMigrated`.
 
 @see AWSServicecatalogUpdateProductInput
 @see AWSServicecatalogUpdateProductOutput
 */
- (void)updateProduct:(AWSServicecatalogUpdateProductInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogUpdateProductOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Requests updates to the configuration of the specified provisioned product.</p><p>If there are tags associated with the object, they cannot be updated or added. Depending on the specific updates requested, this operation can update with no interruption, with some interruption, or replace the provisioned product entirely.</p><p>You can check the status of this request using <a>DescribeRecord</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProvisionedProduct service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogUpdateProvisionedProductOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogUpdateProvisionedProductInput
 @see AWSServicecatalogUpdateProvisionedProductOutput
 */
- (AWSTask<AWSServicecatalogUpdateProvisionedProductOutput *> *)updateProvisionedProduct:(AWSServicecatalogUpdateProvisionedProductInput *)request;

/**
 <p>Requests updates to the configuration of the specified provisioned product.</p><p>If there are tags associated with the object, they cannot be updated or added. Depending on the specific updates requested, this operation can update with no interruption, with some interruption, or replace the provisioned product entirely.</p><p>You can check the status of this request using <a>DescribeRecord</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProvisionedProduct service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`.
 
 @see AWSServicecatalogUpdateProvisionedProductInput
 @see AWSServicecatalogUpdateProvisionedProductOutput
 */
- (void)updateProvisionedProduct:(AWSServicecatalogUpdateProvisionedProductInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogUpdateProvisionedProductOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Requests updates to the properties of the specified provisioned product.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProvisionedProductProperties service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogUpdateProvisionedProductPropertiesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogUpdateProvisionedProductPropertiesInput
 @see AWSServicecatalogUpdateProvisionedProductPropertiesOutput
 */
- (AWSTask<AWSServicecatalogUpdateProvisionedProductPropertiesOutput *> *)updateProvisionedProductProperties:(AWSServicecatalogUpdateProvisionedProductPropertiesInput *)request;

/**
 <p>Requests updates to the properties of the specified provisioned product.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProvisionedProductProperties service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorInvalidParameters`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidState`.
 
 @see AWSServicecatalogUpdateProvisionedProductPropertiesInput
 @see AWSServicecatalogUpdateProvisionedProductPropertiesOutput
 */
- (void)updateProvisionedProductProperties:(AWSServicecatalogUpdateProvisionedProductPropertiesInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogUpdateProvisionedProductPropertiesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified provisioning artifact (also known as a version) for the specified product.</p><p>You cannot update a provisioning artifact for a product that was shared with you.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProvisioningArtifact service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogUpdateProvisioningArtifactOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogUpdateProvisioningArtifactInput
 @see AWSServicecatalogUpdateProvisioningArtifactOutput
 */
- (AWSTask<AWSServicecatalogUpdateProvisioningArtifactOutput *> *)updateProvisioningArtifact:(AWSServicecatalogUpdateProvisioningArtifactInput *)request;

/**
 <p>Updates the specified provisioning artifact (also known as a version) for the specified product.</p><p>You cannot update a provisioning artifact for a product that was shared with you.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProvisioningArtifact service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogUpdateProvisioningArtifactInput
 @see AWSServicecatalogUpdateProvisioningArtifactOutput
 */
- (void)updateProvisioningArtifact:(AWSServicecatalogUpdateProvisioningArtifactInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogUpdateProvisioningArtifactOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a self-service action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateServiceAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogUpdateServiceActionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogUpdateServiceActionInput
 @see AWSServicecatalogUpdateServiceActionOutput
 */
- (AWSTask<AWSServicecatalogUpdateServiceActionOutput *> *)updateServiceAction:(AWSServicecatalogUpdateServiceActionInput *)request;

/**
 <p>Updates a self-service action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateServiceAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogUpdateServiceActionInput
 @see AWSServicecatalogUpdateServiceActionOutput
 */
- (void)updateServiceAction:(AWSServicecatalogUpdateServiceActionInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogUpdateServiceActionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified TagOption.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTagOption service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSServicecatalogUpdateTagOptionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorDuplicateResource`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogUpdateTagOptionInput
 @see AWSServicecatalogUpdateTagOptionOutput
 */
- (AWSTask<AWSServicecatalogUpdateTagOptionOutput *> *)updateTagOption:(AWSServicecatalogUpdateTagOptionInput *)request;

/**
 <p>Updates the specified TagOption.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTagOption service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSServicecatalogErrorDomain` domain and the following error code: `AWSServicecatalogErrorTagOptionNotMigrated`, `AWSServicecatalogErrorResourceNotFound`, `AWSServicecatalogErrorDuplicateResource`, `AWSServicecatalogErrorInvalidParameters`.
 
 @see AWSServicecatalogUpdateTagOptionInput
 @see AWSServicecatalogUpdateTagOptionOutput
 */
- (void)updateTagOption:(AWSServicecatalogUpdateTagOptionInput *)request completionHandler:(void (^ _Nullable)(AWSServicecatalogUpdateTagOptionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
