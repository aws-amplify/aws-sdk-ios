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

#import "AWSLexModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSLexErrorDomain = @"com.amazonaws.AWSLexErrorDomain";

@implementation AWSLexButton

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"text",
             @"value" : @"value",
             };
}

@end

@implementation AWSLexDeleteSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botAlias" : @"botAlias",
             @"botName" : @"botName",
             @"userId" : @"userId",
             };
}

@end

@implementation AWSLexDeleteSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botAlias" : @"botAlias",
             @"botName" : @"botName",
             @"sessionId" : @"sessionId",
             @"userId" : @"userId",
             };
}

@end

@implementation AWSLexDialogAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fulfillmentState" : @"fulfillmentState",
             @"intentName" : @"intentName",
             @"message" : @"message",
             @"messageFormat" : @"messageFormat",
             @"slotToElicit" : @"slotToElicit",
             @"slots" : @"slots",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)fulfillmentStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Fulfilled"] == NSOrderedSame) {
            return @(AWSLexFulfillmentStateFulfilled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLexFulfillmentStateFailed);
        }
        if ([value caseInsensitiveCompare:@"ReadyForFulfillment"] == NSOrderedSame) {
            return @(AWSLexFulfillmentStateReadyForFulfillment);
        }
        return @(AWSLexFulfillmentStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexFulfillmentStateFulfilled:
                return @"Fulfilled";
            case AWSLexFulfillmentStateFailed:
                return @"Failed";
            case AWSLexFulfillmentStateReadyForFulfillment:
                return @"ReadyForFulfillment";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)messageFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PlainText"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypePlainText);
        }
        if ([value caseInsensitiveCompare:@"CustomPayload"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeCustomPayload);
        }
        if ([value caseInsensitiveCompare:@"SSML"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeSsml);
        }
        if ([value caseInsensitiveCompare:@"Composite"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeComposite);
        }
        return @(AWSLexMessageFormatTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexMessageFormatTypePlainText:
                return @"PlainText";
            case AWSLexMessageFormatTypeCustomPayload:
                return @"CustomPayload";
            case AWSLexMessageFormatTypeSsml:
                return @"SSML";
            case AWSLexMessageFormatTypeComposite:
                return @"Composite";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ElicitIntent"] == NSOrderedSame) {
            return @(AWSLexDialogActionTypeElicitIntent);
        }
        if ([value caseInsensitiveCompare:@"ConfirmIntent"] == NSOrderedSame) {
            return @(AWSLexDialogActionTypeConfirmIntent);
        }
        if ([value caseInsensitiveCompare:@"ElicitSlot"] == NSOrderedSame) {
            return @(AWSLexDialogActionTypeElicitSlot);
        }
        if ([value caseInsensitiveCompare:@"Close"] == NSOrderedSame) {
            return @(AWSLexDialogActionTypeClose);
        }
        if ([value caseInsensitiveCompare:@"Delegate"] == NSOrderedSame) {
            return @(AWSLexDialogActionTypeDelegate);
        }
        return @(AWSLexDialogActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexDialogActionTypeElicitIntent:
                return @"ElicitIntent";
            case AWSLexDialogActionTypeConfirmIntent:
                return @"ConfirmIntent";
            case AWSLexDialogActionTypeElicitSlot:
                return @"ElicitSlot";
            case AWSLexDialogActionTypeClose:
                return @"Close";
            case AWSLexDialogActionTypeDelegate:
                return @"Delegate";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexGenericAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentLinkUrl" : @"attachmentLinkUrl",
             @"buttons" : @"buttons",
             @"imageUrl" : @"imageUrl",
             @"subTitle" : @"subTitle",
             @"title" : @"title",
             };
}

+ (NSValueTransformer *)buttonsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexButton class]];
}

@end

@implementation AWSLexGetSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botAlias" : @"botAlias",
             @"botName" : @"botName",
             @"checkpointLabelFilter" : @"checkpointLabelFilter",
             @"userId" : @"userId",
             };
}

@end

@implementation AWSLexGetSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dialogAction" : @"dialogAction",
             @"recentIntentSummaryView" : @"recentIntentSummaryView",
             @"sessionAttributes" : @"sessionAttributes",
             @"sessionId" : @"sessionId",
             };
}

+ (NSValueTransformer *)dialogActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexDialogAction class]];
}

+ (NSValueTransformer *)recentIntentSummaryViewJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexIntentSummary class]];
}

@end

@implementation AWSLexIntentSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkpointLabel" : @"checkpointLabel",
             @"confirmationStatus" : @"confirmationStatus",
             @"dialogActionType" : @"dialogActionType",
             @"fulfillmentState" : @"fulfillmentState",
             @"intentName" : @"intentName",
             @"slotToElicit" : @"slotToElicit",
             @"slots" : @"slots",
             };
}

+ (NSValueTransformer *)confirmationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSLexConfirmationStatusNone);
        }
        if ([value caseInsensitiveCompare:@"Confirmed"] == NSOrderedSame) {
            return @(AWSLexConfirmationStatusConfirmed);
        }
        if ([value caseInsensitiveCompare:@"Denied"] == NSOrderedSame) {
            return @(AWSLexConfirmationStatusDenied);
        }
        return @(AWSLexConfirmationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexConfirmationStatusNone:
                return @"None";
            case AWSLexConfirmationStatusConfirmed:
                return @"Confirmed";
            case AWSLexConfirmationStatusDenied:
                return @"Denied";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dialogActionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ElicitIntent"] == NSOrderedSame) {
            return @(AWSLexDialogActionTypeElicitIntent);
        }
        if ([value caseInsensitiveCompare:@"ConfirmIntent"] == NSOrderedSame) {
            return @(AWSLexDialogActionTypeConfirmIntent);
        }
        if ([value caseInsensitiveCompare:@"ElicitSlot"] == NSOrderedSame) {
            return @(AWSLexDialogActionTypeElicitSlot);
        }
        if ([value caseInsensitiveCompare:@"Close"] == NSOrderedSame) {
            return @(AWSLexDialogActionTypeClose);
        }
        if ([value caseInsensitiveCompare:@"Delegate"] == NSOrderedSame) {
            return @(AWSLexDialogActionTypeDelegate);
        }
        return @(AWSLexDialogActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexDialogActionTypeElicitIntent:
                return @"ElicitIntent";
            case AWSLexDialogActionTypeConfirmIntent:
                return @"ConfirmIntent";
            case AWSLexDialogActionTypeElicitSlot:
                return @"ElicitSlot";
            case AWSLexDialogActionTypeClose:
                return @"Close";
            case AWSLexDialogActionTypeDelegate:
                return @"Delegate";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fulfillmentStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Fulfilled"] == NSOrderedSame) {
            return @(AWSLexFulfillmentStateFulfilled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLexFulfillmentStateFailed);
        }
        if ([value caseInsensitiveCompare:@"ReadyForFulfillment"] == NSOrderedSame) {
            return @(AWSLexFulfillmentStateReadyForFulfillment);
        }
        return @(AWSLexFulfillmentStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexFulfillmentStateFulfilled:
                return @"Fulfilled";
            case AWSLexFulfillmentStateFailed:
                return @"Failed";
            case AWSLexFulfillmentStateReadyForFulfillment:
                return @"ReadyForFulfillment";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexPostContentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accept" : @"accept",
             @"botAlias" : @"botAlias",
             @"botName" : @"botName",
             @"contentType" : @"contentType",
             @"inputStream" : @"inputStream",
             @"requestAttributes" : @"requestAttributes",
             @"sessionAttributes" : @"sessionAttributes",
             @"userId" : @"userId",
             };
}

@end

@implementation AWSLexPostContentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioStream" : @"audioStream",
             @"contentType" : @"contentType",
             @"dialogState" : @"dialogState",
             @"inputTranscript" : @"inputTranscript",
             @"intentName" : @"intentName",
             @"message" : @"message",
             @"messageFormat" : @"messageFormat",
             @"sentimentResponse" : @"sentimentResponse",
             @"sessionAttributes" : @"sessionAttributes",
             @"sessionId" : @"sessionId",
             @"slotToElicit" : @"slotToElicit",
             @"slots" : @"slots",
             };
}

+ (NSValueTransformer *)dialogStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ElicitIntent"] == NSOrderedSame) {
            return @(AWSLexDialogStateElicitIntent);
        }
        if ([value caseInsensitiveCompare:@"ConfirmIntent"] == NSOrderedSame) {
            return @(AWSLexDialogStateConfirmIntent);
        }
        if ([value caseInsensitiveCompare:@"ElicitSlot"] == NSOrderedSame) {
            return @(AWSLexDialogStateElicitSlot);
        }
        if ([value caseInsensitiveCompare:@"Fulfilled"] == NSOrderedSame) {
            return @(AWSLexDialogStateFulfilled);
        }
        if ([value caseInsensitiveCompare:@"ReadyForFulfillment"] == NSOrderedSame) {
            return @(AWSLexDialogStateReadyForFulfillment);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLexDialogStateFailed);
        }
        return @(AWSLexDialogStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexDialogStateElicitIntent:
                return @"ElicitIntent";
            case AWSLexDialogStateConfirmIntent:
                return @"ConfirmIntent";
            case AWSLexDialogStateElicitSlot:
                return @"ElicitSlot";
            case AWSLexDialogStateFulfilled:
                return @"Fulfilled";
            case AWSLexDialogStateReadyForFulfillment:
                return @"ReadyForFulfillment";
            case AWSLexDialogStateFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)messageFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PlainText"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypePlainText);
        }
        if ([value caseInsensitiveCompare:@"CustomPayload"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeCustomPayload);
        }
        if ([value caseInsensitiveCompare:@"SSML"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeSsml);
        }
        if ([value caseInsensitiveCompare:@"Composite"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeComposite);
        }
        return @(AWSLexMessageFormatTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexMessageFormatTypePlainText:
                return @"PlainText";
            case AWSLexMessageFormatTypeCustomPayload:
                return @"CustomPayload";
            case AWSLexMessageFormatTypeSsml:
                return @"SSML";
            case AWSLexMessageFormatTypeComposite:
                return @"Composite";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexPostTextRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botAlias" : @"botAlias",
             @"botName" : @"botName",
             @"inputText" : @"inputText",
             @"requestAttributes" : @"requestAttributes",
             @"sessionAttributes" : @"sessionAttributes",
             @"userId" : @"userId",
             };
}

@end

@implementation AWSLexPostTextResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dialogState" : @"dialogState",
             @"intentName" : @"intentName",
             @"message" : @"message",
             @"messageFormat" : @"messageFormat",
             @"responseCard" : @"responseCard",
             @"sentimentResponse" : @"sentimentResponse",
             @"sessionAttributes" : @"sessionAttributes",
             @"sessionId" : @"sessionId",
             @"slotToElicit" : @"slotToElicit",
             @"slots" : @"slots",
             };
}

+ (NSValueTransformer *)dialogStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ElicitIntent"] == NSOrderedSame) {
            return @(AWSLexDialogStateElicitIntent);
        }
        if ([value caseInsensitiveCompare:@"ConfirmIntent"] == NSOrderedSame) {
            return @(AWSLexDialogStateConfirmIntent);
        }
        if ([value caseInsensitiveCompare:@"ElicitSlot"] == NSOrderedSame) {
            return @(AWSLexDialogStateElicitSlot);
        }
        if ([value caseInsensitiveCompare:@"Fulfilled"] == NSOrderedSame) {
            return @(AWSLexDialogStateFulfilled);
        }
        if ([value caseInsensitiveCompare:@"ReadyForFulfillment"] == NSOrderedSame) {
            return @(AWSLexDialogStateReadyForFulfillment);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLexDialogStateFailed);
        }
        return @(AWSLexDialogStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexDialogStateElicitIntent:
                return @"ElicitIntent";
            case AWSLexDialogStateConfirmIntent:
                return @"ConfirmIntent";
            case AWSLexDialogStateElicitSlot:
                return @"ElicitSlot";
            case AWSLexDialogStateFulfilled:
                return @"Fulfilled";
            case AWSLexDialogStateReadyForFulfillment:
                return @"ReadyForFulfillment";
            case AWSLexDialogStateFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)messageFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PlainText"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypePlainText);
        }
        if ([value caseInsensitiveCompare:@"CustomPayload"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeCustomPayload);
        }
        if ([value caseInsensitiveCompare:@"SSML"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeSsml);
        }
        if ([value caseInsensitiveCompare:@"Composite"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeComposite);
        }
        return @(AWSLexMessageFormatTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexMessageFormatTypePlainText:
                return @"PlainText";
            case AWSLexMessageFormatTypeCustomPayload:
                return @"CustomPayload";
            case AWSLexMessageFormatTypeSsml:
                return @"SSML";
            case AWSLexMessageFormatTypeComposite:
                return @"Composite";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)responseCardJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexResponseCard class]];
}

+ (NSValueTransformer *)sentimentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexSentimentResponse class]];
}

@end

@implementation AWSLexPutSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accept" : @"accept",
             @"botAlias" : @"botAlias",
             @"botName" : @"botName",
             @"dialogAction" : @"dialogAction",
             @"recentIntentSummaryView" : @"recentIntentSummaryView",
             @"sessionAttributes" : @"sessionAttributes",
             @"userId" : @"userId",
             };
}

+ (NSValueTransformer *)dialogActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexDialogAction class]];
}

+ (NSValueTransformer *)recentIntentSummaryViewJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexIntentSummary class]];
}

@end

@implementation AWSLexPutSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioStream" : @"audioStream",
             @"contentType" : @"contentType",
             @"dialogState" : @"dialogState",
             @"intentName" : @"intentName",
             @"message" : @"message",
             @"messageFormat" : @"messageFormat",
             @"sessionAttributes" : @"sessionAttributes",
             @"sessionId" : @"sessionId",
             @"slotToElicit" : @"slotToElicit",
             @"slots" : @"slots",
             };
}

+ (NSValueTransformer *)dialogStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ElicitIntent"] == NSOrderedSame) {
            return @(AWSLexDialogStateElicitIntent);
        }
        if ([value caseInsensitiveCompare:@"ConfirmIntent"] == NSOrderedSame) {
            return @(AWSLexDialogStateConfirmIntent);
        }
        if ([value caseInsensitiveCompare:@"ElicitSlot"] == NSOrderedSame) {
            return @(AWSLexDialogStateElicitSlot);
        }
        if ([value caseInsensitiveCompare:@"Fulfilled"] == NSOrderedSame) {
            return @(AWSLexDialogStateFulfilled);
        }
        if ([value caseInsensitiveCompare:@"ReadyForFulfillment"] == NSOrderedSame) {
            return @(AWSLexDialogStateReadyForFulfillment);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLexDialogStateFailed);
        }
        return @(AWSLexDialogStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexDialogStateElicitIntent:
                return @"ElicitIntent";
            case AWSLexDialogStateConfirmIntent:
                return @"ConfirmIntent";
            case AWSLexDialogStateElicitSlot:
                return @"ElicitSlot";
            case AWSLexDialogStateFulfilled:
                return @"Fulfilled";
            case AWSLexDialogStateReadyForFulfillment:
                return @"ReadyForFulfillment";
            case AWSLexDialogStateFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)messageFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PlainText"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypePlainText);
        }
        if ([value caseInsensitiveCompare:@"CustomPayload"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeCustomPayload);
        }
        if ([value caseInsensitiveCompare:@"SSML"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeSsml);
        }
        if ([value caseInsensitiveCompare:@"Composite"] == NSOrderedSame) {
            return @(AWSLexMessageFormatTypeComposite);
        }
        return @(AWSLexMessageFormatTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexMessageFormatTypePlainText:
                return @"PlainText";
            case AWSLexMessageFormatTypeCustomPayload:
                return @"CustomPayload";
            case AWSLexMessageFormatTypeSsml:
                return @"SSML";
            case AWSLexMessageFormatTypeComposite:
                return @"Composite";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexResponseCard

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"contentType",
             @"genericAttachments" : @"genericAttachments",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)contentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"application/vnd.amazonaws.card.generic"] == NSOrderedSame) {
            return @(AWSLexContentTypeApplicationVndAmazonawsCardGeneric);
        }
        return @(AWSLexContentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexContentTypeApplicationVndAmazonawsCardGeneric:
                return @"application/vnd.amazonaws.card.generic";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)genericAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexGenericAttachment class]];
}

@end

@implementation AWSLexSentimentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sentimentLabel" : @"sentimentLabel",
             @"sentimentScore" : @"sentimentScore",
             };
}

@end
