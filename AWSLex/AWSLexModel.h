//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

typedef NS_ENUM(NSInteger, AWSLexContentType) {
    AWSLexContentTypeUnknown,
    AWSLexContentTypeApplicationVndAmazonawsCardGeneric,
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

@class AWSLexButton;
@class AWSLexGenericAttachment;
@class AWSLexPostContentRequest;
@class AWSLexPostContentResponse;
@class AWSLexPostTextRequest;
@class AWSLexPostTextResponse;
@class AWSLexResponseCard;

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
@interface AWSLexPostContentRequest : AWSRequest


/**
 <p> You pass this value as the <code>Accept</code> HTTP header. </p><p> The message Amazon Lex returns in the response can be either text or speech based on the <code>Accept</code> HTTP header value in the request. </p><ul><li><p> If the value is <code>text/plain; charset=utf-8</code>, Amazon Lex returns text in the response. </p></li><li><p> If the value begins with <code>audio/</code>, Amazon Lex returns speech in the response. Amazon Lex uses Amazon Polly to generate the speech (using the configuration you specified in the <code>Accept</code> header). For example, if you specify <code>audio/mpeg</code> as the value, Amazon Lex returns speech in the MPEG format.</p><p>The following are the accepted values:</p><ul><li><p>audio/mpeg</p></li><li><p>audio/ogg</p></li><li><p>audio/pcm</p></li><li><p>text/plain; charset=utf-8</p></li><li><p>audio/* (defaults to mpeg)</p></li></ul></li></ul>
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
 <p> You pass this values as the <code>Content-Type</code> HTTP header. </p><p> Indicates the audio format or text. The header value must start with one of the following prefixes: </p><ul><li><p>PCM format</p><ul><li><p>audio/l16; rate=16000; channels=1</p></li><li><p>audio/x-l16; sample-rate=16000; channel-count=1</p></li></ul></li><li><p>Opus format</p><ul><li><p>audio/x-cbr-opus-with-preamble; preamble-size=0; bit-rate=1; frame-size-milliseconds=1.1</p></li></ul></li><li><p>Text format</p><ul><li><p>text/plain; charset=utf-8</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p> User input in PCM or Opus audio format or text format as described in the <code>Content-Type</code> HTTP header. </p>
 */
@property (nonatomic, strong) NSInputStream * _Nullable inputStream;

/**
 <p>You pass this value in the <code>x-amz-lex-session-attributes</code> HTTP header. The value must be map (keys and values must be strings) that is JSON serialized and then base64 encoded.</p><p> A session represents dialog between a user and Amazon Lex. At runtime, a client application can pass contextual information, in the request to Amazon Lex. For example, </p><ul><li><p>You might use session attributes to track the requestID of user requests.</p></li><li><p>In Getting Started Exercise 1, the example bot uses the price session attribute to maintain the price of flowers ordered (for example, "price":25). The code hook (Lambda function) sets this attribute based on the type of flowers ordered. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/gs-bp-details-after-lambda.html">Review the Details of Information Flow</a>. </p></li><li><p>In the BookTrip bot exercise, the bot uses the <code>currentReservation</code> session attribute to maintains the slot data during the in-progress conversation to book a hotel or book a car. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/book-trip-detail-flow.html">Details of Information Flow</a>. </p></li></ul><p> Amazon Lex passes these session attributes to the Lambda functions configured for the intent In the your Lambda function, you can use the session attributes for initialization and customization (prompts). Some examples are: </p><ul><li><p> Initialization - In a pizza ordering bot, if you pass user location (for example, <code>"Location : 111 Maple Street"</code>), then your Lambda function might use this information to determine the closest pizzeria to place the order (and perhaps set the storeAddress slot value as well). </p><p> Personalized prompts - For example, you can configure prompts to refer to the user by name (for example, "Hey [firstName], what toppings would you like?"). You can pass the user's name as a session attribute ("firstName": "Joe") so that Amazon Lex can substitute the placeholder to provide a personalized prompt to the user ("Hey Joe, what toppings would you like?"). </p></li></ul><note><p> Amazon Lex does not persist session attributes. </p><p> If you configured a code hook for the intent, Amazon Lex passes the incoming session attributes to the Lambda function. The Lambda function must return these session attributes if you want Amazon Lex to return them to the client. </p><p> If there is no code hook configured for the intent Amazon Lex simply returns the session attributes to the client application. </p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>ID of the client application user. Typically, each of your application users should have a unique ID. The application developer decides the user IDs. At runtime, each request must include the user ID. Note the following considerations:</p><ul><li><p> If you want a user to start conversation on one device and continue the conversation on another device, you might choose a user-specific identifier, such as the user's login, or Amazon Cognito user ID (assuming your application is using Amazon Cognito). </p></li><li><p> If you want the same user to be able to have two independent conversations on two different devices, you might choose device-specific identifier, such as device ID, or some globally unique identifier. </p></li></ul>
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
 <p>Identifies the current state of the user interaction. Amazon Lex returns one of the following values as <code>dialogState</code>. The client can optionally use this information to customize the user interface. </p><ul><li><p><code>ElicitIntent</code> – Amazon Lex wants to elicit the user's intent. Consider the following examples: </p><p> For example, a user might utter an intent ("I want to order a pizza"). If Amazon Lex cannot infer the user intent from this utterance, it will return this dialog state. </p></li><li><p><code>ConfirmIntent</code> – Amazon Lex is expecting a "yes" or "no" response. </p><p>For example, Amazon Lex wants user confirmation before fulfilling an intent. Instead of a simple "yes" or "no" response, a user might respond with additional information. For example, "yes, but make it a thick crust pizza" or "no, I want to order a drink." Amazon Lex can process such additional information (in these examples, update the crust type slot or change the intent from OrderPizza to OrderDrink). </p></li><li><p><code>ElicitSlot</code> – Amazon Lex is expecting the value of a slot for the current intent. </p><p> For example, suppose that in the response Amazon Lex sends this message: "What size pizza would you like?". A user might reply with the slot value (e.g., "medium"). The user might also provide additional information in the response (e.g., "medium thick crust pizza"). Amazon Lex can process such additional information appropriately. </p></li><li><p><code>Fulfilled</code> – Conveys that the Lambda function has successfully fulfilled the intent. </p></li><li><p><code>ReadyForFulfillment</code> – Conveys that the client has to fullfill the request. </p></li><li><p><code>Failed</code> – Conveys that the conversation with the user failed. </p><p> This can happen for various reasons, including that the user does not provide an appropriate response to prompts from the service (you can configure how many times Amazon Lex can prompt a user for specific information), or if the Lambda function fails to fulfill the intent. </p></li></ul>
 */
@property (nonatomic, assign) AWSLexDialogState dialogState;

/**
 <p>Transcript of the voice input to the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputTranscript;

/**
 <p>Current user intent that Amazon Lex is aware of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable intentName;

/**
 <p> Message to convey to the user. It can come from the bot's configuration or a code hook (Lambda function). If the current intent is not configured with a code hook or if the code hook returned <code>Delegate</code> as the <code>dialogAction.type</code> in its response, then Amazon Lex decides the next course of action and selects an appropriate message from the bot configuration based on the current user interaction context. For example, if Amazon Lex is not able to understand the user input, it uses a clarification prompt message (For more information, see the Error Handling section in the Amazon Lex console). Another example: if the intent requires confirmation before fulfillment, then Amazon Lex uses the confirmation prompt message in the intent configuration. If the code hook returns a message, Amazon Lex passes it as-is in its response to the client. </p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p> Map of key/value pairs representing the session-specific context information. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p> If the <code>dialogState</code> value is <code>ElicitSlot</code>, returns the name of the slot for which Amazon Lex is eliciting a value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable slotToElicit;

/**
 <p>Map of zero or more intent slots (name/value pairs) Amazon Lex detected from the user input during the conversation.</p>
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
 <p> By using session attributes, a client application can pass contextual information in the request to Amazon Lex For example, </p><ul><li><p>In Getting Started Exercise 1, the example bot uses the <code>price</code> session attribute to maintain the price of the flowers ordered (for example, "Price":25). The code hook (the Lambda function) sets this attribute based on the type of flowers ordered. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/gs-bp-details-after-lambda.html">Review the Details of Information Flow</a>. </p></li><li><p>In the BookTrip bot exercise, the bot uses the <code>currentReservation</code> session attribute to maintain slot data during the in-progress conversation to book a hotel or book a car. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/book-trip-detail-flow.html">Details of Information Flow</a>. </p></li><li><p>You might use the session attributes (key, value pairs) to track the requestID of user requests.</p></li></ul><p> Amazon Lex simply passes these session attributes to the Lambda functions configured for the intent.</p><p>In your Lambda function, you can also use the session attributes for initialization and customization (prompts and response cards). Some examples are:</p><ul><li><p> Initialization - In a pizza ordering bot, if you can pass the user location as a session attribute (for example, <code>"Location" : "111 Maple street"</code>), then your Lambda function might use this information to determine the closest pizzeria to place the order (perhaps to set the storeAddress slot value). </p></li><li><p> Personalize prompts - For example, you can configure prompts to refer to the user name. (For example, "Hey [FirstName], what toppings would you like?"). You can pass the user name as a session attribute (<code>"FirstName" : "Joe"</code>) so that Amazon Lex can substitute the placeholder to provide a personalize prompt to the user ("Hey Joe, what toppings would you like?"). </p></li></ul><note><p> Amazon Lex does not persist session attributes. </p><p> If you configure a code hook for the intent, Amazon Lex passes the incoming session attributes to the Lambda function. If you want Amazon Lex to return these session attributes back to the client, the Lambda function must return them. </p><p> If there is no code hook configured for the intent, Amazon Lex simply returns the session attributes back to the client application. </p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>The ID of the client application user. The application developer decides the user IDs. At runtime, each request must include the user ID. Typically, each of your application users should have a unique ID. Note the following considerations: </p><ul><li><p> If you want a user to start a conversation on one device and continue the conversation on another device, you might choose a user-specific identifier, such as a login or Amazon Cognito user ID (assuming your application is using Amazon Cognito). </p></li><li><p> If you want the same user to be able to have two independent conversations on two different devices, you might choose a device-specific identifier, such as device ID, or some globally unique identifier. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSLexPostTextResponse : AWSModel


/**
 <p> Identifies the current state of the user interaction. Amazon Lex returns one of the following values as <code>dialogState</code>. The client can optionally use this information to customize the user interface. </p><ul><li><p><code>ElicitIntent</code> – Amazon Lex wants to elicit user intent. </p><p>For example, a user might utter an intent ("I want to order a pizza"). If Amazon Lex cannot infer the user intent from this utterance, it will return this dialogState.</p></li><li><p><code>ConfirmIntent</code> – Amazon Lex is expecting a "yes" or "no" response. </p><p> For example, Amazon Lex wants user confirmation before fulfilling an intent. </p><p>Instead of a simple "yes" or "no," a user might respond with additional information. For example, "yes, but make it thick crust pizza" or "no, I want to order a drink". Amazon Lex can process such additional information (in these examples, update the crust type slot value, or change intent from OrderPizza to OrderDrink).</p></li><li><p><code>ElicitSlot</code> – Amazon Lex is expecting a slot value for the current intent. </p><p>For example, suppose that in the response Amazon Lex sends this message: "What size pizza would you like?". A user might reply with the slot value (e.g., "medium"). The user might also provide additional information in the response (e.g., "medium thick crust pizza"). Amazon Lex can process such additional information appropriately. </p></li><li><p><code>Fulfilled</code> – Conveys that the Lambda function configured for the intent has successfully fulfilled the intent. </p></li><li><p><code>ReadyForFulfillment</code> – Conveys that the client has to fulfill the intent. </p></li><li><p><code>Failed</code> – Conveys that the conversation with the user failed. </p><p> This can happen for various reasons including that the user did not provide an appropriate response to prompts from the service (you can configure how many times Amazon Lex can prompt a user for specific information), or the Lambda function failed to fulfill the intent. </p></li></ul>
 */
@property (nonatomic, assign) AWSLexDialogState dialogState;

/**
 <p>The current user intent that Amazon Lex is aware of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable intentName;

/**
 <p> A message to convey to the user. It can come from the bot's configuration or a code hook (Lambda function). If the current intent is not configured with a code hook or the code hook returned <code>Delegate</code> as the <code>dialogAction.type</code> in its response, then Amazon Lex decides the next course of action and selects an appropriate message from the bot configuration based on the current user interaction context. For example, if Amazon Lex is not able to understand the user input, it uses a clarification prompt message (for more information, see the Error Handling section in the Amazon Lex console). Another example: if the intent requires confirmation before fulfillment, then Amazon Lex uses the confirmation prompt message in the intent configuration. If the code hook returns a message, Amazon Lex passes it as-is in its response to the client. </p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Represents the options that the user has to respond to the current prompt. Response Card can come from the bot configuration (in the Amazon Lex console, choose the settings button next to a slot) or from a code hook (Lambda function). </p>
 */
@property (nonatomic, strong) AWSLexResponseCard * _Nullable responseCard;

/**
 <p>A map of key-value pairs representing the session-specific context information.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>If the <code>dialogState</code> value is <code>ElicitSlot</code>, returns the name of the slot for which Amazon Lex is eliciting a value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable slotToElicit;

/**
 <p> The intent slots (name/value pairs) that Amazon Lex detected so far from the user input in the conversation. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable slots;

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

NS_ASSUME_NONNULL_END
