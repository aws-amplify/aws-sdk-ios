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
#import "AWSiotsitewiseModel.h"
#import "AWSiotsitewiseResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSiotsitewise
FOUNDATION_EXPORT NSString *const AWSiotsitewiseSDKVersion;

/**
 <p>Welcome to the AWS IoT SiteWise API Reference. AWS IoT SiteWise is an AWS service that connects <a href="https://en.wikipedia.org/wiki/Internet_of_things#Industrial_applications">Industrial Internet of Things (IIoT)</a> devices to the power of the AWS Cloud. For more information, see the <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/">AWS IoT SiteWise User Guide</a>. For information about AWS IoT SiteWise quotas, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@interface AWSiotsitewise : AWSService

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

     let iotsitewise = AWSiotsitewise.default()

 *Objective-C*

     AWSiotsitewise *iotsitewise = [AWSiotsitewise defaultiotsitewise];

 @return The default service client.
 */
+ (instancetype)defaultiotsitewise;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSiotsitewise.register(with: configuration!, forKey: "USWest2iotsitewise")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:@"USWest2iotsitewise"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let iotsitewise = AWSiotsitewise(forKey: "USWest2iotsitewise")

 *Objective-C*

     AWSiotsitewise *iotsitewise = [AWSiotsitewise iotsitewiseForKey:@"USWest2iotsitewise"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registeriotsitewiseWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registeriotsitewiseWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSiotsitewise.register(with: configuration!, forKey: "USWest2iotsitewise")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:@"USWest2iotsitewise"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let iotsitewise = AWSiotsitewise(forKey: "USWest2iotsitewise")

 *Objective-C*

     AWSiotsitewise *iotsitewise = [AWSiotsitewise iotsitewiseForKey:@"USWest2iotsitewise"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)iotsitewiseForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeiotsitewiseForKey:(NSString *)key;

/**
 <p>Associates a child asset with the given parent asset through a hierarchy defined in the parent asset's model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/add-associated-assets.html">Associating Assets</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorLimitExceeded`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseAssociateAssetsRequest
 */
- (AWSTask *)associateAssets:(AWSiotsitewiseAssociateAssetsRequest *)request;

/**
 <p>Associates a child asset with the given parent asset through a hierarchy defined in the parent asset's model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/add-associated-assets.html">Associating Assets</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorLimitExceeded`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseAssociateAssetsRequest
 */
- (void)associateAssets:(AWSiotsitewiseAssociateAssetsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates a group (batch) of assets with an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the BatchAssociateProjectAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseBatchAssociateProjectAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseBatchAssociateProjectAssetsRequest
 @see AWSiotsitewiseBatchAssociateProjectAssetsResponse
 */
- (AWSTask<AWSiotsitewiseBatchAssociateProjectAssetsResponse *> *)batchAssociateProjectAssets:(AWSiotsitewiseBatchAssociateProjectAssetsRequest *)request;

/**
 <p>Associates a group (batch) of assets with an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the BatchAssociateProjectAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseBatchAssociateProjectAssetsRequest
 @see AWSiotsitewiseBatchAssociateProjectAssetsResponse
 */
- (void)batchAssociateProjectAssets:(AWSiotsitewiseBatchAssociateProjectAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseBatchAssociateProjectAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a group (batch) of assets from an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisassociateProjectAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseBatchDisassociateProjectAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseBatchDisassociateProjectAssetsRequest
 @see AWSiotsitewiseBatchDisassociateProjectAssetsResponse
 */
- (AWSTask<AWSiotsitewiseBatchDisassociateProjectAssetsResponse *> *)batchDisassociateProjectAssets:(AWSiotsitewiseBatchDisassociateProjectAssetsRequest *)request;

/**
 <p>Disassociates a group (batch) of assets from an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisassociateProjectAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseBatchDisassociateProjectAssetsRequest
 @see AWSiotsitewiseBatchDisassociateProjectAssetsResponse
 */
- (void)batchDisassociateProjectAssets:(AWSiotsitewiseBatchDisassociateProjectAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseBatchDisassociateProjectAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a list of asset property values to AWS IoT SiteWise. Each value is a timestamp-quality-value (TQV) data point. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/ingest-api.html">Ingesting Data Using the API</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul><important><p>With respect to Unix epoch time, AWS IoT SiteWise accepts only TQVs that have a timestamp of no more than 15 minutes in the past and no more than 5 minutes in the future. AWS IoT SiteWise rejects timestamps outside of the inclusive range of [-15, +5] minutes and returns a <code>TimestampOutOfRangeException</code> error.</p><p>For each asset property, AWS IoT SiteWise overwrites TQVs with duplicate timestamps unless the newer TQV has a different quality. For example, if you store a TQV <code>{T1, GOOD, V1}</code>, then storing <code>{T1, GOOD, V2}</code> replaces the existing TQV.</p></important>
 
 @param request A container for the necessary parameters to execute the BatchPutAssetPropertyValue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseBatchPutAssetPropertyValueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`, `AWSiotsitewiseErrorServiceUnavailable`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseBatchPutAssetPropertyValueRequest
 @see AWSiotsitewiseBatchPutAssetPropertyValueResponse
 */
- (AWSTask<AWSiotsitewiseBatchPutAssetPropertyValueResponse *> *)batchPutAssetPropertyValue:(AWSiotsitewiseBatchPutAssetPropertyValueRequest *)request;

/**
 <p>Sends a list of asset property values to AWS IoT SiteWise. Each value is a timestamp-quality-value (TQV) data point. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/ingest-api.html">Ingesting Data Using the API</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul><important><p>With respect to Unix epoch time, AWS IoT SiteWise accepts only TQVs that have a timestamp of no more than 15 minutes in the past and no more than 5 minutes in the future. AWS IoT SiteWise rejects timestamps outside of the inclusive range of [-15, +5] minutes and returns a <code>TimestampOutOfRangeException</code> error.</p><p>For each asset property, AWS IoT SiteWise overwrites TQVs with duplicate timestamps unless the newer TQV has a different quality. For example, if you store a TQV <code>{T1, GOOD, V1}</code>, then storing <code>{T1, GOOD, V2}</code> replaces the existing TQV.</p></important>
 
 @param request A container for the necessary parameters to execute the BatchPutAssetPropertyValue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`, `AWSiotsitewiseErrorServiceUnavailable`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseBatchPutAssetPropertyValueRequest
 @see AWSiotsitewiseBatchPutAssetPropertyValueResponse
 */
- (void)batchPutAssetPropertyValue:(AWSiotsitewiseBatchPutAssetPropertyValueRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseBatchPutAssetPropertyValueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an access policy that grants the specified AWS Single Sign-On user or group access to the specified AWS IoT SiteWise Monitor portal or project resource.</p>
 
 @param request A container for the necessary parameters to execute the CreateAccessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseCreateAccessPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseCreateAccessPolicyRequest
 @see AWSiotsitewiseCreateAccessPolicyResponse
 */
- (AWSTask<AWSiotsitewiseCreateAccessPolicyResponse *> *)createAccessPolicy:(AWSiotsitewiseCreateAccessPolicyRequest *)request;

/**
 <p>Creates an access policy that grants the specified AWS Single Sign-On user or group access to the specified AWS IoT SiteWise Monitor portal or project resource.</p>
 
 @param request A container for the necessary parameters to execute the CreateAccessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseCreateAccessPolicyRequest
 @see AWSiotsitewiseCreateAccessPolicyResponse
 */
- (void)createAccessPolicy:(AWSiotsitewiseCreateAccessPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseCreateAccessPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an asset from an existing asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-assets.html">Creating Assets</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseCreateAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceAlreadyExists`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseCreateAssetRequest
 @see AWSiotsitewiseCreateAssetResponse
 */
- (AWSTask<AWSiotsitewiseCreateAssetResponse *> *)createAsset:(AWSiotsitewiseCreateAssetRequest *)request;

/**
 <p>Creates an asset from an existing asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-assets.html">Creating Assets</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceAlreadyExists`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseCreateAssetRequest
 @see AWSiotsitewiseCreateAssetResponse
 */
- (void)createAsset:(AWSiotsitewiseCreateAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseCreateAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an asset model from specified property and hierarchy definitions. You create assets from asset models. With asset models, you can easily create assets of the same type that have standardized definitions. Each asset created from a model inherits the asset model's property and hierarchy definitions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/define-models.html">Defining Asset Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssetModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseCreateAssetModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceAlreadyExists`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseCreateAssetModelRequest
 @see AWSiotsitewiseCreateAssetModelResponse
 */
- (AWSTask<AWSiotsitewiseCreateAssetModelResponse *> *)createAssetModel:(AWSiotsitewiseCreateAssetModelRequest *)request;

/**
 <p>Creates an asset model from specified property and hierarchy definitions. You create assets from asset models. With asset models, you can easily create assets of the same type that have standardized definitions. Each asset created from a model inherits the asset model's property and hierarchy definitions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/define-models.html">Defining Asset Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssetModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceAlreadyExists`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseCreateAssetModelRequest
 @see AWSiotsitewiseCreateAssetModelResponse
 */
- (void)createAssetModel:(AWSiotsitewiseCreateAssetModelRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseCreateAssetModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a dashboard in an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the CreateDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseCreateDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseCreateDashboardRequest
 @see AWSiotsitewiseCreateDashboardResponse
 */
- (AWSTask<AWSiotsitewiseCreateDashboardResponse *> *)createDashboard:(AWSiotsitewiseCreateDashboardRequest *)request;

/**
 <p>Creates a dashboard in an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the CreateDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseCreateDashboardRequest
 @see AWSiotsitewiseCreateDashboardResponse
 */
- (void)createDashboard:(AWSiotsitewiseCreateDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseCreateDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a gateway, which is a virtual or edge device that delivers industrial data streams from local servers to AWS IoT SiteWise. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting data using a gateway</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseCreateGatewayResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceAlreadyExists`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseCreateGatewayRequest
 @see AWSiotsitewiseCreateGatewayResponse
 */
- (AWSTask<AWSiotsitewiseCreateGatewayResponse *> *)createGateway:(AWSiotsitewiseCreateGatewayRequest *)request;

/**
 <p>Creates a gateway, which is a virtual or edge device that delivers industrial data streams from local servers to AWS IoT SiteWise. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting data using a gateway</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceAlreadyExists`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseCreateGatewayRequest
 @see AWSiotsitewiseCreateGatewayResponse
 */
- (void)createGateway:(AWSiotsitewiseCreateGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseCreateGatewayResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a portal, which can contain projects and dashboards. Before you can create a portal, you must configure AWS Single Sign-On in the current Region. AWS IoT SiteWise Monitor uses AWS SSO to manage user permissions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-get-started.html#mon-gs-sso">Enabling AWS SSO</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><note><p>Before you can sign in to a new portal, you must add at least one AWS SSO user or group to that portal. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/administer-portals.html#portal-change-admins">Adding or Removing Portal Administrators</a> in the <i>AWS IoT SiteWise User Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePortal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseCreatePortalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseCreatePortalRequest
 @see AWSiotsitewiseCreatePortalResponse
 */
- (AWSTask<AWSiotsitewiseCreatePortalResponse *> *)createPortal:(AWSiotsitewiseCreatePortalRequest *)request;

/**
 <p>Creates a portal, which can contain projects and dashboards. Before you can create a portal, you must configure AWS Single Sign-On in the current Region. AWS IoT SiteWise Monitor uses AWS SSO to manage user permissions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-get-started.html#mon-gs-sso">Enabling AWS SSO</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><note><p>Before you can sign in to a new portal, you must add at least one AWS SSO user or group to that portal. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/administer-portals.html#portal-change-admins">Adding or Removing Portal Administrators</a> in the <i>AWS IoT SiteWise User Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePortal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseCreatePortalRequest
 @see AWSiotsitewiseCreatePortalResponse
 */
- (void)createPortal:(AWSiotsitewiseCreatePortalRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseCreatePortalResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a project in the specified portal.</p>
 
 @param request A container for the necessary parameters to execute the CreateProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseCreateProjectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseCreateProjectRequest
 @see AWSiotsitewiseCreateProjectResponse
 */
- (AWSTask<AWSiotsitewiseCreateProjectResponse *> *)createProject:(AWSiotsitewiseCreateProjectRequest *)request;

/**
 <p>Creates a project in the specified portal.</p>
 
 @param request A container for the necessary parameters to execute the CreateProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseCreateProjectRequest
 @see AWSiotsitewiseCreateProjectResponse
 */
- (void)createProject:(AWSiotsitewiseCreateProjectRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseCreateProjectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an access policy that grants the specified AWS Single Sign-On identity access to the specified AWS IoT SiteWise Monitor resource. You can use this action to revoke access to an AWS IoT SiteWise Monitor resource.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDeleteAccessPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDeleteAccessPolicyRequest
 @see AWSiotsitewiseDeleteAccessPolicyResponse
 */
- (AWSTask<AWSiotsitewiseDeleteAccessPolicyResponse *> *)deleteAccessPolicy:(AWSiotsitewiseDeleteAccessPolicyRequest *)request;

/**
 <p>Deletes an access policy that grants the specified AWS Single Sign-On identity access to the specified AWS IoT SiteWise Monitor resource. You can use this action to revoke access to an AWS IoT SiteWise Monitor resource.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDeleteAccessPolicyRequest
 @see AWSiotsitewiseDeleteAccessPolicyResponse
 */
- (void)deleteAccessPolicy:(AWSiotsitewiseDeleteAccessPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDeleteAccessPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an asset. This action can't be undone. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>. </p><note><p>You can't delete an asset that's associated to another asset. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DisassociateAssets.html">DisassociateAssets</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDeleteAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseDeleteAssetRequest
 @see AWSiotsitewiseDeleteAssetResponse
 */
- (AWSTask<AWSiotsitewiseDeleteAssetResponse *> *)deleteAsset:(AWSiotsitewiseDeleteAssetRequest *)request;

/**
 <p>Deletes an asset. This action can't be undone. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>. </p><note><p>You can't delete an asset that's associated to another asset. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DisassociateAssets.html">DisassociateAssets</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseDeleteAssetRequest
 @see AWSiotsitewiseDeleteAssetResponse
 */
- (void)deleteAsset:(AWSiotsitewiseDeleteAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDeleteAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an asset model. This action can't be undone. You must delete all assets created from an asset model before you can delete the model. Also, you can't delete an asset model if a parent asset model exists that contains a property formula expression that depends on the asset model that you want to delete. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAssetModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDeleteAssetModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseDeleteAssetModelRequest
 @see AWSiotsitewiseDeleteAssetModelResponse
 */
- (AWSTask<AWSiotsitewiseDeleteAssetModelResponse *> *)deleteAssetModel:(AWSiotsitewiseDeleteAssetModelRequest *)request;

/**
 <p>Deletes an asset model. This action can't be undone. You must delete all assets created from an asset model before you can delete the model. Also, you can't delete an asset model if a parent asset model exists that contains a property formula expression that depends on the asset model that you want to delete. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAssetModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseDeleteAssetModelRequest
 @see AWSiotsitewiseDeleteAssetModelResponse
 */
- (void)deleteAssetModel:(AWSiotsitewiseDeleteAssetModelRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDeleteAssetModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a dashboard from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDeleteDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDeleteDashboardRequest
 @see AWSiotsitewiseDeleteDashboardResponse
 */
- (AWSTask<AWSiotsitewiseDeleteDashboardResponse *> *)deleteDashboard:(AWSiotsitewiseDeleteDashboardRequest *)request;

/**
 <p>Deletes a dashboard from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDeleteDashboardRequest
 @see AWSiotsitewiseDeleteDashboardResponse
 */
- (void)deleteDashboard:(AWSiotsitewiseDeleteDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDeleteDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a gateway from AWS IoT SiteWise. When you delete a gateway, some of the gateway's files remain in your gateway's file system. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/data-retention.html">Data retention</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDeleteGatewayRequest
 */
- (AWSTask *)deleteGateway:(AWSiotsitewiseDeleteGatewayRequest *)request;

/**
 <p>Deletes a gateway from AWS IoT SiteWise. When you delete a gateway, some of the gateway's files remain in your gateway's file system. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/data-retention.html">Data retention</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDeleteGatewayRequest
 */
- (void)deleteGateway:(AWSiotsitewiseDeleteGatewayRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a portal from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeletePortal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDeletePortalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseDeletePortalRequest
 @see AWSiotsitewiseDeletePortalResponse
 */
- (AWSTask<AWSiotsitewiseDeletePortalResponse *> *)deletePortal:(AWSiotsitewiseDeletePortalRequest *)request;

/**
 <p>Deletes a portal from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeletePortal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseDeletePortalRequest
 @see AWSiotsitewiseDeletePortalResponse
 */
- (void)deletePortal:(AWSiotsitewiseDeletePortalRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDeletePortalResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a project from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDeleteProjectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDeleteProjectRequest
 @see AWSiotsitewiseDeleteProjectResponse
 */
- (AWSTask<AWSiotsitewiseDeleteProjectResponse *> *)deleteProject:(AWSiotsitewiseDeleteProjectRequest *)request;

/**
 <p>Deletes a project from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDeleteProjectRequest
 @see AWSiotsitewiseDeleteProjectResponse
 */
- (void)deleteProject:(AWSiotsitewiseDeleteProjectRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDeleteProjectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes an access policy, which specifies an AWS SSO user or group's access to an AWS IoT SiteWise Monitor portal or project.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDescribeAccessPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeAccessPolicyRequest
 @see AWSiotsitewiseDescribeAccessPolicyResponse
 */
- (AWSTask<AWSiotsitewiseDescribeAccessPolicyResponse *> *)describeAccessPolicy:(AWSiotsitewiseDescribeAccessPolicyRequest *)request;

/**
 <p>Describes an access policy, which specifies an AWS SSO user or group's access to an AWS IoT SiteWise Monitor portal or project.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeAccessPolicyRequest
 @see AWSiotsitewiseDescribeAccessPolicyResponse
 */
- (void)describeAccessPolicy:(AWSiotsitewiseDescribeAccessPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDescribeAccessPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about an asset.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDescribeAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeAssetRequest
 @see AWSiotsitewiseDescribeAssetResponse
 */
- (AWSTask<AWSiotsitewiseDescribeAssetResponse *> *)describeAsset:(AWSiotsitewiseDescribeAssetRequest *)request;

/**
 <p>Retrieves information about an asset.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeAssetRequest
 @see AWSiotsitewiseDescribeAssetResponse
 */
- (void)describeAsset:(AWSiotsitewiseDescribeAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDescribeAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about an asset model.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssetModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDescribeAssetModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeAssetModelRequest
 @see AWSiotsitewiseDescribeAssetModelResponse
 */
- (AWSTask<AWSiotsitewiseDescribeAssetModelResponse *> *)describeAssetModel:(AWSiotsitewiseDescribeAssetModelRequest *)request;

/**
 <p>Retrieves information about an asset model.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssetModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeAssetModelRequest
 @see AWSiotsitewiseDescribeAssetModelResponse
 */
- (void)describeAssetModel:(AWSiotsitewiseDescribeAssetModelRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDescribeAssetModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about an asset's property.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssetProperty service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDescribeAssetPropertyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeAssetPropertyRequest
 @see AWSiotsitewiseDescribeAssetPropertyResponse
 */
- (AWSTask<AWSiotsitewiseDescribeAssetPropertyResponse *> *)describeAssetProperty:(AWSiotsitewiseDescribeAssetPropertyRequest *)request;

/**
 <p>Retrieves information about an asset's property.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssetProperty service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeAssetPropertyRequest
 @see AWSiotsitewiseDescribeAssetPropertyResponse
 */
- (void)describeAssetProperty:(AWSiotsitewiseDescribeAssetPropertyRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDescribeAssetPropertyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDescribeDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeDashboardRequest
 @see AWSiotsitewiseDescribeDashboardResponse
 */
- (AWSTask<AWSiotsitewiseDescribeDashboardResponse *> *)describeDashboard:(AWSiotsitewiseDescribeDashboardRequest *)request;

/**
 <p>Retrieves information about a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeDashboardRequest
 @see AWSiotsitewiseDescribeDashboardResponse
 */
- (void)describeDashboard:(AWSiotsitewiseDescribeDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDescribeDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a gateway.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDescribeGatewayResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeGatewayRequest
 @see AWSiotsitewiseDescribeGatewayResponse
 */
- (AWSTask<AWSiotsitewiseDescribeGatewayResponse *> *)describeGateway:(AWSiotsitewiseDescribeGatewayRequest *)request;

/**
 <p>Retrieves information about a gateway.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeGatewayRequest
 @see AWSiotsitewiseDescribeGatewayResponse
 */
- (void)describeGateway:(AWSiotsitewiseDescribeGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDescribeGatewayResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a gateway capability configuration. Each gateway capability defines data sources for a gateway. A capability configuration can contain multiple data source configurations. If you define OPC-UA sources for a gateway in the AWS IoT SiteWise console, all of your OPC-UA sources are stored in one capability configuration. To list all capability configurations for a gateway, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGatewayCapabilityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeGatewayCapabilityConfigurationRequest
 @see AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse
 */
- (AWSTask<AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse *> *)describeGatewayCapabilityConfiguration:(AWSiotsitewiseDescribeGatewayCapabilityConfigurationRequest *)request;

/**
 <p>Retrieves information about a gateway capability configuration. Each gateway capability defines data sources for a gateway. A capability configuration can contain multiple data source configurations. If you define OPC-UA sources for a gateway in the AWS IoT SiteWise console, all of your OPC-UA sources are stored in one capability configuration. To list all capability configurations for a gateway, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGatewayCapabilityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeGatewayCapabilityConfigurationRequest
 @see AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse
 */
- (void)describeGatewayCapabilityConfiguration:(AWSiotsitewiseDescribeGatewayCapabilityConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the current AWS IoT SiteWise logging options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoggingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDescribeLoggingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorResourceNotFound`.
 
 @see AWSiotsitewiseDescribeLoggingOptionsRequest
 @see AWSiotsitewiseDescribeLoggingOptionsResponse
 */
- (AWSTask<AWSiotsitewiseDescribeLoggingOptionsResponse *> *)describeLoggingOptions:(AWSiotsitewiseDescribeLoggingOptionsRequest *)request;

/**
 <p>Retrieves the current AWS IoT SiteWise logging options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoggingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorResourceNotFound`.
 
 @see AWSiotsitewiseDescribeLoggingOptionsRequest
 @see AWSiotsitewiseDescribeLoggingOptionsResponse
 */
- (void)describeLoggingOptions:(AWSiotsitewiseDescribeLoggingOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDescribeLoggingOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a portal.</p>
 
 @param request A container for the necessary parameters to execute the DescribePortal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDescribePortalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribePortalRequest
 @see AWSiotsitewiseDescribePortalResponse
 */
- (AWSTask<AWSiotsitewiseDescribePortalResponse *> *)describePortal:(AWSiotsitewiseDescribePortalRequest *)request;

/**
 <p>Retrieves information about a portal.</p>
 
 @param request A container for the necessary parameters to execute the DescribePortal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribePortalRequest
 @see AWSiotsitewiseDescribePortalResponse
 */
- (void)describePortal:(AWSiotsitewiseDescribePortalRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDescribePortalResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a project.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseDescribeProjectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeProjectRequest
 @see AWSiotsitewiseDescribeProjectResponse
 */
- (AWSTask<AWSiotsitewiseDescribeProjectResponse *> *)describeProject:(AWSiotsitewiseDescribeProjectRequest *)request;

/**
 <p>Retrieves information about a project.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseDescribeProjectRequest
 @see AWSiotsitewiseDescribeProjectResponse
 */
- (void)describeProject:(AWSiotsitewiseDescribeProjectRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseDescribeProjectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a child asset from the given parent asset through a hierarchy defined in the parent asset's model.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseDisassociateAssetsRequest
 */
- (AWSTask *)disassociateAssets:(AWSiotsitewiseDisassociateAssetsRequest *)request;

/**
 <p>Disassociates a child asset from the given parent asset through a hierarchy defined in the parent asset's model.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseDisassociateAssetsRequest
 */
- (void)disassociateAssets:(AWSiotsitewiseDisassociateAssetsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets aggregated values for an asset property. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#aggregates">Querying Aggregated Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyAggregates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseGetAssetPropertyAggregatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorServiceUnavailable`.
 
 @see AWSiotsitewiseGetAssetPropertyAggregatesRequest
 @see AWSiotsitewiseGetAssetPropertyAggregatesResponse
 */
- (AWSTask<AWSiotsitewiseGetAssetPropertyAggregatesResponse *> *)getAssetPropertyAggregates:(AWSiotsitewiseGetAssetPropertyAggregatesRequest *)request;

/**
 <p>Gets aggregated values for an asset property. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#aggregates">Querying Aggregated Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyAggregates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorServiceUnavailable`.
 
 @see AWSiotsitewiseGetAssetPropertyAggregatesRequest
 @see AWSiotsitewiseGetAssetPropertyAggregatesResponse
 */
- (void)getAssetPropertyAggregates:(AWSiotsitewiseGetAssetPropertyAggregatesRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseGetAssetPropertyAggregatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets an asset property's current value. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#current-values">Querying Current Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyValue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseGetAssetPropertyValueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorServiceUnavailable`.
 
 @see AWSiotsitewiseGetAssetPropertyValueRequest
 @see AWSiotsitewiseGetAssetPropertyValueResponse
 */
- (AWSTask<AWSiotsitewiseGetAssetPropertyValueResponse *> *)getAssetPropertyValue:(AWSiotsitewiseGetAssetPropertyValueRequest *)request;

/**
 <p>Gets an asset property's current value. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#current-values">Querying Current Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyValue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorServiceUnavailable`.
 
 @see AWSiotsitewiseGetAssetPropertyValueRequest
 @see AWSiotsitewiseGetAssetPropertyValueResponse
 */
- (void)getAssetPropertyValue:(AWSiotsitewiseGetAssetPropertyValueRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseGetAssetPropertyValueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the history of an asset property's values. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#historical-values">Querying Historical Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyValueHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseGetAssetPropertyValueHistoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorServiceUnavailable`.
 
 @see AWSiotsitewiseGetAssetPropertyValueHistoryRequest
 @see AWSiotsitewiseGetAssetPropertyValueHistoryResponse
 */
- (AWSTask<AWSiotsitewiseGetAssetPropertyValueHistoryResponse *> *)getAssetPropertyValueHistory:(AWSiotsitewiseGetAssetPropertyValueHistoryRequest *)request;

/**
 <p>Gets the history of an asset property's values. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#historical-values">Querying Historical Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyValueHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorServiceUnavailable`.
 
 @see AWSiotsitewiseGetAssetPropertyValueHistoryRequest
 @see AWSiotsitewiseGetAssetPropertyValueHistoryResponse
 */
- (void)getAssetPropertyValueHistory:(AWSiotsitewiseGetAssetPropertyValueHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseGetAssetPropertyValueHistoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of access policies for an AWS SSO identity (a user or group) or an AWS IoT SiteWise Monitor resource (a portal or project).</p>
 
 @param request A container for the necessary parameters to execute the ListAccessPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseListAccessPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListAccessPoliciesRequest
 @see AWSiotsitewiseListAccessPoliciesResponse
 */
- (AWSTask<AWSiotsitewiseListAccessPoliciesResponse *> *)listAccessPolicies:(AWSiotsitewiseListAccessPoliciesRequest *)request;

/**
 <p>Retrieves a paginated list of access policies for an AWS SSO identity (a user or group) or an AWS IoT SiteWise Monitor resource (a portal or project).</p>
 
 @param request A container for the necessary parameters to execute the ListAccessPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListAccessPoliciesRequest
 @see AWSiotsitewiseListAccessPoliciesResponse
 */
- (void)listAccessPolicies:(AWSiotsitewiseListAccessPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseListAccessPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of summaries of all asset models.</p>
 
 @param request A container for the necessary parameters to execute the ListAssetModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseListAssetModelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListAssetModelsRequest
 @see AWSiotsitewiseListAssetModelsResponse
 */
- (AWSTask<AWSiotsitewiseListAssetModelsResponse *> *)listAssetModels:(AWSiotsitewiseListAssetModelsRequest *)request;

/**
 <p>Retrieves a paginated list of summaries of all asset models.</p>
 
 @param request A container for the necessary parameters to execute the ListAssetModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListAssetModelsRequest
 @see AWSiotsitewiseListAssetModelsResponse
 */
- (void)listAssetModels:(AWSiotsitewiseListAssetModelsRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseListAssetModelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of asset summaries.</p>
 
 @param request A container for the necessary parameters to execute the ListAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseListAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListAssetsRequest
 @see AWSiotsitewiseListAssetsResponse
 */
- (AWSTask<AWSiotsitewiseListAssetsResponse *> *)listAssets:(AWSiotsitewiseListAssetsRequest *)request;

/**
 <p>Retrieves a paginated list of asset summaries.</p>
 
 @param request A container for the necessary parameters to execute the ListAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListAssetsRequest
 @see AWSiotsitewiseListAssetsResponse
 */
- (void)listAssets:(AWSiotsitewiseListAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseListAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of the assets associated to a parent asset (<code>assetId</code>) by a given hierarchy (<code>hierarchyId</code>).</p>
 
 @param request A container for the necessary parameters to execute the ListAssociatedAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseListAssociatedAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListAssociatedAssetsRequest
 @see AWSiotsitewiseListAssociatedAssetsResponse
 */
- (AWSTask<AWSiotsitewiseListAssociatedAssetsResponse *> *)listAssociatedAssets:(AWSiotsitewiseListAssociatedAssetsRequest *)request;

/**
 <p>Retrieves a paginated list of the assets associated to a parent asset (<code>assetId</code>) by a given hierarchy (<code>hierarchyId</code>).</p>
 
 @param request A container for the necessary parameters to execute the ListAssociatedAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListAssociatedAssetsRequest
 @see AWSiotsitewiseListAssociatedAssetsResponse
 */
- (void)listAssociatedAssets:(AWSiotsitewiseListAssociatedAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseListAssociatedAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of dashboards for an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the ListDashboards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseListDashboardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListDashboardsRequest
 @see AWSiotsitewiseListDashboardsResponse
 */
- (AWSTask<AWSiotsitewiseListDashboardsResponse *> *)listDashboards:(AWSiotsitewiseListDashboardsRequest *)request;

/**
 <p>Retrieves a paginated list of dashboards for an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the ListDashboards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListDashboardsRequest
 @see AWSiotsitewiseListDashboardsResponse
 */
- (void)listDashboards:(AWSiotsitewiseListDashboardsRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseListDashboardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseListGatewaysResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListGatewaysRequest
 @see AWSiotsitewiseListGatewaysResponse
 */
- (AWSTask<AWSiotsitewiseListGatewaysResponse *> *)listGateways:(AWSiotsitewiseListGatewaysRequest *)request;

/**
 <p>Retrieves a paginated list of gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListGatewaysRequest
 @see AWSiotsitewiseListGatewaysResponse
 */
- (void)listGateways:(AWSiotsitewiseListGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseListGatewaysResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of AWS IoT SiteWise Monitor portals.</p>
 
 @param request A container for the necessary parameters to execute the ListPortals service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseListPortalsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListPortalsRequest
 @see AWSiotsitewiseListPortalsResponse
 */
- (AWSTask<AWSiotsitewiseListPortalsResponse *> *)listPortals:(AWSiotsitewiseListPortalsRequest *)request;

/**
 <p>Retrieves a paginated list of AWS IoT SiteWise Monitor portals.</p>
 
 @param request A container for the necessary parameters to execute the ListPortals service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListPortalsRequest
 @see AWSiotsitewiseListPortalsResponse
 */
- (void)listPortals:(AWSiotsitewiseListPortalsRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseListPortalsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of assets associated with an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the ListProjectAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseListProjectAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListProjectAssetsRequest
 @see AWSiotsitewiseListProjectAssetsResponse
 */
- (AWSTask<AWSiotsitewiseListProjectAssetsResponse *> *)listProjectAssets:(AWSiotsitewiseListProjectAssetsRequest *)request;

/**
 <p>Retrieves a paginated list of assets associated with an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the ListProjectAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListProjectAssetsRequest
 @see AWSiotsitewiseListProjectAssetsResponse
 */
- (void)listProjectAssets:(AWSiotsitewiseListProjectAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseListProjectAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of projects for an AWS IoT SiteWise Monitor portal.</p>
 
 @param request A container for the necessary parameters to execute the ListProjects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseListProjectsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListProjectsRequest
 @see AWSiotsitewiseListProjectsResponse
 */
- (AWSTask<AWSiotsitewiseListProjectsResponse *> *)listProjects:(AWSiotsitewiseListProjectsRequest *)request;

/**
 <p>Retrieves a paginated list of projects for an AWS IoT SiteWise Monitor portal.</p>
 
 @param request A container for the necessary parameters to execute the ListProjects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseListProjectsRequest
 @see AWSiotsitewiseListProjectsResponse
 */
- (void)listProjects:(AWSiotsitewiseListProjectsRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseListProjectsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the list of tags for an AWS IoT SiteWise resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorResourceNotFound`.
 
 @see AWSiotsitewiseListTagsForResourceRequest
 @see AWSiotsitewiseListTagsForResourceResponse
 */
- (AWSTask<AWSiotsitewiseListTagsForResourceResponse *> *)listTagsForResource:(AWSiotsitewiseListTagsForResourceRequest *)request;

/**
 <p>Retrieves the list of tags for an AWS IoT SiteWise resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorResourceNotFound`.
 
 @see AWSiotsitewiseListTagsForResourceRequest
 @see AWSiotsitewiseListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSiotsitewiseListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets logging options for AWS IoT SiteWise.</p>
 
 @param request A container for the necessary parameters to execute the PutLoggingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewisePutLoggingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorConflictingOperation`, `AWSiotsitewiseErrorResourceNotFound`.
 
 @see AWSiotsitewisePutLoggingOptionsRequest
 @see AWSiotsitewisePutLoggingOptionsResponse
 */
- (AWSTask<AWSiotsitewisePutLoggingOptionsResponse *> *)putLoggingOptions:(AWSiotsitewisePutLoggingOptionsRequest *)request;

/**
 <p>Sets logging options for AWS IoT SiteWise.</p>
 
 @param request A container for the necessary parameters to execute the PutLoggingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorConflictingOperation`, `AWSiotsitewiseErrorResourceNotFound`.
 
 @see AWSiotsitewisePutLoggingOptionsRequest
 @see AWSiotsitewisePutLoggingOptionsResponse
 */
- (void)putLoggingOptions:(AWSiotsitewisePutLoggingOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewisePutLoggingOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds tags to an AWS IoT SiteWise resource. If a tag already exists for the resource, this operation updates the tag's value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorTooManyTags`.
 
 @see AWSiotsitewiseTagResourceRequest
 @see AWSiotsitewiseTagResourceResponse
 */
- (AWSTask<AWSiotsitewiseTagResourceResponse *> *)tagResource:(AWSiotsitewiseTagResourceRequest *)request;

/**
 <p>Adds tags to an AWS IoT SiteWise resource. If a tag already exists for the resource, this operation updates the tag's value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorTooManyTags`.
 
 @see AWSiotsitewiseTagResourceRequest
 @see AWSiotsitewiseTagResourceResponse
 */
- (void)tagResource:(AWSiotsitewiseTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a tag from an AWS IoT SiteWise resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorResourceNotFound`.
 
 @see AWSiotsitewiseUntagResourceRequest
 @see AWSiotsitewiseUntagResourceResponse
 */
- (AWSTask<AWSiotsitewiseUntagResourceResponse *> *)untagResource:(AWSiotsitewiseUntagResourceRequest *)request;

/**
 <p>Removes a tag from an AWS IoT SiteWise resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorResourceNotFound`.
 
 @see AWSiotsitewiseUntagResourceRequest
 @see AWSiotsitewiseUntagResourceResponse
 */
- (void)untagResource:(AWSiotsitewiseUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing access policy that specifies an AWS SSO user or group's access to an AWS IoT SiteWise Monitor portal or project resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAccessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseUpdateAccessPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseUpdateAccessPolicyRequest
 @see AWSiotsitewiseUpdateAccessPolicyResponse
 */
- (AWSTask<AWSiotsitewiseUpdateAccessPolicyResponse *> *)updateAccessPolicy:(AWSiotsitewiseUpdateAccessPolicyRequest *)request;

/**
 <p>Updates an existing access policy that specifies an AWS SSO user or group's access to an AWS IoT SiteWise Monitor portal or project resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAccessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseUpdateAccessPolicyRequest
 @see AWSiotsitewiseUpdateAccessPolicyResponse
 */
- (void)updateAccessPolicy:(AWSiotsitewiseUpdateAccessPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseUpdateAccessPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an asset's name. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseUpdateAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceAlreadyExists`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseUpdateAssetRequest
 @see AWSiotsitewiseUpdateAssetResponse
 */
- (AWSTask<AWSiotsitewiseUpdateAssetResponse *> *)updateAsset:(AWSiotsitewiseUpdateAssetRequest *)request;

/**
 <p>Updates an asset's name. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceAlreadyExists`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseUpdateAssetRequest
 @see AWSiotsitewiseUpdateAssetResponse
 */
- (void)updateAsset:(AWSiotsitewiseUpdateAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseUpdateAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an asset model and all of the assets that were created from the model. Each asset created from the model inherits the updated asset model's property and hierarchy definitions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><important><p>This action overwrites the existing model with the provided model. To avoid deleting your asset model's properties or hierarchies, you must include their definitions in the updated asset model payload. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetModel.html">DescribeAssetModel</a>.</p><p>If you remove a property from an asset model or update a property's formula expression, AWS IoT SiteWise deletes all previous data for that property. If you remove a hierarchy definition from an asset model, AWS IoT SiteWise disassociates every asset associated with that hierarchy. You can't change the type or data type of an existing property.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssetModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseUpdateAssetModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceAlreadyExists`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorLimitExceeded`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseUpdateAssetModelRequest
 @see AWSiotsitewiseUpdateAssetModelResponse
 */
- (AWSTask<AWSiotsitewiseUpdateAssetModelResponse *> *)updateAssetModel:(AWSiotsitewiseUpdateAssetModelRequest *)request;

/**
 <p>Updates an asset model and all of the assets that were created from the model. Each asset created from the model inherits the updated asset model's property and hierarchy definitions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><important><p>This action overwrites the existing model with the provided model. To avoid deleting your asset model's properties or hierarchies, you must include their definitions in the updated asset model payload. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetModel.html">DescribeAssetModel</a>.</p><p>If you remove a property from an asset model or update a property's formula expression, AWS IoT SiteWise deletes all previous data for that property. If you remove a hierarchy definition from an asset model, AWS IoT SiteWise disassociates every asset associated with that hierarchy. You can't change the type or data type of an existing property.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssetModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceAlreadyExists`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorLimitExceeded`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseUpdateAssetModelRequest
 @see AWSiotsitewiseUpdateAssetModelResponse
 */
- (void)updateAssetModel:(AWSiotsitewiseUpdateAssetModelRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseUpdateAssetModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an asset property's alias and notification state.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAssetProperty service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseUpdateAssetPropertyRequest
 */
- (AWSTask *)updateAssetProperty:(AWSiotsitewiseUpdateAssetPropertyRequest *)request;

/**
 <p>Updates an asset property's alias and notification state.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAssetProperty service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseUpdateAssetPropertyRequest
 */
- (void)updateAssetProperty:(AWSiotsitewiseUpdateAssetPropertyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates an AWS IoT SiteWise Monitor dashboard.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseUpdateDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseUpdateDashboardRequest
 @see AWSiotsitewiseUpdateDashboardResponse
 */
- (AWSTask<AWSiotsitewiseUpdateDashboardResponse *> *)updateDashboard:(AWSiotsitewiseUpdateDashboardRequest *)request;

/**
 <p>Updates an AWS IoT SiteWise Monitor dashboard.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseUpdateDashboardRequest
 @see AWSiotsitewiseUpdateDashboardResponse
 */
- (void)updateDashboard:(AWSiotsitewiseUpdateDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseUpdateDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a gateway's name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorConflictingOperation`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseUpdateGatewayRequest
 */
- (AWSTask *)updateGateway:(AWSiotsitewiseUpdateGatewayRequest *)request;

/**
 <p>Updates a gateway's name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorConflictingOperation`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseUpdateGatewayRequest
 */
- (void)updateGateway:(AWSiotsitewiseUpdateGatewayRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates a gateway capability configuration or defines a new capability configuration. Each gateway capability defines data sources for a gateway. A capability configuration can contain multiple data source configurations. If you define OPC-UA sources for a gateway in the AWS IoT SiteWise console, all of your OPC-UA sources are stored in one capability configuration. To list all capability configurations for a gateway, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGatewayCapabilityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorConflictingOperation`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseUpdateGatewayCapabilityConfigurationRequest
 @see AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse
 */
- (AWSTask<AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse *> *)updateGatewayCapabilityConfiguration:(AWSiotsitewiseUpdateGatewayCapabilityConfigurationRequest *)request;

/**
 <p>Updates a gateway capability configuration or defines a new capability configuration. Each gateway capability defines data sources for a gateway. A capability configuration can contain multiple data source configurations. If you define OPC-UA sources for a gateway in the AWS IoT SiteWise console, all of your OPC-UA sources are stored in one capability configuration. To list all capability configurations for a gateway, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGatewayCapabilityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorConflictingOperation`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorLimitExceeded`.
 
 @see AWSiotsitewiseUpdateGatewayCapabilityConfigurationRequest
 @see AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse
 */
- (void)updateGatewayCapabilityConfiguration:(AWSiotsitewiseUpdateGatewayCapabilityConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an AWS IoT SiteWise Monitor portal.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePortal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseUpdatePortalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseUpdatePortalRequest
 @see AWSiotsitewiseUpdatePortalResponse
 */
- (AWSTask<AWSiotsitewiseUpdatePortalResponse *> *)updatePortal:(AWSiotsitewiseUpdatePortalRequest *)request;

/**
 <p>Updates an AWS IoT SiteWise Monitor portal.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePortal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`, `AWSiotsitewiseErrorConflictingOperation`.
 
 @see AWSiotsitewiseUpdatePortalRequest
 @see AWSiotsitewiseUpdatePortalResponse
 */
- (void)updatePortal:(AWSiotsitewiseUpdatePortalRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseUpdatePortalResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSiotsitewiseUpdateProjectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseUpdateProjectRequest
 @see AWSiotsitewiseUpdateProjectResponse
 */
- (AWSTask<AWSiotsitewiseUpdateProjectResponse *> *)updateProject:(AWSiotsitewiseUpdateProjectRequest *)request;

/**
 <p>Updates an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSiotsitewiseErrorDomain` domain and the following error code: `AWSiotsitewiseErrorInvalidRequest`, `AWSiotsitewiseErrorResourceNotFound`, `AWSiotsitewiseErrorInternalFailure`, `AWSiotsitewiseErrorThrottling`.
 
 @see AWSiotsitewiseUpdateProjectRequest
 @see AWSiotsitewiseUpdateProjectResponse
 */
- (void)updateProject:(AWSiotsitewiseUpdateProjectRequest *)request completionHandler:(void (^ _Nullable)(AWSiotsitewiseUpdateProjectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
