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

#import "AWSLexSignature.h"

static NSString *const AWSLexSignatureScope = @"lex";

@interface AWSLexSignature()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSLexSignature

- (instancetype)initWithCredentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                   endpoint:(AWSEndpoint *)endpoint{
    if (self = [super init]) {
        _credentialsProvider = credentialsProvider;
        _endpoint = endpoint;
    }
    
    return self;
}

- (AWSTask *)interceptRequest:(NSMutableURLRequest *)request {
    [request addValue:request.URL.host forHTTPHeaderField:@"Host"];
    return [[self.credentialsProvider credentials] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
        AWSCredentials *credentials = task.result;
        // clear authorization header if set
        [request setValue:nil forHTTPHeaderField:@"Authorization"];
        
        if (credentials) {
            NSString *authorization;
            
            [request setValue:credentials.sessionKey forHTTPHeaderField:@"X-Amz-Security-Token"];
            authorization = [self signRequest:request
                                  credentials:credentials];
            
            
            if (authorization) {
                [request setValue:authorization forHTTPHeaderField:@"Authorization"];
            }
        }
        return nil;
    }];
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
    if([path hasSuffix:@"/content"]) {
        contentSha256 = @"UNSIGNED-PAYLOAD";
        [request setValue:contentSha256 forHTTPHeaderField:@"x-amz-content-sha256"];
    }else{
        contentSha256 = [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:[AWSSignatureSignerUtility hash:request.HTTPBody] encoding:NSASCIIStringEncoding]];
    }
    
    NSString *canonicalRequest = [AWSSignatureV4Signer getCanonicalizedRequest:request.HTTPMethod
                                                                          path:path
                                                                         query:query
                                                                       headers:request.allHTTPHeaderFields
                                                                 contentSha256:contentSha256];
    
    AWSDDLogVerbose(@"AWS4 Canonical Request: [%@]", canonicalRequest);
    
    NSString *scope = [NSString stringWithFormat:@"%@/%@/%@/%@",
                       dateStamp,
                       self.endpoint.regionName,
                       AWSLexSignatureScope,
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
                                                      service:AWSLexSignatureScope];
    NSData *signature = [AWSSignatureSignerUtility sha256HMacWithData:[stringToSign dataUsingEncoding:NSUTF8StringEncoding]
                                                              withKey:kSigning];
    
    NSString *credentialsAuthorizationHeader = [NSString stringWithFormat:@"Credential=%@", signingCredentials];
    NSString *signedHeadersAuthorizationHeader = [NSString stringWithFormat:@"SignedHeaders=%@", [AWSSignatureV4Signer getSignedHeadersString:request.allHTTPHeaderFields]];
    NSString *signatureAuthorizationHeader = [NSString stringWithFormat:@"Signature=%@", [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:signature encoding:NSASCIIStringEncoding]]];
    
    NSString *authorization = [NSString stringWithFormat:@"%@ %@, %@, %@",
                               AWSSignatureV4Algorithm,
                               credentialsAuthorizationHeader,
                               signedHeadersAuthorizationHeader,
                               signatureAuthorizationHeader];
    
    return authorization;
}

@end
