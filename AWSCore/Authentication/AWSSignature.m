/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSSignature.h"

#import <CommonCrypto/CommonCrypto.h>
#import "AWSCategory.h"
#import "AWSService.h"
#import "AWSCredentialsProvider.h"
#import "AWSLogging.h"
#import <Bolts/Bolts.h>

NSString *const AWSSigV4Marker = @"AWS4";
NSString *const AWSSigV4Algorithm = @"AWS4-HMAC-SHA256";
NSString *const AWSSigV4Terminator = @"aws4_request";

@implementation AWSSignatureSignerUtility

+ (NSData *)sha256HMacWithData:(NSData *)data withKey:(NSData *)key {
    CCHmacContext context;

    CCHmacInit(&context, kCCHmacAlgSHA256, [key bytes], [key length]);
    CCHmacUpdate(&context, [data bytes], [data length]);

    unsigned char digestRaw[CC_SHA256_DIGEST_LENGTH];
    NSInteger digestLength = CC_SHA256_DIGEST_LENGTH;

    CCHmacFinal(&context, digestRaw);

    return [NSData dataWithBytes:digestRaw length:digestLength];
}

+ (NSString *)hashString:(NSString *)stringToHash {
    return [[NSString alloc] initWithData:[self hash:[stringToHash dataUsingEncoding:NSUTF8StringEncoding]]
                                 encoding:NSASCIIStringEncoding];
}

+ (NSData *)hash:(NSData *)dataToHash {
    if ([dataToHash length] > UINT32_MAX) {
        return nil;
    }

    const void *cStr = [dataToHash bytes];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];

    CC_SHA256(cStr, (uint32_t)[dataToHash length], result);

    return [[NSData alloc] initWithBytes:result length:CC_SHA256_DIGEST_LENGTH];
}

+ (NSString *)hexEncode:(NSString *)string {
    NSUInteger len = [string length];
    unichar *chars = malloc(len * sizeof(unichar));

    [string getCharacters:chars];

    NSMutableString *hexString = [NSMutableString new];
    for (NSUInteger i = 0; i < len; i++) {
        if ((int)chars[i] < 16) {
            [hexString appendString:@"0"];
        }
        [hexString appendString:[NSString stringWithFormat:@"%x", chars[i]]];
    }
    free(chars);

    return hexString;
}

+ (NSString *)HMACSign:(NSData *)data withKey:(NSString *)key usingAlgorithm:(CCHmacAlgorithm)algorithm {
    CCHmacContext context;
    const char    *keyCString = [key cStringUsingEncoding:NSASCIIStringEncoding];

    CCHmacInit(&context, algorithm, keyCString, strlen(keyCString));
    CCHmacUpdate(&context, [data bytes], [data length]);

    // Both SHA1 and SHA256 will fit in here
    unsigned char digestRaw[CC_SHA256_DIGEST_LENGTH];

    NSInteger           digestLength;

    switch (algorithm) {
        case kCCHmacAlgSHA1:
            digestLength = CC_SHA1_DIGEST_LENGTH;
            break;

        case kCCHmacAlgSHA256:
            digestLength = CC_SHA256_DIGEST_LENGTH;
            break;

        default:
            digestLength = -1;
            AWSLogError(@"Unable to sign: unsupported Algorithm.");
            return nil;
            break;
    }

    CCHmacFinal(&context, digestRaw);

    NSData *digestData = [NSData dataWithBytes:digestRaw length:digestLength];

    return [digestData base64EncodedStringWithOptions:kNilOptions];
}

@end

#pragma mark - AWSSignatureV4Signer

@interface AWSSignatureV4Signer()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSSignatureV4Signer

+ (instancetype)signerWithCredentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                     endpoint:(AWSEndpoint *)endpoint {
    AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:credentialsProvider
                                                                                    endpoint:endpoint];
    return signer;
}

- (instancetype)initWithCredentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                   endpoint:(AWSEndpoint *)endpoint {
    if (self = [super init]) {
        _credentialsProvider = credentialsProvider;
        _endpoint = endpoint;
    }

    return self;
}

- (BFTask *)interceptRequest:(NSMutableURLRequest *)request {
    return [[BFTask taskWithResult:nil] continueWithSuccessBlock:^id(BFTask *task) {
        // clear authorization header if set
        [request setValue:nil forHTTPHeaderField:@"Authorization"];

        NSString *autorization;
        NSArray *hostArray  = [[[request URL] host] componentsSeparatedByString:@"."];

        if ([self.credentialsProvider respondsToSelector:@selector(sessionKey)]) {
            [request setValue:self.credentialsProvider.sessionKey forHTTPHeaderField:@"X-Amz-Security-Token"];
        }
        if ([hostArray firstObject] && [[hostArray firstObject] rangeOfString:@"s3"].location != NSNotFound) {
            //If it is a S3 Request
            autorization = [self signS3RequestV4:request];
        } else {
            autorization = [self signRequestV4:request];
        }

        if (autorization) {
            [request setValue:autorization forHTTPHeaderField:@"Authorization"];
        }
        return nil;
    }];
}

- (NSString *)signS3RequestV4:(NSMutableURLRequest *)urlRequest {
    if ( [urlRequest valueForHTTPHeaderField:@"Content-Type"] == nil) {
        [urlRequest addValue:@"binary/octet-stream" forHTTPHeaderField:@"Content-Type"];
    }

    // fix query string
    // @"?location" -> @"?location="

    //    NSString *subResource = request.subResource;
    //    if (nil != subResource
    //        && [subResource length] > 0
    //        && [subResource rangeOfString:@"="].location == NSNotFound) {
    //        [request setSubResource:[subResource stringByAppendingString:@"="]];
    //        [request.urlRequest setURL:request.url];
    //    }

    NSDate *date = [NSDate aws_clockSkewFixedDate];
    NSString *dateStamp = [date aws_stringValue:AWSDateShortDateFormat1];
    //NSString *dateTime  = [date aws_stringValue:AWSDateAmzDateFormat];

    NSString *scope = [NSString stringWithFormat:@"%@/%@/%@/%@", dateStamp, self.endpoint.regionName, self.endpoint.serviceName, AWSSigV4Terminator];
    NSString *signingCredentials = [NSString stringWithFormat:@"%@/%@", self.credentialsProvider.accessKey, scope];

    // compute canonical request
    NSString *httpMethod = urlRequest.HTTPMethod;
    // URL.path returns unescaped path
    NSString *path = urlRequest.URL.path;
    if (path.length == 0) {
        path = [NSString stringWithFormat:@"/"];
    } else {
        // SigV4 signs escaped path string
        path = [[path aws_stringWithURLEncoding] stringByReplacingOccurrencesOfString:@"\%2F" withString:@"/"];
    }
    NSString *query = urlRequest.URL.query;
    if (query == nil) {
        query = [NSString stringWithFormat:@""];
    }

    // Compute contentSha256
    NSString *contentSha256;
    NSInputStream *stream = [urlRequest HTTPBodyStream];
    NSUInteger contentLength = [[urlRequest allHTTPHeaderFields][@"Content-Length"] integerValue];
    if (nil != stream) {
        contentSha256 = @"STREAMING-AWS4-HMAC-SHA256-PAYLOAD";
        [urlRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[AWSS3ChunkedEncodingInputStream computeContentLengthForChunkedData:contentLength]]
          forHTTPHeaderField:@"Content-Length"];
        [urlRequest setValue:nil forHTTPHeaderField:@"Content-Length"]; //remove Content-Length header if it is a HTTPBodyStream
        [urlRequest setValue:@"Chunked" forHTTPHeaderField:@"Transfer-Encoding"];
        [urlRequest addValue:@"aws-chunked" forHTTPHeaderField:@"Content-Encoding"]; //add aws-chunked keyword for s3 chunk upload
        [urlRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)contentLength] forHTTPHeaderField:@"x-amz-decoded-content-length"];
    } else {
        contentSha256 = [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:[AWSSignatureSignerUtility hash:[urlRequest HTTPBody]] encoding:NSASCIIStringEncoding]];
        //using Content-Length with value of '0' cause auth issue, remove it.
        if (contentLength == 0) {
            [urlRequest setValue:nil forHTTPHeaderField:@"Content-Length"];
        } else {
            [urlRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[[urlRequest HTTPBody] length]] forHTTPHeaderField:@"Content-Length"];
        }
    }

    //[request.urlRequest setValue:dateTime forHTTPHeaderField:@"X-Amz-Date"];
    [urlRequest setValue:contentSha256 forHTTPHeaderField:@"x-amz-content-sha256"];

    //Set Content-MD5 header field if required by server.
    if (([ urlRequest.HTTPMethod isEqualToString:@"PUT"] && ([[[urlRequest URL] query] hasPrefix:@"tagging"] ||
                                                             [[[urlRequest URL] query] hasPrefix:@"lifecycle"] ||
                                                             [[[urlRequest URL] query] hasPrefix:@"cors"]))
        || ([urlRequest.HTTPMethod isEqualToString:@"POST"] && [[[urlRequest URL] query] hasPrefix:@"delete"])
        ) {
        if (![urlRequest valueForHTTPHeaderField:@"Content-MD5"]) {
            [urlRequest setValue:[NSString aws_base64md5FromData:urlRequest.HTTPBody] forHTTPHeaderField:@"Content-MD5"];
        }
        
    }
    
    NSMutableDictionary *headers = [[urlRequest allHTTPHeaderFields] mutableCopy];

    NSString *canonicalRequest = [self getCanonicalizedRequest:httpMethod
                                                          path:path
                                                         query:query
                                                       headers:headers
                                                 contentSha256:contentSha256];
    AWSLogDebug(@"Canonical request: [%@]", canonicalRequest);

    NSString *stringToSign = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",
                              AWSSigV4Algorithm,
                              [urlRequest valueForHTTPHeaderField:@"X-Amz-Date"],
                              scope,
                              [AWSSignatureSignerUtility hexEncode:[AWSSignatureSignerUtility hashString:canonicalRequest]]];
    AWSLogDebug(@"AWS4 String to Sign: [%@]", stringToSign);

    NSData *kSigning  = [self getV4DerivedKey:self.credentialsProvider.secretKey
                                         date:dateStamp
                                       region:self.endpoint.regionName
                                      service:self.endpoint.serviceName];

    NSData *signature = [AWSSignatureSignerUtility sha256HMacWithData:[stringToSign dataUsingEncoding:NSUTF8StringEncoding]
                                                              withKey:kSigning];
    NSString *signatureString = [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:signature
                                                                                           encoding:NSASCIIStringEncoding]];

    NSString *authorization = [NSString stringWithFormat:@"%@ Credential=%@, SignedHeaders=%@, Signature=%@",
                               AWSSigV4Algorithm,
                               signingCredentials,
                               [self getSignedHeadersString:headers],
                               signatureString];

    if (nil != stream) {
        AWSS3ChunkedEncodingInputStream *chunkedStream = [[AWSS3ChunkedEncodingInputStream alloc] initWithInputStream:stream
                                                                                                           date:date
                                                                                                          scope:scope
                                                                                                       kSigning:kSigning
                                                                                                headerSignature:signatureString];
        [urlRequest setHTTPBodyStream:chunkedStream];
    }

    return authorization;
}


- (NSString *)signRequestV4:(NSURLRequest *)request{
    if (![self.credentialsProvider respondsToSelector:@selector(accessKey)]
        || ![self.credentialsProvider respondsToSelector:@selector(secretKey)]) {
        return nil;
    }

    NSDate *xAmzDate = [NSDate aws_dateFromString:[request valueForHTTPHeaderField:@"X-Amz-Date"]
                                          format:AWSDateISO8601DateFormat2];

    NSString *dateStamp = [xAmzDate aws_stringValue:AWSDateShortDateFormat1];

    NSString *cfPath = (NSString*)CFBridgingRelease(CFURLCopyPath((CFURLRef)request.URL)) ;
    NSString *path = [cfPath aws_stringWithURLEncodingPathWithoutPriorDecoding];
    if (path.length == 0) {
        path = [NSString stringWithFormat:@"/"];
    }
    NSString *query = request.URL.query;
    if (query == nil) {
        query = [NSString stringWithFormat:@""];
    }

    NSString *contentSha256 = [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:[AWSSignatureSignerUtility hash:request.HTTPBody] encoding:NSASCIIStringEncoding]];

    NSString *canonicalRequest = [self getCanonicalizedRequest:request.HTTPMethod
                                                          path:path
                                                         query:query
                                                       headers:request.allHTTPHeaderFields
                                                 contentSha256:contentSha256];

    AWSLogDebug(@"AWS4 Canonical Request: [%@]", canonicalRequest);
    AWSLogDebug(@"payload %@",[[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);

    NSString *scope = [NSString stringWithFormat:@"%@/%@/%@/%@",
                       dateStamp,
                       self.endpoint.regionName,
                       self.endpoint.serviceName,
                       AWSSigV4Terminator];
    NSString *signingCredentials = [NSString stringWithFormat:@"%@/%@",
                                    self.credentialsProvider.accessKey,
                                    scope];
    NSString *stringToSign = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",
                              AWSSigV4Algorithm,
                              [request valueForHTTPHeaderField:@"X-Amz-Date"],
                              scope,
                              [AWSSignatureSignerUtility hexEncode:[AWSSignatureSignerUtility hashString:canonicalRequest]]];

    AWSLogDebug(@"AWS4 String to Sign: [%@]", stringToSign);

    NSData *kSigning  = [self getV4DerivedKey:self.credentialsProvider.secretKey
                                         date:dateStamp
                                       region:self.endpoint.regionName
                                      service:self.endpoint.serviceName];
    NSData *signature = [AWSSignatureSignerUtility sha256HMacWithData:[stringToSign dataUsingEncoding:NSUTF8StringEncoding]
                                                              withKey:kSigning];

    NSString *credentialsAuthorizationHeader = [NSString stringWithFormat:@"Credential=%@", signingCredentials];
    NSString *signedHeadersAuthorizationHeader = [NSString stringWithFormat:@"SignedHeaders=%@", [self getSignedHeadersString:request.allHTTPHeaderFields]];
    NSString *signatureAuthorizationHeader = [NSString stringWithFormat:@"Signature=%@", [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:signature encoding:NSASCIIStringEncoding]]];

    NSString *authorization = [NSString stringWithFormat:@"%@ %@, %@, %@",
                               AWSSigV4Algorithm,
                               credentialsAuthorizationHeader,
                               signedHeadersAuthorizationHeader,
                               signatureAuthorizationHeader];

    return authorization;
}


- (NSString *)getCanonicalizedRequest:(NSString *)method path:(NSString *)path query:(NSString *)query headers:(NSDictionary *)headers contentSha256:(NSString *)contentSha256 {
    NSMutableString *canonicalRequest = [NSMutableString new];
    [canonicalRequest appendString:method];
    [canonicalRequest appendString:@"\n"];
    [canonicalRequest appendString:path]; // Canonicalized resource path
    [canonicalRequest appendString:@"\n"];

    [canonicalRequest appendString:[self getCanonicalizedQueryString:query]]; // Canonicalized Query String
    [canonicalRequest appendString:@"\n"];

    [canonicalRequest appendString:[self getCanonicalizedHeaderString:headers]];
    [canonicalRequest appendString:@"\n"];

    [canonicalRequest appendString:[self getSignedHeadersString:headers]];
    [canonicalRequest appendString:@"\n"];

    [canonicalRequest appendString:[NSString stringWithFormat:@"%@", contentSha256]];

    return canonicalRequest;
}

- (NSString *)getCanonicalizedQueryString:(NSString *)query {
    NSMutableDictionary *queryDictionary = [NSMutableDictionary new];
    [[query componentsSeparatedByString:@"&"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSArray *components = [obj componentsSeparatedByString:@"="];
        if ([components count] == 2) {
            queryDictionary[components[0]] = components[1];
        }
    }];

    NSMutableArray *sortedQuery = [[NSMutableArray alloc] initWithArray:[queryDictionary allKeys]];

    [sortedQuery sortUsingSelector:@selector(caseInsensitiveCompare:)];

    NSMutableString *sortedQueryString = [NSMutableString new];
    for (NSString *key in sortedQuery) {
        if ([sortedQueryString length] > 0) {
            [sortedQueryString appendString:@"&"];
        }
        [sortedQueryString appendString:key];
        [sortedQueryString appendString:@"="];
        [sortedQueryString appendString:queryDictionary[key]];
    }

    return sortedQueryString;
}

- (NSString *)getCanonicalizedHeaderString:(NSDictionary *)headers {
    NSMutableArray *sortedHeaders = [[NSMutableArray alloc] initWithArray:[headers allKeys]];

    [sortedHeaders sortUsingSelector:@selector(caseInsensitiveCompare:)];

    NSMutableString *headerString = [NSMutableString new];
    for (NSString *header in sortedHeaders) {
        [headerString appendString:[header lowercaseString]];
        [headerString appendString:@":"];
        [headerString appendString:[headers valueForKey:header]];
        [headerString appendString:@"\n"];
    }

    // SigV4 expects all whitespace in headers and values to be collapsed to a single space
    NSCharacterSet *whitespaceChars = [NSCharacterSet whitespaceCharacterSet];
    NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];

    NSArray *parts = [headerString componentsSeparatedByCharactersInSet:whitespaceChars];
    NSArray *nonWhitespace = [parts filteredArrayUsingPredicate:noEmptyStrings];
    return [nonWhitespace componentsJoinedByString:@" "];
}

- (NSString *)getSignedHeadersString:(NSDictionary *)headers {
    NSMutableArray *sortedHeaders = [[NSMutableArray alloc] initWithArray:[headers allKeys]];

    [sortedHeaders sortUsingSelector:@selector(caseInsensitiveCompare:)];

    NSMutableString *headerString = [NSMutableString new];
    for (NSString *header in sortedHeaders) {
        if ( [headerString length] > 0) {
            [headerString appendString:@";"];
        }
        [headerString appendString:[header lowercaseString]];
    }

    return headerString;
}

- (NSData *)getV4DerivedKey:(NSString *)secret date:(NSString *)dateStamp region:(NSString *)regionName service:(NSString *)serviceName {
    // AWS4 uses a series of derived keys, formed by hashing different pieces of data
    NSString *kSecret = [NSString stringWithFormat:@"%@%@", AWSSigV4Marker, secret];
    NSData *kDate = [AWSSignatureSignerUtility sha256HMacWithData:[dateStamp dataUsingEncoding:NSUTF8StringEncoding]
                                                          withKey:[kSecret dataUsingEncoding:NSUTF8StringEncoding]];
    NSData *kRegion = [AWSSignatureSignerUtility sha256HMacWithData:[regionName dataUsingEncoding:NSASCIIStringEncoding]
                                                            withKey:kDate];
    NSData *kService = [AWSSignatureSignerUtility sha256HMacWithData:[serviceName dataUsingEncoding:NSUTF8StringEncoding]
                                                             withKey:kRegion];
    NSData *kSigning = [AWSSignatureSignerUtility sha256HMacWithData:[AWSSigV4Terminator dataUsingEncoding:NSUTF8StringEncoding]
                                                             withKey:kService];

    //TODO: cache this derived key?
    return kSigning;
}

// For SigV2
+ (NSString *)canonicalizedQueryString:(NSDictionary *)parameters {
    NSMutableString *mutableHTTPBodyString = [NSMutableString new];

    NSArray *keys = [parameters allKeys];
    NSArray *sortedKeys = [keys sortedArrayUsingSelector:@selector(compare:)];
    for (NSUInteger index = 0; index < [sortedKeys count]; index++) {
        NSString *key   = [sortedKeys objectAtIndex:index];
        NSString *value = (NSString *)[parameters valueForKey:key];

        [mutableHTTPBodyString appendString:[key aws_stringWithURLEncoding]];
        [mutableHTTPBodyString appendString:@"="];
        [mutableHTTPBodyString appendString:[value aws_stringWithURLEncoding]];

        if (index < [sortedKeys count] - 1) {
            [mutableHTTPBodyString appendString:@"&"];
        }
    }

    return mutableHTTPBodyString;
}

// For SigV2
+ (NSString *)getV2StringToSign:(NSMutableURLRequest *)request canonicalizedQueryString:(NSString *)canonicalizedQueryString {
    NSString *host = [request.URL host];
    NSString *path = [request.URL path];

    if (nil == path || [path length] < 1) {
        path = @"/";
    }

    NSString *stringToSign = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",
                              request.HTTPMethod,
                              host,
                              path,
                              canonicalizedQueryString];
    return stringToSign;
}

@end

#pragma mark - AWSSignatureV2Signer

@interface AWSSignatureV2Signer()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSSignatureV2Signer

+ (instancetype)signerWithCredentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                     endpoint:(AWSEndpoint *)endpoint {
    AWSSignatureV2Signer *signer = [[AWSSignatureV2Signer alloc] initWithCredentialsProvider:credentialsProvider
                                                                                    endpoint:endpoint];
    return signer;
}

- (instancetype)initWithCredentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                   endpoint:(AWSEndpoint *)endpoint {
    if (self = [super init]) {
        _credentialsProvider = credentialsProvider;
        _endpoint = endpoint;
    }

    return self;
}

- (BFTask *)interceptRequest:(NSMutableURLRequest *)request {
    return [[BFTask taskWithResult:nil] continueWithSuccessBlock:^id(BFTask *task) {
        NSString *HTTPBodyString = [[NSString alloc] initWithData:request.HTTPBody
                                                         encoding:NSUTF8StringEncoding];
        NSMutableDictionary *parameters = [NSMutableDictionary new];
        [[HTTPBodyString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"&"]] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSArray *parameter = [obj componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"="]];
            [parameters setValue:parameter[1] forKey:parameter[0]];
        }];

        [parameters setObject:@"HmacSHA256" forKey:@"SignatureMethod"];
        [parameters setObject:@"2" forKey:@"SignatureVersion"];
        [parameters setObject:self.credentialsProvider.accessKey forKey:@"AWSAccessKeyId"];
        [parameters setObject:[[NSDate aws_clockSkewFixedDate] aws_stringValue:AWSDateISO8601DateFormat3]
                       forKey:@"Timestamp"];
        //Added SecurityToken field in QueryString for SigV2 if STS has been used.
        if ([self.credentialsProvider respondsToSelector:@selector(sessionKey)]) {
            [parameters setObject:self.credentialsProvider.sessionKey forKey:@"SecurityToken"];
        }

        NSMutableString *canonicalizedQueryString = [[AWSSignatureV4Signer canonicalizedQueryString:parameters] mutableCopy];
        NSData *dataToSign = [[AWSSignatureV4Signer getV2StringToSign:request
                                             canonicalizedQueryString:canonicalizedQueryString] dataUsingEncoding:NSUTF8StringEncoding];
        NSString *signature = [AWSSignatureSignerUtility HMACSign:dataToSign
                                                          withKey:self.credentialsProvider.secretKey
                                                   usingAlgorithm:kCCHmacAlgSHA256];
        [canonicalizedQueryString appendFormat:@"&Signature=%@", [signature aws_stringWithURLEncoding]];
        request.HTTPBody = [canonicalizedQueryString dataUsingEncoding:NSUTF8StringEncoding];

        return nil;
    }];
}

@end

#pragma mark - S3ChunkedEncodingInputStream

NSUInteger defaultChunkSize = 32 * 1024 - 91;
NSString *const emptyStringSha256 = @"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";

@interface AWSS3ChunkedEncodingInputStream()

@property (nonatomic, weak) id<NSStreamDelegate> delegate;

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

@implementation AWSS3ChunkedEncodingInputStream

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
        NSUInteger chunkSize = defaultChunkSize + [AWSS3ChunkedEncodingInputStream oneChunkedDataSize:defaultChunkSize];
        _chunkData = [[NSMutableData alloc] initWithCapacity:chunkSize];
    }

    return self;
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
        return NO;
    }

    // clear current chunkData for next chunk
    [self.chunkData setLength:0];

    uint8_t *chunkBuffer = calloc(defaultChunkSize, sizeof(uint8_t));
    NSInteger read = [self.stream read:chunkBuffer maxLength:defaultChunkSize];

    // mark end of stream if no data is read
    self.endOfStream = (read <= 0);

    NSData *data = [NSData dataWithBytesNoCopy:chunkBuffer length:read];
    [self.chunkData appendData:[self getSignedChunk:data]];

    AWSLogDebug(@"stream read: %ld, chunk size: %lu", (long)read, (unsigned long)[self.chunkData length]);

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
                              emptyStringSha256,
                              chunkSha256];
    AWSLogDebug(@"AWS4 String to Sign: [%@]", stringToSign);

    NSData *signature = [AWSSignatureSignerUtility sha256HMacWithData:[stringToSign dataUsingEncoding:NSUTF8StringEncoding]
                                                              withKey:self.kSigning];
    self.priorSha256 = [self dataToHexString:signature];
    NSString *chunkedHeader = [NSString stringWithFormat:@"%06lx;chunk-signature=%@\r\n", (unsigned long)[data length], self.priorSha256];
    AWSLogDebug(@"AWS4 Chunked Header: [%@]", chunkedHeader);

    NSMutableData *signedChunk = [NSMutableData data];
    [signedChunk appendData:[chunkedHeader dataUsingEncoding:NSUTF8StringEncoding]];
    [signedChunk appendData:data];
    [signedChunk appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];

    self.totalLengthOfChunkSignatureSent += [AWSS3ChunkedEncodingInputStream oneChunkedDataSize:0];
    return signedChunk;
}

- (NSString *)dataToHexString:(NSData *) data {
    return [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:data
                                                                      encoding:NSASCIIStringEncoding]];
}

#pragma mark NSInputStream methods

- (NSInteger)read:(uint8_t *)buffer maxLength:(NSUInteger)len {
    //change the defaultChunkSize according to caller reading capacity.
    defaultChunkSize = len - [AWSS3ChunkedEncodingInputStream oneChunkedDataSize:0];
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

- (void)setDelegate:(id)delegate {
    if (delegate == nil) {
        _delegate = nil;
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
    result += (dataLength / defaultChunkSize) * [AWSS3ChunkedEncodingInputStream oneChunkedDataSize:defaultChunkSize];
    
    // length of remaining data
    NSUInteger remainingDataLength = dataLength % defaultChunkSize;
    if (remainingDataLength > 0) {
        result += [AWSS3ChunkedEncodingInputStream oneChunkedDataSize:remainingDataLength];
    }
    
    // length of final chunk
    result += [AWSS3ChunkedEncodingInputStream oneChunkedDataSize:0];
    
    return result;
}

@end
