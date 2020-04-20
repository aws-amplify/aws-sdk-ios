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

FOUNDATION_EXPORT NSString *const AWSioteventsErrorDomain;

typedef NS_ENUM(NSInteger, AWSioteventsErrorType) {
    AWSioteventsErrorUnknown,
    AWSioteventsErrorInternalFailure,
    AWSioteventsErrorInvalidRequest,
    AWSioteventsErrorLimitExceeded,
    AWSioteventsErrorResourceAlreadyExists,
    AWSioteventsErrorResourceInUse,
    AWSioteventsErrorResourceNotFound,
    AWSioteventsErrorServiceUnavailable,
    AWSioteventsErrorTagrisAccessDenied,
    AWSioteventsErrorTagrisInternalService,
    AWSioteventsErrorTagrisInvalidArn,
    AWSioteventsErrorTagrisInvalidParameter,
    AWSioteventsErrorTagrisPartialResourcesExistResults,
    AWSioteventsErrorTagrisThrottled,
    AWSioteventsErrorThrottling,
    AWSioteventsErrorUnsupportedOperation,
};

typedef NS_ENUM(NSInteger, AWSioteventsDetectorModelVersionStatus) {
    AWSioteventsDetectorModelVersionStatusUnknown,
    AWSioteventsDetectorModelVersionStatusActive,
    AWSioteventsDetectorModelVersionStatusActivating,
    AWSioteventsDetectorModelVersionStatusInactive,
    AWSioteventsDetectorModelVersionStatusDeprecated,
    AWSioteventsDetectorModelVersionStatusDraft,
    AWSioteventsDetectorModelVersionStatusPaused,
    AWSioteventsDetectorModelVersionStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSioteventsEvaluationMethod) {
    AWSioteventsEvaluationMethodUnknown,
    AWSioteventsEvaluationMethodBatch,
    AWSioteventsEvaluationMethodSerial,
};

typedef NS_ENUM(NSInteger, AWSioteventsInputStatus) {
    AWSioteventsInputStatusUnknown,
    AWSioteventsInputStatusCreating,
    AWSioteventsInputStatusUpdating,
    AWSioteventsInputStatusActive,
    AWSioteventsInputStatusDeleting,
};

typedef NS_ENUM(NSInteger, AWSioteventsLoggingLevel) {
    AWSioteventsLoggingLevelUnknown,
    AWSioteventsLoggingLevelError,
    AWSioteventsLoggingLevelInfo,
    AWSioteventsLoggingLevelDebug,
};

typedef NS_ENUM(NSInteger, AWSioteventsPayloadType) {
    AWSioteventsPayloadTypeUnknown,
    AWSioteventsPayloadTypeString,
    AWSioteventsPayloadTypeJson,
};

typedef NS_ENUM(NSInteger, AWSioteventsTagrisStatus) {
    AWSioteventsTagrisStatusUnknown,
    AWSioteventsTagrisStatusActive,
    AWSioteventsTagrisStatusNotActive,
};

@class AWSioteventsAction;
@class AWSioteventsAssetPropertyTimestamp;
@class AWSioteventsAssetPropertyValue;
@class AWSioteventsAssetPropertyVariant;
@class AWSioteventsAttribute;
@class AWSioteventsClearTimerAction;
@class AWSioteventsCreateDetectorModelRequest;
@class AWSioteventsCreateDetectorModelResponse;
@class AWSioteventsCreateInputRequest;
@class AWSioteventsCreateInputResponse;
@class AWSioteventsDeleteDetectorModelRequest;
@class AWSioteventsDeleteDetectorModelResponse;
@class AWSioteventsDeleteInputRequest;
@class AWSioteventsDeleteInputResponse;
@class AWSioteventsDescribeDetectorModelRequest;
@class AWSioteventsDescribeDetectorModelResponse;
@class AWSioteventsDescribeInputRequest;
@class AWSioteventsDescribeInputResponse;
@class AWSioteventsDescribeLoggingOptionsRequest;
@class AWSioteventsDescribeLoggingOptionsResponse;
@class AWSioteventsDetectorDebugOption;
@class AWSioteventsDetectorModel;
@class AWSioteventsDetectorModelConfiguration;
@class AWSioteventsDetectorModelDefinition;
@class AWSioteventsDetectorModelSummary;
@class AWSioteventsDetectorModelVersionSummary;
@class AWSioteventsDynamoDBAction;
@class AWSioteventsDynamoDBv2Action;
@class AWSioteventsEvent;
@class AWSioteventsFirehoseAction;
@class AWSioteventsInput;
@class AWSioteventsInputConfiguration;
@class AWSioteventsInputDefinition;
@class AWSioteventsInputSummary;
@class AWSioteventsIotEventsAction;
@class AWSioteventsIotSiteWiseAction;
@class AWSioteventsIotTopicPublishAction;
@class AWSioteventsLambdaAction;
@class AWSioteventsListDetectorModelVersionsRequest;
@class AWSioteventsListDetectorModelVersionsResponse;
@class AWSioteventsListDetectorModelsRequest;
@class AWSioteventsListDetectorModelsResponse;
@class AWSioteventsListInputsRequest;
@class AWSioteventsListInputsResponse;
@class AWSioteventsListTagsForResourceRequest;
@class AWSioteventsListTagsForResourceResponse;
@class AWSioteventsLoggingOptions;
@class AWSioteventsOnEnterLifecycle;
@class AWSioteventsOnExitLifecycle;
@class AWSioteventsOnInputLifecycle;
@class AWSioteventsPayload;
@class AWSioteventsPutLoggingOptionsRequest;
@class AWSioteventsResetTimerAction;
@class AWSioteventsSNSTopicPublishAction;
@class AWSioteventsSetTimerAction;
@class AWSioteventsSetVariableAction;
@class AWSioteventsSqsAction;
@class AWSioteventsState;
@class AWSioteventsTag;
@class AWSioteventsTagResourceRequest;
@class AWSioteventsTagResourceResponse;
@class AWSioteventsTagrisSweepListItem;
@class AWSioteventsTagrisVerifyResourcesExistInput;
@class AWSioteventsTagrisVerifyResourcesExistOutput;
@class AWSioteventsTransitionEvent;
@class AWSioteventsUntagResourceRequest;
@class AWSioteventsUntagResourceResponse;
@class AWSioteventsUpdateDetectorModelRequest;
@class AWSioteventsUpdateDetectorModelResponse;
@class AWSioteventsUpdateInputRequest;
@class AWSioteventsUpdateInputResponse;

/**
 <p>An action to be performed when the <code>condition</code> is TRUE.</p>
 */
@interface AWSioteventsAction : AWSModel


/**
 <p>Information needed to clear the timer.</p>
 */
@property (nonatomic, strong) AWSioteventsClearTimerAction * _Nullable clearTimer;

/**
 <p>Writes to the DynamoDB table that you created. The default action payload contains all attribute-value pairs that have the information about the detector model instance and the event that triggered the action. You can also customize the <a href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>. One column of the DynamoDB table receives all attribute-value pairs in the payload that you specify. For more information, see <a href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-event-actions.html">Actions</a> in <i>AWS IoT Events Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSioteventsDynamoDBAction * _Nullable dynamoDB;

/**
 <p>Writes to the DynamoDB table that you created. The default action payload contains all attribute-value pairs that have the information about the detector model instance and the event that triggered the action. You can also customize the <a href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>. A separate column of the DynamoDB table receives one attribute-value pair in the payload that you specify. For more information, see <a href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-event-actions.html">Actions</a> in <i>AWS IoT Events Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSioteventsDynamoDBv2Action * _Nullable dynamoDBv2;

/**
 <p>Sends information about the detector model instance and the event that triggered the action to an Amazon Kinesis Data Firehose delivery stream.</p>
 */
@property (nonatomic, strong) AWSioteventsFirehoseAction * _Nullable firehose;

/**
 <p>Sends AWS IoT Events input, which passes information about the detector model instance and the event that triggered the action.</p>
 */
@property (nonatomic, strong) AWSioteventsIotEventsAction * _Nullable iotEvents;

/**
 <p>Sends information about the detector model instance and the event that triggered the action to an AWS IoT SiteWise asset property.</p>
 */
@property (nonatomic, strong) AWSioteventsIotSiteWiseAction * _Nullable iotSiteWise;

/**
 <p>Publishes an MQTT message with the given topic to the AWS IoT message broker.</p>
 */
@property (nonatomic, strong) AWSioteventsIotTopicPublishAction * _Nullable iotTopicPublish;

/**
 <p>Calls a Lambda function, passing in information about the detector model instance and the event that triggered the action.</p>
 */
@property (nonatomic, strong) AWSioteventsLambdaAction * _Nullable lambda;

/**
 <p>Information needed to reset the timer.</p>
 */
@property (nonatomic, strong) AWSioteventsResetTimerAction * _Nullable resetTimer;

/**
 <p>Information needed to set the timer.</p>
 */
@property (nonatomic, strong) AWSioteventsSetTimerAction * _Nullable setTimer;

/**
 <p>Sets a variable to a specified value.</p>
 */
@property (nonatomic, strong) AWSioteventsSetVariableAction * _Nullable setVariable;

/**
 <p>Sends an Amazon SNS message.</p>
 */
@property (nonatomic, strong) AWSioteventsSNSTopicPublishAction * _Nullable sns;

/**
 <p>Sends information about the detector model instance and the event that triggered the action to an Amazon SQS queue.</p>
 */
@property (nonatomic, strong) AWSioteventsSqsAction * _Nullable sqs;

@end

/**
 <p>A structure that contains timestamp information. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_TimeInNanos.html">TimeInNanos</a> in the <i>AWS IoT SiteWise API Reference</i>.</p><p>For parameters that are string data type, you can specify the following options:</p><ul><li><p>Use a string. For example, the <code>timeInSeconds</code> value can be <code>'1586400675'</code>.</p></li><li><p>Use an expression. For example, the <code>timeInSeconds</code> value can be <code>'${$input.TemperatureInput.sensorData.timestamp/1000}'</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a> in the <i>AWS IoT Events Developer Guide</i>.</p></li></ul>
 Required parameters: [timeInSeconds]
 */
@interface AWSioteventsAssetPropertyTimestamp : AWSModel


/**
 <p>The nanosecond offset converted from <code>timeInSeconds</code>. The valid range is between 0-999999999. You can also specify an expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable offsetInNanos;

/**
 <p>The timestamp, in seconds, in the Unix epoch format. The valid range is between 1-31556889864403199. You can also specify an expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeInSeconds;

@end

/**
 <p>A structure that contains value information. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_AssetPropertyValue.html">AssetPropertyValue</a> in the <i>AWS IoT SiteWise API Reference</i>.</p><p>For parameters that are string data type, you can specify the following options: </p><ul><li><p>Use a string. For example, the <code>quality</code> value can be <code>'GOOD'</code>.</p></li><li><p>Use an expression. For example, the <code>quality</code> value can be <code>$input.TemperatureInput.sensorData.quality</code> .</p><p>For more information, see <a href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a> in the <i>AWS IoT Events Developer Guide</i>.</p></li></ul>
 Required parameters: [value]
 */
@interface AWSioteventsAssetPropertyValue : AWSModel


/**
 <p>The quality of the asset property value. The value must be <code>GOOD</code>, <code>BAD</code>, or <code>UNCERTAIN</code>. You can also specify an expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quality;

/**
 <p>The timestamp associated with the asset property value. The default is the current event time.</p>
 */
@property (nonatomic, strong) AWSioteventsAssetPropertyTimestamp * _Nullable timestamp;

/**
 <p>The value to send to an asset property.</p>
 */
@property (nonatomic, strong) AWSioteventsAssetPropertyVariant * _Nullable value;

@end

/**
 <p>A structure that contains an asset property value. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_Variant.html">Variant</a> in the <i>AWS IoT SiteWise API Reference</i>.</p><important><p>You must specify one of the following value types, depending on the <code>dataType</code> of the specified asset property. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_AssetProperty.html">AssetProperty</a> in the <i>AWS IoT SiteWise API Reference</i>.</p></important><p>For parameters that are string data type, you can specify the following options:</p><ul><li><p>Use a string. For example, the <code>doubleValue</code> value can be <code>'47.9'</code>.</p></li><li><p>Use an expression. For example, the <code>doubleValue</code> value can be <code>$input.TemperatureInput.sensorData.temperature</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a> in the <i>AWS IoT Events Developer Guide</i>.</p></li></ul>
 */
@interface AWSioteventsAssetPropertyVariant : AWSModel


/**
 <p>The asset property value is a Boolean value that must be <code>TRUE</code> or <code>FALSE</code>. You can also specify an expression. If you use an expression, the evaluated result should be a Boolean value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable booleanValueProperty;

/**
 <p>The asset property value is a double. You can also specify an expression. If you use an expression, the evaluated result should be a double.</p>
 */
@property (nonatomic, strong) NSString * _Nullable doubleValueProperty;

/**
 <p>The asset property value is an integer. You can also specify an expression. If you use an expression, the evaluated result should be an integer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integerValueProperty;

/**
 <p>The asset property value is a string. You can also specify an expression. If you use an expression, the evaluated result should be a string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stringValueProperty;

@end

/**
 <p>The attributes from the JSON payload that are made available by the input. Inputs are derived from messages sent to the AWS IoT Events system using <code>BatchPutMessage</code>. Each such message contains a JSON payload. Those attributes (and their paired values) specified here are available for use in the <code>condition</code> expressions used by detectors. </p>
 Required parameters: [jsonPath]
 */
@interface AWSioteventsAttribute : AWSModel


/**
 <p>An expression that specifies an attribute-value pair in a JSON structure. Use this to specify an attribute from the JSON payload that is made available by the input. Inputs are derived from messages sent to AWS IoT Events (<code>BatchPutMessage</code>). Each such message contains a JSON payload. The attribute (and its paired value) specified here are available for use in the <code>condition</code> expressions used by detectors. </p><p>Syntax: <code>&lt;field-name&gt;.&lt;field-name&gt;...</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jsonPath;

@end

/**
 <p>Information needed to clear the timer.</p>
 Required parameters: [timerName]
 */
@interface AWSioteventsClearTimerAction : AWSModel


/**
 <p>The name of the timer to clear.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timerName;

@end

/**
 
 */
@interface AWSioteventsCreateDetectorModelRequest : AWSRequest


/**
 <p>Information that defines how the detectors operate.</p>
 */
@property (nonatomic, strong) AWSioteventsDetectorModelDefinition * _Nullable detectorModelDefinition;

/**
 <p>A brief description of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelDescription;

/**
 <p>The name of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelName;

/**
 <p>Information about the order in which events are evaluated and how actions are executed. </p>
 */
@property (nonatomic, assign) AWSioteventsEvaluationMethod evaluationMethod;

/**
 <p>The input attribute key used to identify a device or system to create a detector (an instance of the detector model) and then to route each input received to the appropriate detector (instance). This parameter uses a JSON-path expression in the message payload of each input to specify the attribute-value pair that is used to identify the device associated with the input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The ARN of the role that grants permission to AWS IoT Events to perform its operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Metadata that can be used to manage the detector model.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSioteventsCreateDetectorModelResponse : AWSModel


/**
 <p>Information about how the detector model is configured.</p>
 */
@property (nonatomic, strong) AWSioteventsDetectorModelConfiguration * _Nullable detectorModelConfiguration;

@end

/**
 
 */
@interface AWSioteventsCreateInputRequest : AWSRequest


/**
 <p>The definition of the input.</p>
 */
@property (nonatomic, strong) AWSioteventsInputDefinition * _Nullable inputDefinition;

/**
 <p>A brief description of the input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputDescription;

/**
 <p>The name you want to give to the input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputName;

/**
 <p>Metadata that can be used to manage the input.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSioteventsCreateInputResponse : AWSModel


/**
 <p>Information about the configuration of the input.</p>
 */
@property (nonatomic, strong) AWSioteventsInputConfiguration * _Nullable inputConfiguration;

@end

/**
 
 */
@interface AWSioteventsDeleteDetectorModelRequest : AWSRequest


/**
 <p>The name of the detector model to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelName;

@end

/**
 
 */
@interface AWSioteventsDeleteDetectorModelResponse : AWSModel


@end

/**
 
 */
@interface AWSioteventsDeleteInputRequest : AWSRequest


/**
 <p>The name of the input to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputName;

@end

/**
 
 */
@interface AWSioteventsDeleteInputResponse : AWSModel


@end

/**
 
 */
@interface AWSioteventsDescribeDetectorModelRequest : AWSRequest


/**
 <p>The name of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelName;

/**
 <p>The version of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelVersion;

@end

/**
 
 */
@interface AWSioteventsDescribeDetectorModelResponse : AWSModel


/**
 <p>Information about the detector model.</p>
 */
@property (nonatomic, strong) AWSioteventsDetectorModel * _Nullable detectorModel;

@end

/**
 
 */
@interface AWSioteventsDescribeInputRequest : AWSRequest


/**
 <p>The name of the input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputName;

@end

/**
 
 */
@interface AWSioteventsDescribeInputResponse : AWSModel


/**
 <p>Information about the input.</p>
 */
@property (nonatomic, strong) AWSioteventsInput * _Nullable input;

@end

/**
 
 */
@interface AWSioteventsDescribeLoggingOptionsRequest : AWSRequest


@end

/**
 
 */
@interface AWSioteventsDescribeLoggingOptionsResponse : AWSModel


/**
 <p>The current settings of the AWS IoT Events logging options.</p>
 */
@property (nonatomic, strong) AWSioteventsLoggingOptions * _Nullable loggingOptions;

@end

/**
 <p>The detector model and the specific detectors (instances) for which the logging level is given.</p>
 Required parameters: [detectorModelName]
 */
@interface AWSioteventsDetectorDebugOption : AWSModel


/**
 <p>The name of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelName;

/**
 <p>The value of the input attribute key used to create the detector (the instance of the detector model).</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyValue;

@end

/**
 <p>Information about the detector model.</p>
 */
@interface AWSioteventsDetectorModel : AWSModel


/**
 <p>Information about how the detector is configured.</p>
 */
@property (nonatomic, strong) AWSioteventsDetectorModelConfiguration * _Nullable detectorModelConfiguration;

/**
 <p>Information that defines how a detector operates.</p>
 */
@property (nonatomic, strong) AWSioteventsDetectorModelDefinition * _Nullable detectorModelDefinition;

@end

/**
 <p>Information about how the detector model is configured.</p>
 */
@interface AWSioteventsDetectorModelConfiguration : AWSModel


/**
 <p>The time the detector model was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The ARN of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelArn;

/**
 <p>A brief description of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelDescription;

/**
 <p>The name of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelName;

/**
 <p>The version of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelVersion;

/**
 <p>Information about the order in which events are evaluated and how actions are executed. </p>
 */
@property (nonatomic, assign) AWSioteventsEvaluationMethod evaluationMethod;

/**
 <p>The value used to identify a detector instance. When a device or system sends input, a new detector instance with a unique key value is created. AWS IoT Events can continue to route input to its corresponding detector instance based on this identifying information. </p><p>This parameter uses a JSON-path expression to select the attribute-value pair in the message payload that is used for identification. To route the message to the correct detector instance, the device must send a message payload that contains the same attribute-value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The time the detector model was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTime;

/**
 <p>The ARN of the role that grants permission to AWS IoT Events to perform its operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The status of the detector model.</p>
 */
@property (nonatomic, assign) AWSioteventsDetectorModelVersionStatus status;

@end

/**
 <p>Information that defines how a detector operates.</p>
 Required parameters: [states, initialStateName]
 */
@interface AWSioteventsDetectorModelDefinition : AWSModel


/**
 <p>The state that is entered at the creation of each detector (instance).</p>
 */
@property (nonatomic, strong) NSString * _Nullable initialStateName;

/**
 <p>Information about the states of the detector.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsState *> * _Nullable states;

@end

/**
 <p>Information about the detector model.</p>
 */
@interface AWSioteventsDetectorModelSummary : AWSModel


/**
 <p>The time the detector model was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>A brief description of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelDescription;

/**
 <p>The name of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelName;

@end

/**
 <p>Information about the detector model version.</p>
 */
@interface AWSioteventsDetectorModelVersionSummary : AWSModel


/**
 <p>The time the detector model version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The ARN of the detector model version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelArn;

/**
 <p>The name of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelName;

/**
 <p>The ID of the detector model version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelVersion;

/**
 <p>Information about the order in which events are evaluated and how actions are executed. </p>
 */
@property (nonatomic, assign) AWSioteventsEvaluationMethod evaluationMethod;

/**
 <p>The last time the detector model version was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTime;

/**
 <p>The ARN of the role that grants the detector model permission to perform its tasks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The status of the detector model version.</p>
 */
@property (nonatomic, assign) AWSioteventsDetectorModelVersionStatus status;

@end

/**
 <p>Defines an action to write to the Amazon DynamoDB table that you created. The standard action payload contains all attribute-value pairs that have the information about the detector model instance and the event that triggered the action. You can also customize the <a href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>. One column of the DynamoDB table receives all attribute-value pairs in the payload that you specify.</p><p>The <code>tableName</code> and <code>hashKeyField</code> values must match the table name and the partition key of the DynamoDB table. </p><note><p>If the DynamoDB table also has a sort key, you must specify <code>rangeKeyField</code>. The <code>rangeKeyField</code> value must match the sort key.</p></note><p/><p>The <code>hashKeyValue</code> and <code>rangeKeyValue</code> use substitution templates. These templates provide data at runtime. The syntax is <code>${sql-expression}</code>.</p><p>You can use expressions for parameters that are string data type. For more information, see <a href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a> in the <i>AWS IoT Events Developer Guide</i>.</p><note><p>If the defined payload type is a string, <code>DynamoDBAction</code> writes non-JSON data to the DynamoDB table as binary data. The DynamoDB console displays the data as Base64-encoded text. The <code>payloadField</code> is <code>&lt;payload-field&gt;_raw</code>.</p></note>
 Required parameters: [hashKeyField, hashKeyValue, tableName]
 */
@interface AWSioteventsDynamoDBAction : AWSModel


/**
 <p>The name of the hash key (also called the partition key).</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashKeyField;

/**
 <p>The data type for the hash key (also called the partition key). You can specify the following values:</p><ul><li><p><code>STRING</code> - The hash key is a string.</p></li><li><p><code>NUMBER</code> - The hash key is a number.</p></li></ul><p>If you don't specify <code>hashKeyType</code>, the default value is <code>STRING</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashKeyType;

/**
 <p>The value of the hash key (also called the partition key).</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashKeyValue;

/**
 <p>The type of operation to perform. You can specify the following values: </p><ul><li><p><code>INSERT</code> - Insert data as a new item into the DynamoDB table. This item uses the specified hash key as a partition key. If you specified a range key, the item uses the range key as a sort key.</p></li><li><p><code>UPDATE</code> - Update an existing item of the DynamoDB table with new data. This item's partition key must match the specified hash key. If you specified a range key, the range key must match the item's sort key.</p></li><li><p><code>DELETE</code> - Delete an existing item of the DynamoDB table. This item's partition key must match the specified hash key. If you specified a range key, the range key must match the item's sort key.</p></li></ul><p>If you don't specify this parameter, AWS IoT Events triggers the <code>INSERT</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operation;

/**
 <p>Information needed to configure the payload.</p><p>By default, AWS IoT Events generates a standard payload in JSON for any action. This action payload contains all attribute-value pairs that have the information about the detector model instance and the event triggered the action. To configure the action payload, you can use <code>contentExpression</code>.</p>
 */
@property (nonatomic, strong) AWSioteventsPayload * _Nullable payload;

/**
 <p>The name of the DynamoDB column that receives the action payload.</p><p>If you don't specify this parameter, the name of the DynamoDB column is <code>payload</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadField;

/**
 <p>The name of the range key (also called the sort key).</p>
 */
@property (nonatomic, strong) NSString * _Nullable rangeKeyField;

/**
 <p>The data type for the range key (also called the sort key), You can specify the following values:</p><ul><li><p><code>STRING</code> - The range key is a string.</p></li><li><p><code>NUMBER</code> - The range key is number.</p></li></ul><p>If you don't specify <code>rangeKeyField</code>, the default value is <code>STRING</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rangeKeyType;

/**
 <p>The value of the range key (also called the sort key).</p>
 */
@property (nonatomic, strong) NSString * _Nullable rangeKeyValue;

/**
 <p>The name of the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Defines an action to write to the Amazon DynamoDB table that you created. The default action payload contains all attribute-value pairs that have the information about the detector model instance and the event that triggered the action. You can also customize the <a href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>. A separate column of the DynamoDB table receives one attribute-value pair in the payload that you specify.</p><important><p>The <code>type</code> value for <code>Payload</code> must be <code>JSON</code>.</p></important><p>You can use expressions for parameters that are strings. For more information, see <a href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a> in the <i>AWS IoT Events Developer Guide</i>.</p>
 Required parameters: [tableName]
 */
@interface AWSioteventsDynamoDBv2Action : AWSModel


/**
 <p>Information needed to configure the payload.</p><p>By default, AWS IoT Events generates a standard payload in JSON for any action. This action payload contains all attribute-value pairs that have the information about the detector model instance and the event triggered the action. To configure the action payload, you can use <code>contentExpression</code>.</p>
 */
@property (nonatomic, strong) AWSioteventsPayload * _Nullable payload;

/**
 <p>The name of the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Specifies the <code>actions</code> to be performed when the <code>condition</code> evaluates to TRUE.</p>
 Required parameters: [eventName]
 */
@interface AWSioteventsEvent : AWSModel


/**
 <p>The actions to be performed.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsAction *> * _Nullable actions;

/**
 <p>Optional. The Boolean expression that, when TRUE, causes the <code>actions</code> to be performed. If not present, the actions are performed (=TRUE). If the expression result is not a Boolean value, the actions are not performed (=FALSE).</p>
 */
@property (nonatomic, strong) NSString * _Nullable condition;

/**
 <p>The name of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventName;

@end

/**
 <p>Sends information about the detector model instance and the event that triggered the action to an Amazon Kinesis Data Firehose delivery stream.</p>
 Required parameters: [deliveryStreamName]
 */
@interface AWSioteventsFirehoseAction : AWSModel


/**
 <p>The name of the Kinesis Data Firehose delivery stream where the data is written.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

/**
 <p>You can configure the action payload when you send a message to an Amazon Kinesis Data Firehose delivery stream.</p>
 */
@property (nonatomic, strong) AWSioteventsPayload * _Nullable payload;

/**
 <p>A character separator that is used to separate records written to the Kinesis Data Firehose delivery stream. Valid values are: '\n' (newline), '\t' (tab), '\r\n' (Windows newline), ',' (comma).</p>
 */
@property (nonatomic, strong) NSString * _Nullable separator;

@end

/**
 <p>Information about the input.</p>
 */
@interface AWSioteventsInput : AWSModel


/**
 <p>Information about the configuration of an input.</p>
 */
@property (nonatomic, strong) AWSioteventsInputConfiguration * _Nullable inputConfiguration;

/**
 <p>The definition of the input.</p>
 */
@property (nonatomic, strong) AWSioteventsInputDefinition * _Nullable inputDefinition;

@end

/**
 <p>Information about the configuration of an input.</p>
 Required parameters: [inputName, inputArn, creationTime, lastUpdateTime, status]
 */
@interface AWSioteventsInputConfiguration : AWSModel


/**
 <p>The time the input was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The ARN of the input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputArn;

/**
 <p>A brief description of the input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputDescription;

/**
 <p>The name of the input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputName;

/**
 <p>The last time the input was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTime;

/**
 <p>The status of the input.</p>
 */
@property (nonatomic, assign) AWSioteventsInputStatus status;

@end

/**
 <p>The definition of the input.</p>
 Required parameters: [attributes]
 */
@interface AWSioteventsInputDefinition : AWSModel


/**
 <p>The attributes from the JSON payload that are made available by the input. Inputs are derived from messages sent to the AWS IoT Events system using <code>BatchPutMessage</code>. Each such message contains a JSON payload, and those attributes (and their paired values) specified here are available for use in the <code>condition</code> expressions used by detectors that monitor this input. </p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsAttribute *> * _Nullable attributes;

@end

/**
 <p>Information about the input.</p>
 */
@interface AWSioteventsInputSummary : AWSModel


/**
 <p>The time the input was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The ARN of the input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputArn;

/**
 <p>A brief description of the input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputDescription;

/**
 <p>The name of the input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputName;

/**
 <p>The last time the input was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTime;

/**
 <p>The status of the input.</p>
 */
@property (nonatomic, assign) AWSioteventsInputStatus status;

@end

/**
 <p>Sends an AWS IoT Events input, passing in information about the detector model instance and the event that triggered the action.</p>
 Required parameters: [inputName]
 */
@interface AWSioteventsIotEventsAction : AWSModel


/**
 <p>The name of the AWS IoT Events input where the data is sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputName;

/**
 <p>You can configure the action payload when you send a message to an AWS IoT Events input.</p>
 */
@property (nonatomic, strong) AWSioteventsPayload * _Nullable payload;

@end

/**
 <p>Sends information about the detector model instance and the event that triggered the action to a specified asset property in AWS IoT SiteWise.</p><important><p>You must specify either <code>propertyAlias</code> or both <code>assetId</code> and <code>propertyId</code> to identify the target asset property in AWS IoT SiteWise.</p></important><p>For parameters that are string data type, you can specify the following options: </p><ul><li><p>Use a string. For example, the <code>propertyAlias</code> value can be <code>'/company/windfarm/3/turbine/7/temperature'</code>.</p></li><li><p>Use an expression. For example, the <code>propertyAlias</code> value can be <code>'company/windfarm/${$input.TemperatureInput.sensorData.windfarmID}/turbine/${$input.TemperatureInput.sensorData.turbineID}/temperature'</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a> in the <i>AWS IoT Events Developer Guide</i>.</p></li></ul>
 Required parameters: [propertyValue]
 */
@interface AWSioteventsIotSiteWiseAction : AWSModel


/**
 <p>The ID of the asset that has the specified property. You can specify an expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>A unique identifier for this entry. You can use the entry ID to track which data entry causes an error in case of failure. The default is a new unique identifier. You can also specify an expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entryId;

/**
 <p>The alias of the asset property. You can also specify an expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyAlias;

/**
 <p>The ID of the asset property. You can specify an expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyId;

/**
 <p>The value to send to the asset property. This value contains timestamp, quality, and value (TQV) information. </p>
 */
@property (nonatomic, strong) AWSioteventsAssetPropertyValue * _Nullable propertyValue;

@end

/**
 <p>Information required to publish the MQTT message through the AWS IoT message broker.</p>
 Required parameters: [mqttTopic]
 */
@interface AWSioteventsIotTopicPublishAction : AWSModel


/**
 <p>The MQTT topic of the message. You can use a string expression that includes variables (<code>$variable.&lt;variable-name&gt;</code>) and input values (<code>$input.&lt;input-name&gt;.&lt;path-to-datum&gt;</code>) as the topic string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mqttTopic;

/**
 <p>You can configure the action payload when you publish a message to an AWS IoT Core topic.</p>
 */
@property (nonatomic, strong) AWSioteventsPayload * _Nullable payload;

@end

/**
 <p>Calls a Lambda function, passing in information about the detector model instance and the event that triggered the action.</p>
 Required parameters: [functionArn]
 */
@interface AWSioteventsLambdaAction : AWSModel


/**
 <p>The ARN of the Lambda function that is executed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>You can configure the action payload when you send a message to a Lambda function.</p>
 */
@property (nonatomic, strong) AWSioteventsPayload * _Nullable payload;

@end

/**
 
 */
@interface AWSioteventsListDetectorModelVersionsRequest : AWSRequest


/**
 <p>The name of the detector model whose versions are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelName;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSioteventsListDetectorModelVersionsResponse : AWSModel


/**
 <p>Summary information about the detector model versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsDetectorModelVersionSummary *> * _Nullable detectorModelVersionSummaries;

/**
 <p>A token to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSioteventsListDetectorModelsRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSioteventsListDetectorModelsResponse : AWSModel


/**
 <p>Summary information about the detector models.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsDetectorModelSummary *> * _Nullable detectorModelSummaries;

/**
 <p>A token to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSioteventsListInputsRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSioteventsListInputsResponse : AWSModel


/**
 <p>Summary information about the inputs.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsInputSummary *> * _Nullable inputSummaries;

/**
 <p>A token to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSioteventsListTagsForResourceRequest : AWSRequest


/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSioteventsListTagsForResourceResponse : AWSModel


/**
 <p>The list of tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsTag *> * _Nullable tags;

@end

/**
 <p>The values of the AWS IoT Events logging options.</p>
 Required parameters: [roleArn, level, enabled]
 */
@interface AWSioteventsLoggingOptions : AWSModel


/**
 <p>Information that identifies those detector models and their detectors (instances) for which the logging level is given.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsDetectorDebugOption *> * _Nullable detectorDebugOptions;

/**
 <p>If TRUE, logging is enabled for AWS IoT Events.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The logging level.</p>
 */
@property (nonatomic, assign) AWSioteventsLoggingLevel level;

/**
 <p>The ARN of the role that grants permission to AWS IoT Events to perform logging.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>When entering this state, perform these <code>actions</code> if the <code>condition</code> is TRUE.</p>
 */
@interface AWSioteventsOnEnterLifecycle : AWSModel


/**
 <p>Specifies the actions that are performed when the state is entered and the <code>condition</code> is <code>TRUE</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsEvent *> * _Nullable events;

@end

/**
 <p>When exiting this state, perform these <code>actions</code> if the specified <code>condition</code> is <code>TRUE</code>.</p>
 */
@interface AWSioteventsOnExitLifecycle : AWSModel


/**
 <p>Specifies the <code>actions</code> that are performed when the state is exited and the <code>condition</code> is <code>TRUE</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsEvent *> * _Nullable events;

@end

/**
 <p>Specifies the actions performed when the <code>condition</code> evaluates to TRUE.</p>
 */
@interface AWSioteventsOnInputLifecycle : AWSModel


/**
 <p>Specifies the actions performed when the <code>condition</code> evaluates to TRUE.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsEvent *> * _Nullable events;

/**
 <p>Specifies the actions performed, and the next state entered, when a <code>condition</code> evaluates to TRUE.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsTransitionEvent *> * _Nullable transitionEvents;

@end

/**
 <p>Information needed to configure the payload.</p><p>By default, AWS IoT Events generates a standard payload in JSON for any action. This action payload contains all attribute-value pairs that have the information about the detector model instance and the event triggered the action. To configure the action payload, you can use <code>contentExpression</code>.</p>
 Required parameters: [contentExpression, type]
 */
@interface AWSioteventsPayload : AWSModel


/**
 <p>The content of the payload. You can use a string expression that includes quoted strings (<code>'&lt;string&gt;'</code>), variables (<code>$variable.&lt;variable-name&gt;</code>), input values (<code>$input.&lt;input-name&gt;.&lt;path-to-datum&gt;</code>), string concatenations, and quoted strings that contain <code>${}</code> as the content. The recommended maximum size of a content expression is 1 KB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentExpression;

/**
 <p>The value of the payload type can be either <code>STRING</code> or <code>JSON</code>.</p>
 */
@property (nonatomic, assign) AWSioteventsPayloadType types;

@end

/**
 
 */
@interface AWSioteventsPutLoggingOptionsRequest : AWSRequest


/**
 <p>The new values of the AWS IoT Events logging options.</p>
 */
@property (nonatomic, strong) AWSioteventsLoggingOptions * _Nullable loggingOptions;

@end

/**
 <p>Information required to reset the timer. The timer is reset to the previously evaluated result of the duration. The duration expression isn't reevaluated when you reset the timer.</p>
 Required parameters: [timerName]
 */
@interface AWSioteventsResetTimerAction : AWSModel


/**
 <p>The name of the timer to reset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timerName;

@end

/**
 <p>Information required to publish the Amazon SNS message.</p>
 Required parameters: [targetArn]
 */
@interface AWSioteventsSNSTopicPublishAction : AWSModel


/**
 <p>You can configure the action payload when you send a message as an Amazon SNS push notification.</p>
 */
@property (nonatomic, strong) AWSioteventsPayload * _Nullable payload;

/**
 <p>The ARN of the Amazon SNS target where the message is sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 <p>Information needed to set the timer.</p>
 Required parameters: [timerName]
 */
@interface AWSioteventsSetTimerAction : AWSModel


/**
 <p>The duration of the timer, in seconds. You can use a string expression that includes numbers, variables (<code>$variable.&lt;variable-name&gt;</code>), and input values (<code>$input.&lt;input-name&gt;.&lt;path-to-datum&gt;</code>) as the duration. The range of the duration is 1-31622400 seconds. To ensure accuracy, the minimum duration is 60 seconds. The evaluated result of the duration is rounded down to the nearest whole number. </p>
 */
@property (nonatomic, strong) NSString * _Nullable durationExpression;

/**
 <p>The number of seconds until the timer expires. The minimum value is 60 seconds to ensure accuracy. The maximum value is 31622400 seconds. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable seconds;

/**
 <p>The name of the timer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timerName;

@end

/**
 <p>Information about the variable and its new value.</p>
 Required parameters: [variableName, value]
 */
@interface AWSioteventsSetVariableAction : AWSModel


/**
 <p>The new value of the variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

/**
 <p>The name of the variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable variableName;

@end

/**
 <p>Sends information about the detector model instance and the event that triggered the action to an Amazon SQS queue.</p>
 Required parameters: [queueUrl]
 */
@interface AWSioteventsSqsAction : AWSModel


/**
 <p>You can configure the action payload when you send a message to an Amazon SQS queue.</p>
 */
@property (nonatomic, strong) AWSioteventsPayload * _Nullable payload;

/**
 <p>The URL of the SQS queue where the data is written.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

/**
 <p>Set this to TRUE if you want the data to be base-64 encoded before it is written to the queue. Otherwise, set this to FALSE.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useBase64;

@end

/**
 <p>Information that defines a state of a detector.</p>
 Required parameters: [stateName]
 */
@interface AWSioteventsState : AWSModel


/**
 <p>When entering this state, perform these <code>actions</code> if the <code>condition</code> is TRUE.</p>
 */
@property (nonatomic, strong) AWSioteventsOnEnterLifecycle * _Nullable onEnter;

/**
 <p>When exiting this state, perform these <code>actions</code> if the specified <code>condition</code> is <code>TRUE</code>.</p>
 */
@property (nonatomic, strong) AWSioteventsOnExitLifecycle * _Nullable onExit;

/**
 <p>When an input is received and the <code>condition</code> is TRUE, perform the specified <code>actions</code>.</p>
 */
@property (nonatomic, strong) AWSioteventsOnInputLifecycle * _Nullable onInput;

/**
 <p>The name of the state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateName;

@end

/**
 <p>Metadata that can be used to manage the resource.</p>
 Required parameters: [key, value]
 */
@interface AWSioteventsTag : AWSModel


/**
 <p>The tag's key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The tag's value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSioteventsTagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The new or modified tags for the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSioteventsTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSioteventsTagrisSweepListItem : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable tagrisAccountId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable tagrisAmazonResourceName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable tagrisInternalId;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable tagrisVersion;

@end

/**
 
 */
@interface AWSioteventsTagrisVerifyResourcesExistInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray<AWSioteventsTagrisSweepListItem *> * _Nullable tagrisSweepList;

@end

/**
 
 */
@interface AWSioteventsTagrisVerifyResourcesExistOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tagrisSweepListResult;

@end

/**
 <p>Specifies the actions performed and the next state entered when a <code>condition</code> evaluates to TRUE.</p>
 Required parameters: [eventName, condition, nextState]
 */
@interface AWSioteventsTransitionEvent : AWSModel


/**
 <p>The actions to be performed.</p>
 */
@property (nonatomic, strong) NSArray<AWSioteventsAction *> * _Nullable actions;

/**
 <p>Required. A Boolean expression that when TRUE causes the actions to be performed and the <code>nextState</code> to be entered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable condition;

/**
 <p>The name of the transition event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventName;

/**
 <p>The next state to enter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextState;

@end

/**
 
 */
@interface AWSioteventsUntagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of the keys of the tags to be removed from the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSioteventsUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSioteventsUpdateDetectorModelRequest : AWSRequest


/**
 <p>Information that defines how a detector operates.</p>
 */
@property (nonatomic, strong) AWSioteventsDetectorModelDefinition * _Nullable detectorModelDefinition;

/**
 <p>A brief description of the detector model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelDescription;

/**
 <p>The name of the detector model that is updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorModelName;

/**
 <p>Information about the order in which events are evaluated and how actions are executed. </p>
 */
@property (nonatomic, assign) AWSioteventsEvaluationMethod evaluationMethod;

/**
 <p>The ARN of the role that grants permission to AWS IoT Events to perform its operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSioteventsUpdateDetectorModelResponse : AWSModel


/**
 <p>Information about how the detector model is configured.</p>
 */
@property (nonatomic, strong) AWSioteventsDetectorModelConfiguration * _Nullable detectorModelConfiguration;

@end

/**
 
 */
@interface AWSioteventsUpdateInputRequest : AWSRequest


/**
 <p>The definition of the input.</p>
 */
@property (nonatomic, strong) AWSioteventsInputDefinition * _Nullable inputDefinition;

/**
 <p>A brief description of the input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputDescription;

/**
 <p>The name of the input you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputName;

@end

/**
 
 */
@interface AWSioteventsUpdateInputResponse : AWSModel


/**
 <p>Information about the configuration of the input.</p>
 */
@property (nonatomic, strong) AWSioteventsInputConfiguration * _Nullable inputConfiguration;

@end

NS_ASSUME_NONNULL_END
