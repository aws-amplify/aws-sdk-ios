//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSLexResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSLexResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLexResources

+ (instancetype)sharedInstance {
    static AWSLexResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLexResources new];
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
    \"apiVersion\":\"2016-11-28\",\
    \"endpointPrefix\":\"runtime.lex\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"Amazon Lex Runtime Service\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"lex\",\
    \"uid\":\"runtime.lex-2016-11-28\"\
  },\
  \"operations\":{\
    \"PostContent\":{\
      \"name\":\"PostContent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/bot/{botName}/alias/{botAlias}/user/{userId}/content\"\
      },\
      \"input\":{\"shape\":\"PostContentRequest\"},\
      \"output\":{\"shape\":\"PostContentResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"UnsupportedMediaTypeException\"},\
        {\"shape\":\"NotAcceptableException\"},\
        {\"shape\":\"RequestTimeoutException\"},\
        {\"shape\":\"DependencyFailedException\"},\
        {\"shape\":\"BadGatewayException\"},\
        {\"shape\":\"LoopDetectedException\"}\
      ],\
      \"documentation\":\"<p> Sends user input (text or speech) to Amazon Lex. Clients use this API to send requests to Amazon Lex at runtime. Amazon Lex interprets the user input using the machine learning model that it built for the bot. </p> <p> In response, Amazon Lex returns the next message to convey to the user. Consider the following example messages: </p> <ul> <li> <p> For a user input \\\"I would like a pizza,\\\" Amazon Lex might return a response with a message eliciting slot data (for example, <code>PizzaSize</code>): \\\"What size pizza would you like?\\\". </p> </li> <li> <p> After the user provides all of the pizza order information, Amazon Lex might return a response with a message to get user confirmation: \\\"Order the pizza?\\\". </p> </li> <li> <p> After the user replies \\\"Yes\\\" to the confirmation prompt, Amazon Lex might return a conclusion statement: \\\"Thank you, your cheese pizza has been ordered.\\\". </p> </li> </ul> <p> Not all Amazon Lex messages require a response from the user. For example, conclusion statements do not require a response. Some messages require only a yes or no response. In addition to the <code>message</code>, Amazon Lex provides additional context about the message in the response that you can use to enhance client behavior, such as displaying the appropriate client user interface. Consider the following examples: </p> <ul> <li> <p> If the message is to elicit slot data, Amazon Lex returns the following context information: </p> <ul> <li> <p> <code>x-amz-lex-dialog-state</code> header set to <code>ElicitSlot</code> </p> </li> <li> <p> <code>x-amz-lex-intent-name</code> header set to the intent name in the current context </p> </li> <li> <p> <code>x-amz-lex-slot-to-elicit</code> header set to the slot name for which the <code>message</code> is eliciting information </p> </li> <li> <p> <code>x-amz-lex-slots</code> header set to a map of slots configured for the intent with their current values </p> </li> </ul> </li> <li> <p> If the message is a confirmation prompt, the <code>x-amz-lex-dialog-state</code> header is set to <code>Confirmation</code> and the <code>x-amz-lex-slot-to-elicit</code> header is omitted. </p> </li> <li> <p> If the message is a clarification prompt configured for the intent, indicating that the user intent is not understood, the <code>x-amz-dialog-state</code> header is set to <code>ElicitIntent</code> and the <code>x-amz-slot-to-elicit</code> header is omitted. </p> </li> </ul> <p> In addition, Amazon Lex also returns your application-specific <code>sessionAttributes</code>. For more information, see <a href=\\\"http://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html\\\">Managing Conversation Context</a>. </p>\",\
      \"authtype\":\"v4-unsigned-body\"\
    },\
    \"PostText\":{\
      \"name\":\"PostText\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/bot/{botName}/alias/{botAlias}/user/{userId}/text\"\
      },\
      \"input\":{\"shape\":\"PostTextRequest\"},\
      \"output\":{\"shape\":\"PostTextResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"DependencyFailedException\"},\
        {\"shape\":\"BadGatewayException\"},\
        {\"shape\":\"LoopDetectedException\"}\
      ],\
      \"documentation\":\"<p>Sends user input (text-only) to Amazon Lex. Client applications can use this API to send requests to Amazon Lex at runtime. Amazon Lex then interprets the user input using the machine learning model it built for the bot. </p> <p> In response, Amazon Lex returns the next <code>message</code> to convey to the user an optional <code>responseCard</code> to display. Consider the following example messages: </p> <ul> <li> <p> For a user input \\\"I would like a pizza\\\", Amazon Lex might return a response with a message eliciting slot data (for example, PizzaSize): \\\"What size pizza would you like?\\\" </p> </li> <li> <p> After the user provides all of the pizza order information, Amazon Lex might return a response with a message to obtain user confirmation \\\"Proceed with the pizza order?\\\". </p> </li> <li> <p> After the user replies to a confirmation prompt with a \\\"yes\\\", Amazon Lex might return a conclusion statement: \\\"Thank you, your cheese pizza has been ordered.\\\". </p> </li> </ul> <p> Not all Amazon Lex messages require a user response. For example, a conclusion statement does not require a response. Some messages require only a \\\"yes\\\" or \\\"no\\\" user response. In addition to the <code>message</code>, Amazon Lex provides additional context about the message in the response that you might use to enhance client behavior, for example, to display the appropriate client user interface. These are the <code>slotToElicit</code>, <code>dialogState</code>, <code>intentName</code>, and <code>slots</code> fields in the response. Consider the following examples: </p> <ul> <li> <p>If the message is to elicit slot data, Amazon Lex returns the following context information:</p> <ul> <li> <p> <code>dialogState</code> set to ElicitSlot </p> </li> <li> <p> <code>intentName</code> set to the intent name in the current context </p> </li> <li> <p> <code>slotToElicit</code> set to the slot name for which the <code>message</code> is eliciting information </p> </li> <li> <p> <code>slots</code> set to a map of slots, configured for the intent, with currently known values </p> </li> </ul> </li> <li> <p> If the message is a confirmation prompt, the <code>dialogState</code> is set to ConfirmIntent and <code>SlotToElicit</code> is set to null. </p> </li> <li> <p>If the message is a clarification prompt (configured for the intent) that indicates that user intent is not understood, the <code>dialogState</code> is set to ElicitIntent and <code>slotToElicit</code> is set to null. </p> </li> </ul> <p> In addition, Amazon Lex also returns your application-specific <code>sessionAttributes</code>. For more information, see <a href=\\\"http://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html\\\">Managing Conversation Context</a>. </p>\"\
    }\
  },\
  \"shapes\":{\
    \"Accept\":{\"type\":\"string\"},\
    \"BadGatewayException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Either the Amazon Lex bot is still building, or one of the dependent services (Amazon Polly, AWS Lambda) failed with an internal service error.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p> Request validation failed, there is no usable message in the context, or the bot build failed. </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"BlobStream\":{\
      \"type\":\"blob\",\
      \"streaming\":true\
    },\
    \"BotAlias\":{\"type\":\"string\"},\
    \"BotName\":{\"type\":\"string\"},\
    \"Button\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"text\",\
        \"value\"\
      ],\
      \"members\":{\
        \"text\":{\
          \"shape\":\"ButtonTextStringWithLength\",\
          \"documentation\":\"<p>Text that is visible to the user on the button.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"ButtonValueStringWithLength\",\
          \"documentation\":\"<p>The value sent to Amazon Lex when a user chooses the button. For example, consider button text \\\"NYC.\\\" When the user chooses the button, the value sent can be \\\"New York City.\\\"</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents an option to be shown on the client platform (Facebook, Slack, etc.)</p>\"\
    },\
    \"ButtonTextStringWithLength\":{\
      \"type\":\"string\",\
      \"max\":15,\
      \"min\":1\
    },\
    \"ButtonValueStringWithLength\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p> Two clients are using the same AWS account, Amazon Lex bot, and user ID. </p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ContentType\":{\
      \"type\":\"string\",\
      \"enum\":[\"application/vnd.amazonaws.card.generic\"]\
    },\
    \"DependencyFailedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p> One of the downstream dependencies, such as AWS Lambda or Amazon Polly, threw an exception. For example, if Amazon Lex does not have sufficient permissions to call a Lambda function, it results in Lambda throwing an exception. </p>\",\
      \"error\":{\"httpStatusCode\":424},\
      \"exception\":true\
    },\
    \"DialogState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ElicitIntent\",\
        \"ConfirmIntent\",\
        \"ElicitSlot\",\
        \"Fulfilled\",\
        \"ReadyForFulfillment\",\
        \"Failed\"\
      ]\
    },\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"GenericAttachment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"title\":{\
          \"shape\":\"StringWithLength\",\
          \"documentation\":\"<p>The title of the option.</p>\"\
        },\
        \"subTitle\":{\
          \"shape\":\"StringWithLength\",\
          \"documentation\":\"<p>The subtitle shown below the title.</p>\"\
        },\
        \"attachmentLinkUrl\":{\
          \"shape\":\"StringUrlWithLength\",\
          \"documentation\":\"<p>The URL of an attachment to the response card.</p>\"\
        },\
        \"imageUrl\":{\
          \"shape\":\"StringUrlWithLength\",\
          \"documentation\":\"<p>The URL of an image that is displayed to the user.</p>\"\
        },\
        \"buttons\":{\
          \"shape\":\"listOfButtons\",\
          \"documentation\":\"<p>The list of options to show to the user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents an option rendered to the user when a prompt is shown. It could be an image, a button, a link, or text. </p>\"\
    },\
    \"HttpContentType\":{\"type\":\"string\"},\
    \"IntentName\":{\"type\":\"string\"},\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Internal service error. Retry the call.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"retryAfterSeconds\":{\
          \"shape\":\"String\",\
          \"location\":\"header\",\
          \"locationName\":\"Retry-After\"\
        },\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Exceeded a limit.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"LoopDetectedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Lambda fulfilment function returned <code>DelegateDialogAction</code> to Amazon Lex without changing any slot values. </p>\",\
      \"error\":{\"httpStatusCode\":508},\
      \"exception\":true\
    },\
    \"NotAcceptableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The accept header in the request does not have a valid value.</p>\",\
      \"error\":{\"httpStatusCode\":406},\
      \"exception\":true\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The resource (such as the Amazon Lex bot or an alias) that is referred to is not found.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"PostContentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"botName\",\
        \"botAlias\",\
        \"userId\",\
        \"contentType\",\
        \"inputStream\"\
      ],\
      \"members\":{\
        \"botName\":{\
          \"shape\":\"BotName\",\
          \"documentation\":\"<p>Name of the Amazon Lex bot.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"botName\"\
        },\
        \"botAlias\":{\
          \"shape\":\"BotAlias\",\
          \"documentation\":\"<p>Alias of the Amazon Lex bot.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"botAlias\"\
        },\
        \"userId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>ID of the client application user. Typically, each of your application users should have a unique ID. The application developer decides the user IDs. At runtime, each request must include the user ID. Note the following considerations:</p> <ul> <li> <p> If you want a user to start conversation on one device and continue the conversation on another device, you might choose a user-specific identifier, such as the user's login, or Amazon Cognito user ID (assuming your application is using Amazon Cognito). </p> </li> <li> <p> If you want the same user to be able to have two independent conversations on two different devices, you might choose device-specific identifier, such as device ID, or some globally unique identifier. </p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"userId\"\
        },\
        \"sessionAttributes\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>You pass this value in the <code>x-amz-lex-session-attributes</code> HTTP header. The value must be map (keys and values must be strings) that is JSON serialized and then base64 encoded.</p> <p> A session represents dialog between a user and Amazon Lex. At runtime, a client application can pass contextual information, in the request to Amazon Lex. For example, </p> <ul> <li> <p>You might use session attributes to track the requestID of user requests.</p> </li> <li> <p>In Getting Started Exercise 1, the example bot uses the price session attribute to maintain the price of flowers ordered (for example, \\\"price\\\":25). The code hook (Lambda function) sets this attribute based on the type of flowers ordered. For more information, see <a href=\\\"http://docs.aws.amazon.com/lex/latest/dg/gs-bp-details-after-lambda.html\\\">Review the Details of Information Flow</a>. </p> </li> <li> <p>In the BookTrip bot exercise, the bot uses the <code>currentReservation</code> session attribute to maintains the slot data during the in-progress conversation to book a hotel or book a car. For more information, see <a href=\\\"http://docs.aws.amazon.com/lex/latest/dg/book-trip-detail-flow.html\\\">Details of Information Flow</a>. </p> </li> </ul> <p> Amazon Lex passes these session attributes to the Lambda functions configured for the intent In the your Lambda function, you can use the session attributes for initialization and customization (prompts). Some examples are: </p> <ul> <li> <p> Initialization - In a pizza ordering bot, if you pass user location (for example, <code>\\\"Location : 111 Maple Street\\\"</code>), then your Lambda function might use this information to determine the closest pizzeria to place the order (and perhaps set the storeAddress slot value as well). </p> <p> Personalized prompts - For example, you can configure prompts to refer to the user by name (for example, \\\"Hey [firstName], what toppings would you like?\\\"). You can pass the user's name as a session attribute (\\\"firstName\\\": \\\"Joe\\\") so that Amazon Lex can substitute the placeholder to provide a personalized prompt to the user (\\\"Hey Joe, what toppings would you like?\\\"). </p> </li> </ul> <note> <p> Amazon Lex does not persist session attributes. </p> <p> If you configured a code hook for the intent, Amazon Lex passes the incoming session attributes to the Lambda function. The Lambda function must return these session attributes if you want Amazon Lex to return them to the client. </p> <p> If there is no code hook configured for the intent Amazon Lex simply returns the session attributes to the client application. </p> </note>\",\
          \"jsonvalue\":true,\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-session-attributes\"\
        },\
        \"contentType\":{\
          \"shape\":\"HttpContentType\",\
          \"documentation\":\"<p> You pass this values as the <code>Content-Type</code> HTTP header. </p> <p> Indicates the audio format or text. The header value must start with one of the following prefixes: </p> <ul> <li> <p>PCM format</p> <ul> <li> <p>audio/l16; rate=16000; channels=1</p> </li> <li> <p>audio/x-l16; sample-rate=16000; channel-count=1</p> </li> </ul> </li> <li> <p>Opus format</p> <ul> <li> <p>audio/x-cbr-opus-with-preamble; preamble-size=0; bit-rate=1; frame-size-milliseconds=1.1</p> </li> </ul> </li> <li> <p>Text format</p> <ul> <li> <p>text/plain; charset=utf-8</p> </li> </ul> </li> </ul>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"accept\":{\
          \"shape\":\"Accept\",\
          \"documentation\":\"<p> You pass this value as the <code>Accept</code> HTTP header. </p> <p> The message Amazon Lex returns in the response can be either text or speech based on the <code>Accept</code> HTTP header value in the request. </p> <ul> <li> <p> If the value is <code>text/plain; charset=utf-8</code>, Amazon Lex returns text in the response. </p> </li> <li> <p> If the value begins with <code>audio/</code>, Amazon Lex returns speech in the response. Amazon Lex uses Amazon Polly to generate the speech (using the configuration you specified in the <code>Accept</code> header). For example, if you specify <code>audio/mpeg</code> as the value, Amazon Lex returns speech in the MPEG format.</p> <p>The following are the accepted values:</p> <ul> <li> <p>audio/mpeg</p> </li> <li> <p>audio/ogg</p> </li> <li> <p>audio/pcm</p> </li> <li> <p>text/plain; charset=utf-8</p> </li> <li> <p>audio/* (defaults to mpeg)</p> </li> </ul> </li> </ul>\",\
          \"location\":\"header\",\
          \"locationName\":\"Accept\"\
        },\
        \"inputStream\":{\
          \"shape\":\"BlobStream\",\
          \"documentation\":\"<p> User input in PCM or Opus audio format or text format as described in the <code>Content-Type</code> HTTP header. </p>\"\
        }\
      },\
      \"payload\":\"inputStream\"\
    },\
    \"PostContentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"contentType\":{\
          \"shape\":\"HttpContentType\",\
          \"documentation\":\"<p>Content type as specified in the <code>Accept</code> HTTP header in the request.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"intentName\":{\
          \"shape\":\"IntentName\",\
          \"documentation\":\"<p>Current user intent that Amazon Lex is aware of.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-intent-name\"\
        },\
        \"slots\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Map of zero or more intent slots (name/value pairs) Amazon Lex detected from the user input during the conversation.</p>\",\
          \"jsonvalue\":true,\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-slots\"\
        },\
        \"sessionAttributes\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p> Map of key/value pairs representing the session-specific context information. </p>\",\
          \"jsonvalue\":true,\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-session-attributes\"\
        },\
        \"message\":{\
          \"shape\":\"Text\",\
          \"documentation\":\"<p> Message to convey to the user. It can come from the bot's configuration or a code hook (Lambda function). If the current intent is not configured with a code hook or if the code hook returned <code>Delegate</code> as the <code>dialogAction.type</code> in its response, then Amazon Lex decides the next course of action and selects an appropriate message from the bot configuration based on the current user interaction context. For example, if Amazon Lex is not able to understand the user input, it uses a clarification prompt message (For more information, see the Error Handling section in the Amazon Lex console). Another example: if the intent requires confirmation before fulfillment, then Amazon Lex uses the confirmation prompt message in the intent configuration. If the code hook returns a message, Amazon Lex passes it as-is in its response to the client. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-message\"\
        },\
        \"dialogState\":{\
          \"shape\":\"DialogState\",\
          \"documentation\":\"<p>Identifies the current state of the user interaction. Amazon Lex returns one of the following values as <code>dialogState</code>. The client can optionally use this information to customize the user interface. </p> <ul> <li> <p> <code>ElicitIntent</code> â Amazon Lex wants to elicit the user's intent. Consider the following examples: </p> <p> For example, a user might utter an intent (\\\"I want to order a pizza\\\"). If Amazon Lex cannot infer the user intent from this utterance, it will return this dialog state. </p> </li> <li> <p> <code>ConfirmIntent</code> â Amazon Lex is expecting a \\\"yes\\\" or \\\"no\\\" response. </p> <p>For example, Amazon Lex wants user confirmation before fulfilling an intent. Instead of a simple \\\"yes\\\" or \\\"no\\\" response, a user might respond with additional information. For example, \\\"yes, but make it a thick crust pizza\\\" or \\\"no, I want to order a drink.\\\" Amazon Lex can process such additional information (in these examples, update the crust type slot or change the intent from OrderPizza to OrderDrink). </p> </li> <li> <p> <code>ElicitSlot</code> â Amazon Lex is expecting the value of a slot for the current intent. </p> <p> For example, suppose that in the response Amazon Lex sends this message: \\\"What size pizza would you like?\\\". A user might reply with the slot value (e.g., \\\"medium\\\"). The user might also provide additional information in the response (e.g., \\\"medium thick crust pizza\\\"). Amazon Lex can process such additional information appropriately. </p> </li> <li> <p> <code>Fulfilled</code> â Conveys that the Lambda function has successfully fulfilled the intent. </p> </li> <li> <p> <code>ReadyForFulfillment</code> â Conveys that the client has to fullfill the request. </p> </li> <li> <p> <code>Failed</code> â Conveys that the conversation with the user failed. </p> <p> This can happen for various reasons, including that the user does not provide an appropriate response to prompts from the service (you can configure how many times Amazon Lex can prompt a user for specific information), or if the Lambda function fails to fulfill the intent. </p> </li> </ul>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-dialog-state\"\
        },\
        \"slotToElicit\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p> If the <code>dialogState</code> value is <code>ElicitSlot</code>, returns the name of the slot for which Amazon Lex is eliciting a value. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-slot-to-elicit\"\
        },\
        \"inputTranscript\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Transcript of the voice input to the operation.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-input-transcript\"\
        },\
        \"audioStream\":{\
          \"shape\":\"BlobStream\",\
          \"documentation\":\"<p>The prompt (or statement) to convey to the user. This is based on the bot configuration and context. For example, if Amazon Lex did not understand the user intent, it sends the <code>clarificationPrompt</code> configured for the bot. If the intent requires confirmation before taking the fulfillment action, it sends the <code>confirmationPrompt</code>. Another example: Suppose that the Lambda function successfully fulfilled the intent, and sent a message to convey to the user. Then Amazon Lex sends that message in the response. </p>\"\
        }\
      },\
      \"payload\":\"audioStream\"\
    },\
    \"PostTextRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"botName\",\
        \"botAlias\",\
        \"userId\",\
        \"inputText\"\
      ],\
      \"members\":{\
        \"botName\":{\
          \"shape\":\"BotName\",\
          \"documentation\":\"<p>The name of the Amazon Lex bot.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"botName\"\
        },\
        \"botAlias\":{\
          \"shape\":\"BotAlias\",\
          \"documentation\":\"<p>The alias of the Amazon Lex bot.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"botAlias\"\
        },\
        \"userId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The ID of the client application user. The application developer decides the user IDs. At runtime, each request must include the user ID. Typically, each of your application users should have a unique ID. Note the following considerations: </p> <ul> <li> <p> If you want a user to start a conversation on one device and continue the conversation on another device, you might choose a user-specific identifier, such as a login or Amazon Cognito user ID (assuming your application is using Amazon Cognito). </p> </li> <li> <p> If you want the same user to be able to have two independent conversations on two different devices, you might choose a device-specific identifier, such as device ID, or some globally unique identifier. </p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"userId\"\
        },\
        \"sessionAttributes\":{\
          \"shape\":\"StringMap\",\
          \"documentation\":\"<p> By using session attributes, a client application can pass contextual information in the request to Amazon Lex For example, </p> <ul> <li> <p>In Getting Started Exercise 1, the example bot uses the <code>price</code> session attribute to maintain the price of the flowers ordered (for example, \\\"Price\\\":25). The code hook (the Lambda function) sets this attribute based on the type of flowers ordered. For more information, see <a href=\\\"http://docs.aws.amazon.com/lex/latest/dg/gs-bp-details-after-lambda.html\\\">Review the Details of Information Flow</a>. </p> </li> <li> <p>In the BookTrip bot exercise, the bot uses the <code>currentReservation</code> session attribute to maintain slot data during the in-progress conversation to book a hotel or book a car. For more information, see <a href=\\\"http://docs.aws.amazon.com/lex/latest/dg/book-trip-detail-flow.html\\\">Details of Information Flow</a>. </p> </li> <li> <p>You might use the session attributes (key, value pairs) to track the requestID of user requests.</p> </li> </ul> <p> Amazon Lex simply passes these session attributes to the Lambda functions configured for the intent.</p> <p>In your Lambda function, you can also use the session attributes for initialization and customization (prompts and response cards). Some examples are:</p> <ul> <li> <p> Initialization - In a pizza ordering bot, if you can pass the user location as a session attribute (for example, <code>\\\"Location\\\" : \\\"111 Maple street\\\"</code>), then your Lambda function might use this information to determine the closest pizzeria to place the order (perhaps to set the storeAddress slot value). </p> </li> <li> <p> Personalize prompts - For example, you can configure prompts to refer to the user name. (For example, \\\"Hey [FirstName], what toppings would you like?\\\"). You can pass the user name as a session attribute (<code>\\\"FirstName\\\" : \\\"Joe\\\"</code>) so that Amazon Lex can substitute the placeholder to provide a personalize prompt to the user (\\\"Hey Joe, what toppings would you like?\\\"). </p> </li> </ul> <note> <p> Amazon Lex does not persist session attributes. </p> <p> If you configure a code hook for the intent, Amazon Lex passes the incoming session attributes to the Lambda function. If you want Amazon Lex to return these session attributes back to the client, the Lambda function must return them. </p> <p> If there is no code hook configured for the intent, Amazon Lex simply returns the session attributes back to the client application. </p> </note>\"\
        },\
        \"inputText\":{\
          \"shape\":\"Text\",\
          \"documentation\":\"<p>The text that the user entered (Amazon Lex interprets this text).</p>\"\
        }\
      }\
    },\
    \"PostTextResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"intentName\":{\
          \"shape\":\"IntentName\",\
          \"documentation\":\"<p>The current user intent that Amazon Lex is aware of.</p>\"\
        },\
        \"slots\":{\
          \"shape\":\"StringMap\",\
          \"documentation\":\"<p> The intent slots (name/value pairs) that Amazon Lex detected so far from the user input in the conversation. </p>\"\
        },\
        \"sessionAttributes\":{\
          \"shape\":\"StringMap\",\
          \"documentation\":\"<p>A map of key-value pairs representing the session-specific context information.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"Text\",\
          \"documentation\":\"<p> A message to convey to the user. It can come from the bot's configuration or a code hook (Lambda function). If the current intent is not configured with a code hook or the code hook returned <code>Delegate</code> as the <code>dialogAction.type</code> in its response, then Amazon Lex decides the next course of action and selects an appropriate message from the bot configuration based on the current user interaction context. For example, if Amazon Lex is not able to understand the user input, it uses a clarification prompt message (for more information, see the Error Handling section in the Amazon Lex console). Another example: if the intent requires confirmation before fulfillment, then Amazon Lex uses the confirmation prompt message in the intent configuration. If the code hook returns a message, Amazon Lex passes it as-is in its response to the client. </p>\"\
        },\
        \"dialogState\":{\
          \"shape\":\"DialogState\",\
          \"documentation\":\"<p> Identifies the current state of the user interaction. Amazon Lex returns one of the following values as <code>dialogState</code>. The client can optionally use this information to customize the user interface. </p> <ul> <li> <p> <code>ElicitIntent</code> â Amazon Lex wants to elicit user intent. </p> <p>For example, a user might utter an intent (\\\"I want to order a pizza\\\"). If Amazon Lex cannot infer the user intent from this utterance, it will return this dialogState.</p> </li> <li> <p> <code>ConfirmIntent</code> â Amazon Lex is expecting a \\\"yes\\\" or \\\"no\\\" response. </p> <p> For example, Amazon Lex wants user confirmation before fulfilling an intent. </p> <p>Instead of a simple \\\"yes\\\" or \\\"no,\\\" a user might respond with additional information. For example, \\\"yes, but make it thick crust pizza\\\" or \\\"no, I want to order a drink\\\". Amazon Lex can process such additional information (in these examples, update the crust type slot value, or change intent from OrderPizza to OrderDrink).</p> </li> <li> <p> <code>ElicitSlot</code> â Amazon Lex is expecting a slot value for the current intent. </p> <p>For example, suppose that in the response Amazon Lex sends this message: \\\"What size pizza would you like?\\\". A user might reply with the slot value (e.g., \\\"medium\\\"). The user might also provide additional information in the response (e.g., \\\"medium thick crust pizza\\\"). Amazon Lex can process such additional information appropriately. </p> </li> <li> <p> <code>Fulfilled</code> â Conveys that the Lambda function configured for the intent has successfully fulfilled the intent. </p> </li> <li> <p> <code>ReadyForFulfillment</code> â Conveys that the client has to fulfill the intent. </p> </li> <li> <p> <code>Failed</code> â Conveys that the conversation with the user failed. </p> <p> This can happen for various reasons including that the user did not provide an appropriate response to prompts from the service (you can configure how many times Amazon Lex can prompt a user for specific information), or the Lambda function failed to fulfill the intent. </p> </li> </ul>\"\
        },\
        \"slotToElicit\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If the <code>dialogState</code> value is <code>ElicitSlot</code>, returns the name of the slot for which Amazon Lex is eliciting a value. </p>\"\
        },\
        \"responseCard\":{\
          \"shape\":\"ResponseCard\",\
          \"documentation\":\"<p>Represents the options that the user has to respond to the current prompt. Response Card can come from the bot configuration (in the Amazon Lex console, choose the settings button next to a slot) or from a code hook (Lambda function). </p>\"\
        }\
      }\
    },\
    \"RequestTimeoutException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The input speech is too long.</p>\",\
      \"error\":{\"httpStatusCode\":408},\
      \"exception\":true\
    },\
    \"ResponseCard\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"version\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The version of the response card format.</p>\"\
        },\
        \"contentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>The content type of the response.</p>\"\
        },\
        \"genericAttachments\":{\
          \"shape\":\"genericAttachmentList\",\
          \"documentation\":\"<p>An array of attachment objects representing options.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If you configure a response card when creating your bots, Amazon Lex substitutes the session attributes and slot values that are available, and then returns it. The response card can also come from a Lambda function ( <code>dialogCodeHook</code> and <code>fulfillmentActivity</code> on an intent).</p>\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"StringMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"String\"},\
      \"value\":{\"shape\":\"String\"}\
    },\
    \"StringUrlWithLength\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"StringWithLength\":{\
      \"type\":\"string\",\
      \"max\":80,\
      \"min\":1\
    },\
    \"Text\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"UnsupportedMediaTypeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The Content-Type header (<code>PostContent</code> API) has an invalid value. </p>\",\
      \"error\":{\"httpStatusCode\":415},\
      \"exception\":true\
    },\
    \"UserId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":2,\
      \"pattern\":\"[0-9a-zA-Z._:-]+\"\
    },\
    \"genericAttachmentList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GenericAttachment\"},\
      \"max\":10,\
      \"min\":0\
    },\
    \"listOfButtons\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Button\"},\
      \"max\":5,\
      \"min\":0\
    }\
  },\
  \"documentation\":\"<p>Amazon Lex provides both build and runtime endpoints. Each endpoint provides a set of operations (API). Your conversational bot uses the runtime API to understand user utterances (user input text or voice). For example, suppose a user says \\\"I want pizza\\\", your bot sends this input to Amazon Lex using the runtime API. Amazon Lex recognizes that the user request is for the OrderPizza intent (one of the intents defined in the bot). Then Amazon Lex engages in user conversation on behalf of the bot to elicit required information (slot values, such as pizza size and crust type), and then performs fulfillment activity (that you configured when you created the bot). You use the build-time API to create and manage your Amazon Lex bot. For a list of build-time operations, see the build-time API, . </p>\"\
}\
";
}

@end
