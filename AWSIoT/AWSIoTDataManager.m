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

@interface AWSIoTData()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@property (nonatomic, readonly) AWSIoTMQTTClient *mqttClient;

@end

@interface AWSIoTDataManager()

@property (nonatomic, strong) AWSIoTData *IoTData;

@end

@implementation AWSIoTDataManager

static AWSSynchronizedMutableDictionary *_serviceClients = nil;
AWSIoTMQTTClient *_mqttClient = nil;

+ (instancetype)defaultIoTDataManager {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                     userInfo:nil];
    }

    static AWSIoTDataManager *_defaultIoTDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultIoTDataManager = [[AWSIoTDataManager alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
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
    return [_serviceClients objectForKey:key];
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
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback {
    NSLog(@"hostName: %@", self.IoTData.configuration.endpoint.hostName);
    NSLog(@"URL: %@", self.IoTData.configuration.endpoint.URL);

    if (clientId == nil || [clientId  isEqualToString: @""]) {
        return false;
    }

    if (certificateId == nil || [certificateId isEqualToString:@""]) {
        return false;
    }

    return [self.mqttClient connectWithClientId:clientId
                                     toHost:self.IoTData.configuration.endpoint.hostName
                                       port:8883
                               cleanSession:cleanSession
                              certificateId:certificateId
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
 
    return [self.mqttClient connectWithClientId:clientId
                                   cleanSession:cleanSession
                                  configuration:self.IoTData.configuration
                                 statusCallback:callback];
}

- (void)disconnect{
    [self.mqttClient disconnect];
}

- (void)publishString:(NSString *)str
              onTopic:(NSString *)topic {
    if (str == nil) {
        return;
    }
    if (topic == nil || [topic isEqualToString:@""]) {
        return;
    }

    [self.mqttClient publishString:str onTopic:topic];
}

- (void)publishData:(NSData *)data
            onTopic:(NSString *)topic {
    if (data == nil) {
        return;
    }
    if (topic == nil || [topic isEqualToString:@""]) {
        return;
    }

    [self.mqttClient publishData:data onTopic:topic];
}

- (void)subscribeToTopic:(NSString *)topic
                     qos:(UInt8)qos
         messageCallback:(AWSIoTMQTTNewMessageBlock)callback {
    if (topic == nil || [topic isEqualToString:@""]) {
        return;
    }

    [self.mqttClient subscribeToTopic:topic qos:qos messageCallback:callback];
}

- (void)unsubscribeTopic:(NSString *)topic {
    if (topic == nil || [topic isEqualToString:@""]) {
        return;
    }

    [self.mqttClient unsubscribeTopic:topic];
}

@end
