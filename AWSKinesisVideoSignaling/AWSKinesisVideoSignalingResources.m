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

#import "AWSKinesisVideoSignalingResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSKinesisVideoSignalingResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSKinesisVideoSignalingResources

+ (instancetype)sharedInstance {
    static AWSKinesisVideoSignalingResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSKinesisVideoSignalingResources new];
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
    \"apiVersion\":\"2019-12-04\",\
    \"endpointPrefix\":\"kinesisvideo\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"Amazon Kinesis Video Signaling Channels\",\
    \"serviceFullName\":\"Amazon Kinesis Video Signaling Channels\",\
    \"serviceId\":\"Kinesis Video Signaling\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"kinesis-video-signaling-2019-12-04\"\
  },\
  \"operations\":{\
    \"GetIceServerConfig\":{\
      \"name\":\"GetIceServerConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/v1/get-ice-server-config\"\
      },\
      \"input\":{\"shape\":\"GetIceServerConfigRequest\"},\
      \"output\":{\"shape\":\"GetIceServerConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidClientException\"},\
        {\"shape\":\"SessionExpiredException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Gets the Interactive Connectivity Establishment (ICE) server configuration information, including URIs, username, and password which can be used to configure the WebRTC connection. The ICE component uses this configuration information to setup the WebRTC connection, including authenticating with the Traversal Using Relays around NAT (TURN) relay server. </p> <p>TURN is a protocol that is used to improve the connectivity of peer-to-peer applications. By providing a cloud-based relay service, TURN ensures that a connection can be established even when one or more peers are incapable of a direct peer-to-peer connection. For more information, see <a href=\\\"https://tools.ietf.org/html/draft-uberti-rtcweb-turn-rest-00\\\">A REST API For Access To TURN Services</a>.</p> <p> You can invoke this API to establish a fallback mechanism in case either of the peers is unable to establish a direct peer-to-peer connection over a signaling channel. You must specify either a signaling channel ARN or the client ID in order to invoke this API.</p>\"\
    },\
    \"SendAlexaOfferToMaster\":{\
      \"name\":\"SendAlexaOfferToMaster\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/v1/send-alexa-offer-to-master\"\
      },\
      \"input\":{\"shape\":\"SendAlexaOfferToMasterRequest\"},\
      \"output\":{\"shape\":\"SendAlexaOfferToMasterResponse\"},\
      \"errors\":[\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>This API allows you to connect WebRTC-enabled devices with Alexa display devices. When invoked, it sends the Alexa Session Description Protocol (SDP) offer to the master peer. The offer is delivered as soon as the master is connected to the specified signaling channel. This API returns the SDP answer from the connected master. If the master is not connected to the signaling channel, redelivery requests are made until the message expires.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"Answer\":{\
      \"type\":\"string\",\
      \"max\":10000,\
      \"min\":1\
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
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Your request was throttled because you have exceeded the limit of allowed client calls. Try making the call later.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"GetIceServerConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChannelARN\"],\
      \"members\":{\
        \"ChannelARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The ARN of the signaling channel to be used for the peer-to-peer connection between configured peers. </p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientId\",\
          \"documentation\":\"<p>Unique identifier for the viewer. Must be unique within the signaling channel.</p>\"\
        },\
        \"Service\":{\
          \"shape\":\"Service\",\
          \"documentation\":\"<p>Specifies the desired service. Currently, <code>TURN</code> is the only valid value.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"Username\",\
          \"documentation\":\"<p>An optional user ID to be associated with the credentials.</p>\"\
        }\
      }\
    },\
    \"GetIceServerConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IceServerList\":{\
          \"shape\":\"IceServerList\",\
          \"documentation\":\"<p>The list of ICE server information objects.</p>\"\
        }\
      }\
    },\
    \"IceServer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Uris\":{\
          \"shape\":\"Uris\",\
          \"documentation\":\"<p>An array of URIs, in the form specified in the <a href=\\\"https://tools.ietf.org/html/draft-petithuguenin-behave-turn-uris-03\\\">I-D.petithuguenin-behave-turn-uris</a> spec. These URIs provide the different addresses and/or protocols that can be used to reach the TURN server.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"Username\",\
          \"documentation\":\"<p>A username to login to the ICE server.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"Password\",\
          \"documentation\":\"<p>A password to login to the ICE server.</p>\"\
        },\
        \"Ttl\":{\
          \"shape\":\"Ttl\",\
          \"documentation\":\"<p>The period of time, in seconds, during which the username and password are valid.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure for the ICE server connection data.</p>\"\
    },\
    \"IceServerList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IceServer\"}\
    },\
    \"InvalidArgumentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The value for this input parameter is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidClientException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>The specified client is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"MessagePayload\":{\
      \"type\":\"string\",\
      \"max\":10000,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9+/=]+\"\
    },\
    \"NotAuthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The caller is not authorized to perform this operation.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"Password\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.-]+\"\
    },\
    \"ResourceARN\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The specified resource is not found.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"SendAlexaOfferToMasterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelARN\",\
        \"SenderClientId\",\
        \"MessagePayload\"\
      ],\
      \"members\":{\
        \"ChannelARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The ARN of the signaling channel by which Alexa and the master peer communicate.</p>\"\
        },\
        \"SenderClientId\":{\
          \"shape\":\"ClientId\",\
          \"documentation\":\"<p>The unique identifier for the sender client.</p>\"\
        },\
        \"MessagePayload\":{\
          \"shape\":\"MessagePayload\",\
          \"documentation\":\"<p>The base64-encoded SDP offer content.</p>\"\
        }\
      }\
    },\
    \"SendAlexaOfferToMasterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Answer\":{\
          \"shape\":\"Answer\",\
          \"documentation\":\"<p>The base64-encoded SDP answer content.</p>\"\
        }\
      }\
    },\
    \"Service\":{\
      \"type\":\"string\",\
      \"enum\":[\"TURN\"]\
    },\
    \"SessionExpiredException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>If the client session is expired. Once the client is connected, the session is valid for 45 minutes. Client should reconnect to the channel to continue sending/receiving messages.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"Ttl\":{\
      \"type\":\"integer\",\
      \"max\":86400,\
      \"min\":30\
    },\
    \"Uri\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"Uris\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Uri\"}\
    },\
    \"Username\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.-]+\"\
    },\
    \"errorMessage\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<p>Kinesis Video Streams Signaling Service is a intermediate service that establishes a communication channel for discovering peers, transmitting offers and answers in order to establish peer-to-peer connection in webRTC technology.</p>\"\
}\
";
}

@end
