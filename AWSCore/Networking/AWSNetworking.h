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
#import "AWSModel.h"

FOUNDATION_EXPORT NSString *const AWSNetworkingErrorDomain;
typedef NS_ENUM(NSInteger, AWSNetworkingErrorType) {
    AWSNetworkingErrorUnknown,
    AWSNetworkingErrorCancelled
};

typedef NS_ENUM(NSInteger, AWSNetworkingRetryType) {
    AWSNetworkingRetryTypeUnknown,
    AWSNetworkingRetryTypeShouldNotRetry,
    AWSNetworkingRetryTypeShouldRetry,
    AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry,
    AWSNetworkingRetryTypeShouldCorrectClockSkewAndRetry
};

@class AWSNetworkingConfiguration;
@class AWSNetworkingRequest;
@class BFTask;

typedef void (^AWSNetworkingUploadProgressBlock) (int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend);
typedef void (^AWSNetworkingDownloadProgressBlock) (int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite);
typedef void (^AWSNetworkingCompletionHandlerBlock)(id responseObject, NSError *error);

#pragma mark - AWSHTTPMethod

typedef NS_ENUM(NSInteger, AWSHTTPMethod) {
    AWSHTTPMethodUnknown,
    AWSHTTPMethodGET,
    AWSHTTPMethodHEAD,
    AWSHTTPMethodPOST,
    AWSHTTPMethodPUT,
    AWSHTTPMethodPATCH,
    AWSHTTPMethodDELETE
};

@interface NSString (AWSHTTPMethod)

+ (instancetype)aws_stringWithHTTPMethod:(AWSHTTPMethod)HTTPMethod;

@end

#pragma mark - AWSNetworking

@interface AWSNetworking : NSObject

+ (instancetype)standardNetworking;
+ (instancetype)networking:(AWSNetworkingConfiguration *)configuration;

- (BFTask *)sendRequest:(AWSNetworkingRequest *)request;

- (BFTask *)sendDownloadRequest:(AWSNetworkingRequest *)request;

- (BFTask *)sendUploadRequest:(AWSNetworkingRequest *)request;

- (BFTask *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters;

- (BFTask *)HEAD:(NSString *)URLString parameters:(NSDictionary *)parameters;

- (BFTask *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters;

- (BFTask *)PUT:(NSString *)URLString parameters:(NSDictionary *)parameters;

- (BFTask *)PATCH:(NSString *)URLString parameters:(NSDictionary *)parameters;

- (BFTask *)DELETE:(NSString *)URLString parameters:(NSDictionary *)parameters;

@end

#pragma mark - Protocols

@protocol AWSURLRequestSerializer <NSObject>

@required
- (BFTask *)validateRequest:(NSURLRequest *)request;
- (BFTask *)serializeRequest:(NSMutableURLRequest *)request
                     headers:(NSDictionary *)headers
                  parameters:(NSDictionary *)parameters;

@end

@protocol AWSNetworkingRequestInterceptor <NSObject>

@required
- (BFTask *)interceptRequest:(NSMutableURLRequest *)request;

@end

@protocol AWSNetworkingHTTPResponseInterceptor <NSObject>

@required
- (BFTask *)interceptResponse:(NSHTTPURLResponse *)response
                         data:(id)data
              originalRequest:(NSURLRequest *)originalRequest
               currentRequest:(NSURLRequest *)currentRequest;

@end

@protocol AWSHTTPURLResponseSerializer <NSObject>

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

@protocol AWSURLRequestRetryHandler <NSObject>

@required

@property (nonatomic, assign) uint32_t maxRetryCount;

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                            response:(NSHTTPURLResponse *)response
                                data:(NSData *)data
                               error:(NSError *)error;

- (NSTimeInterval)timeIntervalForRetry:(uint32_t)currentRetryCount
                              response:(NSHTTPURLResponse *)response
                                  data:(NSData *)data
                                 error:(NSError *)error;

@end

#pragma mark - AWSURLRequestSerializer

@interface AWSURLRequestSerializer : NSObject <AWSURLRequestSerializer>

@end

#pragma mark - AWSNetworkingConfiguration

@interface AWSNetworkingConfiguration : NSObject <NSCopying>

@property (nonatomic, readonly) NSURL *URL;
@property (nonatomic, strong) NSURL *baseURL;
@property (nonatomic, strong) NSString *URLString;
@property (nonatomic, assign) AWSHTTPMethod HTTPMethod;
@property (nonatomic, strong) NSDictionary *headers;

@property (nonatomic, strong) id<AWSURLRequestSerializer> requestSerializer;
@property (nonatomic, strong) NSArray *requestInterceptors; // Array of AWSNetworkingRequestInterceptor.
@property (nonatomic, strong) id<AWSHTTPURLResponseSerializer> responseSerializer;
@property (nonatomic, strong) NSArray *responseInterceptors; // Array of AWSNetworkingResponseInterceptor.
@property (nonatomic, strong) id<AWSURLRequestRetryHandler> retryHandler;

+ (instancetype)defaultConfiguration;

@end

#pragma mark - AWSNetworkingRequest

@interface AWSNetworkingRequest : AWSNetworkingConfiguration

@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) NSURL *uploadingFileURL;
@property (nonatomic, strong) NSURL *downloadingFileURL;
@property (nonatomic, assign) BOOL shouldWriteDirectly;

@property (nonatomic, copy) AWSNetworkingUploadProgressBlock uploadProgress;
@property (nonatomic, copy) AWSNetworkingDownloadProgressBlock downloadProgress;

@property (readonly, nonatomic, strong) NSURLSessionTask *task;
@property (readonly, nonatomic, assign, getter = isCancelled) BOOL cancelled;

+ (instancetype)requestForDataTask:(AWSHTTPMethod)HTTPMethod
                         URLString:(NSString *)URLString;
+ (instancetype)requestForDownloadTask:(AWSHTTPMethod)HTTPMethod
                             URLString:(NSString *)URLString
                    downloadingFileURL:(NSURL *)downloadingFileURL;
+ (instancetype)requestForUploadTask:(AWSHTTPMethod)HTTPMethod
                           URLString:(NSString *)URLString
                    uploadingFileURL:(NSURL *)uploadingFileURL;

- (void)assignProperties:(AWSNetworkingConfiguration *)configuration;
- (void)cancel;
- (void)pause;

@end

@interface AWSRequest : AWSModel

@property (nonatomic, copy) AWSNetworkingUploadProgressBlock uploadProgress;
@property (nonatomic, copy) AWSNetworkingDownloadProgressBlock downloadProgress;
@property (nonatomic, assign, readonly, getter = isCancelled) BOOL cancelled;
@property (nonatomic, strong) NSURL *downloadingFileURL;

- (BFTask *)cancel;
- (BFTask *)pause;

@end

@interface AWSNetworkingRequestInterceptor : NSObject <AWSNetworkingRequestInterceptor>

@end
