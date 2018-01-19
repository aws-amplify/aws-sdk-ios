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

@implementation AWSLexPostContentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accept" : @"accept",
             @"botAlias" : @"botAlias",
             @"botName" : @"botName",
             @"contentType" : @"contentType",
             @"inputStream" : @"inputStream",
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
             @"sessionAttributes" : @"sessionAttributes",
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

@end

@implementation AWSLexPostTextRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botAlias" : @"botAlias",
             @"botName" : @"botName",
             @"inputText" : @"inputText",
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
             @"responseCard" : @"responseCard",
             @"sessionAttributes" : @"sessionAttributes",
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

+ (NSValueTransformer *)responseCardJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexResponseCard class]];
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
