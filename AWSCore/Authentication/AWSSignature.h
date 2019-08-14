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

#import <Foundation/Foundation.h>
#import "AWSNetworking.h"

FOUNDATION_EXPORT NSString *const AWSSignatureV4Algorithm;
FOUNDATION_EXPORT NSString *const AWSSignatureV4Terminator;

@class AWSEndpoint;

@protocol AWSCredentialsProvider;

@interface AWSSignatureSignerUtility : NSObject

+ (NSData *)sha256HMacWithData:(NSData *)data withKey:(NSData *)key;
+ (NSString *)hashString:(NSString *)stringToHash;
+ (NSData *)hash:(NSData *)dataToHash;
+ (NSString *)hexEncode:(NSString *)string;
+ (NSString *)HMACSign:(NSData *)data withKey:(NSString *)key usingAlgorithm:(uint32_t)algorithm;

@end

@interface AWSSignatureV4Signer : NSObject <AWSNetworkingRequestInterceptor>

@property (nonatomic, strong, readonly) id<AWSCredentialsProvider> credentialsProvider;

- (instancetype)initWithCredentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                   endpoint:(AWSEndpoint *)endpoint;

+ (AWSTask<NSURL *> *)generateQueryStringForSignatureV4WithCredentialProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                                                   httpMethod:(AWSHTTPMethod)httpMethod
                                                               expireDuration:(int32_t)expireDuration
                                                                     endpoint:(AWSEndpoint *)endpoint
                                                                      keyPath:(NSString *)keyPath
                                                               requestHeaders:(NSDictionary<NSString *, NSString *> *)requestHeaders
                                                            requestParameters:(NSDictionary<NSString *, id> *)requestParameters
                                                                     signBody:(BOOL)signBody;

/**
 Returns a URL signed using the SigV4 algorithm.

 @param credentialsProvider credentials provider to get accessKey, secretKey, and optional sessionKey
 @param httpMethod the HTTP method (e.g., "GET", "POST", etc)
 @param expireDuration when should the signed URL expire
 @param endpoint the endpoint of the service for which the URL is being generated
 @param keyPath the request path
 @param requestHeaders the headers to sign as part of the request
 @param requestParameters the URL parameters to sign
 @param signBody if true and the httpMethod is GET, sign an empty string as part of the signature content
 @param signSessionToken if true, include the sessionKey returned by the credentialsProvider in the signed payload. If false, appends the X-AMZ-Security-Token to the end of the signed URL request parameters
 @return a task containing the signed URL
 */
+ (AWSTask<NSURL *> *)generateQueryStringForSignatureV4WithCredentialProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                                                   httpMethod:(AWSHTTPMethod)httpMethod
                                                               expireDuration:(int32_t)expireDuration
                                                                     endpoint:(AWSEndpoint *)endpoint
                                                                      keyPath:(NSString *)keyPath
                                                               requestHeaders:(NSDictionary<NSString *, NSString *> *)requestHeaders
                                                            requestParameters:(NSDictionary<NSString *, id> *)requestParameters
                                                                     signBody:(BOOL)signBody
                                                             signSessionToken:(BOOL)signSessionToken;

+ (NSString *)getCanonicalizedRequest:(NSString *)method
                                 path:(NSString *)path
                                query:(NSString *)query
                              headers:(NSDictionary *)headers
                        contentSha256:(NSString *)contentSha256;

+ (NSData *)getV4DerivedKey:(NSString *)secret
                       date:(NSString *)dateStamp
                     region:(NSString *)regionName
                    service:(NSString *)serviceName;

+ (NSString *)getSignedHeadersString:(NSDictionary *)headers;

@end

@interface AWSSignatureV2Signer : NSObject <AWSNetworkingRequestInterceptor>

@property (nonatomic, strong, readonly) id<AWSCredentialsProvider> credentialsProvider;

+ (instancetype)signerWithCredentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                     endpoint:(AWSEndpoint *)endpoint;

- (instancetype)initWithCredentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider
                                   endpoint:(AWSEndpoint *)endpoint;

@end

/**
 * A subclass of NSInputStream that wraps an input stream and adds
 * signature of chunk data.
 **/
@interface AWSS3ChunkedEncodingInputStream : NSInputStream <NSStreamDelegate>

@property (atomic, assign) int64_t totalLengthOfChunkSignatureSent;
/**
 * Initialize the input stream with date, scope, signing key and signature
 * of request headers.
 **/
- (instancetype)initWithInputStream:(NSInputStream *)stream
                               date:(NSDate *)date
                              scope:(NSString *)scope
                           kSigning:(NSData *)kSigning
                    headerSignature:(NSString *)headerSignature;

/**
 * Computes new content length after data being chunked encoded.
 **/
+ (NSUInteger)computeContentLengthForChunkedData:(NSUInteger)dataLength;

@end
