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

@class AWSPinpointEvent,AWSPinpointContext,AWSPinpointTargetingClient;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSPinpointAnalyticsErrorDomain;

typedef NS_ENUM(NSInteger, AWSPinpointAnalyticsErrorType) {
    AWSPinpointAnalyticsErrorUnknown,
    AWSPinpointAnalyticsErrorBadRequest,
};


/**
 When a `saveEvent:` operation causes the disk size to exceed `notificationByteThreshold`, it posts `AWSPinpointEventByteThresholdReachedNotification`.
 */
FOUNDATION_EXPORT NSString *const AWSPinpointEventByteThresholdReachedNotification;

/**
 You can retrieve the disk bytes used from the `notification.userInfo` dictionary with this key.
 */
FOUNDATION_EXPORT NSString *const AWSPinpointEventByteThresholdReachedNotificationDiskBytesUsedKey;

/**
 `AWSPinpointEventRecorder` stores events to a local SQLite database and submits them to Pinpoint.
 
 This is the low level client used to record events to local storage.
 
 You should only use this class for more advanced controls over your events stored locally. Please use `AWSPinpointAnalyticsClient` for recording events.
 */
@interface AWSPinpointEventRecorder : AWSService

/**
 The number of bytes currently used to store AWSPinpointEvent objects on disk.
 */
@property (nonatomic, assign, readonly) uint64_t diskBytesUsed;

/**
 The threshold of disk bytes for notification. When exceeded, `saveEvent:` posts AWSPinpointEventByteThresholdReachedNotification. The default is 0 meaning it will not post the notification.
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
 Indicates if submission of events is in progress, only one submission of events is allowed at a time.
 */
@property (nonatomic, assign) BOOL submissionInProgress;

/**
 The maxium batch data size in bytes. The default value is 512KB. The maximum is 4MB.
 */
@property (nonatomic, assign) NSUInteger batchRecordsByteLimit;

/**
 Saves an event to local storage to be sent later.
 
 @param event The event to send to Amazon Pinpoint.
 
 @return AWSTask - task.result contains the saved event.
 */
- (AWSTask<AWSPinpointEvent *> *) saveEvent:(AWSPinpointEvent *) event;

/**
 Retrieves events in local storage with a limit of 100 events (the limit per batch).
 
 @return AWSTask - task.result contains an array of AWSPinpointEvent objects.
 */
- (AWSTask<NSArray<AWSPinpointEvent *> *> *) getEvents;

/**
 Retrieves events in local storage with the specified limit.
 
 @return AWSTask - task.result contains an array of AWSPinpointEvent objects.
 */
- (AWSTask<NSArray<AWSPinpointEvent *> *> *) getEventsWithLimit:(NSNumber *) limit;

/**
 Retrieves dirty events in local storage with a limit of 100 events (the limit per batch).
 
 @return AWSTask - task.result contains an array of AWSPinpointEvent objects.
 */
- (AWSTask<NSArray<AWSPinpointEvent *> *> *) getDirtyEvents;

/**
 Retrieves dirty events in local storage with the specified limit.
 
 @return AWSTask - task.result contains an array of AWSPinpointEvent objects.
 */
- (AWSTask<NSArray<AWSPinpointEvent *> *> *) getDirtyEventsWithLimit:(NSNumber *) limit;

/**
 Submits all locally saved events to Amazon Pinpoint. Events that are successfully sent will be deleted from the device. Events that fail due to the device being offline will stop the submission process and be kept. Events that fail due to other reasons (such as the event being invalid) will be marked dirty and moved to a dirty table.
 
 @return AWSTask - task.result contains an array of AWSPinpointEvent objects that were submitted.
 */
- (AWSTask<NSArray<AWSPinpointEvent *> *> *)submitAllEvents;

/**
 Removes all events saved to disk.
 
 @return AWSTask - task.result is always nil.
 */
- (AWSTask *)removeAllEvents;

/**
 Removes all dirty events saved to disk.
 
 @return AWSTask - task.result is always nil.
 */
- (AWSTask *)removeAllDirtyEvents;


@end

NS_ASSUME_NONNULL_END
