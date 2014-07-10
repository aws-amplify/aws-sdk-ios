/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>

#import "Bolts.h"

FOUNDATION_EXPORT NSString *const AZNetworkingErrorDomain;
typedef NS_ENUM(NSInteger, AZNetworkingErrorType) {
    AZNetworkingErrorUnknown,
    AZNetworkingErrorCancelled
};

typedef NS_ENUM(NSInteger, AZNetworkingRetryType) {
    AZNetworkingRetryTypeUnknown,
    AZNetworkingRetryTypeShouldNotRetry,
    AZNetworkingRetryTypeShouldRetry,
    AZNetworkingRetryTypeShouldRefreshCredentialsAndRetry,
    AZNetworkingRetryTypeShouldCorrectClockSkewAndRetry
};

@class AZNetworkingConfiguration;
@class AZNetworkingRequest;

typedef void (^AZNetworkingUploadProgressBlock) (int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend);
typedef void (^AZNetworkingDownloadProgressBlock) (int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite);
typedef void (^AZNetworkingCompletionHandlerBlock)(id responseObject, NSError *error);

#pragma mark - AZHTTPMethod

typedef NS_ENUM(NSInteger, AZHTTPMethod) {
    AZHTTPMethodUnknown,
    AZHTTPMethodGET,
    AZHTTPMethodHEAD,
    AZHTTPMethodPOST,
    AZHTTPMethodPUT,
    AZHTTPMethodPATCH,
    AZHTTPMethodDELETE
};

@interface NSString (AZHTTPMethod)

+ (instancetype)az_stringWithHTTPMethod:(AZHTTPMethod)HTTPMethod;

@end

#pragma mark - AZNetworking

@interface AZNetworking : NSObject

+ (instancetype)standardNetworking;
+ (instancetype)networking:(AZNetworkingConfiguration *)configuration;

- (BFTask *)sendRequest:(AZNetworkingRequest *)request;

- (BFTask *)sendDownloadRequest:(AZNetworkingRequest *)request;

- (BFTask *)sendUploadRequest:(AZNetworkingRequest *)request;

- (BFTask *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters;

- (BFTask *)HEAD:(NSString *)URLString parameters:(NSDictionary *)parameters;

- (BFTask *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters;

- (BFTask *)PUT:(NSString *)URLString parameters:(NSDictionary *)parameters;

- (BFTask *)PATCH:(NSString *)URLString parameters:(NSDictionary *)parameters;

- (BFTask *)DELETE:(NSString *)URLString parameters:(NSDictionary *)parameters;

@end

#pragma mark - Protocols

@protocol AZURLRequestSerializer <NSObject>

@required
- (BFTask *)validateRequest:(NSURLRequest *)request;
- (BFTask *)serializeRequest:(NSMutableURLRequest *)request
                     headers:(NSDictionary *)headers
                  parameters:(NSDictionary *)parameters;

@end

@protocol AZNetworkingRequestInterceptor <NSObject>

@required
- (BFTask *)interceptRequest:(NSMutableURLRequest *)request;

@end

@protocol AZNetworkingHTTPResponseInterceptor <NSObject>

@required
- (BFTask *)interceptResponse:(NSHTTPURLResponse *)response
                         data:(id)data
              originalRequest:(NSURLRequest *)originalRequest
               currentRequest:(NSURLRequest *)currentRequest;

@end

@protocol AZHTTPURLResponseSerializer <NSObject>

@required

- (BOOL)validateResponse:(NSHTTPURLResponse *)response
             fromRequest:(NSURLRequest *)request
                    data:(id)data
                   error:(NSError *__autoreleasing *)error;
- (id)responseObjectForResponse:(NSHTTPURLResponse *)response
                originalRequest:(NSURLRequest *)originalRequest
                 currentRequest:(NSURLRequest *)currentRequest
                           data:(id)data
                          error:(NSError *__autoreleasing *)error;

@end

@protocol AZURLRequestRetryHandler <NSObject>

@required

@property (nonatomic, assign) uint32_t maxRetryCount;

- (AZNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                            response:(NSHTTPURLResponse *)response
                                data:(NSData *)data
                               error:(NSError *)error;

- (NSTimeInterval)timeIntervalForRetry:(uint32_t)currentRetryCount
                              response:(NSHTTPURLResponse *)response
                                  data:(NSData *)data
                                 error:(NSError *)error;

@end

#pragma mark - AZURLRequestSerializer

@interface AZURLRequestSerializer : NSObject <AZURLRequestSerializer>

@end

#pragma mark - AZNetworkingConfiguration

@interface AZNetworkingConfiguration : NSObject <NSCopying>

@property (nonatomic, readonly) NSURL *URL;
@property (nonatomic, strong) NSURL *baseURL;
@property (nonatomic, strong) NSString *URLString;
@property (nonatomic, assign) AZHTTPMethod HTTPMethod;
@property (nonatomic, strong) NSDictionary *headers;

@property (nonatomic, strong) id<AZURLRequestSerializer> requestSerializer;
@property (nonatomic, strong) NSArray *requestInterceptors; // Array of AZNetworkingRequestInterceptor.
@property (nonatomic, strong) id<AZHTTPURLResponseSerializer> responseSerializer;
@property (nonatomic, strong) NSArray *responseInterceptors; // Array of AZNetworkingResponseInterceptor.
@property (nonatomic, strong) id<AZURLRequestRetryHandler> retryHandler;

+ (instancetype)defaultConfiguration;

@end

#pragma mark - AZNetworkingRequest

@interface AZNetworkingRequest : AZNetworkingConfiguration

@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) NSURL *uploadingFileURL;
@property (nonatomic, strong) NSURL *downloadingFileURL;
@property (nonatomic, assign) BOOL shouldWriteDirectly;

@property (nonatomic, copy) AZNetworkingUploadProgressBlock uploadProgress;
@property (nonatomic, copy) AZNetworkingDownloadProgressBlock downloadProgress;

@property (readonly, nonatomic, strong) id task;
@property (readonly, nonatomic, assign, getter = isCancelled) BOOL cancelled;

+ (instancetype)requestForDataTask:(AZHTTPMethod)HTTPMethod
                         URLString:(NSString *)URLString;
+ (instancetype)requestForDownloadTask:(AZHTTPMethod)HTTPMethod
                             URLString:(NSString *)URLString
                    downloadingFileURL:(NSURL *)downloadingFileURL;
+ (instancetype)requestForUploadTask:(AZHTTPMethod)HTTPMethod
                           URLString:(NSString *)URLString
                    uploadingFileURL:(NSURL *)uploadingFileURL;

- (void)assignProperties:(AZNetworkingConfiguration *)configuration;
- (void)cancel;
- (void)pause;

@end
