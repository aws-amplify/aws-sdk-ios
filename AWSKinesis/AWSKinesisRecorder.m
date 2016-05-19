//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSSynchronizedMutableDictionary.h"

// Constants
NSString *const AWSKinesisRecorderErrorDomain = @"com.amazonaws.AWSKinesisRecorderErrorDomain";
NSString *const AWSKinesisRecorderByteThresholdReachedNotification = @"com.amazonaws.AWSKinesisRecorderByteThresholdReachedNotification";
NSString *const AWSKinesisRecorderByteThresholdReachedNotificationDiskBytesUsedKey = @"diskBytesUsed";

static NSString *const AWSInfoKinesisRecorder = @"KinesisRecorder";

// Legacy constants
NSString *const AWSKinesisRecorderCacheName = @"com.amazonaws.AWSKinesisRecorderCacheName.Cache";

@protocol AWSKinesisRecorderHelper <NSObject>

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@interface AWSKinesisRecorderHelper : NSObject <AWSKinesisRecorderHelper>

@property (nonatomic, strong) AWSKinesis *kinesis;

@end

@interface AWSAbstractKinesisRecorder()

@property (nonatomic, strong) id<AWSKinesisRecorderHelper> recorderHelper;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier
                            cacheName:(NSString *)cacheName;

@end

@interface AWSKinesis()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@implementation AWSKinesisRecorder

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultKinesisRecorder {
    static AWSKinesisRecorder *_defaultKinesisRecorder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoKinesisRecorder];
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

        _defaultKinesisRecorder = [[AWSKinesisRecorder alloc] initWithConfiguration:serviceConfiguration
                                                                         identifier:@"Default"
                                                                          cacheName:AWSKinesisRecorderCacheName];
    });

    return _defaultKinesisRecorder;
}

+ (void)registerKinesisRecorderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });

    AWSKinesisRecorder *kinesisRecorder = [[AWSKinesisRecorder alloc] initWithConfiguration:configuration
                                                                                 identifier:[key aws_md5StringLittleEndian]
                                                                                  cacheName:[NSString stringWithFormat:@"%@.%@", AWSKinesisRecorderCacheName, key]];
    [_serviceClients setObject:kinesisRecorder
                        forKey:key];
}

+ (instancetype)KinesisRecorderForKey:(NSString *)key {
    @synchronized(self) {
        AWSKinesisRecorder *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoKinesisRecorder
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSKinesisRecorder registerKinesisRecorderWithConfiguration:serviceConfiguration
                                                                  forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeKinesisRecorderForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultKinesisRecorder` or `+ KinesisRecorderForKey:` instead."
                                 userInfo:nil];
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier
                            cacheName:(NSString *)cacheName {
    if (self = [super initWithConfiguration:configuration
                                identifier:identifier
                                 cacheName:cacheName]) {
        self.recorderHelper = [[AWSKinesisRecorderHelper alloc] initWithConfiguration:configuration];
    }
    return self;
}

@end

@implementation AWSKinesisRecorderHelper

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _kinesis = [[AWSKinesis alloc] initWithConfiguration:configuration];
    }

    return self;
}

- (AWSTask *)submitRecordsForStream:(NSString *)streamName
                            records:(NSArray *)temporaryRecords
                      partitionKeys:(NSArray *)partitionKeys
                   putPartitionKeys:(NSMutableArray *)putPartitionKeys
                 retryPartitionKeys:(NSMutableArray *)retryPartitionKeys
                               stop:(BOOL *)stop {
    NSMutableArray *records = [NSMutableArray new];

    for (NSDictionary *recordDictionary in temporaryRecords) {
        AWSKinesisPutRecordsRequestEntry *requestEntry = [AWSKinesisPutRecordsRequestEntry new];
        requestEntry.partitionKey = recordDictionary[@"partition_key"];
        requestEntry.data = recordDictionary[@"data"];
        streamName = recordDictionary[@"stream_name"];

        [records addObject:requestEntry];
    }

    AWSKinesisPutRecordsInput *putRecordsInput = [AWSKinesisPutRecordsInput new];
    putRecordsInput.streamName = streamName;
    putRecordsInput.records = records;
    AWSLogVerbose(@"putRecordsInput: [%@]", putRecordsInput);
    return [[self.kinesis putRecords:putRecordsInput] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            AWSLogError(@"Error: [%@]", task.error);
            if ([task.error.domain isEqualToString:NSURLErrorDomain]) {
                *stop = YES;
            }
        }
        if (task.exception) {
            AWSLogError(@"Exception: [%@]", task.exception);
        }
        if (task.result) {
            AWSKinesisPutRecordsOutput *putRecordsOutput = task.result;

            for (int i = 0; i < [putRecordsOutput.records count]; i++) {
                AWSKinesisPutRecordsResultEntry *resultEntry = putRecordsOutput.records[i];
                if (resultEntry.errorCode) {
                    AWSLogInfo(@"Error Code: [%@] Error Message: [%@]", resultEntry.errorCode, resultEntry.errorMessage);
                }
                // When the error code is ProvisionedThroughputExceededException or InternalFailure,
                // we should retry. So, don't delete the row from the database.
                if (![resultEntry.errorCode isEqualToString:@"ProvisionedThroughputExceededException"]
                    && ![resultEntry.errorCode isEqualToString:@"InternalFailure"]) {
                    [putPartitionKeys addObject:partitionKeys[i]];
                } else {
                    [retryPartitionKeys addObject:partitionKeys[i]];
                }
            }
        }
        return nil;
    }];
}

- (NSError *)dataTooLargeError {
    return [NSError errorWithDomain:AWSKinesisRecorderErrorDomain
                               code:AWSKinesisRecorderErrorDataTooLarge
                           userInfo:nil];
}

- (void)checkByteThresholdForNotification:(NSUInteger)notificationByteThreshold
                       notificationSender:(id)notificationSender
                                 fileSize:(NSUInteger)fileSize {
    if (notificationByteThreshold > 0
        && fileSize > notificationByteThreshold) {
        // Sends out a notification if it exceeds the disk size threshold.
        [[NSNotificationCenter defaultCenter] postNotificationName:AWSKinesisRecorderByteThresholdReachedNotification
                                                            object:notificationSender
                                                          userInfo:@{AWSKinesisRecorderByteThresholdReachedNotificationDiskBytesUsedKey : @(fileSize)}];
    }
}

@end
