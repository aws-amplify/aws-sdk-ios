//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 <p>Text visible to the user on the button.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>Value sent to Amazon Lex when user clicks the button. For exmaple, consider button text "NYC". When user clicks the button, the value sent can be "New York City".</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Represents an option rendered to the user when a prompt is shown. It could be an image, a button, a link, or text. </p>
 */
@interface AWSLexGenericAttachment : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable attachmentLinkUrl;

/**
 <p>List of options to show to the user.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexButton *> * _Nullable buttons;

/**
 <p>URL of an image that is displayed to the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 <p>Sub title shown below the title.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subTitle;

/**
 <p>Title of the option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 
 */
@interface AWSLexPostContentRequest : AWSRequest


/**
 <p> You pass this value as the <code>Accept</code> HTTP header. </p><p> The message Lex returns in the response can be either text or speech based on the <code>Accept</code> HTTP header value in the request. </p><ul><li><p> If the value is <code>text/plain; charset=utf-8</code>, Lex returns text in the response. </p></li><li><p> If the value begins with <code>audio/</code>, the Lex returns a speech in the response. Lex uses Amazon Polly to generate the speech (using the configuration you specified in the <code>Accept</code> header). For example, if you specify <code>audio/mpeg</code> as the value, Lex returns speech in the MPEG format.</p><p>The following are the accepted values:</p><ul><li><p>audio/mpeg</p></li><li><p>audio/ogg</p></li><li><p>audio/pcm</p></li><li><p>text/plain; charset=utf-8</p></li><li><p>audio/* (defaults to mpeg)</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable accept;

/**
 <p>Alias of the Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>Name of the Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p> You pass this values as the <code>Content-Type</code> HTTP header. </p><p> Indicates the audio format. The header value must start with one of the following prefixes: </p><ul><li><p>audio/l16; rate=16000; channels=1</p></li><li><p>audio/x-l16; sample-rate=16000; channel-count=1</p></li><li><p>text/plain; charset=utf-8</p></li><li><p>audio/x-cbr-opus-with-preamble; preamble-size=0; bit-rate=1; frame-size-milliseconds=1.1</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p> User input, in the format as described in the <code>Content-Type</code> HTTP header. </p>
 */
@property (nonatomic, strong) NSInputStream * _Nullable inputStream;

/**
 <p>You pass this value in the <code>x-amz-deep-sense-session-attributes</code> HTTP header. The value must be map (keys and values must be string) that is JSON serialized and then base64-encoded.</p><p> A session represents dialog between a user and Amazon Lex. At runtime, a client application can pass contextual information (session attributes), in the request. For example, <code>"FirstName" : "Joe"</code>. </p><p> Lex passes these session attributes to the Lambda functions configured for the intent (see <code>dialogCodeHook</code> and <code>fulfillmentActivity.codeHook</code> in ). In the Lambda function code, you can use the session attributes for customization. For example, </p><ul><li><p> In a pizza ordering application, if you pass user location (for example, <code>"Location" : "some location"</code>) as a session attribute, your Lambda function might use this information to determine the closest pizzeria to place the order. </p></li><li><p> You might use session attribute information to personalize prompts. For example, suppose you pass in user name as a session attribute (<code>"FirstName" : "Joe"</code>). You might configure subsequent prompts to refer to this attribute, as <code>$session.FirstName"</code>. At runtime, Lex substitutes a real value in generating a prompt - "Hello Joe, what would you like to order?". </p></li></ul><note><p> Amazon Lex does not persist session attributes. </p><p> If you have not configured a Lambda function to process an intent (that is, you want processing done on on the client), then Lex simply returns the session attributes back to the client application. </p><p> If you configured a Lambda function to process the intent, Lex passes the incoming session attributes to the Lambda function. The Lambda function must return these session attributes if you want Lex to return them back to client. </p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>User ID of your client application. Typically you want each of your application users to have a unique ID. Note the following considerations: </p><ul><li><p> If you want a user to start conversation on one mobile device and continue the conversation on another device, you might choose user-specific identifier, such as login, or Cognito user ID (assuming your application is using Amazon Cognito). </p></li><li><p> If you want the same user to be able to have two independent conversations on two different devices, you might choose device-specific identifier, such as device ID, or some globally unique identifier. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSLexPostContentResponse : AWSModel


/**
 <p>Prompt (or statement) to convey to the user. This is based on the application configuration and context. For example, if Lex did not understand the user intent, it will send the clarificationPrompt configured for the application. If the intent requires confirmation before taking the fulfillment action, it will send the confirmationPrompt. Here is another example, suppose Lambda function successfully fulfilled the intent, and sent a message to convery to the user. Then Lex will send that message in the response. </p>
 */
@property (nonatomic, strong) NSData * _Nullable audioStream;

/**
 <p>Content type as specified in the <code>Accept</code> HTTP header in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Represents the message type to be conveyed to the user. For example, </p><ul><li><p><code>ElicitIntent</code> - Lex wants to elicit user intent. Consider the following examples: </p><ul><li><p>Suppose Lex did not understand the first utterances. For example "I want to order pizza" (indicating OrderPizza intent). But, if Lex did not understand the user's input to determine the intent, the service returns this dialog state. </p></li><li><p> Suppose the intent is configured with a follow up prompt. For example, after the OrderPizza intent is fulfilled, the intent might have a follow up prompt -" Do you want to order a drink or desert?". In this case, Lex returns this dialog state. </p></li></ul></li><li><p><code>ConfirmIntent</code> - Lex is expecting a yes/no response from the user as to whether go ahead and fulfill the intent (for example, ok to go ahead and order the pizza). </p><note><p> In addition to yes/no reply, user might provide respond with additional slot information. It can be a new slot information or change in existing slot value. For example, user might reply - "Yes, but change the crust to thick crust". Amazon Lex can understand the additional information and update the intent slots accordingly. </p><p> Consider another example. Before fulfilling an order, your application might prompt for confirmation - "Ok to place this pizza order?". User might reply - "No, I want to order a drink". In this case, Lex recognizes the new "OrderDrink" intent. </p></note></li><li><p><code>ElicitSlot</code> - Lex is expecting a value of a slot for the current intent. Suppose Lex asks, "What size pizza would you like?". A user might reply - "Medium", or "Medium pepperoni pizza". Lex will recognize the size and the topping as the two separate slot values. </p></li><li><p><code>Fulfilled</code> - Conveys that the Lambda function has successfully fulfilled the intent. If Lambda function returns a statement/message to convey the fulfillment result, Lex will pass this string to the client. If not, Lex looks for <code>conclusionStatement</code> that you configured for the intent. </p><p> If both the Lambda function statement and the <code>conclusionStatement</code> are missing, Lex throws a bad request exception. </p></li><li><p><code>ReadyForFulfillment</code> - Conveys that the client has to do the fulfillment work for the intent (this is the case when the current intent has the <code>fulfillmentActivity </code> configured as <code>ReturnIntent</code>). </p></li><li><p><code>Failed</code> - Conversation with the user failed. Some of the reasons for this dialog state are: After the preconfigured number of attempts user did not provide appropriate response, or Lambda function failed to fulfill an intent. </p></li></ul>
 */
@property (nonatomic, assign) AWSLexDialogState dialogState;

/**
 <p>Name of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable intentName;

/**
 <p> Based on the build-time application configuration, Amazon Lex determines the prompt (or statement) to convey to the user. If your application uses a Lambda function, then it can determine what prompt (or statement) to convey to the user. </p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>JSON serialized and then base64-encoded map of key value pairs representing the session specific context information. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>If <code>dialogState</code> value is <code>ElicitSlot</code>, then this returns the name of the slot for which Lex is eliciting a value. </p>
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
 <p>Alias of the Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>Name of the Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>Text user entered (Lex interprets this text).</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputText;

/**
 <p> A session represents dialog between a user and Amazon Lex. At runtime, a client application can pass contextual information (session attributes), in the request. For example, <code>"FirstName" : "Joe"</code>. Lex passes these session attributes to the Lambda function(s) configured for the intent (see <code>dialogCodeHook</code> and <code>fulfillmentActivity.codeHook</code> in ). </p><p>In your Lambda function, you can use the session attributes for customization. Some examples are:</p><ul><li><p> In a pizza ordering application, if you can pass user location as a session attribute (for example, <code>"Location" : "111 Maple street"</code>), your Lambda function might use this information to determine the closest pizzeria to place the order. </p></li><li><p> Use session attributes to personalize prompts. For example, you pass in user name as a session attribute (<code>"FirstName" : "Joe"</code>), you might configure subsequent prompts to refer to this attribute, as <code>$session.FirstName"</code>. At runtime, Lex will then substitute a real value in generating a prompt - "Hello Joe, what would you like to order?". </p></li></ul><note><p> Amazon Lex does not persist session attributes. </p><p> If the intent is configured without a Lambda function to process the intent (that is, the client application to process the intent), Lex simply returns the session attributes back to the client application. </p><p> If the intent is configured with a Lambda function to process the intent, Lex passes the incoming session attributes to the Lambda function. The Lambda function must return these session attributes if you want Lex to return them back to the client. </p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>User ID of your client application. Typically you want each of your application users to have a unique ID. Note the following considerations: </p><ul><li><p> If you want a user to start conversation on one mobile device and continue the conversation on another device, you might choose user-specific identifier, such as login, or Cognito user ID (assuming your application is using Amazon Cognito). </p></li><li><p> If you want the same user to be able to have two independent conversations on two different devices, you might choose device-specific identifier, such as device ID, or some globally unique identifier. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSLexPostTextResponse : AWSModel


/**
 <p>Represents the message type to be conveyed to the user. For example, </p><ul><li><p><code>ElicitIntent</code> - Lex wants to elicit user intent. For example, Lex did not understand the first utterances such as "I want to order pizza", which indicates the OrderPizza intent. But, if Lex did not understand the intent, it returns this <code>dialogState</code>. Another example is when your intent is configured with a follow up prompt. For example, after OrderPizza intent is fulfilled, the intent might have a follow up prompt -" Do you want to order a drink or desert". In this case, Lex returns this <code>dialogState</code>. </p></li><li><p><code>ConfirmIntent</code> - Lex is expecting a yes/no response from the user as to whether go ahead and fulfill the intent (for example, ok to go ahead and order the pizza). In addition to yes/no reply, user might provide respond with additional slot information (either new slot information or change existing slot values). For example, "Yes, but change to thick crust". Amazon Lex will understand the additional information and update the intent slots accordingly. </p><p> Consider another example. Before fulfilling an order, your application might prompt for confirmation - "Do you want to place this pizza order?". Instead, use might reply - "No, I want to order a drink". Lex recognizes the new intent "OrderDrink" intent. </p></li><li><p><code>ElicitSlot</code> - Lex is expecting a value of a slot for the current intent. For example, suppose Lex asks, "What size pizza would you like?". A user might reply - "Medium pepperoni pizza". Lex will recognize the size and the topping as the two separate slot values. </p></li><li><p><code>Fulfilled</code> - Conveys that the Lambda function has successfully fulfilled the intent. If Lambda function returns a statement/message to convey the fulfillment result, Lex passes this string to the client. If not, Lex looks for <code>conclusionStatement</code> that you configured for the intent. </p><p> If both the Lambda function statement and the <code>conclusionStatement</code> are missing, Lex throws a bad request exception. </p></li><li><p><code>ReadyForFulfillment</code> - conveys that the client has to do the fulfillment work for the intent. This is the case when the current intent is configured with <code>ReturnIntent</code> as the <code>fulfillmentActivity </code>, then Lex returns this state to client. </p></li><li><p><code>Failed</code> - Conversation with the user failed. Some of the reasons for this <code>dialogState</code> are: after the configured number of attempts the user didn't provide an appropriate response, or the Lambda function failed to fulfill an intent. </p></li></ul>
 */
@property (nonatomic, assign) AWSLexDialogState dialogState;

/**
 <p>Intent Lex inferred from the user input text. This is one of the intents configured for the bot. </p>
 */
@property (nonatomic, strong) NSString * _Nullable intentName;

/**
 <p> Prompt (or statement) to convey to the user. This is based on the application configuration and context. For example, if Lex did not understand the user intent, it sends the <code>clarificationPrompt</code> configured for the application. In another example, if the intent requires confirmation before taking the fulfillment action, it sends the <code>confirmationPrompt</code>. Suppose the Lambda function successfully fulfilled the intent, and sent a message to convey to the user. In that situation, Lex sends that message in the response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Represents the options the user has to respond to the current prompt. Lex sends this in the response only if the <code>dialogState</code> value indicates that user response is expected. </p>
 */
@property (nonatomic, strong) AWSLexResponseCard * _Nullable responseCard;

/**
 <p>Map of key value pairs representing the session specific context information.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sessionAttributes;

/**
 <p>If <code>dialogState</code> value is <code>ElicitSlot</code>, then this returns the name of the slot for which Lex is eliciting a value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable slotToElicit;

/**
 <p> Intent slots (name/value pairs) Amazon Lex detected so far from the user input in the conversation. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable slots;

@end

/**
 <p>If you configure response card at build time, Lex substitutes the session attributes and slot values available, and returns it. The response card can also come from a Lambda function ( <code>dialogCodeHook</code> and <code>fulfillmentActivity</code> on an intent).</p>
 */
@interface AWSLexResponseCard : AWSModel


/**
 <p>Content type of the response.</p>
 */
@property (nonatomic, assign) AWSLexContentType contentType;

/**
 <p>An array of attachment objects representing options.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexGenericAttachment *> * _Nullable genericAttachments;

/**
 <p>Version of response card format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

NS_ASSUME_NONNULL_END
