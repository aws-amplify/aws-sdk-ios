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

#import "AWSKinesisVideoWebRTCStorageResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSKinesisVideoWebRTCStorageResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSKinesisVideoWebRTCStorageResources

+ (instancetype)sharedInstance {
    static AWSKinesisVideoWebRTCStorageResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSKinesisVideoWebRTCStorageResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2018-05-10\",\
    \"endpointPrefix\":\"kinesisvideo\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"Amazon Kinesis Video WebRTC Storage\",\
    \"serviceId\":\"Kinesis Video WebRTC Storage\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"kinesisvideo\",\
    \"uid\":\"kinesis-video-webrtc-storage-2018-05-10\"\
  },\
  \"operations\":{\
    \"JoinStorageSession\":{\
      \"name\":\"JoinStorageSession\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/joinStorageSession\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"JoinStorageSessionInput\"},\
      \"errors\":[\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p> Join the ongoing one way-video and/or multi-way audio WebRTC session as a video producing device for an input channel. If thereâs no existing session for the channel, a new streaming session needs to be created, and the Amazon Resource Name (ARN) of the signaling channel must be provided. </p> <p>Currently for the <code>SINGLE_MASTER</code> type, a video producing device is able to ingest both audio and video media into a stream, while viewers can only ingest audio. Both a video producing device and viewers can join the session first, and wait for other participants.</p> <p>While participants are having peer to peer conversations through webRTC, the ingested media session will be stored into the Kinesis Video Stream. Multiple viewers are able to playback real-time media.</p> <p>Customers can also use existing Kinesis Video Streams features like <code>HLS</code> or <code>DASH</code> playback, Image generation, and more with ingested WebRTC media.</p> <note> <p>Assume that only one video producing device client can be associated with a session for the channel. If more than one client joins the session of a specific channel as a video producing device, the most recent client request takes precedence. </p> </note>\"\
    },\
    \"JoinStorageSessionAsViewer\":{\
      \"name\":\"JoinStorageSessionAsViewer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/joinStorageSessionAsViewer\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"JoinStorageSessionAsViewerInput\"},\
      \"errors\":[\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p> Join the ongoing one way-video and/or multi-way audio WebRTC session as a viewer for an input channel. If thereâs no existing session for the channel, create a new streaming session and provide the Amazon Resource Name (ARN) of the signaling channel (<code>channelArn</code>) and client id (<code>clientId</code>). </p> <p>Currently for <code>SINGLE_MASTER</code> type, a video producing device is able to ingest both audio and video media into a stream, while viewers can only ingest audio. Both a video producing device and viewers can join a session first and wait for other participants. While participants are having peer to peer conversations through webRTC, the ingested media session will be stored into the Kinesis Video Stream. Multiple viewers are able to playback real-time media. </p> <p>Customers can also use existing Kinesis Video Streams features like <code>HLS</code> or <code>DASH</code> playback, Image generation, and more with ingested WebRTC media. If thereâs an existing session with the same <code>clientId</code> that's found in the join session request, the new request takes precedence.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<ol> <li> <p>You do not have required permissions to perform this operation</p> </li> </ol> <ol> <li> <p>The <code>AccessDeniedException</code> can be thrown for operation access as well as tokens or resource access</p> </li> </ol>\",\
      \"error\":{\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ChannelArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"^arn:(aws[a-zA-Z-]*):kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+$\"\
    },\
    \"ClientId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.-]+\"\
    },\
    \"ClientLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p> Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed client calls. Try making the call later. </p>\",\
      \"error\":{\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidArgumentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<ol> <li> <p>The value for this input parameter is invalid.</p> </li> </ol> <ol> <li> <p>Additional details may <b>not</b>be returned.</p> </li> </ol>\",\
      \"error\":{\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"JoinStorageSessionAsViewerInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"channelArn\",\
        \"clientId\"\
      ],\
      \"members\":{\
        \"channelArn\":{\
          \"shape\":\"ChannelArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the signaling channel. </p>\"\
        },\
        \"clientId\":{\
          \"shape\":\"ClientId\",\
          \"documentation\":\"<p> The unique identifier for the sender client. </p>\"\
        }\
      }\
    },\
    \"JoinStorageSessionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"channelArn\"],\
      \"members\":{\
        \"channelArn\":{\
          \"shape\":\"ChannelArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the signaling channel. </p>\"\
        }\
      }\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<ol> <li> <p>The specified resource is not found</p> </li> </ol> <ol> <li> <p>You have not specified a channel in this API call.</p> </li> </ol>\",\
      \"error\":{\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"String\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<p> </p>\"\
}\
";
}

@end
