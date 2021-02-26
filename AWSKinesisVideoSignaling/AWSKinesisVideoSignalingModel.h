//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSKinesisVideoSignalingErrorDomain;

typedef NS_ENUM(NSInteger, AWSKinesisVideoSignalingErrorType) {
    AWSKinesisVideoSignalingErrorUnknown,
    AWSKinesisVideoSignalingErrorClientLimitExceeded,
    AWSKinesisVideoSignalingErrorInvalidArgument,
    AWSKinesisVideoSignalingErrorInvalidClient,
    AWSKinesisVideoSignalingErrorNotAuthorized,
    AWSKinesisVideoSignalingErrorResourceNotFound,
    AWSKinesisVideoSignalingErrorSessionExpired,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoSignalingService) {
    AWSKinesisVideoSignalingServiceUnknown,
    AWSKinesisVideoSignalingServiceTurn,
};

@class AWSKinesisVideoSignalingGetIceServerConfigRequest;
@class AWSKinesisVideoSignalingGetIceServerConfigResponse;
@class AWSKinesisVideoSignalingIceServer;
@class AWSKinesisVideoSignalingSendAlexaOfferToMasterRequest;
@class AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse;

/**
 
 */
@interface AWSKinesisVideoSignalingGetIceServerConfigRequest : AWSRequest


/**
 <p>The ARN of the signaling channel to be used for the peer-to-peer connection between configured peers. </p>
 */
@property (nonatomic, strong) NSString * _Nullable channelARN;

/**
 <p>Unique identifier for the viewer. Must be unique within the signaling channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>Specifies the desired service. Currently, <code>TURN</code> is the only valid value.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoSignalingService service;

/**
 <p>An optional user ID to be associated with the credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSKinesisVideoSignalingGetIceServerConfigResponse : AWSModel


/**
 <p>The list of ICE server information objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisVideoSignalingIceServer *> * _Nullable iceServerList;

@end

/**
 <p>A structure for the ICE server connection data.</p>
 */
@interface AWSKinesisVideoSignalingIceServer : AWSModel


/**
 <p>A password to login to the ICE server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The period of time, in seconds, during which the username and password are valid.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ttl;

/**
 <p>An array of URIs, in the form specified in the <a href="https://tools.ietf.org/html/draft-petithuguenin-behave-turn-uris-03">I-D.petithuguenin-behave-turn-uris</a> spec. These URIs provide the different addresses and/or protocols that can be used to reach the TURN server.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable uris;

/**
 <p>A username to login to the ICE server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSKinesisVideoSignalingSendAlexaOfferToMasterRequest : AWSRequest


/**
 <p>The ARN of the signaling channel by which Alexa and the master peer communicate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelARN;

/**
 <p>The base64-encoded SDP offer content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messagePayload;

/**
 <p>The unique identifier for the sender client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable senderClientId;

@end

/**
 
 */
@interface AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse : AWSModel


/**
 <p>The base64-encoded SDP answer content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable answer;

@end

NS_ASSUME_NONNULL_END
