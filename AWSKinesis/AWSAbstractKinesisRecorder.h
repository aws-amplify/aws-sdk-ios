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
#import <AWSCore/AWSService.h>

/**
 `AWSAbstractKinesisRecorder` is an abstract class. You should not instantiate this class directly. Instead use its concrete subclasses `AWSKinesisRecorder` and `AWSFirehoseRecorder`.
 */
@interface AWSAbstractKinesisRecorder : AWSService

/**
 The number of bytes currently used to store AWSKinesisPutRecordInput objects on disk.
 */
@property (nonatomic, assign, readonly) NSUInteger diskBytesUsed;

/**
 The threshold of disk bytes for notification. When exceeded, `saveRecord:streamName:` posts AWSKinesisRecorderByteThresholdReachedNotification. The default is 0 meaning it will not post the notification.
 @discussion The `notificationByteThreshold` should be smaller than `diskByteLimit`.
 */
@property (nonatomic, assign) NSUInteger notificationByteThreshold;

/**
 The limit of the disk cache size in bytes. When exceeded, older requests will be discarded. Setting this value to 0.0 meaning no practical limit. The default value is 5MB.
 */
@property (nonatomic, assign) NSUInteger diskByteLimit;

/**
 The age limit of the cached requests. When exceeded, requests older than the specified age will be discarded. Setting this value to 0 meaning no practical limit. The default is no age limit.
 */
@property (nonatomic, assign) NSTimeInterval diskAgeLimit;

/**
 The maxium batch data size in bytes. The default value is 512KB. The maximum is 4MB.
 */
@property (nonatomic, assign) NSUInteger batchRecordsByteLimit;

/**
 Saves a record to local storage to be sent later. The record will be submitted to the streamName provided with a randomly generated partition key to ensure equal distribution across shards.

 @param data       The data to send to Amazon Kinesis. It needs to be smaller than 256KB.
 @param streamName The stream name for Amazon Kinesis.

 @return AWSTask - task.result is always nil.
 */
- (AWSTask *)saveRecord:(NSData *)data
             streamName:(NSString *)streamName;

/**
 Submits all locally saved requests to Amazon Kinesis. Requests that are successfully sent will be deleted from the device. Requests that fail due to the device being offline will stop the submission process and be kept. Requests that fail due to other reasons (such as the request being invalid) will be deleted.

 @return AWSTask - task.result is always nil.
 */
- (AWSTask *)submitAllRecords;

/**
 Removes all requests saved to disk.

 @return AWSTask - task.result is always nil.
 */
- (AWSTask *)removeAllRecords;

@end
