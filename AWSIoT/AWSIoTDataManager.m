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

#import "AWSSignature.h"
#import "AWSIoTDataManager.h"
#import "AWSIoTMQTTClient.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSIoTModel.h"
#import "AWSCocoaLumberjack.h"


@interface AWSIoTDataShadowModel : AWSMTLModel <AWSMTLJSONSerializing>

@property (nonatomic, copy) NSString *clientToken;
@property (nonatomic, copy) NSString *version;

@end

@implementation AWSIoTDataShadowModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"clientToken" : @"clientToken",
             @"version" : @"version"
             };
}
@end

@interface AWSIoTDataShadow:NSObject
//
// Each shadow has the following properties
//
@property(nonatomic, strong) NSString* name;
@property(atomic, assign) BOOL enableDebugging;
@property(atomic, assign) BOOL enableVersioning;
@property(atomic, assign) BOOL enableForeignStateUpdateNotifications;
@property(atomic, assign) BOOL enableStaleDiscards;
@property(atomic, assign) BOOL enableIgnoreDeltas;
@property(atomic, assign) UInt32 version;
@property(nonatomic, strong) NSString *clientToken;
@property(atomic, assign) AWSIoTMQTTQoS qos;
@property(nonatomic, strong) NSMutableArray* topics;
@property(nonatomic, strong) void(^callback)(NSString *name, AWSIoTShadowOperationType operation, AWSIoTShadowOperationStatusType status, NSString *clientToken, NSData *payload);
@property(nonatomic, strong) NSTimer *timer;
@property(atomic, assign) NSTimeInterval operationTimeout;
@property(atomic, assign) AWSIoTShadowOperationType operation;
@end

@implementation AWSIoTDataShadow

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `initWithName:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithName:(NSString *)name
                       debug:(BOOL)enableDebugging
                   versioned:(BOOL)enableVersioning
         discardStaleUpdates:(BOOL)enableStaleDiscards
               discardDeltas:(BOOL)enableIgnoreDeltas
      updateOnForeignChanges:(BOOL)enableForeignStateUpdateNotifications
            operationTimeout:(NSTimeInterval)operationTimeoutSeconds
                         QoS:(AWSIoTMQTTQoS)qos
                    callback:(void(^)(NSString *name, AWSIoTShadowOperationType operation, AWSIoTShadowOperationStatusType status, NSString *clientToken, NSData *payload))callback
{
    if (self = [super init]) {
        _name = name;
        _enableDebugging = enableDebugging;
        _enableVersioning = enableVersioning;
        _enableStaleDiscards = enableStaleDiscards;
        _enableIgnoreDeltas = enableIgnoreDeltas;
        _enableForeignStateUpdateNotifications = enableForeignStateUpdateNotifications;
        _callback = callback;
        _operationTimeout = operationTimeoutSeconds;
        _qos = qos;
        _version = 0;
        _topics = [NSMutableArray new];
        _timer = nil;
        _clientToken = nil;
        _operation = AWSIoTShadowOperationTypeNone;
    }

    return self;
}

@end

static NSString *const AWSInfoIoTDataManager = @"IoTDataManager";

@interface AWSIoTData()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@property (nonatomic, readonly) AWSIoTMQTTClient *mqttClient;

@end

@interface AWSIoTDataManager()

@property (nonatomic, strong) AWSIoTData* IoTData;
@property (nonatomic, strong) AWSSynchronizedMutableDictionary* shadows;
@end

@implementation AWSIoTMQTTLastWillAndTestament

- (instancetype)init {
    if (self = [super init]) {
        _topic = @"";
        _message = @"";
        _qos = AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce;
    }
    return self;
}

@end

@implementation AWSIoTMQTTConfiguration

- (instancetype)init {
    if (self = [super init]) {
        _keepAliveTimeInterval = 60.0;
        _baseReconnectTimeInterval = 1.0;
        _minimumConnectionTimeInterval = 20.0;
        _maximumReconnectTimeInterval = 128.0;
        _runLoop = [NSRunLoop currentRunLoop];
        _runLoopMode = NSDefaultRunLoopMode;
        _lastWillAndTestament = [AWSIoTMQTTLastWillAndTestament new];
    }
    return self;
}

@end

@implementation AWSIoTDataManager


static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultIoTDataManager {
    static AWSIoTDataManager *_defaultIoTDataManager = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoIoTDataManager];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }

        _defaultIoTDataManager = [[AWSIoTDataManager alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultIoTDataManager;
}

+ (void)registerIoTDataManagerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    if( !configuration.endpoint){
        AWSDDLogWarn(@"The endpoint is not set. You should use custom endpoint when initializing AWSServiceConfiguration");
    }
    [_serviceClients setObject:[[AWSIoTDataManager alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)IoTDataManagerForKey:(NSString *)key {
    @synchronized(self) {
        AWSIoTDataManager *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoIoTDataManager
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration =
                [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                            credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSIoTDataManager registerIoTDataManagerWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeIoTDataManagerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultIoTDataManager` or `+ IoTDataManagerForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
        _mqttConfiguration = [AWSIoTMQTTConfiguration new];
        _IoTData = [[AWSIoTData alloc] initWithConfiguration:_configuration];
        _shadows = [AWSSynchronizedMutableDictionary new];
    }
    return self;
}

- (AWSIoTMQTTClient *)mqttClient {
    static AWSIoTMQTTClient *_mqttClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mqttClient = [AWSIoTMQTTClient sharedInstance];
        _mqttClient.associatedObject = self;
    });

    return _mqttClient;
}

- (BOOL)connectWithClientId:(NSString*)clientId
               cleanSession:(BOOL)cleanSession
                certificateId:(NSString *)certificateId
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback
{
    AWSDDLogInfo(@"hostName: %@", self.IoTData.configuration.endpoint.hostName);
    AWSDDLogInfo(@"URL: %@", self.IoTData.configuration.endpoint.URL);

    if (clientId == nil || [clientId  isEqualToString: @""]) {
        return false;
    }

    if (certificateId == nil || [certificateId isEqualToString:@""]) {
        return false;
    }
    
    [self.mqttClient setBaseReconnectTime:self.mqttConfiguration.baseReconnectTimeInterval];
    [self.mqttClient setMinimumConnectionTime:self.mqttConfiguration.minimumConnectionTimeInterval];
    [self.mqttClient setMaximumReconnectTime:self.mqttConfiguration.maximumReconnectTimeInterval];

    return [self.mqttClient connectWithClientId:clientId
                                     toHost:self.IoTData.configuration.endpoint.hostName
                                       port:8883
                               cleanSession:cleanSession
                              certificateId:certificateId
                                  keepAlive:self.mqttConfiguration.keepAliveTimeInterval
                                  willTopic:self.mqttConfiguration.lastWillAndTestament.topic
                                    willMsg:[self.mqttConfiguration.lastWillAndTestament.message dataUsingEncoding:NSUTF8StringEncoding]
                                    willQoS:self.mqttConfiguration.lastWillAndTestament.qos
                             willRetainFlag:NO
                                    runLoop:self.mqttConfiguration.runLoop
                                    forMode:self.mqttConfiguration.runLoopMode
                             statusCallback:callback];
}

- (BOOL)connectUsingWebSocketWithClientId:(NSString *)clientId
                             cleanSession:(BOOL)cleanSession
                           statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;
{
    //
    // Get WebSocket URL which will be used to connect; it has SigV4 authentication
    // information embedded in the query string.
    //

    if (clientId == nil || [clientId  isEqualToString: @""]) {
        return false;
    }
    AWSDDLogInfo(@"IOTDataManager: Connecting to IoT using websocket, client id: %@", clientId);
    [self.mqttClient setBaseReconnectTime:self.mqttConfiguration.baseReconnectTimeInterval];
    [self.mqttClient setMinimumConnectionTime:self.mqttConfiguration.minimumConnectionTimeInterval];
    [self.mqttClient setMaximumReconnectTime:self.mqttConfiguration.maximumReconnectTimeInterval];
    
    return [self.mqttClient connectWithClientId:clientId
                                   cleanSession:cleanSession
                                  configuration:self.IoTData.configuration
                                      keepAlive:self.mqttConfiguration.keepAliveTimeInterval
                                      willTopic:self.mqttConfiguration.lastWillAndTestament.topic
                                        willMsg:[self.mqttConfiguration.lastWillAndTestament.message dataUsingEncoding:NSUTF8StringEncoding]
                                        willQoS:self.mqttConfiguration.lastWillAndTestament.qos
                                 willRetainFlag:NO
                                        runLoop:self.mqttConfiguration.runLoop
                                        forMode:self.mqttConfiguration.runLoopMode
                                 statusCallback:callback];
}

- (void)disconnect{
    [self.mqttClient disconnect];
}


- (BOOL)publishString:(NSString *)string
              onTopic:(NSString *)topic
                  QoS:(AWSIoTMQTTQoS)qos {
    if (string == nil) {
        return NO;
    }
    if (topic == nil || [topic isEqualToString:@""]) {
        return NO;
    }
    
    [self.mqttClient publishString:string qos:(UInt8)qos onTopic:topic];

    return YES;
}


- (BOOL)publishData:(NSData *)data
            onTopic:(NSString *)topic
                QoS:(AWSIoTMQTTQoS)qos {
    if (data == nil) {
        return NO;
    }
    if (topic == nil || [topic isEqualToString:@""]) {
        return NO;
    }
    
    [self.mqttClient publishData:data qos:(UInt8)qos onTopic:topic];
    return YES;
}


- (BOOL)subscribeToTopic:(NSString *)topic
                     QoS:(AWSIoTMQTTQoS)qos
         messageCallback:(AWSIoTMQTTNewMessageBlock)callback
{
    if (topic == nil || [topic isEqualToString:@""]) {
        return NO;
    }
    
    [self.mqttClient subscribeToTopic:topic qos:qos messageCallback:callback];
    return YES;
}

- (BOOL)subscribeToTopic:(NSString *)topic
                     QoS:(AWSIoTMQTTQoS)qos
        extendedCallback:(AWSIoTMQTTExtendedNewMessageBlock)callback
{
    if (topic == nil || [topic isEqualToString:@""]) {
        return NO;
    }
    
    [self.mqttClient subscribeToTopic:topic qos:qos extendedCallback:callback];
    return YES;
}

- (void)unsubscribeTopic:(NSString *)topic {
    if (topic == nil || [topic isEqualToString:@""]) {
        return;
    }

    [self.mqttClient unsubscribeTopic:topic];
}


typedef NS_ENUM(NSInteger, AWSIoTShadowTopicTokenIndices) {
    //
    // Thing shadow topics have the form:
    //
    //      $aws/things/{thingName}/shadow/{Operation}/{Status}
    //      ===================================================
    //        0 |   1  |     2     |  3   |     4     |    5
    //
    // Create some enums to centralize the index values of the
    // tokens.
    //
    AWSIoTShadowTopicTokenAWSIndex,
    AWSIoTShadowTopicTokenThingsIndex,
    AWSIoTShadowTopicTokenThingNameIndex,
    AWSIoTShadowTopicTokenShadowIndex,
    AWSIoTShadowTopicTokenOperationIndex,
    AWSIoTShadowTopicTokenStatusIndex,
    AWSIoTShadowTopicTokenMaxCount       // maximum number of topic tokens in a shadow topic
};

static NSString * const AWSIoTShadowOperationTypeStrings[] = {
    @"update",       // AWSIoTShadowOperationTypeUpdate
    @"get",          // AWSIoTShadowOperationTypeGet
    @"delete"        // AWSIoTShadowOperationTypeDelete
};

static NSString * const AWSIoTShadowOperationStatusTypeStrings[] = {
    @"accepted",     // AWSIoTShadowOperationStatusTypeAccepted
    @"rejected",     // AWSIoTShadowOperationStatusTypeRejected
    @"delta"         // AWSIoTShadowOperationStatusTypeDelta
};

+ (NSArray *)operationTypeStrings {
    static NSArray *operationTypeNames;
    static dispatch_once_t onceToken;
    
    dispatch_once( &onceToken, ^{
        operationTypeNames = [NSArray arrayWithObjects:AWSIoTShadowOperationTypeStrings count:AWSIoTShadowOperationTypeCount];
    });
    return operationTypeNames;
}

+ (NSArray *)operationStatusTypeStrings {
    static NSArray *operationStatusTypeNames;
    static dispatch_once_t onceToken;
    
    dispatch_once( &onceToken, ^{
        operationStatusTypeNames = [NSArray arrayWithObjects:AWSIoTShadowOperationStatusTypeStrings count:AWSIoTShadowOperationStatusTypeCount];
    });
    return operationStatusTypeNames;
}

+ (NSString *)buildTopicForShadow:(NSString *)name
                        operation:(AWSIoTShadowOperationType) operation
                             type:(AWSIoTShadowOperationStatusType) type {
    return [NSString stringWithFormat:@"$aws/things/%@/shadow/%@/%@", name, AWSIoTShadowOperationTypeStrings[operation], AWSIoTShadowOperationStatusTypeStrings[type] ];
}

+ (NSString *)buildTopicForShadow:(NSString *)name
                        operation:(AWSIoTShadowOperationType) operation {
    return [NSString stringWithFormat:@"$aws/things/%@/shadow/%@", name, AWSIoTShadowOperationTypeStrings[operation] ];
}

+ (BOOL) isThingShadowTopicFromTopicTokens:(NSArray *)topicTokens subscribe:(BOOL)subscribe {
    BOOL rc = NO;
    if (([topicTokens count] == AWSIoTShadowTopicTokenMaxCount || [topicTokens count] == AWSIoTShadowTopicTokenMaxCount-1) &&
        [topicTokens[AWSIoTShadowTopicTokenAWSIndex] isEqualToString:@"$aws"] &&
        [topicTokens[AWSIoTShadowTopicTokenThingsIndex] isEqualToString:@"things"] &&
        [topicTokens[AWSIoTShadowTopicTokenShadowIndex] isEqualToString:@"shadow"] &&
        [[self.class operationTypeStrings] indexOfObject:topicTokens[AWSIoTShadowTopicTokenOperationIndex]] != NSNotFound) {
        //
        // Looks good so far; now check the direction and see if
        // still makes sense.
        //
        if (subscribe == YES) {
            if ([topicTokens count] == AWSIoTShadowTopicTokenMaxCount &&
                [[self.class operationStatusTypeStrings] indexOfObject:topicTokens[AWSIoTShadowTopicTokenStatusIndex]] != NSNotFound) {
                rc = YES;
            }
        }
        else {
            if ([topicTokens count] == (AWSIoTShadowTopicTokenMaxCount-1)) {
                rc = YES;
            }
        }
    }
    return rc;
}

- (void)createSubscriptionsForShadow:(AWSIoTDataShadow *)shadow
                          operations:(NSArray *)operations
                              statii:(NSArray *)statii {
    int i, j, k;
    
    for (i = 0, k=(int)[shadow.topics count];
         i < [operations count];
         i++) {
        for (j = 0; j < [statii count]; j++) {
            shadow.topics[k++] = [AWSIoTDataManager buildTopicForShadow:shadow.name operation:(AWSIoTShadowOperationType)[operations[i] integerValue] type:(AWSIoTShadowOperationStatusType)[statii[j] integerValue]];
        }
    }
}

- (BOOL)handleSubscriptionsForShadow:(NSString *)name
                          operations:(NSArray *)operations
                              statii:(NSArray *)statii
                            callback:(AWSIoTMQTTExtendedNewMessageBlock)callback {
    BOOL rc = NO;
    AWSIoTDataShadow *shadow = (AWSIoTDataShadow *)[self.shadows objectForKey:name];
    
    if (shadow != nil) {
        int i;
        
        [self createSubscriptionsForShadow:shadow operations:operations statii:statii];
        for (i = 0; i < [shadow.topics count]; i++) {
            if (callback != nil) {
                if (shadow.enableDebugging == YES) {
                    AWSDDLogInfo(@"subscribing on %@", (NSString *)shadow.topics[i]);
                }
                [self subscribeToTopic:shadow.topics[i] QoS:shadow.qos extendedCallback:callback];
            }
            else {
                if (shadow.enableDebugging == YES) {
                    AWSDDLogInfo(@"unsubscribing from %@", (NSString *)shadow.topics[i]);
                }
                [self unsubscribeTopic:shadow.topics[i]];
            }
        }
        rc = YES;
    }
    else {
        AWSDDLogError(@"no shadow named: %@", name);
    }
    return rc;
}

- (BOOL)handleMessagesForShadow:(NSString *)name
                      operation:(AWSIoTShadowOperationType)operation
                         status:(AWSIoTShadowOperationStatusType)status
                        payload:(NSData *)payload {
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:payload options:NSJSONReadingMutableContainers error:&error];
    BOOL rc = NO;
    
    if (error == nil) {
        NSError *error;
        AWSIoTDataShadowModel *shadowModel = [AWSMTLJSONAdapter modelOfClass:AWSIoTDataShadowModel.class fromJSONDictionary:jsonDictionary error:&error];
        //
        // Update the thing version on every accepted or delta message which
        // contains it.
        //
        if (shadowModel != nil) {
            AWSIoTDataShadow *shadow = [self.shadows objectForKey:name];

            rc = YES;
            if ((shadowModel.version != nil) && (status != AWSIoTShadowOperationStatusTypeRejected)) {
                UInt32 versionNumber = (UInt32)[shadowModel.version integerValue];
                //
                // The shadow version is incremented by AWS IoT and should always increase.
                // Do not update our local version if the received version is less than
                // our version.
                //
                if(versionNumber >= shadow.version) {
                    shadow.version = versionNumber;
                }
                else {
                    //
                    // We've received a message from AWS IoT with a version number lower than
                    // we would expect.  There are two things that can cause this:
                    //
                    //  1) The shadow has been deleted (version # reverts to 1 in this case.)
                    //  2) The message has arrived out-of-order.
                    //
                    // For case 1) we can look at the operation to determine that this
                    // is the case and notify the client if appropriate.  For case 2,
                    // we will not process it unless the client has specifically expressed
                    // an interested in these messages by setting 'discardStale' to false.
                    //
                    if (operation != AWSIoTShadowOperationTypeDelete && shadow.enableStaleDiscards == YES) {
                        if (shadow.enableDebugging == YES) {
                            AWSDDLogInfo(@"out-of-date version '%u' on '%@' (local version '%u')", (unsigned int)versionNumber, name, (unsigned int)shadow.version);
                        }
                        rc = NO;
                    }
                }
            }
            if (rc == YES) {
                //
                // If this is a 'delta' message, call the user's callback
                //
                if (status == AWSIoTShadowOperationStatusTypeDelta) {
                    shadow.callback( shadow.name, operation, status, shadow.clientToken, payload );
                }
                else {
                    //
                    // only accepted/rejected messages past this point
                    // ===============================================
                    // If this is an unkown clientToken (e.g., it doesn't have a corresponding
                    // timeout), the shadow has been modified by another client.  If it's an
                    // update/accepted or delete/accepted, call the user's callback if they've
                    // requested foreign state update notifications.
                    //
                    if ((shadow.timer == nil) || ![shadowModel.clientToken isEqualToString:shadow.clientToken] ) {
                        if (status == AWSIoTShadowOperationStatusTypeAccepted &&
                            operation != AWSIoTShadowOperationTypeGet &&
                            shadow.enableForeignStateUpdateNotifications == YES) {
                            //
                            // This is a foreign update or delete accepted, invoke the user's
                            // callback.
                            //
                            shadow.callback( shadow.name, operation, AWSIoTShadowOperationStatusTypeForeignUpdate, shadow.clientToken, payload );
                        }
                    }
                    else {
                        //
                        // This is a response to our operation.  Cancel the operation timeout.
                        //
                        [shadow.timer invalidate];
                        shadow.timer = nil;
                        
                        //
                        // Invoke the user's callback.
                        //
                        shadow.callback( shadow.name, operation, status, shadowModel.clientToken, payload );
                    }
                }
            }
        }
        else {
            AWSDDLogError(@"error serializing json for shadow (%@): %@", name, error.localizedDescription);
        }
    }
    return rc;
}

static void (^shadowMqttMessageHandler)(NSObject *mqttClient, NSString *topic, NSData *data) = ^(NSObject *mqttClient, NSString *topic, NSData *data) {
    AWSIoTDataManager *iotDataManager = (AWSIoTDataManager *)(((AWSIoTMQTTClient *)mqttClient).associatedObject);
    //
    // Parse the topic tokens to determine what to do with the payload
    //
    NSArray *topicTokens = [topic componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
    
    if ([AWSIoTDataManager isThingShadowTopicFromTopicTokens:topicTokens subscribe:YES] == YES) {
        //
        // This is a valid shadow topic, see if it is in the dictionary
        //
        AWSIoTDataShadow *shadow = (AWSIoTDataShadow *)[iotDataManager.shadows objectForKey:topicTokens[2]];
        if (shadow != nil) {
            AWSIoTShadowOperationType operation = [[iotDataManager.class operationTypeStrings] indexOfObject:topicTokens[4]];
            AWSIoTShadowOperationStatusType status = [[iotDataManager.class operationStatusTypeStrings] indexOfObject:topicTokens[5]];
            //
            // The shadow is in our dictionary so it has been registered; fetch the operation and status
            // types and if they're correct, handle the message.
            //
            if (operation != NSNotFound && status != NSNotFound) {
                if ([iotDataManager handleMessagesForShadow:shadow.name operation:operation status:status payload:data] != YES) {
                    AWSDDLogError(@"error handling shadow operation (%@) with status (%@)", topicTokens[4], topicTokens[5]);
                }
            }
            else {
                AWSDDLogError(@"unknown shadow operation (%@) or status (%@)", topicTokens[4], topicTokens[5]);
            }
        }
        else {
            AWSDDLogInfo(@"unknown shadow (%@): operation (%@) or status (%@)", topicTokens[2], topicTokens[4], topicTokens[5]);
        }
    }
};

- (NSString *) generateClientToken {
    NSRange range;
    //
    // This method maintains the current client token rolling count.
    //
    static UInt32 currentToken = 1;
    //
    // Client tokens are limited to 64 bytes by the service, but client IDs can be
    // up to 128 bytes in length.  Use only the last 48 bytes of the client ID when
    // creating a new client token.
    //
    if ([self.mqttClient.clientId length] > 48 ) {
        range = NSMakeRange([self.mqttClient.clientId length] - 48, 48);
    }
    else {
        range = NSMakeRange( 0, [self.mqttClient.clientId length]);
    }
    return [NSString stringWithFormat:@"%@-%u", [self.mqttClient.clientId substringWithRange:range], (unsigned int)currentToken++];
}

- (void) shadowOperationTimeoutOnTimer:(NSTimer *)timer {
    NSString *shadowName = (NSString *)[timer userInfo];
    AWSIoTDataShadow *shadow = [self.shadows objectForKey:shadowName];
    
    //
    // Notify the user's application of the timeout.
    //
    NSString* str = @"timeout";
    NSData* payloadData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    shadow.callback( shadow.name, shadow.operation, AWSIoTShadowOperationStatusTypeTimeout, shadow.clientToken, payloadData );
    //
    // Indicate that no operation is currently active.
    //
    shadow.operation = AWSIoTShadowOperationTypeNone;
    //
    // Delete the operation timer
    //
    [shadow.timer invalidate];
    shadow.timer = nil;
}

- (BOOL) operationWithShadow:(NSString *)name
                   operation:(AWSIoTShadowOperationType)operation
             stateDictionary:(NSMutableDictionary *)stateDictionary {
    AWSIoTDataShadow *shadow = [self.shadows objectForKey:name];
    BOOL rc = NO;
    
    if (shadow != nil) {
        //
        // Don't allow a new operation if an existing one is still in progress.
        //
        if (shadow.timer == nil) {
            NSString *publishTopic;
            
            //
            // Starting a new operation; if not provided, construct a clientToken from
            // the clientId and a rolling operation count.  Client tokens are transmitted
            // in all published state objects, and are returned to the caller along with
            // the status for each operation.  Applications can use client token values
            // to correlate received responses or timeouts with the original operations.
            //
            if ([stateDictionary objectForKey:@"clientToken"] == nil) {
                [stateDictionary setValue:[self generateClientToken] forKey:@"clientToken"];
            }
            publishTopic = [self.class buildTopicForShadow:name operation:operation];
            
            //
            // Set the current operation type and client token for this shadow.
            //
            shadow.operation = operation;
            shadow.clientToken = [stateDictionary objectForKey:@"clientToken"];
            
            //
            // Start the shadow operation timer.
            //
            shadow.timer = [NSTimer timerWithTimeInterval:shadow.operationTimeout target:self selector: @selector(shadowOperationTimeoutOnTimer:) userInfo:name repeats:NO];
            [[NSRunLoop mainRunLoop] addTimer:shadow.timer forMode:NSRunLoopCommonModes];
            //
            // Add the version number (if known and versioning is enabled) and
            // client token properties to the state dictionary.
            //
            if ((shadow.version > 0) && (shadow.enableVersioning == YES)) {
                [stateDictionary setValue:[NSNumber numberWithInteger:shadow.version] forKey:@"version"];
            }
            
            NSError *error;
            NSData *publishData = [NSJSONSerialization dataWithJSONObject:stateDictionary options:0 error:&error];
            
            [self publishData:publishData onTopic:publishTopic QoS:shadow.qos];
            if (shadow.enableDebugging == YES) {
                AWSDDLogInfo(@"published (%@) on topic (%@)", [[NSString alloc] initWithData:publishData encoding:NSUTF8StringEncoding], publishTopic);
            }
            rc = shadow.clientToken != nil;      // return the client token to the caller
        }
        else {
            AWSDDLogInfo(@"operation still in progress on shadow (%@)", name);
        }
    }
    else {
        AWSDDLogError(@"attempting to (%@) unknown shadow (%@)", [[self.class operationTypeStrings] objectAtIndex:operation], name);
    }
    return rc;
}

- (BOOL) registerWithShadow:(NSString *)name
                    options:(NSDictionary *)options
              eventCallback:(void(^)(NSString *name, AWSIoTShadowOperationType operation, AWSIoTShadowOperationStatusType status, NSString *clientToken, NSData *payload))callback {
    BOOL rc = YES;
    
    AWSIoTDataShadow *shadow = [self.shadows objectForKey:name];
    
    if (shadow == nil) {
        //
        // This shadow has not yet been registered; create a new shadow with
        // default options.
        //
        shadow = [[AWSIoTDataShadow alloc] initWithName:name debug:NO versioned:NO discardStaleUpdates:YES discardDeltas:NO updateOnForeignChanges:NO operationTimeout:10.0 QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce callback:callback];
        
        if (shadow != nil) {
            //
            // Shadow created successfully; add it to the dictionary of shadows.
            //
            [self.shadows setObject:shadow forKey:name];
            if (options != nil) {
                //
                // If the caller provided an options dictionary, set the shadow's options
                // according to their preferences.
                //
                NSNumber *numberOptionValue = [options valueForKey:@"enableDebugging"];
                if (numberOptionValue != nil) {
                    shadow.enableDebugging = [numberOptionValue integerValue];
                }
                numberOptionValue = [options valueForKey:@"enableVersioning"];
                if (numberOptionValue != nil) {
                    shadow.enableVersioning = [numberOptionValue integerValue];
                }
                numberOptionValue = [options valueForKey:@"enableForeignStateUpdateNotifications"];
                if (numberOptionValue != nil) {
                    shadow.enableForeignStateUpdateNotifications = [numberOptionValue integerValue];
                }
                numberOptionValue = [options valueForKey:@"enableStaleDiscards"];
                if (numberOptionValue != nil) {
                    shadow.enableStaleDiscards = [numberOptionValue integerValue];
                }
                numberOptionValue = [options valueForKey:@"enableIgnoreDeltas"];
                if (numberOptionValue != nil) {
                    shadow.enableIgnoreDeltas = [numberOptionValue integerValue];
                }
                numberOptionValue = [options valueForKey:@"QoS"];
                if (numberOptionValue != nil) {
                    shadow.qos = [numberOptionValue integerValue];
                }
                numberOptionValue = [options valueForKey:@"shadowOperationTimeoutSeconds"];
                if (numberOptionValue != nil) {
                    shadow.operationTimeout = [numberOptionValue doubleValue];
                }
            }
            if (shadow.enableIgnoreDeltas == NO) {
                rc = [self handleSubscriptionsForShadow:shadow.name operations:[NSArray arrayWithObjects:[NSNumber numberWithInteger:AWSIoTShadowOperationTypeUpdate], nil] statii:[NSArray arrayWithObjects:[NSNumber numberWithInteger:AWSIoTShadowOperationStatusTypeDelta], nil] callback:shadowMqttMessageHandler];
            }
            if (rc == YES) {
                //
                // Persistently subscribe to the special topics for this shadow.
                //
                rc = [self handleSubscriptionsForShadow:shadow.name operations:[NSArray arrayWithObjects:[NSNumber numberWithInteger:AWSIoTShadowOperationTypeUpdate], [NSNumber numberWithInteger:AWSIoTShadowOperationTypeGet], [NSNumber numberWithInteger:AWSIoTShadowOperationTypeDelete], nil] statii:[NSArray arrayWithObjects:[NSNumber numberWithInteger:AWSIoTShadowOperationStatusTypeAccepted], [NSNumber numberWithInteger:AWSIoTShadowOperationStatusTypeRejected], nil] callback:shadowMqttMessageHandler];
            }
            else {
                AWSDDLogError(@"unable to subscribe to delta topic for (%@)", name);
            }
        }
        else {
            AWSDDLogError(@"error creating shadow for (%@)", name);
        }
    }
    else {
        AWSDDLogError(@"(%@) is already registered", name);
    }
    return rc;
}

- (BOOL) unregisterFromShadow:(NSString *)name {
    BOOL rc = NO;
    
    AWSIoTDataShadow *shadow = [self.shadows objectForKey:name];
    
    if (shadow != nil) {
        //
        // If this shadow is not configured to ignore deltas, unsubscribe from the
        // delta topic.
        //
        if (shadow.enableIgnoreDeltas == NO) {
            rc = [self handleSubscriptionsForShadow:shadow.name operations:[NSArray arrayWithObjects:[NSString stringWithFormat:@"update"], nil] statii:[NSArray arrayWithObjects:[NSString stringWithFormat:@"delta"], nil] callback:nil];
        }
        //
        // Unsubscribe to the special topics for this shadow.
        //
        rc |= [self handleSubscriptionsForShadow:shadow.name operations:[NSArray arrayWithObjects:[NSString stringWithFormat:@"update"], [NSString stringWithFormat:@"get"], [NSString stringWithFormat:@"delete"], nil] statii:[NSArray arrayWithObjects:[NSString stringWithFormat:@"accepted"], [NSString stringWithFormat:@"rejected"], nil] callback:nil];
 
        //invalidate the timer as the shadow is being unregistered.
        [shadow.timer invalidate];
        shadow.timer = nil;
        //
        // Remove the shadow from the dictionary
        //
        [self.shadows removeObjectForKey:name];
    }
    else {
        AWSDDLogError(@"(%@) is not registered", name);
    }
    return rc;
}

- (BOOL) updateShadow:(NSString *)name
           jsonString:(NSString *)jsonString {
    
    return [self updateShadow:name jsonString:jsonString clientToken:nil];
}
- (BOOL) updateShadow:(NSString *)name
           jsonString:(NSString *)jsonString
          clientToken:(NSString *)clientToken {
    NSError *error;
    NSMutableDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
    
    BOOL rc = NO;
    
    if (error == nil) {
        //
        // Verify that the JSON state doesn't contain a "version" property,
        // as this property is reserved for use within this class and the
        // service.
        //
        if ([jsonDictionary objectForKey:@"version"] == nil) {
            //
            // If the caller has specified a client token to use, add it to the dictionary.
            //
            if (clientToken != nil) {
                [jsonDictionary setValue:clientToken forKey:@"clientToken"];
            }
            //
            // Perform the shadow update operation.
            //
            rc = [self operationWithShadow:name operation:AWSIoTShadowOperationTypeUpdate stateDictionary:jsonDictionary];
        }
        else {
            AWSDDLogError(@"json for (%@) cannot contain a version property", name);
        }
    }
    else {
        AWSDDLogError(@"error serializing json for shadow (%@): %@", name, error.localizedDescription);
    }
    return rc;
}

- (BOOL) getShadow:(NSString *)name {
    return [self getShadow:name clientToken:nil];
}

- (BOOL) getShadow:(NSString *)name
       clientToken:(NSString *)clientToken {
    NSMutableDictionary *jsonDictionary = [NSMutableDictionary new];
    
    BOOL rc = NO;
    
    if (jsonDictionary != nil) {
        //
        // If the caller has specified a client token to use, add it to the dictionary.
        //
        if (clientToken != nil) {
            [jsonDictionary setValue:clientToken forKey:@"clientToken"];
        }
        //
        // Perform the shadow update operation.
        //
        rc = [self operationWithShadow:name operation:AWSIoTShadowOperationTypeGet stateDictionary:jsonDictionary];
    }
    else {
        AWSDDLogError(@"can't initialize json dictionary for shadow (%@)", name);
    }
    return rc;
}

- (BOOL) deleteShadow:(NSString *)name {
    return [self deleteShadow:name clientToken:nil];
}

- (BOOL) deleteShadow:(NSString *)name
          clientToken:(NSString *)clientToken {
    NSMutableDictionary *jsonDictionary = [NSMutableDictionary new];
    
    BOOL rc = NO;
    
    if (jsonDictionary != nil) {
        //
        // If the caller has specified a client token to use, add it to the dictionary.
        //
        if (clientToken != nil) {
            [jsonDictionary setValue:clientToken forKey:@"clientToken"];
        }
        //
        // Perform the shadow update operation.
        //
        rc = [self operationWithShadow:name operation:AWSIoTShadowOperationTypeDelete stateDictionary:jsonDictionary];
    }
    else {
        AWSDDLogError(@"can't initialize json dictionary for shadow (%@)", name);
    }
    return rc;
}

@end
