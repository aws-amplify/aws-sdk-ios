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

#import <AWSCore/AWSCore.h>
#import "AWSTranscribeStreamingChunkedEncodingInputStream.h"
#import "AWSTranscribeEventEncoder.h"

static NSUInteger defaultChunkSize = 4096;
static NSString *const emptyStringSha256 = @"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
static NSString *const dateHeader = @":date";
static BOOL once = YES;

@interface AWSTranscribeStreamingChunkedEncodingInputStream()

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

@implementation AWSTranscribeStreamingChunkedEncodingInputStream

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
        NSUInteger chunkSize = defaultChunkSize + [AWSTranscribeStreamingChunkedEncodingInputStream oneChunkedDataSize:defaultChunkSize];
        _chunkData = [[NSMutableData alloc] initWithCapacity:chunkSize];
    }
    
    return self;
}

+ (NSInputStream *)getInputStream {
    return [NSInputStream new];
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
    
    self.totalLengthOfChunkSignatureSent += [AWSTranscribeStreamingChunkedEncodingInputStream oneChunkedDataSize:0];
    return signedChunk;
}

- (NSString *)dataToHexString:(NSData *) data {
    return [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:data
                                                                      encoding:NSASCIIStringEncoding]];
}

#pragma mark NSInputStream methods

- (NSInteger)read:(uint8_t *)buffer maxLength:(NSUInteger)len {
    //change the defaultChunkSize according to caller reading capacity.
    defaultChunkSize = len - [AWSTranscribeStreamingChunkedEncodingInputStream oneChunkedDataSize:0];
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
    result += (dataLength / defaultChunkSize) * [AWSTranscribeStreamingChunkedEncodingInputStream oneChunkedDataSize:defaultChunkSize];
    
    // length of remaining data
    NSUInteger remainingDataLength = dataLength % defaultChunkSize;
    if (remainingDataLength > 0) {
        result += [AWSTranscribeStreamingChunkedEncodingInputStream oneChunkedDataSize:remainingDataLength];
    }
    
    // length of final chunk
    result += [AWSTranscribeStreamingChunkedEncodingInputStream oneChunkedDataSize:0];
    
    return result;
}

@end
