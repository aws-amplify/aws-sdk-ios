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

#import "AWSKinesisRecorder.h"
#import "AWSKinesis.h"

// Constants
NSString *const AWSFirehoseRecorderErrorDomain = @"com.amazonaws.AWSFirehoseRecorderErrorDomain";
NSString *const AWSFirehoseRecorderByteThresholdReachedNotification = @"com.amazonaws.AWSFirehoseRecorderByteThresholdReachedNotification";
NSString *const AWSFirehoseRecorderByteThresholdReachedNotificationDiskBytesUsedKey = @"diskBytesUsed";

static NSString *const AWSInfoFirehoseRecorder = @"FirehoseRecorder";

// Legacy constants
NSString *const AWSFirehoseRecorderCacheName = @"com.amazonaws.AWSFirehoseRecorderCacheName.Cache";

@protocol AWSFirehoseRecorderHelper <NSObject>

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@interface AWSFirehoseRecorderHelper : NSObject <AWSFirehoseRecorderHelper>

@property (nonatomic, strong) AWSFirehose *firehose;

@end

@interface AWSAbstractKinesisRecorder()

@property (nonatomic, strong) id<AWSFirehoseRecorderHelper> recorderHelper;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier
                            cacheName:(NSString *)cacheName;

@end

@implementation AWSFirehoseRecorder

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultFirehoseRecorder {
    static AWSFirehoseRecorder *_defaultFirehoseRecorder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoFirehoseRecorder];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }

        _defaultFirehoseRecorder = [[AWSFirehoseRecorder alloc] initWithConfiguration:serviceConfiguration
                                                                         identifier:@"Default"
                                                                          cacheName:AWSFirehoseRecorderCacheName];
    });

    return _defaultFirehoseRecorder;
}

+ (void)registerFirehoseRecorderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });

    AWSFirehoseRecorder *FirehoseRecorder = [[AWSFirehoseRecorder alloc] initWithConfiguration:configuration
                                                                                 identifier:[key aws_md5StringLittleEndian]
                                                                                  cacheName:[NSString stringWithFormat:@"%@.%@", AWSFirehoseRecorderCacheName, key]];
    [_serviceClients setObject:FirehoseRecorder
                        forKey:key];
}

+ (instancetype)FirehoseRecorderForKey:(NSString *)key {
    @synchronized(self) {
        AWSFirehoseRecorder *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoFirehoseRecorder
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSFirehoseRecorder registerFirehoseRecorderWithConfiguration:serviceConfiguration
                                                                    forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeFirehoseRecorderForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultFirehoseRecorder` or `+ FirehoseRecorderForKey:` instead."
                                 userInfo:nil];
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier
                            cacheName:(NSString *)cacheName {
    if (self = [super initWithConfiguration:configuration
                                identifier:identifier
                                 cacheName:cacheName]) {
        self.recorderHelper = [[AWSFirehoseRecorderHelper alloc] initWithConfiguration:configuration];
    }
    return self;
}

@end

@interface AWSFirehose()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@implementation AWSFirehoseRecorderHelper

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _firehose = [[AWSFirehose alloc] initWithConfiguration:configuration];
    }

    return self;
}

- (AWSTask *)submitRecordsForStream:(NSString *)streamName
                            records:(NSArray *)temporaryRecords
                             rowIds:(NSArray *)rowIds
                          putRowIds:(NSMutableArray *)putRowIds
                        retryRowIds:(NSMutableArray *)retryRowIds
                               stop:(BOOL *)stop {
    NSMutableArray *records = [NSMutableArray new];

    for (NSDictionary *recordDictionary in temporaryRecords) {
        AWSFirehoseRecord *record = [AWSFirehoseRecord new];
        record.data = recordDictionary[@"data"];

        [records addObject:record];
    }

    AWSFirehosePutRecordBatchInput *putRecordBatchInput = [AWSFirehosePutRecordBatchInput new];
    putRecordBatchInput.deliveryStreamName = streamName;
    putRecordBatchInput.records = records;

    AWSDDLogVerbose(@"putRecordBatchInput: [%@]", putRecordBatchInput);
    return [[self.firehose putRecordBatch:putRecordBatchInput] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            AWSDDLogError(@"Error: [%@]", task.error);
            const NSArray *stopErrorDomains = @[NSURLErrorDomain, AWSCognitoIdentityErrorDomain];

            if (task.error && [stopErrorDomains containsObject:task.error.domain]) {
                *stop = YES;
            }
            return [AWSTask taskWithError:task.error];
        }
        if (task.result) {
            AWSFirehosePutRecordBatchOutput *putRecordBatchOutput = task.result;

            for (int i = 0; i < [putRecordBatchOutput.requestResponses count]; i++) {
                AWSFirehosePutRecordBatchResponseEntry *resultEntry = putRecordBatchOutput.requestResponses[i];
                if (resultEntry.errorCode) {
                    AWSDDLogInfo(@"Error Code: [%@] Error Message: [%@]", resultEntry.errorCode, resultEntry.errorMessage);
                }
                // When the error code is ProvisionedThroughputExceededException or InternalFailure,
                // we should retry. So, don't delete the row from the database.
                if (![resultEntry.errorCode isEqualToString:@"Throttling"]
                    && ![resultEntry.errorCode isEqualToString:@"ServiceUnavailable"]) {
                    [putRowIds addObject:rowIds[i]];
                } else {
                    [retryRowIds addObject:rowIds[i]];
                }
            }
        }
        return nil;
    }];
}

- (NSError *)dataTooLargeError {
    return [NSError errorWithDomain:AWSFirehoseRecorderErrorDomain
                               code:AWSFirehoseRecorderErrorDataTooLarge
                           userInfo:nil];
}

- (void)checkByteThresholdForNotification:(NSUInteger)notificationByteThreshold
                       notificationSender:(id)notificationSender
                                 fileSize:(NSUInteger)fileSize {
    if (notificationByteThreshold > 0
        && fileSize > notificationByteThreshold) {
        // Sends out a notification if it exceeds the disk size threshold.
        [[NSNotificationCenter defaultCenter] postNotificationName:AWSFirehoseRecorderByteThresholdReachedNotification
                                                            object:notificationSender
                                                          userInfo:@{AWSFirehoseRecorderByteThresholdReachedNotificationDiskBytesUsedKey : @(fileSize)}];
    }
}

@end
