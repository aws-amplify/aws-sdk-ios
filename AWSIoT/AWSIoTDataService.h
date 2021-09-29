//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSIoTDataModel.h"
#import "AWSIoTDataResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSIoTData
FOUNDATION_EXPORT NSString *const AWSIoTDataSDKVersion;

/**
 <fullname>IoT data</fullname><p>IoT data enables secure, bi-directional communication between Internet-connected things (such as sensors, actuators, embedded devices, or smart appliances) and the Amazon Web Services cloud. It implements a broker for applications and things to publish messages over HTTP (Publish) and retrieve, update, and delete shadows. A shadow is a persistent representation of your things and their state in the Amazon Web Services cloud.</p><p>Find the endpoint address for actions in IoT data by running this CLI command:</p><p><code>aws iot describe-endpoint --endpoint-type iot:Data-ATS</code></p><p>The service name used by <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Amazon Web ServicesSignature Version 4</a> to sign requests is: <i>iotdevicegateway</i>.</p>
 */
@interface AWSIoTData : AWSService

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

     let IoTData = AWSIoTData.default()

 *Objective-C*

     AWSIoTData *IoTData = [AWSIoTData defaultIoTData];

 @return The default service client.
 */
+ (instancetype)defaultIoTData;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSIoTData.register(with: configuration!, forKey: "USWest2IoTData")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:@"USWest2IoTData"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let IoTData = AWSIoTData(forKey: "USWest2IoTData")

 *Objective-C*

     AWSIoTData *IoTData = [AWSIoTData IoTDataForKey:@"USWest2IoTData"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerIoTDataWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerIoTDataWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSIoTData.register(with: configuration!, forKey: "USWest2IoTData")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:@"USWest2IoTData"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let IoTData = AWSIoTData(forKey: "USWest2IoTData")

 *Objective-C*

     AWSIoTData *IoTData = [AWSIoTData IoTDataForKey:@"USWest2IoTData"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)IoTDataForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeIoTDataForKey:(NSString *)key;

/**
 <p>Deletes the shadow for the specified thing.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteThingShadow</a> action.</p><p>For more information, see <a href="http://docs.aws.amazon.com/iot/latest/developerguide/API_DeleteThingShadow.html">DeleteThingShadow</a> in the IoT Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the DeleteThingShadow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDataDeleteThingShadowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorResourceNotFound`, `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`, `AWSIoTDataErrorUnsupportedDocumentEncoding`.
 
 @see AWSIoTDataDeleteThingShadowRequest
 @see AWSIoTDataDeleteThingShadowResponse
 */
- (AWSTask<AWSIoTDataDeleteThingShadowResponse *> *)deleteThingShadow:(AWSIoTDataDeleteThingShadowRequest *)request;

/**
 <p>Deletes the shadow for the specified thing.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteThingShadow</a> action.</p><p>For more information, see <a href="http://docs.aws.amazon.com/iot/latest/developerguide/API_DeleteThingShadow.html">DeleteThingShadow</a> in the IoT Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the DeleteThingShadow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorResourceNotFound`, `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`, `AWSIoTDataErrorUnsupportedDocumentEncoding`.
 
 @see AWSIoTDataDeleteThingShadowRequest
 @see AWSIoTDataDeleteThingShadowResponse
 */
- (void)deleteThingShadow:(AWSIoTDataDeleteThingShadowRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDataDeleteThingShadowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the details of a single retained message for the specified topic.</p><p>This action returns the message payload of the retained message, which can incur messaging costs. To list only the topic names of the retained messages, call <a href="/iot/latest/developerguide/API_iotdata_ListRetainedMessages.html">ListRetainedMessages</a>.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions">GetRetainedMessage</a> action.</p><p>For more information about messaging costs, see <a href="http://aws.amazon.com/iot-core/pricing/#Messaging">IoT Core pricing - Messaging</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetRetainedMessage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDataGetRetainedMessageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorResourceNotFound`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`.
 
 @see AWSIoTDataGetRetainedMessageRequest
 @see AWSIoTDataGetRetainedMessageResponse
 */
- (AWSTask<AWSIoTDataGetRetainedMessageResponse *> *)getRetainedMessage:(AWSIoTDataGetRetainedMessageRequest *)request;

/**
 <p>Gets the details of a single retained message for the specified topic.</p><p>This action returns the message payload of the retained message, which can incur messaging costs. To list only the topic names of the retained messages, call <a href="/iot/latest/developerguide/API_iotdata_ListRetainedMessages.html">ListRetainedMessages</a>.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions">GetRetainedMessage</a> action.</p><p>For more information about messaging costs, see <a href="http://aws.amazon.com/iot-core/pricing/#Messaging">IoT Core pricing - Messaging</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetRetainedMessage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorResourceNotFound`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`.
 
 @see AWSIoTDataGetRetainedMessageRequest
 @see AWSIoTDataGetRetainedMessageResponse
 */
- (void)getRetainedMessage:(AWSIoTDataGetRetainedMessageRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDataGetRetainedMessageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the shadow for the specified thing.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetThingShadow</a> action.</p><p>For more information, see <a href="http://docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html">GetThingShadow</a> in the IoT Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the GetThingShadow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDataGetThingShadowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorResourceNotFound`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`, `AWSIoTDataErrorUnsupportedDocumentEncoding`.
 
 @see AWSIoTDataGetThingShadowRequest
 @see AWSIoTDataGetThingShadowResponse
 */
- (AWSTask<AWSIoTDataGetThingShadowResponse *> *)getThingShadow:(AWSIoTDataGetThingShadowRequest *)request;

/**
 <p>Gets the shadow for the specified thing.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetThingShadow</a> action.</p><p>For more information, see <a href="http://docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html">GetThingShadow</a> in the IoT Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the GetThingShadow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorResourceNotFound`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`, `AWSIoTDataErrorUnsupportedDocumentEncoding`.
 
 @see AWSIoTDataGetThingShadowRequest
 @see AWSIoTDataGetThingShadowResponse
 */
- (void)getThingShadow:(AWSIoTDataGetThingShadowRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDataGetThingShadowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the shadows for the specified thing.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListNamedShadowsForThing</a> action.</p>
 
 @param request A container for the necessary parameters to execute the ListNamedShadowsForThing service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDataListNamedShadowsForThingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorResourceNotFound`, `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`.
 
 @see AWSIoTDataListNamedShadowsForThingRequest
 @see AWSIoTDataListNamedShadowsForThingResponse
 */
- (AWSTask<AWSIoTDataListNamedShadowsForThingResponse *> *)listNamedShadowsForThing:(AWSIoTDataListNamedShadowsForThingRequest *)request;

/**
 <p>Lists the shadows for the specified thing.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListNamedShadowsForThing</a> action.</p>
 
 @param request A container for the necessary parameters to execute the ListNamedShadowsForThing service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorResourceNotFound`, `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`.
 
 @see AWSIoTDataListNamedShadowsForThingRequest
 @see AWSIoTDataListNamedShadowsForThingResponse
 */
- (void)listNamedShadowsForThing:(AWSIoTDataListNamedShadowsForThingRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDataListNamedShadowsForThingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists summary information about the retained messages stored for the account.</p><p>This action returns only the topic names of the retained messages. It doesn't return any message payloads. Although this action doesn't return a message payload, it can still incur messaging costs.</p><p>To get the message payload of a retained message, call <a href="https://docs.aws.amazon.com/iot/latest/developerguide/API_iotdata_GetRetainedMessage.html">GetRetainedMessage</a> with the topic name of the retained message.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions">ListRetainedMessages</a> action.</p><p>For more information about messaging costs, see <a href="http://aws.amazon.com/iot-core/pricing/#Messaging">IoT Core pricing - Messaging</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListRetainedMessages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDataListRetainedMessagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`.
 
 @see AWSIoTDataListRetainedMessagesRequest
 @see AWSIoTDataListRetainedMessagesResponse
 */
- (AWSTask<AWSIoTDataListRetainedMessagesResponse *> *)listRetainedMessages:(AWSIoTDataListRetainedMessagesRequest *)request;

/**
 <p>Lists summary information about the retained messages stored for the account.</p><p>This action returns only the topic names of the retained messages. It doesn't return any message payloads. Although this action doesn't return a message payload, it can still incur messaging costs.</p><p>To get the message payload of a retained message, call <a href="https://docs.aws.amazon.com/iot/latest/developerguide/API_iotdata_GetRetainedMessage.html">GetRetainedMessage</a> with the topic name of the retained message.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions">ListRetainedMessages</a> action.</p><p>For more information about messaging costs, see <a href="http://aws.amazon.com/iot-core/pricing/#Messaging">IoT Core pricing - Messaging</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListRetainedMessages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`.
 
 @see AWSIoTDataListRetainedMessagesRequest
 @see AWSIoTDataListRetainedMessagesResponse
 */
- (void)listRetainedMessages:(AWSIoTDataListRetainedMessagesRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDataListRetainedMessagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Publishes an MQTT message.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">Publish</a> action.</p><p>For more information about MQTT messages, see <a href="http://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html">MQTT Protocol</a> in the IoT Developer Guide.</p><p>For more information about messaging costs, see <a href="http://aws.amazon.com/iot-core/pricing/#Messaging">IoT Core pricing - Messaging</a>.</p>
 
 @param request A container for the necessary parameters to execute the Publish service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorMethodNotAllowed`.
 
 @see AWSIoTDataPublishRequest
 */
- (AWSTask *)publish:(AWSIoTDataPublishRequest *)request;

/**
 <p>Publishes an MQTT message.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">Publish</a> action.</p><p>For more information about MQTT messages, see <a href="http://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html">MQTT Protocol</a> in the IoT Developer Guide.</p><p>For more information about messaging costs, see <a href="http://aws.amazon.com/iot-core/pricing/#Messaging">IoT Core pricing - Messaging</a>.</p>
 
 @param request A container for the necessary parameters to execute the Publish service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorMethodNotAllowed`.
 
 @see AWSIoTDataPublishRequest
 */
- (void)publish:(AWSIoTDataPublishRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the shadow for the specified thing.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateThingShadow</a> action.</p><p>For more information, see <a href="http://docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html">UpdateThingShadow</a> in the IoT Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the UpdateThingShadow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSIoTDataUpdateThingShadowResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorConflict`, `AWSIoTDataErrorRequestEntityTooLarge`, `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`, `AWSIoTDataErrorUnsupportedDocumentEncoding`.
 
 @see AWSIoTDataUpdateThingShadowRequest
 @see AWSIoTDataUpdateThingShadowResponse
 */
- (AWSTask<AWSIoTDataUpdateThingShadowResponse *> *)updateThingShadow:(AWSIoTDataUpdateThingShadowRequest *)request;

/**
 <p>Updates the shadow for the specified thing.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateThingShadow</a> action.</p><p>For more information, see <a href="http://docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html">UpdateThingShadow</a> in the IoT Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the UpdateThingShadow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSIoTDataErrorDomain` domain and the following error code: `AWSIoTDataErrorConflict`, `AWSIoTDataErrorRequestEntityTooLarge`, `AWSIoTDataErrorInvalidRequest`, `AWSIoTDataErrorThrottling`, `AWSIoTDataErrorUnauthorized`, `AWSIoTDataErrorServiceUnavailable`, `AWSIoTDataErrorInternalFailure`, `AWSIoTDataErrorMethodNotAllowed`, `AWSIoTDataErrorUnsupportedDocumentEncoding`.
 
 @see AWSIoTDataUpdateThingShadowRequest
 @see AWSIoTDataUpdateThingShadowResponse
 */
- (void)updateThingShadow:(AWSIoTDataUpdateThingShadowRequest *)request completionHandler:(void (^ _Nullable)(AWSIoTDataUpdateThingShadowResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
