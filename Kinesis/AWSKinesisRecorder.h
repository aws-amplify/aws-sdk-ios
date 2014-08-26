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
#import "AWSService.h"

@class BFTask;

/**
 *  When a `saveRecord:streamName:` operation causes the disk size to exceed `notificationByteThreshold`, it posts AWSKinesisRecorderByteThresholdReachedNotification.
 */
FOUNDATION_EXPORT NSString *const AWSKinesisRecorderByteThresholdReachedNotification;

/**
 *   The AWSKinesisRecorder is a high level client meant for storing put record requests on the user's device. This allows developers to retain requests when the device is offline. It can also increase performance and battery efficiency since the Wi-Fi or cell network does not need to be woken up as frequently.
 * @discussion AWSKinesisRecorder stores the requests unencripted and does not perform additional security measures outside of what the iOS offers by default. Therefore, it is recommended not to store highly sensitive information using AWSKinesisRecorder.
 */
@interface AWSKinesisRecorder : AWSService

/**
 *  The number of bytes currently used to store AWSKinesisPutRecordInput objects on disk.
 */
@property (nonatomic, assign, readonly) NSUInteger diskBytesUsed;

/**
 *  The threshold of disk bytes for notification. When exceeded, `saveRecord:streamName:` posts AWSKinesisRecorderByteThresholdReachedNotification. The default is 0 meaning it will not post the notification.
 * @discussion The `notificationByteThreshold` should be smaller than `diskByteLimit`.
 */
@property (nonatomic, assign) NSUInteger notificationByteThreshold;

/**
 *  The limit of the disk cache size in bytes. When exceeded, older requests will be discarded. Setting this value to 0.0 meaning no practical limit. The default value is 5MB.
 */
@property (nonatomic, assign) NSUInteger diskByteLimit;

/**
 *  The age limit of the cached requests. When exceeded, requests older than the specified age will be discarded. Setting this value to 0 meaning no practical limit. The default is no age limit.
 */
@property (nonatomic, assign) NSTimeInterval diskAgeLimit;

/**
 *  Returns a shared instance of this service client using `[AWSServiceManager defaultServiceManager].defaultServiceConfiguration`. When `defaultServiceConfiguration` is not set, this method returns nil.
 *
 *  @return A shared instance of this service client.
 */
+ (instancetype)defaultKinesisRecorder;

/**
 *  Returns an instance of this service client using `configuration` and `identifier`.
 *
 *  @param configuration An object to configure the internal `AWSKinesis`. At least `regionType` and `credentialsProvider` need to be set.
 *  @param identifier    An unique identifier for AWSKinesisRecorder to create a disk cache. Multiple instances with the same identifier are allowed and can safely access the same data on disk.
 *
 *  @return An instance of this service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier;

/**
 *  Saves a record to local storage to be sent later. The record will be submitted to the streamName provided with a randomly generated partition key to ensure equal distribution across shards.
 *
 *  @param data       The data to send to Amazon Kinesis.
 *  @param streamName The stream name for Amazon Kinesis.
 *
 *  @return BFTask- task.result contains an instance of AWSKinesisPutRecordInput persisted.
 */
- (BFTask *)saveRecord:(NSData *)data
            streamName:(NSString *)streamName;

/**
 *  Submits all locally saved requests to Amazon Kinesis. Requests that are successfully sent will be deleted from the device. Requests that fail due to the device being offline will stop the submission process and be kept. Requests that fail due to other reasons (such as the request being invalid) will be deleted.
 *
 *  @return BFTask - task.result is always nil.
 */
- (BFTask *)submitAllRecords;

/**
 *  Removes all requests saved to disk.
 *
 *  @return BFTask- task.result is always nil.
 */
- (BFTask *)removeAllRecords;

@end
