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

#import "AWSSignature.h"
#import "AWSIoTDataManager.h"
#import "AWSIoTMQTTClient.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSLogging.h"

static NSString *const AWSInfoIoTDataManager = @"IoTDataManager";

@interface AWSIoTData()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@property (nonatomic, readonly) AWSIoTMQTTClient *mqttClient;

@end

@interface AWSIoTDataManager()

@property (nonatomic, strong) AWSIoTData *IoTData;

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
AWSIoTMQTTClient *_mqttClient = nil;

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
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
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
    }
    return self;
}

- (AWSIoTMQTTClient *)mqttClient {
    static AWSIoTMQTTClient *_mqttClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mqttClient = [AWSIoTMQTTClient sharedInstance];
    });

    return _mqttClient;
}

- (BOOL)connectWithClientId:(NSString*)clientId
               cleanSession:(BOOL)cleanSession
                certificateId:(NSString *)certificateId
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback
{
    AWSLogInfo(@"hostName: %@", self.IoTData.configuration.endpoint.hostName);
    AWSLogInfo(@"URL: %@", self.IoTData.configuration.endpoint.URL);

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
//
// Deprecated method
//
- (void)publishString:(NSString *)str
              onTopic:(NSString *)topic {
    (void)[self publishString:str onTopic:topic QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce];
}
//
// Deprecated method
//
- (void)publishString:(NSString *)str
                  qos:(UInt8)qos
              onTopic:(NSString *)topic {
    (void)[self publishString:str onTopic:topic QoS:(AWSIoTMQTTQoS)qos];
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

//
// Deprecated method
//
- (void)publishData:(NSData *)data
            onTopic:(NSString *)topic {
    (void)[self publishData:data onTopic:topic QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce];
}

//
// Deprecated method
//
- (void)publishData:(NSData *)data
                qos:(UInt8)qos
            onTopic:(NSString *)topic {
    (void)[self publishData:data onTopic:topic QoS:(AWSIoTMQTTQoS)qos];
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

//
// Deprecated method
//
- (void)subscribeToTopic:(NSString *)topic
                     qos:(UInt8)qos
         messageCallback:(AWSIoTMQTTNewMessageBlock)callback {
    (void)[self subscribeToTopic:topic QoS:(AWSIoTMQTTQoS)qos messageCallback:callback];
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

- (void)unsubscribeTopic:(NSString *)topic {
    if (topic == nil || [topic isEqualToString:@""]) {
        return;
    }

    [self.mqttClient unsubscribeTopic:topic];
}

@end
