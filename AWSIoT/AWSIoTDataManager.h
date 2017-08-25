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

#import "AWSIoTDataService.h"
#import "AWSIoTService.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AWSIoTMQTTStatus) {
    AWSIoTMQTTStatusUnknown,
    AWSIoTMQTTStatusConnecting,
    AWSIoTMQTTStatusConnected,
    AWSIoTMQTTStatusDisconnected,
    AWSIoTMQTTStatusConnectionRefused,
    AWSIoTMQTTStatusConnectionError,
    AWSIoTMQTTStatusProtocolError
};

typedef NS_ENUM(NSInteger, AWSIoTMQTTQoS) {
    AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce = 0,
    AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce = 1
};

typedef void(^AWSIoTMQTTNewMessageBlock)(NSData *data);
typedef void(^AWSIoTMQTTExtendedNewMessageBlock)(NSObject *mqttClient, NSString *topic, NSData *data);


#pragma mark - AWSIoTMQTTLastWillAndTestament

@interface AWSIoTMQTTLastWillAndTestament: NSObject

/**
 The topic to publish the Last Will and Testament message to.  Default
 value: @"".
 */
@property(nonatomic, strong) NSString *topic;

/**
 The Last Will and Testament message.  Default value: @"".
 */
@property(nonatomic, strong) NSString *message;

/**
 The Quality of Service to use when publishing the Last Will and Testament
 message.  Default value: AWSIoTMQTTQoSAtMostOnce.
 */
@property(nonatomic, assign) AWSIoTMQTTQoS qos;

@end

#pragma mark - AWSIoTMQTTConfiguration

@interface AWSIoTMQTTConfiguration : NSObject

/**
 The time in seconds to wait before attempting the first reconnect.  If the MQTT client
 becomes disconnected, it will attempt to reconnect after a quiet period; this quiet
 period doubles with each failed connection attempt, e.g. 1 second, 2 seconds, 4, 8,
 16, 32, etc... up until a maximum reconnection time (maximumReconnectTimeInterval) is 
 reached.  If a connection is active for the minimum connection time 
 (minimumConnectionTimeInterval), the quiet period is reset to the initial value.  
 Default value: 1 second.
  */
@property(nonatomic, assign, readonly) NSTimeInterval baseReconnectTimeInterval;

/**
 The time in seconds that a connection must be active before resetting
 the current reconnection time to the base reconnection time.  Default value:
 20 seconds.
 */
@property(nonatomic, assign, readonly) NSTimeInterval minimumConnectionTimeInterval;

/**
 The maximum time in seconds to wait prior to attempting to reconnect.  Default value:
 128 seconds.
 */
@property(nonatomic, assign, readonly) NSTimeInterval maximumReconnectTimeInterval;

/**
 The MQTT keep-alive time in seconds.  Default value: 60s seconds.
 */
@property(nonatomic, assign, readonly) NSTimeInterval keepAliveTimeInterval;

/**
 The last will and testament (LWT) to be used when connecting to AWS IoT; in the event
 that this client disconnects improperly, AWS IoT will use this to notify any interested
 clients.  Default value: nil
 */
@property(atomic, strong, readonly) AWSIoTMQTTLastWillAndTestament *lastWillAndTestament;

/**
 The run loop to execute the MQTT client in.  Default value: [NSRunLoop currentRunLoop]
 */
@property(atomic, strong, readonly) NSRunLoop *runLoop;

/**
 The run loop mode to use when executing the MQTT client.  Default value: NSDefaultRunLoopMode
 */
@property(nonatomic, strong, readonly) NSString *runLoopMode;

/**
 Boolean flag to indicate whether auto-resubscribe feature is enabled. Default value: YES
 When enabled, in the event of abnormal network disconnection, the sdk automatically
 subscribes to previously subscribed topics.
 */
@property(nonatomic, assign, readonly) BOOL autoResubscribe;

/**
 Create an AWSIoTMQTTConfiguration object and initialize its parameters.
 The AWSIoTMQTTConfiguration object is then passed to AWSIoTDataManager to initialize it.
 Note, clients need to either specify all parameters explicitly or not customize any
 parameter in which case default parameter values will be used to initialize
 AWSIoTMqttConfiguration.
 
 @param kat     keepAliveTimeInterval, Mqtt Keep Alive time in seconds
 
 @param brt     baseReconnectTimeInterval, The time in seconds to wait before attempting
                the first reconnect
 
 @param mct     minimumConnectionTimeInterval, The time in seconds that a connection
                must be active before resetting the current reconnection time to the
                base reconnection time.
 
 @param mrt     maximumReconnectTimeInterval, The maximum time in seconds to wait prior
                to attempting to reconnect
 
 @param rlp     The run loop to execute the MQTT client in
 
 @param rlm     The run loop mode to use when executing the MQTT client
 
 @param ars     autoResubscribe, Boolean flag to indicate whether auto-resubscribe
                feature is enabled
 
 @param lwt     lastWillAndTestament, The last will and testament (LWT) to be used
                when connecting to AWS IoT
 */
- (instancetype)initWithKeepAliveTimeInterval:(NSTimeInterval)kat
                    baseReconnectTimeInterval:(NSTimeInterval)brt
                minimumConnectionTimeInterval:(NSTimeInterval)mct
                 maximumReconnectTimeInterval:(NSTimeInterval)mrt
                                      runLoop:(NSRunLoop*)rlp
                                  runLoopMode:(NSString*)rlm
                              autoResubscribe:(BOOL)ars
                         lastWillAndTestament:(AWSIoTMQTTLastWillAndTestament*)lwt;

@end

#pragma mark - AWSIoTDataManager

@interface AWSIoTDataManager : AWSService

/**
 The service configuration used to instantiate this service client.

 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 The MQTT configuration used by this service client. Any changes to this configuration object 
 will take effect upon the next invocation of either the connectWithClientId or connectUsingWebSocketWithClientId
 methods.
 
 */
@property (nonatomic, strong, readonly) AWSIoTMQTTConfiguration *mqttConfiguration;

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

     let IoTDataManager = AWSIoTDataManager.default()

 *Objective-C*

     AWSIoTDataManager *IoTDataManager = [AWSIoTDataManager defaultIoTDataManager];

 @return The default service client.
 */
+ (instancetype)defaultIoTDataManager __attribute__ ((deprecated("Use `registerIoTDataManagerWithConfiguration:forKey:` with the custom endpoint to initialize AWSIoTDataManager")));

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSIoTDataManager.register(with: configuration!, forKey: "USWest2IoTDataManager")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration forKey:@"USWest2IoTDataManager"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let IoTDataManager = AWSIoTDataManager(forKey: "USWest2IoTDataManager")

 *Objective-C*

     AWSIoTDataManager *IoTDataManager = [AWSIoTDataManager IoTDataManagerForKey:@"USWest2IoTDataManager"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerIoTDataManagerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;



/**
 Creates a service client with the given service configuration and
 AWSIoTMQTTConfiguration and registers it for the key.

 For example:

 *Swift*

 let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
 let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
 let mqttConfig = AWSIoTMQTTConfiguration(keepAliveTimeInterval: 60.0,
                                      baseReconnectTimeInterval: 1.0,
                                  minimumConnectionTimeInterval: 20.0,
                                   maximumReconnectTimeInterval: 128.0,
                                                        runLoop: RunLoop.current,
                                                    runLoopMode: RunLoopMode.defaultRunLoopMode.rawValue,
                                                autoResubscribe: true,
                                           lastWillAndTestament: AWSIoTMQTTLastWillAndTestament() )

 AWSIoTDataManager.register(with: configuration!, with: mqttConfig!, forKey: "USWest2IoTDataManager")


 *Objective-C*

 AWSCognitoCredentialsProvider *credentialsProvider =
    [ [AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                identityPoolId:@"YourIdentityPoolId"];
 AWSServiceConfiguration *configuration =
    [ [AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                 credentialsProvider:credentialsProvider];
 AWSIoTMQTTConfiguration *mqttConfig =
    [ [AWSIoTMQTTConfiguration alloc] initWithKeepAliveTimeInterval:60.0
                                          baseReconnectTimeInterval:1.0
                                      minimumConnectionTimeInterval:20.0
                                       maximumReconnectTimeInterval:128.0
                                                            runLoop:[NSRunLoop currentRunLoop]
                                                        runLoopMode:NSDefaultRunLoopMode
                                                    autoResubscribe:YES
                                               lastWillAndTestament:[AWSIoTMQTTLastWillAndTestament new] ];

 [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration
                                      withMQTTConfiguration:mqttConfig
                                                     forKey:@"USWest2IoTDataManager"];

 Then call the following to get the service client:

 *Swift*

 let IoTDataManager = AWSIoTDataManager(forKey: "USWest2IoTDataManager")

 *Objective-C*

 AWSIoTDataManager *IoTDataManager = [AWSIoTDataManager IoTDataManagerForKey:@"USWest2IoTDataManager"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param mqttConfig    A AWSIoTMQTTConfiguration object.
 @param key           A string to identify the service client.
 */
+ (void)registerIoTDataManagerWithConfiguration:(AWSServiceConfiguration *)configuration
                          withMQTTConfiguration:(AWSIoTMQTTConfiguration *)mqttConfig
                                         forKey:(NSString *)key;


/**
 Retrieves the service client associated with the key. You need to call `+ registerIoTDataManagerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSIoTDataManager.register(with: configuration!, forKey: "USWest2IoTDataManager")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration forKey:@"USWest2IoTDataManager"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let IoTDataManager = AWSIoTDataManager(forKey: "USWest2IoTDataManager")

 *Objective-C*

     AWSIoTDataManager *IoTDataManager = [AWSIoTDataManager IoTDataManagerForKey:@"USWest2IoTDataManager"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)IoTDataManagerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.

 @warning Before calling this method, make sure no method is running on this client.

 @param key A string to identify the service client.
 */
+ (void)removeIoTDataManagerForKey:(NSString *)key;

/**
 Initialises the MQTT session and connects to AWS IoT using certificate-based mutual authentication

 @return true if initialise finished with success

 @param clientId The Client Identifier identifies the Client to the Server.

 @param cleanSession specifies if the server should discard previous session information.

 @param certificateId contains the ID of the certificate to use in the connection; must be in the keychain
 
 @param callback When new mqtt session status is received callback will be called with new connection status.

 */
- (BOOL)connectWithClientId:(NSString *)clientId
               cleanSession:(BOOL)cleanSession
              certificateId:(NSString *)certificateId
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;

/**
 Initialises the MQTT session and connects to AWS IoT using WebSocket/SigV4 authentication.  IAM
 credentials are taken from the current service configuration.
 
 @return true if initialise finished with success
 
 @param clientId The Client Identifier identifies the Client to the Server.
 
 @param cleanSession specifies if the server should discard previous session information.
 
 @param callback When new mqtt session status is received the callback will be called with new connection status.
 
 */
- (BOOL)connectUsingWebSocketWithClientId:(NSString *)clientId
                            cleanSession:(BOOL)cleanSession
                          statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;

/**
 Disconnect from a mqtt client (close current mqtt session)

 */
- (void)disconnect;

/**
 Get the current connection status
 @return AWSIoTMQTTStatus
 */
- (AWSIoTMQTTStatus)getConnectionStatus;

/**
 Send MQTT message to specified topic

 @param string The message (As NSString object) to be sent.

 @param qos The QoS value to use when publishing (optional, default AWSIoTMQTTQoSAtMostOnce).

 @param topic The topic for publish to.
 
 @return Boolean value indicating success or failure.

 */
- (BOOL) publishString:(NSString *)string
               onTopic:(NSString *)topic
                   QoS:(AWSIoTMQTTQoS)qos;

/**
 Send MQTT message to specified topic

 @param data The message (As NSData) to be sent.

 @param qos The QoS value to use when publishing (optional, default AWSIoTMQTTQoSAtMostOnce).

 @param topic The topic for publish to.

 @return Boolean value indicating success or failure.

 */
- (BOOL) publishData:(NSData *)data
             onTopic:(NSString *)topic
                 QoS:(AWSIoTMQTTQoS)qos;

/**
 Subscribes to a topic at a specific QoS level

 @param topic The Topic to subscribe to.

 @param qos Specifies the QoS Level of the subscription: AWSIoTMQTTQoSAtMostOnce or AWSIoTMQTTQoSAtLeastOnce

 @param callback Reference to AWSIOTMQTTNewMessageBlock. When new message is received the callback will be invoked.
 
 @return Boolean value indicating success or failure.

 */
- (BOOL) subscribeToTopic:(NSString *)topic
                      QoS:(AWSIoTMQTTQoS)qos
          messageCallback:(AWSIoTMQTTNewMessageBlock)callback;

/**
 Subscribes to a topic at a specific QoS level
 
 @param topic The Topic to subscribe to.
 
 @param qos Specifies the QoS Level of the subscription: AWSIoTMQTTQoSAtMostOnce or AWSIoTMQTTQoSAtLeastOnce
 
 @param callback Reference to AWSIOTMQTTExtendedNewMessageBlock. When new message is received the callback will be invoked.
 
 @return Boolean value indicating success or failure.
 
 */
- (BOOL) subscribeToTopic:(NSString *)topic
                      QoS:(AWSIoTMQTTQoS)qos
          extendedCallback:(AWSIoTMQTTExtendedNewMessageBlock)callback;


/**
 Unsubscribes from a topic

 @param topic The Topic to unsubscribe from.

 */
- (void)unsubscribeTopic:(NSString *)topic;


typedef NS_ENUM(NSInteger, AWSIoTShadowOperationType) {
    //
    // NOTE: the first 4 values in this enum may not be re-ordered.
    // It must align with the same order in AWSIoTShadowOperationTypeStrings
    // An internal array in the implementation depends on their
    // values and order.
    //
    AWSIoTShadowOperationTypeUpdate,
    AWSIoTShadowOperationTypeGet,
    AWSIoTShadowOperationTypeDelete,
    AWSIoTShadowOperationTypeCount,       // Internal class use only
    AWSIoTShadowOperationTypeNone         // Internal class use only
};

typedef NS_ENUM(NSInteger, AWSIoTShadowOperationStatusType) {
    //
    // NOTE: the first 5 values in this enum may not be re-ordered.
    // It must align with the same order in AWSIoTShadowOperationStatusTypeStrings
    // An internal array in the implementation depends on their
    // values and order.
    //
    AWSIoTShadowOperationStatusTypeAccepted,
    AWSIoTShadowOperationStatusTypeRejected,
    AWSIoTShadowOperationStatusTypeDelta,
    AWSIoTShadowOperationStatusTypeDocuments,
    AWSIoTShadowOperationStatusTypeCount, // Internal class use only
    AWSIoTShadowOperationStatusTypeForeignUpdate,
    AWSIoTShadowOperationStatusTypeTimeout
};

/**
 Register for updates on a device shadow
 
 @param name The device shadow to register for updates on.

 @param options A dictionary with device shadow registration options.  The options are:
 
enableDebugging: BOOL, set to YES to enable additional console debugging (default NO)
enableVersioning: BOOL, set to NO to disable versioning (default YES)
enableForeignStateUpdateNotifications: BOOL, set to YES to enable foreign state updates (default NO)
enableStaleDiscards: BOOL, set to NO to disable discarding stale updates (default YES)
enableIgnoreDeltas: BOOL, set to YES to disable delta updates (default NO)
QoS: AWSIoTMQTTQoS (default AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce)
shadowOperationTimeoutSeconds: double, device shadow operation timeout (default 10.0)
 
 @param callback The function to call when updates are received for the device shadow.
 
 @return Boolean value indicating success or failure.
 
 */

- (BOOL) registerWithShadow:(NSString *)name
                    options:(NSDictionary<NSString *, NSNumber *> * _Nullable)options
              eventCallback:(void(^)(NSString *name, AWSIoTShadowOperationType operation, AWSIoTShadowOperationStatusType status, NSString *clientToken, NSData *payload))callback;


/**
 Unregister from updates on a device shadow
 
 @param name The device shadow to unregister from updates on.
 
 @return Boolean value indicating success or failure.
 
 */
- (BOOL) unregisterFromShadow:(NSString *)name;

/**
 Update a device shadow
 
 @param name The device shadow to update.
 
 @param jsonString The JSON string to update the device shadow with.
 
 @return Boolean value indicating success or failure.
 
 */
- (BOOL) updateShadow:(NSString *)name
           jsonString:(NSString *)jsonString;

/**
 Update a device shadow with json data and client token.
 If the json data is not valid, it returns false, and no update message
 will be published. If the json data is valid, it publishes the data on
 $aws/things/thingName/shadow/update topic, then return true.

 @param name The name of the device shadow to be updated

 @param jsonString The shadow state in format of JSON string

 @param clientToken The client id to use when upadating the shadow

 @return True if json string is valid and can be serialized successfully;
 False if it cannot be serialized successfully.

 */

- (BOOL) updateShadow:(NSString *)name
           jsonString:(NSString *)jsonString
          clientToken:(NSString  * _Nullable)clientToken;

/**
 Get a device shadow
 
 @param name The device shadow to get.
 
 @return Boolean value indicating success or failure.
 
 */
- (BOOL) getShadow:(NSString *)name;

/**
 Get a device shadow
 
 @param name The device shadow to get.
 
 @param clientToken A client token to use when requesting the device shadow.
 
 @return Boolean value indicating success or failure.

 */
- (BOOL) getShadow:(NSString *)name
       clientToken:(NSString * _Nullable)clientToken;

/**
 Delete a device shadow
 
 @param name The device shadow to delete.
 
 @return Boolean value indicating success or failure.
 
 */
- (BOOL) deleteShadow:(NSString *)name;

/**
 Delete a device shadow
 
 @param name The device shadow to delete.
 
 @param clientToken A client token to use when deleting the device shadow.
 
 @return Boolean value indicating success or failure.
 
 */
- (BOOL) deleteShadow:(NSString *)name
          clientToken:(NSString * _Nullable)clientToken;


@end

NS_ASSUME_NONNULL_END
