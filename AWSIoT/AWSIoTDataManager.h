//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

typedef NS_ENUM(NSInteger, AWSIoTMQTTStatus) {
    AWSIoTMQTTStatusUnknown,
    AWSIoTMQTTStatusConnecting,
    AWSIoTMQTTStatusConnected,
    AWSIoTMQTTStatusDisconnected,
    AWSIoTMQTTStatusConnectionRefused,
    AWSIoTMQTTStatusConnectionError,
    AWSIoTMQTTStatusProtocolError
};

typedef void(^AWSIoTMQTTNewMessageBlock)(NSData *data);

@interface AWSIoTDataManager : AWSService

/**
 The service configuration used to instantiate this service client.

 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

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

     let IoTDataManager = AWSIoTDataManager.defaultIoTDataManager()

 *Objective-C*

     AWSIoTDataManager *IoTDataManager = [AWSIoTDataManager defaultIoTDataManager];

 @return The default service client.
 */
+ (instancetype)defaultIoTDataManager;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSIoTDataManager.registerIoTDataManagerWithConfiguration(configuration, forKey: "USWest2IoTDataManager")

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
 Retrieves the service client associated with the key. You need to call `+ registerIoTDataManagerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSIoTDataManager.registerIoTDataManagerWithConfiguration(configuration, forKey: "USWest2IoTDataManager")

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

 @param block Reference. When new mqtt session status is received the function of block will be called with new connection status.

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
 
 @param certificateId contains the ID of the certificate to use in the connection; must be in the keychain
 
 @param block Reference. When new mqtt session status is received the function of block will be called with new connection status.
 
 */
- (BOOL)connectUsingWebSocketWithClientId:(NSString *)clientId
               cleanSession:(BOOL)cleanSession
               statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;

/**
 Disconnect from a mqtt client (close current mqtt session)

 */
- (void)disconnect;

/**
 Send MQTT message to specified topic

 @param message The message (As NSString object) to be sent.

 @param topic The topic for publish to.

 */
- (void)publishString:(NSString *)str
              onTopic:(NSString *)topic;

/**
 Send MQTT message to specified topic

 @param message The message (As NSData) to be sent.

 @param topic The topic for publish to.

 */
- (void)publishData:(NSData *)data
            onTopic:(NSString *)topic;

/**
 Subscribes to a topic at a specific QoS level

 @param topic The Topic to subscribe to.

 @param qos Specifies the QoS Level of the subscription. Can be 0, 1, or 2.

 @param block Reference to AWSIOTMQTTNewMessageBlock. When new message is received the function of block will be called.
 */
- (void)subscribeToTopic:(NSString *)topic
                     qos:(UInt8)qos
         messageCallback:(AWSIoTMQTTNewMessageBlock)callback;

/**
 Unsubscribes from a topic

 @param topic The Topic to unsubscribe from.

 */
- (void)unsubscribeTopic:(NSString *)topic;

@end
