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

#import <Security/Security.h>

#import "AWSSynchronizedMutableDictionary.h"
#import "AWSSignature.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSIOTService.h"
#import "AWSCategory.h"
#import "AWSLogging.h"

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

@end

@implementation AWSIoTMQTTClient

static AWSIoTMQTTClient *_defaultMQTTClient = nil;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultMQTTClient = [AWSIoTMQTTClient new];
    });

    return _defaultMQTTClient;
}

- (instancetype)init {
    if ( self = [super init]) {
        _topicListeners = [NSMutableDictionary dictionary];
        _queueMessages = [NSMutableArray new];
        _clientCerts = nil;
        _session.delegate = nil;
        _session = nil;
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
                         sessionKey,
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

- (NSString *)prepareWebSocketUrl:(AWSServiceConfiguration *)configuration;
{
    NSDate *date          = [NSDate aws_clockSkewFixedDate];
    NSString *now         = [date aws_stringValue:AWSDateISO8601DateFormat2];
    NSString *today       = [date aws_stringValue:AWSDateShortDateFormat1];
    NSString *path        = @"/mqtt";
    NSString *serviceName = @"iotdata";
    NSString *algorithm   = @"AWS4-HMAC-SHA256";
    NSString *accessKey   = configuration.credentialsProvider.accessKey;
    NSString *secretKey   = configuration.credentialsProvider.secretKey;
    NSString *regionName  = configuration.endpoint.regionName;
    NSString *hostName    = configuration.endpoint.hostName;
    NSString *sessionKey  = nil;
    NSString *queryParams = [NSString stringWithFormat:@"X-Amz-Algorithm=%@&X-Amz-Credential=%@%%2F%@%%2F%@%%2F%@%%2Faws4_request&X-Amz-Date=%@&X-Amz-SignedHeaders=host",
                              algorithm,
                              accessKey,
                              today,
                              regionName,
                              serviceName,
                              now];
    
    if ([configuration.credentialsProvider isKindOfClass:[AWSCognitoCredentialsProvider class]])
    {
        sessionKey  = [configuration.credentialsProvider.sessionKey aws_stringWithURLEncoding];
    }

    return [self signWebSocketUrlForMethod:@"GET" scheme:@"wss://" hostName:hostName path:path  queryParams:queryParams accessKey:accessKey secretKey:secretKey regionName:regionName serviceName:serviceName payload:@"" today:today now:now sessionKey:sessionKey];
}

- (BOOL)connectWithClientId:(NSString*)clientId
                     toHost:(NSString*)host
                       port:(UInt32)port
               cleanSession:(BOOL)cleanSession
                certificateId:(NSString*)certificateId
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback {
    SecIdentityRef identityRef = [AWSIoTKeychain getIdentityRef:[NSString stringWithFormat:@"%@%@",[AWSIoTKeychain privateKeyTag], certificateId ]];
    if (identityRef == NULL) {
        AWSLogError(@"Could not find SecIdentityRef");
        return NO;
    };

    self.clientCerts = [[NSArray alloc] initWithObjects:(__bridge id)identityRef, nil];
    self.host = host;
    self.port = port;
    self.cleanSession = cleanSession;
    self.connectStatusCallback = callback;

    if (self.cleanSession) {
        [self.topicListeners removeAllObjects];
        [self.queueMessages removeAllObjects];
    }

    self.session= [[MQTTSession alloc] initWithClientId:clientId userName:@"" password:@"" keepAlive:60 cleanSession:cleanSession];

    self.connectStatusCallback(AWSIoTMQTTStatusConnecting);

    self.session.delegate = self;

    [self.session connectToHost:_host port:_port usingSSL:YES sslCertificated:_clientCerts];

    return YES;
}

- (BOOL)connectWithClientId:(NSString *)clientId
               cleanSession:(BOOL)cleanSession
              configuration:(AWSServiceConfiguration *)configuration
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;
{
    //
    // no client certificate specified, connect via WebSocket
    //
    BOOL rc = NO;
    if ((configuration != nil) && (clientId != nil))
    {
        NSString *urlString = [self prepareWebSocketUrl:configuration ];
    
        if (urlString != nil)
        {
            self.configuration = configuration;
            rc = [self webSocketConnectWithClientId:clientId
                    urlRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]
                               cleanSession:cleanSession
                             statusCallback:callback];
        }
        
    }
    return rc;
}

- (BOOL)webSocketConnectWithClientId:(NSString *)clientId
                 urlRequest:(NSURLRequest *)urlRequest
               cleanSession:(BOOL)cleanSession
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;
{
    self.cleanSession = cleanSession;
    self.connectStatusCallback = callback;
    
    if (self.cleanSession) {
        [self.topicListeners removeAllObjects];
        [self.queueMessages removeAllObjects];
    }
    
    self.session = [[MQTTSession alloc] initWithClientId:clientId userName:@"" password:@"" keepAlive:60 cleanSession:cleanSession];
    
    self.connectStatusCallback(AWSIoTMQTTStatusConnecting);
    
    self.session.delegate = self;
    
    self.webSocket = [[AWSSRWebSocket alloc] initWithURLRequest:urlRequest protocols:[NSArray arrayWithObjects: @"mqttv3.1", nil] allowsUntrustedSSLCertificates:NO];
    self.webSocket.delegate = self;
    [self.webSocket open];
    
    //
    // Now that the WebSocket is created and opened, it will send us messages.
    //
    return YES;
}

- (void)disconnect {
    self.userDisconnect = YES;
    [self.session close];
    self.session.delegate = nil;
    self.session = nil;
}

- (void)reconnectToSession {
    self.needReconnect = self.cleanSession;
    if (self.clientCerts != nil)
    {
        //
        // Connecting with a client certificate/TLS mutual authentication
        //
        [self.session connectToHost:self.host port:self.port usingSSL:YES sslCertificated:self.clientCerts];
    }
    else
    {
        NSString *urlString = [self prepareWebSocketUrl:self.configuration ];
        //
        // Connecting over a WebSocket with SigV4 authentication.  Close and deallocate
        // WebSocket so that we can create another one.
        //
        [self.webSocket close];
        
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
        
        self.webSocket = [[AWSSRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] protocols:[NSArray arrayWithObjects: @"mqttv3.1", nil] allowsUntrustedSSLCertificates:NO];
        self.webSocket.delegate = self;
        [self.webSocket open];
        
        //
        // Now that the WebSocket is created and opened, it will send us messages.
        //
    }
}

- (void)resubscribeToTopics {
    self.needReconnect = NO;

    for (AWSIoTMQTTTopicModel *topic in self.topicListeners.allValues) {
        [self.session subscribeToTopic:topic.topic atLevel:topic.qos];
    }
}


- (void)publishString:(NSString*)str onTopic:(NSString*)topic {
    [self publishData:[str dataUsingEncoding:NSUTF8StringEncoding] onTopic:topic];
}

- (void)publishData:(NSData*)data onTopic:(NSString*)topic {

    AWSLogVerbose(@"isReadyToPublish: %i",[self.session isReadyToPublish]);

    if ([self.session isReadyToPublish]) {
        [self.session publishData:data onTopic:topic];
    } else {
        AWSIoTMQTTQueueMessage *message = [AWSIoTMQTTQueueMessage new];
        message.topic = topic;
        message.message = data;
        [self.queueMessages addObject:message];
    }
}

- (void)subscribeToTopic:(NSString*)topic qos:(UInt8)qos messageCallback:(AWSIoTMQTTNewMessageBlock)callback {
    AWSIoTMQTTTopicModel *topicModel = [AWSIoTMQTTTopicModel new];
    topicModel.topic = topic;
    topicModel.qos = qos;
    topicModel.callback = callback;
    [self.topicListeners setObject:topicModel forKey:topic];
    [self.session subscribeToTopic:topicModel.topic atLevel:topicModel.qos];
}

- (void)unsubscribeTopic:(NSString*)topic {
    [self.session unsubscribeTopic:topic];
    [self.topicListeners removeObjectForKey:topic];
}

- (void)publishMessagesFromQueue {
    AWSLogVerbose(@"publishMessagesFromQueue");
    AWSIoTMQTTQueueMessage *message = [self.queueMessages firstObject];
    if (message && [self.session isReadyToPublish]) {
        AWSLogVerbose(@"publishData on topic %@",message.topic);
        [self.session publishData:message.message onTopic:message.topic];
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

#pragma-mark MQTTSessionDelegate

- (void)session:(MQTTSession*)session handleEvent:(MQTTSessionEvent)eventCode {
    AWSLogVerbose(@"MQTTSessionDelegate handleEvent: %i",eventCode);

    switch (eventCode) {
        case MQTTSessionEventConnected:
            self.connectStatusCallback(AWSIoTMQTTStatusConnected);
            if (self.needReconnect) {
                [self resubscribeToTopics];
            }
            if (self.queueMessages.count) {
                [self publishMessagesFromQueue];
            }
            break;
        case MQTTSessionEventConnectionRefused:
            self.connectStatusCallback(AWSIoTMQTTStatusConnectionRefused);
            break;
        case MQTTSessionEventConnectionClosed:
            if (!self.userDisconnect && self.session) {
                [self reconnectToSession];
            } else {
                self.userDisconnect = NO;
                self.connectStatusCallback(AWSIoTMQTTStatusDisconnected);
                self.connectStatusCallback = nil;
            }
            break;
        case MQTTSessionEventConnectionError:
            self.connectStatusCallback(AWSIoTMQTTStatusConnectionError);
            if (!self.userDisconnect && self.session) {
                [self reconnectToSession];
            }
            break;
        case MQTTSessionEventProtocolError:
            self.connectStatusCallback(AWSIoTMQTTStatusProtocolError);
            break;
        default:
            break;
    }

}

- (void)session:(MQTTSession*)session newMessage:(NSData*)data onTopic:(NSString*)topic {
    AWSLogVerbose(@"MQTTSessionDelegate newMessage: %@\n onTopic: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding], topic);

    NSArray *topicParts = [topic componentsSeparatedByString: @"/"];

    for (NSString *topicKey in self.topicListeners.allKeys) {
        NSArray *topicKeyParts = [topicKey componentsSeparatedByString: @"/"];

        BOOL topicsIsSame = true;
        for (int i = 0; i < topicKeyParts.count; i++) {
            if (i >= topicParts.count) {
                topicsIsSame = false;
                break;
            }

            NSString *topicPart = topicParts[i];
            NSString *topicKeyPart = topicKeyParts[i];

            if ([topicKeyPart rangeOfString:@"#"].location == NSNotFound && [topicKeyPart rangeOfString:@"+"].location == NSNotFound) {
                if (![topicPart isEqualToString:topicKeyPart]) {
                    topicsIsSame = false;
                    break;
                }
            }
        }

        if (topicsIsSame) {
            AWSIoTMQTTTopicModel *topicModel = [self.topicListeners objectForKey:topicKey];
            if (topicModel) {
                topicModel.callback(data);
            }
        }
    }
}

#pragma mark AWSSRWebSocketDelegate

- (void)webSocketDidOpen:(AWSSRWebSocket *)webSocket;
{
    AWSLogVerbose(@"Websocket Connected");

    //
    // The WebSocket is connected; at this point we need to create streams
    // for MQTT encode/decode and then instantiate the MQTT client.
    //
    self.encoderWriteStream = nil;
    self.decoderReadStream = nil;
    self.decoderWriteStream = nil;
    
    //
    // Here we use the '_' prefix rather than a property reference in order to
    // get the address of these for CFStreamCreateBoundPair()
    //
    CFStreamCreateBoundPair( nil, &_decoderReadStream, &_decoderWriteStream, 4096 );

    self.encoderStream     = [AWSIoTWebSocketOutputStreamFactory createAWSIoTWebSocketOutputStreamWithWebSocket:webSocket];

    self.decoderStream = (__bridge_transfer NSInputStream *)_decoderReadStream;
    self.toDecoderStream     = (__bridge_transfer NSOutputStream *)_decoderWriteStream;

   [self.toDecoderStream setDelegate:self];

    dispatch_async( dispatch_get_main_queue(), ^ {
        [self.encoderStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

        [self.decoderStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [self.toDecoderStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

        [self.toDecoderStream open];
        
        [self.session connectToInputStream:self.decoderStream outputStream:self.encoderStream];
    });
    
    //
    // Now we have an MQTT client created and connected to the WebSocket.  From
    // this point forward we handle messages from the WebSocket as well as the
    // MQTT client, acting as a bridge between the two.
    //
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didFailWithError:(NSError *)error;
{
    AWSLogError(@":( Websocket Failed With Error %@", error);
    
    //
    // When the WebSocket fails, the connection is closed.  The MQTT client
    // can be deleted at this point.  If there is reconnection logic it will
    // re-try in a bit.
    //
    [self.toDecoderStream close];
    [self.encoderStream   close];

    self.webSocket = nil;
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didReceiveMessage:(id)message;
{
    if ([message isKindOfClass:[NSData class]])
    {
        NSData *messageData = (NSData *)message;
    
        AWSLogVerbose(@"Received %lu bytes", (unsigned long)messageData.length);

    //
    // When a message is received, send it to the MQTT client's decoder
    // stream.
    //
    
        [self.toDecoderStream write:[messageData bytes] maxLength:messageData.length];
    }
    else
    {
        AWSLogError(@"Invalid class received");
    }
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean;
{
    AWSLogVerbose(@"WebSocket closed");
    
    //
    // The WebSocket is closed, and the MQTT client can be deleted at this point.
    // If there is reconnection logic it will re-try in a bit.
    //
    [self.toDecoderStream close];
    [self.encoderStream   close];
    
    self.webSocket = nil;
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload;
{
    AWSLogVerbose(@"Websocket received pong");
}

@end
