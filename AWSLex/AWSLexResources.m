//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSCore/AWSLogging.h>

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
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
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
    \"signingName\":\"lex\"\
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
      \"documentation\":\"<p>Sends user input (speech or text), at runtime, to Amazon Lex. Lex uses the machine learning model (built for the specific application), to interpret user speech. </p> <note> <p> When building Lex text bots, you can use the <code>PostText</code> API, which supports response cards. When building Lex bots that communicate by speech alone or by speech and text both, you use the this API. </p> </note> <p> In response, Lex returns the next <code>message</code> to convey to the user and the message type (<code>dialogState</code>). Based on the user interaction context, Lex knows the message to return and the message type indicates whether to expect a user response for that message. For example, consider the following response messages: </p> <ul> <li> <p>\\\"What pizza toppings would you like?\\\" - For this message, the <code>dialogState</code> would be <code>ElicitSlot</code> (that is, user response is expected). </p> </li> <li> <p>\\\"Your order has been placed.\\\" - For this message, Lex returns one of the following dialog states depending on how the fulfillment is configured for the intent (see <code>fulfillmentActivity</code> in ). </p> <ul> <li> <p> <code>FulFilled</code> - If the intent <code>fulfillmentActivity</code> is configured with a Lambda function to fulfill the intent. </p> </li> <li> <p> <code>ReadyForFulfilment</code> - If the intent's <code>fulfillmentActivity</code> is configured to simply return the intent data back to the client application. </p> </li> </ul> </li> </ul>\"\
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
      \"documentation\":\"<p>Sends user input text, at runtime, to Amazon Lex. Lex uses the machine learning model that the service built for the application to interpret user input. </p> <p> In response, Lex returns the next message to convey to the user (based on the context of the user interaction) and whether to expect user response for the message (<code>dialogState</code>). For example, consider the following response messages: </p> <ul> <li> <p>\\\"What pizza toppings would you like?\\\" - In this case, the <code>dialogState</code> would be <code>ElicitSlot</code> (that is, user response is expected). </p> </li> <li> <p>\\\"Your order has been placed.\\\" - In this case, Lex returns one of the following <code>dialogState</code> depending on how the intent fulfillment is configured (see <code>fulfillmentActivity</code> in ). </p> <ul> <li> <p> <code>FulFilled</code> - If the intent fulfillment is configured through a Lambda function. </p> </li> <li> <p> <code>ReadyForFulfilment</code> if the intent's <code>fulfillmentActivity</code> is to simply return the intent data back to the client application. </p> </li> </ul> </li> </ul>\"\
    }\
  },\
  \"shapes\":{\
    \"Accept\":{\"type\":\"string\"},\
    \"BadGatewayException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Either the Lex bot is still building, or one of the dependent services (Amazon Polly, AWS Lambda) failed with internal service error.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p> Amazon Lex throws this exception to indicate situations including request failed validation, there is no usable message in the context, or the bot build failed. </p>\",\
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
          \"documentation\":\"<p>Text visible to the user on the button.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"ButtonValueStringWithLength\",\
          \"documentation\":\"<p>Value sent to Amazon Lex when user clicks the button. For exmaple, consider button text \\\"NYC\\\". When user clicks the button, the value sent can be \\\"New York City\\\".</p>\"\
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
      \"documentation\":\"<p> Two clients are using same AWS account, Lex bot, and user ID. </p>\",\
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
      \"documentation\":\"<p> One of the downstream dependencies, such as AWS Lambda, Amazon Polly threw a non-retriable exception. For example, if Amazon Lex does not have sufficient permissions to call a Lambda function which results in AWS Lambda throwing an exception. </p>\",\
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
          \"documentation\":\"<p>Title of the option.</p>\"\
        },\
        \"subTitle\":{\
          \"shape\":\"StringWithLength\",\
          \"documentation\":\"<p>Sub title shown below the title.</p>\"\
        },\
        \"attachmentLinkUrl\":{\"shape\":\"StringUrlWithLength\"},\
        \"imageUrl\":{\
          \"shape\":\"StringUrlWithLength\",\
          \"documentation\":\"<p>URL of an image that is displayed to the user.</p>\"\
        },\
        \"buttons\":{\
          \"shape\":\"listOfButtons\",\
          \"documentation\":\"<p>List of options to show to the user.</p>\"\
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
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"LoopDetectedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Lambda fufillment function returned DelegateDialogAction to Lex without changing any slot values. </p>\",\
      \"error\":{\"httpStatusCode\":508},\
      \"exception\":true\
    },\
    \"NotAcceptableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Accept header in the request does not have a valid value.</p>\",\
      \"error\":{\"httpStatusCode\":406},\
      \"exception\":true\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Resource (such as the Lex bot or an alias) referred is not found.</p>\",\
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
          \"documentation\":\"<p>Name of the Lex bot.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"botName\"\
        },\
        \"botAlias\":{\
          \"shape\":\"BotAlias\",\
          \"documentation\":\"<p>Alias of the Lex bot.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"botAlias\"\
        },\
        \"userId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>User ID of your client application. Typically you want each of your application users to have a unique ID. Note the following considerations: </p> <ul> <li> <p> If you want a user to start conversation on one mobile device and continue the conversation on another device, you might choose user-specific identifier, such as login, or Cognito user ID (assuming your application is using Amazon Cognito). </p> </li> <li> <p> If you want the same user to be able to have two independent conversations on two different devices, you might choose device-specific identifier, such as device ID, or some globally unique identifier. </p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"userId\"\
        },\
        \"sessionAttributes\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>You pass this value in the <code>x-amz-deep-sense-session-attributes</code> HTTP header. The value must be map (keys and values must be string) that is JSON serialized and then base64-encoded.</p> <p> A session represents dialog between a user and Amazon Lex. At runtime, a client application can pass contextual information (session attributes), in the request. For example, <code>\\\"FirstName\\\" : \\\"Joe\\\"</code>. </p> <p> Lex passes these session attributes to the Lambda functions configured for the intent (see <code>dialogCodeHook</code> and <code>fulfillmentActivity.codeHook</code> in ). In the Lambda function code, you can use the session attributes for customization. For example, </p> <ul> <li> <p> In a pizza ordering application, if you pass user location (for example, <code>\\\"Location\\\" : \\\"some location\\\"</code>) as a session attribute, your Lambda function might use this information to determine the closest pizzeria to place the order. </p> </li> <li> <p> You might use session attribute information to personalize prompts. For example, suppose you pass in user name as a session attribute (<code>\\\"FirstName\\\" : \\\"Joe\\\"</code>). You might configure subsequent prompts to refer to this attribute, as <code>$session.FirstName\\\"</code>. At runtime, Lex substitutes a real value in generating a prompt - \\\"Hello Joe, what would you like to order?\\\". </p> </li> </ul> <note> <p> Amazon Lex does not persist session attributes. </p> <p> If you have not configured a Lambda function to process an intent (that is, you want processing done on on the client), then Lex simply returns the session attributes back to the client application. </p> <p> If you configured a Lambda function to process the intent, Lex passes the incoming session attributes to the Lambda function. The Lambda function must return these session attributes if you want Lex to return them back to client. </p> </note>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-session-attributes\"\
        },\
        \"contentType\":{\
          \"shape\":\"HttpContentType\",\
          \"documentation\":\"<p> You pass this values as the <code>Content-Type</code> HTTP header. </p> <p> Indicates the audio format. The header value must start with one of the following prefixes: </p> <ul> <li> <p>audio/l16; rate=16000; channels=1</p> </li> <li> <p>audio/x-l16; sample-rate=16000; channel-count=1</p> </li> <li> <p>text/plain; charset=utf-8</p> </li> <li> <p>audio/x-cbr-opus-with-preamble; preamble-size=0; bit-rate=1; frame-size-milliseconds=1.1</p> </li> </ul>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"accept\":{\
          \"shape\":\"Accept\",\
          \"documentation\":\"<p> You pass this value as the <code>Accept</code> HTTP header. </p> <p> The message Lex returns in the response can be either text or speech based on the <code>Accept</code> HTTP header value in the request. </p> <ul> <li> <p> If the value is <code>text/plain; charset=utf-8</code>, Lex returns text in the response. </p> </li> <li> <p> If the value begins with <code>audio/</code>, the Lex returns a speech in the response. Lex uses Amazon Polly to generate the speech (using the configuration you specified in the <code>Accept</code> header). For example, if you specify <code>audio/mpeg</code> as the value, Lex returns speech in the MPEG format.</p> <p>The following are the accepted values:</p> <ul> <li> <p>audio/mpeg</p> </li> <li> <p>audio/ogg</p> </li> <li> <p>audio/pcm</p> </li> <li> <p>text/plain; charset=utf-8</p> </li> <li> <p>audio/* (defaults to mpeg)</p> </li> </ul> </li> </ul>\",\
          \"location\":\"header\",\
          \"locationName\":\"Accept\"\
        },\
        \"inputStream\":{\
          \"shape\":\"BlobStream\",\
          \"documentation\":\"<p> User input, in the format as described in the <code>Content-Type</code> HTTP header. </p>\"\
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
          \"documentation\":\"<p>Name of the intent.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-intent-name\"\
        },\
        \"slots\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Map of zero or more intent slots (name/value pairs) Amazon Lex detected from the user input during the conversation.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-slots\"\
        },\
        \"sessionAttributes\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>JSON serialized and then base64-encoded map of key value pairs representing the session specific context information. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-session-attributes\"\
        },\
        \"message\":{\
          \"shape\":\"Text\",\
          \"documentation\":\"<p> Based on the build-time application configuration, Amazon Lex determines the prompt (or statement) to convey to the user. If your application uses a Lambda function, then it can determine what prompt (or statement) to convey to the user. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-message\"\
        },\
        \"dialogState\":{\
          \"shape\":\"DialogState\",\
          \"documentation\":\"<p>Represents the message type to be conveyed to the user. For example, </p> <ul> <li> <p> <code>ElicitIntent</code> - Lex wants to elicit user intent. Consider the following examples: </p> <ul> <li> <p>Suppose Lex did not understand the first utterances. For example \\\"I want to order pizza\\\" (indicating OrderPizza intent). But, if Lex did not understand the user's input to determine the intent, the service returns this dialog state. </p> </li> <li> <p> Suppose the intent is configured with a follow up prompt. For example, after the OrderPizza intent is fulfilled, the intent might have a follow up prompt -\\\" Do you want to order a drink or desert?\\\". In this case, Lex returns this dialog state. </p> </li> </ul> </li> <li> <p> <code>ConfirmIntent</code> - Lex is expecting a yes/no response from the user as to whether go ahead and fulfill the intent (for example, ok to go ahead and order the pizza). </p> <note> <p> In addition to yes/no reply, user might provide respond with additional slot information. It can be a new slot information or change in existing slot value. For example, user might reply - \\\"Yes, but change the crust to thick crust\\\". Amazon Lex can understand the additional information and update the intent slots accordingly. </p> <p> Consider another example. Before fulfilling an order, your application might prompt for confirmation - \\\"Ok to place this pizza order?\\\". User might reply - \\\"No, I want to order a drink\\\". In this case, Lex recognizes the new \\\"OrderDrink\\\" intent. </p> </note> </li> <li> <p> <code>ElicitSlot</code> - Lex is expecting a value of a slot for the current intent. Suppose Lex asks, \\\"What size pizza would you like?\\\". A user might reply - \\\"Medium\\\", or \\\"Medium pepperoni pizza\\\". Lex will recognize the size and the topping as the two separate slot values. </p> </li> <li> <p> <code>Fulfilled</code> - Conveys that the Lambda function has successfully fulfilled the intent. If Lambda function returns a statement/message to convey the fulfillment result, Lex will pass this string to the client. If not, Lex looks for <code>conclusionStatement</code> that you configured for the intent. </p> <p> If both the Lambda function statement and the <code>conclusionStatement</code> are missing, Lex throws a bad request exception. </p> </li> <li> <p> <code>ReadyForFulfillment</code> - Conveys that the client has to do the fulfillment work for the intent (this is the case when the current intent has the <code>fulfillmentActivity </code> configured as <code>ReturnIntent</code>). </p> </li> <li> <p> <code>Failed</code> - Conversation with the user failed. Some of the reasons for this dialog state are: After the preconfigured number of attempts user did not provide appropriate response, or Lambda function failed to fulfill an intent. </p> </li> </ul>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-dialog-state\"\
        },\
        \"slotToElicit\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If <code>dialogState</code> value is <code>ElicitSlot</code>, then this returns the name of the slot for which Lex is eliciting a value. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-lex-slot-to-elicit\"\
        },\
        \"audioStream\":{\
          \"shape\":\"BlobStream\",\
          \"documentation\":\"<p>Prompt (or statement) to convey to the user. This is based on the application configuration and context. For example, if Lex did not understand the user intent, it will send the clarificationPrompt configured for the application. If the intent requires confirmation before taking the fulfillment action, it will send the confirmationPrompt. Here is another example, suppose Lambda function successfully fulfilled the intent, and sent a message to convery to the user. Then Lex will send that message in the response. </p>\"\
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
          \"documentation\":\"<p>Name of the Lex bot.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"botName\"\
        },\
        \"botAlias\":{\
          \"shape\":\"BotAlias\",\
          \"documentation\":\"<p>Alias of the Lex bot.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"botAlias\"\
        },\
        \"userId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>User ID of your client application. Typically you want each of your application users to have a unique ID. Note the following considerations: </p> <ul> <li> <p> If you want a user to start conversation on one mobile device and continue the conversation on another device, you might choose user-specific identifier, such as login, or Cognito user ID (assuming your application is using Amazon Cognito). </p> </li> <li> <p> If you want the same user to be able to have two independent conversations on two different devices, you might choose device-specific identifier, such as device ID, or some globally unique identifier. </p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"userId\"\
        },\
        \"sessionAttributes\":{\
          \"shape\":\"StringMap\",\
          \"documentation\":\"<p> A session represents dialog between a user and Amazon Lex. At runtime, a client application can pass contextual information (session attributes), in the request. For example, <code>\\\"FirstName\\\" : \\\"Joe\\\"</code>. Lex passes these session attributes to the Lambda function(s) configured for the intent (see <code>dialogCodeHook</code> and <code>fulfillmentActivity.codeHook</code> in ). </p> <p>In your Lambda function, you can use the session attributes for customization. Some examples are:</p> <ul> <li> <p> In a pizza ordering application, if you can pass user location as a session attribute (for example, <code>\\\"Location\\\" : \\\"111 Maple street\\\"</code>), your Lambda function might use this information to determine the closest pizzeria to place the order. </p> </li> <li> <p> Use session attributes to personalize prompts. For example, you pass in user name as a session attribute (<code>\\\"FirstName\\\" : \\\"Joe\\\"</code>), you might configure subsequent prompts to refer to this attribute, as <code>$session.FirstName\\\"</code>. At runtime, Lex will then substitute a real value in generating a prompt - \\\"Hello Joe, what would you like to order?\\\". </p> </li> </ul> <note> <p> Amazon Lex does not persist session attributes. </p> <p> If the intent is configured without a Lambda function to process the intent (that is, the client application to process the intent), Lex simply returns the session attributes back to the client application. </p> <p> If the intent is configured with a Lambda function to process the intent, Lex passes the incoming session attributes to the Lambda function. The Lambda function must return these session attributes if you want Lex to return them back to the client. </p> </note>\"\
        },\
        \"inputText\":{\
          \"shape\":\"Text\",\
          \"documentation\":\"<p>Text user entered (Lex interprets this text).</p>\"\
        }\
      }\
    },\
    \"PostTextResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"intentName\":{\
          \"shape\":\"IntentName\",\
          \"documentation\":\"<p>Intent Lex inferred from the user input text. This is one of the intents configured for the bot. </p>\"\
        },\
        \"slots\":{\
          \"shape\":\"StringMap\",\
          \"documentation\":\"<p> Intent slots (name/value pairs) Amazon Lex detected so far from the user input in the conversation. </p>\"\
        },\
        \"sessionAttributes\":{\
          \"shape\":\"StringMap\",\
          \"documentation\":\"<p>Map of key value pairs representing the session specific context information.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"Text\",\
          \"documentation\":\"<p> Prompt (or statement) to convey to the user. This is based on the application configuration and context. For example, if Lex did not understand the user intent, it sends the <code>clarificationPrompt</code> configured for the application. In another example, if the intent requires confirmation before taking the fulfillment action, it sends the <code>confirmationPrompt</code>. Suppose the Lambda function successfully fulfilled the intent, and sent a message to convey to the user. In that situation, Lex sends that message in the response. </p>\"\
        },\
        \"dialogState\":{\
          \"shape\":\"DialogState\",\
          \"documentation\":\"<p>Represents the message type to be conveyed to the user. For example, </p> <ul> <li> <p> <code>ElicitIntent</code> - Lex wants to elicit user intent. For example, Lex did not understand the first utterances such as \\\"I want to order pizza\\\", which indicates the OrderPizza intent. But, if Lex did not understand the intent, it returns this <code>dialogState</code>. Another example is when your intent is configured with a follow up prompt. For example, after OrderPizza intent is fulfilled, the intent might have a follow up prompt -\\\" Do you want to order a drink or desert\\\". In this case, Lex returns this <code>dialogState</code>. </p> </li> <li> <p> <code>ConfirmIntent</code> - Lex is expecting a yes/no response from the user as to whether go ahead and fulfill the intent (for example, ok to go ahead and order the pizza). In addition to yes/no reply, user might provide respond with additional slot information (either new slot information or change existing slot values). For example, \\\"Yes, but change to thick crust\\\". Amazon Lex will understand the additional information and update the intent slots accordingly. </p> <p> Consider another example. Before fulfilling an order, your application might prompt for confirmation - \\\"Do you want to place this pizza order?\\\". Instead, use might reply - \\\"No, I want to order a drink\\\". Lex recognizes the new intent \\\"OrderDrink\\\" intent. </p> </li> <li> <p> <code>ElicitSlot</code> - Lex is expecting a value of a slot for the current intent. For example, suppose Lex asks, \\\"What size pizza would you like?\\\". A user might reply - \\\"Medium pepperoni pizza\\\". Lex will recognize the size and the topping as the two separate slot values. </p> </li> <li> <p> <code>Fulfilled</code> - Conveys that the Lambda function has successfully fulfilled the intent. If Lambda function returns a statement/message to convey the fulfillment result, Lex passes this string to the client. If not, Lex looks for <code>conclusionStatement</code> that you configured for the intent. </p> <p> If both the Lambda function statement and the <code>conclusionStatement</code> are missing, Lex throws a bad request exception. </p> </li> <li> <p> <code>ReadyForFulfillment</code> - conveys that the client has to do the fulfillment work for the intent. This is the case when the current intent is configured with <code>ReturnIntent</code> as the <code>fulfillmentActivity </code>, then Lex returns this state to client. </p> </li> <li> <p> <code>Failed</code> - Conversation with the user failed. Some of the reasons for this <code>dialogState</code> are: after the configured number of attempts the user didn't provide an appropriate response, or the Lambda function failed to fulfill an intent. </p> </li> </ul>\"\
        },\
        \"slotToElicit\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If <code>dialogState</code> value is <code>ElicitSlot</code>, then this returns the name of the slot for which Lex is eliciting a value. </p>\"\
        },\
        \"responseCard\":{\
          \"shape\":\"ResponseCard\",\
          \"documentation\":\"<p>Represents the options the user has to respond to the current prompt. Lex sends this in the response only if the <code>dialogState</code> value indicates that user response is expected. </p>\"\
        }\
      }\
    },\
    \"RequestTimeoutException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Input speech too long.</p>\",\
      \"error\":{\"httpStatusCode\":408},\
      \"exception\":true\
    },\
    \"ResponseCard\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"version\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Version of response card format.</p>\"\
        },\
        \"contentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>Content type of the response.</p>\"\
        },\
        \"genericAttachments\":{\
          \"shape\":\"genericAttachmentList\",\
          \"documentation\":\"<p>An array of attachment objects representing options.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If you configure response card at build time, Lex substitutes the session attributes and slot values available, and returns it. The response card can also come from a Lambda function ( <code>dialogCodeHook</code> and <code>fulfillmentActivity</code> on an intent).</p>\"\
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
      \"documentation\":\"<p>Content-Type header (<code>PostContent</code> API) has invalid value. </p>\",\
      \"error\":{\"httpStatusCode\":415},\
      \"exception\":true\
    },\
    \"UserId\":{\
      \"type\":\"string\",\
      \"max\":50,\
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
  \"documentation\":\"<p>Amazon Lex provides both build and run time endpoints. Each endpoint provides a set of operations (API). Your application uses the runtime API to understand user utterances (user input text or voice). For example, suppose user says \\\"I want pizza\\\", your application sends this input to Amazon Lex using the runtime API. Amazon Lex recognizes user request is for \\\"OrderPizza\\\" intent (one of the intents defined in the application). The service then engages in user conversation on behalf of the application to to elicit required information (slot values, such as pizza size and crust type), and then performs fultillment activity (that you configured at the time of creating the application). You use the build-time API to create and manage your Amazon Lex applications. For a list of build-time operations, see . </p>\"\
}\
";
}

@end
