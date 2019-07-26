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

#import "AWSS3TransferUtility.h"
#import "AWSS3PreSignedURL.h"
#import "AWSS3Service.h"
#import "AWSS3TransferUtilityDatabaseHelper.h"
#import "AWSS3TransferUtilityTasks.h"

#import <AWSCore/AWSFMDB.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import <AWSCore/AWSXMLDictionary.h>

#include <stdio.h>

// Public constants
NSString *const AWSS3TransferUtilityErrorDomain = @"com.amazonaws.AWSS3TransferUtilityErrorDomain";
NSString *const AWSS3TransferUtilityURLSessionDidBecomeInvalidNotification = @"com.amazonaws.AWSS3TransferUtility.AWSS3TransferUtilityURLSessionDidBecomeInvalidNotification";


// Private constants
static NSString *const AWSS3TransferUtilityDefaultIdentifier = @"com.amazonaws.AWSS3TransferUtility.Default.Identifier";
static NSTimeInterval const AWSS3TransferUtilityTimeoutIntervalForResource = 50 * 60; // 50 minutes
static NSString *const AWSS3TransferUtilityUserAgent = @"transfer-utility";
static NSString *const AWSInfoS3TransferUtility = @"S3TransferUtility";
static NSString *const AWSS3TransferUtilityRetryExceeded = @"AWSS3TransferUtilityRetryExceeded";
static NSString *const AWSS3TransferUtilityRetrySucceeded = @"AWSS3TransferUtilityRetrySucceeded";
static NSUInteger const AWSS3TransferUtilityMultiPartSize = 5 * 1024 * 1024;
static NSString *const AWSS3TransferUtiltityRequestTimeoutErrorCode = @"RequestTimeout";
static int const AWSS3TransferUtilityMultiPartDefaultConcurrencyLimit = 5;


#pragma mark - Private classes

@interface AWSS3TransferUtilityUploadSubTask()
@property (strong, nonatomic) NSURLSessionTask *sessionTask;
@property (strong, nonatomic) NSNumber *partNumber;
@property (readwrite) NSUInteger taskIdentifier;
@property (strong, nonatomic) NSString *eTag;
@property int64_t totalBytesExpectedToSend;
@property int64_t totalBytesSent;
@property NSString *responseData;
@property NSString *file;
@property NSString *transferType;
@property NSString *transferID;
@property AWSS3TransferUtilityTransferStatusType status;
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
@property (strong, nonatomic) AWSSynchronizedMutableDictionary *completedTaskDictionary;
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
@property AWSS3TransferUtilityTransferStatusType status;
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
@property AWSS3TransferUtilityTransferStatusType status;
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


@interface AWSS3TransferUtilityDatabaseHelper()

+ (AWSFMDatabaseQueue *) createDatabase:(NSString*) cacheDirectoryPath;

+ (void) deleteTransferRequestFromDB:(NSString *) transferID
                         databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) deleteTransferRequestFromDB:(NSString *) transferID
                      taskIdentifier: (NSUInteger) taskIdentifier
                       databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) updateTransferRequestInDB: (NSString *) transferID
                        partNumber: (NSNumber *) partNumber
                    taskIdentifier: (NSUInteger) taskIdentifier
                              eTag: (NSString *) eTag
                            status: (AWSS3TransferUtilityTransferStatusType) status
                       retry_count: (NSUInteger) retryCount
                     databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) insertUploadTransferRequestInDB:(AWSS3TransferUtilityUploadTask *) task
                             databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) insertDownloadTransferRequestInDB:(AWSS3TransferUtilityDownloadTask *) task
                             databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) insertMultiPartUploadRequestInDB:(AWSS3TransferUtilityMultiPartUploadTask *) task
                            databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) insertMultiPartUploadRequestSubTaskInDB:(AWSS3TransferUtilityMultiPartUploadTask *) task
                                         subTask:(AWSS3TransferUtilityUploadSubTask *) subTask
                                   databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (NSMutableArray *) getTransferTaskDataFromDB:(NSString *)nsURLSessionID
                                 databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (NSString *) getJSONRepresentation: (NSDictionary *) dict;
+ (NSDictionary*) getDictionaryFromJson: (NSString *)json;

@end

@interface AWSS3TransferUtility (Validation)
- (AWSTask *) validateParameters: (NSString * )bucket key:(NSString *)key fileURL:(NSURL *)fileURL accelerationModeEnabled: (BOOL) accelerationModeEnabled;

- (AWSTask *) validateParameters: (NSString * )bucket key:(NSString *)key accelerationModeEnabled: (BOOL) accelerationModeEnabled;

@end

@interface AWSS3TransferUtility (HeaderHelper)
-(void) propagateHeaderInformation: (AWSS3CreateMultipartUploadRequest *) uploadRequest
                        expression: (AWSS3TransferUtilityMultiPartUploadExpression *) expression;

-(void) filterAndAssignHeaders:(NSDictionary<NSString *, NSString *> *) requestHeaders
        getPresignedURLRequest:(AWSS3GetPreSignedURLRequest *) getPresignedURLRequest
                    URLRequest: (NSMutableURLRequest *) URLRequest;
@end



#pragma mark - AWSS3TransferUtility

@implementation AWSS3TransferUtility

static AWSSynchronizedMutableDictionary *_serviceClients = nil;
static AWSS3TransferUtility *_defaultS3TransferUtility = nil;

#pragma mark - Initialization methods

+ (instancetype)defaultS3TransferUtility {
    return [self defaultS3TransferUtility:nil];
}

+ (instancetype)defaultS3TransferUtility:(void (^)(NSError *_Nullable error)) completionHandler {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSS3TransferUtilityConfiguration *transferUtilityConfiguration = [AWSS3TransferUtilityConfiguration new];
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoS3TransferUtility];
       
        if (serviceInfo) {
            NSNumber *localTestingEnabled = [serviceInfo.infoDictionary valueForKey:@"DangerouslyConnectToHTTPEndpointForTesting"];
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                       serviceType:AWSServiceS3
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider
                                                               localTestingEnabled:[localTestingEnabled boolValue]];
            NSNumber *accelerateModeEnabled = [serviceInfo.infoDictionary valueForKey:@"AccelerateModeEnabled"];
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
                                                                             identifier:nil
                                                                      completionHandler:completionHandler];
    });
    
    return _defaultS3TransferUtility;
}

+ (void)registerS3TransferUtilityWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    [self registerS3TransferUtilityWithConfiguration:configuration
                        transferUtilityConfiguration:[AWSS3TransferUtilityConfiguration new]
                                              forKey:key];
}

+ (void)registerS3TransferUtilityWithConfiguration:(AWSServiceConfiguration *)configuration
                                            forKey:(NSString *)key
                                 completionHandler:(nullable void (^)(NSError *_Nullable error)) completionHandler{
    [self registerS3TransferUtilityWithConfiguration:configuration
                        transferUtilityConfiguration:[AWSS3TransferUtilityConfiguration new]
                                              forKey:key
                                   completionHandler:completionHandler];
}

+ (void)registerS3TransferUtilityWithConfiguration:(AWSServiceConfiguration *)configuration
                      transferUtilityConfiguration:(AWSS3TransferUtilityConfiguration *)transferUtilityConfiguration
                                            forKey:(NSString *)key {
    [self registerS3TransferUtilityWithConfiguration:configuration transferUtilityConfiguration:transferUtilityConfiguration forKey:key completionHandler:nil];
}

+ (void)registerS3TransferUtilityWithConfiguration:(AWSServiceConfiguration *)configuration
                      transferUtilityConfiguration:(AWSS3TransferUtilityConfiguration *)transferUtilityConfiguration
                                            forKey:(NSString *)key
                                 completionHandler:(nullable void (^)(NSError *_Nullable error)) completionHandler{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    
    AWSS3TransferUtility *s3TransferUtility = [[AWSS3TransferUtility alloc] initWithConfiguration:configuration
                                                                     transferUtilityConfiguration:transferUtilityConfiguration
                                                                                       identifier:[NSString stringWithFormat:@"%@.%@", AWSS3TransferUtilityDefaultIdentifier, key]
                                                                                completionHandler: completionHandler];
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
    
    //Cancel all outstanding tasks
    NSArray<AWSS3TransferUtilityUploadTask *> *allUploads = [[transferUtility getUploadTasks] result];
    for( AWSS3TransferUtilityUploadTask *task in allUploads) {
        [task cancel];
    }
    
    NSArray<AWSS3TransferUtilityDownloadTask *> *allDownloads = [[transferUtility getDownloadTasks] result];
    for(AWSS3TransferUtilityDownloadTask *task in allDownloads) {
        [task cancel];
    }
    
    NSArray<AWSS3TransferUtilityMultiPartUploadTask *> *allMultiPartUploads = [[transferUtility getMultiPartUploadTasks] result];
    for(AWSS3TransferUtilityMultiPartUploadTask *task in allMultiPartUploads) {
        [task cancel];
    }
    
    //Close the session gracefully
    if (transferUtility) {
        [transferUtility.session finishTasksAndInvalidate];
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
                           identifier:(NSString *)identifier
                    completionHandler: (void (^)(NSError *_Nullable error)) completionHandler{
    if (self = [super init]) {
        
        // Create a temporary directory for data uploads in the caches directory
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
        //Call the completion handler with the error and return nil if unable to create the temporary directory
        if (!result) {
            AWSDDLogError(@"Failed to create a temporary directory: %@", error);
            //Call completion handler if one was provided.
            if (completionHandler) {
                completionHandler(error);
            }
            return nil;
        }
        
        if (identifier) {
            _sessionIdentifier = identifier;
        }
        else {
            _sessionIdentifier = AWSS3TransferUtilityDefaultIdentifier;
        }
        
        //Create the NS URL session
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:_sessionIdentifier];
        configuration.allowsCellularAccess = serviceConfiguration.allowsCellularAccess;
        configuration.timeoutIntervalForResource = transferUtilityConfiguration.timeoutIntervalForResource;
        
        if(serviceConfiguration.timeoutIntervalForRequest > 0){
            configuration.timeoutIntervalForRequest = serviceConfiguration.timeoutIntervalForRequest;
        }
        configuration.sharedContainerIdentifier = serviceConfiguration.sharedContainerIdentifier;
        
        _session = [NSURLSession sessionWithConfiguration:configuration
                                                 delegate:self
                                            delegateQueue:nil];
        
        //If not able to create the session, call completion handler with error and return nil.
        if (!_session ) {
            NSString* message = [NSString stringWithFormat:@"Failed to create a NSURLSession for [%@]", _sessionIdentifier];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:@"Message"];
            NSError *error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                                 code:AWSS3TransferUtilityErrorClientError
                                             userInfo:userInfo];
            if (completionHandler ) {
                completionHandler(error);
            }
            return nil;
        }
        
        //Setup the client object in the client dictionary
        _configuration = [serviceConfiguration copy];
        [_configuration addUserAgentProductToken:AWSS3TransferUtilityUserAgent];
       
        if (transferUtilityConfiguration  ) {
            _transferUtilityConfiguration = [transferUtilityConfiguration copy];
        }
        else {
            _transferUtilityConfiguration = [AWSS3TransferUtilityConfiguration new];
        }
        
        _preSignedURLBuilder = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:_configuration];
        _s3 = [[AWSS3 alloc] initWithConfiguration:_configuration];
        
      
        //Setup internal Data Structures
        _taskDictionary = [AWSSynchronizedMutableDictionary new];
        _completedTaskDictionary = [AWSSynchronizedMutableDictionary new];
        
        //Instantiate the Database Helper
        self.databaseQueue = [AWSS3TransferUtilityDatabaseHelper createDatabase:_cacheDirectoryPath];
        
        //Recover the state from the previous time this was instantiated
        [self recover:completionHandler];
    }
    return self;
}

#pragma mark - recovery methods

- (void) recover: (void (^)(NSError *_Nullable error)) completionHandler {
   
    AWSDDLogDebug(@"In Recovery for TU Session [%@]", _sessionIdentifier);
    //Create temporary datastructures to hold the database records.
    
    //This dictionary will contain the master level info for a multipart transfer
    NSMutableDictionary *tempMultiPartMasterTaskDictionary = [NSMutableDictionary new];
    //This dictionary will contain details of indvidual transfers ( upload, downloads and subtasks)
    NSMutableDictionary *tempTransferDictionary = [NSMutableDictionary new];
    
    //Hydrate from DB
    [self hydrateFromDB:tempMultiPartMasterTaskDictionary
       tempTransferDictionary:tempTransferDictionary];
    
    //Link Transfers to NSURL Session.
    [self linkTransfersToNSURLSession:tempMultiPartMasterTaskDictionary tempTransferDictionary:tempTransferDictionary completionHandler:completionHandler];
}

- (void) hydrateFromDB:(NSMutableDictionary *) tempMultiPartMasterTaskDictionary
      tempTransferDictionary: (NSMutableDictionary *) tempTransferDictionary
{
    //Get All Tasks from DB
    NSMutableArray *tasks = [AWSS3TransferUtilityDatabaseHelper getTransferTaskDataFromDB:_sessionIdentifier databaseQueue:_databaseQueue];
    
    //Iterate through the tasks and populate transferRequests and Multipart dictionary.
    for( NSMutableDictionary *task in tasks ) {
        NSString *transferType = [task objectForKey:@"transfer_type"];
        int sessionTaskID = [[task objectForKey:@"session_task_id"] intValue];
        
        if ([transferType isEqualToString:@"UPLOAD"]) {
            AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = [self hydrateUploadTask:task sessionIdentifier:self.sessionIdentifier databaseQueue:self.databaseQueue];
            
            //If task is completed, no more processing is required.
            if (transferUtilityUploadTask.status == AWSS3TransferUtilityTransferStatusCompleted ) {
                [self.completedTaskDictionary setObject:transferUtilityUploadTask forKey:transferUtilityUploadTask.transferID];
                [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:transferUtilityUploadTask.transferID databaseQueue:self->_databaseQueue];
                continue;
            }
            //Lodge in temporary Dictionary
            [tempTransferDictionary setObject:transferUtilityUploadTask forKey:@(sessionTaskID)];
            AWSDDLogDebug(@"Found upload [%@] with taskIdentifier [%d]",transferUtilityUploadTask.transferID,sessionTaskID );
        }
        else if ([transferType isEqualToString:@"DOWNLOAD"]) {
            AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask = [self hydrateDownloadTask:task sessionIdentifier:self.sessionIdentifier databaseQueue:self.databaseQueue];
            
            //If task is completed, no more processing is required.
            if (transferUtilityDownloadTask.status == AWSS3TransferUtilityTransferStatusCompleted ) {
                [self.completedTaskDictionary setObject:transferUtilityDownloadTask forKey:transferUtilityDownloadTask.transferID];
                [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:transferUtilityDownloadTask.transferID databaseQueue:self->_databaseQueue];
                continue;
            }
            //Lodge in temporary Dictionary for linking
            [tempTransferDictionary setObject:transferUtilityDownloadTask forKey:@(sessionTaskID)];
            AWSDDLogDebug(@"Found download [%@] with taskIdentifier [%d]",transferUtilityDownloadTask.transferID,sessionTaskID );
        }
        else if ([transferType isEqualToString:@"MULTI_PART_UPLOAD"]) {
            AWSS3TransferUtilityMultiPartUploadTask *transferUtilityMultiPartUploadTask = [self hydrateMultiPartUploadTask:task sessionIdentifier:self.sessionIdentifier databaseQueue:self.databaseQueue];
            
            //If task is completed, no more processing is required.
            if (transferUtilityMultiPartUploadTask.status == AWSS3TransferUtilityTransferStatusCompleted ||
                transferUtilityMultiPartUploadTask.status == AWSS3TransferUtilityTransferStatusUnknown ||
                transferUtilityMultiPartUploadTask.status == AWSS3TransferUtilityTransferStatusCancelled ||
                transferUtilityMultiPartUploadTask.status == AWSS3TransferUtilityTransferStatusError) {
                [self.completedTaskDictionary setObject:transferUtilityMultiPartUploadTask forKey:transferUtilityMultiPartUploadTask.transferID];
                [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:transferUtilityMultiPartUploadTask.transferID databaseQueue:self->_databaseQueue];
                continue;
            }
            
            //Lodge in temporary Dictionary for linking
            [tempMultiPartMasterTaskDictionary setObject:transferUtilityMultiPartUploadTask forKey:transferUtilityMultiPartUploadTask.uploadID];
            AWSDDLogDebug(@"Found MultiPartUpload [%@] with Multipart ID [%@] and status [%@]",transferUtilityMultiPartUploadTask.transferID,transferUtilityMultiPartUploadTask.uploadID, @(transferUtilityMultiPartUploadTask.status) );
        }
        else if ([transferType isEqualToString:@"MULTI_PART_UPLOAD_SUB_TASK"]) {
            AWSS3TransferUtilityUploadSubTask *subTask = [self hydrateMultiPartUploadSubTask:task sessionTaskID:sessionTaskID];
            AWSDDLogDebug(@"Found MultiPartUpload SubTask [%@] with taskNumber [%@] and status [%@]",subTask.transferID,@(subTask.taskIdentifier), @(subTask.status) );
            
            //Get the Master MultiPart record from the Dictionary.
            AWSS3TransferUtilityMultiPartUploadTask *multiPartUploadTask = [tempMultiPartMasterTaskDictionary objectForKey:subTask.uploadID];
            if ( !multiPartUploadTask ) {
                //Couldn't find the multipart upload master record. Must be an orphan part record. Clean up the DB and continue.
                [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:subTask.transferID databaseQueue:self->_databaseQueue];
                continue;
            }
            //Check if the subTask is is already completed. If it is, add it to the completed parts list, update the progress object and go to the next iteration of the loop
            if (subTask.status== AWSS3TransferUtilityTransferStatusCompleted ) {
                [multiPartUploadTask.completedPartsDictionary setObject:subTask forKey:@(sessionTaskID)];
                continue;
            }
            
            //The subTask must be in In_Progress, Waiting or Paused status. Lodge it in the temporary Dictionary for linking.
            [tempTransferDictionary setObject:subTask forKey:@(sessionTaskID)];
        }
    }
}

- (void) linkTransfersToNSURLSession:(NSMutableDictionary *) tempMultiPartMasterTaskDictionary
              tempTransferDictionary: (NSMutableDictionary *) tempTransferDictionary
                   completionHandler: (void (^)(NSError *_Nullable error)) completionHandler{
    //Get tasks from the NSURLSession and reattach to them.
    //getTasksWithCompletionHandler is an ansynchronous task, so the thread that is calling this method will not be blocked.
    [self.session getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
 
        //Loop through all the upload Tasks.
        for( NSURLSessionUploadTask *task in uploadTasks ) {
            AWSDDLogDebug(@"Iterating through task Identifier [%lu]", (unsigned long)task.taskIdentifier);
            NSError *taskError = [task error];
            
            //Get the Task
            id obj = [tempTransferDictionary objectForKey:@(task.taskIdentifier)];
            
            if ([obj isKindOfClass:[AWSS3TransferUtilityUploadTask class]])
            {
                //Found a upload task.
                AWSS3TransferUtilityUploadTask *uploadTask = obj;
                uploadTask.sessionTask = task;
                [self.taskDictionary setObject:uploadTask forKey:@(uploadTask.taskIdentifier)];
                AWSDDLogDebug(@"Added Upload Transfer task %@ to task dictionary", @(uploadTask.taskIdentifier));
                AWSDDLogDebug(@"Status is %ld", (long)uploadTask.status);

                //Remove this object from the tempTransferDictionary list
                [tempTransferDictionary removeObjectForKey:@(task.taskIdentifier)];
            
                //Check if the task has errored out.
                if (taskError) {
                    uploadTask.status = AWSS3TransferUtilityTransferStatusError;
                    [self markTransferAsCompleted:uploadTask
                                        taskError:taskError
                             temporaryFileCreated:uploadTask.temporaryFileCreated
                                         filePath:uploadTask.file];
                    continue;
                }
                
                //Check if it is InProgress
                if (uploadTask.status == AWSS3TransferUtilityTransferStatusInProgress) {
                    //Check if the the underlying NSURLSession task is completed. If so, delete the record from the DB, clean up any temp files  and call the completion handler.
                    if ([task state] == NSURLSessionTaskStateCompleted) {
                        //Set progress to 100%
                        uploadTask.progress.completedUnitCount = uploadTask.progress.totalUnitCount;
                        uploadTask.status = AWSS3TransferUtilityTransferStatusCompleted;
                        [self markTransferAsCompleted:uploadTask
                                            taskError:nil
                                 temporaryFileCreated:uploadTask.temporaryFileCreated
                                             filePath:uploadTask.file];
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
        }
        
        //Loop through all the Download tasks
        for( NSURLSessionDownloadTask *task in downloadTasks ) {
            id obj = [tempTransferDictionary objectForKey:@(task.taskIdentifier)];
            NSError *taskError = [task error];
            
            AWSDDLogDebug(@"Looking at NSURLSession Download Task [%lu]", (unsigned long)task.taskIdentifier);
            if ([obj isKindOfClass:[AWSS3TransferUtilityDownloadTask class]])
            {
                //Found a download task
                AWSS3TransferUtilityDownloadTask *downloadTask = obj;
                downloadTask.sessionTask = task;
                [self.taskDictionary setObject:downloadTask forKey:@(downloadTask.taskIdentifier)];
                AWSDDLogDebug(@"Added Download Transfer task %@ to task dictionary", @(downloadTask.taskIdentifier));
                AWSDDLogDebug(@"Status is %ld", (long)downloadTask.status);
                
                //Remove this request from the transferRequests list.
                [tempTransferDictionary removeObjectForKey:@(task.taskIdentifier)];

                //Check if the task has errored out.
                if (taskError) {
                    downloadTask.status = AWSS3TransferUtilityTransferStatusError;
                    [self markTransferAsCompleted:downloadTask taskError:taskError temporaryFileCreated:NO filePath:@""];
                    continue;
                }

                //Check if this is in progress
                if (downloadTask.status == AWSS3TransferUtilityTransferStatusInProgress) {

                    if ([task state] == NSURLSessionTaskStateCompleted) {
                        //Set progress to 100%
                        downloadTask.progress.completedUnitCount = downloadTask.progress.totalUnitCount;
                        downloadTask.status = AWSS3TransferUtilityTransferStatusCompleted;
                        [self markTransferAsCompleted:downloadTask taskError:taskError temporaryFileCreated:NO filePath:@""];
                        continue;
                    }
                    //Check if the underlying task's status is not in Progress.
                    else if ([task state] != NSURLSessionTaskStateRunning) {
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
        
        //We have run through all the Session Tasks and removed the matching records from the multiPartUploads and transferRequests dictionaries.
        //Handle any stragglers.
        [self handleUnlinkedTransfers:tempMultiPartMasterTaskDictionary tempTransferDictionary:tempTransferDictionary];
        
        //Call completion handler if one was provided.
        if (completionHandler) {
            completionHandler(nil);
        }
    }];
}

- (void) markTransferAsCompleted:(AWSS3TransferUtilityTask *) transferUtilityTask
                       taskError: (NSError *) taskError
            temporaryFileCreated: (BOOL) temporaryFileCreated
                        filePath: (NSString *) filePath
{
    if (temporaryFileCreated) {
        [self removeFile:filePath];
    }
    
    if (taskError) {
        AWSDDLogError(@"Task [%lu] has an error status [%@]. Marking transfer status as Error", (unsigned long)transferUtilityTask.taskIdentifier, taskError);
        transferUtilityTask.error = taskError;
    }
    [self.completedTaskDictionary setObject:transferUtilityTask forKey:transferUtilityTask.transferID];
    [self.taskDictionary removeObjectForKey:@(transferUtilityTask.taskIdentifier)];
    [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:transferUtilityTask.transferID databaseQueue:self->_databaseQueue];
}

- (void) handleUnlinkedTransfers:(NSMutableDictionary *) tempMultiPartMasterTaskDictionary
                   tempTransferDictionary: (NSMutableDictionary *) tempTransferDictionary {
    //At this point, we have finished iterating through the tasks present in the NSURLSession and removed all the matching ones from the transferRequests dictionary.
    //If there are any left in the transferRequests list, it means that we think they are running, but NSURLSession doesn't know about them.
    for (id taskIdentifier in [tempTransferDictionary allKeys]) {
        AWSDDLogDebug(@"No sessionTask found for taskIdentifier %@",taskIdentifier);
        id obj = [tempTransferDictionary objectForKey:taskIdentifier];
        if ([obj isKindOfClass:[AWSS3TransferUtilityUploadTask class]])
        {
            AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = obj;
            
            if (transferUtilityUploadTask.status == AWSS3TransferUtilityTransferStatusCompleted ) {
                [self.completedTaskDictionary setObject:transferUtilityUploadTask forKey:transferUtilityUploadTask.transferID];
                
                //Delete the transfer record from the DB
                [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:transferUtilityUploadTask.transferID taskIdentifier:[taskIdentifier integerValue] databaseQueue:self->_databaseQueue ];
                AWSDDLogDebug(@"Deleted transfer request from the DB");
            }
            //Check if the transfer is in a paused state and the input file for the transfer exists.
            else if ( [[NSFileManager defaultManager] fileExistsAtPath:transferUtilityUploadTask.file] &&
                     transferUtilityUploadTask.status ==  AWSS3TransferUtilityTransferStatusPaused) {
                //If the transfer was paused and the local file is still present, create another NSURLSession task and leave it in a paused state
                [ self createUploadTask:transferUtilityUploadTask startTransfer:NO];
            }
            else {
                //Transfer is in progress according to us, but not present in the NSURLSession. It may have been sucessfully completed. Do not retry.
                //Mark the status as unknown. The app developer should check to see if the S3 file was uploaded in the app logic and reinitate the transfer if required.
                transferUtilityUploadTask.status = AWSS3TransferUtilityTransferStatusUnknown;
                [self.completedTaskDictionary setObject:transferUtilityUploadTask forKey:transferUtilityUploadTask.transferID];
                //Delete the transfer record from the DB
                [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:transferUtilityUploadTask.transferID taskIdentifier:[taskIdentifier integerValue] databaseQueue:self->_databaseQueue ];
                AWSDDLogDebug(@"Deleted transfer request from the DB");
            }
        }
        else if([obj isKindOfClass:[AWSS3TransferUtilityUploadSubTask class]])
        {
            AWSS3TransferUtilityUploadSubTask *subTask = obj;
            AWSS3TransferUtilityMultiPartUploadTask *multiPartUploadTask = [tempMultiPartMasterTaskDictionary objectForKey:subTask.uploadID];
            [self retryUploadSubTask: multiPartUploadTask subTask:subTask startTransfer:NO];
            subTask.status = AWSS3TransferUtilityTransferStatusWaiting;
            [multiPartUploadTask.waitingPartsDictionary setObject:subTask forKey:@(subTask.taskIdentifier)];
        }
        else if ([obj isKindOfClass:[AWSS3TransferUtilityDownloadTask class]]) {
            
            AWSS3TransferUtilityDownloadTask *downloadTask = obj;
            
            if (downloadTask.status == AWSS3TransferUtilityTransferStatusCompleted ) {
                [self.completedTaskDictionary setObject:downloadTask forKey:downloadTask.transferID];
                [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:downloadTask.transferID taskIdentifier:[taskIdentifier integerValue] databaseQueue:self->_databaseQueue ];
                AWSDDLogDebug(@"Deleted transfer request from DB");
            }
            else if (downloadTask.status == AWSS3TransferUtilityTransferStatusPaused) {
                //If the transfer was paused, create another NSURLSession task and leave it in an paused state
                [ self createDownloadTask:downloadTask startTransfer:NO];
            }
            else {
                //Transfer is in progress according to us, but not present in the NSURLSession. It may have been sucessfully completed. Do not retry.
                //Mark the status as unknown. The app developer should check to see if the S3 file was uploaded in the app logic and reinitate the transfer if required.
                
                downloadTask.status = AWSS3TransferUtilityTransferStatusUnknown;
                [self.completedTaskDictionary setObject:downloadTask forKey:downloadTask.transferID];
                [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:downloadTask.transferID taskIdentifier:[taskIdentifier integerValue] databaseQueue:self->_databaseQueue ];
                AWSDDLogDebug(@"Deleted transfer request from DB");
            }
        }
    }
    
    //Multipart transfer uses a relay style architecture. At any point in time, n parts are in progress and each part triggers the next part to start when it is finished.
    //During the recovery process, it is possible for the multipart transfer to not have an adequate number of parts in progress.
    //This loop below will check and ensure that the correct number of concurrent transfers are in progress.
    for (id obj in [tempMultiPartMasterTaskDictionary allKeys]) {
        NSString *uploadID = obj;
        
        AWSS3TransferUtilityMultiPartUploadTask *multiPartUploadTask = [tempMultiPartMasterTaskDictionary objectForKey:uploadID];
        [self.taskDictionary setObject:multiPartUploadTask forKey:multiPartUploadTask.uploadID];
        
        AWSDDLogDebug(@"Multipart transfer status is [%@]", @(multiPartUploadTask.status));
        
        if (multiPartUploadTask.status == AWSS3TransferUtilityTransferStatusPaused) {
            continue;
        }
        
        long numberOfPartsInProgress = 0;
        while (numberOfPartsInProgress < [self.transferUtilityConfiguration.multiPartConcurrencyLimit integerValue]) {
            if ([multiPartUploadTask.waitingPartsDictionary count] > 0) {
                //Get a part from the waitingList
                AWSS3TransferUtilityUploadSubTask *nextSubTask = [[multiPartUploadTask.waitingPartsDictionary allValues] objectAtIndex:0];
                
                //Add to inProgress list
                [multiPartUploadTask.inProgressPartsDictionary setObject:nextSubTask forKey:@(nextSubTask.taskIdentifier)];
               
                //Remove it from the waitingList
                [multiPartUploadTask.waitingPartsDictionary removeObjectForKey:@(nextSubTask.taskIdentifier)];
                AWSDDLogDebug(@"Moving Task[%@] to progress for Multipart[%@]", @(nextSubTask.taskIdentifier), multiPartUploadTask.uploadID);
                [nextSubTask.sessionTask resume];
            
                numberOfPartsInProgress++;
                continue;
            }
            break;
        }
    }
}

-(AWSS3TransferUtilityUploadTask *) hydrateUploadTask: (NSMutableDictionary *) task
                                    sessionIdentifier: (NSString *) sessionIdentifier
                                        databaseQueue: (AWSFMDatabaseQueue *) databaseQueue
{
    AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = [AWSS3TransferUtilityUploadTask new];
    transferUtilityUploadTask.nsURLSessionID = sessionIdentifier;
    transferUtilityUploadTask.databaseQueue = databaseQueue;
    transferUtilityUploadTask.transferType = [task objectForKey:@"transfer_type"];
    transferUtilityUploadTask.bucket = [task objectForKey:@"bucket_name"];
    transferUtilityUploadTask.key = [task objectForKey:@"key"];
    transferUtilityUploadTask.expression = [AWSS3TransferUtilityUploadExpression new];
    transferUtilityUploadTask.expression.internalRequestHeaders = [[AWSS3TransferUtilityDatabaseHelper getDictionaryFromJson:[task objectForKey:@"request_headers"]] mutableCopy];
    transferUtilityUploadTask.expression.internalRequestParameters = [[AWSS3TransferUtilityDatabaseHelper getDictionaryFromJson:[task objectForKey:@"request_parameters"]] mutableCopy];
    transferUtilityUploadTask.transferID = [task objectForKey:@"transfer_id"];
    transferUtilityUploadTask.file = [task objectForKey:@"file"];
    transferUtilityUploadTask.cancelled = NO;
    transferUtilityUploadTask.retryCount = [[task objectForKey:@"retry_count"] intValue];
    transferUtilityUploadTask.temporaryFileCreated = [[task objectForKey:@"temporary_file_created"] boolValue];
    NSNumber *statusValue = [task objectForKey:@"status"];
    transferUtilityUploadTask.status = [statusValue intValue];
    return transferUtilityUploadTask;
}


- (AWSS3TransferUtilityDownloadTask *) hydrateDownloadTask: (NSMutableDictionary *) task
                                         sessionIdentifier: (NSString *) sessionIdentifier
                                             databaseQueue: (AWSFMDatabaseQueue *) databaseQueue
{
    AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask = [AWSS3TransferUtilityDownloadTask new];
    transferUtilityDownloadTask.nsURLSessionID = sessionIdentifier;
    transferUtilityDownloadTask.databaseQueue = databaseQueue;
    transferUtilityDownloadTask.transferType = [task objectForKey:@"transfer_type"];
    transferUtilityDownloadTask.bucket = [task objectForKey:@"bucket_name"];
    transferUtilityDownloadTask.key = [task objectForKey:@"key"];
    transferUtilityDownloadTask.expression = [AWSS3TransferUtilityDownloadExpression new];
    transferUtilityDownloadTask.expression.internalRequestHeaders = [[AWSS3TransferUtilityDatabaseHelper getDictionaryFromJson:[task objectForKey:@"request_headers"]] mutableCopy];
    transferUtilityDownloadTask.expression.internalRequestParameters = [[AWSS3TransferUtilityDatabaseHelper getDictionaryFromJson:[task objectForKey:@"request_parameters"]] mutableCopy];
    transferUtilityDownloadTask.transferID = [task objectForKey:@"transfer_id"];
    transferUtilityDownloadTask.file = [task objectForKey:@"file"];
    transferUtilityDownloadTask.cancelled = NO;
    transferUtilityDownloadTask.retryCount = [[task objectForKey:@"retry_count"] intValue];
    NSNumber *statusValue = [task objectForKey:@"status"];
    transferUtilityDownloadTask.status = [statusValue intValue];
    return transferUtilityDownloadTask;
}


-( AWSS3TransferUtilityMultiPartUploadTask *) hydrateMultiPartUploadTask: (NSMutableDictionary *) task
                                                       sessionIdentifier: (NSString *) sessionIdentifier
                                                           databaseQueue: (AWSFMDatabaseQueue *) databaseQueue
{
    AWSS3TransferUtilityMultiPartUploadTask *transferUtilityMultiPartUploadTask = [AWSS3TransferUtilityMultiPartUploadTask new];
    transferUtilityMultiPartUploadTask.nsURLSessionID = sessionIdentifier;
    transferUtilityMultiPartUploadTask.databaseQueue = databaseQueue;
    transferUtilityMultiPartUploadTask.transferType = [task objectForKey:@"transfer_type"];
    transferUtilityMultiPartUploadTask.bucket = [task objectForKey:@"bucket_name"];
    transferUtilityMultiPartUploadTask.key = [task objectForKey:@"key"];
    transferUtilityMultiPartUploadTask.expression = [AWSS3TransferUtilityMultiPartUploadExpression new];
    transferUtilityMultiPartUploadTask.expression.internalRequestHeaders = [[AWSS3TransferUtilityDatabaseHelper getDictionaryFromJson:[task objectForKey:@"request_headers"]] mutableCopy];
    transferUtilityMultiPartUploadTask.expression.internalRequestParameters = [[AWSS3TransferUtilityDatabaseHelper getDictionaryFromJson:[task objectForKey:@"request_parameters"]] mutableCopy];
    transferUtilityMultiPartUploadTask.transferID = [task objectForKey:@"transfer_id"];
    transferUtilityMultiPartUploadTask.file = [task objectForKey:@"file"];
    transferUtilityMultiPartUploadTask.temporaryFileCreated = [[task objectForKey:@"temporary_file_created"] boolValue];
    transferUtilityMultiPartUploadTask.contentLength = [task objectForKey:@"content_length"];
    transferUtilityMultiPartUploadTask.progress.totalUnitCount = [transferUtilityMultiPartUploadTask.contentLength longLongValue];
    transferUtilityMultiPartUploadTask.cancelled = NO;
    transferUtilityMultiPartUploadTask.retryCount = [[task objectForKey:@"retry_count"] intValue];
    transferUtilityMultiPartUploadTask.uploadID = [task objectForKey:@"multi_part_id"];
    NSNumber *statusValue = [task objectForKey:@"status"];
    transferUtilityMultiPartUploadTask.status = [statusValue intValue];
    return transferUtilityMultiPartUploadTask;
}

- (AWSS3TransferUtilityUploadSubTask * ) hydrateMultiPartUploadSubTask:(NSMutableDictionary *) task
                                                         sessionTaskID: (int) sessionTaskID
{
    AWSS3TransferUtilityUploadSubTask *subTask = [AWSS3TransferUtilityUploadSubTask new];
    subTask.taskIdentifier = sessionTaskID;
    subTask.transferType = [task objectForKey:@"transfer_type"];
    subTask.file = [task objectForKey:@"file"];
    subTask.partNumber = [task objectForKey:@"part_number"];
    subTask.eTag =[task objectForKey:@"etag"];
    subTask.uploadID = [task objectForKey:@"multi_part_id"];
    subTask.transferID = [task objectForKey:@"transfer_id"];
    subTask.totalBytesExpectedToSend = [[task objectForKey:@"content_length"] integerValue];
    
    NSNumber *statusValue = [task objectForKey:@"status"];
    subTask.status = [statusValue intValue];
    return subTask;
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
    AWSTask *error = [self validateParameters:bucket key:key fileURL:fileURL accelerationModeEnabled:self.transferUtilityConfiguration.isAccelerateModeEnabled];
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
    transferUtilityUploadTask.transferType = @"UPLOAD";
    transferUtilityUploadTask.bucket = bucket;
    transferUtilityUploadTask.key = key;
    transferUtilityUploadTask.retryCount = 0;
    transferUtilityUploadTask.expression = expression;
    transferUtilityUploadTask.transferID = [[NSUUID UUID] UUIDString];
    transferUtilityUploadTask.file = [fileURL path];
    transferUtilityUploadTask.cancelled = NO;
    transferUtilityUploadTask.temporaryFileCreated = temporaryFileCreated;
    transferUtilityUploadTask.responseData = @"";
    transferUtilityUploadTask.status = AWSS3TransferUtilityTransferStatusInProgress;
    
    //Add to Database
    [AWSS3TransferUtilityDatabaseHelper insertUploadTransferRequestInDB:transferUtilityUploadTask databaseQueue:self->_databaseQueue];
    
    return [self createUploadTask:transferUtilityUploadTask];
}

-(AWSTask<AWSS3TransferUtilityUploadTask *> *) createUploadTask: (AWSS3TransferUtilityUploadTask *) transferUtilityUploadTask {
    return [self createUploadTask:transferUtilityUploadTask startTransfer:YES];
}


-(AWSTask<AWSS3TransferUtilityUploadTask *> *) createUploadTask: (AWSS3TransferUtilityUploadTask *) transferUtilityUploadTask startTransfer:(BOOL) startTransfer {
    //Create PreSigned URL Request
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = transferUtilityUploadTask.bucket;
    getPreSignedURLRequest.key = transferUtilityUploadTask.key;
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:_transferUtilityConfiguration.timeoutIntervalForResource];
    AWSDDLogDebug(@"Value of timeoutIntervalForResource is %ld", (long)_transferUtilityConfiguration.timeoutIntervalForResource);
    getPreSignedURLRequest.minimumCredentialsExpirationInterval = _transferUtilityConfiguration.timeoutIntervalForResource;
    getPreSignedURLRequest.accelerateModeEnabled = self.transferUtilityConfiguration.isAccelerateModeEnabled;
    
    [transferUtilityUploadTask.expression assignRequestHeaders:getPreSignedURLRequest];
    [transferUtilityUploadTask.expression assignRequestParameters:getPreSignedURLRequest];
    
    return [[self.preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {
        NSURL *presignedURL = task.result;
        NSError *error = task.error;
        if ( error ) {
            AWSDDLogError(@"Error: %@", error);
            return [AWSTask taskWithError:error];
        }
        
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
        if ( startTransfer) {
            transferUtilityUploadTask.status = AWSS3TransferUtilityTransferStatusInProgress;
        }
        else {
            transferUtilityUploadTask.status = AWSS3TransferUtilityTransferStatusPaused;
        }
        
        AWSDDLogDebug(@"Setting taskIdentifier to %@", @(transferUtilityUploadTask.sessionTask.taskIdentifier));
        
        //Add to task Dictionary
        [self.taskDictionary setObject:transferUtilityUploadTask forKey:@(transferUtilityUploadTask.sessionTask.taskIdentifier) ];
        
        //Update Database
        [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:transferUtilityUploadTask.transferID
                                                           partNumber:[NSNumber numberWithInt:0]
                                                       taskIdentifier:transferUtilityUploadTask.sessionTask.taskIdentifier
                                                                 eTag:@""
                                                               status:transferUtilityUploadTask.status
                                                          retry_count:transferUtilityUploadTask.retryCount
                                                        databaseQueue:self->_databaseQueue];
        if (startTransfer) {
            [uploadTask resume];
        }
        
        return [AWSTask taskWithResult:transferUtilityUploadTask];
    }];
}


- (void) retryUpload: (AWSS3TransferUtilityUploadTask *) transferUtilityUploadTask {
    //Remove from taskDictionary
    [self.taskDictionary removeObjectForKey:@(transferUtilityUploadTask.taskIdentifier)];
   
    //Remove from Database
    [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:transferUtilityUploadTask.transferID taskIdentifier:transferUtilityUploadTask.taskIdentifier databaseQueue:_databaseQueue ];
    
    AWSDDLogDebug(@"Removed object from key %@", @(transferUtilityUploadTask.taskIdentifier) );
    transferUtilityUploadTask.retryCount = transferUtilityUploadTask.retryCount + 1;
    
    //Check if the file to be uploaded still exists. Otherwise, fail the transfer and call the completion handler with the error.
    if (![[NSFileManager defaultManager] fileExistsAtPath:transferUtilityUploadTask.file]) {
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Local file not found"
                                                             forKey:@"Message"];
        
        NSError *error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                                          code:AWSS3TransferUtilityErrorLocalFileNotFound
                                                      userInfo:userInfo];
        
        if (transferUtilityUploadTask.expression.completionHandler) {
            transferUtilityUploadTask.expression.completionHandler(transferUtilityUploadTask, error);
        }
    }
    else {
        //This will update the AWSS3TransferUtilityUploadTask passed into it with a new URL Session
        //task and add it into the task Dictionary.
        [self createUploadTask:transferUtilityUploadTask];
    }
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
    AWSTask *error = [self validateParameters:bucket key:key fileURL:fileURL  accelerationModeEnabled:self.transferUtilityConfiguration.isAccelerateModeEnabled];
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
    transferUtilityMultiPartUploadTask.transferType = @"MULTI_PART_UPLOAD";
    transferUtilityMultiPartUploadTask.bucket = bucket;
    transferUtilityMultiPartUploadTask.key = key;
    transferUtilityMultiPartUploadTask.expression = expression;
    transferUtilityMultiPartUploadTask.transferID = [[NSUUID UUID] UUIDString];
    transferUtilityMultiPartUploadTask.file = [fileURL path];
    transferUtilityMultiPartUploadTask.retryCount = 0;
    transferUtilityMultiPartUploadTask.temporaryFileCreated = temporaryFileCreated;
    transferUtilityMultiPartUploadTask.status = AWSS3TransferUtilityTransferStatusInProgress;
    
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

        //Check if the uploadId is null to safeguard from crash reported in https://github.com/aws/aws-sdk-ios/issues/1060
        if (output.uploadId == (id) [NSNull null] || output.uploadId.length == 0 ) {
            AWSDDLogError(@"MultiPartUploadID is null - Failing Transfer");
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"MultiPartUploadID is null - Failing Transfer"
                                                                 forKey:@"Message"];

            NSError *error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                                 code:AWSS3TransferUtilityErrorServerError
                                             userInfo:userInfo];
            return [AWSTask taskWithError:error];
         }

        transferUtilityMultiPartUploadTask.uploadID = output.uploadId;
        
        //Save the Multipart Upload in the DB
        [AWSS3TransferUtilityDatabaseHelper insertMultiPartUploadRequestInDB:transferUtilityMultiPartUploadTask databaseQueue:self->_databaseQueue];
        
        AWSDDLogInfo(@"Initiated multipart upload on server: %@", output.uploadId);
        AWSDDLogInfo(@"Concurrency Limit is %@", self.transferUtilityConfiguration.multiPartConcurrencyLimit);
        //Loop through the file and upload the parts one by one
        for (int32_t i = 1; i <= partCount ; i++) {
            NSUInteger dataLength = AWSS3TransferUtilityMultiPartSize;
            if (i == partCount) {
                dataLength = fileSize - ( (i-1) * AWSS3TransferUtilityMultiPartSize);
            }
           
            AWSS3TransferUtilityUploadSubTask *subTask = [AWSS3TransferUtilityUploadSubTask new];
            subTask.transferID = transferUtilityMultiPartUploadTask.transferID;
            subTask.partNumber = @(i);
            subTask.transferType = @"MULTI_PART_UPLOAD_SUB_TASK";
            subTask.totalBytesExpectedToSend = dataLength;
            subTask.totalBytesSent = (long long) 0;
            subTask.responseData = @"";
            subTask.file = @"";
            subTask.eTag = @"";
            
            //Save in Database
            [AWSS3TransferUtilityDatabaseHelper insertMultiPartUploadRequestSubTaskInDB:transferUtilityMultiPartUploadTask subTask:subTask databaseQueue:self.databaseQueue];
            
            NSError *subTaskCreationError;
            
            //Move to inProgress or Waiting based on concurrency limit
            if (i <= [self.transferUtilityConfiguration.multiPartConcurrencyLimit integerValue]) {
                subTaskCreationError = [self createUploadSubTask:transferUtilityMultiPartUploadTask subTask:subTask startTransfer:NO internalDictionaryToAddSubTaskTo:transferUtilityMultiPartUploadTask.inProgressPartsDictionary];
                if(!subTaskCreationError) {
                    subTask.status = AWSS3TransferUtilityTransferStatusInProgress;
                    AWSDDLogDebug(@"Added task for part [%@] to inProgress list", subTask.partNumber);
                }
            }
            else {
                subTaskCreationError = [self createUploadSubTask:transferUtilityMultiPartUploadTask subTask:subTask startTransfer:NO internalDictionaryToAddSubTaskTo:transferUtilityMultiPartUploadTask.waitingPartsDictionary];
                if (!subTaskCreationError ) {
                    subTask.status = AWSS3TransferUtilityTransferStatusWaiting;
                    AWSDDLogDebug(@"Added task for part [%@] to Waiting list", subTask.partNumber);
                }
            }
            
            if ( subTaskCreationError) {
                //Abort the request, so the server can clean up any partials.
                [self callAbortMultiPartForUploadTask:transferUtilityMultiPartUploadTask];
                transferUtilityMultiPartUploadTask.status = AWSS3TransferUtilityTransferStatusError;

                //Add it to list of completed Tasks
                [self.completedTaskDictionary setObject:transferUtilityMultiPartUploadTask forKey:transferUtilityMultiPartUploadTask.transferID];
                
                //Clean up.
                [self cleanupForMultiPartUploadTask:transferUtilityMultiPartUploadTask];
                return [AWSTask taskWithError:subTaskCreationError];
            };
            
        }
        
        //Start the subTasks
        for(id taskIdentifier in transferUtilityMultiPartUploadTask.inProgressPartsDictionary) {
            AWSS3TransferUtilityUploadSubTask *subTask = [transferUtilityMultiPartUploadTask.inProgressPartsDictionary objectForKey:taskIdentifier];
            AWSDDLogDebug(@"Starting subTask %@", @(subTask.taskIdentifier));
            [subTask.sessionTask resume];
        }
        
        return [AWSTask taskWithResult:transferUtilityMultiPartUploadTask];
    }];
    return [AWSTask taskWithResult:transferUtilityMultiPartUploadTask];
}

-(NSString *) createTemporaryFileForPart: (NSString *) fileName
                              partNumber: (long) partNumber
                              dataLength: (NSUInteger) dataLength
                                   error: (NSError **) error{
   
    //Check if the file exists.
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileName]) {
        NSString *errorMessage = [NSString stringWithFormat:@"Local file not found. Unable to process Part #: %ld", partNumber];
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errorMessage
                                                             forKey:@"Message"];
        if (error) {
            *error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                             code:AWSS3TransferUtilityErrorLocalFileNotFound
                                         userInfo:userInfo];
        }
        return nil;
    }
    
    //Setup the file pointers
    bool errorOccured = NO;
    FILE *readFilePointer = fopen([fileName UTF8String], "rb");
    fseek(readFilePointer, (partNumber - 1) * AWSS3TransferUtilityMultiPartSize, SEEK_SET);
    NSString *partFile = [self.cacheDirectoryPath stringByAppendingPathComponent:[[NSUUID UUID] UUIDString]];
    FILE *writeFilePointer = fopen([partFile UTF8String], "wb");
    int bufferSize = 256 * 1024;
    char *buffer = (char *)malloc(bufferSize);
    unsigned long counter = 0;
  
    //Copy file into part file
    while ( counter < dataLength && !feof(readFilePointer)) {
        //Calculate number of bytes left to read.
        unsigned long bytesToRead = MIN(bufferSize, (dataLength - counter));
        
        //Read. This function will return the number of bytes actually read and it must equal what was requested.
        if ( fread(buffer, 1, bytesToRead, readFilePointer) != bytesToRead )  {
            errorOccured = YES;
            break;
        }
      
        //Write. This function will return the number of bytes actually written and it must equal what was requested.
        unsigned long bytesToWrite =  bytesToRead;
        if (fwrite(buffer, 1, bytesToWrite, writeFilePointer) != bytesToWrite) {
            errorOccured = YES;
            break;
        }
        counter += bytesToRead;
    }
    
    //Close file pointers
    fclose(readFilePointer);
    fclose(writeFilePointer);
    free(buffer);
    
    if (errorOccured) {
        NSString *errorMessage = [NSString stringWithFormat:@"Unable to process Part #: %ld", partNumber];
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errorMessage
                                                             forKey:@"Message"];
        if (error) {
            *error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                     code:AWSS3TransferUtilityErrorClientError
                                 userInfo:userInfo];
        }
        return nil;
    }
    
    return partFile;
}



-(NSError *) createUploadSubTask:(AWSS3TransferUtilityMultiPartUploadTask *) transferUtilityMultiPartUploadTask
                         subTask: (AWSS3TransferUtilityUploadSubTask *) subTask
internalDictionaryToAddSubTaskTo: (NSMutableDictionary *) internalDictionaryToAddSubTaskTo

{
    return [self createUploadSubTask:transferUtilityMultiPartUploadTask subTask:subTask startTransfer:YES internalDictionaryToAddSubTaskTo:internalDictionaryToAddSubTaskTo];
}

-(NSError *) createUploadSubTask:(AWSS3TransferUtilityMultiPartUploadTask *) transferUtilityMultiPartUploadTask
                    subTask: (AWSS3TransferUtilityUploadSubTask *) subTask
                   startTransfer: (BOOL) startTransfer
       internalDictionaryToAddSubTaskTo: (NSMutableDictionary *) internalDictionaryToAddSubTaskTo
{
    __block NSError *error = nil;
    //Create a temporary part file if required.
    if (!(subTask.file || [subTask.file isEqualToString:@""]) || ![[NSFileManager defaultManager] fileExistsAtPath:subTask.file]) {
        //Create a temporary file for this part.
        NSString * partFileName = [self createTemporaryFileForPart:transferUtilityMultiPartUploadTask.file partNumber:[subTask.partNumber integerValue] dataLength:subTask.totalBytesExpectedToSend error:&error];
        if (partFileName == nil)  {
            //Unable to create partFile. Send back error object to indicate that createUploadSubtask failed.
            return error;
        }
        subTask.file = partFileName;
    }
    
    //Create a presignedURL for this part.
    AWSS3GetPreSignedURLRequest *request = [AWSS3GetPreSignedURLRequest new];
    request.bucket = transferUtilityMultiPartUploadTask.bucket;
    request.key = transferUtilityMultiPartUploadTask.key;
    request.partNumber = subTask.partNumber;
    request.uploadID = transferUtilityMultiPartUploadTask.uploadID;
    request.HTTPMethod = AWSHTTPMethodPUT;
    
    request.expires = [NSDate dateWithTimeIntervalSinceNow:_transferUtilityConfiguration.timeoutIntervalForResource];
    request.minimumCredentialsExpirationInterval = _transferUtilityConfiguration.timeoutIntervalForResource;
    request.accelerateModeEnabled = self.transferUtilityConfiguration.isAccelerateModeEnabled;
    [self filterAndAssignHeaders:transferUtilityMultiPartUploadTask.expression.requestHeaders getPresignedURLRequest:request
                      URLRequest:nil];
    
    [transferUtilityMultiPartUploadTask.expression assignRequestParameters:request];

    [[[self.preSignedURLBuilder getPreSignedURL:request] continueWithBlock:^id(AWSTask *task) {
        error = task.error;
        if ( error ) {
            return nil;
        }

        NSURL *presignedURL = task.result;
        NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:presignedURL];
         urlRequest.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
         urlRequest.HTTPMethod = @"PUT";
        [self filterAndAssignHeaders:transferUtilityMultiPartUploadTask.expression.requestHeaders
              getPresignedURLRequest:nil URLRequest: urlRequest];
        [ urlRequest setValue:[self.configuration.userAgent stringByAppendingString:@" MultiPart"] forHTTPHeaderField:@"User-Agent"];
        NSURLSessionUploadTask *nsURLUploadTask = nil;
        NSString *exceptionReason = @"";
        @try {
            nsURLUploadTask  = [self->_session uploadTaskWithRequest:urlRequest
                                                            fromFile:[NSURL fileURLWithPath:subTask.file]];
        }
        @catch (NSException *exception) {
            AWSDDLogDebug(@"Exception in upload task %@", exception.debugDescription);
            exceptionReason = [exception.reason copy];
            nsURLUploadTask = nil;
        }
        if (nsURLUploadTask == nil) {
            NSString *errorMessage = [NSString stringWithFormat:@"Exception from upload task."];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                      errorMessage, @"Message", exceptionReason, @"Reason", nil];
            error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                        code:AWSS3TransferUtilityErrorUnknown
                                    userInfo:userInfo];
            return nil;
            
        }
        //Create subtask to track this upload
        subTask.sessionTask = nsURLUploadTask;
        subTask.taskIdentifier = nsURLUploadTask.taskIdentifier;
        if (startTransfer) {
            subTask.status = AWSS3TransferUtilityTransferStatusInProgress;
        }
        else {
            subTask.status = AWSS3TransferUtilityTransferStatusPaused;
        }
       
        //Register transferUtilityMultiPartUploadTask into the taskDictionary for easy lookup in the NSURLCallback
        [self->_taskDictionary setObject:transferUtilityMultiPartUploadTask forKey:@(subTask.taskIdentifier)];
        
        //Add to required internal dictionary
        [internalDictionaryToAddSubTaskTo setObject:subTask forKey:@(subTask.taskIdentifier)];
        
        //Update Database
        [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:subTask.transferID
                                                           partNumber:subTask.partNumber
                                                       taskIdentifier:subTask.sessionTask.taskIdentifier
                                                                 eTag:@""
                                                               status:subTask.status
                                                          retry_count:transferUtilityMultiPartUploadTask.retryCount
                                                        databaseQueue:self.databaseQueue];
       
        return nil;
    }] waitUntilFinished];
    return error;
}

-(void) retryUploadSubTask: (AWSS3TransferUtilityMultiPartUploadTask *) transferUtilityMultiPartUploadTask
                   subTask: (AWSS3TransferUtilityUploadSubTask *) subTask
             startTransfer: (BOOL) startTransfer {
    
    //Track if the task to be retried is in the waiting  or inprogress list
    BOOL inWaitingPartsDictionary = NO;
    
    [self.taskDictionary removeObjectForKey:@(subTask.taskIdentifier)];
    if ([transferUtilityMultiPartUploadTask.inProgressPartsDictionary objectForKey:@(subTask.taskIdentifier)] ) {
        [transferUtilityMultiPartUploadTask.inProgressPartsDictionary removeObjectForKey:@(subTask.taskIdentifier)];
        transferUtilityMultiPartUploadTask.retryCount = transferUtilityMultiPartUploadTask.retryCount + 1;
    }
    else if ([transferUtilityMultiPartUploadTask.waitingPartsDictionary objectForKey:@(subTask.taskIdentifier)] ) {
        [transferUtilityMultiPartUploadTask.waitingPartsDictionary removeObjectForKey:@(subTask.taskIdentifier)];
        inWaitingPartsDictionary = YES;
    }
    
    //Check if the part file exists
    if (![[NSFileManager defaultManager] fileExistsAtPath:subTask.file]) {
        //Set it to nil. This will force the creatUploadSubTask to create the part from the main file
        subTask.file = nil;
    }
    
    NSError *subTaskCreationError;
    
    if (inWaitingPartsDictionary ) {
        subTaskCreationError = [self createUploadSubTask:transferUtilityMultiPartUploadTask subTask:subTask startTransfer:startTransfer internalDictionaryToAddSubTaskTo:transferUtilityMultiPartUploadTask.waitingPartsDictionary];
    }
    else {
        subTaskCreationError = [self createUploadSubTask:transferUtilityMultiPartUploadTask subTask:subTask startTransfer:startTransfer internalDictionaryToAddSubTaskTo:transferUtilityMultiPartUploadTask.inProgressPartsDictionary];
    }
    
    if ( subTaskCreationError ) {
        //cancel the multipart transfer
        [transferUtilityMultiPartUploadTask cancel];
        transferUtilityMultiPartUploadTask.status = AWSS3TransferUtilityTransferStatusError;
        
        //Call the completion handler if one was present
        if (transferUtilityMultiPartUploadTask.expression.completionHandler) {
            transferUtilityMultiPartUploadTask.expression.completionHandler(transferUtilityMultiPartUploadTask, subTaskCreationError);
        }
    }
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
    //Validate that bucket and key have been specified.
    AWSTask *error = [self validateParameters:bucket key:key accelerationModeEnabled:self.transferUtilityConfiguration.isAccelerateModeEnabled];
    if (error) {
        return error;
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
    transferUtilityDownloadTask.transferType = @"DOWNLOAD";
    transferUtilityDownloadTask.location = fileURL;
    transferUtilityDownloadTask.bucket = bucket;
    transferUtilityDownloadTask.key = key;
    transferUtilityDownloadTask.expression = expression;
    transferUtilityDownloadTask.transferID = [[NSUUID UUID] UUIDString];
    transferUtilityDownloadTask.file = [fileURL absoluteString];
    transferUtilityDownloadTask.cancelled = NO;
    transferUtilityDownloadTask.retryCount = 0;
    transferUtilityDownloadTask.responseData = @"";
    transferUtilityDownloadTask.status = AWSS3TransferUtilityTransferStatusInProgress;
    
    //Create task in database
    [AWSS3TransferUtilityDatabaseHelper insertDownloadTransferRequestInDB:transferUtilityDownloadTask databaseQueue:self->_databaseQueue];
    
    return [self createDownloadTask:transferUtilityDownloadTask];
}

-(AWSTask<AWSS3TransferUtilityDownloadTask *> *) createDownloadTask: (AWSS3TransferUtilityDownloadTask *) transferUtilityDownloadTask {
    return [self createDownloadTask:transferUtilityDownloadTask startTransfer:YES];
}

-(AWSTask<AWSS3TransferUtilityDownloadTask *> *) createDownloadTask: (AWSS3TransferUtilityDownloadTask *) transferUtilityDownloadTask
                                                      startTransfer: (BOOL) startTransfer {
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = transferUtilityDownloadTask.bucket;
    getPreSignedURLRequest.key = transferUtilityDownloadTask.key;
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:_transferUtilityConfiguration.timeoutIntervalForResource];
    getPreSignedURLRequest.minimumCredentialsExpirationInterval = _transferUtilityConfiguration.timeoutIntervalForResource;
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
        if (startTransfer) {
            transferUtilityDownloadTask.status = AWSS3TransferUtilityTransferStatusInProgress;
        }
        else {
            transferUtilityDownloadTask.status = AWSS3TransferUtilityTransferStatusPaused;
        }
        AWSDDLogDebug(@"Setting taskIdentifier to %@", @(transferUtilityDownloadTask.sessionTask.taskIdentifier));
        
        //Add to taskDictionary
        [self.taskDictionary setObject:transferUtilityDownloadTask forKey:@(transferUtilityDownloadTask.sessionTask.taskIdentifier) ];
        
        //Update Database
        [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:transferUtilityDownloadTask.transferID
                                                           partNumber:[NSNumber numberWithInt:0]
                                                       taskIdentifier:transferUtilityDownloadTask.sessionTask.taskIdentifier
                                                                 eTag:@""
                                                               status:transferUtilityDownloadTask.status
                                                          retry_count:transferUtilityDownloadTask.retryCount
                                                        databaseQueue:self.databaseQueue];
        
        if ( startTransfer) {
            [downloadTask resume];
        }
        return [AWSTask taskWithResult:transferUtilityDownloadTask];
    }];
}

- (void) retryDownload: (AWSS3TransferUtilityDownloadTask *) transferUtilityDownloadTask {
    
    //Remove from taskDictionary
    [self.taskDictionary removeObjectForKey:@(transferUtilityDownloadTask.sessionTask.taskIdentifier)];
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
    [allTasks addObjectsFromArray:[self getUploadTasks].result];
    [allTasks addObjectsFromArray:[self getDownloadTasks].result];
    [completionSource setResult:allTasks];
    return completionSource.task;
}

- (AWSTask *)getUploadTasks {
    AWSTaskCompletionSource *completionSource = [AWSTaskCompletionSource new];
    NSMutableSet *transferIDs = [NSMutableSet new];
    NSString *className = NSStringFromClass(AWSS3TransferUtilityUploadTask.class);
    NSMutableArray *allTasks = [self getTasksHelper:self.completedTaskDictionary transferIDs:transferIDs className:className];
    [allTasks addObjectsFromArray:[self getTasksHelper:self.taskDictionary transferIDs:transferIDs className:className]];
    [completionSource setResult:allTasks];
    return completionSource.task;
}

- (AWSTask *)getDownloadTasks {
    AWSTaskCompletionSource *completionSource = [AWSTaskCompletionSource new];
    NSMutableSet *transferIDs = [NSMutableSet new];
    NSString *className = NSStringFromClass(AWSS3TransferUtilityDownloadTask.class);
    
    NSMutableArray *allTasks = [self getTasksHelper:self.completedTaskDictionary transferIDs:transferIDs className:className];
    [allTasks addObjectsFromArray:[self getTasksHelper:self.taskDictionary transferIDs:transferIDs className:className]];
    [completionSource setResult:allTasks];
    return completionSource.task;
}


- (AWSTask *)getMultiPartUploadTasks {
    AWSTaskCompletionSource *completionSource = [AWSTaskCompletionSource new];
    NSMutableSet *transferIDs = [NSMutableSet new];
    NSString *className = NSStringFromClass(AWSS3TransferUtilityMultiPartUploadTask.class);

    NSMutableArray *allTasks = [self getTasksHelper:self.completedTaskDictionary transferIDs:transferIDs className:className];
    [allTasks addObjectsFromArray:[self getTasksHelper:self.taskDictionary transferIDs:transferIDs className:className]];
    
    [completionSource setResult:allTasks];
    return completionSource.task;
}


- (NSMutableArray *) getTasksHelper:(AWSSynchronizedMutableDictionary *)dictionary
                             transferIDs:(NSMutableSet *) transferIDs
                               className: (NSString *) className {
    NSMutableArray *tasks = [NSMutableArray new];
    for (id key in [dictionary allKeys]) {
        id value = [dictionary objectForKey:key];
        NSString * taskClassName = NSStringFromClass([value class]);
        if ([className isEqualToString:taskClassName]) {
            AWSS3TransferUtilityTask *task = value;
            if ([transferIDs containsObject:task.transferID]) {
                continue;
            }
            [transferIDs addObject:task.transferID];
            [tasks addObject:value];
        }
    }
    return tasks;
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
    AWSDDLogDebug(@"interceptApplication called for URLSession [%@]", identifier);
    
    // For the default service client
    if ([identifier isEqualToString:_defaultS3TransferUtility.sessionIdentifier]) {
        _defaultS3TransferUtility.backgroundURLSessionCompletionHandler = completionHandler;
    }
    
    // For the SDK managed service clients
    for (NSString *key in [_serviceClients allKeys]) {
        AWSS3TransferUtility *transferUtility = [_serviceClients objectForKey:key];
        if ([identifier isEqualToString:transferUtility.sessionIdentifier]) {
            AWSDDLogDebug(@"Setting completion handler for urlSession [%@]", identifier);
            
            transferUtility.backgroundURLSessionCompletionHandler = completionHandler;
        }
    }
}

#pragma mark - NSURLSessionDelegate

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session {
    AWSDDLogDebug(@"URLSessionDidFinishEventsForBackgroundURLSession called for NSURLSession %@", _sessionIdentifier);
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.backgroundURLSessionCompletionHandler) {
            self.backgroundURLSessionCompletionHandler();
        }
    });
}

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error {
     AWSDDLogDebug(@"didBecomeInvalidWithError called for NSURLSession %@", _sessionIdentifier);
    [[NSNotificationCenter defaultCenter] postNotificationName:AWSS3TransferUtilityURLSessionDidBecomeInvalidNotification object:self];
    [_serviceClients removeObject:self];
}

#pragma mark - NSURLSessionTaskDelegate

- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error {
    AWSDDLogDebug(@"Thread:%@: didCompleteWithError called for task %lu", [NSThread currentThread], (unsigned long)task.taskIdentifier);
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
        
        id transferUtilityTask = [self.taskDictionary objectForKey:@(task.taskIdentifier)];
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
            
            uploadTask.error = error;
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
                    [self extractErrorInformation: [[NSString alloc] initWithData:[uploadTask data] encoding:NSASCIIStringEncoding]
                                userInfo: userInfo];
                } else {
                    [self extractErrorInformation: [uploadTask responseData]
                                userInfo: userInfo];
                }
                NSError *updatedError = [[NSError alloc] initWithDomain:error.domain code:error.code userInfo:userInfo];
                
                uploadTask.error = updatedError;
            }
            
            //Mark status as completed if there is no error.
            if (! uploadTask.error ) {
                uploadTask.status = AWSS3TransferUtilityTransferStatusCompleted;
                //Set progress to 100% and call the progress block
                uploadTask.progress.completedUnitCount = uploadTask.progress.totalUnitCount;
                if (uploadTask.expression.progressBlock) {
                    uploadTask.expression.progressBlock(uploadTask, uploadTask.progress);
                }
            }
            //Else mark as error.
            else {
                uploadTask.status = AWSS3TransferUtilityTransferStatusError;
            }

            [self cleanupForUploadTask:uploadTask];
            
            if(uploadTask.expression.completionHandler) {
                uploadTask.expression.completionHandler(uploadTask,uploadTask.error);
            }
            return;
        }
        else if ([transferUtilityTask isKindOfClass:[AWSS3TransferUtilityMultiPartUploadTask class]]) {
            
            //Get the multipart upload task
            AWSS3TransferUtilityMultiPartUploadTask *transferUtilityMultiPartUploadTask = [self.taskDictionary objectForKey:@(task.taskIdentifier)];
            if (!transferUtilityMultiPartUploadTask) {
                AWSDDLogDebug(@"Unable to find information for task %lu in taskDictionary", (unsigned long)task.taskIdentifier);
                return;
            }
            
            AWSS3TransferUtilityUploadSubTask *subTask = [transferUtilityMultiPartUploadTask.waitingPartsDictionary objectForKey:@(task.taskIdentifier)];
            if (subTask) {
                //Add it to inProgress list
                [transferUtilityMultiPartUploadTask.inProgressPartsDictionary setObject:subTask forKey:@(subTask.taskIdentifier)];
                
                //Remove it from the waitingList
                [transferUtilityMultiPartUploadTask.waitingPartsDictionary removeObjectForKey:@(subTask.taskIdentifier)];
            }
            
            subTask = [transferUtilityMultiPartUploadTask.inProgressPartsDictionary objectForKey:@(task.taskIdentifier)];
            if (!subTask) {
                AWSDDLogDebug(@"Unable to find information for task %lu in inProgress Dictionary", (unsigned long)task.taskIdentifier);
                return;
            }
            
            //Check if the task was cancelled.
            if (transferUtilityMultiPartUploadTask.cancelled) {
                //Abort the request, so the server can clean up any partials.
                [self callAbortMultiPartForUploadTask:transferUtilityMultiPartUploadTask];
                
                //Add it to list of completed Tasks
                [self.completedTaskDictionary setObject:transferUtilityMultiPartUploadTask forKey:transferUtilityMultiPartUploadTask.transferID];
                
                //Clean up.
                [self cleanupForMultiPartUploadTask:transferUtilityMultiPartUploadTask];
                return;
            }
            
            //Check if there was an error.
            if (error) {
                
                //Retrying if a 500, 503 or 400 RequestTimeout error occured.
                if  ([self isErrorRetriable:HTTPResponse.statusCode responseFromServer:subTask.responseData]) {
                    AWSDDLogDebug(@"Received a 500, 503 or 400 error. Response Data is [%@]", subTask.responseData);
                    if (transferUtilityMultiPartUploadTask.retryCount < self.transferUtilityConfiguration.retryLimit) {
                        AWSDDLogDebug(@"Retry count is below limit and error is retriable. ");
                        [self retryUploadSubTask:transferUtilityMultiPartUploadTask subTask:subTask startTransfer:YES];
                        return;
                    }
                }
                
                if(subTask.responseData != nil && [subTask.responseData isEqualToString:@""]) {
                    // Transfer's multi-part subtask does not have raw data access, so only check string based response data.
                    [self extractErrorInformation: [subTask responseData]
                                userInfo: userInfo];
                }
                NSError *updatedError = [[NSError alloc] initWithDomain:error.domain code:error.code userInfo:userInfo];
                
                //Error is not retriable.
                transferUtilityMultiPartUploadTask.error = updatedError;
                transferUtilityMultiPartUploadTask.status = AWSS3TransferUtilityTransferStatusError;
                
                //Execute call back if provided.
                if(transferUtilityMultiPartUploadTask.expression.completionHandler) {
                    transferUtilityMultiPartUploadTask.expression.completionHandler(transferUtilityMultiPartUploadTask, transferUtilityMultiPartUploadTask.error);
                }
                
                //Make sure all other parts that are in progress are canceled.
                for (NSNumber *key in [transferUtilityMultiPartUploadTask.inProgressPartsDictionary allKeys]) {
                    AWSS3TransferUtilityUploadSubTask *subTask = [transferUtilityMultiPartUploadTask.inProgressPartsDictionary objectForKey:key];
                    [subTask.sessionTask cancel];
                }
                
                //Abort the request, so the server can clean up any partials.
                [self callAbortMultiPartForUploadTask:transferUtilityMultiPartUploadTask];
                
                //clean up.
                [self cleanupForMultiPartUploadTask:transferUtilityMultiPartUploadTask];
                return;
            }
            
            NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *) task.response;
            subTask.eTag = (NSString *) HTTPResponse.allHeaderFields[@"ETAG"];
            
            //Add it to completed parts and remove it from remaining parts.
            [transferUtilityMultiPartUploadTask.completedPartsDictionary setObject:subTask forKey:@(subTask.taskIdentifier)];
            [transferUtilityMultiPartUploadTask.inProgressPartsDictionary removeObjectForKey:@(subTask.taskIdentifier)];
            //Update progress
            transferUtilityMultiPartUploadTask.progress.completedUnitCount = transferUtilityMultiPartUploadTask.progress.completedUnitCount - subTask.totalBytesSent + subTask.totalBytesExpectedToSend;
            
            //Delete the temporary upload file for this subTask
            [self removeFile:subTask.file];
            subTask.status = AWSS3TransferUtilityTransferStatusCompleted;
            
            //Update Database
            [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:subTask.transferID
                                                               partNumber:subTask.partNumber
                                                           taskIdentifier:subTask.taskIdentifier
                                                                     eTag:subTask.eTag
                                                                   status:subTask.status
                                                              retry_count:transferUtilityMultiPartUploadTask.retryCount databaseQueue:self.databaseQueue];
            
            //If there are parts waiting to be uploaded, pick from the waiting parts list and move it to inProgress
            if ([transferUtilityMultiPartUploadTask.waitingPartsDictionary count] > 0) {
                long numberOfPartsInProgress = [transferUtilityMultiPartUploadTask.inProgressPartsDictionary count];
                while (numberOfPartsInProgress < [self.transferUtilityConfiguration.multiPartConcurrencyLimit integerValue]) {
                    if ([transferUtilityMultiPartUploadTask.waitingPartsDictionary count] > 0) {
                        //Get a part from the waitingList
                        AWSS3TransferUtilityUploadSubTask *nextSubTask = [[transferUtilityMultiPartUploadTask.waitingPartsDictionary allValues] objectAtIndex:0];
                        
                        //Add to inProgress list
                        [transferUtilityMultiPartUploadTask.inProgressPartsDictionary setObject:nextSubTask forKey:@(nextSubTask.taskIdentifier)];
                        
                        //Remove it from the waitingList
                        [transferUtilityMultiPartUploadTask.waitingPartsDictionary removeObjectForKey:@(nextSubTask.taskIdentifier)];
                        AWSDDLogDebug(@"Moving Task[%@] to progress for Multipart[%@]", @(nextSubTask.taskIdentifier), transferUtilityMultiPartUploadTask.uploadID);
                        [nextSubTask.sessionTask resume];
                        numberOfPartsInProgress++;
                        continue;
                    }
                    break;
                }
            }
            else if ([transferUtilityMultiPartUploadTask.inProgressPartsDictionary count] == 0) {
                //If there are no more inProgress parts, then we are done.
                
                //Validate that all the content has been uploaded.
                int64_t totalBytesSent = 0;
                for (AWSS3TransferUtilityUploadSubTask *aSubTask in [transferUtilityMultiPartUploadTask.completedPartsDictionary allValues]) {
                    totalBytesSent += aSubTask.totalBytesExpectedToSend;
                }
                
                if (totalBytesSent != transferUtilityMultiPartUploadTask.contentLength.intValue ) {
                    NSString *errorMessage = [NSString stringWithFormat:@"Expected to send [%@], but sent [%@] and there are no remaining parts. Failing transfer ",
                                              transferUtilityMultiPartUploadTask.contentLength, @(totalBytesSent)];
                    
                    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errorMessage
                                                                         forKey:@"Message"];
                    
                    transferUtilityMultiPartUploadTask.error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                                 code:AWSS3TransferUtilityErrorClientError
                                             userInfo:userInfo];
                    
                    //Execute call back if provided.
                    if(transferUtilityMultiPartUploadTask.expression.completionHandler) {
                        transferUtilityMultiPartUploadTask.expression.completionHandler(transferUtilityMultiPartUploadTask, transferUtilityMultiPartUploadTask.error);
                    }
                    
                    //Abort the request, so the server can clean up any partials.
                    [self callAbortMultiPartForUploadTask:transferUtilityMultiPartUploadTask];
                    
                    //clean up.
                    [self cleanupForMultiPartUploadTask:transferUtilityMultiPartUploadTask];
                    return;
                }
                
                
                //Call the Multipart completion step here.
                [[ self callFinishMultiPartForUploadTask:transferUtilityMultiPartUploadTask] continueWithBlock:^id (AWSTask *task) {
                    if (task.error) {
                        AWSDDLogError(@"Error finishing up MultiPartForUpload Task[%@]", task.error);
                        transferUtilityMultiPartUploadTask.error = error;
                        transferUtilityMultiPartUploadTask.status = AWSS3TransferUtilityTransferStatusError;
                        
                        //Abort the request, so the server can clean up any partials.
                        [self callAbortMultiPartForUploadTask:transferUtilityMultiPartUploadTask];
                        
                    }
                    else {
                        //Set progress to 100% and call progressBlock.
                        AWSDDLogInfo(@"Completed Multipart Transfer: %@", transferUtilityMultiPartUploadTask.uploadID);
                        transferUtilityMultiPartUploadTask.status = AWSS3TransferUtilityTransferStatusCompleted;
                        
                        transferUtilityMultiPartUploadTask.progress.completedUnitCount = transferUtilityMultiPartUploadTask.progress.totalUnitCount;
                        if (transferUtilityMultiPartUploadTask.expression.progressBlock ) {
                            transferUtilityMultiPartUploadTask.expression.progressBlock(transferUtilityMultiPartUploadTask, transferUtilityMultiPartUploadTask.progress);
                        }
                    }
                    
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
            [self.completedTaskDictionary setObject:downloadTask forKey:downloadTask.transferID];
            [self.taskDictionary removeObjectForKey:@(downloadTask.sessionTask.taskIdentifier)];
            [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:downloadTask.transferID databaseQueue:_databaseQueue];
            return;
        }
        
        //Make sure to not overwrite if an error has already been set on the downloadTask
        if (!downloadTask.error)  {
            downloadTask.error = error;
        }
        
        if(!downloadTask.error ) {
            downloadTask.status = AWSS3TransferUtilityTransferStatusCompleted;
        }
        else {
            downloadTask.status = AWSS3TransferUtilityTransferStatusError;
        }
        
        if (downloadTask.error && HTTPResponse) {
            if ([self isErrorRetriable:HTTPResponse.statusCode responseFromServer:downloadTask.responseData])  {
                if (downloadTask.retryCount < self.transferUtilityConfiguration.retryLimit) {
                    AWSDDLogDebug(@"Retry count is below limit and error is retriable. ");
                    [self retryDownload:downloadTask];
                    return;
                }
            }
            
            if(downloadTask.responseData == nil ||  [downloadTask.responseData isEqualToString:@""]) {
                [self extractErrorInformation: [[NSString alloc] initWithData:[downloadTask data] encoding:NSASCIIStringEncoding]
                            userInfo: userInfo];
            } else {
                [self extractErrorInformation: [downloadTask responseData]
                            userInfo: userInfo];
            }
            NSError *updatedError = [[NSError alloc] initWithDomain:downloadTask.error.domain code:downloadTask.error.code userInfo:userInfo];
            downloadTask.error = updatedError;
        }
        
        if (!downloadTask.error) {
            downloadTask.progress.completedUnitCount = downloadTask.progress.totalUnitCount;
            if (downloadTask.expression.progressBlock) {
                downloadTask.expression.progressBlock(downloadTask, downloadTask.progress);
            }
        }
        if (downloadTask.expression.completionHandler) {
            downloadTask.expression.completionHandler(downloadTask,
                                                      downloadTask.location,
                                                      downloadTask.data,
                                                      downloadTask.error);
        }
        [self.completedTaskDictionary setObject:downloadTask forKey:downloadTask.transferID];
        [self.taskDictionary removeObjectForKey:@(downloadTask.sessionTask.taskIdentifier)];
        [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:downloadTask.transferID databaseQueue:_databaseQueue];
    }
}

- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
   didSendBodyData:(int64_t)bytesSent
    totalBytesSent:(int64_t)totalBytesSent
totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    AWSDDLogVerbose(@"didSendBodyData called for task %lu", (unsigned long)task.taskIdentifier);
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
        subTask.totalBytesSent = totalBytesSent;
        
    
        //Calculate the total sent so far
        int64_t totalSentSoFar = 0;
        for (AWSS3TransferUtilityUploadSubTask *aSubTask in [transferUtilityMultiPartUploadTask.completedPartsDictionary allValues]) {
            totalSentSoFar += aSubTask.totalBytesExpectedToSend;
        }
        for (AWSS3TransferUtilityUploadSubTask *aSubTask in [transferUtilityMultiPartUploadTask.inProgressPartsDictionary allValues]) {
            totalSentSoFar += aSubTask.totalBytesSent;
        }
     
        if (transferUtilityMultiPartUploadTask.progress.completedUnitCount < totalSentSoFar ) {
            transferUtilityMultiPartUploadTask.progress.totalUnitCount = [transferUtilityMultiPartUploadTask.contentLength longLongValue];
            transferUtilityMultiPartUploadTask.progress.completedUnitCount = totalSentSoFar;
        
            //execute the callback to the progressblock if present.
            if (transferUtilityMultiPartUploadTask.expression.progressBlock) {
                AWSDDLogDebug(@"Total %lld, ProgressSoFar %lld", transferUtilityMultiPartUploadTask.progress.totalUnitCount, transferUtilityMultiPartUploadTask.progress.completedUnitCount);
                transferUtilityMultiPartUploadTask.expression.progressBlock(transferUtilityMultiPartUploadTask, transferUtilityMultiPartUploadTask.progress);
            }
        }
    }
}

#pragma mark - Helper methods

- (void) cleanupForMultiPartUploadTask: (AWSS3TransferUtilityMultiPartUploadTask *) task  {
    
    //Add it to list of completed Tasks
    [self.completedTaskDictionary setObject:task forKey:task.transferID];
    
    //Remove all entries from taskDictionary.
    for ( AWSS3TransferUtilityUploadSubTask *subTask in [task.inProgressPartsDictionary allValues] ) {
        [self.taskDictionary removeObjectForKey:@(subTask.taskIdentifier)];
        [self removeFile:subTask.file];
    }
    
    //Remove temporary file if required.
    if (task.temporaryFileCreated) {
        [self removeFile:task.file];
    }
    
    //Remove data from the Database.
    [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:task.transferID databaseQueue:_databaseQueue];
    
}

- (void) cleanupForUploadTask: (AWSS3TransferUtilityUploadTask *) uploadTask {
    //Add it to list of completed Tasks
    [self.completedTaskDictionary setObject:uploadTask forKey:uploadTask.transferID];
    
    //Remove entry from taskDictionary
    [self.taskDictionary removeObjectForKey:@(uploadTask.taskIdentifier)];
    
    //Remove temporary file if required.
    if (uploadTask.temporaryFileCreated) {
        [self removeFile:uploadTask.file];
    }
    
    //Remove data from the Database.
    [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:uploadTask.transferID databaseQueue:_databaseQueue];
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

- (void)extractErrorInformation:(NSString *)responseString
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

#pragma mark - NSURLSessionDownloadDelegate

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    AWSDDLogDebug(@"didFinishDownloadingToURL called for Download task %lu", (unsigned long)downloadTask.taskIdentifier);
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
    AWSDDLogDebug(@"didWriteData called for download task %lu", (unsigned long)downloadTask.taskIdentifier);
    AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask =
        [self.taskDictionary objectForKey:@(downloadTask.taskIdentifier)];
   
    if (!transferUtilityDownloadTask) {
        AWSDDLogDebug(@"Unable to find information for task %lu in taskDictionary", (unsigned long)downloadTask.taskIdentifier);
        return;
    }
    
    if (transferUtilityDownloadTask.progress.totalUnitCount != totalBytesExpectedToWrite) {
        transferUtilityDownloadTask.progress.totalUnitCount = totalBytesExpectedToWrite;
    }
    if (transferUtilityDownloadTask.progress.completedUnitCount <= totalBytesWritten) {
        transferUtilityDownloadTask.progress.completedUnitCount = totalBytesWritten;

        if (transferUtilityDownloadTask.expression.progressBlock) {
            transferUtilityDownloadTask.expression.progressBlock(transferUtilityDownloadTask, transferUtilityDownloadTask.progress);
        }
    }
}

#pragma mark - NSURLSessionDataDelegate


@end

#pragma mark - AWSS3TransferUtilityConfiguration

@implementation AWSS3TransferUtilityConfiguration

- (instancetype)init {
    if (self = [super init]) {
        //set defaults.
        _accelerateModeEnabled = NO;
        _retryLimit = 0;
        _multiPartConcurrencyLimit = @(AWSS3TransferUtilityMultiPartDefaultConcurrencyLimit);
        _timeoutIntervalForResource = AWSS3TransferUtilityTimeoutIntervalForResource;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    AWSS3TransferUtilityConfiguration *configuration = [[[self class] allocWithZone:zone] init];
    configuration.accelerateModeEnabled = self.isAccelerateModeEnabled;
    configuration.bucket = self.bucket;
    configuration.retryLimit = self.retryLimit;
    configuration.multiPartConcurrencyLimit = self.multiPartConcurrencyLimit;
    configuration.timeoutIntervalForResource = self.timeoutIntervalForResource;
    return configuration;
}

@end




