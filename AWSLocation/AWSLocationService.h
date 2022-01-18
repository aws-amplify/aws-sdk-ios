//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSLocationModel.h"
#import "AWSLocationResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSLocation
FOUNDATION_EXPORT NSString *const AWSLocationSDKVersion;

/**
 <p>Suite of geospatial services including Maps, Places, Routes, Tracking, and Geofencing</p>
 */
@interface AWSLocation : AWSService

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

     let Location = AWSLocation.default()

 *Objective-C*

     AWSLocation *Location = [AWSLocation defaultLocation];

 @return The default service client.
 */
+ (instancetype)defaultLocation;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLocation.register(with: configuration!, forKey: "USWest2Location")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLocation registerLocationWithConfiguration:configuration forKey:@"USWest2Location"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Location = AWSLocation(forKey: "USWest2Location")

 *Objective-C*

     AWSLocation *Location = [AWSLocation LocationForKey:@"USWest2Location"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerLocationWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerLocationWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLocation.register(with: configuration!, forKey: "USWest2Location")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLocation registerLocationWithConfiguration:configuration forKey:@"USWest2Location"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Location = AWSLocation(forKey: "USWest2Location")

 *Objective-C*

     AWSLocation *Location = [AWSLocation LocationForKey:@"USWest2Location"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)LocationForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeLocationForKey:(NSString *)key;

/**
 <p>Creates an association between a geofence collection and a tracker resource. This allows the tracker resource to communicate location data to the linked geofence collection. </p><p>You can associate up to five geofence collections to each tracker resource.</p><note><p>Currently not supported — Cross-account configurations, such as creating associations between a tracker resource in one account and a geofence collection in another account.</p></note>
 
 @param request A container for the necessary parameters to execute the AssociateTrackerConsumer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationAssociateTrackerConsumerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorServiceQuotaExceeded`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationAssociateTrackerConsumerRequest
 @see AWSLocationAssociateTrackerConsumerResponse
 */
- (AWSTask<AWSLocationAssociateTrackerConsumerResponse *> *)associateTrackerConsumer:(AWSLocationAssociateTrackerConsumerRequest *)request;

/**
 <p>Creates an association between a geofence collection and a tracker resource. This allows the tracker resource to communicate location data to the linked geofence collection. </p><p>You can associate up to five geofence collections to each tracker resource.</p><note><p>Currently not supported — Cross-account configurations, such as creating associations between a tracker resource in one account and a geofence collection in another account.</p></note>
 
 @param request A container for the necessary parameters to execute the AssociateTrackerConsumer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorServiceQuotaExceeded`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationAssociateTrackerConsumerRequest
 @see AWSLocationAssociateTrackerConsumerResponse
 */
- (void)associateTrackerConsumer:(AWSLocationAssociateTrackerConsumerRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationAssociateTrackerConsumerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the position history of one or more devices from a tracker resource.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteDevicePositionHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationBatchDeleteDevicePositionHistoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchDeleteDevicePositionHistoryRequest
 @see AWSLocationBatchDeleteDevicePositionHistoryResponse
 */
- (AWSTask<AWSLocationBatchDeleteDevicePositionHistoryResponse *> *)batchDeleteDevicePositionHistory:(AWSLocationBatchDeleteDevicePositionHistoryRequest *)request;

/**
 <p>Deletes the position history of one or more devices from a tracker resource.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteDevicePositionHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchDeleteDevicePositionHistoryRequest
 @see AWSLocationBatchDeleteDevicePositionHistoryResponse
 */
- (void)batchDeleteDevicePositionHistory:(AWSLocationBatchDeleteDevicePositionHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationBatchDeleteDevicePositionHistoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a batch of geofences from a geofence collection.</p><note><p>This operation deletes the resource permanently.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchDeleteGeofence service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationBatchDeleteGeofenceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchDeleteGeofenceRequest
 @see AWSLocationBatchDeleteGeofenceResponse
 */
- (AWSTask<AWSLocationBatchDeleteGeofenceResponse *> *)batchDeleteGeofence:(AWSLocationBatchDeleteGeofenceRequest *)request;

/**
 <p>Deletes a batch of geofences from a geofence collection.</p><note><p>This operation deletes the resource permanently.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchDeleteGeofence service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchDeleteGeofenceRequest
 @see AWSLocationBatchDeleteGeofenceResponse
 */
- (void)batchDeleteGeofence:(AWSLocationBatchDeleteGeofenceRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationBatchDeleteGeofenceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Evaluates device positions against the geofence geometries from a given geofence collection.</p><p>This operation always returns an empty response because geofences are asynchronously evaluated. The evaluation determines if the device has entered or exited a geofenced area, and then publishes one of the following events to Amazon EventBridge:</p><ul><li><p><code>ENTER</code> if Amazon Location determines that the tracked device has entered a geofenced area.</p></li><li><p><code>EXIT</code> if Amazon Location determines that the tracked device has exited a geofenced area.</p></li></ul><note><p>The last geofence that a device was observed within is tracked for 30 days after the most recent device position update.</p></note><note><p>Geofence evaluation uses the given device position. It does not account for the optional <code>Accuracy</code> of a <code>DevicePositionUpdate</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchEvaluateGeofences service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationBatchEvaluateGeofencesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchEvaluateGeofencesRequest
 @see AWSLocationBatchEvaluateGeofencesResponse
 */
- (AWSTask<AWSLocationBatchEvaluateGeofencesResponse *> *)batchEvaluateGeofences:(AWSLocationBatchEvaluateGeofencesRequest *)request;

/**
 <p>Evaluates device positions against the geofence geometries from a given geofence collection.</p><p>This operation always returns an empty response because geofences are asynchronously evaluated. The evaluation determines if the device has entered or exited a geofenced area, and then publishes one of the following events to Amazon EventBridge:</p><ul><li><p><code>ENTER</code> if Amazon Location determines that the tracked device has entered a geofenced area.</p></li><li><p><code>EXIT</code> if Amazon Location determines that the tracked device has exited a geofenced area.</p></li></ul><note><p>The last geofence that a device was observed within is tracked for 30 days after the most recent device position update.</p></note><note><p>Geofence evaluation uses the given device position. It does not account for the optional <code>Accuracy</code> of a <code>DevicePositionUpdate</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchEvaluateGeofences service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchEvaluateGeofencesRequest
 @see AWSLocationBatchEvaluateGeofencesResponse
 */
- (void)batchEvaluateGeofences:(AWSLocationBatchEvaluateGeofencesRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationBatchEvaluateGeofencesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the latest device positions for requested devices.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDevicePosition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationBatchGetDevicePositionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchGetDevicePositionRequest
 @see AWSLocationBatchGetDevicePositionResponse
 */
- (AWSTask<AWSLocationBatchGetDevicePositionResponse *> *)batchGetDevicePosition:(AWSLocationBatchGetDevicePositionRequest *)request;

/**
 <p>Lists the latest device positions for requested devices.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetDevicePosition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchGetDevicePositionRequest
 @see AWSLocationBatchGetDevicePositionResponse
 */
- (void)batchGetDevicePosition:(AWSLocationBatchGetDevicePositionRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationBatchGetDevicePositionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A batch request for storing geofence geometries into a given geofence collection, or updates the geometry of an existing geofence if a geofence ID is included in the request.</p>
 
 @param request A container for the necessary parameters to execute the BatchPutGeofence service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationBatchPutGeofenceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchPutGeofenceRequest
 @see AWSLocationBatchPutGeofenceResponse
 */
- (AWSTask<AWSLocationBatchPutGeofenceResponse *> *)batchPutGeofence:(AWSLocationBatchPutGeofenceRequest *)request;

/**
 <p>A batch request for storing geofence geometries into a given geofence collection, or updates the geometry of an existing geofence if a geofence ID is included in the request.</p>
 
 @param request A container for the necessary parameters to execute the BatchPutGeofence service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchPutGeofenceRequest
 @see AWSLocationBatchPutGeofenceResponse
 */
- (void)batchPutGeofence:(AWSLocationBatchPutGeofenceRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationBatchPutGeofenceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Uploads position update data for one or more devices to a tracker resource. Amazon Location uses the data when it reports the last known device position and position history. Amazon Location retains location data for 30 days.</p><note><p>Position updates are handled based on the <code>PositionFiltering</code> property of the tracker. When <code>PositionFiltering</code> is set to <code>TimeBased</code>, updates are evaluated against linked geofence collections, and location data is stored at a maximum of one position per 30 second interval. If your update frequency is more often than every 30 seconds, only one update per 30 seconds is stored for each unique device ID.</p><p>When <code>PositionFiltering</code> is set to <code>DistanceBased</code> filtering, location data is stored and evaluated against linked geofence collections only if the device has moved more than 30 m (98.4 ft).</p><p>When <code>PositionFiltering</code> is set to <code>AccuracyBased</code> filtering, location data is stored and evaluated against linked geofence collections only if the device has moved more than the measured accuracy. For example, if two consecutive updates from a device have a horizontal accuracy of 5 m and 10 m, the second update is neither stored or evaluated if the device has moved less than 15 m. If <code>PositionFiltering</code> is set to <code>AccuracyBased</code> filtering, Amazon Location uses the default value <code>{ "Horizontal": 0}</code> when accuracy is not provided on a <code>DevicePositionUpdate</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchUpdateDevicePosition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationBatchUpdateDevicePositionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchUpdateDevicePositionRequest
 @see AWSLocationBatchUpdateDevicePositionResponse
 */
- (AWSTask<AWSLocationBatchUpdateDevicePositionResponse *> *)batchUpdateDevicePosition:(AWSLocationBatchUpdateDevicePositionRequest *)request;

/**
 <p>Uploads position update data for one or more devices to a tracker resource. Amazon Location uses the data when it reports the last known device position and position history. Amazon Location retains location data for 30 days.</p><note><p>Position updates are handled based on the <code>PositionFiltering</code> property of the tracker. When <code>PositionFiltering</code> is set to <code>TimeBased</code>, updates are evaluated against linked geofence collections, and location data is stored at a maximum of one position per 30 second interval. If your update frequency is more often than every 30 seconds, only one update per 30 seconds is stored for each unique device ID.</p><p>When <code>PositionFiltering</code> is set to <code>DistanceBased</code> filtering, location data is stored and evaluated against linked geofence collections only if the device has moved more than 30 m (98.4 ft).</p><p>When <code>PositionFiltering</code> is set to <code>AccuracyBased</code> filtering, location data is stored and evaluated against linked geofence collections only if the device has moved more than the measured accuracy. For example, if two consecutive updates from a device have a horizontal accuracy of 5 m and 10 m, the second update is neither stored or evaluated if the device has moved less than 15 m. If <code>PositionFiltering</code> is set to <code>AccuracyBased</code> filtering, Amazon Location uses the default value <code>{ "Horizontal": 0}</code> when accuracy is not provided on a <code>DevicePositionUpdate</code>.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchUpdateDevicePosition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationBatchUpdateDevicePositionRequest
 @see AWSLocationBatchUpdateDevicePositionResponse
 */
- (void)batchUpdateDevicePosition:(AWSLocationBatchUpdateDevicePositionRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationBatchUpdateDevicePositionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html">Calculates a route</a> given the following required parameters: <code>DeparturePosition</code> and <code>DestinationPosition</code>. Requires that you first <a href="https://docs.aws.amazon.com/location-routes/latest/APIReference/API_CreateRouteCalculator.html">create a route calculator resource</a>.</p><p>By default, a request that doesn't specify a departure time uses the best time of day to travel with the best traffic conditions when calculating the route.</p><p>Additional options include:</p><ul><li><p><a href="https://docs.aws.amazon.com/location/latest/developerguide/departure-time.html">Specifying a departure time</a> using either <code>DepartureTime</code> or <code>DepartNow</code>. This calculates a route based on predictive traffic data at the given time. </p><note><p>You can't specify both <code>DepartureTime</code> and <code>DepartNow</code> in a single request. Specifying both parameters returns a validation error.</p></note></li><li><p><a href="https://docs.aws.amazon.com/location/latest/developerguide/travel-mode.html">Specifying a travel mode</a> using TravelMode sets the transportation mode used to calculate the routes. This also lets you specify additional route preferences in <code>CarModeOptions</code> if traveling by <code>Car</code>, or <code>TruckModeOptions</code> if traveling by <code>Truck</code>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CalculateRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationCalculateRouteResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCalculateRouteRequest
 @see AWSLocationCalculateRouteResponse
 */
- (AWSTask<AWSLocationCalculateRouteResponse *> *)calculateRoute:(AWSLocationCalculateRouteRequest *)request;

/**
 <p><a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html">Calculates a route</a> given the following required parameters: <code>DeparturePosition</code> and <code>DestinationPosition</code>. Requires that you first <a href="https://docs.aws.amazon.com/location-routes/latest/APIReference/API_CreateRouteCalculator.html">create a route calculator resource</a>.</p><p>By default, a request that doesn't specify a departure time uses the best time of day to travel with the best traffic conditions when calculating the route.</p><p>Additional options include:</p><ul><li><p><a href="https://docs.aws.amazon.com/location/latest/developerguide/departure-time.html">Specifying a departure time</a> using either <code>DepartureTime</code> or <code>DepartNow</code>. This calculates a route based on predictive traffic data at the given time. </p><note><p>You can't specify both <code>DepartureTime</code> and <code>DepartNow</code> in a single request. Specifying both parameters returns a validation error.</p></note></li><li><p><a href="https://docs.aws.amazon.com/location/latest/developerguide/travel-mode.html">Specifying a travel mode</a> using TravelMode sets the transportation mode used to calculate the routes. This also lets you specify additional route preferences in <code>CarModeOptions</code> if traveling by <code>Car</code>, or <code>TruckModeOptions</code> if traveling by <code>Truck</code>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CalculateRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCalculateRouteRequest
 @see AWSLocationCalculateRouteResponse
 */
- (void)calculateRoute:(AWSLocationCalculateRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationCalculateRouteResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route-matrix.html"> Calculates a route matrix</a> given the following required parameters: <code>DeparturePositions</code> and <code>DestinationPositions</code>. <code>CalculateRouteMatrix</code> calculates routes and returns the travel time and travel distance from each departure position to each destination position in the request. For example, given departure positions A and B, and destination positions X and Y, <code>CalculateRouteMatrix</code> will return time and distance for routes from A to X, A to Y, B to X, and B to Y (in that order). The number of results returned (and routes calculated) will be the number of <code>DeparturePositions</code> times the number of <code>DestinationPositions</code>.</p><note><p>Your account is charged for each route calculated, not the number of requests.</p></note><p>Requires that you first <a href="https://docs.aws.amazon.com/location-routes/latest/APIReference/API_CreateRouteCalculator.html">create a route calculator resource</a>.</p><p>By default, a request that doesn't specify a departure time uses the best time of day to travel with the best traffic conditions when calculating routes.</p><p>Additional options include:</p><ul><li><p><a href="https://docs.aws.amazon.com/location/latest/developerguide/departure-time.html"> Specifying a departure time</a> using either <code>DepartureTime</code> or <code>DepartNow</code>. This calculates routes based on predictive traffic data at the given time. </p><note><p>You can't specify both <code>DepartureTime</code> and <code>DepartNow</code> in a single request. Specifying both parameters returns a validation error.</p></note></li><li><p><a href="https://docs.aws.amazon.com/location/latest/developerguide/travel-mode.html">Specifying a travel mode</a> using TravelMode sets the transportation mode used to calculate the routes. This also lets you specify additional route preferences in <code>CarModeOptions</code> if traveling by <code>Car</code>, or <code>TruckModeOptions</code> if traveling by <code>Truck</code>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CalculateRouteMatrix service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationCalculateRouteMatrixResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCalculateRouteMatrixRequest
 @see AWSLocationCalculateRouteMatrixResponse
 */
- (AWSTask<AWSLocationCalculateRouteMatrixResponse *> *)calculateRouteMatrix:(AWSLocationCalculateRouteMatrixRequest *)request;

/**
 <p><a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route-matrix.html"> Calculates a route matrix</a> given the following required parameters: <code>DeparturePositions</code> and <code>DestinationPositions</code>. <code>CalculateRouteMatrix</code> calculates routes and returns the travel time and travel distance from each departure position to each destination position in the request. For example, given departure positions A and B, and destination positions X and Y, <code>CalculateRouteMatrix</code> will return time and distance for routes from A to X, A to Y, B to X, and B to Y (in that order). The number of results returned (and routes calculated) will be the number of <code>DeparturePositions</code> times the number of <code>DestinationPositions</code>.</p><note><p>Your account is charged for each route calculated, not the number of requests.</p></note><p>Requires that you first <a href="https://docs.aws.amazon.com/location-routes/latest/APIReference/API_CreateRouteCalculator.html">create a route calculator resource</a>.</p><p>By default, a request that doesn't specify a departure time uses the best time of day to travel with the best traffic conditions when calculating routes.</p><p>Additional options include:</p><ul><li><p><a href="https://docs.aws.amazon.com/location/latest/developerguide/departure-time.html"> Specifying a departure time</a> using either <code>DepartureTime</code> or <code>DepartNow</code>. This calculates routes based on predictive traffic data at the given time. </p><note><p>You can't specify both <code>DepartureTime</code> and <code>DepartNow</code> in a single request. Specifying both parameters returns a validation error.</p></note></li><li><p><a href="https://docs.aws.amazon.com/location/latest/developerguide/travel-mode.html">Specifying a travel mode</a> using TravelMode sets the transportation mode used to calculate the routes. This also lets you specify additional route preferences in <code>CarModeOptions</code> if traveling by <code>Car</code>, or <code>TruckModeOptions</code> if traveling by <code>Truck</code>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CalculateRouteMatrix service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCalculateRouteMatrixRequest
 @see AWSLocationCalculateRouteMatrixResponse
 */
- (void)calculateRouteMatrix:(AWSLocationCalculateRouteMatrixRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationCalculateRouteMatrixResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a geofence collection, which manages and stores geofences.</p>
 
 @param request A container for the necessary parameters to execute the CreateGeofenceCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationCreateGeofenceCollectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCreateGeofenceCollectionRequest
 @see AWSLocationCreateGeofenceCollectionResponse
 */
- (AWSTask<AWSLocationCreateGeofenceCollectionResponse *> *)createGeofenceCollection:(AWSLocationCreateGeofenceCollectionRequest *)request;

/**
 <p>Creates a geofence collection, which manages and stores geofences.</p>
 
 @param request A container for the necessary parameters to execute the CreateGeofenceCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCreateGeofenceCollectionRequest
 @see AWSLocationCreateGeofenceCollectionResponse
 */
- (void)createGeofenceCollection:(AWSLocationCreateGeofenceCollectionRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationCreateGeofenceCollectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a map resource in your AWS account, which provides map tiles of different styles sourced from global location data providers.</p><note><p>If your application is tracking or routing assets you use in your business, such as delivery vehicles or employees, you may only use HERE as your geolocation provider. See section 82 of the <a href="http://aws.amazon.com/service-terms">AWS service terms</a> for more details.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateMap service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationCreateMapResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCreateMapRequest
 @see AWSLocationCreateMapResponse
 */
- (AWSTask<AWSLocationCreateMapResponse *> *)createMap:(AWSLocationCreateMapRequest *)request;

/**
 <p>Creates a map resource in your AWS account, which provides map tiles of different styles sourced from global location data providers.</p><note><p>If your application is tracking or routing assets you use in your business, such as delivery vehicles or employees, you may only use HERE as your geolocation provider. See section 82 of the <a href="http://aws.amazon.com/service-terms">AWS service terms</a> for more details.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateMap service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCreateMapRequest
 @see AWSLocationCreateMapResponse
 */
- (void)createMap:(AWSLocationCreateMapRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationCreateMapResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a place index resource in your AWS account. Use a place index resource to geocode addresses and other text queries by using the <code>SearchPlaceIndexForText</code> operation, and reverse geocode coordinates by using the <code>SearchPlaceIndexForPosition</code> operation, and enable autosuggestions by using the <code>SearchPlaceIndexForSuggestions</code> operation.</p><note><p>If your application is tracking or routing assets you use in your business, such as delivery vehicles or employees, you may only use HERE as your geolocation provider. See section 82 of the <a href="http://aws.amazon.com/service-terms">AWS service terms</a> for more details.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePlaceIndex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationCreatePlaceIndexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCreatePlaceIndexRequest
 @see AWSLocationCreatePlaceIndexResponse
 */
- (AWSTask<AWSLocationCreatePlaceIndexResponse *> *)createPlaceIndex:(AWSLocationCreatePlaceIndexRequest *)request;

/**
 <p>Creates a place index resource in your AWS account. Use a place index resource to geocode addresses and other text queries by using the <code>SearchPlaceIndexForText</code> operation, and reverse geocode coordinates by using the <code>SearchPlaceIndexForPosition</code> operation, and enable autosuggestions by using the <code>SearchPlaceIndexForSuggestions</code> operation.</p><note><p>If your application is tracking or routing assets you use in your business, such as delivery vehicles or employees, you may only use HERE as your geolocation provider. See section 82 of the <a href="http://aws.amazon.com/service-terms">AWS service terms</a> for more details.</p></note>
 
 @param request A container for the necessary parameters to execute the CreatePlaceIndex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCreatePlaceIndexRequest
 @see AWSLocationCreatePlaceIndexResponse
 */
- (void)createPlaceIndex:(AWSLocationCreatePlaceIndexRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationCreatePlaceIndexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a route calculator resource in your AWS account.</p><p>You can send requests to a route calculator resource to estimate travel time, distance, and get directions. A route calculator sources traffic and road network data from your chosen data provider.</p><note><p>If your application is tracking or routing assets you use in your business, such as delivery vehicles or employees, you may only use HERE as your geolocation provider. See section 82 of the <a href="http://aws.amazon.com/service-terms">AWS service terms</a> for more details.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateRouteCalculator service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationCreateRouteCalculatorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCreateRouteCalculatorRequest
 @see AWSLocationCreateRouteCalculatorResponse
 */
- (AWSTask<AWSLocationCreateRouteCalculatorResponse *> *)createRouteCalculator:(AWSLocationCreateRouteCalculatorRequest *)request;

/**
 <p>Creates a route calculator resource in your AWS account.</p><p>You can send requests to a route calculator resource to estimate travel time, distance, and get directions. A route calculator sources traffic and road network data from your chosen data provider.</p><note><p>If your application is tracking or routing assets you use in your business, such as delivery vehicles or employees, you may only use HERE as your geolocation provider. See section 82 of the <a href="http://aws.amazon.com/service-terms">AWS service terms</a> for more details.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateRouteCalculator service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCreateRouteCalculatorRequest
 @see AWSLocationCreateRouteCalculatorResponse
 */
- (void)createRouteCalculator:(AWSLocationCreateRouteCalculatorRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationCreateRouteCalculatorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a tracker resource in your AWS account, which lets you retrieve current and historical location of devices.</p>
 
 @param request A container for the necessary parameters to execute the CreateTracker service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationCreateTrackerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCreateTrackerRequest
 @see AWSLocationCreateTrackerResponse
 */
- (AWSTask<AWSLocationCreateTrackerResponse *> *)createTracker:(AWSLocationCreateTrackerRequest *)request;

/**
 <p>Creates a tracker resource in your AWS account, which lets you retrieve current and historical location of devices.</p>
 
 @param request A container for the necessary parameters to execute the CreateTracker service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationCreateTrackerRequest
 @see AWSLocationCreateTrackerResponse
 */
- (void)createTracker:(AWSLocationCreateTrackerRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationCreateTrackerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a geofence collection from your AWS account.</p><note><p>This operation deletes the resource permanently. If the geofence collection is the target of a tracker resource, the devices will no longer be monitored.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteGeofenceCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationDeleteGeofenceCollectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDeleteGeofenceCollectionRequest
 @see AWSLocationDeleteGeofenceCollectionResponse
 */
- (AWSTask<AWSLocationDeleteGeofenceCollectionResponse *> *)deleteGeofenceCollection:(AWSLocationDeleteGeofenceCollectionRequest *)request;

/**
 <p>Deletes a geofence collection from your AWS account.</p><note><p>This operation deletes the resource permanently. If the geofence collection is the target of a tracker resource, the devices will no longer be monitored.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteGeofenceCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDeleteGeofenceCollectionRequest
 @see AWSLocationDeleteGeofenceCollectionResponse
 */
- (void)deleteGeofenceCollection:(AWSLocationDeleteGeofenceCollectionRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationDeleteGeofenceCollectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a map resource from your AWS account.</p><note><p>This operation deletes the resource permanently. If the map is being used in an application, the map may not render.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteMap service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationDeleteMapResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDeleteMapRequest
 @see AWSLocationDeleteMapResponse
 */
- (AWSTask<AWSLocationDeleteMapResponse *> *)deleteMap:(AWSLocationDeleteMapRequest *)request;

/**
 <p>Deletes a map resource from your AWS account.</p><note><p>This operation deletes the resource permanently. If the map is being used in an application, the map may not render.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteMap service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDeleteMapRequest
 @see AWSLocationDeleteMapResponse
 */
- (void)deleteMap:(AWSLocationDeleteMapRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationDeleteMapResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a place index resource from your AWS account.</p><note><p>This operation deletes the resource permanently.</p></note>
 
 @param request A container for the necessary parameters to execute the DeletePlaceIndex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationDeletePlaceIndexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDeletePlaceIndexRequest
 @see AWSLocationDeletePlaceIndexResponse
 */
- (AWSTask<AWSLocationDeletePlaceIndexResponse *> *)deletePlaceIndex:(AWSLocationDeletePlaceIndexRequest *)request;

/**
 <p>Deletes a place index resource from your AWS account.</p><note><p>This operation deletes the resource permanently.</p></note>
 
 @param request A container for the necessary parameters to execute the DeletePlaceIndex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDeletePlaceIndexRequest
 @see AWSLocationDeletePlaceIndexResponse
 */
- (void)deletePlaceIndex:(AWSLocationDeletePlaceIndexRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationDeletePlaceIndexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a route calculator resource from your AWS account.</p><note><p>This operation deletes the resource permanently.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteRouteCalculator service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationDeleteRouteCalculatorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDeleteRouteCalculatorRequest
 @see AWSLocationDeleteRouteCalculatorResponse
 */
- (AWSTask<AWSLocationDeleteRouteCalculatorResponse *> *)deleteRouteCalculator:(AWSLocationDeleteRouteCalculatorRequest *)request;

/**
 <p>Deletes a route calculator resource from your AWS account.</p><note><p>This operation deletes the resource permanently.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteRouteCalculator service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDeleteRouteCalculatorRequest
 @see AWSLocationDeleteRouteCalculatorResponse
 */
- (void)deleteRouteCalculator:(AWSLocationDeleteRouteCalculatorRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationDeleteRouteCalculatorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a tracker resource from your AWS account.</p><note><p>This operation deletes the resource permanently. If the tracker resource is in use, you may encounter an error. Make sure that the target resource isn't a dependency for your applications.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTracker service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationDeleteTrackerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDeleteTrackerRequest
 @see AWSLocationDeleteTrackerResponse
 */
- (AWSTask<AWSLocationDeleteTrackerResponse *> *)deleteTracker:(AWSLocationDeleteTrackerRequest *)request;

/**
 <p>Deletes a tracker resource from your AWS account.</p><note><p>This operation deletes the resource permanently. If the tracker resource is in use, you may encounter an error. Make sure that the target resource isn't a dependency for your applications.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteTracker service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDeleteTrackerRequest
 @see AWSLocationDeleteTrackerResponse
 */
- (void)deleteTracker:(AWSLocationDeleteTrackerRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationDeleteTrackerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the geofence collection details.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGeofenceCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationDescribeGeofenceCollectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDescribeGeofenceCollectionRequest
 @see AWSLocationDescribeGeofenceCollectionResponse
 */
- (AWSTask<AWSLocationDescribeGeofenceCollectionResponse *> *)describeGeofenceCollection:(AWSLocationDescribeGeofenceCollectionRequest *)request;

/**
 <p>Retrieves the geofence collection details.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGeofenceCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDescribeGeofenceCollectionRequest
 @see AWSLocationDescribeGeofenceCollectionResponse
 */
- (void)describeGeofenceCollection:(AWSLocationDescribeGeofenceCollectionRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationDescribeGeofenceCollectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the map resource details.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMap service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationDescribeMapResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDescribeMapRequest
 @see AWSLocationDescribeMapResponse
 */
- (AWSTask<AWSLocationDescribeMapResponse *> *)describeMap:(AWSLocationDescribeMapRequest *)request;

/**
 <p>Retrieves the map resource details.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMap service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDescribeMapRequest
 @see AWSLocationDescribeMapResponse
 */
- (void)describeMap:(AWSLocationDescribeMapRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationDescribeMapResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the place index resource details.</p>
 
 @param request A container for the necessary parameters to execute the DescribePlaceIndex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationDescribePlaceIndexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDescribePlaceIndexRequest
 @see AWSLocationDescribePlaceIndexResponse
 */
- (AWSTask<AWSLocationDescribePlaceIndexResponse *> *)describePlaceIndex:(AWSLocationDescribePlaceIndexRequest *)request;

/**
 <p>Retrieves the place index resource details.</p>
 
 @param request A container for the necessary parameters to execute the DescribePlaceIndex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDescribePlaceIndexRequest
 @see AWSLocationDescribePlaceIndexResponse
 */
- (void)describePlaceIndex:(AWSLocationDescribePlaceIndexRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationDescribePlaceIndexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the route calculator resource details.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRouteCalculator service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationDescribeRouteCalculatorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDescribeRouteCalculatorRequest
 @see AWSLocationDescribeRouteCalculatorResponse
 */
- (AWSTask<AWSLocationDescribeRouteCalculatorResponse *> *)describeRouteCalculator:(AWSLocationDescribeRouteCalculatorRequest *)request;

/**
 <p>Retrieves the route calculator resource details.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRouteCalculator service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDescribeRouteCalculatorRequest
 @see AWSLocationDescribeRouteCalculatorResponse
 */
- (void)describeRouteCalculator:(AWSLocationDescribeRouteCalculatorRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationDescribeRouteCalculatorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the tracker resource details.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTracker service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationDescribeTrackerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDescribeTrackerRequest
 @see AWSLocationDescribeTrackerResponse
 */
- (AWSTask<AWSLocationDescribeTrackerResponse *> *)describeTracker:(AWSLocationDescribeTrackerRequest *)request;

/**
 <p>Retrieves the tracker resource details.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTracker service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDescribeTrackerRequest
 @see AWSLocationDescribeTrackerResponse
 */
- (void)describeTracker:(AWSLocationDescribeTrackerRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationDescribeTrackerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the association between a tracker resource and a geofence collection.</p><note><p>Once you unlink a tracker resource from a geofence collection, the tracker positions will no longer be automatically evaluated against geofences.</p></note>
 
 @param request A container for the necessary parameters to execute the DisassociateTrackerConsumer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationDisassociateTrackerConsumerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDisassociateTrackerConsumerRequest
 @see AWSLocationDisassociateTrackerConsumerResponse
 */
- (AWSTask<AWSLocationDisassociateTrackerConsumerResponse *> *)disassociateTrackerConsumer:(AWSLocationDisassociateTrackerConsumerRequest *)request;

/**
 <p>Removes the association between a tracker resource and a geofence collection.</p><note><p>Once you unlink a tracker resource from a geofence collection, the tracker positions will no longer be automatically evaluated against geofences.</p></note>
 
 @param request A container for the necessary parameters to execute the DisassociateTrackerConsumer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationDisassociateTrackerConsumerRequest
 @see AWSLocationDisassociateTrackerConsumerResponse
 */
- (void)disassociateTrackerConsumer:(AWSLocationDisassociateTrackerConsumerRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationDisassociateTrackerConsumerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a device's most recent position according to its sample time.</p><note><p>Device positions are deleted after 30 days.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevicePosition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationGetDevicePositionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetDevicePositionRequest
 @see AWSLocationGetDevicePositionResponse
 */
- (AWSTask<AWSLocationGetDevicePositionResponse *> *)getDevicePosition:(AWSLocationGetDevicePositionRequest *)request;

/**
 <p>Retrieves a device's most recent position according to its sample time.</p><note><p>Device positions are deleted after 30 days.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevicePosition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetDevicePositionRequest
 @see AWSLocationGetDevicePositionResponse
 */
- (void)getDevicePosition:(AWSLocationGetDevicePositionRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationGetDevicePositionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the device position history from a tracker resource within a specified range of time.</p><note><p>Device positions are deleted after 30 days.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevicePositionHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationGetDevicePositionHistoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetDevicePositionHistoryRequest
 @see AWSLocationGetDevicePositionHistoryResponse
 */
- (AWSTask<AWSLocationGetDevicePositionHistoryResponse *> *)getDevicePositionHistory:(AWSLocationGetDevicePositionHistoryRequest *)request;

/**
 <p>Retrieves the device position history from a tracker resource within a specified range of time.</p><note><p>Device positions are deleted after 30 days.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevicePositionHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetDevicePositionHistoryRequest
 @see AWSLocationGetDevicePositionHistoryResponse
 */
- (void)getDevicePositionHistory:(AWSLocationGetDevicePositionHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationGetDevicePositionHistoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the geofence details from a geofence collection.</p>
 
 @param request A container for the necessary parameters to execute the GetGeofence service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationGetGeofenceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetGeofenceRequest
 @see AWSLocationGetGeofenceResponse
 */
- (AWSTask<AWSLocationGetGeofenceResponse *> *)getGeofence:(AWSLocationGetGeofenceRequest *)request;

/**
 <p>Retrieves the geofence details from a geofence collection.</p>
 
 @param request A container for the necessary parameters to execute the GetGeofence service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetGeofenceRequest
 @see AWSLocationGetGeofenceResponse
 */
- (void)getGeofence:(AWSLocationGetGeofenceRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationGetGeofenceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves glyphs used to display labels on a map.</p>
 
 @param request A container for the necessary parameters to execute the GetMapGlyphs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationGetMapGlyphsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetMapGlyphsRequest
 @see AWSLocationGetMapGlyphsResponse
 */
- (AWSTask<AWSLocationGetMapGlyphsResponse *> *)getMapGlyphs:(AWSLocationGetMapGlyphsRequest *)request;

/**
 <p>Retrieves glyphs used to display labels on a map.</p>
 
 @param request A container for the necessary parameters to execute the GetMapGlyphs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetMapGlyphsRequest
 @see AWSLocationGetMapGlyphsResponse
 */
- (void)getMapGlyphs:(AWSLocationGetMapGlyphsRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationGetMapGlyphsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the sprite sheet corresponding to a map resource. The sprite sheet is a PNG image paired with a JSON document describing the offsets of individual icons that will be displayed on a rendered map.</p>
 
 @param request A container for the necessary parameters to execute the GetMapSprites service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationGetMapSpritesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetMapSpritesRequest
 @see AWSLocationGetMapSpritesResponse
 */
- (AWSTask<AWSLocationGetMapSpritesResponse *> *)getMapSprites:(AWSLocationGetMapSpritesRequest *)request;

/**
 <p>Retrieves the sprite sheet corresponding to a map resource. The sprite sheet is a PNG image paired with a JSON document describing the offsets of individual icons that will be displayed on a rendered map.</p>
 
 @param request A container for the necessary parameters to execute the GetMapSprites service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetMapSpritesRequest
 @see AWSLocationGetMapSpritesResponse
 */
- (void)getMapSprites:(AWSLocationGetMapSpritesRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationGetMapSpritesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the map style descriptor from a map resource. </p><p>The style descriptor contains speciﬁcations on how features render on a map. For example, what data to display, what order to display the data in, and the style for the data. Style descriptors follow the Mapbox Style Specification.</p>
 
 @param request A container for the necessary parameters to execute the GetMapStyleDescriptor service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationGetMapStyleDescriptorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetMapStyleDescriptorRequest
 @see AWSLocationGetMapStyleDescriptorResponse
 */
- (AWSTask<AWSLocationGetMapStyleDescriptorResponse *> *)getMapStyleDescriptor:(AWSLocationGetMapStyleDescriptorRequest *)request;

/**
 <p>Retrieves the map style descriptor from a map resource. </p><p>The style descriptor contains speciﬁcations on how features render on a map. For example, what data to display, what order to display the data in, and the style for the data. Style descriptors follow the Mapbox Style Specification.</p>
 
 @param request A container for the necessary parameters to execute the GetMapStyleDescriptor service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetMapStyleDescriptorRequest
 @see AWSLocationGetMapStyleDescriptorResponse
 */
- (void)getMapStyleDescriptor:(AWSLocationGetMapStyleDescriptorRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationGetMapStyleDescriptorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a vector data tile from the map resource. Map tiles are used by clients to render a map. they're addressed using a grid arrangement with an X coordinate, Y coordinate, and Z (zoom) level. </p><p>The origin (0, 0) is the top left of the map. Increasing the zoom level by 1 doubles both the X and Y dimensions, so a tile containing data for the entire world at (0/0/0) will be split into 4 tiles at zoom 1 (1/0/0, 1/0/1, 1/1/0, 1/1/1).</p>
 
 @param request A container for the necessary parameters to execute the GetMapTile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationGetMapTileResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetMapTileRequest
 @see AWSLocationGetMapTileResponse
 */
- (AWSTask<AWSLocationGetMapTileResponse *> *)getMapTile:(AWSLocationGetMapTileRequest *)request;

/**
 <p>Retrieves a vector data tile from the map resource. Map tiles are used by clients to render a map. they're addressed using a grid arrangement with an X coordinate, Y coordinate, and Z (zoom) level. </p><p>The origin (0, 0) is the top left of the map. Increasing the zoom level by 1 doubles both the X and Y dimensions, so a tile containing data for the entire world at (0/0/0) will be split into 4 tiles at zoom 1 (1/0/0, 1/0/1, 1/1/0, 1/1/1).</p>
 
 @param request A container for the necessary parameters to execute the GetMapTile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationGetMapTileRequest
 @see AWSLocationGetMapTileResponse
 */
- (void)getMapTile:(AWSLocationGetMapTileRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationGetMapTileResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A batch request to retrieve all device positions.</p>
 
 @param request A container for the necessary parameters to execute the ListDevicePositions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationListDevicePositionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListDevicePositionsRequest
 @see AWSLocationListDevicePositionsResponse
 */
- (AWSTask<AWSLocationListDevicePositionsResponse *> *)listDevicePositions:(AWSLocationListDevicePositionsRequest *)request;

/**
 <p>A batch request to retrieve all device positions.</p>
 
 @param request A container for the necessary parameters to execute the ListDevicePositions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListDevicePositionsRequest
 @see AWSLocationListDevicePositionsResponse
 */
- (void)listDevicePositions:(AWSLocationListDevicePositionsRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationListDevicePositionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists geofence collections in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListGeofenceCollections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationListGeofenceCollectionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListGeofenceCollectionsRequest
 @see AWSLocationListGeofenceCollectionsResponse
 */
- (AWSTask<AWSLocationListGeofenceCollectionsResponse *> *)listGeofenceCollections:(AWSLocationListGeofenceCollectionsRequest *)request;

/**
 <p>Lists geofence collections in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListGeofenceCollections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListGeofenceCollectionsRequest
 @see AWSLocationListGeofenceCollectionsResponse
 */
- (void)listGeofenceCollections:(AWSLocationListGeofenceCollectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationListGeofenceCollectionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists geofences stored in a given geofence collection.</p>
 
 @param request A container for the necessary parameters to execute the ListGeofences service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationListGeofencesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListGeofencesRequest
 @see AWSLocationListGeofencesResponse
 */
- (AWSTask<AWSLocationListGeofencesResponse *> *)listGeofences:(AWSLocationListGeofencesRequest *)request;

/**
 <p>Lists geofences stored in a given geofence collection.</p>
 
 @param request A container for the necessary parameters to execute the ListGeofences service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListGeofencesRequest
 @see AWSLocationListGeofencesResponse
 */
- (void)listGeofences:(AWSLocationListGeofencesRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationListGeofencesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists map resources in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListMaps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationListMapsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListMapsRequest
 @see AWSLocationListMapsResponse
 */
- (AWSTask<AWSLocationListMapsResponse *> *)listMaps:(AWSLocationListMapsRequest *)request;

/**
 <p>Lists map resources in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListMaps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListMapsRequest
 @see AWSLocationListMapsResponse
 */
- (void)listMaps:(AWSLocationListMapsRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationListMapsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists place index resources in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListPlaceIndexes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationListPlaceIndexesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListPlaceIndexesRequest
 @see AWSLocationListPlaceIndexesResponse
 */
- (AWSTask<AWSLocationListPlaceIndexesResponse *> *)listPlaceIndexes:(AWSLocationListPlaceIndexesRequest *)request;

/**
 <p>Lists place index resources in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListPlaceIndexes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListPlaceIndexesRequest
 @see AWSLocationListPlaceIndexesResponse
 */
- (void)listPlaceIndexes:(AWSLocationListPlaceIndexesRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationListPlaceIndexesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists route calculator resources in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListRouteCalculators service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationListRouteCalculatorsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListRouteCalculatorsRequest
 @see AWSLocationListRouteCalculatorsResponse
 */
- (AWSTask<AWSLocationListRouteCalculatorsResponse *> *)listRouteCalculators:(AWSLocationListRouteCalculatorsRequest *)request;

/**
 <p>Lists route calculator resources in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListRouteCalculators service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListRouteCalculatorsRequest
 @see AWSLocationListRouteCalculatorsResponse
 */
- (void)listRouteCalculators:(AWSLocationListRouteCalculatorsRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationListRouteCalculatorsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of tags that are applied to the specified Amazon Location resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListTagsForResourceRequest
 @see AWSLocationListTagsForResourceResponse
 */
- (AWSTask<AWSLocationListTagsForResourceResponse *> *)listTagsForResource:(AWSLocationListTagsForResourceRequest *)request;

/**
 <p>Returns a list of tags that are applied to the specified Amazon Location resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListTagsForResourceRequest
 @see AWSLocationListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSLocationListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists geofence collections currently associated to the given tracker resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTrackerConsumers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationListTrackerConsumersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListTrackerConsumersRequest
 @see AWSLocationListTrackerConsumersResponse
 */
- (AWSTask<AWSLocationListTrackerConsumersResponse *> *)listTrackerConsumers:(AWSLocationListTrackerConsumersRequest *)request;

/**
 <p>Lists geofence collections currently associated to the given tracker resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTrackerConsumers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListTrackerConsumersRequest
 @see AWSLocationListTrackerConsumersResponse
 */
- (void)listTrackerConsumers:(AWSLocationListTrackerConsumersRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationListTrackerConsumersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists tracker resources in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListTrackers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationListTrackersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListTrackersRequest
 @see AWSLocationListTrackersResponse
 */
- (AWSTask<AWSLocationListTrackersResponse *> *)listTrackers:(AWSLocationListTrackersRequest *)request;

/**
 <p>Lists tracker resources in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListTrackers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationListTrackersRequest
 @see AWSLocationListTrackersResponse
 */
- (void)listTrackers:(AWSLocationListTrackersRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationListTrackersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stores a geofence geometry in a given geofence collection, or updates the geometry of an existing geofence if a geofence ID is included in the request. </p>
 
 @param request A container for the necessary parameters to execute the PutGeofence service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationPutGeofenceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationPutGeofenceRequest
 @see AWSLocationPutGeofenceResponse
 */
- (AWSTask<AWSLocationPutGeofenceResponse *> *)putGeofence:(AWSLocationPutGeofenceRequest *)request;

/**
 <p>Stores a geofence geometry in a given geofence collection, or updates the geometry of an existing geofence if a geofence ID is included in the request. </p>
 
 @param request A container for the necessary parameters to execute the PutGeofence service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorConflict`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationPutGeofenceRequest
 @see AWSLocationPutGeofenceResponse
 */
- (void)putGeofence:(AWSLocationPutGeofenceRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationPutGeofenceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reverse geocodes a given coordinate and returns a legible address. Allows you to search for Places or points of interest near a given position.</p>
 
 @param request A container for the necessary parameters to execute the SearchPlaceIndexForPosition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationSearchPlaceIndexForPositionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationSearchPlaceIndexForPositionRequest
 @see AWSLocationSearchPlaceIndexForPositionResponse
 */
- (AWSTask<AWSLocationSearchPlaceIndexForPositionResponse *> *)searchPlaceIndexForPosition:(AWSLocationSearchPlaceIndexForPositionRequest *)request;

/**
 <p>Reverse geocodes a given coordinate and returns a legible address. Allows you to search for Places or points of interest near a given position.</p>
 
 @param request A container for the necessary parameters to execute the SearchPlaceIndexForPosition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationSearchPlaceIndexForPositionRequest
 @see AWSLocationSearchPlaceIndexForPositionResponse
 */
- (void)searchPlaceIndexForPosition:(AWSLocationSearchPlaceIndexForPositionRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationSearchPlaceIndexForPositionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates suggestions for addresses and points of interest based on partial or misspelled free-form text. This operation is also known as autocomplete, autosuggest, or fuzzy matching.</p><p>Optional parameters let you narrow your search results by bounding box or country, or bias your search toward a specific position on the globe.</p><note><p>You can search for suggested place names near a specified position by using <code>BiasPosition</code>, or filter results within a bounding box by using <code>FilterBBox</code>. These parameters are mutually exclusive; using both <code>BiasPosition</code> and <code>FilterBBox</code> in the same command returns an error.</p></note>
 
 @param request A container for the necessary parameters to execute the SearchPlaceIndexForSuggestions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationSearchPlaceIndexForSuggestionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationSearchPlaceIndexForSuggestionsRequest
 @see AWSLocationSearchPlaceIndexForSuggestionsResponse
 */
- (AWSTask<AWSLocationSearchPlaceIndexForSuggestionsResponse *> *)searchPlaceIndexForSuggestions:(AWSLocationSearchPlaceIndexForSuggestionsRequest *)request;

/**
 <p>Generates suggestions for addresses and points of interest based on partial or misspelled free-form text. This operation is also known as autocomplete, autosuggest, or fuzzy matching.</p><p>Optional parameters let you narrow your search results by bounding box or country, or bias your search toward a specific position on the globe.</p><note><p>You can search for suggested place names near a specified position by using <code>BiasPosition</code>, or filter results within a bounding box by using <code>FilterBBox</code>. These parameters are mutually exclusive; using both <code>BiasPosition</code> and <code>FilterBBox</code> in the same command returns an error.</p></note>
 
 @param request A container for the necessary parameters to execute the SearchPlaceIndexForSuggestions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationSearchPlaceIndexForSuggestionsRequest
 @see AWSLocationSearchPlaceIndexForSuggestionsResponse
 */
- (void)searchPlaceIndexForSuggestions:(AWSLocationSearchPlaceIndexForSuggestionsRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationSearchPlaceIndexForSuggestionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Geocodes free-form text, such as an address, name, city, or region to allow you to search for Places or points of interest. </p><p>Optional parameters let you narrow your search results by bounding box or country, or bias your search toward a specific position on the globe.</p><note><p>You can search for places near a given position using <code>BiasPosition</code>, or filter results within a bounding box using <code>FilterBBox</code>. Providing both parameters simultaneously returns an error.</p></note><p>Search results are returned in order of highest to lowest relevance.</p>
 
 @param request A container for the necessary parameters to execute the SearchPlaceIndexForText service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationSearchPlaceIndexForTextResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationSearchPlaceIndexForTextRequest
 @see AWSLocationSearchPlaceIndexForTextResponse
 */
- (AWSTask<AWSLocationSearchPlaceIndexForTextResponse *> *)searchPlaceIndexForText:(AWSLocationSearchPlaceIndexForTextRequest *)request;

/**
 <p>Geocodes free-form text, such as an address, name, city, or region to allow you to search for Places or points of interest. </p><p>Optional parameters let you narrow your search results by bounding box or country, or bias your search toward a specific position on the globe.</p><note><p>You can search for places near a given position using <code>BiasPosition</code>, or filter results within a bounding box using <code>FilterBBox</code>. Providing both parameters simultaneously returns an error.</p></note><p>Search results are returned in order of highest to lowest relevance.</p>
 
 @param request A container for the necessary parameters to execute the SearchPlaceIndexForText service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationSearchPlaceIndexForTextRequest
 @see AWSLocationSearchPlaceIndexForTextResponse
 */
- (void)searchPlaceIndexForText:(AWSLocationSearchPlaceIndexForTextRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationSearchPlaceIndexForTextResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns one or more tags (key-value pairs) to the specified Amazon Location Service resource.</p><pre><code> &lt;p&gt;Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values.&lt;/p&gt; &lt;p&gt;You can use the &lt;code&gt;TagResource&lt;/code&gt; operation with an Amazon Location Service resource that already has tags. If you specify a new tag key for the resource, this tag is appended to the tags already associated with the resource. If you specify a tag key that's already associated with the resource, the new tag value that you specify replaces the previous value for that tag. &lt;/p&gt; &lt;p&gt;You can associate up to 50 tags with a resource.&lt;/p&gt; </code></pre>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationTagResourceRequest
 @see AWSLocationTagResourceResponse
 */
- (AWSTask<AWSLocationTagResourceResponse *> *)tagResource:(AWSLocationTagResourceRequest *)request;

/**
 <p>Assigns one or more tags (key-value pairs) to the specified Amazon Location Service resource.</p><pre><code> &lt;p&gt;Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values.&lt;/p&gt; &lt;p&gt;You can use the &lt;code&gt;TagResource&lt;/code&gt; operation with an Amazon Location Service resource that already has tags. If you specify a new tag key for the resource, this tag is appended to the tags already associated with the resource. If you specify a tag key that's already associated with the resource, the new tag value that you specify replaces the previous value for that tag. &lt;/p&gt; &lt;p&gt;You can associate up to 50 tags with a resource.&lt;/p&gt; </code></pre>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationTagResourceRequest
 @see AWSLocationTagResourceResponse
 */
- (void)tagResource:(AWSLocationTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from the specified Amazon Location resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUntagResourceRequest
 @see AWSLocationUntagResourceResponse
 */
- (AWSTask<AWSLocationUntagResourceResponse *> *)untagResource:(AWSLocationUntagResourceRequest *)request;

/**
 <p>Removes one or more tags from the specified Amazon Location resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUntagResourceRequest
 @see AWSLocationUntagResourceResponse
 */
- (void)untagResource:(AWSLocationUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified properties of a given geofence collection.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGeofenceCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationUpdateGeofenceCollectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUpdateGeofenceCollectionRequest
 @see AWSLocationUpdateGeofenceCollectionResponse
 */
- (AWSTask<AWSLocationUpdateGeofenceCollectionResponse *> *)updateGeofenceCollection:(AWSLocationUpdateGeofenceCollectionRequest *)request;

/**
 <p>Updates the specified properties of a given geofence collection.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGeofenceCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUpdateGeofenceCollectionRequest
 @see AWSLocationUpdateGeofenceCollectionResponse
 */
- (void)updateGeofenceCollection:(AWSLocationUpdateGeofenceCollectionRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationUpdateGeofenceCollectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified properties of a given map resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMap service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationUpdateMapResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUpdateMapRequest
 @see AWSLocationUpdateMapResponse
 */
- (AWSTask<AWSLocationUpdateMapResponse *> *)updateMap:(AWSLocationUpdateMapRequest *)request;

/**
 <p>Updates the specified properties of a given map resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMap service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUpdateMapRequest
 @see AWSLocationUpdateMapResponse
 */
- (void)updateMap:(AWSLocationUpdateMapRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationUpdateMapResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified properties of a given place index resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePlaceIndex service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationUpdatePlaceIndexResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUpdatePlaceIndexRequest
 @see AWSLocationUpdatePlaceIndexResponse
 */
- (AWSTask<AWSLocationUpdatePlaceIndexResponse *> *)updatePlaceIndex:(AWSLocationUpdatePlaceIndexRequest *)request;

/**
 <p>Updates the specified properties of a given place index resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePlaceIndex service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUpdatePlaceIndexRequest
 @see AWSLocationUpdatePlaceIndexResponse
 */
- (void)updatePlaceIndex:(AWSLocationUpdatePlaceIndexRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationUpdatePlaceIndexResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified properties for a given route calculator resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRouteCalculator service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationUpdateRouteCalculatorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUpdateRouteCalculatorRequest
 @see AWSLocationUpdateRouteCalculatorResponse
 */
- (AWSTask<AWSLocationUpdateRouteCalculatorResponse *> *)updateRouteCalculator:(AWSLocationUpdateRouteCalculatorRequest *)request;

/**
 <p>Updates the specified properties for a given route calculator resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRouteCalculator service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUpdateRouteCalculatorRequest
 @see AWSLocationUpdateRouteCalculatorResponse
 */
- (void)updateRouteCalculator:(AWSLocationUpdateRouteCalculatorRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationUpdateRouteCalculatorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified properties of a given tracker resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTracker service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLocationUpdateTrackerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUpdateTrackerRequest
 @see AWSLocationUpdateTrackerResponse
 */
- (AWSTask<AWSLocationUpdateTrackerResponse *> *)updateTracker:(AWSLocationUpdateTrackerRequest *)request;

/**
 <p>Updates the specified properties of a given tracker resource.</p>
 
 @param request A container for the necessary parameters to execute the UpdateTracker service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLocationErrorDomain` domain and the following error code: `AWSLocationErrorInternalServer`, `AWSLocationErrorResourceNotFound`, `AWSLocationErrorAccessDenied`, `AWSLocationErrorValidation`, `AWSLocationErrorThrottling`.
 
 @see AWSLocationUpdateTrackerRequest
 @see AWSLocationUpdateTrackerResponse
 */
- (void)updateTracker:(AWSLocationUpdateTrackerRequest *)request completionHandler:(void (^ _Nullable)(AWSLocationUpdateTrackerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
