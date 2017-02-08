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
#import <AWSCore/AWSCore.h>

NS_ASSUME_NONNULL_BEGIN

@class AWSPinpointEvent, AWSPinpointSession;


typedef __nullable id(^AWSPinpointTimeoutBlock)(AWSTask *task);

/**
 The session object needs that the session client keeps track of, the session information is added to each event recorded.
 */
@interface AWSPinpointSession : NSObject <NSCoding>

/**
 The start timestamp is populated when the client start the session.
 */
@property (nonatomic, strong, readonly) NSDate *startTime;

/**
 The stop timestamp is polated when the client stops the session.
 */
@property (nonatomic, strong, readonly) NSDate *stopTime;

/**
 The session id is populated when the client creates a new session.
 */
@property (nonatomic, strong, readonly) NSString *sessionId;

@end


/**
 The session client records analytics session events.
 
 You should only use this class to manually control session events if you have enableAutoSessionRecording set to false. See AWSPinpointConfiguration.
 */
@interface AWSPinpointSessionClient : NSObject

/**
 The current session object.
 */
@property (nonatomic, readonly) AWSPinpointSession *session;

/**
 Starts the session by recording an event of type "_session.start"
 If a session is currently active then that session is stopped and a new session started.
 
 @return AWSTask - task.result contains the start event.
 */
- (AWSTask*)startSession;

/**
 Stops the session by recording an event of type "_session.stop"
 
 @return AWSTask - task.result contains the stop event.
 */
- (AWSTask*)stopSession;

/**
 Pauses the session by recording an event of type "_session.pause"
 @param timeoutEnabled If this is enabled then the session will timeout after 5 seconds and a session stop will be recorded. (Session timeout if configurable in AWSPinpointConfiguration)
 @param timeoutCompletionBlock The block that will be executed after timeout has completed and submission of events has occurred, task.result will contain events that were submitted.
 
 @return AWSTask - task.result contains the pause event.
 */
- (AWSTask*)pauseSessionWithTimeoutEnabled:(BOOL) timeoutEnabled
                    timeoutCompletionBlock:(nullable AWSPinpointTimeoutBlock) timeoutCompletionBlock;

/**
 Resumes the session by recording an event of type "_session.resume"
 If no session is active then a new session is started.
 If the timeout of 5 seconds has passed, then the current session is stopped and a new session started. (Session timeout if configurable in AWSPinpointConfiguration)
 
 @return AWSTask - task.result contains the resume event.
 */
- (AWSTask*)resumeSession;

@end

NS_ASSUME_NONNULL_END
