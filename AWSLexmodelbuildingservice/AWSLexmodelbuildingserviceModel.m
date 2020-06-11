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

#import "AWSLexmodelbuildingserviceModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSLexmodelbuildingserviceErrorDomain = @"com.amazonaws.AWSLexmodelbuildingserviceErrorDomain";

@implementation AWSLexmodelbuildingserviceBotAliasMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botName" : @"botName",
             @"botVersion" : @"botVersion",
             @"checksum" : @"checksum",
             @"conversationLogs" : @"conversationLogs",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)conversationLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceConversationLogsResponse class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLexmodelbuildingserviceBotChannelAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botAlias" : @"botAlias",
             @"botConfiguration" : @"botConfiguration",
             @"botName" : @"botName",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"failureReason" : @"failureReason",
             @"name" : @"name",
             @"status" : @"status",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelStatusFailed);
        }
        return @(AWSLexmodelbuildingserviceChannelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceChannelStatusInProgress:
                return @"IN_PROGRESS";
            case AWSLexmodelbuildingserviceChannelStatusCreated:
                return @"CREATED";
            case AWSLexmodelbuildingserviceChannelStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Facebook"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelTypeFacebook);
        }
        if ([value caseInsensitiveCompare:@"Slack"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelTypeSlack);
        }
        if ([value caseInsensitiveCompare:@"Twilio-Sms"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelTypeTwilioSms);
        }
        if ([value caseInsensitiveCompare:@"Kik"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelTypeKik);
        }
        return @(AWSLexmodelbuildingserviceChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceChannelTypeFacebook:
                return @"Facebook";
            case AWSLexmodelbuildingserviceChannelTypeSlack:
                return @"Slack";
            case AWSLexmodelbuildingserviceChannelTypeTwilioSms:
                return @"Twilio-Sms";
            case AWSLexmodelbuildingserviceChannelTypeKik:
                return @"Kik";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceBotMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             @"status" : @"status",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILDING"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusBuilding);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusReady);
        }
        if ([value caseInsensitiveCompare:@"READY_BASIC_TESTING"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusReadyBasicTesting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"NOT_BUILT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusNotBuilt);
        }
        return @(AWSLexmodelbuildingserviceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceStatusBuilding:
                return @"BUILDING";
            case AWSLexmodelbuildingserviceStatusReady:
                return @"READY";
            case AWSLexmodelbuildingserviceStatusReadyBasicTesting:
                return @"READY_BASIC_TESTING";
            case AWSLexmodelbuildingserviceStatusFailed:
                return @"FAILED";
            case AWSLexmodelbuildingserviceStatusNotBuilt:
                return @"NOT_BUILT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceBuiltinIntentMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"signature" : @"signature",
             @"supportedLocales" : @"supportedLocales",
             };
}

@end

@implementation AWSLexmodelbuildingserviceBuiltinIntentSlot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSLexmodelbuildingserviceBuiltinSlotTypeMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"signature" : @"signature",
             @"supportedLocales" : @"supportedLocales",
             };
}

@end

@implementation AWSLexmodelbuildingserviceCodeHook

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageVersion" : @"messageVersion",
             @"uri" : @"uri",
             };
}

@end

@implementation AWSLexmodelbuildingserviceConversationLogsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iamRoleArn" : @"iamRoleArn",
             @"logSettings" : @"logSettings",
             };
}

+ (NSValueTransformer *)logSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceLogSettingsRequest class]];
}

@end

@implementation AWSLexmodelbuildingserviceConversationLogsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iamRoleArn" : @"iamRoleArn",
             @"logSettings" : @"logSettings",
             };
}

+ (NSValueTransformer *)logSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceLogSettingsResponse class]];
}

@end

@implementation AWSLexmodelbuildingserviceCreateBotVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"checksum",
             @"name" : @"name",
             };
}

@end

@implementation AWSLexmodelbuildingserviceCreateBotVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortStatement" : @"abortStatement",
             @"checksum" : @"checksum",
             @"childDirected" : @"childDirected",
             @"clarificationPrompt" : @"clarificationPrompt",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"detectSentiment" : @"detectSentiment",
             @"failureReason" : @"failureReason",
             @"idleSessionTTLInSeconds" : @"idleSessionTTLInSeconds",
             @"intents" : @"intents",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"locale" : @"locale",
             @"name" : @"name",
             @"status" : @"status",
             @"version" : @"version",
             @"voiceId" : @"voiceId",
             };
}

+ (NSValueTransformer *)abortStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)clarificationPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingservicePrompt class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)intentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceIntent class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)localeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleDeDE);
        }
        return @(AWSLexmodelbuildingserviceLocaleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceLocaleEnUS:
                return @"en-US";
            case AWSLexmodelbuildingserviceLocaleEnGB:
                return @"en-GB";
            case AWSLexmodelbuildingserviceLocaleDeDE:
                return @"de-DE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILDING"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusBuilding);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusReady);
        }
        if ([value caseInsensitiveCompare:@"READY_BASIC_TESTING"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusReadyBasicTesting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"NOT_BUILT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusNotBuilt);
        }
        return @(AWSLexmodelbuildingserviceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceStatusBuilding:
                return @"BUILDING";
            case AWSLexmodelbuildingserviceStatusReady:
                return @"READY";
            case AWSLexmodelbuildingserviceStatusReadyBasicTesting:
                return @"READY_BASIC_TESTING";
            case AWSLexmodelbuildingserviceStatusFailed:
                return @"FAILED";
            case AWSLexmodelbuildingserviceStatusNotBuilt:
                return @"NOT_BUILT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceCreateIntentVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"checksum",
             @"name" : @"name",
             };
}

@end

@implementation AWSLexmodelbuildingserviceCreateIntentVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"checksum",
             @"conclusionStatement" : @"conclusionStatement",
             @"confirmationPrompt" : @"confirmationPrompt",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"dialogCodeHook" : @"dialogCodeHook",
             @"followUpPrompt" : @"followUpPrompt",
             @"fulfillmentActivity" : @"fulfillmentActivity",
             @"kendraConfiguration" : @"kendraConfiguration",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             @"parentIntentSignature" : @"parentIntentSignature",
             @"rejectionStatement" : @"rejectionStatement",
             @"sampleUtterances" : @"sampleUtterances",
             @"slots" : @"slots",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)conclusionStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)confirmationPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingservicePrompt class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dialogCodeHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceCodeHook class]];
}

+ (NSValueTransformer *)followUpPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceFollowUpPrompt class]];
}

+ (NSValueTransformer *)fulfillmentActivityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceFulfillmentActivity class]];
}

+ (NSValueTransformer *)kendraConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceKendraConfiguration class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)rejectionStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)slotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceSlot class]];
}

@end

@implementation AWSLexmodelbuildingserviceCreateSlotTypeVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"checksum",
             @"name" : @"name",
             };
}

@end

@implementation AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"checksum",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"enumerationValues" : @"enumerationValues",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             @"parentSlotTypeSignature" : @"parentSlotTypeSignature",
             @"slotTypeConfigurations" : @"slotTypeConfigurations",
             @"valueSelectionStrategy" : @"valueSelectionStrategy",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)enumerationValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceEnumerationValue class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)slotTypeConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceSlotTypeConfiguration class]];
}

+ (NSValueTransformer *)valueSelectionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ORIGINAL_VALUE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyOriginalValue);
        }
        if ([value caseInsensitiveCompare:@"TOP_RESOLUTION"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyTopResolution);
        }
        return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceSlotValueSelectionStrategyOriginalValue:
                return @"ORIGINAL_VALUE";
            case AWSLexmodelbuildingserviceSlotValueSelectionStrategyTopResolution:
                return @"TOP_RESOLUTION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceDeleteBotAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botName" : @"botName",
             @"name" : @"name",
             };
}

@end

@implementation AWSLexmodelbuildingserviceDeleteBotChannelAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botAlias" : @"botAlias",
             @"botName" : @"botName",
             @"name" : @"name",
             };
}

@end

@implementation AWSLexmodelbuildingserviceDeleteBotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSLexmodelbuildingserviceDeleteBotVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"version" : @"version",
             };
}

@end

@implementation AWSLexmodelbuildingserviceDeleteIntentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSLexmodelbuildingserviceDeleteIntentVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"version" : @"version",
             };
}

@end

@implementation AWSLexmodelbuildingserviceDeleteSlotTypeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSLexmodelbuildingserviceDeleteSlotTypeVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"version" : @"version",
             };
}

@end

@implementation AWSLexmodelbuildingserviceDeleteUtterancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botName" : @"botName",
             @"userId" : @"userId",
             };
}

@end

@implementation AWSLexmodelbuildingserviceEnumerationValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"synonyms" : @"synonyms",
             @"value" : @"value",
             };
}

@end

@implementation AWSLexmodelbuildingserviceFollowUpPrompt

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prompt" : @"prompt",
             @"rejectionStatement" : @"rejectionStatement",
             };
}

+ (NSValueTransformer *)promptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingservicePrompt class]];
}

+ (NSValueTransformer *)rejectionStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

@end

@implementation AWSLexmodelbuildingserviceFulfillmentActivity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeHook" : @"codeHook",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)codeHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceCodeHook class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ReturnIntent"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceFulfillmentActivityTypeReturnIntent);
        }
        if ([value caseInsensitiveCompare:@"CodeHook"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceFulfillmentActivityTypeCodeHook);
        }
        return @(AWSLexmodelbuildingserviceFulfillmentActivityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceFulfillmentActivityTypeReturnIntent:
                return @"ReturnIntent";
            case AWSLexmodelbuildingserviceFulfillmentActivityTypeCodeHook:
                return @"CodeHook";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceGetBotAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botName" : @"botName",
             @"name" : @"name",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetBotAliasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botName" : @"botName",
             @"botVersion" : @"botVersion",
             @"checksum" : @"checksum",
             @"conversationLogs" : @"conversationLogs",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)conversationLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceConversationLogsResponse class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLexmodelbuildingserviceGetBotAliasesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botName" : @"botName",
             @"maxResults" : @"maxResults",
             @"nameContains" : @"nameContains",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetBotAliasesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botAliases" : @"BotAliases",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)botAliasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceBotAliasMetadata class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetBotChannelAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botAlias" : @"botAlias",
             @"botName" : @"botName",
             @"name" : @"name",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetBotChannelAssociationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botAlias" : @"botAlias",
             @"botConfiguration" : @"botConfiguration",
             @"botName" : @"botName",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"failureReason" : @"failureReason",
             @"name" : @"name",
             @"status" : @"status",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelStatusFailed);
        }
        return @(AWSLexmodelbuildingserviceChannelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceChannelStatusInProgress:
                return @"IN_PROGRESS";
            case AWSLexmodelbuildingserviceChannelStatusCreated:
                return @"CREATED";
            case AWSLexmodelbuildingserviceChannelStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Facebook"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelTypeFacebook);
        }
        if ([value caseInsensitiveCompare:@"Slack"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelTypeSlack);
        }
        if ([value caseInsensitiveCompare:@"Twilio-Sms"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelTypeTwilioSms);
        }
        if ([value caseInsensitiveCompare:@"Kik"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceChannelTypeKik);
        }
        return @(AWSLexmodelbuildingserviceChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceChannelTypeFacebook:
                return @"Facebook";
            case AWSLexmodelbuildingserviceChannelTypeSlack:
                return @"Slack";
            case AWSLexmodelbuildingserviceChannelTypeTwilioSms:
                return @"Twilio-Sms";
            case AWSLexmodelbuildingserviceChannelTypeKik:
                return @"Kik";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceGetBotChannelAssociationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botAlias" : @"botAlias",
             @"botName" : @"botName",
             @"maxResults" : @"maxResults",
             @"nameContains" : @"nameContains",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botChannelAssociations" : @"botChannelAssociations",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)botChannelAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceBotChannelAssociation class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetBotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"versionOrAlias" : @"versionOrAlias",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetBotResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortStatement" : @"abortStatement",
             @"checksum" : @"checksum",
             @"childDirected" : @"childDirected",
             @"clarificationPrompt" : @"clarificationPrompt",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"detectSentiment" : @"detectSentiment",
             @"failureReason" : @"failureReason",
             @"idleSessionTTLInSeconds" : @"idleSessionTTLInSeconds",
             @"intents" : @"intents",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"locale" : @"locale",
             @"name" : @"name",
             @"status" : @"status",
             @"version" : @"version",
             @"voiceId" : @"voiceId",
             };
}

+ (NSValueTransformer *)abortStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)clarificationPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingservicePrompt class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)intentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceIntent class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)localeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleDeDE);
        }
        return @(AWSLexmodelbuildingserviceLocaleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceLocaleEnUS:
                return @"en-US";
            case AWSLexmodelbuildingserviceLocaleEnGB:
                return @"en-GB";
            case AWSLexmodelbuildingserviceLocaleDeDE:
                return @"de-DE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILDING"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusBuilding);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusReady);
        }
        if ([value caseInsensitiveCompare:@"READY_BASIC_TESTING"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusReadyBasicTesting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"NOT_BUILT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusNotBuilt);
        }
        return @(AWSLexmodelbuildingserviceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceStatusBuilding:
                return @"BUILDING";
            case AWSLexmodelbuildingserviceStatusReady:
                return @"READY";
            case AWSLexmodelbuildingserviceStatusReadyBasicTesting:
                return @"READY_BASIC_TESTING";
            case AWSLexmodelbuildingserviceStatusFailed:
                return @"FAILED";
            case AWSLexmodelbuildingserviceStatusNotBuilt:
                return @"NOT_BUILT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceGetBotVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"name" : @"name",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetBotVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bots" : @"bots",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)botsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceBotMetadata class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetBotsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nameContains" : @"nameContains",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetBotsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bots" : @"bots",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)botsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceBotMetadata class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetBuiltinIntentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"signature" : @"signature",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetBuiltinIntentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"signature" : @"signature",
             @"slots" : @"slots",
             @"supportedLocales" : @"supportedLocales",
             };
}

+ (NSValueTransformer *)slotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceBuiltinIntentSlot class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetBuiltinIntentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"locale" : @"locale",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"signatureContains" : @"signatureContains",
             };
}

+ (NSValueTransformer *)localeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleDeDE);
        }
        return @(AWSLexmodelbuildingserviceLocaleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceLocaleEnUS:
                return @"en-US";
            case AWSLexmodelbuildingserviceLocaleEnGB:
                return @"en-GB";
            case AWSLexmodelbuildingserviceLocaleDeDE:
                return @"de-DE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceGetBuiltinIntentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intents" : @"intents",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)intentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceBuiltinIntentMetadata class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetBuiltinSlotTypesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"locale" : @"locale",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"signatureContains" : @"signatureContains",
             };
}

+ (NSValueTransformer *)localeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleDeDE);
        }
        return @(AWSLexmodelbuildingserviceLocaleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceLocaleEnUS:
                return @"en-US";
            case AWSLexmodelbuildingserviceLocaleEnGB:
                return @"en-GB";
            case AWSLexmodelbuildingserviceLocaleDeDE:
                return @"de-DE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"slotTypes" : @"slotTypes",
             };
}

+ (NSValueTransformer *)slotTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceBuiltinSlotTypeMetadata class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetExportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportType" : @"exportType",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)exportTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALEXA_SKILLS_KIT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceExportTypeAlexaSkillsKit);
        }
        if ([value caseInsensitiveCompare:@"LEX"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceExportTypeLex);
        }
        return @(AWSLexmodelbuildingserviceExportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceExportTypeAlexaSkillsKit:
                return @"ALEXA_SKILLS_KIT";
            case AWSLexmodelbuildingserviceExportTypeLex:
                return @"LEX";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeBot);
        }
        if ([value caseInsensitiveCompare:@"INTENT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeIntent);
        }
        if ([value caseInsensitiveCompare:@"SLOT_TYPE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeSlotType);
        }
        return @(AWSLexmodelbuildingserviceResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceResourceTypeBot:
                return @"BOT";
            case AWSLexmodelbuildingserviceResourceTypeIntent:
                return @"INTENT";
            case AWSLexmodelbuildingserviceResourceTypeSlotType:
                return @"SLOT_TYPE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceGetExportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportStatus" : @"exportStatus",
             @"exportType" : @"exportType",
             @"failureReason" : @"failureReason",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             @"url" : @"url",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)exportStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceExportStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceExportStatusReady);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceExportStatusFailed);
        }
        return @(AWSLexmodelbuildingserviceExportStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceExportStatusInProgress:
                return @"IN_PROGRESS";
            case AWSLexmodelbuildingserviceExportStatusReady:
                return @"READY";
            case AWSLexmodelbuildingserviceExportStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)exportTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALEXA_SKILLS_KIT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceExportTypeAlexaSkillsKit);
        }
        if ([value caseInsensitiveCompare:@"LEX"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceExportTypeLex);
        }
        return @(AWSLexmodelbuildingserviceExportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceExportTypeAlexaSkillsKit:
                return @"ALEXA_SKILLS_KIT";
            case AWSLexmodelbuildingserviceExportTypeLex:
                return @"LEX";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeBot);
        }
        if ([value caseInsensitiveCompare:@"INTENT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeIntent);
        }
        if ([value caseInsensitiveCompare:@"SLOT_TYPE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeSlotType);
        }
        return @(AWSLexmodelbuildingserviceResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceResourceTypeBot:
                return @"BOT";
            case AWSLexmodelbuildingserviceResourceTypeIntent:
                return @"INTENT";
            case AWSLexmodelbuildingserviceResourceTypeSlotType:
                return @"SLOT_TYPE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceGetImportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importId" : @"importId",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetImportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"createdDate",
             @"failureReason" : @"failureReason",
             @"importId" : @"importId",
             @"importStatus" : @"importStatus",
             @"mergeStrategy" : @"mergeStrategy",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)importStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceImportStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceImportStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceImportStatusFailed);
        }
        return @(AWSLexmodelbuildingserviceImportStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceImportStatusInProgress:
                return @"IN_PROGRESS";
            case AWSLexmodelbuildingserviceImportStatusComplete:
                return @"COMPLETE";
            case AWSLexmodelbuildingserviceImportStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mergeStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OVERWRITE_LATEST"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceMergeStrategyOverwriteLatest);
        }
        if ([value caseInsensitiveCompare:@"FAIL_ON_CONFLICT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceMergeStrategyFailOnConflict);
        }
        return @(AWSLexmodelbuildingserviceMergeStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceMergeStrategyOverwriteLatest:
                return @"OVERWRITE_LATEST";
            case AWSLexmodelbuildingserviceMergeStrategyFailOnConflict:
                return @"FAIL_ON_CONFLICT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeBot);
        }
        if ([value caseInsensitiveCompare:@"INTENT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeIntent);
        }
        if ([value caseInsensitiveCompare:@"SLOT_TYPE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeSlotType);
        }
        return @(AWSLexmodelbuildingserviceResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceResourceTypeBot:
                return @"BOT";
            case AWSLexmodelbuildingserviceResourceTypeIntent:
                return @"INTENT";
            case AWSLexmodelbuildingserviceResourceTypeSlotType:
                return @"SLOT_TYPE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceGetIntentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"version" : @"version",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetIntentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"checksum",
             @"conclusionStatement" : @"conclusionStatement",
             @"confirmationPrompt" : @"confirmationPrompt",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"dialogCodeHook" : @"dialogCodeHook",
             @"followUpPrompt" : @"followUpPrompt",
             @"fulfillmentActivity" : @"fulfillmentActivity",
             @"kendraConfiguration" : @"kendraConfiguration",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             @"parentIntentSignature" : @"parentIntentSignature",
             @"rejectionStatement" : @"rejectionStatement",
             @"sampleUtterances" : @"sampleUtterances",
             @"slots" : @"slots",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)conclusionStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)confirmationPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingservicePrompt class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dialogCodeHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceCodeHook class]];
}

+ (NSValueTransformer *)followUpPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceFollowUpPrompt class]];
}

+ (NSValueTransformer *)fulfillmentActivityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceFulfillmentActivity class]];
}

+ (NSValueTransformer *)kendraConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceKendraConfiguration class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)rejectionStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)slotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceSlot class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetIntentVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"name" : @"name",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetIntentVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intents" : @"intents",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)intentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceIntentMetadata class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetIntentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nameContains" : @"nameContains",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetIntentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intents" : @"intents",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)intentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceIntentMetadata class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetSlotTypeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"version" : @"version",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetSlotTypeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"checksum",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"enumerationValues" : @"enumerationValues",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             @"parentSlotTypeSignature" : @"parentSlotTypeSignature",
             @"slotTypeConfigurations" : @"slotTypeConfigurations",
             @"valueSelectionStrategy" : @"valueSelectionStrategy",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)enumerationValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceEnumerationValue class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)slotTypeConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceSlotTypeConfiguration class]];
}

+ (NSValueTransformer *)valueSelectionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ORIGINAL_VALUE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyOriginalValue);
        }
        if ([value caseInsensitiveCompare:@"TOP_RESOLUTION"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyTopResolution);
        }
        return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceSlotValueSelectionStrategyOriginalValue:
                return @"ORIGINAL_VALUE";
            case AWSLexmodelbuildingserviceSlotValueSelectionStrategyTopResolution:
                return @"TOP_RESOLUTION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceGetSlotTypeVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"name" : @"name",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"slotTypes" : @"slotTypes",
             };
}

+ (NSValueTransformer *)slotTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceSlotTypeMetadata class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetSlotTypesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nameContains" : @"nameContains",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLexmodelbuildingserviceGetSlotTypesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"slotTypes" : @"slotTypes",
             };
}

+ (NSValueTransformer *)slotTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceSlotTypeMetadata class]];
}

@end

@implementation AWSLexmodelbuildingserviceGetUtterancesViewRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botName" : @"botName",
             @"botVersions" : @"botVersions",
             @"statusType" : @"statusType",
             };
}

+ (NSValueTransformer *)statusTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Detected"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusTypeDetected);
        }
        if ([value caseInsensitiveCompare:@"Missed"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusTypeMissed);
        }
        return @(AWSLexmodelbuildingserviceStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceStatusTypeDetected:
                return @"Detected";
            case AWSLexmodelbuildingserviceStatusTypeMissed:
                return @"Missed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceGetUtterancesViewResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botName" : @"botName",
             @"utterances" : @"utterances",
             };
}

+ (NSValueTransformer *)utterancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceUtteranceList class]];
}

@end

@implementation AWSLexmodelbuildingserviceIntent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intentName" : @"intentName",
             @"intentVersion" : @"intentVersion",
             };
}

@end

@implementation AWSLexmodelbuildingserviceIntentMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLexmodelbuildingserviceKendraConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kendraIndex" : @"kendraIndex",
             @"queryFilterString" : @"queryFilterString",
             @"role" : @"role",
             };
}

@end

@implementation AWSLexmodelbuildingserviceListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSLexmodelbuildingserviceListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceTag class]];
}

@end

@implementation AWSLexmodelbuildingserviceLogSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"destination",
             @"kmsKeyArn" : @"kmsKeyArn",
             @"logType" : @"logType",
             @"resourceArn" : @"resourceArn",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLOUDWATCH_LOGS"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceDestinationCloudwatchLogs);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceDestinationS3);
        }
        return @(AWSLexmodelbuildingserviceDestinationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceDestinationCloudwatchLogs:
                return @"CLOUDWATCH_LOGS";
            case AWSLexmodelbuildingserviceDestinationS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)logTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUDIO"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLogTypeAudio);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLogTypeText);
        }
        return @(AWSLexmodelbuildingserviceLogTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceLogTypeAudio:
                return @"AUDIO";
            case AWSLexmodelbuildingserviceLogTypeText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceLogSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"destination",
             @"kmsKeyArn" : @"kmsKeyArn",
             @"logType" : @"logType",
             @"resourceArn" : @"resourceArn",
             @"resourcePrefix" : @"resourcePrefix",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLOUDWATCH_LOGS"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceDestinationCloudwatchLogs);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceDestinationS3);
        }
        return @(AWSLexmodelbuildingserviceDestinationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceDestinationCloudwatchLogs:
                return @"CLOUDWATCH_LOGS";
            case AWSLexmodelbuildingserviceDestinationS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)logTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUDIO"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLogTypeAudio);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLogTypeText);
        }
        return @(AWSLexmodelbuildingserviceLogTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceLogTypeAudio:
                return @"AUDIO";
            case AWSLexmodelbuildingserviceLogTypeText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"content",
             @"contentType" : @"contentType",
             @"groupNumber" : @"groupNumber",
             };
}

+ (NSValueTransformer *)contentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PlainText"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceContentTypePlainText);
        }
        if ([value caseInsensitiveCompare:@"SSML"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceContentTypeSsml);
        }
        if ([value caseInsensitiveCompare:@"CustomPayload"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceContentTypeCustomPayload);
        }
        return @(AWSLexmodelbuildingserviceContentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceContentTypePlainText:
                return @"PlainText";
            case AWSLexmodelbuildingserviceContentTypeSsml:
                return @"SSML";
            case AWSLexmodelbuildingserviceContentTypeCustomPayload:
                return @"CustomPayload";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingservicePrompt

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxAttempts" : @"maxAttempts",
             @"messages" : @"messages",
             @"responseCard" : @"responseCard",
             };
}

+ (NSValueTransformer *)messagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceMessage class]];
}

@end

@implementation AWSLexmodelbuildingservicePutBotAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botName" : @"botName",
             @"botVersion" : @"botVersion",
             @"checksum" : @"checksum",
             @"conversationLogs" : @"conversationLogs",
             @"detail" : @"description",
             @"name" : @"name",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)conversationLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceConversationLogsRequest class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceTag class]];
}

@end

@implementation AWSLexmodelbuildingservicePutBotAliasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botName" : @"botName",
             @"botVersion" : @"botVersion",
             @"checksum" : @"checksum",
             @"conversationLogs" : @"conversationLogs",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)conversationLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceConversationLogsResponse class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceTag class]];
}

@end

@implementation AWSLexmodelbuildingservicePutBotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortStatement" : @"abortStatement",
             @"checksum" : @"checksum",
             @"childDirected" : @"childDirected",
             @"clarificationPrompt" : @"clarificationPrompt",
             @"createVersion" : @"createVersion",
             @"detail" : @"description",
             @"detectSentiment" : @"detectSentiment",
             @"idleSessionTTLInSeconds" : @"idleSessionTTLInSeconds",
             @"intents" : @"intents",
             @"locale" : @"locale",
             @"name" : @"name",
             @"processBehavior" : @"processBehavior",
             @"tags" : @"tags",
             @"voiceId" : @"voiceId",
             };
}

+ (NSValueTransformer *)abortStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)clarificationPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingservicePrompt class]];
}

+ (NSValueTransformer *)intentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceIntent class]];
}

+ (NSValueTransformer *)localeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleDeDE);
        }
        return @(AWSLexmodelbuildingserviceLocaleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceLocaleEnUS:
                return @"en-US";
            case AWSLexmodelbuildingserviceLocaleEnGB:
                return @"en-GB";
            case AWSLexmodelbuildingserviceLocaleDeDE:
                return @"de-DE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAVE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceProcessBehaviorSave);
        }
        if ([value caseInsensitiveCompare:@"BUILD"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceProcessBehaviorBuild);
        }
        return @(AWSLexmodelbuildingserviceProcessBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceProcessBehaviorSave:
                return @"SAVE";
            case AWSLexmodelbuildingserviceProcessBehaviorBuild:
                return @"BUILD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceTag class]];
}

@end

@implementation AWSLexmodelbuildingservicePutBotResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortStatement" : @"abortStatement",
             @"checksum" : @"checksum",
             @"childDirected" : @"childDirected",
             @"clarificationPrompt" : @"clarificationPrompt",
             @"createVersion" : @"createVersion",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"detectSentiment" : @"detectSentiment",
             @"failureReason" : @"failureReason",
             @"idleSessionTTLInSeconds" : @"idleSessionTTLInSeconds",
             @"intents" : @"intents",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"locale" : @"locale",
             @"name" : @"name",
             @"status" : @"status",
             @"tags" : @"tags",
             @"version" : @"version",
             @"voiceId" : @"voiceId",
             };
}

+ (NSValueTransformer *)abortStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)clarificationPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingservicePrompt class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)intentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceIntent class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)localeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceLocaleDeDE);
        }
        return @(AWSLexmodelbuildingserviceLocaleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceLocaleEnUS:
                return @"en-US";
            case AWSLexmodelbuildingserviceLocaleEnGB:
                return @"en-GB";
            case AWSLexmodelbuildingserviceLocaleDeDE:
                return @"de-DE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILDING"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusBuilding);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusReady);
        }
        if ([value caseInsensitiveCompare:@"READY_BASIC_TESTING"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusReadyBasicTesting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"NOT_BUILT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceStatusNotBuilt);
        }
        return @(AWSLexmodelbuildingserviceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceStatusBuilding:
                return @"BUILDING";
            case AWSLexmodelbuildingserviceStatusReady:
                return @"READY";
            case AWSLexmodelbuildingserviceStatusReadyBasicTesting:
                return @"READY_BASIC_TESTING";
            case AWSLexmodelbuildingserviceStatusFailed:
                return @"FAILED";
            case AWSLexmodelbuildingserviceStatusNotBuilt:
                return @"NOT_BUILT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceTag class]];
}

@end

@implementation AWSLexmodelbuildingservicePutIntentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"checksum",
             @"conclusionStatement" : @"conclusionStatement",
             @"confirmationPrompt" : @"confirmationPrompt",
             @"createVersion" : @"createVersion",
             @"detail" : @"description",
             @"dialogCodeHook" : @"dialogCodeHook",
             @"followUpPrompt" : @"followUpPrompt",
             @"fulfillmentActivity" : @"fulfillmentActivity",
             @"kendraConfiguration" : @"kendraConfiguration",
             @"name" : @"name",
             @"parentIntentSignature" : @"parentIntentSignature",
             @"rejectionStatement" : @"rejectionStatement",
             @"sampleUtterances" : @"sampleUtterances",
             @"slots" : @"slots",
             };
}

+ (NSValueTransformer *)conclusionStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)confirmationPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingservicePrompt class]];
}

+ (NSValueTransformer *)dialogCodeHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceCodeHook class]];
}

+ (NSValueTransformer *)followUpPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceFollowUpPrompt class]];
}

+ (NSValueTransformer *)fulfillmentActivityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceFulfillmentActivity class]];
}

+ (NSValueTransformer *)kendraConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceKendraConfiguration class]];
}

+ (NSValueTransformer *)rejectionStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)slotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceSlot class]];
}

@end

@implementation AWSLexmodelbuildingservicePutIntentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"checksum",
             @"conclusionStatement" : @"conclusionStatement",
             @"confirmationPrompt" : @"confirmationPrompt",
             @"createVersion" : @"createVersion",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"dialogCodeHook" : @"dialogCodeHook",
             @"followUpPrompt" : @"followUpPrompt",
             @"fulfillmentActivity" : @"fulfillmentActivity",
             @"kendraConfiguration" : @"kendraConfiguration",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             @"parentIntentSignature" : @"parentIntentSignature",
             @"rejectionStatement" : @"rejectionStatement",
             @"sampleUtterances" : @"sampleUtterances",
             @"slots" : @"slots",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)conclusionStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)confirmationPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingservicePrompt class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dialogCodeHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceCodeHook class]];
}

+ (NSValueTransformer *)followUpPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceFollowUpPrompt class]];
}

+ (NSValueTransformer *)fulfillmentActivityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceFulfillmentActivity class]];
}

+ (NSValueTransformer *)kendraConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceKendraConfiguration class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)rejectionStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceStatement class]];
}

+ (NSValueTransformer *)slotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceSlot class]];
}

@end

@implementation AWSLexmodelbuildingservicePutSlotTypeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"checksum",
             @"createVersion" : @"createVersion",
             @"detail" : @"description",
             @"enumerationValues" : @"enumerationValues",
             @"name" : @"name",
             @"parentSlotTypeSignature" : @"parentSlotTypeSignature",
             @"slotTypeConfigurations" : @"slotTypeConfigurations",
             @"valueSelectionStrategy" : @"valueSelectionStrategy",
             };
}

+ (NSValueTransformer *)enumerationValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceEnumerationValue class]];
}

+ (NSValueTransformer *)slotTypeConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceSlotTypeConfiguration class]];
}

+ (NSValueTransformer *)valueSelectionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ORIGINAL_VALUE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyOriginalValue);
        }
        if ([value caseInsensitiveCompare:@"TOP_RESOLUTION"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyTopResolution);
        }
        return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceSlotValueSelectionStrategyOriginalValue:
                return @"ORIGINAL_VALUE";
            case AWSLexmodelbuildingserviceSlotValueSelectionStrategyTopResolution:
                return @"TOP_RESOLUTION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingservicePutSlotTypeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"checksum",
             @"createVersion" : @"createVersion",
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"enumerationValues" : @"enumerationValues",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             @"parentSlotTypeSignature" : @"parentSlotTypeSignature",
             @"slotTypeConfigurations" : @"slotTypeConfigurations",
             @"valueSelectionStrategy" : @"valueSelectionStrategy",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)enumerationValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceEnumerationValue class]];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)slotTypeConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceSlotTypeConfiguration class]];
}

+ (NSValueTransformer *)valueSelectionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ORIGINAL_VALUE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyOriginalValue);
        }
        if ([value caseInsensitiveCompare:@"TOP_RESOLUTION"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyTopResolution);
        }
        return @(AWSLexmodelbuildingserviceSlotValueSelectionStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceSlotValueSelectionStrategyOriginalValue:
                return @"ORIGINAL_VALUE";
            case AWSLexmodelbuildingserviceSlotValueSelectionStrategyTopResolution:
                return @"TOP_RESOLUTION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLexmodelbuildingserviceResourceReference

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"version" : @"version",
             };
}

@end

@implementation AWSLexmodelbuildingserviceSlot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"name" : @"name",
             @"obfuscationSetting" : @"obfuscationSetting",
             @"priority" : @"priority",
             @"responseCard" : @"responseCard",
             @"sampleUtterances" : @"sampleUtterances",
             @"slotConstraint" : @"slotConstraint",
             @"slotType" : @"slotType",
             @"slotTypeVersion" : @"slotTypeVersion",
             @"valueElicitationPrompt" : @"valueElicitationPrompt",
             };
}

+ (NSValueTransformer *)obfuscationSettingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceObfuscationSettingNone);
        }
        if ([value caseInsensitiveCompare:@"DEFAULT_OBFUSCATION"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceObfuscationSettingDefaultObfuscation);
        }
        return @(AWSLexmodelbuildingserviceObfuscationSettingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceObfuscationSettingNone:
                return @"NONE";
            case AWSLexmodelbuildingserviceObfuscationSettingDefaultObfuscation:
                return @"DEFAULT_OBFUSCATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)slotConstraintJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Required"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceSlotConstraintRequired);
        }
        if ([value caseInsensitiveCompare:@"Optional"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceSlotConstraintOptional);
        }
        return @(AWSLexmodelbuildingserviceSlotConstraintUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceSlotConstraintRequired:
                return @"Required";
            case AWSLexmodelbuildingserviceSlotConstraintOptional:
                return @"Optional";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)valueElicitationPromptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingservicePrompt class]];
}

@end

@implementation AWSLexmodelbuildingserviceSlotTypeConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regexConfiguration" : @"regexConfiguration",
             };
}

+ (NSValueTransformer *)regexConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLexmodelbuildingserviceSlotTypeRegexConfiguration class]];
}

@end

@implementation AWSLexmodelbuildingserviceSlotTypeMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"createdDate",
             @"detail" : @"description",
             @"lastUpdatedDate" : @"lastUpdatedDate",
             @"name" : @"name",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLexmodelbuildingserviceSlotTypeRegexConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pattern" : @"pattern",
             };
}

@end

@implementation AWSLexmodelbuildingserviceStartImportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mergeStrategy" : @"mergeStrategy",
             @"payload" : @"payload",
             @"resourceType" : @"resourceType",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)mergeStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OVERWRITE_LATEST"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceMergeStrategyOverwriteLatest);
        }
        if ([value caseInsensitiveCompare:@"FAIL_ON_CONFLICT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceMergeStrategyFailOnConflict);
        }
        return @(AWSLexmodelbuildingserviceMergeStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceMergeStrategyOverwriteLatest:
                return @"OVERWRITE_LATEST";
            case AWSLexmodelbuildingserviceMergeStrategyFailOnConflict:
                return @"FAIL_ON_CONFLICT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeBot);
        }
        if ([value caseInsensitiveCompare:@"INTENT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeIntent);
        }
        if ([value caseInsensitiveCompare:@"SLOT_TYPE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeSlotType);
        }
        return @(AWSLexmodelbuildingserviceResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceResourceTypeBot:
                return @"BOT";
            case AWSLexmodelbuildingserviceResourceTypeIntent:
                return @"INTENT";
            case AWSLexmodelbuildingserviceResourceTypeSlotType:
                return @"SLOT_TYPE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceTag class]];
}

@end

@implementation AWSLexmodelbuildingserviceStartImportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"createdDate",
             @"importId" : @"importId",
             @"importStatus" : @"importStatus",
             @"mergeStrategy" : @"mergeStrategy",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)importStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceImportStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceImportStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceImportStatusFailed);
        }
        return @(AWSLexmodelbuildingserviceImportStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceImportStatusInProgress:
                return @"IN_PROGRESS";
            case AWSLexmodelbuildingserviceImportStatusComplete:
                return @"COMPLETE";
            case AWSLexmodelbuildingserviceImportStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mergeStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OVERWRITE_LATEST"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceMergeStrategyOverwriteLatest);
        }
        if ([value caseInsensitiveCompare:@"FAIL_ON_CONFLICT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceMergeStrategyFailOnConflict);
        }
        return @(AWSLexmodelbuildingserviceMergeStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceMergeStrategyOverwriteLatest:
                return @"OVERWRITE_LATEST";
            case AWSLexmodelbuildingserviceMergeStrategyFailOnConflict:
                return @"FAIL_ON_CONFLICT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeBot);
        }
        if ([value caseInsensitiveCompare:@"INTENT"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeIntent);
        }
        if ([value caseInsensitiveCompare:@"SLOT_TYPE"] == NSOrderedSame) {
            return @(AWSLexmodelbuildingserviceResourceTypeSlotType);
        }
        return @(AWSLexmodelbuildingserviceResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLexmodelbuildingserviceResourceTypeBot:
                return @"BOT";
            case AWSLexmodelbuildingserviceResourceTypeIntent:
                return @"INTENT";
            case AWSLexmodelbuildingserviceResourceTypeSlotType:
                return @"SLOT_TYPE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceTag class]];
}

@end

@implementation AWSLexmodelbuildingserviceStatement

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messages" : @"messages",
             @"responseCard" : @"responseCard",
             };
}

+ (NSValueTransformer *)messagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceMessage class]];
}

@end

@implementation AWSLexmodelbuildingserviceTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSLexmodelbuildingserviceTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceTag class]];
}

@end

@implementation AWSLexmodelbuildingserviceTagResourceResponse

@end

@implementation AWSLexmodelbuildingserviceUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSLexmodelbuildingserviceUntagResourceResponse

@end

@implementation AWSLexmodelbuildingserviceUtteranceData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"count",
             @"distinctUsers" : @"distinctUsers",
             @"firstUtteredDate" : @"firstUtteredDate",
             @"lastUtteredDate" : @"lastUtteredDate",
             @"utteranceString" : @"utteranceString",
             };
}

+ (NSValueTransformer *)firstUtteredDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUtteredDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLexmodelbuildingserviceUtteranceList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botVersion" : @"botVersion",
             @"utterances" : @"utterances",
             };
}

+ (NSValueTransformer *)utterancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLexmodelbuildingserviceUtteranceData class]];
}

@end
