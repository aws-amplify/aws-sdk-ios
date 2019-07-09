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
#import "AWSTranscribeStreamingSignature.h"
#import "AWSTSNetworking.h"

static NSString *const AWSTranscribeSignatureScope = @"transcribe";

@interface AWSTranscribeStreamingSignature()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSTranscribeStreamingSignature

- (instancetype)initWithCredentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                   endpoint:(AWSEndpoint *)endpoint{
    if (self = [super init]) {
        _credentialsProvider = credentialsProvider;
        _endpoint = endpoint;
    }
    
    return self;
}

// This method is unused by Transcribe Streaming
- (AWSTask *)interceptRequest:(NSMutableURLRequest *)request {
    return [AWSTask taskWithResult:nil];
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
    
    if (sessionKey != nil) {
        url = [NSString stringWithFormat:@"%@%@%@?%@&X-Amz-Security-Token=%@&X-Amz-Signature=%@",
               scheme,
               hostName,
               path,
               queryParams,
               [sessionKey aws_stringWithURLEncoding],
               signatureString];
    } else {
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
    NSString *signatureActual = [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:signature encoding:NSASCIIStringEncoding]];
    NSString *signatureAuthorizationHeader = [NSString stringWithFormat:@"Signature=%@", signatureActual];

    NSString *authorization = [NSString stringWithFormat:@"%@ %@, %@, %@",
                               AWSSignatureV4Algorithm,
                               credentialsAuthorizationHeader,
                               signedHeadersAuthorizationHeader,
                               signatureAuthorizationHeader];
    
    return authorization;
}

@end
