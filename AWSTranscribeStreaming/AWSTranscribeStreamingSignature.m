//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSTranscribeStreamingSignature.h"
#import "AWSTSNetworking.h"
#import "AWSSRWebSocket.h"
#import "AWSTranscribeEventHandler.h"
#import "AWSTranscribeEventHandler.h"
#import <AWSCore/AWSCore.h>

static NSString *const AWSTranscribeSignatureScope = @"transcribe";
static NSInputStream* inputStream1;

@interface AWSTranscribeStreamingSignature()

@property (nonatomic, strong) AWSEndpoint *endpoint;



@end

@implementation AWSTranscribeStreamingSignature


- (instancetype)initWithCredentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                   endpoint:(AWSEndpoint *)endpoint{
    if (self = [super init]) {
        _credentialsProvider = credentialsProvider;
        _endpoint = endpoint;
        _webSocket1 = [[AWSSRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"wss://localhost"]]];
    }
    
    return self;
}

// message will either be an NSString if the server is using text
// or NSData if the server is using binary.
- (void)webSocket:(AWSSRWebSocket *)webSocket didReceiveMessage:(id)message {
    // Store the result of the decoded data and call customer's completion handler to notify them of a transcription event.
    [AWSTranscribeEventDecoder decodeEvent:(NSData *)message];
}

- (void)webSocketDidOpen:(AWSSRWebSocket *)webSocket {
    //  TODO: We should notify  the customer  that the socket is ready and they can start publishing their audio

    
    switch (webSocket.readyState) {
        case AWSSR_OPEN:
            break;
        default:
            break;
    }
    
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didFailWithError:(NSError *)error {
    // TODO: Notify customer completion handler of error and terminate the connection.
}
- (void)webSocket:(AWSSRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    // TODO: Notify customer completion handler of error and terminate the connection.
    // Check if the disconnect was due to a manual invocation in which case we can skip notifying customer
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    // Part of wss protocol
}

- (AWSTask *)interceptRequest:(NSMutableURLRequest *)request {
    [request addValue:request.URL.host forHTTPHeaderField:@"Host"];
    
    return [[self.credentialsProvider credentials] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
        AWSCredentials *credentials = task.result;
        // clear authorization header if set
        [request setValue:nil forHTTPHeaderField:@"Authorization"];
        
        
        
        /************ BEGIN WSS CODE ************/
        
        NSString *encoding = [request valueForHTTPHeaderField:@"x-amzn-transcribe-media-encoding"];
        NSString *languageCode = [request valueForHTTPHeaderField:@"x-amzn-transcribe-language-code"];
        NSString *sampleRate = [request valueForHTTPHeaderField:@"x-amzn-transcribe-sample-rate"];
        
        NSString *websocketURL = [self prepareWebSocketUrlWithHostName:[NSString stringWithFormat: @"transcribestreaming.%@.amazonaws.com:8443", self.endpoint.regionName]
                                                            regionName:self.endpoint.regionName
                                                             accessKey:credentials.accessKey
                                                             secretKey:credentials.secretKey
                                                            sessionKey:credentials.sessionKey
                                                              encoding:encoding
                                                          languageCode:languageCode
                                                            sampleRate:sampleRate];
        NSLog(@"%@", websocketURL);
        
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:websocketURL]];
        
        //Create the webSocket and setup the MQTTClient object as the delegate
        self.webSocket = [[AWSSRWebSocket alloc] initWithURLRequest:urlRequest];
        self.webSocket.delegate = self;
        self.webSocket1 = self.webSocket;
        
        //Open the web socket
        [self.webSocket open];
        
        // Now that the WebSocket is created and opened, it will send its delegate, i.e., this MQTTclient object the messages.
        AWSDDLogVerbose(@"Websocket is created and opened.");
        
        
        
        // Currently we return here without http/2 signing
        
        /************ END WSS CODE ************/
        
        
        /************ BEGIN HTTP/2 CODE ************/
        
        if (credentials) {
            NSString *authorization;
            
            [request setValue:credentials.sessionKey forHTTPHeaderField:@"X-Amz-Security-Token"];
            
            // This code is for signing HTTP2 requests
            //The connection is validated working and the signature is accepted by the service
            // The service returns a 200 with the signature from below.eiifcckjbhnnjcbeevfdjrhrfgrilrglhdifvggrrthc
            
            authorization = [self signRequest:request
                                  credentials:credentials];
            
            
            if (authorization) {
                [request setValue:authorization forHTTPHeaderField:@"Authorization"];
            }
            
            // Once this authorization is set, we have a custom NSURLSession client implemented which makes the request to the service.
            // That code can be found in AWSTSNetworking.h/m
            
        }
        /************ END HTTP/2 CODE ************/
        return [AWSTask taskWithResult:self.webSocket];
    }];
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

// Prepares a websocket url with a pre-signed string for the specified parameters
- (NSString *)prepareWebSocketUrlWithHostName:(NSString *)hostName
                                   regionName:(NSString *)regionName
                                    accessKey:(NSString *)accessKey
                                    secretKey:(NSString *)secretKey
                                   sessionKey:(NSString *)sessionKey
                                     encoding:(NSString *)encoding
                                 languageCode:(NSString *)languageCode
                                   sampleRate:(NSString *)sampleRate

{
    NSDate *date          = [NSDate new];
    NSString *now         = [date aws_stringValue:AWSDateISO8601DateFormat2];
    NSString *today       = [date aws_stringValue:AWSDateShortDateFormat1];
    NSString *path        = @"/stream-transcription-websocket";
    NSString *serviceName = @"transcribe";
    NSString *algorithm   = @"AWS4-HMAC-SHA256";
    
    NSString *queryParams = [NSString stringWithFormat:@"X-Amz-Algorithm=%@&X-Amz-Credential=%@%%2F%@%%2F%@%%2F%@%%2Faws4_request&X-Amz-Date=%@&X-Amz-Expires=300&X-Amz-SignedHeaders=host&language-code=%@&media-encoding=%@&sample-rate=%@",
                             algorithm,
                             accessKey,
                             today,
                             regionName,
                             serviceName,
                             now,
                             languageCode,
                             encoding,
                             sampleRate];
    
    return [self signWebSocketUrlForMethod:@"GET" scheme:@"wss://" hostName:hostName path:path  queryParams:queryParams accessKey:accessKey secretKey:secretKey regionName:regionName serviceName:serviceName payload:@"" today:today now:now sessionKey:sessionKey];
}



- (NSString *)signRequest:(NSMutableURLRequest *)request credentials:(AWSCredentials *)credentials{
    NSString *absoluteString = [[request.URL absoluteString] stringByRemovingPercentEncoding];
    if ([absoluteString hasSuffix:@"/"]) {
        absoluteString = [absoluteString substringToIndex:[absoluteString length] - 1];
    }
    
    request.URL = [NSURL URLWithString:absoluteString];
    
    NSDate *xAmzDate = [NSDate aws_dateFromString:[request valueForHTTPHeaderField:@"X-Amz-Date"]
                                           format:AWSDateISO8601DateFormat2];
    
    NSString *dateStamp = [xAmzDate aws_stringValue:AWSDateShortDateFormat1];
    
    NSString *cfPath = (NSString *)CFBridgingRelease(CFURLCopyPath((CFURLRef)request.URL));
    
    NSString *path = [cfPath aws_stringWithURLEncodingPath];
    if (path.length == 0) {
        path = [NSString stringWithFormat:@"/"];
    }
    NSString *query = request.URL.query;
    if (query == nil) {
        query = [NSString stringWithFormat:@""];
    }
    
    NSString *contentSha256;
    
    //for streaming api the payload is unsigned.
    if([path hasSuffix:@"/startStreaming"]) {
        contentSha256 = @"STREAMING-AWS4-HMAC-SHA256-EVENTS";
        [request setValue:contentSha256 forHTTPHeaderField:@"x-amz-content-sha256"];
    } else{
        contentSha256 = [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:[AWSSignatureSignerUtility hash:request.HTTPBody] encoding:NSASCIIStringEncoding]];
    }
    
    NSString *canonicalRequest = [AWSSignatureV4Signer getCanonicalizedRequest:request.HTTPMethod
                                                                          path:path
                                                                         query:query
                                                                       headers:request.allHTTPHeaderFields
                                                                 contentSha256:@"STREAMING-AWS4-HMAC-SHA256-EVENTS"];
    
    AWSDDLogVerbose(@"AWS4 Canonical Request: [%@]", canonicalRequest);
    
    NSString *scope = [NSString stringWithFormat:@"%@/%@/%@/%@",
                       dateStamp,
                       self.endpoint.regionName,
                       AWSTranscribeSignatureScope,
                       AWSSignatureV4Terminator];
    NSString *signingCredentials = [NSString stringWithFormat:@"%@/%@",
                                    credentials.accessKey,
                                    scope];
    NSString *stringToSign = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",
                              AWSSignatureV4Algorithm,
                              [request valueForHTTPHeaderField:@"X-Amz-Date"],
                              scope,
                              [AWSSignatureSignerUtility hexEncode:[AWSSignatureSignerUtility hashString:canonicalRequest]]];
    
    AWSDDLogVerbose(@"AWS4 String to Sign: [%@]", stringToSign);
    
    NSData *kSigning  = [AWSSignatureV4Signer getV4DerivedKey:credentials.secretKey
                                                         date:dateStamp
                                                       region:self.endpoint.regionName
                                                      service:AWSTranscribeSignatureScope];
    NSData *signature = [AWSSignatureSignerUtility sha256HMacWithData:[stringToSign dataUsingEncoding:NSUTF8StringEncoding]
                                                              withKey:kSigning];
    
    NSString *credentialsAuthorizationHeader = [NSString stringWithFormat:@"Credential=%@", signingCredentials];
    NSString *signedHeadersAuthorizationHeader = [NSString stringWithFormat:@"SignedHeaders=%@", [AWSSignatureV4Signer getSignedHeadersString:request.allHTTPHeaderFields]];
    NSString *signatureAuthorizationHeader = [NSString stringWithFormat:@"Signature=%@", [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:signature encoding:NSASCIIStringEncoding]]];
    NSString *signatureActual = [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:signature encoding:NSASCIIStringEncoding]];
    
    NSString *authorization = [NSString stringWithFormat:@"%@ %@, %@, %@",
                               AWSSignatureV4Algorithm,
                               credentialsAuthorizationHeader,
                               signedHeadersAuthorizationHeader,
                               signatureAuthorizationHeader];
//                               @"Signature=STREAMING-AWS4-HMAC-SHA256-EVENTS"];
    
    return authorization;
}

@end


static NSUInteger defaultChunkSize = 4096;
static NSString *const emptyStringSha256 = @"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
static NSString *const dateHeader = @":date";
static BOOL once = YES;

@interface AWSTranscribeChunkedEncodingInputStream()

// original input stream
@property (nonatomic, strong) NSInputStream *stream;

// buffer for chunked data plus header
@property (nonatomic, strong) NSMutableData *chunkData;

// Mark the location of chunkData to be read
@property (nonatomic, assign) NSUInteger location;

// A flag indicates end of stream
@property (nonatomic, assign) BOOL endOfStream;

// SigV4 related properties
// Date, used in signing
@property (nonatomic, strong) NSDate *date;

// Keypath/Scope
@property (nonatomic, strong) NSString *scope;

// Signature of previous chunk. It's initialized as that of headers.
@property (nonatomic, strong) NSString *priorSha256;

// SigV4 signing key
@property (nonatomic, strong) NSData *kSigning;



@end

@implementation AWSTranscribeChunkedEncodingInputStream

@synthesize delegate = _delegate;

- (instancetype)initWithInputStream:(NSInputStream *)stream
                               date:(NSDate *)date
                              scope:(NSString *)scope
                           kSigning:(NSData *)kSigning
                    headerSignature:(NSString *)headerSignature {
    if (self = [super init]) {
        _stream = stream;
        _stream.delegate = self;
        _date = [date copy];
        _scope = [scope copy];
        _kSigning = [kSigning copy];
        _priorSha256 = [headerSignature copy];
        
        // Chunk size plus signature header
        NSUInteger chunkSize = defaultChunkSize + [AWSTranscribeChunkedEncodingInputStream oneChunkedDataSize:defaultChunkSize];
        _chunkData = [[NSMutableData alloc] initWithCapacity:chunkSize];
    }
    
    return self;
}

+ (NSInputStream *)getInputStream {
    return inputStream1;
}

- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode {
    if ((eventCode & (1 << 4))) {
        // toggle the NSStreamEventEndEncountered bit.
        eventCode ^= 1 << 4;
    }
    if ([self.delegate respondsToSelector:@selector(stream:handleEvent:)]) {
        [self.delegate stream:self handleEvent:eventCode];
    }
}

// Read next chunk of data from stream, and sign the chunk.
// Returns YES on a successful read, NO otherwise.
- (BOOL)nextChunk {
    if (self.endOfStream) {
        if (once) {
        [self.chunkData setLength:0];
        [self.chunkData appendData:[[NSString stringWithFormat:@":chunk-signature=%@\n:date=%@\n", self.priorSha256, [self.date aws_stringValue:AWSDateISO8601DateFormat2]] dataUsingEncoding:NSUTF8StringEncoding]];
            once = NO;
        return YES;
        }
        return NO;
    }
    
    // clear current chunkData for next chunk
    [self.chunkData setLength:0];
    
    uint8_t *chunkBuffer = calloc(defaultChunkSize, sizeof(uint8_t));
    NSInteger read = [self.stream read:chunkBuffer maxLength:defaultChunkSize];
    
    // mark end of stream if no data is read
    self.endOfStream = (read <= 0);
    
    // return NO if stream read failed
    if (read < 0) {
        free(chunkBuffer);
        AWSDDLogError(@"stream read failed streamStatus: %lu streamError: %@", (unsigned long)[self.stream streamStatus], [self.stream streamError].description);
        return NO;
    }
    
    NSData *data = [NSData dataWithBytesNoCopy:chunkBuffer length:read];
    NSData *data1 = [AWSTranscribeEventEncoder encodeChunk:data headers:@{
                                                                          @":content-type": @"audio/wav",
                                                                          @":message-type": @"event",
                                                                          @":event-type": @"AudioEvent"
                                                                          }];
    [self.chunkData appendData:[self getSignedChunk:data1]];
    
    AWSDDLogVerbose(@"stream read: %ld, chunk size: %lu", (long)read, (unsigned long)[self.chunkData length]);
    
    return YES;
}

// Signs data
- (NSData *)getSignedChunk:(NSData *)data {
    NSString *chunkSha256 = [self dataToHexString:[AWSSignatureSignerUtility hash:data]];
    NSString *stringToSign = [NSString stringWithFormat:
                              @"%@\n%@\n%@\n%@\n%@\n%@",
                              @"AWS4-HMAC-SHA256-PAYLOAD",
                              [self.date aws_stringValue:AWSDateISO8601DateFormat2],
                              self.scope,
                              self.priorSha256,
                              [self dataToHexString:[AWSSignatureSignerUtility hash:[dateHeader dataUsingEncoding:NSUTF8StringEncoding]]],
                              chunkSha256];
    AWSDDLogVerbose(@"AWS4 String to Sign: [%@]", stringToSign);
    
    NSData *signature = [AWSSignatureSignerUtility sha256HMacWithData:[stringToSign dataUsingEncoding:NSUTF8StringEncoding]
                                                              withKey:self.kSigning];
    self.priorSha256 = [self dataToHexString:signature];
    NSString *chunkedHeader = [NSString stringWithFormat:@":chunk-signature=%@\n:date=%@\n", self.priorSha256, [self.date aws_stringValue:AWSDateISO8601DateFormat2]];
    AWSDDLogVerbose(@"AWS4 Chunked Header: [%@]", chunkedHeader);

    
    NSMutableData *signedChunk = [NSMutableData data];
    [signedChunk appendData:[chunkedHeader dataUsingEncoding:NSUTF8StringEncoding]];

    [signedChunk appendData:data];
    [signedChunk appendData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    self.totalLengthOfChunkSignatureSent += [AWSTranscribeChunkedEncodingInputStream oneChunkedDataSize:0];
    return signedChunk;
}

- (NSString *)dataToHexString:(NSData *) data {
    return [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:data
                                                                      encoding:NSASCIIStringEncoding]];
}

#pragma mark NSInputStream methods

- (NSInteger)read:(uint8_t *)buffer maxLength:(NSUInteger)len {
    //change the defaultChunkSize according to caller reading capacity.
    defaultChunkSize = len - [AWSTranscribeChunkedEncodingInputStream oneChunkedDataSize:0];
    // check whether there is data available
    if ([self.chunkData length] <= self.location) {
        // set up next chunk
        if ([self nextChunk]) {
            // rewind location
            self.location = 0;
        } else {
            return 0;
        }
    }
    
    // compute how many bytes to read from chunk
    NSUInteger length = MIN(len, [self.chunkData length] - self.location);
    NSRange range = {self.location, length};
    [self.chunkData getBytes:(void *)buffer range:range];
    
    // Update location
    self.location += length;
    
    return length;
}

- (BOOL)hasBytesAvailable {
    return !self.endOfStream;
}

- (BOOL)getBuffer:(uint8_t **)buffer length:(NSUInteger *)len {
    return NO;
}

- (void)open {
    [self.stream open];
}

- (void)close {
    [self.stream close];
}

- (void)setDelegate:(id<NSStreamDelegate>)delegate {
    if (delegate == nil) {
        _delegate = self;
    } else {
        _delegate = delegate;
    }
}

- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode {
    [self.stream scheduleInRunLoop:aRunLoop forMode:mode];
}

- (void)removeFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode {
    [self.stream removeFromRunLoop:aRunLoop forMode:mode];
}

- (id)propertyForKey:(NSString *)key {
    return [self.stream propertyForKey:key];
}

- (BOOL)setProperty:(id)property forKey:(NSString *)key {
    return [self.stream setProperty:property forKey:key];
}

- (NSStreamStatus)streamStatus {
    if ([self.stream streamStatus] == NSStreamStatusAtEnd) {
        if (self.endOfStream) {
            return [self.stream streamStatus];
        } else {
            return NSStreamStatusOpen;
        }
    } else {
        return [self.stream streamStatus];
    }
}

- (NSError *)streamError {
    return [self.stream streamError];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [self.stream methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invokeWithTarget:self.stream];
}

/**
 * Computes the size of one data chunk
 *
 * <chunk size in hex>;chunk-signature=<sha256>\r\n
 * <data>\r\n
 **/
+ (NSUInteger)oneChunkedDataSize:(NSUInteger)dataLength {
    return [[NSString stringWithFormat:@"%06lx;chunk-signature=%@\r\n",  (unsigned long)dataLength, emptyStringSha256] length] + dataLength + [@"\r\n" length];
}

+ (NSUInteger)computeContentLengthForChunkedData:(NSUInteger)dataLength {
    NSUInteger result = 0;
    
    // length of full chunks
    result += (dataLength / defaultChunkSize) * [AWSTranscribeChunkedEncodingInputStream oneChunkedDataSize:defaultChunkSize];
    
    // length of remaining data
    NSUInteger remainingDataLength = dataLength % defaultChunkSize;
    if (remainingDataLength > 0) {
        result += [AWSTranscribeChunkedEncodingInputStream oneChunkedDataSize:remainingDataLength];
    }
    
    // length of final chunk
    result += [AWSTranscribeChunkedEncodingInputStream oneChunkedDataSize:0];
    
    return result;
}

@end
