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

FOUNDATION_EXPORT NSString *const AWSLexErrorDomain;

typedef NS_ENUM(NSInteger, AWSLexErrorType) {
    AWSLexErrorUnknown,
    AWSLexErrorBadGateway,
    AWSLexErrorBadRequest,
    AWSLexErrorConflict,
    AWSLexErrorDependencyFailed,
    AWSLexErrorInternalFailure,
    AWSLexErrorLimitExceeded,
    AWSLexErrorLoopDetected,
    AWSLexErrorNotAcceptable,
    AWSLexErrorNotFound,
    AWSLexErrorRequestTimeout,
    AWSLexErrorUnsupportedMediaType,
};

typedef NS_ENUM(NSInteger, AWSLexConfirmationStatus) {
    AWSLexConfirmationStatusUnknown,
    AWSLexConfirmationStatusNone,
    AWSLexConfirmationStatusConfirmed,
    AWSLexConfirmationStatusDenied,
};

typedef NS_ENUM(NSInteger, AWSLexContentType) {
    AWSLexContentTypeUnknown,
    AWSLexContentTypeApplicationVndAmazonawsCardGeneric,
};

typedef NS_ENUM(NSInteger, AWSLexDialogActionType) {
    AWSLexDialogActionTypeUnknown,
    AWSLexDialogActionTypeElicitIntent,
    AWSLexDialogActionTypeConfirmIntent,
    AWSLexDialogActionTypeElicitSlot,
    AWSLexDialogActionTypeClose,
    AWSLexDialogActionTypeDelegate,
};

typedef NS_ENUM(NSInteger, AWSLexDialogState) {
    AWSLexDialogStateUnknown,
    AWSLexDialogStateElicitIntent,
    AWSLexDialogStateConfirmIntent,
    AWSLexDialogStateElicitSlot,
    AWSLexDialogStateFulfilled,
    AWSLexDialogStateReadyForFulfillment,
    AWSLexDialogStateFailed,
};

typedef NS_ENUM(NSInteger, AWSLexFulfillmentState) {
    AWSLexFulfillmentStateUnknown,
    AWSLexFulfillmentStateFulfilled,
    AWSLexFulfillmentStateFailed,
    AWSLexFulfillmentStateReadyForFulfillment,
};

typedef NS_ENUM(NSInteger, AWSLexMessageFormatType) {
    AWSLexMessageFormatTypeUnknown,
    AWSLexMessageFormatTypePlainText,
    AWSLexMessageFormatTypeCustomPayload,
    AWSLexMessageFormatTypeSsml,
    AWSLexMessageFormatTypeComposite,
};

@class AWSLexButton;
@class AWSLexDeleteSessionRequest;
@class AWSLexDeleteSessionResponse;
@class AWSLexDialogAction;
@class AWSLexGenericAttachment;
@class AWSLexGetSessionRequest;
@class AWSLexGetSessionResponse;
@class AWSLexIntentSummary;
@class AWSLexPostContentRequest;
@class AWSLexPostContentResponse;
@class AWSLexPostTextRequest;
@class AWSLexPostTextResponse;
@class AWSLexPutSessionRequest;
@class AWSLexPutSessionResponse;
@class AWSLexResponseCard;
@class AWSLexSentimentResponse;

/**
 <p>Represents an option to be shown on the client platform (Facebook, Slack, etc.)</p>
 Required parameters: [text, value]
 */
@interface AWSLexButton : AWSModel


/**
 <p>Text that is visible to the user on the button.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>The value sent to Amazon Lex when a user chooses the button. For example, consider button text "NYC." When the user chooses the button, the value sent can be "New York City."</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSLexDeleteSessionRequest : AWSRequest


/**
 <p>The alias in use for the bot that contains the session data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>The name of the bot that contains the session data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The identifier of the user associated with the session data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSLexDeleteSessionResponse : AWSModel


/**
 <p>The alias in use for the bot associated with the session data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>The name of the bot associated with the session data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The unique identifier for the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

/**
 <p>The ID of the client application user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p>Describes the next action that the bot should take in its interaction with the user and provides information about the context in which the action takes place. Use the <code>DialogAction</code> data type to set the interaction to a specific state, or to return the interaction to a previous state.</p>
 Required parameters: [type]
 */
@interface AWSLexDialogAction : AWSModel


/**
 <p>The fulfillment state of the intent. The possible values are:</p><ul><li><p><code>Failed</code> - The Lambda function associated with the intent failed to fulfill the intent.</p></li><li><p><code>Fulfilled</code> - The intent has fulfilled by the Lambda function associated with the intent. </p></li><li><p><code>ReadyForFulfillment</code> - All of the information necessary for the intent is present and the intent ready to be fulfilled by the client application.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexFulfillmentState fulfillmentState;

/**
 <p>The name of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable intentName;

/**
 <p>The message that should be shown to the user. If you don't specify a message, Amazon Lex will use the message configured for the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <ul><li><p><code>PlainText</code> - The message contains plain UTF-8 text.</p></li><li><p><code>CustomPayload</code> - The message is a custom format for the client.</p></li><li><p><code>SSML</code> - The message contains text formatted for voice output.</p></li><li><p><code>Composite</code> - The message contains an escaped JSON object containing one or more messages. For more information, see <a href="https://docs.aws.amazon.com/lex/latest/dg/howitworks-manage-prompts.html">Message Groups</a>. </p></li></ul>
 */
@property (nonatomic, assign) AWSLexMessageFormatType messageFormat;

/**
 <p>The name of the slot that should be elicited from the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable slotToElicit;

/**
 <p>Map of the slots that have been gathered and their values. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable slots;

/**
 <p>The next action that the bot should take in its interaction with the user. The possible values are:</p><ul><li><p><code>ConfirmIntent</code> - The next action is asking the user if the intent is complete and ready to be fulfilled. This is a yes/no question such as "Place the order?"</p></li><li><p><code>Close</code> - Indicates that the there will not be a response from the user. For example, the statement "Your order has been placed" does not require a response.</p></li><li><p><code>Delegate</code> - The next action is determined by Amazon Lex.</p></li><li><p><code>ElicitIntent</code> - The next action is to determine the intent that the user wants to fulfill.</p></li><li><p><code>ElicitSlot</code> - The next action is to elicit a slot value from the user.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexDialogActionType types;

@end

/**
 <p>Represents an option rendered to the user when a prompt is shown. It could be an image, a button, a link, or text. </p>
 */
@interface AWSLexGenericAttachment : AWSModel


/**
 <p>The URL of an attachment to the response card.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentLinkUrl;

/**
 <p>The list of options to show to the user.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexButton *> * _Nullable buttons;

/**
 <p>The URL of an image that is displayed to the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 <p>The subtitle shown below the title.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subTitle;

/**
 <p>The title of the option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 
 */
@interface AWSLexGetSessionRequest : AWSRequest


/**
 <p>The alias in use for the bot that contains the session data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>The name of the bot that contains the session data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>A string used to filter the intents returned in the <code>recentIntentSummaryView</code> structure. </p><p>When you specify a filter, only intents with their <code>checkpointLabel</code> field set to that string are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkpointLabelFilter;

/**
 <p>The ID of the client application user. Amazon Lex uses this to identify a user's conversation with your bot. </p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSLexGetSessionResponse : AWSModel


/**
 <p>Describes the current state of the bot.</p>
 */
@property (nonatomic, strong) AWSLexDialogAction * _Nullable dialogAction;

/**
 <p>An array of information about the intents used in the session. The array can contain a maximum of three summaries. If more than three intents are used in the session, the <code>recentIntentSummaryView</code> operation contains information about the last three intents used.</p><p>If you set the <code>checkpointLabelFilter</code> parameter in the request, the array contains only the intents with the specified label.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexIntentSummary *> * _Nullable recentIntentSummaryView;

/**
 <p>Map of key/value pairs representing the session-specific context information. It contains application information passed between Amazon Lex and a client application.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>A unique identifier for the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

@end

/**
 <p>Provides information about the state of an intent. You can use this information to get the current state of an intent so that you can process the intent, or so that you can return the intent to its previous state.</p>
 Required parameters: [dialogActionType]
 */
@interface AWSLexIntentSummary : AWSModel


/**
 <p>A user-defined label that identifies a particular intent. You can use this label to return to a previous intent. </p><p>Use the <code>checkpointLabelFilter</code> parameter of the <code>GetSessionRequest</code> operation to filter the intents returned by the operation to those with only the specified label.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkpointLabel;

/**
 <p>The status of the intent after the user responds to the confirmation prompt. If the user confirms the intent, Amazon Lex sets this field to <code>Confirmed</code>. If the user denies the intent, Amazon Lex sets this value to <code>Denied</code>. The possible values are:</p><ul><li><p><code>Confirmed</code> - The user has responded "Yes" to the confirmation prompt, confirming that the intent is complete and that it is ready to be fulfilled.</p></li><li><p><code>Denied</code> - The user has responded "No" to the confirmation prompt.</p></li><li><p><code>None</code> - The user has never been prompted for confirmation; or, the user was prompted but did not confirm or deny the prompt.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexConfirmationStatus confirmationStatus;

/**
 <p>The next action that the bot should take in its interaction with the user. The possible values are:</p><ul><li><p><code>ConfirmIntent</code> - The next action is asking the user if the intent is complete and ready to be fulfilled. This is a yes/no question such as "Place the order?"</p></li><li><p><code>Close</code> - Indicates that the there will not be a response from the user. For example, the statement "Your order has been placed" does not require a response.</p></li><li><p><code>ElicitIntent</code> - The next action is to determine the intent that the user wants to fulfill.</p></li><li><p><code>ElicitSlot</code> - The next action is to elicit a slot value from the user.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexDialogActionType dialogActionType;

/**
 <p>The fulfillment state of the intent. The possible values are:</p><ul><li><p><code>Failed</code> - The Lambda function associated with the intent failed to fulfill the intent.</p></li><li><p><code>Fulfilled</code> - The intent has fulfilled by the Lambda function associated with the intent. </p></li><li><p><code>ReadyForFulfillment</code> - All of the information necessary for the intent is present and the intent ready to be fulfilled by the client application.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexFulfillmentState fulfillmentState;

/**
 <p>The name of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable intentName;

/**
 <p>The next slot to elicit from the user. If there is not slot to elicit, the field is blank.</p>
 */
@property (nonatomic, strong) NSString * _Nullable slotToElicit;

/**
 <p>Map of the slots that have been gathered and their values. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable slots;

@end

/**
 
 */
@interface AWSLexPostContentRequest : AWSRequest


/**
 <p> You pass this value as the <code>Accept</code> HTTP header. </p><p> The message Amazon Lex returns in the response can be either text or speech based on the <code>Accept</code> HTTP header value in the request. </p><ul><li><p> If the value is <code>text/plain; charset=utf-8</code>, Amazon Lex returns text in the response. </p></li><li><p> If the value begins with <code>audio/</code>, Amazon Lex returns speech in the response. Amazon Lex uses Amazon Polly to generate the speech (using the configuration you specified in the <code>Accept</code> header). For example, if you specify <code>audio/mpeg</code> as the value, Amazon Lex returns speech in the MPEG format.</p></li><li><p>If the value is <code>audio/pcm</code>, the speech returned is <code>audio/pcm</code> in 16-bit, little endian format. </p></li><li><p>The following are the accepted values:</p><ul><li><p>audio/mpeg</p></li><li><p>audio/ogg</p></li><li><p>audio/pcm</p></li><li><p>text/plain; charset=utf-8</p></li><li><p>audio/* (defaults to mpeg)</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable accept;

/**
 <p>Alias of the Amazon Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>Name of the Amazon Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p> You pass this value as the <code>Content-Type</code> HTTP header. </p><p> Indicates the audio format or text. The header value must start with one of the following prefixes: </p><ul><li><p>PCM format, audio data must be in little-endian byte order.</p><ul><li><p>audio/l16; rate=16000; channels=1</p></li><li><p>audio/x-l16; sample-rate=16000; channel-count=1</p></li><li><p>audio/lpcm; sample-rate=8000; sample-size-bits=16; channel-count=1; is-big-endian=false </p></li></ul></li><li><p>Opus format</p><ul><li><p>audio/x-cbr-opus-with-preamble; preamble-size=0; bit-rate=256000; frame-size-milliseconds=4</p></li></ul></li><li><p>Text format</p><ul><li><p>text/plain; charset=utf-8</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p> User input in PCM or Opus audio format or text format as described in the <code>Content-Type</code> HTTP header. </p><p>You can stream audio data to Amazon Lex or you can create a local buffer that captures all of the audio data before sending. In general, you get better performance if you stream audio data rather than buffering the data locally.</p>
 */
@property (nonatomic, strong) NSInputStream * _Nullable inputStream;

/**
 <p>You pass this value as the <code>x-amz-lex-request-attributes</code> HTTP header.</p><p>Request-specific information passed between Amazon Lex and a client application. The value must be a JSON serialized and base64 encoded map with string keys and values. The total size of the <code>requestAttributes</code> and <code>sessionAttributes</code> headers is limited to 12 KB.</p><p>The namespace <code>x-amz-lex:</code> is reserved for special attributes. Don't create any request attributes with the prefix <code>x-amz-lex:</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-request-attribs">Setting Request Attributes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestAttributes;

/**
 <p>You pass this value as the <code>x-amz-lex-session-attributes</code> HTTP header.</p><p>Application-specific information passed between Amazon Lex and a client application. The value must be a JSON serialized and base64 encoded map with string keys and values. The total size of the <code>sessionAttributes</code> and <code>requestAttributes</code> headers is limited to 12 KB.</p><p>For more information, see <a href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-session-attribs">Setting Session Attributes</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>The ID of the client application user. Amazon Lex uses this to identify a user's conversation with your bot. At runtime, each request must contain the <code>userID</code> field.</p><p>To decide the user ID to use for your application, consider the following factors.</p><ul><li><p>The <code>userID</code> field must not contain any personally identifiable information of the user, for example, name, personal identification numbers, or other end user personal information.</p></li><li><p>If you want a user to start a conversation on one device and continue on another device, use a user-specific identifier.</p></li><li><p>If you want the same user to be able to have two independent conversations on two different devices, choose a device-specific identifier.</p></li><li><p>A user can't have two independent conversations with two different versions of the same bot. For example, a user can't have a conversation with the PROD and BETA versions of the same bot. If you anticipate that a user will need to have conversation with two different versions, for example, while testing, include the bot alias in the user ID to separate the two conversations.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSLexPostContentResponse : AWSModel


/**
 <p>The prompt (or statement) to convey to the user. This is based on the bot configuration and context. For example, if Amazon Lex did not understand the user intent, it sends the <code>clarificationPrompt</code> configured for the bot. If the intent requires confirmation before taking the fulfillment action, it sends the <code>confirmationPrompt</code>. Another example: Suppose that the Lambda function successfully fulfilled the intent, and sent a message to convey to the user. Then Amazon Lex sends that message in the response. </p>
 */
@property (nonatomic, strong) NSData * _Nullable audioStream;

/**
 <p>Content type as specified in the <code>Accept</code> HTTP header in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Identifies the current state of the user interaction. Amazon Lex returns one of the following values as <code>dialogState</code>. The client can optionally use this information to customize the user interface. </p><ul><li><p><code>ElicitIntent</code> - Amazon Lex wants to elicit the user's intent. Consider the following examples: </p><p> For example, a user might utter an intent ("I want to order a pizza"). If Amazon Lex cannot infer the user intent from this utterance, it will return this dialog state. </p></li><li><p><code>ConfirmIntent</code> - Amazon Lex is expecting a "yes" or "no" response. </p><p>For example, Amazon Lex wants user confirmation before fulfilling an intent. Instead of a simple "yes" or "no" response, a user might respond with additional information. For example, "yes, but make it a thick crust pizza" or "no, I want to order a drink." Amazon Lex can process such additional information (in these examples, update the crust type slot or change the intent from OrderPizza to OrderDrink). </p></li><li><p><code>ElicitSlot</code> - Amazon Lex is expecting the value of a slot for the current intent. </p><p> For example, suppose that in the response Amazon Lex sends this message: "What size pizza would you like?". A user might reply with the slot value (e.g., "medium"). The user might also provide additional information in the response (e.g., "medium thick crust pizza"). Amazon Lex can process such additional information appropriately. </p></li><li><p><code>Fulfilled</code> - Conveys that the Lambda function has successfully fulfilled the intent. </p></li><li><p><code>ReadyForFulfillment</code> - Conveys that the client has to fulfill the request. </p></li><li><p><code>Failed</code> - Conveys that the conversation with the user failed. </p><p> This can happen for various reasons, including that the user does not provide an appropriate response to prompts from the service (you can configure how many times Amazon Lex can prompt a user for specific information), or if the Lambda function fails to fulfill the intent. </p></li></ul>
 */
@property (nonatomic, assign) AWSLexDialogState dialogState;

/**
 <p>The text used to process the request.</p><p>If the input was an audio stream, the <code>inputTranscript</code> field contains the text extracted from the audio stream. This is the text that is actually processed to recognize intents and slot values. You can use this information to determine if Amazon Lex is correctly processing the audio that you send.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputTranscript;

/**
 <p>Current user intent that Amazon Lex is aware of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable intentName;

/**
 <p>The message to convey to the user. The message can come from the bot's configuration or from a Lambda function.</p><p>If the intent is not configured with a Lambda function, or if the Lambda function returned <code>Delegate</code> as the <code>dialogAction.type</code> in its response, Amazon Lex decides on the next course of action and selects an appropriate message from the bot's configuration based on the current interaction context. For example, if Amazon Lex isn't able to understand user input, it uses a clarification prompt message.</p><p>When you create an intent you can assign messages to groups. When messages are assigned to groups Amazon Lex returns one message from each group in the response. The message field is an escaped JSON string containing the messages. For more information about the structure of the JSON string returned, see <a>msg-prompts-formats</a>.</p><p>If the Lambda function returns a message, Amazon Lex passes it to the client in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The format of the response message. One of the following values:</p><ul><li><p><code>PlainText</code> - The message contains plain UTF-8 text.</p></li><li><p><code>CustomPayload</code> - The message is a custom format for the client.</p></li><li><p><code>SSML</code> - The message contains text formatted for voice output.</p></li><li><p><code>Composite</code> - The message contains an escaped JSON object containing one or more messages from the groups that messages were assigned to when the intent was created.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexMessageFormatType messageFormat;

/**
 <p>The sentiment expressed in and utterance.</p><p>When the bot is configured to send utterances to Amazon Comprehend for sentiment analysis, this field contains the result of the analysis.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sentimentResponse;

/**
 <p> Map of key/value pairs representing the session-specific context information. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>The unique identifier for the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

/**
 <p> If the <code>dialogState</code> value is <code>ElicitSlot</code>, returns the name of the slot for which Amazon Lex is eliciting a value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable slotToElicit;

/**
 <p>Map of zero or more intent slots (name/value pairs) Amazon Lex detected from the user input during the conversation. The field is base-64 encoded.</p><p>Amazon Lex creates a resolution list containing likely values for a slot. The value that it returns is determined by the <code>valueSelectionStrategy</code> selected when the slot type was created or updated. If <code>valueSelectionStrategy</code> is set to <code>ORIGINAL_VALUE</code>, the value provided by the user is returned, if the user value is similar to the slot values. If <code>valueSelectionStrategy</code> is set to <code>TOP_RESOLUTION</code> Amazon Lex returns the first value in the resolution list or, if there is no resolution list, null. If you don't specify a <code>valueSelectionStrategy</code>, the default is <code>ORIGINAL_VALUE</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable slots;

@end

/**
 
 */
@interface AWSLexPostTextRequest : AWSRequest


/**
 <p>The alias of the Amazon Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>The name of the Amazon Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The text that the user entered (Amazon Lex interprets this text).</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputText;

/**
 <p>Request-specific information passed between Amazon Lex and a client application.</p><p>The namespace <code>x-amz-lex:</code> is reserved for special attributes. Don't create any request attributes with the prefix <code>x-amz-lex:</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-request-attribs">Setting Request Attributes</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestAttributes;

/**
 <p>Application-specific information passed between Amazon Lex and a client application.</p><p>For more information, see <a href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-session-attribs">Setting Session Attributes</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>The ID of the client application user. Amazon Lex uses this to identify a user's conversation with your bot. At runtime, each request must contain the <code>userID</code> field.</p><p>To decide the user ID to use for your application, consider the following factors.</p><ul><li><p>The <code>userID</code> field must not contain any personally identifiable information of the user, for example, name, personal identification numbers, or other end user personal information.</p></li><li><p>If you want a user to start a conversation on one device and continue on another device, use a user-specific identifier.</p></li><li><p>If you want the same user to be able to have two independent conversations on two different devices, choose a device-specific identifier.</p></li><li><p>A user can't have two independent conversations with two different versions of the same bot. For example, a user can't have a conversation with the PROD and BETA versions of the same bot. If you anticipate that a user will need to have conversation with two different versions, for example, while testing, include the bot alias in the user ID to separate the two conversations.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSLexPostTextResponse : AWSModel


/**
 <p> Identifies the current state of the user interaction. Amazon Lex returns one of the following values as <code>dialogState</code>. The client can optionally use this information to customize the user interface. </p><ul><li><p><code>ElicitIntent</code> - Amazon Lex wants to elicit user intent. </p><p>For example, a user might utter an intent ("I want to order a pizza"). If Amazon Lex cannot infer the user intent from this utterance, it will return this dialogState.</p></li><li><p><code>ConfirmIntent</code> - Amazon Lex is expecting a "yes" or "no" response. </p><p> For example, Amazon Lex wants user confirmation before fulfilling an intent. </p><p>Instead of a simple "yes" or "no," a user might respond with additional information. For example, "yes, but make it thick crust pizza" or "no, I want to order a drink". Amazon Lex can process such additional information (in these examples, update the crust type slot value, or change intent from OrderPizza to OrderDrink).</p></li><li><p><code>ElicitSlot</code> - Amazon Lex is expecting a slot value for the current intent. </p><p>For example, suppose that in the response Amazon Lex sends this message: "What size pizza would you like?". A user might reply with the slot value (e.g., "medium"). The user might also provide additional information in the response (e.g., "medium thick crust pizza"). Amazon Lex can process such additional information appropriately. </p></li><li><p><code>Fulfilled</code> - Conveys that the Lambda function configured for the intent has successfully fulfilled the intent. </p></li><li><p><code>ReadyForFulfillment</code> - Conveys that the client has to fulfill the intent. </p></li><li><p><code>Failed</code> - Conveys that the conversation with the user failed. </p><p> This can happen for various reasons including that the user did not provide an appropriate response to prompts from the service (you can configure how many times Amazon Lex can prompt a user for specific information), or the Lambda function failed to fulfill the intent. </p></li></ul>
 */
@property (nonatomic, assign) AWSLexDialogState dialogState;

/**
 <p>The current user intent that Amazon Lex is aware of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable intentName;

/**
 <p>The message to convey to the user. The message can come from the bot's configuration or from a Lambda function.</p><p>If the intent is not configured with a Lambda function, or if the Lambda function returned <code>Delegate</code> as the <code>dialogAction.type</code> its response, Amazon Lex decides on the next course of action and selects an appropriate message from the bot's configuration based on the current interaction context. For example, if Amazon Lex isn't able to understand user input, it uses a clarification prompt message.</p><p>When you create an intent you can assign messages to groups. When messages are assigned to groups Amazon Lex returns one message from each group in the response. The message field is an escaped JSON string containing the messages. For more information about the structure of the JSON string returned, see <a>msg-prompts-formats</a>.</p><p>If the Lambda function returns a message, Amazon Lex passes it to the client in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The format of the response message. One of the following values:</p><ul><li><p><code>PlainText</code> - The message contains plain UTF-8 text.</p></li><li><p><code>CustomPayload</code> - The message is a custom format defined by the Lambda function.</p></li><li><p><code>SSML</code> - The message contains text formatted for voice output.</p></li><li><p><code>Composite</code> - The message contains an escaped JSON object containing one or more messages from the groups that messages were assigned to when the intent was created.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexMessageFormatType messageFormat;

/**
 <p>Represents the options that the user has to respond to the current prompt. Response Card can come from the bot configuration (in the Amazon Lex console, choose the settings button next to a slot) or from a code hook (Lambda function). </p>
 */
@property (nonatomic, strong) AWSLexResponseCard * _Nullable responseCard;

/**
 <p>The sentiment expressed in and utterance.</p><p>When the bot is configured to send utterances to Amazon Comprehend for sentiment analysis, this field contains the result of the analysis.</p>
 */
@property (nonatomic, strong) AWSLexSentimentResponse * _Nullable sentimentResponse;

/**
 <p>A map of key-value pairs representing the session-specific context information.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>A unique identifier for the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

/**
 <p>If the <code>dialogState</code> value is <code>ElicitSlot</code>, returns the name of the slot for which Amazon Lex is eliciting a value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable slotToElicit;

/**
 <p> The intent slots that Amazon Lex detected from the user input in the conversation. </p><p>Amazon Lex creates a resolution list containing likely values for a slot. The value that it returns is determined by the <code>valueSelectionStrategy</code> selected when the slot type was created or updated. If <code>valueSelectionStrategy</code> is set to <code>ORIGINAL_VALUE</code>, the value provided by the user is returned, if the user value is similar to the slot values. If <code>valueSelectionStrategy</code> is set to <code>TOP_RESOLUTION</code> Amazon Lex returns the first value in the resolution list or, if there is no resolution list, null. If you don't specify a <code>valueSelectionStrategy</code>, the default is <code>ORIGINAL_VALUE</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable slots;

@end

/**
 
 */
@interface AWSLexPutSessionRequest : AWSRequest


/**
 <p>The message that Amazon Lex returns in the response can be either text or speech based depending on the value of this field.</p><ul><li><p>If the value is <code>text/plain; charset=utf-8</code>, Amazon Lex returns text in the response.</p></li><li><p>If the value begins with <code>audio/</code>, Amazon Lex returns speech in the response. Amazon Lex uses Amazon Polly to generate the speech in the configuration that you specify. For example, if you specify <code>audio/mpeg</code> as the value, Amazon Lex returns speech in the MPEG format.</p></li><li><p>If the value is <code>audio/pcm</code>, the speech is returned as <code>audio/pcm</code> in 16-bit, little endian format.</p></li><li><p>The following are the accepted values:</p><ul><li><p><code>audio/mpeg</code></p></li><li><p><code>audio/ogg</code></p></li><li><p><code>audio/pcm</code></p></li><li><p><code>audio/*</code> (defaults to mpeg)</p></li><li><p><code>text/plain; charset=utf-8</code></p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable accept;

/**
 <p>The alias in use for the bot that contains the session data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>The name of the bot that contains the session data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>Sets the next action that the bot should take to fulfill the conversation.</p>
 */
@property (nonatomic, strong) AWSLexDialogAction * _Nullable dialogAction;

/**
 <p>A summary of the recent intents for the bot. You can use the intent summary view to set a checkpoint label on an intent and modify attributes of intents. You can also use it to remove or add intent summary objects to the list.</p><p>An intent that you modify or add to the list must make sense for the bot. For example, the intent name must be valid for the bot. You must provide valid values for:</p><ul><li><p><code>intentName</code></p></li><li><p>slot names</p></li><li><p><code>slotToElict</code></p></li></ul><p>If you send the <code>recentIntentSummaryView</code> parameter in a <code>PutSession</code> request, the contents of the new summary view replaces the old summary view. For example, if a <code>GetSession</code> request returns three intents in the summary view and you call <code>PutSession</code> with one intent in the summary view, the next call to <code>GetSession</code> will only return one intent.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexIntentSummary *> * _Nullable recentIntentSummaryView;

/**
 <p>Map of key/value pairs representing the session-specific context information. It contains application information passed between Amazon Lex and a client application.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>The ID of the client application user. Amazon Lex uses this to identify a user's conversation with your bot. </p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSLexPutSessionResponse : AWSModel


/**
 <p>The audio version of the message to convey to the user.</p>
 */
@property (nonatomic, strong) NSData * _Nullable audioStream;

/**
 <p>Content type as specified in the <code>Accept</code> HTTP header in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p/><ul><li><p><code>ConfirmIntent</code> - Amazon Lex is expecting a "yes" or "no" response to confirm the intent before fulfilling an intent.</p></li><li><p><code>ElicitIntent</code> - Amazon Lex wants to elicit the user's intent.</p></li><li><p><code>ElicitSlot</code> - Amazon Lex is expecting the value of a slot for the current intent.</p></li><li><p><code>Failed</code> - Conveys that the conversation with the user has failed. This can happen for various reasons, including the user does not provide an appropriate response to prompts from the service, or if the Lambda function fails to fulfill the intent.</p></li><li><p><code>Fulfilled</code> - Conveys that the Lambda function has sucessfully fulfilled the intent.</p></li><li><p><code>ReadyForFulfillment</code> - Conveys that the client has to fulfill the intent.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexDialogState dialogState;

/**
 <p>The name of the current intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable intentName;

/**
 <p>The next message that should be presented to the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The format of the response message. One of the following values:</p><ul><li><p><code>PlainText</code> - The message contains plain UTF-8 text.</p></li><li><p><code>CustomPayload</code> - The message is a custom format for the client.</p></li><li><p><code>SSML</code> - The message contains text formatted for voice output.</p></li><li><p><code>Composite</code> - The message contains an escaped JSON object containing one or more messages from the groups that messages were assigned to when the intent was created.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexMessageFormatType messageFormat;

/**
 <p>Map of key/value pairs representing session-specific context information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionAttributes;

/**
 <p>A unique identifier for the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

/**
 <p>If the <code>dialogState</code> is <code>ElicitSlot</code>, returns the name of the slot for which Amazon Lex is eliciting a value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable slotToElicit;

/**
 <p>Map of zero or more intent slots Amazon Lex detected from the user input during the conversation.</p><p>Amazon Lex creates a resolution list containing likely values for a slot. The value that it returns is determined by the <code>valueSelectionStrategy</code> selected when the slot type was created or updated. If <code>valueSelectionStrategy</code> is set to <code>ORIGINAL_VALUE</code>, the value provided by the user is returned, if the user value is similar to the slot values. If <code>valueSelectionStrategy</code> is set to <code>TOP_RESOLUTION</code> Amazon Lex returns the first value in the resolution list or, if there is no resolution list, null. If you don't specify a <code>valueSelectionStrategy</code> the default is <code>ORIGINAL_VALUE</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable slots;

@end

/**
 <p>If you configure a response card when creating your bots, Amazon Lex substitutes the session attributes and slot values that are available, and then returns it. The response card can also come from a Lambda function ( <code>dialogCodeHook</code> and <code>fulfillmentActivity</code> on an intent).</p>
 */
@interface AWSLexResponseCard : AWSModel


/**
 <p>The content type of the response.</p>
 */
@property (nonatomic, assign) AWSLexContentType contentType;

/**
 <p>An array of attachment objects representing options.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexGenericAttachment *> * _Nullable genericAttachments;

/**
 <p>The version of the response card format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>The sentiment expressed in an utterance.</p><p>When the bot is configured to send utterances to Amazon Comprehend for sentiment analysis, this field structure contains the result of the analysis.</p>
 */
@interface AWSLexSentimentResponse : AWSModel


/**
 <p>The inferred sentiment that Amazon Comprehend has the highest confidence in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sentimentLabel;

/**
 <p>The likelihood that the sentiment was correctly inferred.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sentimentScore;

@end

NS_ASSUME_NONNULL_END
