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

#import "AWSIoTMQTTClient.h"
#import "AWSMQTTSession.h"
#import "AWSSRWebSocket.h"
#import "AWSIoTWebSocketOutputStream.h"
#import "AWSIoTKeychain.h"

@implementation AWSIoTMQTTTopicModel
@end

@implementation AWSIoTMQTTQueueMessage
@end

@interface AWSIoTMQTTClient() <AWSSRWebSocketDelegate, NSStreamDelegate, AWSMQTTSessionDelegate>

@property(atomic, assign, readwrite) AWSIoTMQTTStatus mqttStatus;
@property(nonatomic, strong) AWSMQTTSession* session;
@property(nonatomic, strong) NSMutableDictionary * topicListeners;

@property(atomic, assign) BOOL userDidIssueDisconnect; //Flag to indicate if requestor has issued a disconnect
@property(atomic, assign) BOOL userDidIssueConnect; //Flag to indicate if requestor has issued a connect

@property(nonatomic, strong) NSString *host;
@property(nonatomic, strong) NSString *presignedURL;
@property(nonatomic, assign) UInt32 port;
@property(nonatomic, assign) BOOL cleanSession; // Flag to clear prior session state upon connect

@property(nonatomic, strong) NSArray *clientCerts;
@property(nonatomic, strong) AWSSRWebSocket *webSocket;
@property(nonatomic, strong) AWSServiceConfiguration *configuration; //Service Configuration to fetch AWS Credentials for direct webSocket connection
    
@property(nonatomic, strong) NSString *customAuthorizerName; // Name of the AWS IoT Custom Authorizer
@property(nonatomic, strong) NSString *tokenKeyName; // Key name that identifies the token
@property(nonatomic, strong) NSString *tokenValue; // Value of the token
@property(nonatomic, strong) NSString *tokenSignature; // Signature of the token

@property(atomic, assign) NSTimeInterval currentReconnectTime; // current recconect time, based on exponential backoff
@property NSInteger connectionAgeInSeconds; //Age of current connection

@property(nonatomic, strong)NSTimer *reconnectTimer; //Timer for reconnect logic
@property(nonatomic, strong)NSTimer *connectionAgeTimer; //Timer to reset currentReconnectTime based on connection life

@property UInt16 keepAliveInterval;

@property(nonatomic, strong) NSMutableDictionary<NSNumber *, AWSIoTMQTTAckBlock> *ackCallbackDictionary;

@property NSString *lastWillAndTestamentTopic;
@property NSData *lastWillAndTestamentMessage;
@property UInt8 lastWillAndTestamentQoS;
@property BOOL lastWillAndTestamentRetainFlag;

//
// Two bound pairs of streams are used to connect the MQTT
// client to the WebSocket: one for the encoder, and one for
// the decoder.
//
@property(nonatomic, assign) CFWriteStreamRef encoderWriteStream;
@property(nonatomic, assign) CFReadStreamRef  decoderReadStream;
@property(nonatomic, assign) CFWriteStreamRef decoderWriteStream;
@property(nonatomic, strong) NSOutputStream *encoderStream;      // MQTT encoder writes to this one
@property(nonatomic, strong) NSInputStream  *decoderStream;      // MQTT decoder reads from this one
@property(nonatomic, strong) NSOutputStream *toDecoderStream;    // We write to this one

@property (nonatomic, copy) void (^connectStatusCallback)(AWSIoTMQTTStatus status);

@property (nonatomic, strong) NSThread *streamsThread;
@property (nonatomic, strong) NSThread *reconnectThread;

@property (atomic, assign) BOOL runLoopShouldContinue;

@property (strong,atomic) dispatch_semaphore_t timerSemaphore;

@end

@implementation AWSIoTMQTTClient


#pragma mark Intialitalizers
- (instancetype)init {
    if (self = [super init]) {
        _topicListeners = [NSMutableDictionary dictionary];
        _clientCerts = nil;
        _session.delegate = nil;
        _session = nil;
        _clientId = nil;
        _associatedObject = nil;
        _currentReconnectTime = 1;
        _baseReconnectTime = 1;
        _minimumConnectionTime = 20;
        _maximumReconnectTime = 128;
        _autoResubscribe = YES;
        _connectionAgeInSeconds = 0;
        _isMetricsEnabled = YES;
        _ackCallbackDictionary = [NSMutableDictionary new];
        _webSocket = nil;
        _userDidIssueConnect = NO;
        _userDidIssueDisconnect = NO;
        _timerSemaphore = dispatch_semaphore_create(1);
        _streamsThread = nil;
    }
    return self;
}

- (instancetype)initWithDelegate:(id<AWSIoTMQTTClientDelegate>)delegate {
    self = [self init];
    if (self) {
        self.clientDelegate = delegate;
    }
    return self;
}

#pragma mark signer methods
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

    return [self signWebSocketUrlForMethod:@"GET"
                                    scheme:@"wss://"
                                  hostName:hostName
                                      path:path
                               queryParams:queryParams
                                 accessKey:accessKey
                                 secretKey:secretKey
                                regionName:regionName
                               serviceName:serviceName
                                   payload:@""
                                     today:today
                                       now:now
                                sessionKey:sessionKey];
}

#pragma mark connect lifecycle methods

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
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback {
    
    if (self.userDidIssueConnect ) {
        //Issuing connect multiple times. Not allowed.
        return NO;
    }
    //Intialize connection state
    self.userDidIssueDisconnect = NO;
    self.userDidIssueConnect = YES;
    self.session = nil;
    
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
    self.keepAliveInterval = theKeepAliveInterval;
    self.lastWillAndTestamentTopic = willTopic;
    self.lastWillAndTestamentMessage = willMsg;
    self.lastWillAndTestamentQoS = willQoS;
    self.lastWillAndTestamentRetainFlag = willRetainFlag;
    
    return [self connectWithCert];
}

- (BOOL) connectWithCert {
    self.mqttStatus = AWSIoTMQTTStatusConnecting;
    
    if (self.cleanSession) {
        [self.topicListeners removeAllObjects];
    }
    
    //Setup userName if metrics are enabled. We use the connection username as metadata for metrics calculation.
    if (self.isMetricsEnabled) {
        AWSDDLogInfo(@"user metadata is : %@", self.userMetaData);
    }
    AWSDDLogInfo(@"Metrics collection is: %@", self.isMetricsEnabled ? @"Enabled" : @"Disabled");
    
    //Create Session
    if (self.session == nil ) {
        self.session= [[AWSMQTTSession alloc] initWithClientId:self.clientId
                                               userName:self.userMetaData
                                               password:@""
                                              keepAlive:self.keepAliveInterval
                                           cleanSession:self.cleanSession
                                              willTopic:self.lastWillAndTestamentTopic
                                                willMsg:self.lastWillAndTestamentMessage
                                                willQoS:self.lastWillAndTestamentQoS
                                         willRetainFlag:self.lastWillAndTestamentRetainFlag
                                         publishRetryThrottle:self.publishRetryThrottle];
        self.session.delegate = self;
    }
    
    //Notify connection status
    [self notifyConnectionStatus];
    
    //Create CFStream variable to hold the streams connected to the ip
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    //Creates readable and writable streams connected to ip and port. The socket will not be created or a
    //connection established with the server until one of the streams is opened.
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)_host, _port, &readStream, &writeStream);

    self.decoderStream = (__bridge_transfer NSInputStream *) readStream;
    self.encoderStream = (__bridge_transfer NSOutputStream *) writeStream;
    
    CFDictionaryRef sslSettings;
    if (_clientCerts.count) {
        const void *keys[] = { kCFStreamSSLLevel,
            kCFStreamSSLCertificates };
        
        const void *vals[] = { kCFStreamSocketSecurityLevelNegotiatedSSL,
            (__bridge const void *)(_clientCerts) };
        
        sslSettings = CFDictionaryCreate(kCFAllocatorDefault, keys, vals, 2,
                                         &kCFTypeDictionaryKeyCallBacks,
                                         &kCFTypeDictionaryValueCallBacks);
        
    } else {
        const void *keys[] = { kCFStreamSSLLevel,
            kCFStreamSSLPeerName };
        
        const void *vals[] = { kCFStreamSocketSecurityLevelNegotiatedSSL,
            kCFNull };
        
        sslSettings = CFDictionaryCreate(kCFAllocatorDefault, keys, vals, 2,
                                         &kCFTypeDictionaryKeyCallBacks,
                                         &kCFTypeDictionaryValueCallBacks);
    }
    CFReadStreamSetProperty(readStream, kCFStreamPropertySSLSettings, sslSettings);
    CFWriteStreamSetProperty(writeStream, kCFStreamPropertySSLSettings, sslSettings);
    CFRelease(sslSettings);
    
    //The "x-amzn-mqtt-ca" protocol is only supported on port 443.
    if (self.port == 443) {
        //SSLSetALPNProtocols is only available from iOS 11 onwards.
        if (@available(iOS 11.0, *)) {
            //Get the SSL Context
            SSLContextRef context = (__bridge SSLContextRef) [_decoderStream propertyForKey: (__bridge NSString *) kCFStreamPropertySSLContext ];

            //Set ALPN protocol list
            CFStringRef strs[1];
            strs[0] = CFSTR("x-amzn-mqtt-ca");
            CFArrayRef protocols = CFArrayCreate(NULL, (void *)strs, 1, &kCFTypeArrayCallBacks);

            SSLSetALPNProtocols(context, protocols);
            CFRelease(protocols);
        }
    }

    //Create Thread and start with "openStreams" being the entry point.
    if (self.streamsThread) {
        AWSDDLogVerbose(@"Issued Cancel on thread [%@]", self.streamsThread);
        [self.streamsThread cancel];
    }
    self.streamsThread = [[NSThread alloc] initWithTarget:self selector:@selector(openStreams:) object:self];
    [self.streamsThread start];
    return YES;
}

- (BOOL) connectWithClientId:(NSString *)clientId
               cleanSession:(BOOL)cleanSession
              configuration:(AWSServiceConfiguration *)configuration
                  keepAlive:(UInt16)theKeepAliveInterval
                  willTopic:(NSString*)willTopic
                    willMsg:(NSData*)willMsg
                    willQoS:(UInt8)willQoS
             willRetainFlag:(BOOL)willRetainFlag
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;
{
    if (self.userDidIssueConnect ) {
        //Issuing connect multiple times. Not allowed.
        return NO;
    }
    
    //Intialize connection state
    self.userDidIssueDisconnect = NO;
    self.userDidIssueConnect = YES;
    self.session = nil;
    self.cleanSession = cleanSession;
    self.configuration = configuration;
    self.clientId = clientId;
    self.lastWillAndTestamentTopic = willTopic;
    self.lastWillAndTestamentMessage = willMsg;
    self.lastWillAndTestamentQoS = willQoS;
    self.lastWillAndTestamentRetainFlag = willRetainFlag;
    self.keepAliveInterval = theKeepAliveInterval;
    self.connectStatusCallback = callback;
    
    return [ self webSocketConnectWithClientId];
}

- (BOOL)connectWithClientId:(NSString *)clientId
               presignedURL:(NSString *)presignedURL
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback {
    if (clientId != nil && presignedURL != nil) {
        // currently using the last given URL on subscribe call
        self.presignedURL = presignedURL;
        //Intialize connection state
        self.userDidIssueDisconnect = NO;
        self.userDidIssueConnect = YES;
        AWSDDLogDebug(@"%s [Line %d], Thread:%@ ", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
        return [self connectWithClientId:clientId
                            cleanSession:YES
                           configuration:nil
                               keepAlive:300
                               willTopic:nil
                                 willMsg:nil
                                 willQoS:1
                          willRetainFlag:NO
                          statusCallback:callback];
    } else {
        // Invalidate input parameters, return unsuccessfully.
        return NO;
    }
}
    
- (BOOL)connectWithClientId:(NSString *)clientId
               cleanSession:(BOOL)cleanSession
              configuration:(AWSServiceConfiguration *)configuration
       customAuthorizerName:(NSString *)customAuthorizerName
               tokenKeyName:(NSString *)tokenKeyName
                 tokenValue:(NSString *)tokenValue
             tokenSignature:(NSString *)tokenSignature
                  keepAlive:(UInt16)theKeepAliveInterval
                  willTopic:(NSString*)willTopic
                    willMsg:(NSData*)willMsg
                    willQoS:(UInt8)willQoS
             willRetainFlag:(BOOL)willRetainFlag
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback {
    if (self.userDidIssueConnect ) {
        // Issuing connect multiple times. Not allowed.
        return NO;
    }
    
    // Intialize connection state
    self.userDidIssueDisconnect = NO;
    self.userDidIssueConnect = YES;
    self.session = nil;
    self.cleanSession = cleanSession;
    self.configuration = configuration;
    self.clientId = clientId;
    self.lastWillAndTestamentTopic = willTopic;
    self.lastWillAndTestamentMessage = willMsg;
    self.lastWillAndTestamentQoS = willQoS;
    self.lastWillAndTestamentRetainFlag = willRetainFlag;
    self.keepAliveInterval = theKeepAliveInterval;
    self.connectStatusCallback = callback;
    
    // Initialize Custom Auth state
    self.customAuthorizerName = customAuthorizerName;
    self.tokenKeyName = tokenKeyName;
    self.tokenValue = tokenValue;
    self.tokenSignature = tokenSignature;
    
    return [self webSocketConnectWithClientId];
}

- (BOOL) webSocketConnectWithClientId {
    AWSDDLogInfo(@"AWSIoTMQTTClient: connecting via websocket. ");
    
    if (self.webSocket) {
        [self.webSocket close];
        self.webSocket = nil;
    }
    
    if ( ! ( self.clientId != nil && (self.presignedURL != nil ||
                                      self.configuration != nil ||
                                      self.customAuthorizerName != nil))) {
        // client ID and one of serviceConfiguration, presignedURL, customAuth are mandatory and
        // if they haven't been provided, we return with NO to indicate failure.
        return NO;
    }
    
    if (self.presignedURL) {
        AWSDDLogInfo(@"Using PresignedURL.");
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            [self initWebSocketConnectionForURL:self.presignedURL];
        });
        
    } else if (self.customAuthorizerName != nil) {
        NSString *urlString = [NSString stringWithFormat:@"wss://%@/mqtt", self.configuration.endpoint.hostName];
        AWSDDLogInfo(@"Using Custom Auth URL: %@.", urlString);
        
        [self initWebSocketConnectionForURL:urlString];
    } else {
        AWSDDLogInfo(@"Using AWSCredentials.");
        //Get Credentials from credentials provider.
        [[self.configuration.credentialsProvider credentials] continueWithBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
            
            //If an error occured when trying to get credentials, setup a timer to retry the connection after self.currentReconnectTime seconds and schedule it on the reconnect Thread.
            if (task.error) {
                @synchronized(self) {
                    self.reconnectThread = [[NSThread alloc] initWithTarget:self selector:@selector(initiateReconnectTimer:) object:self];
                    [self.reconnectThread start];
                }
                
                AWSDDLogError(@"Unable to connect to MQTT due to an error fetching credentials from the Credentials Provider. Will try again in %f seconds", self.currentReconnectTime);
                return nil;
            }
            
            //No error. We have credentials.
            AWSCredentials *credentials = task.result;
            
            //Prepare WebSocketURL
            NSString *urlString = [self prepareWebSocketUrlWithHostName:self.configuration.endpoint.hostName
                                                             regionName:self.configuration.endpoint.regionName
                                                              accessKey:credentials.accessKey
                                                              secretKey:credentials.secretKey
                                                             sessionKey:credentials.sessionKey];
            
            [self initWebSocketConnectionForURL:urlString];
            
            return nil;
        }];
    }
    return YES;
}

- (void)initWebSocketConnectionForURL:(NSString *)urlString {
    // Set status to "Connecting"
    self.mqttStatus = AWSIoTMQTTStatusConnecting;
    
    //clear session if required
    if (self.cleanSession) {
        [self.topicListeners removeAllObjects];
    }
    
    //Setup userName if metrics are enabled. We use the connection username as metadata for metrics calculation.
    if (self.isMetricsEnabled) {
        AWSDDLogInfo(@"user metadata is : %@", self.userMetaData);
    }
    AWSDDLogInfo(@"Metrics collection is: %@", self.isMetricsEnabled ? @"Enabled" : @"Disabled");
    
    //create Session if one doesn't already exist
    if (self.session == nil ) {
        self.session = [[AWSMQTTSession alloc] initWithClientId:self.clientId
                                                       userName:self.userMetaData
                                                       password:@""
                                                      keepAlive:self.keepAliveInterval
                                                   cleanSession:self.cleanSession
                                                      willTopic:self.lastWillAndTestamentTopic
                                                        willMsg:self.lastWillAndTestamentMessage
                                                        willQoS:self.lastWillAndTestamentQoS
                                                 willRetainFlag:self.lastWillAndTestamentRetainFlag
                                           publishRetryThrottle:self.publishRetryThrottle];
        self.session.delegate = self;
    }
    
    //Notify connection status.
    [self notifyConnectionStatus];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    // Add the HTTP headers for custom authorizer name, token value and signature
    if (self.customAuthorizerName != nil) {
        // Add IoT custom authorizer headers to the request
        // x-amz-customauthorizer-name: <authorizer-name>
        [urlRequest addValue:self.customAuthorizerName
          forHTTPHeaderField:@"x-amz-customauthorizer-name"];
        
        // <token-key-name>: <some-token>
        [urlRequest addValue:self.tokenValue
          forHTTPHeaderField:self.tokenKeyName];
        
        // x-amz-customauthorizer-signature: <token-signature>
        [urlRequest addValue:self.tokenSignature
          forHTTPHeaderField:@"x-amz-customauthorizer-signature"];
    }
    
    //Create the webSocket and setup the MQTTClient object as the delegate
    self.webSocket = [[AWSSRWebSocket alloc] initWithURLRequest:urlRequest
                                                      protocols:@[@"mqttv3.1"]
                                 allowsUntrustedSSLCertificates:NO];
    self.webSocket.delegate = self;
    
    //Open the web socket
    [self.webSocket open];
    
    // Now that the WebSocket is created and opened, it will send its delegate, i.e., this MQTTclient object the messages.
    AWSDDLogVerbose(@"Websocket is created and opened.");
}

- (void)disconnect {

    if (self.userDidIssueDisconnect ) {
        //Issuing disconnect multiple times. Turn this function into a noop by returning here.
        return;
    }
    
    //Invalidate the reconnect timer so that there are no reconnect attempts.
    [self cleanupReconnectTimer];
    
    //Set the userDisconnect flag to true to indicate that the user has initiated the disconnect.
    self.userDidIssueDisconnect = YES;
    self.userDidIssueConnect = NO;
    
    //call disconnect on the session.
    [self.session disconnect];
    _connectionAgeInSeconds = 0;
    
    //Set the flag to signal to the runloop that it can terminate
    self.runLoopShouldContinue = NO;

    AWSDDLogInfo(@"AWSIoTMQTTClient: Disconnect message issued.");
}

/**
 Invalidates and removes reference to the reconnect timer on the correct thread to avoid
 creating a memory leak.

 @discussion If called on any thread other than the reconnect thread the work is queued up on
 the reconnect thread but the method returns without waiting for the invalidation to be completed.
 This is called initially on the thread the consumer is calling the client's disconnect method on.
 */
- (void)cleanupReconnectTimer {
    if (self.reconnectTimer == nil) {
        return;
    }

    if (self.reconnectThread) {
        if ( ![[NSThread currentThread] isEqual:self.reconnectThread]) {
            // Move to reconnect thread to cleanup
            [self performSelector:@selector(cleanupReconnectTimer)
                         onThread:self.reconnectThread
                       withObject:nil
                    waitUntilDone:NO];
            return;
        }
        
        [self.reconnectTimer invalidate];
        self.reconnectTimer = nil;
    }
}

- (void)reconnectToSession {
    
    self.reconnectTimer = nil;

    //Check if the user has issued a disconnect. If so, don't retry.
    if (self.userDidIssueDisconnect  )  {
        return;
    }
    
    //Check if already connected. If so, don't retry
    if (self.mqttStatus == AWSIoTMQTTStatusConnected) {
        return;
    }

    AWSDDLogInfo(@"Attempting to reconnect.");
    
    // Double the reconnect time which will be used on the next reconnection if this one fails to connect.
    // Note that there is a maximum reconnection time beyond which
    // it can no longer increase, and that the base (default) reconnection time will
    // be restored once the connection remains up for the minimum connection time.
    self.currentReconnectTime *= 2;
    if (self.currentReconnectTime > self.maximumReconnectTime) {
        self.currentReconnectTime = self.maximumReconnectTime;
    }
    
    // As this is a reconnect, do not clear session.
    self.cleanSession = NO;
    
    if (self.clientCerts != nil)
    {
        [self connectWithCert];
    }
    else
    {
        [self webSocketConnectWithClientId];
    }
}

- (void)notifyConnectionStatus {
    //Set the connection status on the callback.
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        if (self.connectStatusCallback != nil) {
            self.connectStatusCallback(self.mqttStatus);
        }
        
        if (self.clientDelegate != nil) {
            [self.clientDelegate connectionStatusChanged:self.mqttStatus client:self];
        }
    });
}

- (void)initiateReconnectTimer: (id) sender
{
    if (_userDidIssueDisconnect ) {
        return;
    }
    
    //Make sure that only one thread can setup the timer at one time.
    //Set the timeout to 1800 seconds, which is 1.5x of the max keep-alive 1200 seconds.
    //The unit of measure for the dispatch_time function is nano seconds.

    dispatch_semaphore_wait(_timerSemaphore, dispatch_time(DISPATCH_TIME_NOW, 1800 * NSEC_PER_SEC));
    if (! self.reconnectTimer && self.mqttStatus != AWSIoTMQTTStatusConnected ) {
        self.reconnectTimer = [NSTimer timerWithTimeInterval:self.currentReconnectTime
                                                      target:self
                                                    selector: @selector(reconnectToSession)
                                                    userInfo:nil
                                                     repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:self.reconnectTimer forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    dispatch_semaphore_signal(_timerSemaphore);
}

- (void)openStreams:(id)sender
{
    //This is invoked in a new thread by the webSocketDidOpen method or by the Connect method. Get the runLoop from the thread.
    NSRunLoop *runLoopForStreamsThread = [NSRunLoop currentRunLoop];
    
    //Setup a default timer to ensure that the RunLoop always has atleast one timer on it. This is to prevent the while loop
    //below to spin in tight loop when all input sources and session timers are shutdown during a reconnect sequence.
    NSTimer *defaultRunLoopTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:60.0]
                                                            interval:60.0
                                                              target:self
                                                            selector:@selector(timerHandler:)
                                                            userInfo:nil
                                                             repeats:YES];
    [runLoopForStreamsThread addTimer:defaultRunLoopTimer forMode:NSDefaultRunLoopMode];
    
    self.runLoopShouldContinue = YES;
    [self.toDecoderStream scheduleInRunLoop:runLoopForStreamsThread forMode:NSDefaultRunLoopMode];
    [self.toDecoderStream open];
    
    //Update the runLoop and runLoopMode in session.
    [self.session connectToInputStream:self.decoderStream outputStream:self.encoderStream];
    
    while (self.runLoopShouldContinue && NSThread.currentThread.isCancelled == NO) {
        //This will continue run until runLoopShouldContinue is set to NO during "disconnect" or
        //"websocketDidFail"
        
        //Run one cycle of the runloop. This will return after a input source event or timer event is processed
        [runLoopForStreamsThread runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    }
    
    // clean up the defaultRunLoopTimer.
    [defaultRunLoopTimer invalidate];
    
    if (!self.runLoopShouldContinue ) {
        if (self.connectionAgeTimer != nil) {
            [self.connectionAgeTimer invalidate];
            self.connectionAgeTimer = nil;
        }
        [self.session close];
        
        if ( self.webSocket) {
            [self.toDecoderStream close];
            [self.webSocket close];
            self.webSocket = nil;
        }

        //Set status
        self.mqttStatus = AWSIoTMQTTStatusDisconnected;
        
        // Let the client know it has been disconnected.
        [self notifyConnectionStatus];
    }
}

- (void)timerHandler:(NSTimer*)theTimer {
    AWSDDLogVerbose(@"ThreadID: [%@] Default run loop timer executed: RunLoopShouldContinue is [%d] and Cancelled is [%d]", [NSThread currentThread], self.runLoopShouldContinue, [[NSThread currentThread] isCancelled]);
}

#pragma mark publish methods

- (void)publishString:(NSString*)str
              onTopic:(NSString*)topic
          ackCallback:(AWSIoTMQTTAckBlock)ackCallBack {
    [self publishData:[str dataUsingEncoding:NSUTF8StringEncoding] onTopic:topic];
    
}

- (void)publishString:(NSString*)str onTopic:(NSString*)topic {
    [self publishData:[str dataUsingEncoding:NSUTF8StringEncoding] onTopic:topic];
}

- (void)publishString:(NSString*)str
                  qos:(UInt8)qos
              onTopic:(NSString*)topic
          ackCallback:(AWSIoTMQTTAckBlock)ackCallback {
    if (qos == 0 && ackCallback != nil) {
        [NSException raise:NSInvalidArgumentException
                    format:@"Cannot specify `ackCallback` block for QoS = 0."];
    }
    [self publishData:[str dataUsingEncoding:NSUTF8StringEncoding]
                  qos:qos
              onTopic:topic
          ackCallback:ackCallback];
}

- (void)publishString:(NSString*)str qos:(UInt8)qos onTopic:(NSString*)topic {
    [self publishData:[str dataUsingEncoding:NSUTF8StringEncoding] qos:qos onTopic:topic];
}

- (void)publishData:(NSData*)data
            onTopic:(NSString*)topic {
    [self.session publishData:data onTopic:topic];
}

- (void)publishData:(NSData *)data
                qos:(UInt8)qos
            onTopic:(NSString *)topic {
    [self publishData:data
                  qos:qos
              onTopic:topic
          ackCallback:nil];
}

- (void)publishData:(NSData*)data
                qos:(UInt8)qos
            onTopic:(NSString*)topic
        ackCallback:(AWSIoTMQTTAckBlock)ackCallback {
    
    if (!_userDidIssueConnect) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"Cannot call publish before connecting to the server"];
    }
    
    if (_userDidIssueDisconnect) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"Cannot call publish after disconnecting from the server"];
    }
    
    if (qos > 1) {
        AWSDDLogError(@"invalid qos value: %u", qos);
        return;
    }
    if (qos == 0 && ackCallback != nil) {
        [NSException raise:NSInvalidArgumentException
                    format:@"Cannot specify `ackCallback` block for QoS = 0."];
    }

    AWSDDLogVerbose(@"isReadyToPublish: %i",[self.session isReadyToPublish]);
    if (qos == 0) {
        [self.session publishData:data onTopic:topic];
    }
    else {
        UInt16 messageId = [self.session publishDataAtLeastOnce:data onTopic:topic];
        if (ackCallback) {
            [self.ackCallbackDictionary setObject:ackCallback
                                           forKey:[NSNumber numberWithInt:messageId]];
        }
    }
}

#pragma mark subscribe methods

- (void)subscribeToTopic:(NSString*)topic qos:(UInt8)qos messageCallback:(AWSIoTMQTTNewMessageBlock)callback {
    [self subscribeToTopic:topic
                       qos:qos
           messageCallback:callback
               ackCallback:nil];
    
}

- (void)subscribeToTopic:(NSString*)topic qos:(UInt8)qos
         messageCallback:(AWSIoTMQTTNewMessageBlock)callback
             ackCallback:(AWSIoTMQTTAckBlock)ackCallBack {
    if (!_userDidIssueConnect) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"Cannot call subscribe before connecting to the server"];
    }
    
    if (_userDidIssueDisconnect) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"Cannot call subscribe after disconnecting from the server"];
    }
    AWSDDLogInfo(@"Subscribing to topic %@ with messageCallback", topic);
    AWSIoTMQTTTopicModel *topicModel = [AWSIoTMQTTTopicModel new];
    topicModel.topic = topic;
    topicModel.qos = qos;
    topicModel.callback = callback;
    [self.topicListeners setObject:topicModel forKey:topic];
    
    UInt16 messageId = [self.session subscribeToTopic:topicModel.topic atLevel:topicModel.qos];
    AWSDDLogVerbose(@"Now subscribing w/ messageId: %d", messageId);
    if (ackCallBack) {
        [self.ackCallbackDictionary setObject:ackCallBack
                                           forKey:[NSNumber numberWithInt:messageId]];
    }
}

- (void)subscribeToTopic:(NSString*)topic
                     qos:(UInt8)qos
        extendedCallback:(AWSIoTMQTTExtendedNewMessageBlock)callback {
    [self subscribeToTopic:topic
                       qos:qos
          extendedCallback:callback
               ackCallback:nil];
}

- (void)subscribeToTopic:(NSString*)topic
                     qos:(UInt8)qos
        extendedCallback:(AWSIoTMQTTExtendedNewMessageBlock)callback
             ackCallback:(AWSIoTMQTTAckBlock)ackCallback{
    if (!_userDidIssueConnect) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"Cannot call subscribe before connecting to the server"];
    }
    
    if (_userDidIssueDisconnect) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"Cannot call subscribe after disconnecting from the server"];
    }
    
    AWSDDLogInfo(@"Subscribing to topic %@ with ExtendedmessageCallback", topic);
    AWSIoTMQTTTopicModel *topicModel = [AWSIoTMQTTTopicModel new];
    topicModel.topic = topic;
    topicModel.qos = qos;
    topicModel.callback = nil;
    topicModel.extendedCallback = callback;
    [self.topicListeners setObject:topicModel forKey:topic];
    UInt16 messageId = [self.session subscribeToTopic:topicModel.topic atLevel:topicModel.qos];
    AWSDDLogVerbose(@"Now subscribing w/ messageId: %d", messageId);
    if (ackCallback) {
        [self.ackCallbackDictionary setObject:ackCallback
                                           forKey:[NSNumber numberWithInt:messageId]];
    }
}

- (void)unsubscribeTopic:(NSString*)topic
             ackCallback:(AWSIoTMQTTAckBlock)ackCallback {
    if (!_userDidIssueConnect) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"Cannot call unsubscribe before connecting to the server"];
    }
    
    if (_userDidIssueDisconnect) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"Cannot call unsubscribe after disconnecting from the server"];
    }
    AWSDDLogInfo(@"Unsubscribing from topic %@", topic);
    UInt16 messageId = [self.session unsubscribeTopic:topic];
    [self.topicListeners removeObjectForKey:topic];
    if (ackCallback) {
        [self.ackCallbackDictionary setObject:ackCallback
                                       forKey:[NSNumber numberWithInt:messageId]];
    }
}

- (void)unsubscribeTopic:(NSString*)topic {
    [self unsubscribeTopic:topic ackCallback:nil];
}

#pragma-mark MQTTSessionDelegate

- (void)connectionAgeTimerHandler:(NSTimer*)theTimer {
    self.connectionAgeInSeconds++;
    AWSDDLogVerbose(@"Connection Age: %ld", (long)self.connectionAgeInSeconds);
    if (self.connectionAgeInSeconds >= self.minimumConnectionTime) {
        AWSDDLogVerbose(@"Connection Age threshold reached. Resetting reconnect time to [%fs]", self.baseReconnectTime);
        self.currentReconnectTime = self.baseReconnectTime;
        [theTimer invalidate];
    }
}

- (void)session:(AWSMQTTSession*)session handleEvent:(AWSMQTTSessionEvent)eventCode {
    AWSDDLogVerbose(@"MQTTSessionDelegate handleEvent: %i",eventCode);

    switch (eventCode) {
        case AWSMQTTSessionEventConnected:
            AWSDDLogInfo(@"MQTT session connected.");
            self.mqttStatus = AWSIoTMQTTStatusConnected;
            [self notifyConnectionStatus];
          
            if (self.connectionAgeTimer != nil) {
                [self.connectionAgeTimer invalidate];
            }
            self.connectionAgeTimer = [ NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(connectionAgeTimerHandler:) userInfo:nil repeats:YES];

            //Subscribe to prior topics
            if (_autoResubscribe) {
                AWSDDLogInfo(@"Auto-resubscribe is enabled. Resubscribing to topics.");
                for (AWSIoTMQTTTopicModel *topic in self.topicListeners.allValues) {
                    [self.session subscribeToTopic:topic.topic atLevel:topic.qos];
                }
            }
            break;
            
        case AWSMQTTSessionEventConnectionRefused:
            AWSDDLogWarn(@"MQTT session refused.");
            self.mqttStatus = AWSIoTMQTTStatusConnectionRefused;
            [self notifyConnectionStatus];
            break;
        case AWSMQTTSessionEventConnectionClosed:
            AWSDDLogInfo(@"MQTTSessionEventConnectionClosed: MQTT session closed.");
            
            self.connectionAgeInSeconds = 0;
            if (self.connectionAgeTimer != nil ) {
                [self.connectionAgeTimer invalidate];
                self.connectionAgeTimer = nil;
            }
                
            //Check if user issued a disconnect
            if (self.userDidIssueDisconnect ) {
                //Clear all session state here.
                [self.topicListeners removeAllObjects];
                self.mqttStatus = AWSIoTMQTTStatusDisconnected;
                [self notifyConnectionStatus];
            }
            else {
                //Connection was closed unexpectedly.

                //Notify
                self.mqttStatus = AWSIoTMQTTStatusConnectionError;
                [self notifyConnectionStatus];

                //Retry
                @synchronized(self) {
                    self.reconnectThread = [[NSThread alloc] initWithTarget:self selector:@selector(initiateReconnectTimer:) object:self];
                    [self.reconnectThread start];
                }
            }
            break;
        case AWSMQTTSessionEventConnectionError:
            AWSDDLogError(@"MQTTSessionEventConnectionError: Received an MQTT session connection error");
            
            self.connectionAgeInSeconds = 0;
            if (self.connectionAgeTimer != nil ) {
                [self.connectionAgeTimer invalidate];
                self.connectionAgeTimer = nil;
            }
            if (self.userDidIssueDisconnect ) {
                //Clear all session state here.
                [self.topicListeners removeAllObjects];
                self.mqttStatus = AWSIoTMQTTStatusDisconnected;
                [self notifyConnectionStatus];
            }
            else {
                //Connection errored out unexpectedly.

                //Notify
                self.mqttStatus = AWSIoTMQTTStatusConnectionError;
                [self notifyConnectionStatus];

                //Retry
                @synchronized(self) {
                    self.reconnectThread = [[NSThread alloc] initWithTarget:self selector:@selector(initiateReconnectTimer:) object:self];
                    [self.reconnectThread start];
                }
            }
            break;
        case AWSMQTTSessionEventProtocolError:
            AWSDDLogError(@"MQTT session protocol error");
            self.mqttStatus = AWSIoTMQTTStatusProtocolError;
            [self notifyConnectionStatus];
            AWSDDLogError(@"Disconnecting.");
            [self disconnect];
            break;
        default:
            break;
    }

}

#pragma mark subscription distributor
- (void)session:(AWSMQTTSession*)session newMessage:(NSData*)data onTopic:(NSString*)topic {
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
            AWSDDLogVerbose(@"<<%@>>Topic: %@ is matched.",[NSThread currentThread], topic);
            AWSIoTMQTTTopicModel *topicModel = [self.topicListeners objectForKey:topicKey];
            if (topicModel) {
                if (topicModel.callback != nil) {
                    AWSDDLogVerbose(@"<<%@>>topicModel.callback.", [NSThread currentThread]);
                    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                        topicModel.callback(data);
                    });
                }
                if (topicModel.extendedCallback != nil) {
                    AWSDDLogVerbose(@"<<%@>>topicModel.extendedcallback.", [NSThread currentThread]);
                    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                        topicModel.extendedCallback(self, topic, data);
                    });
                }
                
                if (self.clientDelegate != nil ) {
                    AWSDDLogVerbose(@"<<%@>>Calling receviedMessageData on client Delegate.", [NSThread currentThread]);
                    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                        [self.clientDelegate receivedMessageData:data onTopic:topic];
                    });
                }
                
            }
        }
    }
}

#pragma mark callback handler
- (void)session:(AWSMQTTSession*)session
newAckForMessageId:(UInt16)msgId {
    AWSDDLogVerbose(@"MQTTSessionDelegate new ack for msgId: %d", msgId);
    AWSIoTMQTTAckBlock callback = [[self ackCallbackDictionary] objectForKey:[NSNumber numberWithInt:msgId]];
    
    if(callback) {
        // Give callback to the client on a background thread
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            callback();
        });
        [[self ackCallbackDictionary] removeObjectForKey:[NSNumber numberWithInt:msgId]];
    }
}

#pragma mark AWSSRWebSocketDelegate

- (void)webSocketDidOpen:(AWSSRWebSocket *)webSocket;
{
    AWSDDLogInfo(@"Websocket did open and is connected.");
    
    // The WebSocket is connected; at this point we need to create streams
    // for MQTT encode/decode and then instantiate the MQTT client.
    self.encoderWriteStream = nil;
    self.decoderReadStream = nil;
    self.decoderWriteStream = nil;
    
    // CFStreamCreateBoundPair() requires addresses, so use the ivars for
    // these properties.  128KB is the maximum message size for AWS IoT (see https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html).
    // The streams should be able to buffer an entire maximum-sized message
    // since the MQTT client isn't capable of dealing with partial reads.
    
    //Create a bound pair of read and write streams. Any data written to the write stream is received by the read stream.
    // i.e., whatever is written to the "toDecoderStream" is received by the "decoderStream".
    CFStreamCreateBoundPair( nil, &_decoderReadStream, &_decoderWriteStream, 128*1024 );    // 128KB buffer size
    self.decoderStream = (__bridge_transfer NSInputStream *)_decoderReadStream;
    self.toDecoderStream     = (__bridge_transfer NSOutputStream *)_decoderWriteStream;
    [self.toDecoderStream setDelegate:self];

    //Create write stream to write to the WebSocket.
    self.encoderStream     = [AWSIoTWebSocketOutputStreamFactory createAWSIoTWebSocketOutputStreamWithWebSocket:webSocket];
    
    //Create Thread and start with "openStreams" being the entry point.
    if (self.streamsThread) {
        AWSDDLogVerbose(@"Issued Cancel on thread [%@]", self.streamsThread);
        [self.streamsThread cancel];
    }
    
    self.streamsThread = [[NSThread alloc] initWithTarget:self selector:@selector(openStreams:) object:self];
    [self.streamsThread start];
}


- (void)webSocket:(AWSSRWebSocket *)webSocket didFailWithError:(NSError *)error;
{
    AWSDDLogError(@"didFailWithError: Websocket failed With Error %@", error);

    // The WebSocket has failed.The input/output streams can be closed here.
    // Also, the webSocket can be set to nil
    [self.toDecoderStream close];
    [self.encoderStream  close];
    [self.webSocket close];
    self.webSocket = nil;
    
    // If this is not because of user initated disconnect, setup timer to retry.
    if (!self.userDidIssueDisconnect ) {
        self.mqttStatus = AWSIoTMQTTStatusConnectionError;
        // Indicate an error to the connection status callback.
        [self notifyConnectionStatus];

        @synchronized(self) {
            self.reconnectThread = [[NSThread alloc] initWithTarget:self selector:@selector(initiateReconnectTimer:) object:self];
            [self.reconnectThread start];
        }
    }
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didReceiveMessage:(id)message;
{
    if ([message isKindOfClass:[NSData class]])
    {
        NSData *messageData = (NSData *)message;
        AWSDDLogVerbose(@"Websocket didReceiveMessage: Received %lu bytes", (unsigned long)messageData.length);
    
        // When a message is received, write it to the Decoder's input stream.
        [self.toDecoderStream write:[messageData bytes] maxLength:messageData.length];
    }
    else
    {
        AWSDDLogError(@"Expected NSData object, but got a %@ object instead.", NSStringFromClass([message class]));
    }
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean;
{
    AWSDDLogInfo(@"WebSocket closed with code:%ld with reason:%@", (long)code, reason);
    
    // The WebSocket has closed. The input/output streams can be closed here.
    // Also, the webSocket can be set to nil
    [self.toDecoderStream close];
    [self.encoderStream  close];
    [self.webSocket close];
    self.webSocket = nil;
    
    // If this is not because of user initated disconnect, setup timer to retry.
    if (!self.userDidIssueDisconnect ) {
        self.mqttStatus = AWSIoTMQTTStatusConnectionError;
        // Indicate an error to the connection status callback.
        [self notifyConnectionStatus];

        @synchronized(self) {
            self.reconnectThread = [[NSThread alloc] initWithTarget:self selector:@selector(initiateReconnectTimer:) object:self];
            [self.reconnectThread start];
        }
    }
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload;
{
    AWSDDLogVerbose(@"Websocket received pong");
}

@end
