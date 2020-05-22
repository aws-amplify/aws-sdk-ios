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
#import "AWSIotsitewiseModel.h"
#import "AWSIotsitewiseResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSIotsitewise
FOUNDATION_EXPORT NSString *const AWSIotsitewiseSDKVersion;

/**
 <p>Welcome to the AWS IoT SiteWise API Reference. AWS IoT SiteWise is an AWS service that connects <a href="https://en.wikipedia.org/wiki/Internet_of_things#Industrial_applications">Industrial Internet of Things (IIoT)</a> devices to the power of the AWS Cloud. For more information, see the <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/">AWS IoT SiteWise User Guide</a>. For information about AWS IoT SiteWise quotas, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@interface AWSIotsitewise : AWSService

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

     let Iotsitewise = AWSIotsitewise.default()

 *Objective-C*

     AWSIotsitewise *Iotsitewise = [AWSIotsitewise defaultIotsitewise];

 @return The default service client.
 */
+ (instancetype)defaultIotsitewise;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSIotsitewise.register(with: configuration!, forKey: "USWest2Iotsitewise")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:@"USWest2Iotsitewise"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Iotsitewise = AWSIotsitewise(forKey: "USWest2Iotsitewise")

 *Objective-C*

     AWSIotsitewise *Iotsitewise = [AWSIotsitewise IotsitewiseForKey:@"USWest2Iotsitewise"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerIotsitewiseWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerIotsitewiseWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSIotsitewise.register(with: configuration!, forKey: "USWest2Iotsitewise")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:@"USWest2Iotsitewise"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Iotsitewise = AWSIotsitewise(forKey: "USWest2Iotsitewise")

 *Objective-C*

     AWSIotsitewise *Iotsitewise = [AWSIotsitewise IotsitewiseForKey:@"USWest2Iotsitewise"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)IotsitewiseForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeIotsitewiseForKey:(NSString *)key;

/**
 <p>Associates a child asset with the given parent asset through a hierarchy defined in the parent asset's model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/add-associated-assets.html">Associating Assets</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorLimitExceeded`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseAssociateAssetsRequest
 */
- (AWSTask *)associateAssets:(AWSIotsitewiseAssociateAssetsRequest *)request;

/**
 <p>Associates a child asset with the given parent asset through a hierarchy defined in the parent asset's model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/add-associated-assets.html">Associating Assets</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorLimitExceeded`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseAssociateAssetsRequest
 */
- (void)associateAssets:(AWSIotsitewiseAssociateAssetsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates a group (batch) of assets with an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the BatchAssociateProjectAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseBatchAssociateProjectAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseBatchAssociateProjectAssetsRequest
 @see AWSIotsitewiseBatchAssociateProjectAssetsResponse
 */
- (AWSTask<AWSIotsitewiseBatchAssociateProjectAssetsResponse *> *)batchAssociateProjectAssets:(AWSIotsitewiseBatchAssociateProjectAssetsRequest *)request;

/**
 <p>Associates a group (batch) of assets with an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the BatchAssociateProjectAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseBatchAssociateProjectAssetsRequest
 @see AWSIotsitewiseBatchAssociateProjectAssetsResponse
 */
- (void)batchAssociateProjectAssets:(AWSIotsitewiseBatchAssociateProjectAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseBatchAssociateProjectAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a group (batch) of assets from an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisassociateProjectAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseBatchDisassociateProjectAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseBatchDisassociateProjectAssetsRequest
 @see AWSIotsitewiseBatchDisassociateProjectAssetsResponse
 */
- (AWSTask<AWSIotsitewiseBatchDisassociateProjectAssetsResponse *> *)batchDisassociateProjectAssets:(AWSIotsitewiseBatchDisassociateProjectAssetsRequest *)request;

/**
 <p>Disassociates a group (batch) of assets from an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the BatchDisassociateProjectAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseBatchDisassociateProjectAssetsRequest
 @see AWSIotsitewiseBatchDisassociateProjectAssetsResponse
 */
- (void)batchDisassociateProjectAssets:(AWSIotsitewiseBatchDisassociateProjectAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseBatchDisassociateProjectAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a list of asset property values to AWS IoT SiteWise. Each value is a timestamp-quality-value (TQV) data point. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/ingest-api.html">Ingesting Data Using the API</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul><important><p>With respect to Unix epoch time, AWS IoT SiteWise accepts only TQVs that have a timestamp of no more than 15 minutes in the past and no more than 5 minutes in the future. AWS IoT SiteWise rejects timestamps outside of the inclusive range of [-15, +5] minutes and returns a <code>TimestampOutOfRangeException</code> error.</p><p>For each asset property, AWS IoT SiteWise overwrites TQVs with duplicate timestamps unless the newer TQV has a different quality. For example, if you store a TQV <code>{T1, GOOD, V1}</code>, then storing <code>{T1, GOOD, V2}</code> replaces the existing TQV.</p></important>
 
 @param request A container for the necessary parameters to execute the BatchPutAssetPropertyValue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseBatchPutAssetPropertyValueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`, `AWSIotsitewiseErrorServiceUnavailable`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseBatchPutAssetPropertyValueRequest
 @see AWSIotsitewiseBatchPutAssetPropertyValueResponse
 */
- (AWSTask<AWSIotsitewiseBatchPutAssetPropertyValueResponse *> *)batchPutAssetPropertyValue:(AWSIotsitewiseBatchPutAssetPropertyValueRequest *)request;

/**
 <p>Sends a list of asset property values to AWS IoT SiteWise. Each value is a timestamp-quality-value (TQV) data point. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/ingest-api.html">Ingesting Data Using the API</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul><important><p>With respect to Unix epoch time, AWS IoT SiteWise accepts only TQVs that have a timestamp of no more than 15 minutes in the past and no more than 5 minutes in the future. AWS IoT SiteWise rejects timestamps outside of the inclusive range of [-15, +5] minutes and returns a <code>TimestampOutOfRangeException</code> error.</p><p>For each asset property, AWS IoT SiteWise overwrites TQVs with duplicate timestamps unless the newer TQV has a different quality. For example, if you store a TQV <code>{T1, GOOD, V1}</code>, then storing <code>{T1, GOOD, V2}</code> replaces the existing TQV.</p></important>
 
 @param request A container for the necessary parameters to execute the BatchPutAssetPropertyValue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`, `AWSIotsitewiseErrorServiceUnavailable`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseBatchPutAssetPropertyValueRequest
 @see AWSIotsitewiseBatchPutAssetPropertyValueResponse
 */
- (void)batchPutAssetPropertyValue:(AWSIotsitewiseBatchPutAssetPropertyValueRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseBatchPutAssetPropertyValueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an access policy that grants the specified AWS Single Sign-On user or group access to the specified AWS IoT SiteWise Monitor portal or project resource.</p>
 
 @param request A container for the necessary parameters to execute the CreateAccessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseCreateAccessPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseCreateAccessPolicyRequest
 @see AWSIotsitewiseCreateAccessPolicyResponse
 */
- (AWSTask<AWSIotsitewiseCreateAccessPolicyResponse *> *)createAccessPolicy:(AWSIotsitewiseCreateAccessPolicyRequest *)request;

/**
 <p>Creates an access policy that grants the specified AWS Single Sign-On user or group access to the specified AWS IoT SiteWise Monitor portal or project resource.</p>
 
 @param request A container for the necessary parameters to execute the CreateAccessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseCreateAccessPolicyRequest
 @see AWSIotsitewiseCreateAccessPolicyResponse
 */
- (void)createAccessPolicy:(AWSIotsitewiseCreateAccessPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseCreateAccessPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an asset from an existing asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-assets.html">Creating Assets</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseCreateAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceAlreadyExists`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseCreateAssetRequest
 @see AWSIotsitewiseCreateAssetResponse
 */
- (AWSTask<AWSIotsitewiseCreateAssetResponse *> *)createAsset:(AWSIotsitewiseCreateAssetRequest *)request;

/**
 <p>Creates an asset from an existing asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-assets.html">Creating Assets</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceAlreadyExists`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseCreateAssetRequest
 @see AWSIotsitewiseCreateAssetResponse
 */
- (void)createAsset:(AWSIotsitewiseCreateAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseCreateAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an asset model from specified property and hierarchy definitions. You create assets from asset models. With asset models, you can easily create assets of the same type that have standardized definitions. Each asset created from a model inherits the asset model's property and hierarchy definitions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/define-models.html">Defining Asset Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssetModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseCreateAssetModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceAlreadyExists`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseCreateAssetModelRequest
 @see AWSIotsitewiseCreateAssetModelResponse
 */
- (AWSTask<AWSIotsitewiseCreateAssetModelResponse *> *)createAssetModel:(AWSIotsitewiseCreateAssetModelRequest *)request;

/**
 <p>Creates an asset model from specified property and hierarchy definitions. You create assets from asset models. With asset models, you can easily create assets of the same type that have standardized definitions. Each asset created from a model inherits the asset model's property and hierarchy definitions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/define-models.html">Defining Asset Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAssetModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceAlreadyExists`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseCreateAssetModelRequest
 @see AWSIotsitewiseCreateAssetModelResponse
 */
- (void)createAssetModel:(AWSIotsitewiseCreateAssetModelRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseCreateAssetModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a dashboard in an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the CreateDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseCreateDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseCreateDashboardRequest
 @see AWSIotsitewiseCreateDashboardResponse
 */
- (AWSTask<AWSIotsitewiseCreateDashboardResponse *> *)createDashboard:(AWSIotsitewiseCreateDashboardRequest *)request;

/**
 <p>Creates a dashboard in an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the CreateDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseCreateDashboardRequest
 @see AWSIotsitewiseCreateDashboardResponse
 */
- (void)createDashboard:(AWSIotsitewiseCreateDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseCreateDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a gateway, which is a virtual or edge device that delivers industrial data streams from local servers to AWS IoT SiteWise. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting data using a gateway</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseCreateGatewayResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceAlreadyExists`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseCreateGatewayRequest
 @see AWSIotsitewiseCreateGatewayResponse
 */
- (AWSTask<AWSIotsitewiseCreateGatewayResponse *> *)createGateway:(AWSIotsitewiseCreateGatewayRequest *)request;

/**
 <p>Creates a gateway, which is a virtual or edge device that delivers industrial data streams from local servers to AWS IoT SiteWise. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting data using a gateway</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceAlreadyExists`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseCreateGatewayRequest
 @see AWSIotsitewiseCreateGatewayResponse
 */
- (void)createGateway:(AWSIotsitewiseCreateGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseCreateGatewayResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a portal, which can contain projects and dashboards. Before you can create a portal, you must configure AWS Single Sign-On in the current Region. AWS IoT SiteWise Monitor uses AWS SSO to manage user permissions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-get-started.html#mon-gs-sso">Enabling AWS SSO</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><note><p>Before you can sign in to a new portal, you must add at least one AWS SSO user or group to that portal. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/administer-portals.html#portal-change-admins">Adding or Removing Portal Administrators</a> in the <i>AWS IoT SiteWise User Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePortal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseCreatePortalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseCreatePortalRequest
 @see AWSIotsitewiseCreatePortalResponse
 */
- (AWSTask<AWSIotsitewiseCreatePortalResponse *> *)createPortal:(AWSIotsitewiseCreatePortalRequest *)request;

/**
 <p>Creates a portal, which can contain projects and dashboards. Before you can create a portal, you must configure AWS Single Sign-On in the current Region. AWS IoT SiteWise Monitor uses AWS SSO to manage user permissions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-get-started.html#mon-gs-sso">Enabling AWS SSO</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><note><p>Before you can sign in to a new portal, you must add at least one AWS SSO user or group to that portal. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/administer-portals.html#portal-change-admins">Adding or Removing Portal Administrators</a> in the <i>AWS IoT SiteWise User Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePortal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseCreatePortalRequest
 @see AWSIotsitewiseCreatePortalResponse
 */
- (void)createPortal:(AWSIotsitewiseCreatePortalRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseCreatePortalResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a project in the specified portal.</p>
 
 @param request A container for the necessary parameters to execute the CreateProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseCreateProjectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseCreateProjectRequest
 @see AWSIotsitewiseCreateProjectResponse
 */
- (AWSTask<AWSIotsitewiseCreateProjectResponse *> *)createProject:(AWSIotsitewiseCreateProjectRequest *)request;

/**
 <p>Creates a project in the specified portal.</p>
 
 @param request A container for the necessary parameters to execute the CreateProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseCreateProjectRequest
 @see AWSIotsitewiseCreateProjectResponse
 */
- (void)createProject:(AWSIotsitewiseCreateProjectRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseCreateProjectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an access policy that grants the specified AWS Single Sign-On identity access to the specified AWS IoT SiteWise Monitor resource. You can use this operation to revoke access to an AWS IoT SiteWise Monitor resource.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDeleteAccessPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDeleteAccessPolicyRequest
 @see AWSIotsitewiseDeleteAccessPolicyResponse
 */
- (AWSTask<AWSIotsitewiseDeleteAccessPolicyResponse *> *)deleteAccessPolicy:(AWSIotsitewiseDeleteAccessPolicyRequest *)request;

/**
 <p>Deletes an access policy that grants the specified AWS Single Sign-On identity access to the specified AWS IoT SiteWise Monitor resource. You can use this operation to revoke access to an AWS IoT SiteWise Monitor resource.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDeleteAccessPolicyRequest
 @see AWSIotsitewiseDeleteAccessPolicyResponse
 */
- (void)deleteAccessPolicy:(AWSIotsitewiseDeleteAccessPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDeleteAccessPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an asset. This action can't be undone. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>. </p><note><p>You can't delete an asset that's associated to another asset. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DisassociateAssets.html">DisassociateAssets</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDeleteAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseDeleteAssetRequest
 @see AWSIotsitewiseDeleteAssetResponse
 */
- (AWSTask<AWSIotsitewiseDeleteAssetResponse *> *)deleteAsset:(AWSIotsitewiseDeleteAssetRequest *)request;

/**
 <p>Deletes an asset. This action can't be undone. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>. </p><note><p>You can't delete an asset that's associated to another asset. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DisassociateAssets.html">DisassociateAssets</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseDeleteAssetRequest
 @see AWSIotsitewiseDeleteAssetResponse
 */
- (void)deleteAsset:(AWSIotsitewiseDeleteAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDeleteAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an asset model. This action can't be undone. You must delete all assets created from an asset model before you can delete the model. Also, you can't delete an asset model if a parent asset model exists that contains a property formula expression that depends on the asset model that you want to delete. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAssetModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDeleteAssetModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseDeleteAssetModelRequest
 @see AWSIotsitewiseDeleteAssetModelResponse
 */
- (AWSTask<AWSIotsitewiseDeleteAssetModelResponse *> *)deleteAssetModel:(AWSIotsitewiseDeleteAssetModelRequest *)request;

/**
 <p>Deletes an asset model. This action can't be undone. You must delete all assets created from an asset model before you can delete the model. Also, you can't delete an asset model if a parent asset model exists that contains a property formula expression that depends on the asset model that you want to delete. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAssetModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseDeleteAssetModelRequest
 @see AWSIotsitewiseDeleteAssetModelResponse
 */
- (void)deleteAssetModel:(AWSIotsitewiseDeleteAssetModelRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDeleteAssetModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a dashboard from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDeleteDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDeleteDashboardRequest
 @see AWSIotsitewiseDeleteDashboardResponse
 */
- (AWSTask<AWSIotsitewiseDeleteDashboardResponse *> *)deleteDashboard:(AWSIotsitewiseDeleteDashboardRequest *)request;

/**
 <p>Deletes a dashboard from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDeleteDashboardRequest
 @see AWSIotsitewiseDeleteDashboardResponse
 */
- (void)deleteDashboard:(AWSIotsitewiseDeleteDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDeleteDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a gateway from AWS IoT SiteWise. When you delete a gateway, some of the gateway's files remain in your gateway's file system. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/data-retention.html">Data retention</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDeleteGatewayRequest
 */
- (AWSTask *)deleteGateway:(AWSIotsitewiseDeleteGatewayRequest *)request;

/**
 <p>Deletes a gateway from AWS IoT SiteWise. When you delete a gateway, some of the gateway's files remain in your gateway's file system. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/data-retention.html">Data retention</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDeleteGatewayRequest
 */
- (void)deleteGateway:(AWSIotsitewiseDeleteGatewayRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a portal from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeletePortal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDeletePortalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseDeletePortalRequest
 @see AWSIotsitewiseDeletePortalResponse
 */
- (AWSTask<AWSIotsitewiseDeletePortalResponse *> *)deletePortal:(AWSIotsitewiseDeletePortalRequest *)request;

/**
 <p>Deletes a portal from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeletePortal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseDeletePortalRequest
 @see AWSIotsitewiseDeletePortalResponse
 */
- (void)deletePortal:(AWSIotsitewiseDeletePortalRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDeletePortalResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a project from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDeleteProjectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDeleteProjectRequest
 @see AWSIotsitewiseDeleteProjectResponse
 */
- (AWSTask<AWSIotsitewiseDeleteProjectResponse *> *)deleteProject:(AWSIotsitewiseDeleteProjectRequest *)request;

/**
 <p>Deletes a project from AWS IoT SiteWise Monitor.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDeleteProjectRequest
 @see AWSIotsitewiseDeleteProjectResponse
 */
- (void)deleteProject:(AWSIotsitewiseDeleteProjectRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDeleteProjectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes an access policy, which specifies an AWS SSO user or group's access to an AWS IoT SiteWise Monitor portal or project.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDescribeAccessPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeAccessPolicyRequest
 @see AWSIotsitewiseDescribeAccessPolicyResponse
 */
- (AWSTask<AWSIotsitewiseDescribeAccessPolicyResponse *> *)describeAccessPolicy:(AWSIotsitewiseDescribeAccessPolicyRequest *)request;

/**
 <p>Describes an access policy, which specifies an AWS SSO user or group's access to an AWS IoT SiteWise Monitor portal or project.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeAccessPolicyRequest
 @see AWSIotsitewiseDescribeAccessPolicyResponse
 */
- (void)describeAccessPolicy:(AWSIotsitewiseDescribeAccessPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDescribeAccessPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about an asset.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDescribeAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeAssetRequest
 @see AWSIotsitewiseDescribeAssetResponse
 */
- (AWSTask<AWSIotsitewiseDescribeAssetResponse *> *)describeAsset:(AWSIotsitewiseDescribeAssetRequest *)request;

/**
 <p>Retrieves information about an asset.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeAssetRequest
 @see AWSIotsitewiseDescribeAssetResponse
 */
- (void)describeAsset:(AWSIotsitewiseDescribeAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDescribeAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about an asset model.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssetModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDescribeAssetModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeAssetModelRequest
 @see AWSIotsitewiseDescribeAssetModelResponse
 */
- (AWSTask<AWSIotsitewiseDescribeAssetModelResponse *> *)describeAssetModel:(AWSIotsitewiseDescribeAssetModelRequest *)request;

/**
 <p>Retrieves information about an asset model.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssetModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeAssetModelRequest
 @see AWSIotsitewiseDescribeAssetModelResponse
 */
- (void)describeAssetModel:(AWSIotsitewiseDescribeAssetModelRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDescribeAssetModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about an asset's property.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssetProperty service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDescribeAssetPropertyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeAssetPropertyRequest
 @see AWSIotsitewiseDescribeAssetPropertyResponse
 */
- (AWSTask<AWSIotsitewiseDescribeAssetPropertyResponse *> *)describeAssetProperty:(AWSIotsitewiseDescribeAssetPropertyRequest *)request;

/**
 <p>Retrieves information about an asset's property.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAssetProperty service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeAssetPropertyRequest
 @see AWSIotsitewiseDescribeAssetPropertyResponse
 */
- (void)describeAssetProperty:(AWSIotsitewiseDescribeAssetPropertyRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDescribeAssetPropertyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDescribeDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeDashboardRequest
 @see AWSIotsitewiseDescribeDashboardResponse
 */
- (AWSTask<AWSIotsitewiseDescribeDashboardResponse *> *)describeDashboard:(AWSIotsitewiseDescribeDashboardRequest *)request;

/**
 <p>Retrieves information about a dashboard.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeDashboardRequest
 @see AWSIotsitewiseDescribeDashboardResponse
 */
- (void)describeDashboard:(AWSIotsitewiseDescribeDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDescribeDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a gateway.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDescribeGatewayResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeGatewayRequest
 @see AWSIotsitewiseDescribeGatewayResponse
 */
- (AWSTask<AWSIotsitewiseDescribeGatewayResponse *> *)describeGateway:(AWSIotsitewiseDescribeGatewayRequest *)request;

/**
 <p>Retrieves information about a gateway.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeGatewayRequest
 @see AWSIotsitewiseDescribeGatewayResponse
 */
- (void)describeGateway:(AWSIotsitewiseDescribeGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDescribeGatewayResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a gateway capability configuration. Each gateway capability defines data sources for a gateway. A capability configuration can contain multiple data source configurations. If you define OPC-UA sources for a gateway in the AWS IoT SiteWise console, all of your OPC-UA sources are stored in one capability configuration. To list all capability configurations for a gateway, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGatewayCapabilityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeGatewayCapabilityConfigurationRequest
 @see AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse
 */
- (AWSTask<AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse *> *)describeGatewayCapabilityConfiguration:(AWSIotsitewiseDescribeGatewayCapabilityConfigurationRequest *)request;

/**
 <p>Retrieves information about a gateway capability configuration. Each gateway capability defines data sources for a gateway. A capability configuration can contain multiple data source configurations. If you define OPC-UA sources for a gateway in the AWS IoT SiteWise console, all of your OPC-UA sources are stored in one capability configuration. To list all capability configurations for a gateway, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGatewayCapabilityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeGatewayCapabilityConfigurationRequest
 @see AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse
 */
- (void)describeGatewayCapabilityConfiguration:(AWSIotsitewiseDescribeGatewayCapabilityConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the current AWS IoT SiteWise logging options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoggingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDescribeLoggingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorResourceNotFound`.
 
 @see AWSIotsitewiseDescribeLoggingOptionsRequest
 @see AWSIotsitewiseDescribeLoggingOptionsResponse
 */
- (AWSTask<AWSIotsitewiseDescribeLoggingOptionsResponse *> *)describeLoggingOptions:(AWSIotsitewiseDescribeLoggingOptionsRequest *)request;

/**
 <p>Retrieves the current AWS IoT SiteWise logging options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoggingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorResourceNotFound`.
 
 @see AWSIotsitewiseDescribeLoggingOptionsRequest
 @see AWSIotsitewiseDescribeLoggingOptionsResponse
 */
- (void)describeLoggingOptions:(AWSIotsitewiseDescribeLoggingOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDescribeLoggingOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a portal.</p>
 
 @param request A container for the necessary parameters to execute the DescribePortal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDescribePortalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribePortalRequest
 @see AWSIotsitewiseDescribePortalResponse
 */
- (AWSTask<AWSIotsitewiseDescribePortalResponse *> *)describePortal:(AWSIotsitewiseDescribePortalRequest *)request;

/**
 <p>Retrieves information about a portal.</p>
 
 @param request A container for the necessary parameters to execute the DescribePortal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribePortalRequest
 @see AWSIotsitewiseDescribePortalResponse
 */
- (void)describePortal:(AWSIotsitewiseDescribePortalRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDescribePortalResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a project.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseDescribeProjectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeProjectRequest
 @see AWSIotsitewiseDescribeProjectResponse
 */
- (AWSTask<AWSIotsitewiseDescribeProjectResponse *> *)describeProject:(AWSIotsitewiseDescribeProjectRequest *)request;

/**
 <p>Retrieves information about a project.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseDescribeProjectRequest
 @see AWSIotsitewiseDescribeProjectResponse
 */
- (void)describeProject:(AWSIotsitewiseDescribeProjectRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseDescribeProjectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a child asset from the given parent asset through a hierarchy defined in the parent asset's model.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseDisassociateAssetsRequest
 */
- (AWSTask *)disassociateAssets:(AWSIotsitewiseDisassociateAssetsRequest *)request;

/**
 <p>Disassociates a child asset from the given parent asset through a hierarchy defined in the parent asset's model.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseDisassociateAssetsRequest
 */
- (void)disassociateAssets:(AWSIotsitewiseDisassociateAssetsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets aggregated values for an asset property. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#aggregates">Querying Aggregated Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyAggregates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseGetAssetPropertyAggregatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorServiceUnavailable`.
 
 @see AWSIotsitewiseGetAssetPropertyAggregatesRequest
 @see AWSIotsitewiseGetAssetPropertyAggregatesResponse
 */
- (AWSTask<AWSIotsitewiseGetAssetPropertyAggregatesResponse *> *)getAssetPropertyAggregates:(AWSIotsitewiseGetAssetPropertyAggregatesRequest *)request;

/**
 <p>Gets aggregated values for an asset property. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#aggregates">Querying Aggregated Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyAggregates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorServiceUnavailable`.
 
 @see AWSIotsitewiseGetAssetPropertyAggregatesRequest
 @see AWSIotsitewiseGetAssetPropertyAggregatesResponse
 */
- (void)getAssetPropertyAggregates:(AWSIotsitewiseGetAssetPropertyAggregatesRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseGetAssetPropertyAggregatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets an asset property's current value. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#current-values">Querying Current Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyValue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseGetAssetPropertyValueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorServiceUnavailable`.
 
 @see AWSIotsitewiseGetAssetPropertyValueRequest
 @see AWSIotsitewiseGetAssetPropertyValueResponse
 */
- (AWSTask<AWSIotsitewiseGetAssetPropertyValueResponse *> *)getAssetPropertyValue:(AWSIotsitewiseGetAssetPropertyValueRequest *)request;

/**
 <p>Gets an asset property's current value. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#current-values">Querying Current Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyValue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorServiceUnavailable`.
 
 @see AWSIotsitewiseGetAssetPropertyValueRequest
 @see AWSIotsitewiseGetAssetPropertyValueResponse
 */
- (void)getAssetPropertyValue:(AWSIotsitewiseGetAssetPropertyValueRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseGetAssetPropertyValueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the history of an asset property's values. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#historical-values">Querying Historical Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyValueHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseGetAssetPropertyValueHistoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorServiceUnavailable`.
 
 @see AWSIotsitewiseGetAssetPropertyValueHistoryRequest
 @see AWSIotsitewiseGetAssetPropertyValueHistoryResponse
 */
- (AWSTask<AWSIotsitewiseGetAssetPropertyValueHistoryResponse *> *)getAssetPropertyValueHistory:(AWSIotsitewiseGetAssetPropertyValueHistoryRequest *)request;

/**
 <p>Gets the history of an asset property's values. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#historical-values">Querying Historical Property Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>To identify an asset property, you must specify one of the following:</p><ul><li><p>The <code>assetId</code> and <code>propertyId</code> of an asset property.</p></li><li><p>A <code>propertyAlias</code>, which is a data stream alias (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset property's alias, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetAssetPropertyValueHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorServiceUnavailable`.
 
 @see AWSIotsitewiseGetAssetPropertyValueHistoryRequest
 @see AWSIotsitewiseGetAssetPropertyValueHistoryResponse
 */
- (void)getAssetPropertyValueHistory:(AWSIotsitewiseGetAssetPropertyValueHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseGetAssetPropertyValueHistoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of access policies for an AWS SSO identity (a user or group) or an AWS IoT SiteWise Monitor resource (a portal or project).</p>
 
 @param request A container for the necessary parameters to execute the ListAccessPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseListAccessPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListAccessPoliciesRequest
 @see AWSIotsitewiseListAccessPoliciesResponse
 */
- (AWSTask<AWSIotsitewiseListAccessPoliciesResponse *> *)listAccessPolicies:(AWSIotsitewiseListAccessPoliciesRequest *)request;

/**
 <p>Retrieves a paginated list of access policies for an AWS SSO identity (a user or group) or an AWS IoT SiteWise Monitor resource (a portal or project).</p>
 
 @param request A container for the necessary parameters to execute the ListAccessPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListAccessPoliciesRequest
 @see AWSIotsitewiseListAccessPoliciesResponse
 */
- (void)listAccessPolicies:(AWSIotsitewiseListAccessPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseListAccessPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of summaries of all asset models.</p>
 
 @param request A container for the necessary parameters to execute the ListAssetModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseListAssetModelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListAssetModelsRequest
 @see AWSIotsitewiseListAssetModelsResponse
 */
- (AWSTask<AWSIotsitewiseListAssetModelsResponse *> *)listAssetModels:(AWSIotsitewiseListAssetModelsRequest *)request;

/**
 <p>Retrieves a paginated list of summaries of all asset models.</p>
 
 @param request A container for the necessary parameters to execute the ListAssetModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListAssetModelsRequest
 @see AWSIotsitewiseListAssetModelsResponse
 */
- (void)listAssetModels:(AWSIotsitewiseListAssetModelsRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseListAssetModelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of asset summaries.</p><p>You can use this operation to do the following:</p><ul><li><p>List assets based on a specific asset model.</p></li><li><p>List top-level assets.</p></li></ul><p>You can't use this operation to list all assets. To retrieve summaries for all of your assets, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_ListAssetModels.html">ListAssetModels</a> to get all of your asset model IDs. Then, use ListAssets to get all assets for each asset model.</p>
 
 @param request A container for the necessary parameters to execute the ListAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseListAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListAssetsRequest
 @see AWSIotsitewiseListAssetsResponse
 */
- (AWSTask<AWSIotsitewiseListAssetsResponse *> *)listAssets:(AWSIotsitewiseListAssetsRequest *)request;

/**
 <p>Retrieves a paginated list of asset summaries.</p><p>You can use this operation to do the following:</p><ul><li><p>List assets based on a specific asset model.</p></li><li><p>List top-level assets.</p></li></ul><p>You can't use this operation to list all assets. To retrieve summaries for all of your assets, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_ListAssetModels.html">ListAssetModels</a> to get all of your asset model IDs. Then, use ListAssets to get all assets for each asset model.</p>
 
 @param request A container for the necessary parameters to execute the ListAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListAssetsRequest
 @see AWSIotsitewiseListAssetsResponse
 */
- (void)listAssets:(AWSIotsitewiseListAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseListAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of the assets associated to a parent asset (<code>assetId</code>) by a given hierarchy (<code>hierarchyId</code>).</p>
 
 @param request A container for the necessary parameters to execute the ListAssociatedAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseListAssociatedAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListAssociatedAssetsRequest
 @see AWSIotsitewiseListAssociatedAssetsResponse
 */
- (AWSTask<AWSIotsitewiseListAssociatedAssetsResponse *> *)listAssociatedAssets:(AWSIotsitewiseListAssociatedAssetsRequest *)request;

/**
 <p>Retrieves a paginated list of the assets associated to a parent asset (<code>assetId</code>) by a given hierarchy (<code>hierarchyId</code>).</p>
 
 @param request A container for the necessary parameters to execute the ListAssociatedAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListAssociatedAssetsRequest
 @see AWSIotsitewiseListAssociatedAssetsResponse
 */
- (void)listAssociatedAssets:(AWSIotsitewiseListAssociatedAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseListAssociatedAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of dashboards for an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the ListDashboards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseListDashboardsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListDashboardsRequest
 @see AWSIotsitewiseListDashboardsResponse
 */
- (AWSTask<AWSIotsitewiseListDashboardsResponse *> *)listDashboards:(AWSIotsitewiseListDashboardsRequest *)request;

/**
 <p>Retrieves a paginated list of dashboards for an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the ListDashboards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListDashboardsRequest
 @see AWSIotsitewiseListDashboardsResponse
 */
- (void)listDashboards:(AWSIotsitewiseListDashboardsRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseListDashboardsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseListGatewaysResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListGatewaysRequest
 @see AWSIotsitewiseListGatewaysResponse
 */
- (AWSTask<AWSIotsitewiseListGatewaysResponse *> *)listGateways:(AWSIotsitewiseListGatewaysRequest *)request;

/**
 <p>Retrieves a paginated list of gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListGatewaysRequest
 @see AWSIotsitewiseListGatewaysResponse
 */
- (void)listGateways:(AWSIotsitewiseListGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseListGatewaysResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of AWS IoT SiteWise Monitor portals.</p>
 
 @param request A container for the necessary parameters to execute the ListPortals service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseListPortalsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListPortalsRequest
 @see AWSIotsitewiseListPortalsResponse
 */
- (AWSTask<AWSIotsitewiseListPortalsResponse *> *)listPortals:(AWSIotsitewiseListPortalsRequest *)request;

/**
 <p>Retrieves a paginated list of AWS IoT SiteWise Monitor portals.</p>
 
 @param request A container for the necessary parameters to execute the ListPortals service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListPortalsRequest
 @see AWSIotsitewiseListPortalsResponse
 */
- (void)listPortals:(AWSIotsitewiseListPortalsRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseListPortalsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of assets associated with an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the ListProjectAssets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseListProjectAssetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListProjectAssetsRequest
 @see AWSIotsitewiseListProjectAssetsResponse
 */
- (AWSTask<AWSIotsitewiseListProjectAssetsResponse *> *)listProjectAssets:(AWSIotsitewiseListProjectAssetsRequest *)request;

/**
 <p>Retrieves a paginated list of assets associated with an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the ListProjectAssets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListProjectAssetsRequest
 @see AWSIotsitewiseListProjectAssetsResponse
 */
- (void)listProjectAssets:(AWSIotsitewiseListProjectAssetsRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseListProjectAssetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a paginated list of projects for an AWS IoT SiteWise Monitor portal.</p>
 
 @param request A container for the necessary parameters to execute the ListProjects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseListProjectsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListProjectsRequest
 @see AWSIotsitewiseListProjectsResponse
 */
- (AWSTask<AWSIotsitewiseListProjectsResponse *> *)listProjects:(AWSIotsitewiseListProjectsRequest *)request;

/**
 <p>Retrieves a paginated list of projects for an AWS IoT SiteWise Monitor portal.</p>
 
 @param request A container for the necessary parameters to execute the ListProjects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseListProjectsRequest
 @see AWSIotsitewiseListProjectsResponse
 */
- (void)listProjects:(AWSIotsitewiseListProjectsRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseListProjectsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the list of tags for an AWS IoT SiteWise resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorResourceNotFound`.
 
 @see AWSIotsitewiseListTagsForResourceRequest
 @see AWSIotsitewiseListTagsForResourceResponse
 */
- (AWSTask<AWSIotsitewiseListTagsForResourceResponse *> *)listTagsForResource:(AWSIotsitewiseListTagsForResourceRequest *)request;

/**
 <p>Retrieves the list of tags for an AWS IoT SiteWise resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorResourceNotFound`.
 
 @see AWSIotsitewiseListTagsForResourceRequest
 @see AWSIotsitewiseListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSIotsitewiseListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets logging options for AWS IoT SiteWise.</p>
 
 @param request A container for the necessary parameters to execute the PutLoggingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewisePutLoggingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorConflictingOperation`, `AWSIotsitewiseErrorResourceNotFound`.
 
 @see AWSIotsitewisePutLoggingOptionsRequest
 @see AWSIotsitewisePutLoggingOptionsResponse
 */
- (AWSTask<AWSIotsitewisePutLoggingOptionsResponse *> *)putLoggingOptions:(AWSIotsitewisePutLoggingOptionsRequest *)request;

/**
 <p>Sets logging options for AWS IoT SiteWise.</p>
 
 @param request A container for the necessary parameters to execute the PutLoggingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorConflictingOperation`, `AWSIotsitewiseErrorResourceNotFound`.
 
 @see AWSIotsitewisePutLoggingOptionsRequest
 @see AWSIotsitewisePutLoggingOptionsResponse
 */
- (void)putLoggingOptions:(AWSIotsitewisePutLoggingOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewisePutLoggingOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds tags to an AWS IoT SiteWise resource. If a tag already exists for the resource, this operation updates the tag's value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorTooManyTags`.
 
 @see AWSIotsitewiseTagResourceRequest
 @see AWSIotsitewiseTagResourceResponse
 */
- (AWSTask<AWSIotsitewiseTagResourceResponse *> *)tagResource:(AWSIotsitewiseTagResourceRequest *)request;

/**
 <p>Adds tags to an AWS IoT SiteWise resource. If a tag already exists for the resource, this operation updates the tag's value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorTooManyTags`.
 
 @see AWSIotsitewiseTagResourceRequest
 @see AWSIotsitewiseTagResourceResponse
 */
- (void)tagResource:(AWSIotsitewiseTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a tag from an AWS IoT SiteWise resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorResourceNotFound`.
 
 @see AWSIotsitewiseUntagResourceRequest
 @see AWSIotsitewiseUntagResourceResponse
 */
- (AWSTask<AWSIotsitewiseUntagResourceResponse *> *)untagResource:(AWSIotsitewiseUntagResourceRequest *)request;

/**
 <p>Removes a tag from an AWS IoT SiteWise resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorResourceNotFound`.
 
 @see AWSIotsitewiseUntagResourceRequest
 @see AWSIotsitewiseUntagResourceResponse
 */
- (void)untagResource:(AWSIotsitewiseUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing access policy that specifies an AWS SSO user or group's access to an AWS IoT SiteWise Monitor portal or project resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAccessPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseUpdateAccessPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseUpdateAccessPolicyRequest
 @see AWSIotsitewiseUpdateAccessPolicyResponse
 */
- (AWSTask<AWSIotsitewiseUpdateAccessPolicyResponse *> *)updateAccessPolicy:(AWSIotsitewiseUpdateAccessPolicyRequest *)request;

/**
 <p>Updates an existing access policy that specifies an AWS SSO user or group's access to an AWS IoT SiteWise Monitor portal or project resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAccessPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseUpdateAccessPolicyRequest
 @see AWSIotsitewiseUpdateAccessPolicyResponse
 */
- (void)updateAccessPolicy:(AWSIotsitewiseUpdateAccessPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseUpdateAccessPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an asset's name. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAsset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseUpdateAssetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceAlreadyExists`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseUpdateAssetRequest
 @see AWSIotsitewiseUpdateAssetResponse
 */
- (AWSTask<AWSIotsitewiseUpdateAssetResponse *> *)updateAsset:(AWSIotsitewiseUpdateAssetRequest *)request;

/**
 <p>Updates an asset's name. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAsset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceAlreadyExists`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseUpdateAssetRequest
 @see AWSIotsitewiseUpdateAssetResponse
 */
- (void)updateAsset:(AWSIotsitewiseUpdateAssetRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseUpdateAssetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an asset model and all of the assets that were created from the model. Each asset created from the model inherits the updated asset model's property and hierarchy definitions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><important><p>This operation overwrites the existing model with the provided model. To avoid deleting your asset model's properties or hierarchies, you must include their IDs and definitions in the updated asset model payload. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetModel.html">DescribeAssetModel</a>.</p><p>If you remove a property from an asset model or update a property's formula expression, AWS IoT SiteWise deletes all previous data for that property. If you remove a hierarchy definition from an asset model, AWS IoT SiteWise disassociates every asset associated with that hierarchy. You can't change the type or data type of an existing property.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssetModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseUpdateAssetModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceAlreadyExists`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorLimitExceeded`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseUpdateAssetModelRequest
 @see AWSIotsitewiseUpdateAssetModelResponse
 */
- (AWSTask<AWSIotsitewiseUpdateAssetModelResponse *> *)updateAssetModel:(AWSIotsitewiseUpdateAssetModelRequest *)request;

/**
 <p>Updates an asset model and all of the assets that were created from the model. Each asset created from the model inherits the updated asset model's property and hierarchy definitions. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating Assets and Models</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><important><p>This operation overwrites the existing model with the provided model. To avoid deleting your asset model's properties or hierarchies, you must include their IDs and definitions in the updated asset model payload. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetModel.html">DescribeAssetModel</a>.</p><p>If you remove a property from an asset model or update a property's formula expression, AWS IoT SiteWise deletes all previous data for that property. If you remove a hierarchy definition from an asset model, AWS IoT SiteWise disassociates every asset associated with that hierarchy. You can't change the type or data type of an existing property.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssetModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceAlreadyExists`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorLimitExceeded`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseUpdateAssetModelRequest
 @see AWSIotsitewiseUpdateAssetModelResponse
 */
- (void)updateAssetModel:(AWSIotsitewiseUpdateAssetModelRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseUpdateAssetModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an asset property's alias and notification state.</p><important><p>This operation overwrites the property's existing alias and notification state. To keep your existing property's alias or notification state, you must include the existing values in the UpdateAssetProperty request. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetProperty.html">DescribeAssetProperty</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssetProperty service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseUpdateAssetPropertyRequest
 */
- (AWSTask *)updateAssetProperty:(AWSIotsitewiseUpdateAssetPropertyRequest *)request;

/**
 <p>Updates an asset property's alias and notification state.</p><important><p>This operation overwrites the property's existing alias and notification state. To keep your existing property's alias or notification state, you must include the existing values in the UpdateAssetProperty request. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetProperty.html">DescribeAssetProperty</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateAssetProperty service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseUpdateAssetPropertyRequest
 */
- (void)updateAssetProperty:(AWSIotsitewiseUpdateAssetPropertyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates an AWS IoT SiteWise Monitor dashboard.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseUpdateDashboardResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseUpdateDashboardRequest
 @see AWSIotsitewiseUpdateDashboardResponse
 */
- (AWSTask<AWSIotsitewiseUpdateDashboardResponse *> *)updateDashboard:(AWSIotsitewiseUpdateDashboardRequest *)request;

/**
 <p>Updates an AWS IoT SiteWise Monitor dashboard.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseUpdateDashboardRequest
 @see AWSIotsitewiseUpdateDashboardResponse
 */
- (void)updateDashboard:(AWSIotsitewiseUpdateDashboardRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseUpdateDashboardResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a gateway's name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorConflictingOperation`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseUpdateGatewayRequest
 */
- (AWSTask *)updateGateway:(AWSIotsitewiseUpdateGatewayRequest *)request;

/**
 <p>Updates a gateway's name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorConflictingOperation`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseUpdateGatewayRequest
 */
- (void)updateGateway:(AWSIotsitewiseUpdateGatewayRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates a gateway capability configuration or defines a new capability configuration. Each gateway capability defines data sources for a gateway. A capability configuration can contain multiple data source configurations. If you define OPC-UA sources for a gateway in the AWS IoT SiteWise console, all of your OPC-UA sources are stored in one capability configuration. To list all capability configurations for a gateway, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGatewayCapabilityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorConflictingOperation`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseUpdateGatewayCapabilityConfigurationRequest
 @see AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse
 */
- (AWSTask<AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse *> *)updateGatewayCapabilityConfiguration:(AWSIotsitewiseUpdateGatewayCapabilityConfigurationRequest *)request;

/**
 <p>Updates a gateway capability configuration or defines a new capability configuration. Each gateway capability defines data sources for a gateway. A capability configuration can contain multiple data source configurations. If you define OPC-UA sources for a gateway in the AWS IoT SiteWise console, all of your OPC-UA sources are stored in one capability configuration. To list all capability configurations for a gateway, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGatewayCapabilityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorConflictingOperation`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorLimitExceeded`.
 
 @see AWSIotsitewiseUpdateGatewayCapabilityConfigurationRequest
 @see AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse
 */
- (void)updateGatewayCapabilityConfiguration:(AWSIotsitewiseUpdateGatewayCapabilityConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an AWS IoT SiteWise Monitor portal.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePortal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseUpdatePortalResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseUpdatePortalRequest
 @see AWSIotsitewiseUpdatePortalResponse
 */
- (AWSTask<AWSIotsitewiseUpdatePortalResponse *> *)updatePortal:(AWSIotsitewiseUpdatePortalRequest *)request;

/**
 <p>Updates an AWS IoT SiteWise Monitor portal.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePortal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`, `AWSIotsitewiseErrorConflictingOperation`.
 
 @see AWSIotsitewiseUpdatePortalRequest
 @see AWSIotsitewiseUpdatePortalResponse
 */
- (void)updatePortal:(AWSIotsitewiseUpdatePortalRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseUpdatePortalResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIotsitewiseUpdateProjectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseUpdateProjectRequest
 @see AWSIotsitewiseUpdateProjectResponse
 */
- (AWSTask<AWSIotsitewiseUpdateProjectResponse *> *)updateProject:(AWSIotsitewiseUpdateProjectRequest *)request;

/**
 <p>Updates an AWS IoT SiteWise Monitor project.</p>
 
 @param request A container for the necessary parameters to execute the UpdateProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIotsitewiseErrorDomain` domain and the following error code: `AWSIotsitewiseErrorInvalidRequest`, `AWSIotsitewiseErrorResourceNotFound`, `AWSIotsitewiseErrorInternalFailure`, `AWSIotsitewiseErrorThrottling`.
 
 @see AWSIotsitewiseUpdateProjectRequest
 @see AWSIotsitewiseUpdateProjectResponse
 */
- (void)updateProject:(AWSIotsitewiseUpdateProjectRequest *)request completionHandler:(void (^ _Nullable)(AWSIotsitewiseUpdateProjectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
