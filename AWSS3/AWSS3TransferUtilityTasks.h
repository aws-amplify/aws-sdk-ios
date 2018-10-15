//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

NS_ASSUME_NONNULL_BEGIN



@class AWSS3TransferUtilityTask;
@class AWSS3TransferUtilityUploadTask;
@class AWSS3TransferUtilityMultiPartUploadTask;
@class AWSS3TransferUtilityDownloadTask;
@class AWSS3TransferUtilityExpression;
@class AWSS3TransferUtilityUploadExpression;
@class AWSS3TransferUtilityMultiPartUploadExpression;
@class AWSS3TransferUtilityDownloadExpression;

typedef NS_ENUM(NSInteger, AWSS3TransferUtilityTransferStatusType) {
    AWSS3TransferUtilityTransferStatusUnknown,
    AWSS3TransferUtilityTransferStatusInProgress,
    AWSS3TransferUtilityTransferStatusPaused,
    AWSS3TransferUtilityTransferStatusCompleted,
    AWSS3TransferUtilityTransferStatusWaiting,
    AWSS3TransferUtilityTransferStatusError,
    AWSS3TransferUtilityTransferStatusCancelled
};

/**
 The upload completion handler.
 
 @param task  The upload task object.
 @param error Returns the error object when the download failed.
 */
typedef void (^AWSS3TransferUtilityUploadCompletionHandlerBlock) (AWSS3TransferUtilityUploadTask *task,
                                                                  NSError * _Nullable error);

/**
 The upload completion handler for MultiPart.
 
 @param task  The upload task object.
 @param error Returns the error object when the download failed.
 */
typedef void (^AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock) (AWSS3TransferUtilityMultiPartUploadTask *task,
                                                                           NSError * _Nullable error);

/**
 The download completion handler.
 
 @param task     The download task object.
 @param location When downloading an Amazon S3 object to a file, returns a file URL of the returned object. Otherwise, returns `nil`.
 @param data     When downloading an Amazon S3 object as an `NSData`, returns the returned object as an instance of `NSData`. Otherwise, returns `nil`.
 @param error    Returns the error object when the download failed. Returns `nil` on successful downlaod.
 */
typedef void (^AWSS3TransferUtilityDownloadCompletionHandlerBlock) (AWSS3TransferUtilityDownloadTask *task,
                                                                    NSURL * _Nullable location,
                                                                    NSData * _Nullable data,
                                                                    NSError * _Nullable error);

/**
 The transfer progress feedback block.
 
 @param task                     The upload task object.
 @param progress                 The progress object.
 
 @note Refer to `- URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:` in `NSURLSessionTaskDelegate` for more details on upload progress and `- URLSession:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:` in `NSURLSessionDownloadDelegate` for more details on download progress.
 */
typedef void (^AWSS3TransferUtilityProgressBlock) (AWSS3TransferUtilityTask *task,
                                                   NSProgress *progress);

/**
 The multi part transfer progress feedback block.
 
 @param task                     The upload task object.
 @param progress                 The progress object.
 */
typedef void (^AWSS3TransferUtilityMultiPartProgressBlock) (AWSS3TransferUtilityMultiPartUploadTask *task,
                                                            NSProgress *progress);


#pragma mark - AWSS3TransferUtilityTasks

/**
 The task object to represent a upload or download task.
 */
@interface AWSS3TransferUtilityTask : NSObject

/**
 An identifier uniquely identifies the transferID.
 */

@property (readonly) NSString *transferID;

/**
 An identifier uniquely identifies the task within a given `AWSS3TransferUtility` instance.
 */
@property (readonly) NSUInteger taskIdentifier;

/**
 The Amazon S3 bucket name associated with the transfer.
 */
@property (readonly) NSString *bucket;

/**
 The Amazon S3 object key name associated with the transfer.
 */
@property (readonly) NSString *key;

/**
 The transfer progress.
 */
@property (readonly) NSProgress *progress;

/**
 the status of the Transfer.
 */
@property (readonly) AWSS3TransferUtilityTransferStatusType status;

/**
 The underlying `NSURLSessionTask` object.
 */
@property (readonly) NSURLSessionTask *sessionTask;

/**
 The HTTP request object.
 */
@property (nullable, readonly) NSURLRequest *request;

/**
 The HTTP response object. May be nil if no response has been received.
 */
@property (nullable, readonly) NSHTTPURLResponse *response;

/**
 Cancels the task.
 */
- (void)cancel;

/**
 Resumes the task, if it is suspended.
 */
- (void)resume;

/**
 Temporarily suspends a task.
 */
- (void)suspend;

@end

/**
 The task object to represent a upload task.
 */
@interface AWSS3TransferUtilityUploadTask : AWSS3TransferUtilityTask

/**
 set completion handler for task
 **/

- (void) setCompletionHandler: (AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler;

/**
 Set the progress Block
 */
- (void) setProgressBlock: (AWSS3TransferUtilityProgressBlock) progressBlock;

@end

/**
 The task object to represent a multipart upload task.
 */
@interface AWSS3TransferUtilityMultiPartUploadTask: NSObject

/**
 An identifier uniquely identifies the transferID.
 */
@property (readonly) NSString *transferID;

/**
 The Amazon S3 bucket name associated with the transfer.
 */
@property (readonly) NSString *bucket;

/**
 The Amazon S3 object key name associated with the transfer.
 */
@property (readonly) NSString *key;

/**
 The transfer progress.
 */
@property (readonly) NSProgress *progress;

/**
 the status of the Transfer.
 */
@property (readonly) AWSS3TransferUtilityTransferStatusType status;


/**
 Cancels the task.
 */
- (void)cancel;

/**
 Resumes the task, if it is suspended.
 */
- (void)resume;

/**
 Temporarily suspends a task.
 */
- (void)suspend;

/**
 set completion handler for task
 **/

- (void) setCompletionHandler: (AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)completionHandler;

/**
 Set the progress Block
 */
- (void) setProgressBlock: (AWSS3TransferUtilityMultiPartProgressBlock) progressBlock;

@end


/**
 The task object to represent a download task.
 */
@interface AWSS3TransferUtilityDownloadTask : AWSS3TransferUtilityTask
/**
 set completion handler for task
 **/
- (void) setCompletionHandler: (AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler;

/**
 Set the progress Block
 */
- (void) setProgressBlock: (AWSS3TransferUtilityProgressBlock) progressBlock;

@end

@interface AWSS3TransferUtilityUploadSubTask: NSObject
@end

#pragma mark - AWSS3TransferUtilityExpressions

/**
 The expression object for configuring a upload or download task.
 */
@interface AWSS3TransferUtilityExpression : NSObject

/**
 This NSDictionary can contains additional request headers to be included in the pre-signed URL. Default is emtpy.
 */
@property (nonatomic, readonly) NSDictionary<NSString *, NSString *> *requestHeaders;

/**
 This NSDictionary can contains additional request parameters to be included in the pre-signed URL. Adding additional request parameters enables more advanced pre-signed URLs, such as accessing Amazon S3's torrent resource for an object, or for specifying a version ID when accessing an object. Default is emtpy.
 */
@property (nonatomic, readonly) NSDictionary<NSString *, NSString *> *requestParameters;

/**
 The progress feedback block.
 */
@property (copy, nonatomic, nullable) AWSS3TransferUtilityProgressBlock progressBlock;

/**
 Set an additional request header to be included in the pre-signed URL.
 
 @param value The value of the request parameter being added. Set to nil if parameter doesn't contains value.
 @param requestHeader The name of the request header.
 */
- (void)setValue:(nullable NSString *)value forRequestHeader:(NSString *)requestHeader;

/**
 Set an additional request parameter to be included in the pre-signed URL. Adding additional request parameters enables more advanced pre-signed URLs, such as accessing Amazon S3's torrent resource for an object, or for specifying a version ID when accessing an object.
 
 @param value The value of the request parameter being added. Set to nil if parameter doesn't contains value.
 @param requestParameter The name of the request parameter, as it appears in the URL's query string (e.g. AWSS3PresignedURLVersionID).
 */
- (void)setValue:(nullable NSString *)value forRequestParameter:(NSString *)requestParameter;

@end

/**
 The expression object for configuring a upload task.
 */
@interface AWSS3TransferUtilityUploadExpression : AWSS3TransferUtilityExpression

/**
 The upload request header for `Content-MD5`.
 */
@property (nonatomic, nullable) NSString *contentMD5;

@end


/**
 The expression object for configuring a Multipart upload task.
 */
@interface AWSS3TransferUtilityMultiPartUploadExpression : NSObject

/**
 This NSDictionary can contains additional request headers to be included in the pre-signed URL. Default is emtpy.
 */
@property (nonatomic, readonly) NSDictionary<NSString *, NSString *> *requestHeaders;

/**
 This NSDictionary can contains additional request parameters to be included in the pre-signed URL. Adding additional request parameters enables more advanced pre-signed URLs, such as accessing Amazon S3's torrent resource for an object, or for specifying a version ID when accessing an object. Default is emtpy.
 */
@property (nonatomic, readonly) NSDictionary<NSString *, NSString *> *requestParameters;

/**
 The progress feedback block.
 */
@property (copy, nonatomic, nullable) AWSS3TransferUtilityMultiPartProgressBlock progressBlock;

/**
 Set an additional request header to be included in the pre-signed URL.
 
 
 @param value The value of the request parameter being added. Set to nil if parameter doesn't contains value.
 @param requestHeader The name of the request header.
 */
- (void)setValue:(nullable NSString *)value forRequestHeader:(NSString *)requestHeader;

/**
 Set an additional request parameter to be included in the pre-signed URL. Adding additional request parameters enables more advanced pre-signed URLs, such as accessing Amazon S3's torrent resource for an object, or for specifying a version ID when accessing an object.
 
 @param value The value of the request parameter being added. Set to nil if parameter doesn't contains value.
 @param requestParameter The name of the request parameter, as it appears in the URL's query string (e.g. AWSS3PresignedURLVersionID).
 */
- (void)setValue:(nullable NSString *)value forRequestParameter:(NSString *)requestParameter;



@end

/**
 The expression object for configuring a download task.
 */
@interface AWSS3TransferUtilityDownloadExpression : AWSS3TransferUtilityExpression

@end

NS_ASSUME_NONNULL_END

