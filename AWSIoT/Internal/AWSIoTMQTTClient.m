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

#import <Security/Security.h>

#import "AWSSynchronizedMutableDictionary.h"
#import "AWSSignature.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSIOTService.h"
#import "AWSCategory.h"
#import "AWSCocoaLumberjack.h"

#import "AWSIoTMQTTClient.h"
#import "MQTTSession.h"
#import "AWSSRWebSocket.h"
#import "AWSIoTWebSocketOutputStream.h"


#import "AWSIoTKeychain.h"

@implementation AWSIoTMQTTTopicModel
@end

@implementation AWSIoTMQTTQueueMessage
@end

@interface AWSIoTMQTTClient() <AWSSRWebSocketDelegate, NSStreamDelegate, MQTTSessionDelegate>

@property(atomic, assign, readwrite) AWSIoTMQTTStatus mqttStatus;
@property(nonatomic, strong) MQTTSession* session;
@property(nonatomic, strong) NSMutableDictionary * topicListeners;

@property(nonatomic, assign) BOOL userDisconnect;
@property(nonatomic, assign) BOOL needReconnect;

@property(nonatomic, strong) NSString *host;
@property(nonatomic, assign) UInt32 port;
@property(nonatomic, assign) BOOL cleanSession;
@property(nonatomic, strong) NSArray *clientCerts;
@property(nonatomic, strong) AWSSRWebSocket *webSocket;
@property(nonatomic, strong) AWSServiceConfiguration *configuration;

@property(atomic, assign) NSTimeInterval currentReconnectTime;
@property(nonatomic, strong)NSTimer *reconnectTimer;
@property(nonatomic, strong)NSTimer *connectionTimer;
@property(nonatomic, strong)NSTimer *postConnectTimer;
@property(nonatomic, strong)NSTimer *emptyQueueTimer;
@property(atomic, assign) NSTimeInterval postConnectTime;

//
// Two bound pairs of streams are used to connect the MQTT
// client to the WebSocket: one for the encoder, and one for
// the decoder.
//
@property(nonatomic, assign) CFWriteStreamRef encoderWriteStream;
@property(nonatomic, assign) CFReadStreamRef  decoderReadStream;
@property(nonatomic, assign) CFWriteStreamRef decoderWriteStream;
@property(nonatomic, strong) AWSIoTWebSocketOutputStream *encoderStream;      // MQTT encoder writes to this one
@property(nonatomic, strong) NSInputStream  *decoderStream;      // MQTT decoder reads from this one
@property(nonatomic, strong) NSOutputStream *toDecoderStream;    // We write to this one

@property (nonatomic, copy) void (^connectStatusCallback)(AWSIoTMQTTStatus status);
@property (nonatomic, strong) NSMutableArray *queueMessages;

@property (nonatomic, strong) NSThread *streamsThread;
@property (atomic, assign) BOOL runLoopShouldContinue;
@property (nonatomic, strong) dispatch_semaphore_t runloopSemaphore;

@end

@implementation AWSIoTMQTTClient

static AWSIoTMQTTClient *_defaultMQTTClient = nil;
static const int WAIT_TIMEOUT_IN_SEC = 3;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSDDLogDebug(@"creating AwsIotMqttClient.");
        _defaultMQTTClient = [AWSIoTMQTTClient new];
        if( _defaultMQTTClient == nil) {
            AWSDDLogError(@"*****************************************");
            AWSDDLogError(@"Fatal: could not create AWSIotMqttClient.");
            AWSDDLogError(@"*****************************************");
        }
        assert(_defaultMQTTClient != nil);
    });
    return _defaultMQTTClient;
}

- (instancetype)init {
    if (self = [super init]) {
        _topicListeners = [NSMutableDictionary dictionary];
        _queueMessages = [NSMutableArray new];
        _clientCerts = nil;
        _session.delegate = nil;
        _session = nil;
        _clientId = nil;
        _associatedObject = nil;
        _currentReconnectTime = 1;
        _baseReconnectTime = 1;
        _minimumConnectionTime = 20;
        _maximumReconnectTime = 128;
        _postConnectTime = 0.5;
        _runloopSemaphore = dispatch_semaphore_create(0);
        _autoResubscribe = YES;
    }
    return self;
}

- (NSData *)getDerivedKeyForSecretKey:(NSString *)secretKey
                            dateStamp:(NSString *)dateStamp
                           regionName:(NSString *)regionName
                          serviceName:(NSString *)serviceName;
{
    // AWS4 uses a series of derived keys, formed by hashing different pieces of data
    NSString *kSecret = [NSString stringWithFormat:@"AWS4%@", secretKey];
    NSData *kDate = [AWSSignatureSignerUtility sha256HMacWithData:[dateStamp dataUsingEncoding:NSUTF8StringEncoding]
                                                          withKey:[kSecret dataUsingEncoding:NSUTF8StringEncoding]];
    NSData *kRegion = [AWSSignatureSignerUtility sha256HMacWithData:[regionName dataUsingEncoding:NSASCIIStringEncoding]
                                                            withKey:kDate];
    NSData *kService = [AWSSignatureSignerUtility sha256HMacWithData:[serviceName dataUsingEncoding:NSUTF8StringEncoding]
                                                             withKey:kRegion];
    NSData *kSigning = [AWSSignatureSignerUtility sha256HMacWithData:[AWSSignatureV4Terminator dataUsingEncoding:NSUTF8StringEncoding]
                                                             withKey:kService];
    return kSigning;
}

- (NSString *)signWebSocketUrlForMethod:(NSString *)method
                                 scheme:(NSString *)scheme
                               hostName:(NSString *)hostName
                                   path:(NSString *)path
                            queryParams:(NSString *)queryParams
                              accessKey:(NSString *)accessKey
                              secretKey:(NSString *)secretKey
                             regionName:(NSString *)regionName
                            serviceName:(NSString *)serviceName
                                payload:(NSString *)payload
                                  today:(NSString *)today
                                    now:(NSString *)now
                             sessionKey:(NSString *)sessionKey;
{
    NSString *payloadHash = [AWSSignatureSignerUtility hexEncode:[AWSSignatureSignerUtility hashString:payload]];
    NSString *canonicalRequest = [NSString stringWithFormat:@"%@\n%@\n%@\nhost:%@\n\nhost\n%@",
                                  method,
                                  path,
                                  queryParams,
                                  hostName,
                                  payloadHash];
    NSString *hashedCanonicalRequest = [AWSSignatureSignerUtility hexEncode:[AWSSignatureSignerUtility hashString:canonicalRequest]];
    NSString *stringToSign = [NSString stringWithFormat:@"AWS4-HMAC-SHA256\n%@\n%@/%@/%@/%@\n%@",
                              now,
                              today,
                              regionName,
                              serviceName,
                              AWSSignatureV4Terminator,
                              hashedCanonicalRequest];
    NSData *signingKey = [self getDerivedKeyForSecretKey:secretKey dateStamp:today regionName:regionName serviceName:serviceName];
    NSData *signature  = [AWSSignatureSignerUtility sha256HMacWithData:[stringToSign dataUsingEncoding:NSUTF8StringEncoding]
                                                               withKey:signingKey];
    NSString *signatureString = [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:signature
                                                                                           encoding:NSASCIIStringEncoding]];
    NSString *url = nil;

    if (sessionKey != nil)
    {
        url = [NSString stringWithFormat:@"%@%@%@?%@&X-Amz-Security-Token=%@&X-Amz-Signature=%@",
               scheme,
               hostName,
               path,
               queryParams,
               [sessionKey aws_stringWithURLEncoding],
               signatureString];
    }
    else
    {
        url = [NSString stringWithFormat:@"%@%@%@?%@&X-Amz-Signature=%@",
               scheme,
               hostName,
               path,
               queryParams,
               signatureString];
    }
    return url;
}

- (NSString *)prepareWebSocketUrlWithHostName:(NSString *)hostName
                                   regionName:(NSString *)regionName
                                    accessKey:(NSString *)accessKey
                                    secretKey:(NSString *)secretKey
                                   sessionKey:(NSString *)sessionKey
{
    NSDate *date          = [NSDate aws_clockSkewFixedDate];
    NSString *now         = [date aws_stringValue:AWSDateISO8601DateFormat2];
    NSString *today       = [date aws_stringValue:AWSDateShortDateFormat1];
    NSString *path        = @"/mqtt";
    NSString *serviceName = @"iotdata";
    NSString *algorithm   = @"AWS4-HMAC-SHA256";

    NSString *queryParams = [NSString stringWithFormat:@"X-Amz-Algorithm=%@&X-Amz-Credential=%@%%2F%@%%2F%@%%2F%@%%2Faws4_request&X-Amz-Date=%@&X-Amz-SignedHeaders=host",
                             algorithm,
                             accessKey,
                             today,
                             regionName,
                             serviceName,
                             now];

    return [self signWebSocketUrlForMethod:@"GET" scheme:@"wss://" hostName:hostName path:path  queryParams:queryParams accessKey:accessKey secretKey:secretKey regionName:regionName serviceName:serviceName payload:@"" today:today now:now sessionKey:sessionKey];
}

- (BOOL)connectWithClientId:(NSString*)clientId
                     toHost:(NSString*)host
                       port:(UInt32)port
               cleanSession:(BOOL)cleanSession
              certificateId:(NSString*)certificateId
                  keepAlive:(UInt16)theKeepAliveInterval
                  willTopic:(NSString*)willTopic
                    willMsg:(NSData*)willMsg
                    willQoS:(UInt8)willQoS
             willRetainFlag:(BOOL)willRetainFlag
                    runLoop:(NSRunLoop*)theRunLoop
                    forMode:(NSString*)theRunLoopMode
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback {
    SecIdentityRef identityRef = [AWSIoTKeychain getIdentityRef:[NSString stringWithFormat:@"%@%@",[AWSIoTKeychain privateKeyTag], certificateId ]];
    if (identityRef == NULL) {
        AWSDDLogError(@"Could not find SecIdentityRef");
        return NO;
    };
    self.mqttStatus = AWSIoTMQTTStatusConnecting;
    self.clientCerts = [[NSArray alloc] initWithObjects:(__bridge id)identityRef, nil];
    self.host = host;
    self.port = port;
    self.cleanSession = cleanSession;
    self.connectStatusCallback = callback;
    self.clientId = clientId;

    if (self.cleanSession) {
        [self.topicListeners removeAllObjects];
        [self.queueMessages removeAllObjects];
    }

    self.session= [[MQTTSession alloc] initWithClientId:clientId userName:@"" password:@"" keepAlive:theKeepAliveInterval cleanSession:cleanSession willTopic:willTopic willMsg:willMsg willQoS:willQoS willRetainFlag:willRetainFlag runLoop:theRunLoop forMode:theRunLoopMode];

    [self notifyConnectionStatus];

    self.session.delegate = self;

    [self.session connectToHost:_host port:_port usingSSL:YES sslCertificated:_clientCerts];

    return YES;
}

- (BOOL)connectWithClientId:(NSString *)clientId
               cleanSession:(BOOL)cleanSession
              configuration:(AWSServiceConfiguration *)configuration
                  keepAlive:(UInt16)theKeepAliveInterval
                  willTopic:(NSString*)willTopic
                    willMsg:(NSData*)willMsg
                    willQoS:(UInt8)willQoS
             willRetainFlag:(BOOL)willRetainFlag
                    runLoop:(NSRunLoop*)theRunLoop
                    forMode:(NSString*)theRunLoopMode
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;
{
    //
    // no client certificate specified, connect via WebSocket
    //
    AWSDDLogInfo(@"AWSIoTMQTTClient: connecting via websocket. ");
    if ((configuration != nil) && (clientId != nil))
    {
        [[configuration.credentialsProvider credentials] continueWithBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
            if (task.error) {
                if (self.reconnectTimer == nil) {
                    self.reconnectTimer =[NSTimer timerWithTimeInterval:self.currentReconnectTime target:self selector: @selector(reconnectToSession) userInfo:nil repeats:NO];
                    [[NSRunLoop mainRunLoop] addTimer:self.reconnectTimer forMode:NSRunLoopCommonModes];
                }
                AWSDDLogError(@"error fetching credentials");
            }
            else {
                AWSCredentials *credentials = task.result;

                NSString *urlString = [self prepareWebSocketUrlWithHostName:configuration.endpoint.hostName regionName:configuration.endpoint.regionName accessKey:credentials.accessKey secretKey:credentials.secretKey sessionKey:credentials.sessionKey ];

                if (urlString != nil)
                {
                    self.configuration = configuration;
                    [self webSocketConnectWithClientId:clientId
                                            urlRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]
                                          cleanSession:cleanSession
                                             keepAlive:theKeepAliveInterval
                                             willTopic:willTopic
                                               willMsg:willMsg
                                               willQoS:willQoS
                                        willRetainFlag:willRetainFlag
                                               runLoop:theRunLoop
                                               forMode:theRunLoopMode
                                        statusCallback:callback];
                }
            }
            return nil;
        }];
        //
        // Since the work in this method must be asynchronous in order to support
        // the use of an asynchronous credentials provider (e.g. Cognito), it will
        // always return successfully.
        //
        AWSDDLogDebug(@"%s [Line %d], Thread:%@ ", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
        return YES;
    }
    else
    {
        //
        // Invalidate input parameters, return unsuccessfully.
        //
        return NO;
    }

}

- (BOOL)webSocketConnectWithClientId:(NSString *)clientId
                          urlRequest:(NSURLRequest *)urlRequest
                        cleanSession:(BOOL)cleanSession
                           keepAlive:(UInt16)theKeepAliveInterval
                           willTopic:(NSString*)willTopic
                             willMsg:(NSData*)willMsg
                             willQoS:(UInt8)willQoS
                      willRetainFlag:(BOOL)willRetainFlag
                             runLoop:(NSRunLoop*)theRunLoop
                             forMode:(NSString*)theRunLoopMode
                      statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;
{
    self.mqttStatus = AWSIoTMQTTStatusConnecting;
    self.cleanSession = cleanSession;
    self.connectStatusCallback = callback;
    self.clientId = clientId;

    if (self.cleanSession) {
        [self.topicListeners removeAllObjects];
        [self.queueMessages removeAllObjects];
    }

    self.session = [[MQTTSession alloc] initWithClientId:clientId
                                                userName:@""
                                                password:@""
                                               keepAlive:theKeepAliveInterval
                                            cleanSession:cleanSession
                                               willTopic:willTopic
                                                 willMsg:willMsg
                                                 willQoS:willQoS
                                          willRetainFlag:willRetainFlag
                                                 runLoop:theRunLoop
                                                 forMode:theRunLoopMode];

    [self notifyConnectionStatus];

    self.session.delegate = self;
    self.webSocket = [[AWSSRWebSocket alloc] initWithURLRequest:urlRequest
                                                      protocols:@[@"mqttv3.1"]
                                 allowsUntrustedSSLCertificates:NO];
    self.webSocket.delegate = self;
    [self.webSocket open];

    //
    // Now that the WebSocket is created and opened, it will send us messages.
    //
    AWSDDLogVerbose(@"Websocket is created and opened.");
    return YES;
}

- (void)disconnect {
    self.runLoopShouldContinue = NO; //Since we are calling disconnect, we should let runloopForStreamsThread to exit

    self.userDisconnect = YES;
    [self.reconnectTimer invalidate];
    [self.encoderStream close];
    [self.webSocket close];
    [self.session close];
    self.session.delegate = nil;
    self.session = nil;

    AWSDDLogInfo(@"AWSIoTMQTTClient: Disconnected");
}

- (void)reconnectToSession {
    AWSDDLogInfo(@"Trying to reconnect to session.");
    self.mqttStatus = AWSIoTMQTTStatusConnecting;
    self.needReconnect = self.cleanSession;
    //
    // Clear the existing reconnect timer; also, double the reconnect time which will
    // be used on the next reconnection if this one fails to connect for the minimum
    // connection time.  Note that there is a maximum reconnection time beyond which
    // it can no longer increase, and that the base (default) reconnection time will
    // be restored once the connection remains up for the minimum connection time.
    //
    [self.reconnectTimer invalidate];
    self.reconnectTimer = nil;

    if (self.clientCerts != nil)
    {
        //
        // Connecting with a client certificate/TLS mutual authentication
        //
        [self.session connectToHost:self.host
                               port:self.port
                           usingSSL:YES
                    sslCertificated:self.clientCerts];
    }
    else
    {
        [[self.configuration.credentialsProvider credentials] continueWithBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
            if (task.error) {
                if (self.reconnectTimer == nil) {
                    self.reconnectTimer =[NSTimer timerWithTimeInterval:self.currentReconnectTime
                                                                 target:self
                                                               selector: @selector(reconnectToSession)
                                                               userInfo:nil
                                                                repeats:NO];
                    [[NSRunLoop mainRunLoop] addTimer:self.reconnectTimer
                                              forMode:NSRunLoopCommonModes];
                }
                AWSDDLogError(@"error fetching credentials");
            }
            else {
                AWSCredentials *credentials = task.result;

                NSString *urlString = [self prepareWebSocketUrlWithHostName:self.configuration.endpoint.hostName
                                                                 regionName:self.configuration.endpoint.regionName
                                                                  accessKey:credentials.accessKey
                                                                  secretKey:credentials.secretKey
                                                                 sessionKey:credentials.sessionKey ];
                //
                // Connecting over a WebSocket with SigV4 authentication.  Close and deallocate
                // WebSocket objects so that we can create another one.
                //
                [self.webSocket close];
                [self.encoderStream close];

                //
                // Remove all references to intermediate stream objects and let ARC pick up
                // the memory; we will create new ones when the new WebSocket connects.
                //
                self.webSocket = nil;
                self.encoderWriteStream = nil;
                self.decoderReadStream = nil;
                self.decoderWriteStream = nil;
                self.encoderStream = nil;
                self.decoderStream = nil;
                self.toDecoderStream = nil;

                [self notifyConnectionStatus];

                self.webSocket = [[AWSSRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]
                                                                  protocols:@[@"mqttv3.1"]
                                             allowsUntrustedSSLCertificates:NO];
                self.webSocket.delegate = self;
                [self.webSocket open];

                //
                // Now that the WebSocket is created and opened, it will send us messages.
                //
            }
            return nil;
        }];
    }
    //
    // Double the reconnect time which will be used on the next reconnection if this
    // one fails to connect for the minimum connection time.  Note that there is a
    // maximum reconnection time beyond which it can no longer increase, and that the
    // base (default) reconnection time will be restored once the connection remains
    // up for the minimum connection time.
    //
    self.currentReconnectTime *= 2;
    if ( self.currentReconnectTime > self.maximumReconnectTime ) {
        self.currentReconnectTime = self.maximumReconnectTime;
    }
}

- (void)resubscribeToTopics {
    self.needReconnect = NO;
    self.postConnectTimer = nil;
    if(self.autoResubscribe){
        AWSDDLogInfo(@"Auto-resubscribe is enabled. Resubscribing to topics.");
        for (AWSIoTMQTTTopicModel *topic in self.topicListeners.allValues) {
            [self.session subscribeToTopic:topic.topic atLevel:topic.qos];
        }
    }
}

- (void)markConnectionStable {
    self.connectionTimer = nil;
    self.currentReconnectTime = self.baseReconnectTime;
}

- (void)publishString:(NSString*)str onTopic:(NSString*)topic {
    [self publishData:[str dataUsingEncoding:NSUTF8StringEncoding] onTopic:topic];
}

- (void)publishString:(NSString*)str qos:(UInt8)qos onTopic:(NSString*)topic {
    [self publishData:[str dataUsingEncoding:NSUTF8StringEncoding] qos:qos onTopic:topic];
}

- (void)publishData:(NSData*)data onTopic:(NSString*)topic {

    AWSDDLogVerbose(@"isReadyToPublish: %i",[self.session isReadyToPublish]);

    if ([self.session isReadyToPublish]) {
        [self.session publishData:data onTopic:topic];
    } else {
        AWSIoTMQTTQueueMessage *message = [AWSIoTMQTTQueueMessage new];
        message.topic = topic;
        message.message = data;
        message.qos = 0;
        [self.queueMessages addObject:message];
    }
}

- (void)publishData:(NSData*)data qos:(UInt8)qos onTopic:(NSString*)topic {

    AWSDDLogVerbose(@"isReadyToPublish: %i",[self.session isReadyToPublish]);

    if (qos < 2) {
        if ([self.session isReadyToPublish]) {
            if (qos == 0) {
                [self.session publishData:data onTopic:topic];
            }
            else {
                [self.session publishDataAtLeastOnce:data onTopic:topic];
            }
        } else {
            AWSIoTMQTTQueueMessage *message = [AWSIoTMQTTQueueMessage new];
            message.topic = topic;
            message.message = data;
            message.qos = qos;
            [self.queueMessages addObject:message];
        }
    }
    else {
        AWSDDLogError(@"invalid qos value: %u", qos);
    }
}

- (void)subscribeToTopic:(NSString*)topic qos:(UInt8)qos messageCallback:(AWSIoTMQTTNewMessageBlock)callback {
    AWSDDLogInfo(@"Subscribing to topic %@ with messageCallback", topic);
    AWSIoTMQTTTopicModel *topicModel = [AWSIoTMQTTTopicModel new];
    topicModel.topic = topic;
    topicModel.qos = qos;
    topicModel.callback = callback;
    [self.topicListeners setObject:topicModel forKey:topic];
    [self.session subscribeToTopic:topicModel.topic atLevel:topicModel.qos];
}

- (void)subscribeToTopic:(NSString*)topic qos:(UInt8)qos extendedCallback:(AWSIoTMQTTExtendedNewMessageBlock)callback {
    AWSDDLogInfo(@"Subscribing to topic %@ with ExtendedmessageCallback", topic);
    AWSIoTMQTTTopicModel *topicModel = [AWSIoTMQTTTopicModel new];
    topicModel.topic = topic;
    topicModel.qos = qos;
    topicModel.callback = nil;
    topicModel.extendedCallback = callback;
    [self.topicListeners setObject:topicModel forKey:topic];
    [self.session subscribeToTopic:topicModel.topic atLevel:topicModel.qos];
}

- (void)unsubscribeTopic:(NSString*)topic {
    AWSDDLogInfo(@"Unsubscribing from topic %@", topic);
    [self.session unsubscribeTopic:topic];
    [self.topicListeners removeObjectForKey:topic];
}

- (void)publishMessagesFromQueue {
    self.emptyQueueTimer = nil;
    AWSDDLogVerbose(@"publishMessagesFromQueue");
    AWSIoTMQTTQueueMessage *message = [self.queueMessages firstObject];
    if (message && [self.session isReadyToPublish]) {
        AWSDDLogVerbose(@"publishData on topic %@",message.topic);
        if (message.qos == 0) {
            [self.session publishData:message.message onTopic:message.topic];
        }
        else {
            [self.session publishDataAtLeastOnce:message.message onTopic:message.topic];
        }
        [self.queueMessages removeObjectAtIndex:0];
    }

    if (self.queueMessages.count) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            if ([self.session isReadyToPublish]) {
                [self publishMessagesFromQueue];
            }
        });
    }
}

- (void) notifyConnectionStatus {
    if (self.connectStatusCallback != nil) {
        self.connectStatusCallback(self.mqttStatus);
    }
}

#pragma-mark MQTTSessionDelegate

- (void)session:(MQTTSession*)session handleEvent:(MQTTSessionEvent)eventCode {
    AWSDDLogVerbose(@"MQTTSessionDelegate handleEvent: %i",eventCode);

    switch (eventCode) {
        case MQTTSessionEventConnected:
            AWSDDLogInfo(@"MQTT session connected.");
            self.mqttStatus = AWSIoTMQTTStatusConnected;
            [self notifyConnectionStatus];
            self.connectionTimer = [NSTimer scheduledTimerWithTimeInterval:self.minimumConnectionTime target:self selector: @selector(markConnectionStable) userInfo: nil repeats:NO];

            if (self.needReconnect) {
                self.postConnectTimer = [NSTimer scheduledTimerWithTimeInterval:self.postConnectTime target: self selector: @selector(resubscribeToTopics) userInfo: nil repeats:NO];
            }
            if (self.queueMessages.count) {
                self.emptyQueueTimer = [NSTimer scheduledTimerWithTimeInterval:self.postConnectTime+1.5 target:self selector:@selector( publishMessagesFromQueue ) userInfo: nil repeats: NO];
            }
            break;
        case MQTTSessionEventConnectionRefused:
            AWSDDLogWarn(@"MQTT session refused.");
            self.mqttStatus = AWSIoTMQTTStatusConnectionRefused;
            [self notifyConnectionStatus];
            break;
        case MQTTSessionEventConnectionClosed:
            AWSDDLogInfo(@"MQTT session closed.");
            if (!self.userDisconnect && self.session) {
                if (self.reconnectTimer == nil) {
                    self.reconnectTimer =[NSTimer scheduledTimerWithTimeInterval:self.currentReconnectTime target:self selector: @selector(reconnectToSession) userInfo:nil repeats:NO];
                }
            } else {
                self.mqttStatus = AWSIoTMQTTStatusDisconnected;
                self.userDisconnect = NO;
                [self notifyConnectionStatus];
                self.connectStatusCallback = nil;
            }
            [self.postConnectTimer invalidate];
            [self.emptyQueueTimer invalidate];
            [self.connectionTimer invalidate];
            break;
        case MQTTSessionEventConnectionError:
            AWSDDLogError(@"MQTT session connection error");
            self.mqttStatus = AWSIoTMQTTStatusConnectionError;
            [self notifyConnectionStatus];
            if (!self.userDisconnect && self.session) {
                if (self.reconnectTimer == nil) {
                    AWSDDLogDebug(@"setting up reconnectTimer.");
                    self.reconnectTimer =[NSTimer scheduledTimerWithTimeInterval:self.currentReconnectTime target:self selector: @selector(reconnectToSession) userInfo:nil repeats:NO];
                }
            }
            [self.postConnectTimer invalidate];
            [self.emptyQueueTimer invalidate];
            [self.connectionTimer invalidate];
            break;
        case MQTTSessionEventProtocolError:
            AWSDDLogError(@"MQTT session protocol error");
            self.mqttStatus = AWSIoTMQTTStatusProtocolError;
            [self notifyConnectionStatus];
            [self.postConnectTimer invalidate];
            [self.emptyQueueTimer invalidate];
            [self.connectionTimer invalidate];
            break;
        default:
            break;
    }

}

- (void)session:(MQTTSession*)session newMessage:(NSData*)data onTopic:(NSString*)topic {
    AWSDDLogVerbose(@"MQTTSessionDelegate newMessage: %@ onTopic: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding], topic);

    NSArray *topicParts = [topic componentsSeparatedByString: @"/"];

    for (NSString *topicKey in self.topicListeners.allKeys) {
        NSArray *topicKeyParts = [topicKey componentsSeparatedByString: @"/"];

        BOOL topicMatch = true;
        for (int i = 0; i < topicKeyParts.count; i++) {
            if (i >= topicParts.count) {
                topicMatch = false;
                break;
            }

            NSString *topicPart = topicParts[i];
            NSString *topicKeyPart = topicKeyParts[i];

            if ([topicKeyPart rangeOfString:@"#"].location == NSNotFound && [topicKeyPart rangeOfString:@"+"].location == NSNotFound) {
                if (![topicPart isEqualToString:topicKeyPart]) {
                    topicMatch = false;
                    break;
                }
            }
        }

        if (topicMatch) {
            AWSDDLogInfo(@"Topic: %@ is matched.", topic);
            AWSIoTMQTTTopicModel *topicModel = [self.topicListeners objectForKey:topicKey];
            if (topicModel) {
                if (topicModel.callback != nil) {
                    AWSDDLogVerbose(@"topicModel.callback.");
                    topicModel.callback(data);
                }
                if (topicModel.extendedCallback != nil) {
                    AWSDDLogVerbose(@"topicModel.extendedcallback.");
                    topicModel.extendedCallback(self, topic, data);
                }
            }
        }
    }
}

#pragma mark AWSSRWebSocketDelegate

- (void)webSocketDidOpen:(AWSSRWebSocket *)webSocket;
{
    AWSDDLogInfo(@"Websocket did open and is Connected.");
    //
    // The WebSocket is connected; at this point we need to create streams
    // for MQTT encode/decode and then instantiate the MQTT client.
    //
    self.encoderWriteStream = nil;
    self.decoderReadStream = nil;
    self.decoderWriteStream = nil;

    self.runLoopShouldContinue = NO;

    if (self.streamsThread != nil)
    {
        //If previous streamsThread is still running when we try to open a new one, wait until it exits.
        AWSDDLogWarn(@"streamsThread is still running. Waiting for it to exit.");
        if( 0 != dispatch_semaphore_wait(self.runloopSemaphore,
                                         dispatch_time(DISPATCH_TIME_NOW, WAIT_TIMEOUT_IN_SEC * NSEC_PER_SEC) ) ){
            //The timeout should never happen in normal case. We add the timeout just to be safe that
            //in abnormal case, the semaphore does not block forever.
            //TODO: revisit the case where user disconnect and abnormal disconnect happen at the same time.
            AWSDDLogWarn(@"runloop semaphore timed out before getting a signal. ");
        }
    }
    //
    // CFStreamCreateBoundPair() requires addresses, so use the ivars for
    // these properties.  128KB is the maximum message size for AWS IoT;
    // the streams should be able to buffer an entire maximum-sized message
    // since the MQTT client isn't capable of dealing with partial reads.
    //
    CFStreamCreateBoundPair( nil, &_decoderReadStream, &_decoderWriteStream, 128*1024 );    // 128KB buffer size

    self.encoderStream     = [AWSIoTWebSocketOutputStreamFactory createAWSIoTWebSocketOutputStreamWithWebSocket:webSocket];

    self.decoderStream = (__bridge_transfer NSInputStream *)_decoderReadStream;
    self.toDecoderStream     = (__bridge_transfer NSOutputStream *)_decoderWriteStream;

    [self.toDecoderStream setDelegate:self];

    self.streamsThread = [[NSThread alloc] initWithTarget:self selector:@selector(openStreams:) object:nil];
    [self.streamsThread start];
}

- (void)openStreams:(id)sender
{
    NSRunLoop *runLoopForStreamsThread = [NSRunLoop currentRunLoop];

    self.runLoopShouldContinue = YES;

    [self.toDecoderStream scheduleInRunLoop:runLoopForStreamsThread forMode:NSDefaultRunLoopMode];
    [self.toDecoderStream open];

    [self.session setRunLoop:runLoopForStreamsThread forMode:NSDefaultRunLoopMode];
    [self.session connectToInputStream:self.decoderStream outputStream:self.encoderStream];

    while (self.runLoopShouldContinue) {
        //This will continue run until runLoopShouldContinue is set to NO during "disconnect" or
        //"websocketDidFail"
        [runLoopForStreamsThread runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    AWSDDLogDebug(@"Signaling runloopSemaphore");
    dispatch_semaphore_signal(self.runloopSemaphore);
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didFailWithError:(NSError *)error;
{
    AWSDDLogError(@":( Websocket Failed With Error %@", error);

    //In case of unexpected websocket failure, we should exit the openStreams thread.
    self.runLoopShouldContinue = NO;

    //
    // When the WebSocket fails, the connection is closed.  The MQTT client
    // can be deleted at this point.
    //
    [self.toDecoderStream close];
    [self.encoderStream   close];

    self.webSocket = nil;
    self.encoderStream = nil;
    self.mqttStatus = AWSIoTMQTTStatusConnectionError;
    //
    // Indicate an error to the connection status callback and start the
    // retry logic.
    //
    [self notifyConnectionStatus];
    if (!self.userDisconnect && self.session) {
        AWSDDLogWarn(@"Unexpected disconnect, need to reconnect. ");
        if (self.reconnectTimer == nil) {
            AWSDDLogDebug(@"setting up reconnect timer. ");
            self.reconnectTimer =[NSTimer scheduledTimerWithTimeInterval:self.currentReconnectTime
                                                                  target:self
                                                                selector:@selector(reconnectToSession)
                                                                userInfo:nil
                                                                 repeats:NO];
            [[NSRunLoop currentRunLoop] run];
        }
    }
    [self.postConnectTimer invalidate];
    [self.emptyQueueTimer invalidate];
    [self.connectionTimer invalidate];
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didReceiveMessage:(id)message;
{
    if ([message isKindOfClass:[NSData class]])
    {
        NSData *messageData = (NSData *)message;

        AWSDDLogVerbose(@"Websocket didReceiveMessage: Received %lu bytes", (unsigned long)messageData.length);
        //
        // When a message is received, send it to the MQTT client's decoder
        // stream.
        //
        [self.toDecoderStream write:[messageData bytes] maxLength:messageData.length];

    }
    else
    {
        AWSDDLogError(@"Invalid class received");
    }
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean;
{
    self.mqttStatus = AWSIoTMQTTStatusDisconnected;
    //
    // Let the application know it has been disconnected.
    //
    [self notifyConnectionStatus];
    self.connectStatusCallback = nil;
    //
    // The WebSocket is closed, and the MQTT client can be deleted at this point.
    // If there is reconnection logic it will re-try in a bit.
    //
    [self.toDecoderStream close];
    [self.encoderStream   close];

    self.webSocket = nil;
    AWSDDLogInfo(@"WebSocket closed with code:%ld with reason:%@", (long)code, reason);
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload;
{
    AWSDDLogVerbose(@"Websocket received pong");
}

@end
