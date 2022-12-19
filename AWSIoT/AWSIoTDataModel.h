//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSIoTDataErrorDomain;

typedef NS_ENUM(NSInteger, AWSIoTDataErrorType) {
    AWSIoTDataErrorUnknown,
    AWSIoTDataErrorConflict,
    AWSIoTDataErrorInternalFailure,
    AWSIoTDataErrorInvalidRequest,
    AWSIoTDataErrorMethodNotAllowed,
    AWSIoTDataErrorRequestEntityTooLarge,
    AWSIoTDataErrorResourceNotFound,
    AWSIoTDataErrorServiceUnavailable,
    AWSIoTDataErrorThrottling,
    AWSIoTDataErrorUnauthorized,
    AWSIoTDataErrorUnsupportedDocumentEncoding,
};

typedef NS_ENUM(NSInteger, AWSIoTDataPayloadFormatIndicator) {
    AWSIoTDataPayloadFormatIndicatorUnknown,
    AWSIoTDataPayloadFormatIndicatorUnspecifiedBytes,
    AWSIoTDataPayloadFormatIndicatorUtf8Data,
};

@class AWSIoTDataDeleteThingShadowRequest;
@class AWSIoTDataDeleteThingShadowResponse;
@class AWSIoTDataGetRetainedMessageRequest;
@class AWSIoTDataGetRetainedMessageResponse;
@class AWSIoTDataGetThingShadowRequest;
@class AWSIoTDataGetThingShadowResponse;
@class AWSIoTDataListNamedShadowsForThingRequest;
@class AWSIoTDataListNamedShadowsForThingResponse;
@class AWSIoTDataListRetainedMessagesRequest;
@class AWSIoTDataListRetainedMessagesResponse;
@class AWSIoTDataPublishRequest;
@class AWSIoTDataRetainedMessageSummary;
@class AWSIoTDataUpdateThingShadowRequest;
@class AWSIoTDataUpdateThingShadowResponse;

/**
 <p>The input for the DeleteThingShadow operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTDataDeleteThingShadowRequest : AWSRequest


/**
 <p>The name of the shadow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shadowName;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the DeleteThingShadow operation.</p>
 Required parameters: [payload]
 */
@interface AWSIoTDataDeleteThingShadowResponse : AWSModel


/**
 <p>The state information, in JSON format.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

@end

/**
 <p>The input for the GetRetainedMessage operation.</p>
 Required parameters: [topic]
 */
@interface AWSIoTDataGetRetainedMessageRequest : AWSRequest


/**
 <p>The topic name of the retained message to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>The output from the GetRetainedMessage operation.</p>
 */
@interface AWSIoTDataGetRetainedMessageResponse : AWSModel


/**
 <p>The Epoch date and time, in milliseconds, when the retained message was stored by IoT.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastModifiedTime;

/**
 <p>The Base64-encoded message payload of the retained message body.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

/**
 <p>The quality of service (QoS) level used to publish the retained message.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable qos;

/**
 <p>The topic name to which the retained message was published.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>The input for the GetThingShadow operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTDataGetThingShadowRequest : AWSRequest


/**
 <p>The name of the shadow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shadowName;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the GetThingShadow operation.</p>
 */
@interface AWSIoTDataGetThingShadowResponse : AWSModel


/**
 <p>The state information, in JSON format.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

@end

/**
 
 */
@interface AWSIoTDataListNamedShadowsForThingRequest : AWSRequest


/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTDataListNamedShadowsForThingResponse : AWSModel


/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of shadows for the specified thing.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable results;

/**
 <p>The Epoch date and time the response was generated by IoT.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 
 */
@interface AWSIoTDataListRetainedMessagesRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTDataListRetainedMessagesResponse : AWSModel


/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A summary list the account's retained messages. The information returned doesn't include the message payloads of the retained messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTDataRetainedMessageSummary *> * _Nullable retainedTopics;

@end

/**
 <p>The input for the Publish operation.</p>
 Required parameters: [topic]
 */
@interface AWSIoTDataPublishRequest : AWSRequest


/**
 <p>A UTF-8 encoded string that describes the content of the publishing message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The base64-encoded binary data used by the sender of the request message to identify which request the response message is for when it's received. <code>correlationData</code> is an HTTP header value in the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable correlationData;

/**
 <p>A user-defined integer value that represents the message expiry interval in seconds. If absent, the message doesn't expire. For more information about the limits of <code>messageExpiry</code>, see <a href="https://docs.aws.amazon.com/general/latest/gr/iot-core.html#message-broker-limits">Amazon Web Services IoT Core message broker and protocol limits and quotas </a> from the Amazon Web Services Reference Guide.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable messageExpiry;

/**
 <p>The message body. MQTT accepts text, binary, and empty (null) message payloads.</p><p>Publishing an empty (null) payload with <b>retain</b> = <code>true</code> deletes the retained message identified by <b>topic</b> from Amazon Web Services IoT Core.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

/**
 <p>An <code>Enum</code> string value that indicates whether the payload is formatted as UTF-8. <code>payloadFormatIndicator</code> is an HTTP header value in the API.</p>
 */
@property (nonatomic, assign) AWSIoTDataPayloadFormatIndicator payloadFormatIndicator;

/**
 <p>The Quality of Service (QoS) level. The default QoS level is 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable qos;

/**
 <p>A UTF-8 encoded string that's used as the topic name for a response message. The response topic is used to describe the topic which the receiver should publish to as part of the request-response flow. The topic must not contain wildcard characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseTopic;

/**
 <p>A Boolean value that determines whether to set the RETAIN flag when the message is published.</p><p>Setting the RETAIN flag causes the message to be retained and sent to new subscribers to the topic.</p><p>Valid values: <code>true</code> | <code>false</code></p><p>Default value: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retainValue;

/**
 <p>The name of the MQTT topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

/**
 <p>A JSON string that contains an array of JSON objects. If you don’t use Amazon Web Services SDK or CLI, you must encode the JSON string to base64 format before adding it to the HTTP header. <code>userProperties</code> is an HTTP header value in the API.</p><p>The following example <code>userProperties</code> parameter is a JSON string which represents two User Properties. Note that it needs to be base64-encoded:</p><p><code>[{"deviceName": "alpha"}, {"deviceCnt": "45"}]</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable userProperties;

@end

/**
 <p>Information about a single retained message.</p>
 */
@interface AWSIoTDataRetainedMessageSummary : AWSModel


/**
 <p>The Epoch date and time, in milliseconds, when the retained message was stored by IoT.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastModifiedTime;

/**
 <p>The size of the retained message's payload in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable payloadSize;

/**
 <p>The quality of service (QoS) level used to publish the retained message.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable qos;

/**
 <p>The topic name to which the retained message was published.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>The input for the UpdateThingShadow operation.</p>
 Required parameters: [thingName, payload]
 */
@interface AWSIoTDataUpdateThingShadowRequest : AWSRequest


/**
 <p>The state information, in JSON format.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

/**
 <p>The name of the shadow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shadowName;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the UpdateThingShadow operation.</p>
 */
@interface AWSIoTDataUpdateThingShadowResponse : AWSModel


/**
 <p>The state information, in JSON format.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

@end

NS_ASSUME_NONNULL_END
