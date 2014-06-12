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
//
//#import "AZURLConnectionManager.h"
//
//#import "AWSService.h"
//
//@class AZURLConnectionManagerDelegate;
//
//@interface AZURLConnectionManager()
//
//- (AZNetworkingTask *)downloadTaskWithDelegate:(AZURLConnectionManagerDelegate *)delegate;
//
//@end
//
//#pragma mark - AZURLConnectionManagerDelegate
//
//@interface AZURLConnectionManagerDelegate : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
//
//@property (nonatomic, copy) AZNetworkingCompletionHandlerBlock completionHandler;
//@property (nonatomic, copy) AZNetworkingUploadProgressBlock uploadProgress;
//@property (nonatomic, copy) AZNetworkingDownloadProgressBlock downloadProgress;
//@property (nonatomic, strong) NSHTTPURLResponse *httpResponse;
//@property (nonatomic, strong) NSMutableData *tmpRawResponseData;
//@property (nonatomic, strong) id responseObject;
//@property (nonatomic, strong) NSError *error;
//@property (nonatomic, strong) AZNetworkingRequest *request;
//@property (nonatomic, strong) NSURLConnection *task;
//@property (nonatomic, weak) AZURLConnectionManager *connectionManager;
//@property (nonatomic, assign) uint32_t currentRetryCount;
//
//@end
//
//@implementation AZURLConnectionManagerDelegate
//
//#pragma mark - NSURLConnectionDelegate Methods
//
//-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
//    if (!self.error) {
//        self.error = error;
//    }
//
//    if (!self.error) {
//        AZNetworkingCompletionHandlerBlock  completionHandler = self.completionHandler;
//        if (completionHandler) {
//            completionHandler(self.task, self.responseObject, nil);
//        }
//    } else {
//        if (!self.task.isCancelled
//            && [self.request.retryHandler shouldRetry:self.currentRetryCount
//                                             response:self.httpResponse
//                                                 data:nil
//                                                error:self.error]) {
//                self.currentRetryCount++;
//                [self.connectionManager downloadTaskWithDelegate:self];
//            }
//        else {
//            AZNetworkingCompletionHandlerBlock  completionHandler = self.completionHandler;
//            if (completionHandler) {
//                completionHandler(self.task, nil, error);
//            }
//        }
//    }
//}
//
//#pragma mark - NSURLConnectionDataDelegate Methods
//
//-(void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {
//    AZNetworkingUploadProgressBlock uploadProgress = self.uploadProgress;
//    if (uploadProgress) {
//        uploadProgress(self.task, bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
//    }
//}
//
//-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
//    // A response has been received, this is where we initialize the instance var you created
//    // so that we can append data to it in the didReceiveData method
//    // Furthermore, this method is called each time there is a redirect so reinitializing it
//    // also serves to clear it
//    if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
//        self.httpResponse = (NSHTTPURLResponse *)response;
//        self.tmpRawResponseData = [NSMutableData new];
//    }
//}
//
//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
//    // Append the new data to the instance variable you declared
//    [self.tmpRawResponseData appendData:data];
//}
//
//-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
//    // The request is complete and data has been received
//    // You can parse the stuff in your instance variable now
//    NSError *error = nil;
//    self.responseObject = [self.request.responseSerializer responseObjectForResponse:self.httpResponse
//                                                                     originalRequest:connection.originalRequest
//                                                                      currentRequest:connection.currentRequest
//                                                                                data:self.tmpRawResponseData
//                                                                               error:&error];
//    if(!self.error) {
//        self.error = error;
//    }
//    if(!self.error) {
//        AZNetworkingCompletionHandlerBlock  completionHandler = self.completionHandler;
//        if (completionHandler) {
//            completionHandler(self.task, self.responseObject, nil);
//        }
//    } else {
//        AZNetworkingCompletionHandlerBlock  completionHandler = self.completionHandler;
//        if (completionHandler) {
//            completionHandler(self.task, nil, error);
//        }
//    }
//}
//
//-(NSCachedURLResponse*)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
//    // Return nil to indicate not necessary to store a cached response for this connection
//    return nil;
//}
//
//@end
//
//#pragma mark - AZURLConnectionManager
//
//@implementation AZURLConnectionManager
//
//- (instancetype)init {
//    if (self = [super init]) {
//    }
//
//    return self;
//}
//
//- (AZNetworkingTask *)taskWithRequest:(AZNetworkingRequest *)request
//                    completionHandler:(AZNetworkingCompletionHandlerBlock)completionHandler {
//    AZURLConnectionManagerDelegate *delegate = [AZURLConnectionManagerDelegate new];
//    delegate.completionHandler = completionHandler;
//    delegate.uploadProgress = request.uploadProgress;
//    delegate.downloadProgress = request.downloadProgress;
//    delegate.request = request;
//    delegate.connectionManager = self;
//
//    return [self downloadTaskWithDelegate:delegate];
//}
//
//- (AZNetworkingTask *)downloadTaskWithDelegate:(AZURLConnectionManagerDelegate *)delegate {
//    if (!delegate.task) {
//        delegate.task = [AZNetworkingTask new];
//    }
//
//    NSMutableURLRequest *request = [NSMutableURLRequest new];
//    NSError *error = nil;
//
//    if ([delegate.request.requestSerializer respondsToSelector:@selector(serializeRequest:headers:parameters:error:)]) {
//        [delegate.request.requestSerializer serializeRequest:request
//                                                     headers:delegate.request.headers
//                                                  parameters:delegate.request.parameters
//                                                       error:&error];
//    }
//
//    for(id<AZNetworkingRequestInterceptor>interceptor in delegate.request.requestInterceptors) {
//        if ([interceptor respondsToSelector:@selector(interceptRequest:error:)]) {
//            [interceptor interceptRequest:request error:&error];
//            if (error) {
//                AZNetworkingCompletionHandlerBlock  completionHandler = delegate.completionHandler;
//                if (completionHandler) {
//                    completionHandler(delegate.task, nil, error);
//                }
//                return delegate.task;
//            }
//        }
//    }
//
//    if (!error) {
//        if ([delegate.request.requestSerializer respondsToSelector:@selector(validateRequest:error:)]) {
//            if (![delegate.request.requestSerializer validateRequest:request error:&error]) {
//                AZNetworkingCompletionHandlerBlock  completionHandler = delegate.completionHandler;
//                if (completionHandler) {
//                    completionHandler(delegate.task, nil, error);
//                }
//                return delegate.task;
//            }
//        }
//
//        NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request
//                                                                         delegate:delegate
//                                                                 startImmediately:NO];
//
//        if ([delegate.task respondsToSelector:@selector(setTask:)]) {
//            [delegate.task performSelector:@selector(setTask:) withObject:urlConnection];
//        }
//
//        [urlConnection start];
//    }
//    
//    return delegate.task;
//}
//
//@end
