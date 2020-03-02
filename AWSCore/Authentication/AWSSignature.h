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

FOUNDATION_EXPORT NSString * _Nonnull const AWSSignatureV4Algorithm;
FOUNDATION_EXPORT NSString * _Nonnull const AWSSignatureV4Terminator;

@class AWSEndpoint;

@protocol AWSCredentialsProvider;

@interface AWSSignatureSignerUtility : NSObject

+ (NSData * _Nonnull)sha256HMacWithData:(NSData * _Nullable)data withKey:(NSData * _Nonnull)key;
+ (NSString * _Nonnull)hashString:(NSString * _Nullable)stringToHash;
+ (NSData * _Nonnull)hash:(NSData * _Nullable)dataToHash;
+ (NSString * _Nonnull)hexEncode:(NSString * _Nullable)string;
+ (NSString * _Nullable)HMACSign:(NSData * _Nullable)data withKey:(NSString * _Nonnull)key usingAlgorithm:(uint32_t)algorithm;

@end

@interface AWSSignatureV4Signer : NSObject <AWSNetworkingRequestInterceptor>

@property (nonatomic, strong, readonly) id<AWSCredentialsProvider> _Nonnull credentialsProvider;

- (instancetype _Nonnull)initWithCredentialsProvider:(id<AWSCredentialsProvider> _Nonnull)credentialsProvider
                                   endpoint:(AWSEndpoint * _Nonnull)endpoint;

/**
 Returns a URL signed using the SigV4 algorithm, using the current date, and including the session token (if any) as
 part of the signed query paramters.

 @param credentialsProvider credentials provider to get accessKey, secretKey, and optional sessionKey
 @param httpMethod the HTTP method (e.g., "GET", "POST", etc)
 @param expireDuration when should the signed URL expire
 @param endpoint the endpoint of the service for which the URL is being generated
 @param keyPath the request path
 @param requestHeaders the headers to sign as part of the request
 @param requestParameters the URL parameters to sign
 @param signBody if true and the httpMethod is GET, sign an empty string as part of the signature content
 @return a task containing the signed URL
 */
+ (AWSTask<NSURL *> * _Nonnull)generateQueryStringForSignatureV4WithCredentialProvider:(id<AWSCredentialsProvider> _Nonnull)credentialsProvider
                                                                            httpMethod:(AWSHTTPMethod)httpMethod
                                                                        expireDuration:(int32_t)expireDuration
                                                                              endpoint:(AWSEndpoint * _Nonnull)endpoint
                                                                               keyPath:(NSString * _Nullable)keyPath
                                                                        requestHeaders:(NSDictionary<NSString *, NSString *> * _Nullable)requestHeaders
                                                                     requestParameters:(NSDictionary<NSString *, id> * _Nullable)requestParameters
                                                                              signBody:(BOOL)signBody;

/**
 Returns a URL signed using the SigV4 algorithm.

 This method requires both regionName and serviceName, because not all AWS service endpoints have the URL format
 "<service>.<region>.amazonaws.com", so we can't necessarily derive the region and service from the URL.

 In addition, the method requires the caller to specify a date to use for the signing. This allows for ease of testing,
 but in practice, callers should use `-[NSDate aws_clockSkewFixedDate]` as this value.

 @param request the NSURLRequest to sign
 @param credentialsProvider credentials provider to get accessKey, secretKey, and optional sessionKey
 @param regionName the string representing the AWS region of the endpoint to be signed.
 @param serviceName the name of the AWS service the request is for
 @param date the date of the signed credential
 @param expireDuration the duration in seconds the signed URL will be valid for
 @param signBody if true and the httpMethod is GET, sign an empty string as part of the signature content
 @param signSessionToken if true, include the sessionKey returned by the credentialsProvider in the signed payload.
        If false, appends the X-AMZ-Security-Token to the end of the signed URL request parameters
 @return a task containing the signed URL
 */
+ (AWSTask<NSURL *> * _Nonnull)sigV4SignedURLWithRequest:(NSURLRequest * _Nonnull)request
                                      credentialProvider:(id<AWSCredentialsProvider> _Nonnull)credentialsProvider
                                              regionName:(NSString * _Nonnull)regionName
                                             serviceName:(NSString * _Nonnull)serviceName
                                                    date:(NSDate * _Nonnull)date
                                          expireDuration:(int32_t)expireDuration
                                                signBody:(BOOL)signBody
                                        signSessionToken:(BOOL)signSessionToken;

+ (NSString * _Nonnull)getCanonicalizedRequest:(NSString * _Nonnull)method
                                 path:(NSString * _Nonnull)path
                                query:(NSString * _Nullable)query
                              headers:(NSDictionary * _Nullable)headers
                        contentSha256:(NSString * _Nullable)contentSha256;

+ (NSData * _Nonnull)getV4DerivedKey:(NSString * _Nullable)secret
                       date:(NSString * _Nullable)dateStamp
                     region:(NSString * _Nullable)regionName
                    service:(NSString * _Nullable)serviceName;

+ (NSString * _Nonnull)getSignedHeadersString:(NSDictionary * _Nullable)headers;

@end

@interface AWSSignatureV2Signer : NSObject <AWSNetworkingRequestInterceptor>

@property (nonatomic, strong, readonly) id<AWSCredentialsProvider> _Nullable credentialsProvider;

+ (instancetype _Nonnull)signerWithCredentialsProvider:(id<AWSCredentialsProvider> _Nonnull)credentialsProvider
                                     endpoint:(AWSEndpoint * _Nonnull)endpoint;

- (instancetype _Nonnull)initWithCredentialsProvider:(id<AWSCredentialsProvider> _Nonnull)credentialsProvider
                                   endpoint:(AWSEndpoint * _Nonnull)endpoint;

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
- (instancetype _Nonnull )initWithInputStream:(NSInputStream * _Nonnull)stream
                                         date:(NSDate * _Nullable)date
                                        scope:(NSString * _Nullable)scope
                                     kSigning:(NSData * _Nullable)kSigning
                              headerSignature:(NSString * _Nullable)headerSignature;

/**
 * Computes new content length after data being chunked encoded.
 **/
+ (NSUInteger)computeContentLengthForChunkedData:(NSUInteger)dataLength;

@end
