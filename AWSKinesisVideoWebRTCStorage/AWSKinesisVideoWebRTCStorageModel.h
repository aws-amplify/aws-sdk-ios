//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSKinesisVideoWebRTCStorageErrorDomain;

typedef NS_ENUM(NSInteger, AWSKinesisVideoWebRTCStorageErrorType) {
    AWSKinesisVideoWebRTCStorageErrorUnknown,
    AWSKinesisVideoWebRTCStorageErrorAccessDenied,
    AWSKinesisVideoWebRTCStorageErrorClientLimitExceeded,
    AWSKinesisVideoWebRTCStorageErrorInvalidArgument,
    AWSKinesisVideoWebRTCStorageErrorResourceNotFound,
};

@class AWSKinesisVideoWebRTCStorageJoinStorageSessionAsViewerInput;
@class AWSKinesisVideoWebRTCStorageJoinStorageSessionInput;

/**
 
 */
@interface AWSKinesisVideoWebRTCStorageJoinStorageSessionAsViewerInput : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) of the signaling channel. </p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p> The unique identifier for the sender client. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

@end

/**
 
 */
@interface AWSKinesisVideoWebRTCStorageJoinStorageSessionInput : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) of the signaling channel. </p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

@end

NS_ASSUME_NONNULL_END
