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

#import "AWSS3TransferUtility.h"
#import "AWSS3PreSignedURL.h"
#import "AWSS3Service.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSXMLDictionary.h"

#import "AWSFMDB.h"
#import "AWSS3TransferUtility+Validation.h"

// Public constants
NSString *const AWSS3TransferUtilityErrorDomain = @"com.amazonaws.AWSS3TransferUtilityErrorDomain";
NSString *const AWSS3TransferUtilityURLSessionDidBecomeInvalidNotification = @"com.amazonaws.AWSS3TransferUtility.AWSS3TransferUtilityURLSessionDidBecomeInvalidNotification";


// Private constants
static NSString *const AWSS3TransferUtilityIdentifier = @"com.amazonaws.AWSS3TransferUtility.Identifier";
static NSTimeInterval const AWSS3TransferUtilityTimeoutIntervalForResource = 50 * 60; // 50 minutes
static NSString *const AWSS3TransferUtilityUserAgent = @"transfer-utility";
static NSString *const AWSInfoS3TransferUtility = @"S3TransferUtility";
static NSString *const AWSS3TransferUtilityRetryExceeded = @"AWSS3TransferUtilityRetryExceeded";
static NSString *const AWSS3TransferUtilityRetrySucceeded = @"AWSS3TransferUtilityRetrySucceeded";
static NSUInteger const AWSS3TransferUtilityMultiPartSize = 5 * 1024 * 1024;
static NSString *const AWSS3TransferUtiltityRequestTimeoutErrorCode = @"RequestTimeout";
static int const AWSS3TransferUtilityMultiPartDefaultConcurrencyLimit = 5;

#pragma mark - Private classes

@interface AWSS3TransferUtilityUploadSubTask: NSObject
@end

@interface AWSS3TransferUtilityUploadSubTask()
@property (strong, nonatomic) NSURLSessionTask *sessionTask;
@property (strong, nonatomic) NSNumber *partNumber;
@property (readwrite) NSUInteger taskIdentifier;
@property (strong, nonatomic) NSString *eTag;
@property int64_t totalBytesExpectedToSend;
@property int64_t totalBytesSent;
@property NSString *responseData;
@property NSString *file;
@property NSString *transferID;
@property NSString *status;
@property NSString *uploadID;

@end

@interface AWSS3TransferUtility() <NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

@property (strong, nonatomic) AWSServiceConfiguration *configuration;
@property (strong, nonatomic) AWSS3TransferUtilityConfiguration *transferUtilityConfiguration;
@property (strong, nonatomic) AWSS3PreSignedURLBuilder *preSignedURLBuilder;
@property (strong, nonatomic) AWSS3 *s3;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSString *sessionIdentifier;
@property (strong, nonatomic) NSString *cacheDirectoryPath;
@property (strong, nonatomic) AWSSynchronizedMutableDictionary *taskDictionary;
@property (copy, nonatomic) void (^backgroundURLSessionCompletionHandler)(void);
@property (strong, nonatomic) AWSFMDatabaseQueue *databaseQueue;
@end

@interface AWSS3TransferUtilityTask()

@property (strong, nonatomic) NSURLSessionTask *sessionTask;
@property (strong, nonatomic) NSString *transferID;
@property (strong, nonatomic) NSString *bucket;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSData *data;
@property (strong, nonatomic) NSURL *location;
@property (strong, nonatomic) NSError *error;
@property int retryCount;
@property NSString *nsURLSessionID;
@property NSString *file;
@property NSString *transferType;
@property NSString *status;
@property (strong) AWSFMDatabaseQueue *databaseQueue;
@end

@interface AWSS3TransferUtilityUploadTask()

@property (strong, nonatomic) AWSS3TransferUtilityUploadExpression *expression;
@property NSString *responseData;
@property (atomic) BOOL cancelled;
@property BOOL temporaryFileCreated;
@end

@interface AWSS3TransferUtilityMultiPartUploadTask()

@property (strong, nonatomic) AWSS3TransferUtilityMultiPartUploadExpression *expression;
@property NSString * uploadID;
@property BOOL cancelled;
@property BOOL temporaryFileCreated;
@property NSMutableDictionary <NSNumber *, AWSS3TransferUtilityUploadSubTask *> *waitingPartsDictionary;
@property (strong, nonatomic) NSMutableDictionary <NSNumber *, AWSS3TransferUtilityUploadSubTask *> *completedPartsDictionary;
@property (strong, nonatomic) NSMutableDictionary <NSNumber *, AWSS3TransferUtilityUploadSubTask *> *inProgressPartsDictionary;
@property int retryCount;
@property int partNumber;
@property NSString *file;
@property NSString *transferType;
@property NSString *nsURLSessionID;
@property (strong) AWSFMDatabaseQueue *databaseQueue;
@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) NSString *bucket;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSString *transferID;
@property NSString *status;
@property NSNumber *contentLength;
@end

@interface AWSS3TransferUtilityDownloadTask()

@property (strong, nonatomic) AWSS3TransferUtilityDownloadExpression *expression;
@property BOOL cancelled;
@property NSString *responseData;
@end

@interface AWSS3TransferUtilityExpression()

@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestHeaders;

@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestParameters;

- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;
- (void)assignRequestHeaders:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;

@end

@interface AWSS3TransferUtilityUploadExpression()

@property (copy, atomic) AWSS3TransferUtilityUploadCompletionHandlerBlock completionHandler;

@end

@interface AWSS3TransferUtilityMultiPartUploadExpression()

@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestHeaders;
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestParameters;
- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;
@property (copy, atomic) AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock completionHandler;

@end


@interface AWSS3TransferUtilityDownloadExpression()

@property (copy, atomic) AWSS3TransferUtilityDownloadCompletionHandlerBlock completionHandler;

@end

@interface AWSS3PreSignedURLBuilder()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end


@interface AWSS3()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end


@interface AWSS3GetPreSignedURLRequest()
@property NSString *uploadID;
@property NSNumber *partNumber;
@end

@interface AWSS3CreateMultipartUploadRequest()
+ (NSValueTransformer *)ACLJSONTransformer;
+ (NSValueTransformer *)storageClassJSONTransformer;
+ (NSValueTransformer *)serverSideEncryptionJSONTransformer;
+ (NSValueTransformer *)requestPayerJSONTransformer;
+ (NSValueTransformer *)expiresJSONTransformer;

@end

#pragma mark - AWSS3TransferUtility

@implementation AWSS3TransferUtility

static AWSSynchronizedMutableDictionary *_serviceClients = nil;
static AWSS3TransferUtility *_defaultS3TransferUtility = nil;

#pragma mark - Initialization methods

+ (instancetype)defaultS3TransferUtility {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSS3TransferUtilityConfiguration *transferUtilityConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoS3TransferUtility];
       
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            NSNumber *accelerateModeEnabled = [serviceInfo.infoDictionary valueForKey:@"AccelerateModeEnabled"];
            transferUtilityConfiguration = [AWSS3TransferUtilityConfiguration new];
            NSString *bucketName = [serviceInfo.infoDictionary valueForKey:@"Bucket"];
            transferUtilityConfiguration.bucket = bucketName;
            transferUtilityConfiguration.accelerateModeEnabled = [accelerateModeEnabled boolValue];
        }
        
        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }
        
        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        
        _defaultS3TransferUtility = [[AWSS3TransferUtility alloc] initWithConfiguration:serviceConfiguration
                                                           transferUtilityConfiguration:transferUtilityConfiguration
                                                                             identifier:nil];
    });
    
    return _defaultS3TransferUtility;
}

+ (void)registerS3TransferUtilityWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    [self registerS3TransferUtilityWithConfiguration:configuration
                        transferUtilityConfiguration:[AWSS3TransferUtilityConfiguration new]
                                              forKey:key];
}

+ (void)registerS3TransferUtilityWithConfiguration:(AWSServiceConfiguration *)configuration
                      transferUtilityConfiguration:(AWSS3TransferUtilityConfiguration *)transferUtilityConfiguration
                                            forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    
    AWSS3TransferUtility *s3TransferUtility = [[AWSS3TransferUtility alloc] initWithConfiguration:configuration
                                                                     transferUtilityConfiguration:transferUtilityConfiguration
                                                                                       identifier:[NSString stringWithFormat:@"%@.%@", AWSS3TransferUtilityIdentifier, key]];
    [_serviceClients setObject:s3TransferUtility
                        forKey:key];
}

+ (instancetype)S3TransferUtilityForKey:(NSString *)key {
    @synchronized(self) {
        AWSS3TransferUtility *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }
        
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoS3TransferUtility
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                    credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            
            NSNumber *accelerateModeEnabled = [serviceInfo.infoDictionary valueForKey:@"AccelerateModeEnabled"];
            AWSS3TransferUtilityConfiguration *transferUtilityConfiguration = [AWSS3TransferUtilityConfiguration new];
            transferUtilityConfiguration.accelerateModeEnabled = [accelerateModeEnabled boolValue];
            
            [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:serviceConfiguration
                                                transferUtilityConfiguration:transferUtilityConfiguration
                                                                      forKey:key];
        }
        
        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeS3TransferUtilityForKey:(NSString *)key {
    AWSS3TransferUtility *transferUtility = [self S3TransferUtilityForKey:key];
    if (transferUtility) {
        [transferUtility.session invalidateAndCancel];
    }
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultS3TransferUtility` or `+ S3TransferUtilityForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)serviceConfiguration
         transferUtilityConfiguration:(AWSS3TransferUtilityConfiguration *)transferUtilityConfiguration
                           identifier:(NSString *)identifier {
    if (self = [super init]) {
        _configuration = [serviceConfiguration copy];
        [_configuration addUserAgentProductToken:AWSS3TransferUtilityUserAgent];
        
        _transferUtilityConfiguration = [transferUtilityConfiguration copy];
        
        _preSignedURLBuilder = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:_configuration];
        _s3 = [[AWSS3 alloc] initWithConfiguration:_configuration];
        
        if (identifier) {
            _sessionIdentifier = identifier;
        }
        else {
             NSString *uuid = [[NSUUID UUID] UUIDString];
            _sessionIdentifier = [AWSS3TransferUtilityIdentifier stringByAppendingString:uuid];
        }
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:_sessionIdentifier];
        configuration.allowsCellularAccess = serviceConfiguration.allowsCellularAccess;
        if(serviceConfiguration.timeoutIntervalForResource > 0){
            configuration.timeoutIntervalForResource = serviceConfiguration.timeoutIntervalForResource;
        }else{
            configuration.timeoutIntervalForResource = AWSS3TransferUtilityTimeoutIntervalForResource;
        }
        if(serviceConfiguration.timeoutIntervalForRequest > 0){
            configuration.timeoutIntervalForRequest = serviceConfiguration.timeoutIntervalForRequest;
        }
        configuration.sharedContainerIdentifier = serviceConfiguration.sharedContainerIdentifier;
        
        _session = [NSURLSession sessionWithConfiguration:configuration
                                                 delegate:self
                                            delegateQueue:nil];
        
        _taskDictionary = [AWSSynchronizedMutableDictionary new];
        
        // Creates a temporary directory for data uploads in the caches directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachePath = [paths objectAtIndex:0];
        
        _cacheDirectoryPath = [cachePath stringByAppendingPathComponent:AWSInfoS3TransferUtility];
        AWSDDLogDebug(@"Temporary dir Path is %@", _cacheDirectoryPath);
        
        NSURL *directoryURL = [NSURL fileURLWithPath:_cacheDirectoryPath];
        NSError *error = nil;
        BOOL result = [[NSFileManager defaultManager] createDirectoryAtURL:directoryURL
                                               withIntermediateDirectories:YES
                                                                attributes:nil
                                                                     error:&error];
        if (!result) {
            AWSDDLogError(@"Failed to create a temporary directory: %@", error);
        }
       
        //Instantiate the Database Helper
        self.databaseQueue = [self createDatabase];
    }
    return self;
}

#pragma mark - recovery methods

- (void) recover:(void (^)(AWSS3TransferUtilityUploadTask *uploadTask,
                           AWSS3TransferUtilityProgressBlock *uploadProgressBlockReference,
                           AWSS3TransferUtilityUploadCompletionHandlerBlock *completionHandlerReference))uploadBlocksAssigner
multiPartUploadBlocksAssigner: (void (^) (AWSS3TransferUtilityMultiPartUploadTask *multiPartUploadTask,
                                          AWSS3TransferUtilityMultiPartProgressBlock *multiPartUploadProgressBlockReference,
                                          AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock *completionHandlerReference)) multiPartUploadBlocksAssigner
downloadBlocksAssigner:(void (^)(AWSS3TransferUtilityDownloadTask *downloadTask,
                                 AWSS3TransferUtilityProgressBlock *downloadProgressBlockReference,
                                 AWSS3TransferUtilityDownloadCompletionHandlerBlock *completionHandlerReference))downloadBlocksAssigner
                                completionHandler:(void (^)(NSError *_Nullable error)) completionHandler {
   
    //Create temporary datastructures to hold the database records.
    NSMutableDictionary *multiPartUploads = [NSMutableDictionary new];
    NSMutableDictionary *transferRequests = [NSMutableDictionary new];
    
    //Get All Tasks from DB
    NSMutableArray *tasks = [self getTransferTaskDataFromDB:_sessionIdentifier];
    
    
    //Iterate through the tasks and populate
    for( NSMutableDictionary *task in tasks ) {
        NSString *transferType = [task objectForKey:@"transfer_type"];
        int sessionTaskID = [[task objectForKey:@"session_task_id"] intValue];
        
        if ([transferType isEqualToString:@"UPLOAD"]) {
            AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = [AWSS3TransferUtilityUploadTask new];
            transferUtilityUploadTask.nsURLSessionID = self.sessionIdentifier;
            transferUtilityUploadTask.databaseQueue = self.databaseQueue;
            transferUtilityUploadTask.bucket = [task objectForKey:@"bucket"];
            transferUtilityUploadTask.key = [task objectForKey:@"key"];
            transferUtilityUploadTask.expression = [AWSS3TransferUtilityUploadExpression new];
            transferUtilityUploadTask.expression.internalRequestHeaders = [[self getDictionaryFromJson:[task objectForKey:@"request_headers"]] mutableCopy];
            transferUtilityUploadTask.expression.internalRequestParameters = [[self getDictionaryFromJson:[task objectForKey:@"request_parameters"]] mutableCopy];
            transferUtilityUploadTask.transferID = [task objectForKey:@"transfer_id"];
            transferUtilityUploadTask.file = [task objectForKey:@"file"];
            transferUtilityUploadTask.cancelled = NO;
            transferUtilityUploadTask.retryCount = [[task objectForKey:@"retry_count"] intValue];
            transferUtilityUploadTask.temporaryFileCreated = [[task objectForKey:@"temporary_file_created"] boolValue];
            transferUtilityUploadTask.status = [task objectForKey:@"status"];
            
            //Add the progress block and callback function
            if (uploadBlocksAssigner) {
                AWSS3TransferUtilityProgressBlock progressBlock = nil;
                AWSS3TransferUtilityUploadCompletionHandlerBlock completionHandler = nil;
                
                uploadBlocksAssigner(transferUtilityUploadTask, &progressBlock, &completionHandler);
                
                if (progressBlock) {
                    transferUtilityUploadTask.expression.progressBlock = progressBlock;
                }
                if (completionHandler) {
                    transferUtilityUploadTask.expression.completionHandler = completionHandler;
                }
            }
            
            //Lodge in temporary Dictionary
            [transferRequests setObject:transferUtilityUploadTask forKey:@(sessionTaskID)];
        }
        else if ([transferType isEqualToString:@"DOWNLOAD"]) {
            AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask = [AWSS3TransferUtilityDownloadTask new];
            transferUtilityDownloadTask.nsURLSessionID = self.sessionIdentifier;
            transferUtilityDownloadTask.databaseQueue = self.databaseQueue;
            transferUtilityDownloadTask.bucket = [task objectForKey:@"bucket"];
            transferUtilityDownloadTask.key = [task objectForKey:@"key"];
            transferUtilityDownloadTask.expression = [AWSS3TransferUtilityDownloadExpression new];
            transferUtilityDownloadTask.expression.internalRequestHeaders = [[self getDictionaryFromJson:[task objectForKey:@"request_headers"]] mutableCopy];
            transferUtilityDownloadTask.expression.internalRequestParameters = [[self getDictionaryFromJson:[task objectForKey:@"request_parameters"]] mutableCopy];
            transferUtilityDownloadTask.transferID = [task objectForKey:@"transfer_id"];
            transferUtilityDownloadTask.file = [task objectForKey:@"file"];
            transferUtilityDownloadTask.cancelled = NO;
            transferUtilityDownloadTask.retryCount = [[task objectForKey:@"retry_count"] intValue];
            transferUtilityDownloadTask.status = [task objectForKey:@"status"];
            
            //Add the progress block and callback Function
            if (downloadBlocksAssigner) {
                AWSS3TransferUtilityProgressBlock progressBlock = nil;
                AWSS3TransferUtilityDownloadCompletionHandlerBlock completionHandler = nil;
                
                downloadBlocksAssigner(transferUtilityDownloadTask, &progressBlock, &completionHandler);
                
                if (progressBlock) {
                    transferUtilityDownloadTask.expression.progressBlock = progressBlock;
                }
                if (completionHandler) {
                    transferUtilityDownloadTask.expression.completionHandler = completionHandler;
                }
            }
            
            //Lodge in temporary Dictionary
            [transferRequests setObject:transferUtilityDownloadTask forKey:@(sessionTaskID)];
            
            [self.taskDictionary setObject:transferUtilityDownloadTask forKey:@(sessionTaskID) ];
            AWSDDLogDebug(@"Added Download Transfer task %d to task dictionary", sessionTaskID);
        }
        else if ([transferType isEqualToString:@"MULTI_PART_UPLOAD"]) {
            AWSS3TransferUtilityMultiPartUploadTask *transferUtilityMultiPartUploadTask = [AWSS3TransferUtilityMultiPartUploadTask new];
            transferUtilityMultiPartUploadTask.nsURLSessionID = self.sessionIdentifier;
            transferUtilityMultiPartUploadTask.databaseQueue = self.databaseQueue;
            transferUtilityMultiPartUploadTask.bucket = [task objectForKey:@"bucket"];
            transferUtilityMultiPartUploadTask.key = [task objectForKey:@"key"];
            transferUtilityMultiPartUploadTask.expression = [AWSS3TransferUtilityMultiPartUploadExpression new];
            transferUtilityMultiPartUploadTask.expression.internalRequestHeaders = [[self getDictionaryFromJson:[task objectForKey:@"request_headers"]] mutableCopy];
            transferUtilityMultiPartUploadTask.expression.internalRequestParameters = [[self getDictionaryFromJson:[task objectForKey:@"request_parameters"]] mutableCopy];
            transferUtilityMultiPartUploadTask.transferID = [task objectForKey:@"transfer_id"];
            transferUtilityMultiPartUploadTask.file = [task objectForKey:@"file"];
            transferUtilityMultiPartUploadTask.temporaryFileCreated = [[task objectForKey:@"temporary_file_created"] boolValue];
            transferUtilityMultiPartUploadTask.contentLength = [task objectForKey:@"content_length"];
            transferUtilityMultiPartUploadTask.cancelled = NO;
            transferUtilityMultiPartUploadTask.retryCount = [[task objectForKey:@"retry_count"] intValue];
            transferUtilityMultiPartUploadTask.uploadID = [task objectForKey:@"multi_part_id"];
            
             //Add the progress block and callback Function
            if (multiPartUploadBlocksAssigner) {
                AWSS3TransferUtilityMultiPartProgressBlock progressBlock = nil;
                AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock completionHandler = nil;
                multiPartUploadBlocksAssigner(transferUtilityMultiPartUploadTask, &progressBlock, &completionHandler);
                if (progressBlock) {
                    transferUtilityMultiPartUploadTask.expression.progressBlock = progressBlock;
                }
                if (completionHandler) {
                    transferUtilityMultiPartUploadTask.expression.completionHandler = completionHandler;
                }
            }
            [multiPartUploads setObject:transferUtilityMultiPartUploadTask forKey:transferUtilityMultiPartUploadTask.uploadID];
        }
        else if ([transferType isEqualToString:@"MULTI_PART_UPLOAD_SUB_TASK"]) {
            AWSS3TransferUtilityUploadSubTask *subTask = [AWSS3TransferUtilityUploadSubTask new];
            subTask.taskIdentifier = sessionTaskID;
            subTask.file = [task objectForKey:@"file"];
            subTask.partNumber = [task objectForKey:@"part_number"];
            subTask.eTag =[task objectForKey:@"etag"];
            subTask.uploadID = [task objectForKey:@"multi_part_id"];
            subTask.status = [task objectForKey:@"status"];
            subTask.transferID = [task objectForKey:@"transfer_id"];
            subTask.totalBytesExpectedToSend = [[task objectForKey:@"content_length"] integerValue];
            
            //Lodge in temporary Dictionary
            [transferRequests setObject:subTask forKey:@(sessionTaskID)];
          
        }
    }
    
    //Reattach to the NSURLsession objects
    [self.session getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
     
        if ([dataTasks count] != 0) {
            AWSDDLogError(@"The underlying NSURLSession contains data tasks. This should not happen.");
        }
       
        //Loop through all the upload Tasks.
        for( NSURLSessionUploadTask *task in uploadTasks ) {
           
            //Get the Task
            id obj = [transferRequests objectForKey:@(task.taskIdentifier)];
            
            if ([obj isKindOfClass:[AWSS3TransferUtilityUploadTask class]])
            {
                
                //Found a upload task.
                AWSS3TransferUtilityUploadTask *uploadTask = obj;
                uploadTask.sessionTask = task;
                [self.taskDictionary setObject:uploadTask forKey:@(uploadTask.taskIdentifier)];
                AWSDDLogDebug(@"Added Upload Transfer task %@ to task dictionary", @(uploadTask.taskIdentifier));
                
                //Remove this object from the transferRequests list
                [transferRequests removeObjectForKey:@(task.taskIdentifier)];
                
                //Check if it is InProgress
                if ([uploadTask.status isEqualToString:AWSS3TransferUtilityInProgressStatus]) {
                     //Check if the the underlying task is completed. If so, delete the record from the DB, clean up any temp files  and call the completion handler.
                    if ([task state] == NSURLSessionTaskStateCompleted) {
                        [self.taskDictionary removeObjectForKey:@(uploadTask.taskIdentifier)];
                        if (uploadTask.temporaryFileCreated) {
                            [self removeFile:uploadTask.file];
                        }
                        [self deleteTransferRequestFromDB:uploadTask.transferID databaseQueue:self->_databaseQueue];
                        if(uploadTask.expression.completionHandler) {
                            uploadTask.expression.completionHandler(uploadTask,nil);
                        }
                        continue;
                    }
                    //If it is in any other status than running, then we need to recover by retrying.
                    if ([task state] != NSURLSessionTaskStateRunning) {
                        //We think the task in IN_PROGRESS. The underlying task is not running.
                        //Recover the situation by retrying.
                        [self retryUpload:uploadTask];
                        continue;
                    }
                }
            }
            else if ([obj isKindOfClass:[AWSS3TransferUtilityUploadSubTask class]]) {
               //Found a upload subtask.
                AWSS3TransferUtilityUploadSubTask *subTaskObj = obj;
                subTaskObj.sessionTask = task;
                AWSS3TransferUtilityMultiPartUploadTask *multiPartUploadTask = [multiPartUploads objectForKey:subTaskObj.uploadID];
                
                [self.taskDictionary setObject:multiPartUploadTask forKey:@(task.taskIdentifier)];
                AWSDDLogDebug(@"Added MP task[%@] for session ID: %@",multiPartUploadTask.uploadID, @(task.taskIdentifier));
                
                //Remove this object from the transferRequests list
                [transferRequests removeObjectForKey:@(task.taskIdentifier)];
                
                //Check if it is is already completed. If it is, add it to the completed parts list and go to the next iteration of the loop
                if ([subTaskObj.status isEqualToString:AWSS3TransferUtilityCompletedStatus]) {
                    [multiPartUploadTask.completedPartsDictionary setObject:subTaskObj forKey:@(task.taskIdentifier)];
                    multiPartUploadTask.progress.completedUnitCount += subTaskObj.totalBytesExpectedToSend;
                    continue;
                }
                
                //Check if it is in Waiting status. If it is, add it to the waiting parts list and go to the next iteration of the loop.
                if ([subTaskObj.status isEqualToString:AWSS3TransferUtilityWaitingStatus]) {
                    [multiPartUploadTask.waitingPartsDictionary setObject:subTaskObj forKey:@(task.taskIdentifier)];
                    continue;
                }
               
                //Add it to the InProgress list
                [multiPartUploadTask.inProgressPartsDictionary setObject:subTaskObj forKey:@(task.taskIdentifier)];
                
                //Check if it is in Paused status. If it is, there is nothing more to do.
                if ([subTaskObj.status isEqualToString:AWSS3TransferUtilityPausedStatus]) {
                    continue;
                }
                
                //The only state that it can be now is in IN_PROGRESS. Check if the underlying NSURLSessionTask is Not running.
                if ([task state] != NSURLSessionTaskStateRunning) {
                    AWSDDLogDebug(@"SubTask %lu is in %@ according to DB, but the underlying task is not running. Retrying", (unsigned long)subTaskObj.taskIdentifier,
                                  subTaskObj.status);
                    //We think the task in IN_PROGRESS. The underlying task is not running.
                    //Recover the situation by retrying.
                    [self retryUploadSubTask:multiPartUploadTask subTask:subTaskObj];
                }
            }
            else {
                AWSDDLogWarn(@"Object not found in taskDictionary for %lu. Ignoring.",(unsigned long)task.taskIdentifier);
            }
        }
        
        for( NSURLSessionDownloadTask *task in downloadTasks ) {
            id obj = [self.taskDictionary objectForKey:@(task.taskIdentifier)];
            if ([obj isKindOfClass:[AWSS3TransferUtilityDownloadTask class]])
            {
                //Found a download task
                AWSS3TransferUtilityDownloadTask *downloadTask = obj;
                downloadTask.sessionTask = task;
                [self.taskDictionary setObject:downloadTask forKey:@(downloadTask.taskIdentifier)];
                
                //Remove this request from the transferRequests list.
                [transferRequests removeObjectForKey:@(task.taskIdentifier)];
                
                //Check if this is in progress
                if ([downloadTask.status isEqualToString:AWSS3TransferUtilityInProgressStatus]) {
                    //Check if the underlying task's status is not in Progress.
                    if ([task state] != NSURLSessionTaskStateRunning) {
                        //We think the task in Progress. The underlying task is not in progress.
                        //Recover the situation by retrying
                        [self retryDownload:downloadTask];
                        continue;
                    }
                }
            }
            else {
                AWSDDLogError(@"Object not found in taskDictionary for %lu",(unsigned long)task.taskIdentifier);
            }
        }
        
        //Finished iterating through the tasks present in the NSURLSession.
        //If there are any left in the transferRequests list, it means that we think they are running, but NSURLSession doesn't know about them.
        //We will ignore these tasks for now.
        
        //Call the completion handler if one was provided.
        if (completionHandler) {
            completionHandler(nil);
        }
                
    }];
}


#pragma mark - Upload methods

- (AWSTask<AWSS3TransferUtilityUploadTask *> *)uploadData:(NSData *)data
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(AWSS3TransferUtilityUploadExpression *)expression
                                        completionHandler:(AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler {
    return [self uploadData:data
                     bucket:self.transferUtilityConfiguration.bucket
                        key:key
                contentType:contentType
                 expression:expression
          completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityUploadTask *> *)uploadData:(NSData *)data
                                                   bucket:(NSString *)bucket
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(AWSS3TransferUtilityUploadExpression *)expression
                                        completionHandler:(AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler {
    
    // Saves the data as a file in the temporary directory.
    NSString *fileName = [NSString stringWithFormat:@"%@.tmp", [[NSProcessInfo processInfo] globallyUniqueString]];
    NSString *filePath = [self.cacheDirectoryPath stringByAppendingPathComponent:fileName];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    
    NSError *error = nil;
    BOOL result = [data writeToURL:fileURL
                           options:NSDataWritingAtomic
                             error:&error];
    if (!result) {
        if (completionHandler) {
            AWSS3TransferUtilityUploadTask *uploadTask = [AWSS3TransferUtilityUploadTask new];
            uploadTask.bucket = bucket;
            uploadTask.key = key;
            completionHandler(uploadTask,error);
        }
        return [AWSTask taskWithError:error];
    }
    
    return [self internalUploadFile:fileURL
                     bucket:bucket
                        key:key
                contentType:contentType
                 expression:expression
       temporaryFileCreated:YES
          completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityUploadTask *> *)uploadFile:(NSURL *)fileURL
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(AWSS3TransferUtilityUploadExpression *)expression
                                        completionHandler:(AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler {
    return [self uploadFile:fileURL
                     bucket:self.transferUtilityConfiguration.bucket
                        key:key
                contentType:contentType
                 expression:expression
          completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityUploadTask *> *)uploadFile:(NSURL *)fileURL
                                                   bucket:(NSString *)bucket
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(AWSS3TransferUtilityUploadExpression *)expression
                                        completionHandler:(AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler {
    return [self internalUploadFile:fileURL
                             bucket:bucket
                             key:key
                     contentType:contentType
                      expression:expression
            temporaryFileCreated:NO
               completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityUploadTask *> *)internalUploadFile:(NSURL *)fileURL
                                                   bucket:(NSString *)bucket
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(AWSS3TransferUtilityUploadExpression *)expression
                                     temporaryFileCreated: (BOOL) temporaryFileCreated
                                        completionHandler:(AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler {
    //Validate input parameters.
    AWSTask *error = [self validateParameters:bucket fileURL:fileURL accelerationModeEnabled:self.transferUtilityConfiguration.isAccelerateModeEnabled];
    if (error) {
        if (temporaryFileCreated) {
            [self removeFile:[fileURL path]];
        }
        return error;
    }
    
    //Create Expression if required and set it up
    if (!expression) {
        expression = [AWSS3TransferUtilityUploadExpression new];
    }
    [expression setValue:contentType forRequestHeader:@"Content-Type"];
    expression.completionHandler = completionHandler;
    
    //Create TransferUtility Upload Task
    AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = [AWSS3TransferUtilityUploadTask new];
    transferUtilityUploadTask.nsURLSessionID = self.sessionIdentifier;
    transferUtilityUploadTask.databaseQueue = self.databaseQueue;
    transferUtilityUploadTask.bucket = bucket;
    transferUtilityUploadTask.key = key;
    transferUtilityUploadTask.retryCount = 0;
    transferUtilityUploadTask.expression = expression;
    transferUtilityUploadTask.transferID = [[NSUUID UUID] UUIDString];
    transferUtilityUploadTask.file = [fileURL path];
    transferUtilityUploadTask.cancelled = NO;
    transferUtilityUploadTask.temporaryFileCreated = temporaryFileCreated;
    transferUtilityUploadTask.responseData = @"";

    return [self createUploadTask:transferUtilityUploadTask];
}

-(AWSTask<AWSS3TransferUtilityUploadTask *> *) createUploadTask: (AWSS3TransferUtilityUploadTask *) transferUtilityUploadTask {
    //Create PreSigned URL Request
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = transferUtilityUploadTask.bucket;
    getPreSignedURLRequest.key = transferUtilityUploadTask.key;
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:AWSS3TransferUtilityTimeoutIntervalForResource];
    getPreSignedURLRequest.minimumCredentialsExpirationInterval = AWSS3TransferUtilityTimeoutIntervalForResource;
    getPreSignedURLRequest.accelerateModeEnabled = self.transferUtilityConfiguration.isAccelerateModeEnabled;
    
    [transferUtilityUploadTask.expression assignRequestHeaders:getPreSignedURLRequest];
    [transferUtilityUploadTask.expression assignRequestParameters:getPreSignedURLRequest];
    
    return [[self.preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        NSURL *presignedURL = task.result;
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        request.HTTPMethod = @"PUT";
        
        [request setValue:self.configuration.userAgent forHTTPHeaderField:@"User-Agent"];
        
        for (NSString *key in transferUtilityUploadTask.expression.requestHeaders) {
            [request setValue: transferUtilityUploadTask.expression.requestHeaders[key] forHTTPHeaderField:key];
        }
        AWSDDLogDebug(@"Request headers:\n%@", request.allHTTPHeaderFields);
        
        NSURLSessionUploadTask *uploadTask = [self.session uploadTaskWithRequest:request
                                                                        fromFile:[NSURL fileURLWithPath:transferUtilityUploadTask.file]];
        transferUtilityUploadTask.sessionTask = uploadTask;
        
        AWSDDLogDebug(@"Setting taskIdentifier to %@", @(transferUtilityUploadTask.sessionTask.taskIdentifier));
        
        //Add to task Dictionary
        [self.taskDictionary setObject:transferUtilityUploadTask forKey:@(transferUtilityUploadTask.sessionTask.taskIdentifier) ];
        
        //Add to Database
        [self insertUploadTransferRequestInDB:transferUtilityUploadTask databaseQueue:self->_databaseQueue];
        [uploadTask resume];
        return [AWSTask taskWithResult:transferUtilityUploadTask];
    }];
}


- (void) retryUpload: (AWSS3TransferUtilityUploadTask *) transferUtilityUploadTask {
    //Remove from taskDictionary
    [self.taskDictionary removeObjectForKey:@(transferUtilityUploadTask.taskIdentifier)];
   
    //Remove from Database
    [self deleteTransferRequestFromDB:transferUtilityUploadTask.transferID taskIdentifier:transferUtilityUploadTask.taskIdentifier databaseQueue:_databaseQueue ];
    
    AWSDDLogDebug(@"Removed object from key %@", @(transferUtilityUploadTask.taskIdentifier) );
    transferUtilityUploadTask.retryCount = transferUtilityUploadTask.retryCount + 1;
    
    //This will update the AWSS3TransferUtilityUploadTask passed into it with a new URL Session
    //task and add it into the task Dictionary.
    [self createUploadTask:transferUtilityUploadTask];
}

#pragma mark - MultiPart Upload methods

- (AWSTask<AWSS3TransferUtilityMultiPartUploadTask *> *)uploadDataUsingMultiPart:(NSData *)data
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(AWSS3TransferUtilityMultiPartUploadExpression *)expression
                                        completionHandler:(AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)completionHandler {
    return [self uploadDataUsingMultiPart:data
                     bucket:self.transferUtilityConfiguration.bucket
                        key:key
                contentType:contentType
                 expression:expression
          completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityMultiPartUploadTask *> *)uploadDataUsingMultiPart:(NSData *)data
                                                   bucket:(NSString *)bucket
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(AWSS3TransferUtilityMultiPartUploadExpression *)expression
                                        completionHandler:(AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)completionHandler {
    
    // Saves the data as a file in the temporary directory.
    NSString *fileName = [NSString stringWithFormat:@"%@.tmp", [[NSProcessInfo processInfo] globallyUniqueString]];
    NSString *filePath = [self.cacheDirectoryPath stringByAppendingPathComponent:fileName];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    
    NSError *error = nil;
    BOOL result = [data writeToURL:fileURL
                           options:NSDataWritingAtomic
                             error:&error];
    if (!result) {
        if (completionHandler) {
            AWSS3TransferUtilityMultiPartUploadTask *uploadTask = [AWSS3TransferUtilityMultiPartUploadTask new];
            uploadTask.bucket = bucket;
            uploadTask.key = key;
            completionHandler(uploadTask, error);
        }
        return [AWSTask taskWithError:error];
    }
    
    return [self internalUploadFileUsingMultiPart:fileURL
                     bucket:bucket
                        key:key
                contentType:contentType
                 expression:expression
                 temporaryFileCreated:YES
          completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityMultiPartUploadTask *> *)uploadFileUsingMultiPart:(NSURL *)fileURL
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(AWSS3TransferUtilityMultiPartUploadExpression *)expression
                                        completionHandler:(AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)completionHandler {
    return [self uploadFileUsingMultiPart:fileURL
                     bucket:self.transferUtilityConfiguration.bucket
                        key:key
                contentType:contentType
                    expression:expression
          completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityMultiPartUploadTask *> *)uploadFileUsingMultiPart:(NSURL *)fileURL
                                                                          bucket:(NSString *)bucket
                                                                             key:(NSString *)key
                                                                     contentType:(NSString *)contentType
                                                                      expression:(AWSS3TransferUtilityMultiPartUploadExpression *)expression
                                                               completionHandler:(AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock) completionHandler
{
    return [self internalUploadFileUsingMultiPart:fileURL
                                           bucket:bucket
                                              key:key
                                      contentType:contentType
                                       expression:expression
                             temporaryFileCreated:NO
                                completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityMultiPartUploadTask *> *)internalUploadFileUsingMultiPart:(NSURL *)fileURL
                                                   bucket:(NSString *)bucket
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(AWSS3TransferUtilityMultiPartUploadExpression *)expression
                                     temporaryFileCreated: (BOOL) temporaryFileCreated
                                        completionHandler:(AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock) completionHandler {
    
    //Validate input parameters.
    AWSTask *error = [self validateParameters:bucket fileURL:fileURL accelerationModeEnabled:self.transferUtilityConfiguration.isAccelerateModeEnabled];
    if (error) {
        if (temporaryFileCreated) {
            [self removeFile:[fileURL path]];
        }
        return error;
    }
    
    //Create Expression if required and set values on the object
    if (!expression) {
        expression = [AWSS3TransferUtilityMultiPartUploadExpression new];
    }
    
    //Override the content type value set in the expression object with the passed in parameter value. 
    if (contentType) {
      [expression setValue:contentType forRequestHeader:@"Content-Type"];
    }
    
    expression.completionHandler = completionHandler;
    
    //Create TransferUtility Multipart Upload Task
    AWSS3TransferUtilityMultiPartUploadTask *transferUtilityMultiPartUploadTask = [AWSS3TransferUtilityMultiPartUploadTask new];
    transferUtilityMultiPartUploadTask.nsURLSessionID = self.sessionIdentifier;
    transferUtilityMultiPartUploadTask.databaseQueue = self.databaseQueue;
    transferUtilityMultiPartUploadTask.bucket = bucket;
    transferUtilityMultiPartUploadTask.key = key;
    transferUtilityMultiPartUploadTask.expression = expression;
    transferUtilityMultiPartUploadTask.transferID = [[NSUUID UUID] UUIDString];
    transferUtilityMultiPartUploadTask.file = [fileURL path];
    transferUtilityMultiPartUploadTask.retryCount = 0;
    transferUtilityMultiPartUploadTask.temporaryFileCreated = temporaryFileCreated;
    
    //Get the size of the file and calculate the number of parts.
    NSError *nsError = nil;
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[fileURL path]
                                                                error:&nsError];
    if (!attributes) {
        if (transferUtilityMultiPartUploadTask.temporaryFileCreated) {
            [self removeFile:transferUtilityMultiPartUploadTask.file];
        }
        return [AWSTask taskWithError:nsError];
    }
    unsigned long long fileSize = [attributes fileSize];
    AWSDDLogDebug(@"File size is %llu", fileSize);
    NSUInteger partCount = ceil((float)fileSize /(unsigned long) AWSS3TransferUtilityMultiPartSize);
    AWSDDLogDebug(@"Number of parts is %lu", (unsigned long) partCount);
    transferUtilityMultiPartUploadTask.progress.totalUnitCount = fileSize;
    transferUtilityMultiPartUploadTask.progress.completedUnitCount = (long long) 0;
    transferUtilityMultiPartUploadTask.cancelled = NO;
    transferUtilityMultiPartUploadTask.contentLength = [ [NSNumber alloc] initWithUnsignedLongLong:fileSize];
    
    //Create the initial request to start the multipart process.
    AWSS3CreateMultipartUploadRequest *uploadRequest = [AWSS3CreateMultipartUploadRequest new];
    uploadRequest.bucket = bucket;
    uploadRequest.key = key;

    [self propagateHeaderInformation:uploadRequest expression:transferUtilityMultiPartUploadTask.expression];
    
    //Initiate the multi part
    return [[self.s3 createMultipartUpload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        //Initiation of multi part failed.
        if (task.error) {
            if (transferUtilityMultiPartUploadTask.temporaryFileCreated) {
                [self removeFile:transferUtilityMultiPartUploadTask.file];
            }
            return [AWSTask taskWithError:task.error];
        }
        //Get the uploadID. This will be used with every part that we will upload.
        AWSS3CreateMultipartUploadOutput *output = task.result;
        transferUtilityMultiPartUploadTask.uploadID = output.uploadId;
        
        //Save the Multipart Upload in the DB
        [self insertMultiPartUploadRequestInDB:transferUtilityMultiPartUploadTask databaseQueue:self->_databaseQueue];
        
        AWSDDLogInfo(@"Initiated multipart upload on server: %@", output.uploadId);
        AWSDDLogInfo(@"Concurrency Limit is %@", self.transferUtilityConfiguration.multiPartConcurrencyLimit);
        //Loop through the file and upload the parts one by one
        for (int32_t i = 1; i < partCount + 1; i++) {
            NSUInteger dataLength = AWSS3TransferUtilityMultiPartSize;
            if (i == partCount) {
                dataLength = fileSize - ( (i-1) * AWSS3TransferUtilityMultiPartSize);
            }
           
            AWSS3TransferUtilityUploadSubTask *subTask = [AWSS3TransferUtilityUploadSubTask new];
            subTask.transferID = transferUtilityMultiPartUploadTask.transferID;
            subTask.partNumber = @(i);
            subTask.totalBytesExpectedToSend = dataLength;
            subTask.totalBytesSent = (long long) 0;
            subTask.responseData = @"";
            subTask.file = nil;
            
            //Move to inProgress or Waiting based on concurrency limit
            if (i <= [self.transferUtilityConfiguration.multiPartConcurrencyLimit integerValue]) {
                subTask.status = AWSS3TransferUtilityInProgressStatus;
                [self createUploadSubTask:transferUtilityMultiPartUploadTask subTask:subTask];
            }
            else {
                subTask.status = AWSS3TransferUtilityWaitingStatus;
                [transferUtilityMultiPartUploadTask.waitingPartsDictionary setObject:subTask forKey:subTask.partNumber];
            }
        }
        return [AWSTask taskWithResult:transferUtilityMultiPartUploadTask];
    }];
    return [AWSTask taskWithResult:transferUtilityMultiPartUploadTask];
}

-(NSString *) createTemporaryFileForPart: (NSString *) fileName
                              partNumber: (long) partNumber
                              dataLength: (NSUInteger) dataLength {
    //Create a temporary file for this part.
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:fileName];
    [fileHandle seekToFileOffset:(partNumber - 1) * AWSS3TransferUtilityMultiPartSize];
    NSData *partData = [fileHandle readDataOfLength:dataLength];
    NSString *partFile = [self.cacheDirectoryPath stringByAppendingPathComponent:[[NSUUID UUID] UUIDString]];
    NSURL *tempURL = [NSURL fileURLWithPath:partFile];
    [partData writeToURL:tempURL atomically:YES];
    partData = nil;
    [fileHandle closeFile];
    return partFile;
}

-(void) propagateHeaderInformation: (AWSS3CreateMultipartUploadRequest *) uploadRequest
                        expression: (AWSS3TransferUtilityMultiPartUploadExpression *) expression {
    
    //Propagate header info and add custom metadata
    NSMutableDictionary<NSString *, NSString *> *metadata = [NSMutableDictionary new];
    for (NSString *key in expression.requestHeaders) {
        NSString *lKey = [key lowercaseString];
        if ([lKey hasPrefix:@"x-amz-meta"]) {
            [metadata setValue:expression.requestHeaders[key] forKey:[key stringByReplacingOccurrencesOfString:@"x-amz-meta-" withString:@""]];
        }
        else if ([lKey isEqualToString:@"x-amz-acl"]) {
            NSValueTransformer *transformer = [AWSS3CreateMultipartUploadRequest ACLJSONTransformer];
            uploadRequest.ACL = (AWSS3ObjectCannedACL)[[transformer transformedValue:expression.requestHeaders[key]] integerValue];
        }
        else if ([lKey isEqualToString:@"x-amz-grant-read" ]) {
            uploadRequest.grantRead = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-grant-read-acp" ]) {
            uploadRequest.grantReadACP = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-grant-read-acp" ]) {
            uploadRequest.grantReadACP = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-grant-write-acp" ]) {
            uploadRequest.grantWriteACP = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-grant-full-control" ]) {
            uploadRequest.grantFullControl = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-server-side-encryption" ]) {
            NSValueTransformer *transformer = [AWSS3CreateMultipartUploadRequest serverSideEncryptionJSONTransformer];
            uploadRequest.serverSideEncryption = (AWSS3ServerSideEncryption)[[transformer transformedValue:expression.requestHeaders[key]] integerValue];
        }
        else if ([lKey isEqualToString:@"x-amz-server-side-encryption-aws-kms-key-id" ]) {
            uploadRequest.SSEKMSKeyId = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-server-side​-encryption​-customer-algorithm" ]) {
            uploadRequest.SSECustomerAlgorithm = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-server-side​-encryption​-customer-key" ]) {
            uploadRequest.SSECustomerKey = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-server-side​-encryption​-customer-key-MD5" ]) {
            uploadRequest.SSECustomerKeyMD5 = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"content-encoding" ]) {
            uploadRequest.contentEncoding = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"content-type" ]) {
            uploadRequest.contentType = expression.requestHeaders[key];
        }
        else if([lKey isEqualToString:@"cache-control"]) {
            uploadRequest.cacheControl = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-request-payer" ]) {
            NSValueTransformer *transformer = [AWSS3CreateMultipartUploadRequest requestPayerJSONTransformer];
            uploadRequest.requestPayer = (AWSS3RequestPayer)[[transformer transformedValue:expression.requestHeaders[key]] integerValue];
        }
        else if ([lKey isEqualToString:@"expires" ]) {
            NSValueTransformer *transformer = [AWSS3CreateMultipartUploadRequest expiresJSONTransformer];
            uploadRequest.expires = [transformer transformedValue:expression.requestHeaders[key]];
        }
        else if ([lKey isEqualToString:@"x-amz-storage-class" ]) {
            NSValueTransformer *transformer = [AWSS3CreateMultipartUploadRequest storageClassJSONTransformer];
            uploadRequest.storageClass = (AWSS3StorageClass)[[transformer transformedValue:expression.requestHeaders[key]] integerValue];
        }
        else if ([lKey isEqualToString:@"x-amz-website-redirect-location" ]) {
            uploadRequest.websiteRedirectLocation = expression.requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-tagging" ]) {
            uploadRequest.tagging = expression.requestHeaders[key];
        }
    }
    uploadRequest.metadata = metadata;
}

-(void) filterAndAssignHeaders:(NSDictionary<NSString *, NSString *> *) requestHeaders
           getPresignedURLRequest:(AWSS3GetPreSignedURLRequest *) getPresignedURLRequest
                    URLRequest: (NSMutableURLRequest *) URLRequest {
    
    NSSet *disallowedHeaders = [[NSSet alloc] initWithArray:
                                @[@"x-amz-acl", @"x-amz-tagging", @"x-amz-storage-class", @"x-amz-server-side-encryption"]];
   
    for (NSString *key in requestHeaders) {
        //Do not include custom metadata or custom grants
        NSString *lKey = [key lowercaseString];
        if ([ lKey hasPrefix:@"x-amz-meta"] || [lKey hasPrefix:@"x-amz-grant"]) {
            continue;
        }
        if ([disallowedHeaders containsObject:lKey]) {
            continue;
        }
        [getPresignedURLRequest setValue:requestHeaders[key] forRequestHeader:key];
        [URLRequest setValue:requestHeaders[key] forHTTPHeaderField:key];
    }
}

-(void) createUploadSubTask:(AWSS3TransferUtilityMultiPartUploadTask *) transferUtilityMultiPartUploadTask
                    subTask: (AWSS3TransferUtilityUploadSubTask *) subTask
{
    if (!subTask.file ) {
        //Create a temporary file for this part.
        NSString * partFileName = [self createTemporaryFileForPart:transferUtilityMultiPartUploadTask.file partNumber:[subTask.partNumber integerValue] dataLength:subTask.totalBytesExpectedToSend];
        subTask.file = partFileName;
    }
    
    //Create a presignedURL for this part.
    AWSS3GetPreSignedURLRequest *request = [AWSS3GetPreSignedURLRequest new];
    request.bucket = transferUtilityMultiPartUploadTask.bucket;
    request.key = transferUtilityMultiPartUploadTask.key;
    request.partNumber = subTask.partNumber;
    request.uploadID = transferUtilityMultiPartUploadTask.uploadID;
    request.HTTPMethod = AWSHTTPMethodPUT;
    
    request.expires = [NSDate dateWithTimeIntervalSinceNow:AWSS3TransferUtilityTimeoutIntervalForResource];
    request.minimumCredentialsExpirationInterval = AWSS3TransferUtilityTimeoutIntervalForResource;
    request.accelerateModeEnabled = self.transferUtilityConfiguration.isAccelerateModeEnabled;
    [self filterAndAssignHeaders:transferUtilityMultiPartUploadTask.expression.requestHeaders getPresignedURLRequest:request
                      URLRequest:nil];
    
    [transferUtilityMultiPartUploadTask.expression assignRequestParameters:request];
   
    [[self.preSignedURLBuilder getPreSignedURL:request] continueWithSuccessBlock:^id(AWSTask *task) {
        NSURL *presignedURL = task.result;
        NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:presignedURL];
         urlRequest.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
         urlRequest.HTTPMethod = @"PUT";
        [self filterAndAssignHeaders:transferUtilityMultiPartUploadTask.expression.requestHeaders
              getPresignedURLRequest:nil URLRequest: urlRequest];
        [ urlRequest setValue:[self.configuration.userAgent stringByAppendingString:@" MultiPart"] forHTTPHeaderField:@"User-Agent"];
        NSURLSessionUploadTask *nsURLUploadTask = [self->_session uploadTaskWithRequest:urlRequest
                                                                         fromFile:[NSURL fileURLWithPath:subTask.file]];
        //Create subtask to track this upload
        subTask.sessionTask = nsURLUploadTask;
        subTask.taskIdentifier = nsURLUploadTask.taskIdentifier;
        
       
        [transferUtilityMultiPartUploadTask.inProgressPartsDictionary setObject:subTask forKey:@(subTask.taskIdentifier)];
        [nsURLUploadTask resume];
        
        //Also register transferUtilityMultiPartUploadTask into the taskDictionary for easy lookup in the NSURLCallback
        [self->_taskDictionary setObject:transferUtilityMultiPartUploadTask forKey:@(subTask.taskIdentifier)];
        
        //Save in Database
        [self insertMultiPartUploadRequestSubTaskInDB:transferUtilityMultiPartUploadTask subTask:subTask databaseQueue:self.databaseQueue];
        return nil;
    }];
}

-(void) retryUploadSubTask: (AWSS3TransferUtilityMultiPartUploadTask *) transferUtilityMultiPartUploadTask
                   subTask: (AWSS3TransferUtilityUploadSubTask *) subTask {
    
    //Remove from TaskDictionary and inProgressPartsDictionary
    [self.taskDictionary removeObjectForKey:@(subTask.taskIdentifier)];
    [transferUtilityMultiPartUploadTask.inProgressPartsDictionary removeObjectForKey:@(subTask.taskIdentifier)];
    
    //Remove subTask from Database
    [self deleteTransferRequestFromDB:subTask.transferID taskIdentifier:subTask.taskIdentifier databaseQueue:_databaseQueue];
    
    transferUtilityMultiPartUploadTask.retryCount = transferUtilityMultiPartUploadTask.retryCount + 1;
    [self createUploadSubTask:transferUtilityMultiPartUploadTask subTask:subTask];
}

#pragma mark - Download methods

- (AWSTask<AWSS3TransferUtilityDownloadTask *> *)downloadDataForKey:(NSString *)key
                                                             expression:(AWSS3TransferUtilityDownloadExpression *)expression
                                                      completionHandler:(AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler {
    return [self internalDownloadToURL:nil
                                bucket:self.transferUtilityConfiguration.bucket
                                   key:key
                            expression:expression
                     completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityDownloadTask *> *)downloadDataFromBucket:(NSString *)bucket
                                                                    key:(NSString *)key
                                                             expression:(AWSS3TransferUtilityDownloadExpression *)expression
                                                      completionHandler:(AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler {
    return [self internalDownloadToURL:nil
                                bucket:bucket
                                   key:key
                            expression:expression
                     completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityDownloadTask *> *)downloadToURL:(NSURL *)fileURL
                                                           key:(NSString *)key
                                                    expression:(AWSS3TransferUtilityDownloadExpression *)expression
                                             completionHandler:(AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler {
    return [self internalDownloadToURL:fileURL
                                bucket:self.transferUtilityConfiguration.bucket
                                   key:key
                            expression:expression
                     completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityDownloadTask *> *)downloadToURL:(NSURL *)fileURL
                                                        bucket:(NSString *)bucket
                                                           key:(NSString *)key
                                                    expression:(AWSS3TransferUtilityDownloadExpression *)expression
                                             completionHandler:(AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler {
    return [self internalDownloadToURL:fileURL
                                bucket:bucket
                                   key:key
                            expression:expression
                     completionHandler:completionHandler];
}

- (AWSTask<AWSS3TransferUtilityDownloadTask *> *)internalDownloadToURL:(NSURL *)fileURL
                                                                bucket:(NSString *)bucket
                                                                   key:(NSString *)key
                                                            expression:(AWSS3TransferUtilityDownloadExpression *)expression
                                                     completionHandler:(AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler {
    //Validate that bucket has been specified.
    if (!bucket || [bucket length] == 0) {
        NSInteger errorCode = (self.transferUtilityConfiguration.isAccelerateModeEnabled) ?
        AWSS3PresignedURLErrorInvalidBucketNameForAccelerateModeEnabled : AWSS3PresignedURLErrorInvalidBucketName;
        NSString *errorMessage = @"Invalid bucket specified. Please specify a bucket name or configure the bucket property in `AWSS3TransferUtilityConfiguration`.";
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errorMessage
                                               forKey:NSLocalizedDescriptionKey];
        
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                          code:errorCode
                                                      userInfo:userInfo]];
    }
    
    //Create Expression if required and set completion Handler.
    if (!expression) {
        expression = [AWSS3TransferUtilityDownloadExpression new];
    }
    expression.completionHandler = completionHandler;
    
    //Create Download Task and set it up.
    AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask = [AWSS3TransferUtilityDownloadTask new];
    transferUtilityDownloadTask.nsURLSessionID = self.sessionIdentifier;
    transferUtilityDownloadTask.databaseQueue = self.databaseQueue;
    transferUtilityDownloadTask.location = fileURL;
    transferUtilityDownloadTask.bucket = bucket;
    transferUtilityDownloadTask.key = key;
    transferUtilityDownloadTask.expression = expression;
    transferUtilityDownloadTask.transferID = [[NSUUID UUID] UUIDString];
    transferUtilityDownloadTask.file = [fileURL absoluteString];
    transferUtilityDownloadTask.cancelled = NO;
    transferUtilityDownloadTask.retryCount = 0;
    transferUtilityDownloadTask.responseData = @"";
    
    return [self createDownloadTask:transferUtilityDownloadTask];
}

-(AWSTask<AWSS3TransferUtilityDownloadTask *> *) createDownloadTask: (AWSS3TransferUtilityDownloadTask *) transferUtilityDownloadTask {
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = transferUtilityDownloadTask.bucket;
    getPreSignedURLRequest.key = transferUtilityDownloadTask.key;
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:AWSS3TransferUtilityTimeoutIntervalForResource];
    getPreSignedURLRequest.minimumCredentialsExpirationInterval = AWSS3TransferUtilityTimeoutIntervalForResource; //Was  there in upload but not in download
    getPreSignedURLRequest.accelerateModeEnabled = self.transferUtilityConfiguration.isAccelerateModeEnabled;
    
    [transferUtilityDownloadTask.expression assignRequestHeaders:getPreSignedURLRequest];
    [transferUtilityDownloadTask.expression assignRequestParameters:getPreSignedURLRequest];
    
    return [[self.preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        NSURL *presignedURL = task.result;
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        request.HTTPMethod = @"GET";
        
        [request setValue:[AWSServiceConfiguration baseUserAgent] forHTTPHeaderField:@"User-Agent"];
        
        for (NSString *key in transferUtilityDownloadTask.expression.requestHeaders) {
            [request setValue:transferUtilityDownloadTask.expression.requestHeaders[key] forHTTPHeaderField:key];
        }
        
        AWSDDLogDebug(@"Request headers:\n%@", request.allHTTPHeaderFields);
        
        NSURLSessionDownloadTask *downloadTask = [self.session downloadTaskWithRequest:request];
        transferUtilityDownloadTask.sessionTask = downloadTask;
        
        AWSDDLogDebug(@"Setting taskIdentifier to %@", @(transferUtilityDownloadTask.sessionTask.taskIdentifier));
        
        //Add to taskDictionary
        [self.taskDictionary setObject:transferUtilityDownloadTask forKey:@(transferUtilityDownloadTask.sessionTask.taskIdentifier) ];
        
        //Add to Database
        [self insertDownloadTransferRequestInDB:transferUtilityDownloadTask databaseQueue:self->_databaseQueue];
        [downloadTask resume];
        return [AWSTask taskWithResult:transferUtilityDownloadTask];
    }];
}

- (void) retryDownload: (AWSS3TransferUtilityDownloadTask *) transferUtilityDownloadTask {
    
    //Remove from taskDictionary
    [self.taskDictionary removeObjectForKey:@(transferUtilityDownloadTask.sessionTask.taskIdentifier)];
    
    //Remove from Database
    [self deleteTransferRequestFromDB:transferUtilityDownloadTask.transferID taskIdentifier:transferUtilityDownloadTask.sessionTask.taskIdentifier
                        databaseQueue:_databaseQueue];
    
    AWSDDLogDebug(@"Removed object from key %@", @(transferUtilityDownloadTask.sessionTask.taskIdentifier) );
    transferUtilityDownloadTask.retryCount = transferUtilityDownloadTask.retryCount + 1;
    
    //This will update the AWSS3TransferUtilityDownloadTask passed into it with a new URL Session
    //task and add it into the task Dictionary.
    [self createDownloadTask:transferUtilityDownloadTask];
}

#pragma mark - Utility methods

- (void)enumerateToAssignBlocksForUploadTask:(void (^)(AWSS3TransferUtilityUploadTask *uploadTask,
                                                       AWSS3TransferUtilityProgressBlock *uploadProgressBlockReference,
                                                       AWSS3TransferUtilityUploadCompletionHandlerBlock *completionHandlerReference))uploadBlocksAssigner
                                downloadTask:(void (^)(AWSS3TransferUtilityDownloadTask *downloadTask,
                                                       AWSS3TransferUtilityProgressBlock *downloadProgressBlockReference,
                                                       AWSS3TransferUtilityDownloadCompletionHandlerBlock *completionHandlerReference))downloadBlocksAssigner {
    
    // Iterate through Tasks
    for (id key in [self.taskDictionary allKeys]) {
        id value = [self.taskDictionary objectForKey:key];
        if ([value isKindOfClass:[AWSS3TransferUtilityUploadTask class]]) {
            AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = value;
            if (uploadBlocksAssigner) {
                AWSS3TransferUtilityProgressBlock progressBlock = nil;
                AWSS3TransferUtilityUploadCompletionHandlerBlock completionHandler = nil;
                
                uploadBlocksAssigner(transferUtilityUploadTask, &progressBlock, &completionHandler);
                
                if (progressBlock) {
                    transferUtilityUploadTask.expression.progressBlock = progressBlock;
                }
                if (completionHandler) {
                    transferUtilityUploadTask.expression.completionHandler = completionHandler;
                }
            }
        }
        else if ([value isKindOfClass:[AWSS3TransferUtilityDownloadTask class]]) {
            AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask = value;
            if (downloadBlocksAssigner) {
                AWSS3TransferUtilityProgressBlock progressBlock = nil;
                AWSS3TransferUtilityDownloadCompletionHandlerBlock completionHandler = nil;
                
                downloadBlocksAssigner(transferUtilityDownloadTask, &progressBlock, &completionHandler);
                
                if (progressBlock) {
                    transferUtilityDownloadTask.expression.progressBlock = progressBlock;
                }
                if (completionHandler) {
                    transferUtilityDownloadTask.expression.completionHandler = completionHandler;
                }
            }
        }
    }
}

-(void)enumerateToAssignBlocksForUploadTask:(void (^)(AWSS3TransferUtilityUploadTask *uploadTask,
                                                      AWSS3TransferUtilityProgressBlock *uploadProgressBlockReference,
                                                      AWSS3TransferUtilityUploadCompletionHandlerBlock *completionHandlerReference))uploadBlocksAssigner
              multiPartUploadBlocksAssigner: (void (^) (AWSS3TransferUtilityMultiPartUploadTask *multiPartUploadTask,
                                                        AWSS3TransferUtilityMultiPartProgressBlock *multiPartUploadProgressBlockReference,
                                                        AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock *completionHandlerReference)) multiPartUploadBlocksAssigner
                     downloadBlocksAssigner:(void (^)(AWSS3TransferUtilityDownloadTask *downloadTask,
                                                      AWSS3TransferUtilityProgressBlock *downloadProgressBlockReference,
                                                      AWSS3TransferUtilityDownloadCompletionHandlerBlock *completionHandlerReference))downloadBlocksAssigner {
   
    [self enumerateToAssignBlocksForUploadTask:uploadBlocksAssigner  downloadTask:downloadBlocksAssigner];
   
    // Iterate through MultiPartUploadTasks
    for (id key in [self.taskDictionary allKeys]) {
        id value = [self.taskDictionary objectForKey:key];
        if ([value isKindOfClass:[AWSS3TransferUtilityMultiPartUploadTask class]]) {
            AWSS3TransferUtilityMultiPartUploadTask *task = value;
            if (multiPartUploadBlocksAssigner) {
                AWSS3TransferUtilityMultiPartProgressBlock progressBlock = nil;
                AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock completionHandler = nil;
                multiPartUploadBlocksAssigner(task, &progressBlock, &completionHandler);
                if (progressBlock) {
                    task.expression.progressBlock = progressBlock;
                }
                if (completionHandler) {
                    task.expression.completionHandler = completionHandler;
                }
            }
        }
    }
}


- (AWSTask *)getAllTasks {
    AWSTaskCompletionSource *completionSource = [AWSTaskCompletionSource new];
    NSMutableArray *allTasks = [NSMutableArray new];
    for (id key in [self.taskDictionary allKeys]) {
        id value = [self.taskDictionary objectForKey:key];
        //To retain backward compatability, make sure that we filter out Multipart tasks.
        if (! [value isKindOfClass:[AWSS3TransferUtilityMultiPartUploadTask class]]) {
            [allTasks addObject:value];
        }
        [allTasks addObject:[self.taskDictionary objectForKey:key]];
    }
    [completionSource setResult:allTasks];
    return completionSource.task;
}

- (AWSTask *)getUploadTasks {
    AWSTaskCompletionSource *completionSource = [AWSTaskCompletionSource new];
    NSMutableArray *allTasks = [NSMutableArray new];
    
    for (id key in [self.taskDictionary allKeys]) {
        id value = [self.taskDictionary objectForKey:key];
        if ([value isKindOfClass:[AWSS3TransferUtilityUploadTask class]]) {
            [allTasks addObject:value];
        }
    }
    [completionSource setResult:allTasks];
    return completionSource.task;
}

- (AWSTask *)getDownloadTasks {
    AWSTaskCompletionSource *completionSource = [AWSTaskCompletionSource new];
    NSMutableArray *allTasks = [NSMutableArray new];
    
    for (id key in [self.taskDictionary allKeys]) {
        id value = [self.taskDictionary objectForKey:key];
        if ([value isKindOfClass:[AWSS3TransferUtilityDownloadTask class]]) {
            [allTasks addObject:value];
        }
    }
    [completionSource setResult:allTasks];
    return completionSource.task;
}

- (AWSTask *)getMultiPartUploadTasks {
    AWSTaskCompletionSource *completionSource = [AWSTaskCompletionSource new];
    NSMutableArray *allTasks = [NSMutableArray new];
    
    for (id key in [self.taskDictionary allKeys]) {
        id value = [self.taskDictionary objectForKey:key];
        if ([value isKindOfClass:[AWSS3TransferUtilityMultiPartUploadTask class]]) {
            [allTasks addObject:value];
        }
    }
    [completionSource setResult:allTasks];
    return completionSource.task;
}


#pragma mark - Internal helper methods

- (AWSTask *)callFinishMultiPartForUploadTask:(AWSS3TransferUtilityMultiPartUploadTask *)uploadTask {
    
    NSMutableArray *completedParts = [NSMutableArray arrayWithCapacity:[uploadTask.completedPartsDictionary count]];
    NSMutableDictionary *tempDictionary = [NSMutableDictionary new];
    
    //Create a new Dictionary with the partNumber as the Key
    for(id key in uploadTask.completedPartsDictionary) {
        AWSS3TransferUtilityUploadSubTask *subTask = [uploadTask.completedPartsDictionary objectForKey:key];
        [tempDictionary setObject:subTask forKey:subTask.partNumber];
    }
    
    //Compose the request.
    for(int i = 1; i <= [uploadTask.completedPartsDictionary count]; i++) {
        AWSS3TransferUtilityUploadSubTask *subTask = [tempDictionary objectForKey: [NSNumber numberWithInt:i]];
        AWSS3CompletedPart *completedPart = [AWSS3CompletedPart new];
        completedPart.partNumber = subTask.partNumber;
        completedPart.ETag = subTask.eTag;
        [completedParts addObject:completedPart];
    }
    
    AWSS3CompletedMultipartUpload *multipartUpload = [AWSS3CompletedMultipartUpload new];
    multipartUpload.parts = completedParts;
    
    AWSS3CompleteMultipartUploadRequest *compReq = [AWSS3CompleteMultipartUploadRequest new];
    compReq.bucket = uploadTask.bucket;
    compReq.key = uploadTask.key;
    compReq.uploadId = uploadTask.uploadID;
    compReq.multipartUpload = multipartUpload;
    
    return [self.s3 completeMultipartUpload:compReq];
}

- (AWSTask *) callAbortMultiPartForUploadTask:(AWSS3TransferUtilityMultiPartUploadTask *) uploadTask {
    AWSS3AbortMultipartUploadRequest *abortReq = [AWSS3AbortMultipartUploadRequest new];
    abortReq.bucket = uploadTask.bucket;
    abortReq.uploadId = uploadTask.uploadID;
    abortReq.key = uploadTask.key;
    return [self.s3 abortMultipartUpload:abortReq];
}

- (AWSS3TransferUtilityUploadTask *)getUploadTask:(NSURLSessionUploadTask *)uploadTask {
    if (![uploadTask isKindOfClass:[NSURLSessionUploadTask class]]) {
        AWSDDLogError(@"uploadTask is not an instance of NSURLSessionUploadTask.");
        return nil;
    }
    return [self.taskDictionary objectForKey:@(uploadTask.taskIdentifier)];
}

- (AWSS3TransferUtilityDownloadTask *)getDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (![downloadTask isKindOfClass:[NSURLSessionDownloadTask class]]) {
        AWSDDLogError(@"downloadTask is not an instance of NSURLSessionDownloadTask.");
        return nil;
    }
    
    return [self.taskDictionary objectForKey:@(downloadTask.taskIdentifier)];
}

#pragma mark - UIApplicationDelegate interceptor

+ (void)interceptApplication:(UIApplication *)application
handleEventsForBackgroundURLSession:(NSString *)identifier
           completionHandler:(void (^)(void))completionHandler {
    // For the default service client
    if ([identifier isEqualToString:_defaultS3TransferUtility.sessionIdentifier]) {
        _defaultS3TransferUtility.backgroundURLSessionCompletionHandler = completionHandler;
    }
    
    // For the SDK managed service clients
    for (NSString *key in [_serviceClients allKeys]) {
        AWSS3TransferUtility *transferUtility = [_serviceClients objectForKey:key];
        if ([identifier isEqualToString:transferUtility.sessionIdentifier]) {
            transferUtility.backgroundURLSessionCompletionHandler = completionHandler;
        }
    }
}

#pragma mark - NSURLSessionDelegate

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session {
    if (self.backgroundURLSessionCompletionHandler) {
        self.backgroundURLSessionCompletionHandler();
    }
}

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error {
    [[NSNotificationCenter defaultCenter] postNotificationName:AWSS3TransferUtilityURLSessionDidBecomeInvalidNotification object:self];
    
    [_serviceClients removeObject:self];
}

#pragma mark - NSURLSessionTaskDelegate

- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error {
    
    NSHTTPURLResponse *HTTPResponse = nil;
    NSMutableDictionary *userInfo = nil;
    
    if (!error) {
        if (![task.response isKindOfClass:[NSHTTPURLResponse class]]) {
            error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain code:AWSS3TransferUtilityErrorUnknown userInfo:nil];
        }
        else {
            HTTPResponse = (NSHTTPURLResponse *) task.response;
            userInfo = [NSMutableDictionary dictionaryWithDictionary:[HTTPResponse allHeaderFields]];
        }
    
        if (!error) {
            if (HTTPResponse.statusCode / 100 == 3
                && HTTPResponse.statusCode != 304) { // 304 Not Modified is a valid response.
                error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                            code:AWSS3TransferUtilityErrorRedirection
                                        userInfo:userInfo];
            }
            
            if (HTTPResponse.statusCode / 100 == 4) {
                error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                            code:AWSS3TransferUtilityErrorClientError
                                        userInfo:userInfo];
            }
            
            if (HTTPResponse.statusCode / 100 == 5) {
                error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                            code:AWSS3TransferUtilityErrorServerError
                                        userInfo:userInfo];
            }
        }
    }
    
    
    if( [task isKindOfClass:[NSURLSessionUploadTask class]]) {
        
        AWSS3TransferUtilityTask *transferUtilityTask = [self.taskDictionary objectForKey:@(task.taskIdentifier)];
        if (!transferUtilityTask) {
            AWSDDLogDebug(@"Unable to find information for task %lu in taskDictionary", (unsigned long)task.taskIdentifier);
            return;
        }
        if ([transferUtilityTask isKindOfClass:[AWSS3TransferUtilityUploadTask class]]) {
            AWSS3TransferUtilityUploadTask *uploadTask =[self.taskDictionary objectForKey:@(task.taskIdentifier)];

            //Check if the task was cancelled.
            if (uploadTask.cancelled) {
                [self cleanupForUploadTask:uploadTask];
                return;
            }
            
            if (error && HTTPResponse) {
                if ([self isErrorRetriable:HTTPResponse.statusCode responseFromServer:uploadTask.responseData] )  {
                    AWSDDLogDebug(@"Received a 500, 503 or 400 error. Response Data is [%@]", uploadTask.responseData );
                    if (uploadTask.retryCount < self.transferUtilityConfiguration.retryLimit) {
                        AWSDDLogDebug(@"Retry count is below limit and error is retriable. ");
                        [self retryUpload:uploadTask];
                        return;
                    }
                }
                
                if(uploadTask.responseData == nil ||  [uploadTask.responseData isEqualToString:@""]) {
                    [self handleS3Errors: [[NSString alloc] initWithData:[uploadTask data] encoding:NSASCIIStringEncoding]
                                userInfo: userInfo];
                } else {
                    [self handleS3Errors: [uploadTask responseData]
                                userInfo: userInfo];
                }
                NSError *updatedError = [[NSError alloc] initWithDomain:error.domain code:error.code userInfo:userInfo];
                
                uploadTask.error = updatedError;
            }
            
            if(uploadTask.expression.completionHandler) {
                uploadTask.expression.completionHandler(uploadTask,uploadTask.error);
            }
            [self cleanupForUploadTask:uploadTask];
            return;
        }
        else if ([transferUtilityTask isKindOfClass:[AWSS3TransferUtilityMultiPartUploadTask class]]) {
            
            //Get the multipart upload task
            AWSS3TransferUtilityMultiPartUploadTask *transferUtilityMultiPartUploadTask = [self.taskDictionary objectForKey:@(task.taskIdentifier)];
            if (!transferUtilityMultiPartUploadTask) {
                AWSDDLogDebug(@"Unable to find information for task %lu in taskDictionary", (unsigned long)task.taskIdentifier);
                return;
            }
            //Check if the task was cancelled.
            if (transferUtilityMultiPartUploadTask.cancelled) {
                //Abort the request, so the server can clean up any partials.
                [self callAbortMultiPartForUploadTask:transferUtilityMultiPartUploadTask];
                
                //Clean up.
                [self cleanupForMultiPartUploadTask:transferUtilityMultiPartUploadTask];
                return;
            }
            
            //Check if there was an error.
            if (error) {
                
                AWSS3TransferUtilityUploadSubTask *subTask = [transferUtilityMultiPartUploadTask.inProgressPartsDictionary objectForKey:@(task.taskIdentifier)];

                //Retrying if a 500, 503 or 400 RequestTimeout error occured.
                if  ([self isErrorRetriable:HTTPResponse.statusCode responseFromServer:subTask.responseData]) {
                    AWSDDLogDebug(@"Received a 500, 503 or 400 error. Response Data is [%@]", subTask.responseData);
                    if (transferUtilityMultiPartUploadTask.retryCount < self.transferUtilityConfiguration.retryLimit) {
                        AWSDDLogDebug(@"Retry count is below limit and error is retriable. ");
                        [self retryUploadSubTask:transferUtilityMultiPartUploadTask subTask:subTask];
                        return;
                    }
                }
                
                if(subTask.responseData != nil && [subTask.responseData isEqualToString:@""]) {
                    // Transfer's multi-part subtask does not have raw data access, so only check string based response data.
                    [self handleS3Errors: [subTask responseData]
                                userInfo: userInfo];
                }
                NSError *updatedError = [[NSError alloc] initWithDomain:error.domain code:error.code userInfo:userInfo];
                
                //Error is not retriable.
                transferUtilityMultiPartUploadTask.error = updatedError;
                //Execute call back if provided.
                if(transferUtilityMultiPartUploadTask.expression.completionHandler) {
                    transferUtilityMultiPartUploadTask.expression.completionHandler(transferUtilityMultiPartUploadTask, transferUtilityMultiPartUploadTask.error);
                }
                
                //Make sure all the parts are canceled.
                [transferUtilityMultiPartUploadTask cancel];
                
                //Abort the request, so the server can clean up any partials.
                [self callAbortMultiPartForUploadTask:transferUtilityMultiPartUploadTask];
                
                //clean up.
                [self cleanupForMultiPartUploadTask:transferUtilityMultiPartUploadTask];
                return;
            }
            
            //Get multipart upload sub task
            AWSS3TransferUtilityUploadSubTask *subTask = [transferUtilityMultiPartUploadTask.inProgressPartsDictionary objectForKey:@(task.taskIdentifier)];
          
            NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *) task.response;
            subTask.eTag = (NSString *) HTTPResponse.allHeaderFields[@"ETAG"];
            
            //Add it to completed parts and remove it from remaining parts.
            [transferUtilityMultiPartUploadTask.completedPartsDictionary setObject:subTask forKey:@(subTask.taskIdentifier)];
            [transferUtilityMultiPartUploadTask.inProgressPartsDictionary removeObjectForKey:@(subTask.taskIdentifier)];
            
            //Delete the temporary upload file for this subTask
            [self removeFile:subTask.file];
            
            //Update Database
            [self updateTransferRequestInDB:subTask.transferID taskIdentifier:subTask.taskIdentifier eTag:subTask.eTag status:AWSS3TransferUtilityCompletedStatus databaseQueue:_databaseQueue];
            
            //If there are parts waiting to be uploaded, pick one from the list and move it to inProgress
            if ([transferUtilityMultiPartUploadTask.waitingPartsDictionary count] != 0) {
                //Get a part from the waitingList
                AWSS3TransferUtilityUploadSubTask *nextSubTask = [[transferUtilityMultiPartUploadTask.waitingPartsDictionary allValues] objectAtIndex:0];
                
                //Remove it from the waitingList
                [transferUtilityMultiPartUploadTask.waitingPartsDictionary removeObjectForKey:nextSubTask.partNumber];
                
                //Create the subtask and start the transfer
                [self createUploadSubTask:transferUtilityMultiPartUploadTask subTask:nextSubTask];
            }
            //If there are no more inProgress parts, then we are done.
            else if ([transferUtilityMultiPartUploadTask.inProgressPartsDictionary count] == 0) {
                //Call the Multipart completion step here.
                [[ self callFinishMultiPartForUploadTask:transferUtilityMultiPartUploadTask] continueWithBlock:^id (AWSTask *task) {
                    if (task.error) {
                        AWSDDLogError(@"Error finishing up MultiPartForUpload Task[%@]", task.error);
                        transferUtilityMultiPartUploadTask.error = error;
                    }
                    AWSDDLogInfo(@"Completed Multipart Transfer: %@", transferUtilityMultiPartUploadTask.uploadID);
                    [self cleanupForMultiPartUploadTask:transferUtilityMultiPartUploadTask];
                    
                    //Call the callback function is specified.
                    if(transferUtilityMultiPartUploadTask.expression.completionHandler) {
                        transferUtilityMultiPartUploadTask.expression.completionHandler(transferUtilityMultiPartUploadTask,error);
                    }
                    return nil;
                }];
            }
        }
    }
    else if ([task isKindOfClass:[NSURLSessionDownloadTask class]]) {
        AWSS3TransferUtilityDownloadTask *downloadTask = [self.taskDictionary objectForKey:@(task.taskIdentifier)];
        if (!downloadTask) {
            AWSDDLogDebug(@"Unable to find information for task %lu in taskDictionary", (unsigned long)task.taskIdentifier);
            return;
        }

        //Check if the task was cancelled.
        if (downloadTask.cancelled) {
            [self.taskDictionary removeObjectForKey:@(downloadTask.sessionTask.taskIdentifier)];
            [self deleteTransferRequestFromDB:downloadTask.transferID databaseQueue:_databaseQueue];
            return;
        }
        
        if (error && HTTPResponse) {
            if ([self isErrorRetriable:HTTPResponse.statusCode responseFromServer:downloadTask.responseData])  {
                if (downloadTask.retryCount < self.transferUtilityConfiguration.retryLimit) {
                    AWSDDLogDebug(@"Retry count is below limit and error is retriable. ");
                    [self retryDownload:downloadTask];
                    return;
                }
            }
            
            if(downloadTask.responseData == nil ||  [downloadTask.responseData isEqualToString:@""]) {
                [self handleS3Errors: [[NSString alloc] initWithData:[downloadTask data] encoding:NSASCIIStringEncoding]
                            userInfo: userInfo];
            } else {
                [self handleS3Errors: [downloadTask responseData]
                            userInfo: userInfo];
            }
            NSError *updatedError = [[NSError alloc] initWithDomain:error.domain code:error.code userInfo:userInfo];
            downloadTask.error = updatedError;
        }
        
        if (downloadTask.expression.completionHandler) {
            downloadTask.expression.completionHandler(downloadTask,
                                                      downloadTask.location,
                                                      downloadTask.data,
                                                      downloadTask.error);
        }
        [self.taskDictionary removeObjectForKey:@(downloadTask.sessionTask.taskIdentifier)];
        [self deleteTransferRequestFromDB:downloadTask.transferID databaseQueue:_databaseQueue];
    }
}

- (void)handleS3Errors:(NSString *)responseString
            userInfo:(NSMutableDictionary *)userInfo {
  if ([responseString rangeOfString:@"<Error>"].location != NSNotFound) {
    AWSXMLDictionaryParser *xmlParser = [AWSXMLDictionaryParser new];
    xmlParser.trimWhiteSpace = YES;
    xmlParser.stripEmptyNodes = NO;
    xmlParser.wrapRootNode = YES; //wrapRootNode for easy process
    xmlParser.nodeNameMode = AWSXMLDictionaryNodeNameModeNever; //do not need rootName anymore since rootNode is wrapped.
    
    NSDictionary *responseDict = [xmlParser dictionaryWithString: responseString];
    userInfo[@"Error"] = responseDict[@"Error"];
    AWSDDLogError(@"Error response received from S3: %@", responseDict);
  }
}

- (void) cleanupForMultiPartUploadTask: (AWSS3TransferUtilityMultiPartUploadTask *) task  {
    //Remove data from the Database.
    [self deleteTransferRequestFromDB:task.transferID databaseQueue:_databaseQueue];
    
    //Remove all temporary files and entries from taskDictionary.
    for ( AWSS3TransferUtilityUploadSubTask *subTask in [task.inProgressPartsDictionary allValues] ) {
        [self.taskDictionary removeObjectForKey:@(subTask.taskIdentifier)];
        [self removeFile:subTask.file];
    }
    if (task.temporaryFileCreated) {
        [self removeFile:task.file];
    }
}

- (void) cleanupForUploadTask: (AWSS3TransferUtilityUploadTask *) uploadTask {
    [self.taskDictionary removeObjectForKey:@(uploadTask.taskIdentifier)];
    if (uploadTask.temporaryFileCreated) {
        [self removeFile:uploadTask.file];
    }
    [self deleteTransferRequestFromDB:uploadTask.transferID databaseQueue:_databaseQueue];
}

- (BOOL) isErrorRetriable:(NSInteger) HTTPStatusCode
       responseFromServer:(NSString *) responseFromServer {
    
    // See https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html for S3 error responses
    
    //500 and 503 are retriable.
    if (HTTPStatusCode == 500 || HTTPStatusCode == 503) {
        return YES;
    }
    //If not 5XX or 400, error is not retriable.
    if (HTTPStatusCode != 400) {
        return NO;
    }
    
    //If we didn't get any more info from the server, error is retriable
    if (!responseFromServer ||[responseFromServer isEqualToString:@""]) {
        return YES;
    }
    
    if ([responseFromServer containsString:@"RequestTimeout"] ||
        [responseFromServer containsString:@"ExpiredToken"] ||
        [responseFromServer containsString:@"TokenRefreshRequired"]) {
        return YES;
    }
    return NO;
}


- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
   didSendBodyData:(int64_t)bytesSent
    totalBytesSent:(int64_t)totalBytesSent
totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    
    //Check if the task is an uploadTask.
    if (![task isKindOfClass:[NSURLSessionUploadTask class]]) {
        return;
    }
    
    //Handle the update differently based on whether it is a single part or multipart upload.
    AWSS3TransferUtilityTask *transferUtilityTask = [self.taskDictionary objectForKey:@(task.taskIdentifier)];
    if ([transferUtilityTask isKindOfClass:[AWSS3TransferUtilityUploadTask class]]) {
        AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = [self.taskDictionary objectForKey:@(task.taskIdentifier)];
        if (transferUtilityUploadTask.progress.totalUnitCount != totalBytesExpectedToSend) {
            transferUtilityUploadTask.progress.totalUnitCount = totalBytesExpectedToSend;
        }
     
        if (transferUtilityUploadTask.progress.completedUnitCount < totalBytesSent) {
            transferUtilityUploadTask.progress.completedUnitCount = totalBytesSent;
            
            if (transferUtilityUploadTask.expression.progressBlock) {
                transferUtilityUploadTask.expression.progressBlock(transferUtilityUploadTask, transferUtilityUploadTask.progress);
            }
        }
    }
    else if ([transferUtilityTask isKindOfClass:[AWSS3TransferUtilityMultiPartUploadTask class]]) {
        //Get the multipart upload task
        AWSS3TransferUtilityMultiPartUploadTask *transferUtilityMultiPartUploadTask = [self.taskDictionary objectForKey:@(task.taskIdentifier)];
        //Get multipart upload sub task
        AWSS3TransferUtilityUploadSubTask *subTask = [transferUtilityMultiPartUploadTask.inProgressPartsDictionary objectForKey:@(task.taskIdentifier)];
        
        if (subTask.totalBytesSent < totalBytesSent) {
            //Calculate and update the running total
            transferUtilityMultiPartUploadTask.progress.completedUnitCount = transferUtilityMultiPartUploadTask.progress.completedUnitCount - subTask.totalBytesSent + totalBytesSent;
            subTask.totalBytesSent = totalBytesSent;
     
            //execute the callback to the progressblock if present.
            if (transferUtilityMultiPartUploadTask.expression.progressBlock) {
                transferUtilityMultiPartUploadTask.expression.progressBlock(transferUtilityMultiPartUploadTask, transferUtilityMultiPartUploadTask.progress);
            }
        }
    }
}

#pragma mark - NSURLSessionDownloadDelegate

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    AWSS3TransferUtilityDownloadTask *transferUtilityTask = [self.taskDictionary objectForKey:@(downloadTask.taskIdentifier)];
    if (!transferUtilityTask) {
        AWSDDLogDebug(@"Unable to find information for task %lu in taskDictionary", (unsigned long)downloadTask.taskIdentifier);
        return;
    }
    if (transferUtilityTask.location) {
        if (![[NSFileManager defaultManager] fileExistsAtPath:[transferUtilityTask.location path]]) {
            NSError *error = nil;
            BOOL result = [[NSFileManager defaultManager] moveItemAtURL:location
                                                                  toURL:transferUtilityTask.location
                                                                  error:&error];
            if (!result) {
                transferUtilityTask.error = error;
            }
        }
    } else {
        NSError *error = nil;
        transferUtilityTask.data = [NSData dataWithContentsOfFile:location.path options:NSDataReadingMappedIfSafe error:&error];
        if (!transferUtilityTask.data) {
            transferUtilityTask.error = error;
        }
    }
}

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask =
        [self.taskDictionary objectForKey:@(downloadTask.taskIdentifier)];
   
    if (!transferUtilityDownloadTask) {
        AWSDDLogDebug(@"Unable to find information for task %lu in taskDictionary", (unsigned long)downloadTask.taskIdentifier);
        return;
    }
    
    if (transferUtilityDownloadTask.progress.totalUnitCount != totalBytesExpectedToWrite) {
        transferUtilityDownloadTask.progress.totalUnitCount = totalBytesExpectedToWrite;
    }
    if (transferUtilityDownloadTask.progress.completedUnitCount < totalBytesWritten) {
        transferUtilityDownloadTask.progress.completedUnitCount = totalBytesWritten;

        if (transferUtilityDownloadTask.expression.progressBlock) {
            transferUtilityDownloadTask.expression.progressBlock(transferUtilityDownloadTask, transferUtilityDownloadTask.progress);
        }
    }
}

#pragma mark - NSURLSessionDataDelegate
- (void)URLSession:(NSURLSession *)session
        dataTask:(NSURLSessionDataTask *)dataTask
        didReceiveData:(NSData *)data {
    
    if (data && [data length] != 0) {
        //Get the response into a string
        NSString *response = [NSString stringWithUTF8String:[data bytes]];
        AWSDDLogDebug(@"TaskIdentifier[%lu] Got response from Server: %@", (unsigned long)dataTask.taskIdentifier, response);
        if (!response) {
            //If response is null, no more work to do. Return
            return;
        }
        //Put it into the responseData property of the transferUtilityUploadTask or the transferUtilityUploadSubTask
        AWSS3TransferUtilityTask *transferUtilityTask = [self.taskDictionary objectForKey:@(dataTask.taskIdentifier)];
        if ([transferUtilityTask isKindOfClass:[AWSS3TransferUtilityUploadTask class]]) {
            AWSS3TransferUtilityUploadTask *uploadTask = [self.taskDictionary objectForKey:@(dataTask.taskIdentifier)];
            uploadTask.responseData = [uploadTask.responseData stringByAppendingString:response];
        }
        else if ([transferUtilityTask isKindOfClass:[AWSS3TransferUtilityMultiPartUploadTask class]]) {
            //Get the multipart upload task
            AWSS3TransferUtilityMultiPartUploadTask *transferUtilityMultiPartUploadTask = [self.taskDictionary objectForKey:@(dataTask.taskIdentifier)];
            AWSS3TransferUtilityUploadSubTask *subTask = [transferUtilityMultiPartUploadTask.inProgressPartsDictionary objectForKey:@(dataTask.taskIdentifier)];
            subTask.responseData = [subTask.responseData stringByAppendingString:response];
        }
        else if ([transferUtilityTask isKindOfClass:[AWSS3TransferUtilityDownloadTask class]]) {
            AWSS3TransferUtilityDownloadTask *downloadTask = [self.taskDictionary objectForKey:@(dataTask.taskIdentifier)];
            downloadTask.responseData = [downloadTask.responseData stringByAppendingString:response];
        }
    }
}

#pragma mark - Database Methods
//Database Layer Constants
NSString *const AWSS3TransferUtilityCreateAWSTransfer =  @"CREATE TABLE IF NOT EXISTS awstransfer ("
@"transfer_id TEXT NOT NULL,"
@"ns_url_session_id TEXT NOT NULL,"
@"session_task_id INTEGER NOT NULL,"
@"transfer_type TEXT NOT NULL, "
@"bucket_name TEXT NOT NULL, "
@"key TEXT NOT NULL, "
@"part_number INTEGER, "
@"multi_part_id TEXT, "
@"etag TEXT, "
@"file TEXT NOT NULL,"
@"temporary_file_created INTEGER, "
@"content_length INTEGER,"
@"status TEXT NOT NULL,"
@"retry_count INTEGER NOT NULL,"
@"request_headers TEXT,"
@"request_parameters TEXT)";


NSString *const AWSS3TransferUtilityQueryAWSTransfer = @"Select transfer_id, session_task_id, "
@"transfer_type, bucket_name, key, part_number, multi_part_id, etag, file, temporary_file_created, content_length, "
@"status, retry_count, request_headers, request_parameters "
@"From awstransfer "
@"Where ns_url_session_id=:ns_url_session_id order by transfer_id, part_number";


NSString *const AWSS3TransferUtiltyInsertIntoAWSTransfer = @"INSERT INTO awstransfer ("
@"transfer_id,ns_url_session_id, session_task_id, transfer_type, bucket_name, key, part_number, multi_part_id, etag, file, "
@"temporary_file_created, content_length, status, retry_count, request_headers, request_parameters"
@") VALUES ("
@":transfer_id,:ns_url_session_id, :session_task_id, :transfer_type, :bucket_name, :key, :part_number, :multi_part_id, :etag, :file, :temporary_file_created, :content_length, "
@":status, :retry_count, :request_headers, :request_parameters"
@")";


NSString *const AWSS3TransferUtilityDeleteATask =  @"DELETE FROM awstransfer "
@"WHERE transfer_id=:transfer_id and "
@"      session_task_id=:session_task_id ";

NSString *const AWSS3TransferUtilityDeleteTransfer =  @"DELETE FROM awstransfer "
@"WHERE transfer_id=:transfer_id";

NSString *const AWSS3TransferUtilityUpdateTransferUtilityStatus = @"UPDATE awstransfer "
@"SET status=:status "
@"WHERE transfer_id=:transfer_id and "
@"      session_task_id=:session_task_id ";

NSString *const AWSS3TransferUtilityUpdateTransferUtilityStatusAndETag = @"UPDATE awstransfer "
@"SET status=:status, etag = :etag "
@"WHERE transfer_id=:transfer_id and "
@"      session_task_id=:session_task_id ";

NSString *const AWSS3TransferUtilityDatabaseDirectory = @"/com/amazonaws/AWSS3TransferUtility/";
NSString *const AWSS3TransferUtilityDatabaseName = @"transfer_utility_database";
NSString *const AWSS3TransferUtilityInProgressStatus = @"IN_PROGRESS";
NSString *const AWSS3TransferUtilityPausedStatus = @"PAUSED";
NSString *const AWSS3TransferUtilityCompletedStatus = @"COMPLETED";
NSString *const AWSS3TransferUtilityWaitingStatus = @"WAITING";


- (AWSFMDatabaseQueue *) createDatabase {
    //Create temporary Dir to hold DB
    NSString *dbDirPath = [self.cacheDirectoryPath stringByAppendingString:AWSS3TransferUtilityDatabaseDirectory];
    BOOL fileExistsAtPath = [[NSFileManager defaultManager] fileExistsAtPath:dbDirPath];
    if (!fileExistsAtPath) {
        NSError *error = nil;
        BOOL success  = [[NSFileManager defaultManager] createDirectoryAtPath:dbDirPath withIntermediateDirectories:YES attributes:nil  error:&error];
        if (!success) {
            AWSDDLogError(@"Failed to create a directory for the transfer utility database. [%@]", error);
            AWSDDLogError(@"Will proceed without using database");
            return nil;
        }
    }
    
    NSString * databasePath = [dbDirPath stringByAppendingString:AWSS3TransferUtilityDatabaseName];
    //Open the database if the directory exists
    AWSDDLogInfo(@"Transfer Utility Database Path: [%@]", databasePath);
    AWSFMDatabaseQueue *databaseQueue = [AWSFMDatabaseQueue databaseQueueWithPath: databasePath];
    
    if (!databaseQueue) {
        AWSDDLogError(@"Unable to create Database Queue for [%@]", databasePath);
        return nil;
    }
    
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        if (! [db executeUpdate: AWSS3TransferUtilityCreateAWSTransfer]) {
            AWSDDLogError(@"Failed to create awstransfer Database table. [%@]", db.lastError);
        }
    }];
    return databaseQueue;
}


- (void) insertUploadTransferRequestInDB:(AWSS3TransferUtilityUploadTask *) task
                           databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    
    [self insertTransferRequestInDB:task.transferID
                     nsURLSessionID:task.nsURLSessionID
                     taskIdentifier:@(task.sessionTask.taskIdentifier)
                       transferType:@"UPLOAD"
                             bucket:task.bucket
                                key:task.key
                         partNumber:@0
                        multiPartID:@""
                               eTag:@""
                               file:task.file
               temporaryFileCreated:task.temporaryFileCreated
                      contentLength:@0
                             status:AWSS3TransferUtilityInProgressStatus
                         retryCount:@(task.retryCount)
                 requestHeadersJSON:[self getJSONRepresentation:task.expression.requestHeaders]
              requestParametersJSON:[self getJSONRepresentation:task.expression.requestParameters]
                      databaseQueue:databaseQueue];
}

- (NSString *) getJSONRepresentation: (NSDictionary *) dict {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
    if (error) {
        AWSDDLogError(@"Error converting dictionary to JSON:%@", error);
        return @"{}";
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSDictionary*) getDictionaryFromJson: (NSString *)json {
    NSError *error = nil;
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error) {
        AWSDDLogError(@"Error converting JSON to Dictionary:%@", error);
        return [NSDictionary new];
    }
    return dict;
}


- (void) insertDownloadTransferRequestInDB:(AWSS3TransferUtilityDownloadTask *) task
                             databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    NSString *file = task.file;
    if(!file) {
        file = @"";
    }
    [self insertTransferRequestInDB:task.transferID
                    nsURLSessionID:task.nsURLSessionID
                     taskIdentifier:@(task.sessionTask.taskIdentifier)
                         transferType:@"DOWNLOAD"
                             bucket:task.bucket
                                key:task.key
                         partNumber:@0
                        multiPartID:@""
                               eTag:@""
                               file:file
               temporaryFileCreated: NO
                      contentLength:@0
                             status:AWSS3TransferUtilityInProgressStatus
                         retryCount:@(task.retryCount)
                 requestHeadersJSON:[self getJSONRepresentation:task.expression.requestHeaders]
              requestParametersJSON:[self getJSONRepresentation:task.expression.requestParameters]
                      databaseQueue:databaseQueue];
}

- (void) insertMultiPartUploadRequestInDB:(AWSS3TransferUtilityMultiPartUploadTask *) task
                            databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    [self insertTransferRequestInDB:task.transferID
                    nsURLSessionID:task.nsURLSessionID
                     taskIdentifier:@0
                         transferType:@"MULTI_PART_UPLOAD"
                             bucket:task.bucket
                                key:task.key
                         partNumber:@0
                        multiPartID:task.uploadID
                               eTag:@""
                               file:task.file
               temporaryFileCreated: task.temporaryFileCreated
                      contentLength:task.contentLength
                             status:AWSS3TransferUtilityInProgressStatus
                         retryCount:@(task.retryCount)
                 requestHeadersJSON:[self getJSONRepresentation:task.expression.requestHeaders]
              requestParametersJSON:[self getJSONRepresentation:task.expression.requestParameters]
                      databaseQueue:databaseQueue];
}

- (void) insertMultiPartUploadRequestSubTaskInDB:(AWSS3TransferUtilityMultiPartUploadTask *) task
                                         subTask:(AWSS3TransferUtilityUploadSubTask *) subTask
                                   databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    [self insertTransferRequestInDB:task.transferID
                    nsURLSessionID:task.nsURLSessionID
                     taskIdentifier:@(subTask.taskIdentifier)
                       transferType:@"MULTI_PART_UPLOAD_SUB_TASK"
                             bucket:task.bucket
                                key:task.key
                         partNumber:subTask.partNumber
                        multiPartID:task.uploadID
                               eTag:@""
                               file:subTask.file
               temporaryFileCreated: YES
                      contentLength:@(subTask.totalBytesExpectedToSend)
                             status:subTask.status
                         retryCount:@(0)
                 requestHeadersJSON:[self getJSONRepresentation:task.expression.requestHeaders]
              requestParametersJSON:[self getJSONRepresentation:task.expression.requestParameters]
                      databaseQueue:databaseQueue];
}


- (void) insertTransferRequestInDB: (NSString *) transferID
                    nsURLSessionID: (NSString *) nsURLSessionID
                    taskIdentifier: (NSNumber *) taskIdentifier
                      transferType: (NSString *) transferType
                            bucket: (NSString *) bucket
                               key: (NSString *) key
                        partNumber: (NSNumber *) partNumber
                       multiPartID: (NSString *) multiPartID
                              eTag: (NSString *) eTag
                              file: (NSString *) file
              temporaryFileCreated: (BOOL) temporaryFileCreated
                     contentLength: (NSNumber *) contentLength
                            status: (NSString *) status
                        retryCount: (NSNumber *) retryCount
                requestHeadersJSON: (NSString *) requestHeadersJSON
             requestParametersJSON: (NSString *) requestParametersJSON
                     databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    NSNumber *tempFileCreated = [NSNumber numberWithInt:0];
    if (temporaryFileCreated) {
        tempFileCreated = [NSNumber numberWithInt:1];
    }
    
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        BOOL result = [db executeUpdate: AWSS3TransferUtiltyInsertIntoAWSTransfer
                withParameterDictionary:@{
                                          @"transfer_id": transferID,
                                          @"ns_url_session_id": nsURLSessionID,
                                          @"session_task_id":taskIdentifier,
                                          @"transfer_type": transferType,
                                          @"bucket_name": bucket,
                                          @"key": key,
                                          @"part_number": partNumber,
                                          @"multi_part_id": multiPartID,
                                          @"etag": eTag,
                                          @"file": file,
                                          @"temporary_file_created": tempFileCreated,
                                          @"content_length": contentLength,
                                          @"status": status,
                                          @"request_headers": requestHeadersJSON,
                                          @"request_parameters": requestParametersJSON,
                                          @"retry_count": retryCount
                                          }];
        
        if (!result) {
            AWSDDLogError(@"Failed to save Transfer [%@] in awstransfer database table. [%@]", transferID, db.lastError);
        }
    }];
}


- (void) deleteTransferRequestFromDB:(NSString *) transferID
                       databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        BOOL result = [db executeUpdate: AWSS3TransferUtilityDeleteTransfer
                withParameterDictionary:@{
                                          @"transfer_id": transferID
                                          }];
        
        if (!result) {
            AWSDDLogError(@"Failed to delete transfer_request [%@] in Database. [%@]", transferID,
                          db.lastError);
            return;
        }
    
    }];
}

- (void) deleteTransferRequestFromDB:(NSString *) transferID
                      taskIdentifier: (NSUInteger) taskIdentifier
                       databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        BOOL result = [db executeUpdate:AWSS3TransferUtilityDeleteATask
                withParameterDictionary:@{
                                          @"transfer_id": transferID,
                                          @"session_task_id": @(taskIdentifier)
                                          }];
        if (!result) {
            AWSDDLogError(@"Failed to delete transfer_request [%@] in Database. [%@]", transferID,
                          db.lastError);
        }
    }];
}

- (void) updateTransferRequestInDB: (NSString *) transferID
                    taskIdentifier: (NSUInteger) taskIdentifier
                              eTag: (NSString *) eTag
                            status: (NSString *) status
                     databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        BOOL result = [db executeUpdate: AWSS3TransferUtilityUpdateTransferUtilityStatusAndETag
                withParameterDictionary:@{
                                          @"transfer_id": transferID,
                                          @"session_task_id": @(taskIdentifier),
                                          @"etag": eTag,
                                          @"status": status
                                          }];
        
        if (!result) {
            AWSDDLogError(@"Failed to update transfer_request [%@] in Database. [%@]", transferID,
                          db.lastError);
        }
    }];
}

- (NSMutableArray *) getTransferTaskDataFromDB:(NSString *)nsURLSessionID {

    NSMutableArray *tasks = [NSMutableArray new];
    //Read from DB
    [_databaseQueue inDatabase:^(AWSFMDatabase *db) {
        //Get all AWSTransferRecords
        AWSFMResultSet *rs = [db executeQuery:AWSS3TransferUtilityQueryAWSTransfer
                      withParameterDictionary:@{
                                                @"ns_url_session_id": nsURLSessionID
                                                }];
        while ([rs next]) {
            NSMutableDictionary *transfer = [NSMutableDictionary new];
            [transfer setObject:[rs stringForColumn:@"transfer_id"] forKey:@"transfer_id"];
            [transfer setObject:@([rs intForColumn:@"session_task_id"]) forKey:@"session_task_id"];
            [transfer setObject:[rs stringForColumn:@"transfer_type"] forKey:@"transfer_type"];
            [transfer setObject:[rs stringForColumn:@"bucket_name"] forKey:@"bucket_name"];
            [transfer setObject:[rs stringForColumn:@"key"] forKey:@"key"];
            [transfer setObject:@([rs intForColumn:@"part_number"]) forKey:@"part_number"];
            [transfer setObject:[rs stringForColumn:@"multi_part_id"] forKey:@"multi_part_id"];
            [transfer setObject:[rs stringForColumn:@"etag"] forKey:@"etag"];
            [transfer setObject:[rs stringForColumn:@"file"] forKey:@"file"];
            [transfer setObject:@([rs intForColumn:@"temporary_file_created"]) forKey:@"temporary_file_created"];
            [transfer setObject:@([rs intForColumn:@"content_length"]) forKey:@"content_length"];
            [transfer setObject:[rs stringForColumn:@"status"] forKey:@"status"];
            [transfer setObject:@([rs intForColumn:@"retry_count"]) forKey:@"retry_count"];
            [transfer setObject:[rs stringForColumn:@"request_headers"] forKey:@"request_headers"];
            [transfer setObject:[rs stringForColumn:@"request_parameters"] forKey:@"request_parameters"];
            [tasks addObject:transfer];
        }
        rs = nil;
    }];
    return tasks;
}


- (void) removeFile: (NSString *) absolutePath
{
    if (!absolutePath || ![[NSFileManager defaultManager ] fileExistsAtPath:absolutePath]) {
        return;
    }
    
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:absolutePath error:&error];
    if (error) {
        AWSDDLogError(@"Error deleting file[%@]: [%@]", absolutePath, error);
    }
}

@end

#pragma mark - AWSS3TransferUtilityConfiguration

@implementation AWSS3TransferUtilityConfiguration

- (instancetype)init {
    if (self = [super init]) {
        //set defaults.
        _accelerateModeEnabled = NO;
        _retryLimit = 0;
        _multiPartConcurrencyLimit = @(AWSS3TransferUtilityMultiPartDefaultConcurrencyLimit);
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    AWSS3TransferUtilityConfiguration *configuration = [[[self class] allocWithZone:zone] init];
    configuration.accelerateModeEnabled = self.isAccelerateModeEnabled;
    configuration.bucket = self.bucket;
    configuration.retryLimit = self.retryLimit;
    configuration.multiPartConcurrencyLimit = self.multiPartConcurrencyLimit;
    
    return configuration;
}

@end

#pragma mark - AWSS3TransferUtilityTasks

@implementation AWSS3TransferUtilityTask

- (instancetype)init {
    if (self = [super init]) {
        _progress = [NSProgress new];
    }
    
    return self;
}

- (NSUInteger)taskIdentifier {
    return self.sessionTask.taskIdentifier;
}

- (void)cancel {
}

- (void)resume {
    [self.sessionTask resume];
    [self updateStatus:self.transferID taskIdentifier:self.taskIdentifier status:AWSS3TransferUtilityInProgressStatus databaseQueue:self.databaseQueue];

}

- (void)suspend {
    [self.sessionTask suspend];
    [self updateStatus:self.transferID taskIdentifier:self.sessionTask.taskIdentifier status:AWSS3TransferUtilityPausedStatus databaseQueue:self.databaseQueue];
}

- (NSURLRequest *)request {
    return self.sessionTask.originalRequest;
}

- (NSHTTPURLResponse *)response {
    if ([self.sessionTask.response isKindOfClass:[NSHTTPURLResponse class]]) {
        return (NSHTTPURLResponse *)self.sessionTask.response;
    }
    return nil;
}

- (void) updateStatus: (NSString *) transferID
                    taskIdentifier: (NSUInteger) taskIdentifier
                            status: (NSString *) status
                     databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        BOOL result = [db executeUpdate: AWSS3TransferUtilityUpdateTransferUtilityStatus
                withParameterDictionary:@{
                                          @"transfer_id": transferID,
                                          @"session_task_id": @(taskIdentifier),
                                          @"status": status
                                          }];
        if (!result) {
            AWSDDLogError(@"Failed to update transfer_request [%@] in Database. [%@]", transferID,
                          db.lastError);
        }
    }];
}
@end

@implementation AWSS3TransferUtilityUploadTask

- (AWSS3TransferUtilityUploadExpression *)expression {
    if (!_expression) {
        _expression = [AWSS3TransferUtilityUploadExpression new];
    }
    return _expression;
}

-(void) cancel {
    self.cancelled = YES;
    [self.sessionTask cancel];
}

@end

@implementation AWSS3TransferUtilityMultiPartUploadTask

- (void) updateStatus: (NSString *) transferID
       taskIdentifier: (NSUInteger) taskIdentifier
               status: (NSString *) status
        databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        BOOL result = [db executeUpdate: AWSS3TransferUtilityUpdateTransferUtilityStatus
                withParameterDictionary:@{
                                          @"transfer_id": transferID,
                                          @"session_task_id": @(taskIdentifier),
                                          @"status": status
                                          }];
        
        if (!result) {
            AWSDDLogError(@"Failed to update transfer_request [%@] in Database. [%@]", transferID,
                          db.lastError);
        }
    }];
}

- (instancetype)init {
    if (self = [super init]) {
        _progress = [NSProgress new];
        _waitingPartsDictionary = [NSMutableDictionary new];
        _inProgressPartsDictionary = [NSMutableDictionary new];
        _completedPartsDictionary = [NSMutableDictionary new];
    }
    return self;
}

- (AWSS3TransferUtilityMultiPartUploadExpression *)expression {
    if (!_expression) {
        _expression = [AWSS3TransferUtilityMultiPartUploadExpression new];
    }
    return _expression;
}

- (void)cancel {
    self.cancelled = YES;
    for (NSNumber *key in [self.inProgressPartsDictionary allKeys]) {
        AWSS3TransferUtilityUploadSubTask *subTask = [self.inProgressPartsDictionary objectForKey:key];
        [subTask.sessionTask cancel];
    }
    for (NSNumber *key in [self.waitingPartsDictionary allKeys]) {
        AWSS3TransferUtilityUploadSubTask *subTask = [self.waitingPartsDictionary objectForKey:key];
        [subTask.sessionTask cancel];
    }
}

- (void)resume {
    for (NSNumber *key in [self.inProgressPartsDictionary allKeys]) {
        AWSS3TransferUtilityUploadSubTask *subTask = [self.inProgressPartsDictionary objectForKey:key];
        subTask.status = AWSS3TransferUtilityInProgressStatus;
        [self updateStatus:subTask.transferID taskIdentifier:subTask.taskIdentifier status:AWSS3TransferUtilityInProgressStatus databaseQueue:self.databaseQueue];
        [subTask.sessionTask resume];
    }
}

- (void)suspend {
    for (NSNumber *key in [self.inProgressPartsDictionary allKeys]) {
        AWSS3TransferUtilityUploadSubTask *subTask = [self.inProgressPartsDictionary objectForKey:key];
        [subTask.sessionTask suspend];
        subTask.status = AWSS3TransferUtilityPausedStatus;
        [self updateStatus:subTask.transferID taskIdentifier:subTask.taskIdentifier status:AWSS3TransferUtilityPausedStatus databaseQueue:self.databaseQueue];
    }
}

@end

@implementation AWSS3TransferUtilityDownloadTask

- (AWSS3TransferUtilityDownloadExpression *)expression {
    if (!_expression) {
        _expression = [AWSS3TransferUtilityDownloadExpression new];
    }
    return _expression;
}

-(void) cancel {
    self.cancelled = YES;
    [self.sessionTask cancel];
}

@end

#pragma mark - AWSS3TransferUtilityExpressions

@implementation AWSS3TransferUtilityExpression

- (instancetype)init {
    if (self = [super init]) {
        _internalRequestHeaders = [NSMutableDictionary new];
        _internalRequestParameters = [NSMutableDictionary new];
    }
    
    return self;
}

- (NSDictionary<NSString *, NSString *> *)requestHeaders {
    return [NSDictionary dictionaryWithDictionary:self.internalRequestHeaders];
}

- (NSDictionary<NSString *, NSString *> *)requestParameters {
    return [NSDictionary dictionaryWithDictionary:self.internalRequestParameters];
}

- (void)setValue:(NSString *)value forRequestHeader:(NSString *)requestHeader {
    [self.internalRequestHeaders setValue:value forKey:requestHeader];
}

- (void)setValue:(NSString *)value forRequestParameter:(NSString *)requestParameter {
    [self.internalRequestParameters setValue:value forKey:requestParameter];
}

- (void)assignRequestHeaders:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest {
    for (NSString *key in self.internalRequestHeaders) {
        [getPreSignedURLRequest setValue:self.internalRequestHeaders[key]
                        forRequestHeader:key];
    }
}

- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest {
    for (NSString *key in self.internalRequestParameters) {
        [getPreSignedURLRequest setValue:self.internalRequestParameters[key]
                     forRequestParameter:key];
    }
}

@end

@implementation AWSS3TransferUtilityUploadExpression
- (NSString *)contentMD5 {
    return [self.internalRequestHeaders valueForKey:@"Content-MD5"];
}

- (void)setContentMD5:(NSString *)contentMD5 {
    [self setValue:contentMD5 forRequestHeader:@"Content-MD5"];
}
@end

@implementation AWSS3TransferUtilityMultiPartUploadExpression

- (instancetype)init {
    if (self = [super init]) {
        _internalRequestHeaders = [NSMutableDictionary new];
        _internalRequestParameters = [NSMutableDictionary new];
    }
    return self;
}

- (NSDictionary<NSString *, NSString *> *)requestHeaders {
    return [NSDictionary dictionaryWithDictionary:self.internalRequestHeaders];
}

- (NSDictionary<NSString *, NSString *> *)requestParameters {
    return [NSDictionary dictionaryWithDictionary:self.internalRequestParameters];
}

- (void)setValue:(NSString *)value forRequestHeader:(NSString *)requestHeader {
    [self.internalRequestHeaders setValue:value forKey:requestHeader];
}

- (void)setValue:(NSString *)value forRequestParameter:(NSString *)requestParameter {
    [self.internalRequestParameters setValue:value forKey:requestParameter];
}

- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest {
    for (NSString *key in self.internalRequestParameters) {
        [getPreSignedURLRequest setValue:self.internalRequestParameters[key]
                     forRequestParameter:key];
    }
}

@end

@implementation AWSS3TransferUtilityDownloadExpression
@end

@implementation AWSS3TransferUtilityUploadSubTask
@end


