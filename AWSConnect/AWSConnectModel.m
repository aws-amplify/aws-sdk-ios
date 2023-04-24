//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSConnectModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSConnectErrorDomain = @"com.amazonaws.AWSConnectErrorDomain";

@implementation AWSConnectActionSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionType" : @"ActionType",
             };
}

+ (NSValueTransformer *)actionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_TASK"] == NSOrderedSame) {
            return @(AWSConnectActionTypeCreateTask);
        }
        if ([value caseInsensitiveCompare:@"ASSIGN_CONTACT_CATEGORY"] == NSOrderedSame) {
            return @(AWSConnectActionTypeAssignContactCategory);
        }
        if ([value caseInsensitiveCompare:@"GENERATE_EVENTBRIDGE_EVENT"] == NSOrderedSame) {
            return @(AWSConnectActionTypeGenerateEventbridgeEvent);
        }
        if ([value caseInsensitiveCompare:@"SEND_NOTIFICATION"] == NSOrderedSame) {
            return @(AWSConnectActionTypeSendNotification);
        }
        return @(AWSConnectActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectActionTypeCreateTask:
                return @"CREATE_TASK";
            case AWSConnectActionTypeAssignContactCategory:
                return @"ASSIGN_CONTACT_CATEGORY";
            case AWSConnectActionTypeGenerateEventbridgeEvent:
                return @"GENERATE_EVENTBRIDGE_EVENT";
            case AWSConnectActionTypeSendNotification:
                return @"SEND_NOTIFICATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectAgentContactReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"agentContactState" : @"AgentContactState",
             @"channel" : @"Channel",
             @"connectedToAgentTimestamp" : @"ConnectedToAgentTimestamp",
             @"contactId" : @"ContactId",
             @"initiationMethod" : @"InitiationMethod",
             @"queue" : @"Queue",
             @"stateStartTimestamp" : @"StateStartTimestamp",
             };
}

+ (NSValueTransformer *)agentContactStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCOMING"] == NSOrderedSame) {
            return @(AWSConnectContactStateIncoming);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSConnectContactStatePending);
        }
        if ([value caseInsensitiveCompare:@"CONNECTING"] == NSOrderedSame) {
            return @(AWSConnectContactStateConnecting);
        }
        if ([value caseInsensitiveCompare:@"CONNECTED"] == NSOrderedSame) {
            return @(AWSConnectContactStateConnected);
        }
        if ([value caseInsensitiveCompare:@"CONNECTED_ONHOLD"] == NSOrderedSame) {
            return @(AWSConnectContactStateConnectedOnhold);
        }
        if ([value caseInsensitiveCompare:@"MISSED"] == NSOrderedSame) {
            return @(AWSConnectContactStateMissed);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSConnectContactStateError);
        }
        if ([value caseInsensitiveCompare:@"ENDED"] == NSOrderedSame) {
            return @(AWSConnectContactStateEnded);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSConnectContactStateRejected);
        }
        return @(AWSConnectContactStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactStateIncoming:
                return @"INCOMING";
            case AWSConnectContactStatePending:
                return @"PENDING";
            case AWSConnectContactStateConnecting:
                return @"CONNECTING";
            case AWSConnectContactStateConnected:
                return @"CONNECTED";
            case AWSConnectContactStateConnectedOnhold:
                return @"CONNECTED_ONHOLD";
            case AWSConnectContactStateMissed:
                return @"MISSED";
            case AWSConnectContactStateError:
                return @"ERROR";
            case AWSConnectContactStateEnded:
                return @"ENDED";
            case AWSConnectContactStateRejected:
                return @"REJECTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSConnectChannelVoice);
        }
        if ([value caseInsensitiveCompare:@"CHAT"] == NSOrderedSame) {
            return @(AWSConnectChannelChat);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSConnectChannelTask);
        }
        return @(AWSConnectChannelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectChannelVoice:
                return @"VOICE";
            case AWSConnectChannelChat:
                return @"CHAT";
            case AWSConnectChannelTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)connectedToAgentTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)initiationMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INBOUND"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodInbound);
        }
        if ([value caseInsensitiveCompare:@"OUTBOUND"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodOutbound);
        }
        if ([value caseInsensitiveCompare:@"TRANSFER"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodTransfer);
        }
        if ([value caseInsensitiveCompare:@"QUEUE_TRANSFER"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodQueueTransfer);
        }
        if ([value caseInsensitiveCompare:@"CALLBACK"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodCallback);
        }
        if ([value caseInsensitiveCompare:@"API"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodApi);
        }
        if ([value caseInsensitiveCompare:@"DISCONNECT"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodDisconnect);
        }
        if ([value caseInsensitiveCompare:@"MONITOR"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodMonitor);
        }
        return @(AWSConnectContactInitiationMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactInitiationMethodInbound:
                return @"INBOUND";
            case AWSConnectContactInitiationMethodOutbound:
                return @"OUTBOUND";
            case AWSConnectContactInitiationMethodTransfer:
                return @"TRANSFER";
            case AWSConnectContactInitiationMethodQueueTransfer:
                return @"QUEUE_TRANSFER";
            case AWSConnectContactInitiationMethodCallback:
                return @"CALLBACK";
            case AWSConnectContactInitiationMethodApi:
                return @"API";
            case AWSConnectContactInitiationMethodDisconnect:
                return @"DISCONNECT";
            case AWSConnectContactInitiationMethodMonitor:
                return @"MONITOR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)queueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQueueReference class]];
}

+ (NSValueTransformer *)stateStartTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSConnectAgentInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectedToAgentTimestamp" : @"ConnectedToAgentTimestamp",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)connectedToAgentTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSConnectAgentStatus

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"agentStatusARN" : @"AgentStatusARN",
             @"agentStatusId" : @"AgentStatusId",
             @"detail" : @"Description",
             @"displayOrder" : @"DisplayOrder",
             @"name" : @"Name",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusStateDisabled);
        }
        return @(AWSConnectAgentStatusStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectAgentStatusStateEnabled:
                return @"ENABLED";
            case AWSConnectAgentStatusStateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ROUTABLE"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusTypeRoutable);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"OFFLINE"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusTypeOffline);
        }
        return @(AWSConnectAgentStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectAgentStatusTypeRoutable:
                return @"ROUTABLE";
            case AWSConnectAgentStatusTypeCustom:
                return @"CUSTOM";
            case AWSConnectAgentStatusTypeOffline:
                return @"OFFLINE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectAgentStatusReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statusArn" : @"StatusArn",
             @"statusName" : @"StatusName",
             @"statusStartTimestamp" : @"StatusStartTimestamp",
             };
}

+ (NSValueTransformer *)statusStartTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSConnectAgentStatusSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ROUTABLE"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusTypeRoutable);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"OFFLINE"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusTypeOffline);
        }
        return @(AWSConnectAgentStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectAgentStatusTypeRoutable:
                return @"ROUTABLE";
            case AWSConnectAgentStatusTypeCustom:
                return @"CUSTOM";
            case AWSConnectAgentStatusTypeOffline:
                return @"OFFLINE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectAnswerMachineDetectionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awaitAnswerMachinePrompt" : @"AwaitAnswerMachinePrompt",
             @"enableAnswerMachineDetection" : @"EnableAnswerMachineDetection",
             };
}

@end

@implementation AWSConnectAssignContactCategoryActionDefinition

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectAssociateApprovedOriginRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"origin" : @"Origin",
             };
}

@end

@implementation AWSConnectAssociateBotRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"lexBot" : @"LexBot",
             @"lexV2Bot" : @"LexV2Bot",
             };
}

+ (NSValueTransformer *)lexBotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectLexBot class]];
}

+ (NSValueTransformer *)lexV2BotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectLexV2Bot class]];
}

@end

@implementation AWSConnectAssociateDefaultVocabularyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"languageCode" : @"LanguageCode",
             @"vocabularyId" : @"VocabularyId",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"en-NZ"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnNZ);
        }
        if ([value caseInsensitiveCompare:@"en-ZA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnZA);
        }
        return @(AWSConnectVocabularyLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyLanguageCodeArAE:
                return @"ar-AE";
            case AWSConnectVocabularyLanguageCodeDeCH:
                return @"de-CH";
            case AWSConnectVocabularyLanguageCodeDeDE:
                return @"de-DE";
            case AWSConnectVocabularyLanguageCodeEnAB:
                return @"en-AB";
            case AWSConnectVocabularyLanguageCodeEnAU:
                return @"en-AU";
            case AWSConnectVocabularyLanguageCodeEnGB:
                return @"en-GB";
            case AWSConnectVocabularyLanguageCodeEnIE:
                return @"en-IE";
            case AWSConnectVocabularyLanguageCodeEnIN:
                return @"en-IN";
            case AWSConnectVocabularyLanguageCodeEnUS:
                return @"en-US";
            case AWSConnectVocabularyLanguageCodeEnWL:
                return @"en-WL";
            case AWSConnectVocabularyLanguageCodeEsES:
                return @"es-ES";
            case AWSConnectVocabularyLanguageCodeEsUS:
                return @"es-US";
            case AWSConnectVocabularyLanguageCodeFrCA:
                return @"fr-CA";
            case AWSConnectVocabularyLanguageCodeFrFR:
                return @"fr-FR";
            case AWSConnectVocabularyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSConnectVocabularyLanguageCodeItIT:
                return @"it-IT";
            case AWSConnectVocabularyLanguageCodeJaJP:
                return @"ja-JP";
            case AWSConnectVocabularyLanguageCodeKoKR:
                return @"ko-KR";
            case AWSConnectVocabularyLanguageCodePtBR:
                return @"pt-BR";
            case AWSConnectVocabularyLanguageCodePtPT:
                return @"pt-PT";
            case AWSConnectVocabularyLanguageCodeZhCN:
                return @"zh-CN";
            case AWSConnectVocabularyLanguageCodeEnNZ:
                return @"en-NZ";
            case AWSConnectVocabularyLanguageCodeEnZA:
                return @"en-ZA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectAssociateDefaultVocabularyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectAssociateInstanceStorageConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"resourceType" : @"ResourceType",
             @"storageConfig" : @"StorageConfig",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHAT_TRANSCRIPTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeChatTranscripts);
        }
        if ([value caseInsensitiveCompare:@"CALL_RECORDINGS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeCallRecordings);
        }
        if ([value caseInsensitiveCompare:@"SCHEDULED_REPORTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeScheduledReports);
        }
        if ([value caseInsensitiveCompare:@"MEDIA_STREAMS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeMediaStreams);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_TRACE_RECORDS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeContactTraceRecords);
        }
        if ([value caseInsensitiveCompare:@"AGENT_EVENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeAgentEvents);
        }
        if ([value caseInsensitiveCompare:@"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeRealTimeContactAnalysisSegments);
        }
        if ([value caseInsensitiveCompare:@"ATTACHMENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeAttachments);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_EVALUATIONS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeContactEvaluations);
        }
        return @(AWSConnectInstanceStorageResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectInstanceStorageResourceTypeChatTranscripts:
                return @"CHAT_TRANSCRIPTS";
            case AWSConnectInstanceStorageResourceTypeCallRecordings:
                return @"CALL_RECORDINGS";
            case AWSConnectInstanceStorageResourceTypeScheduledReports:
                return @"SCHEDULED_REPORTS";
            case AWSConnectInstanceStorageResourceTypeMediaStreams:
                return @"MEDIA_STREAMS";
            case AWSConnectInstanceStorageResourceTypeContactTraceRecords:
                return @"CONTACT_TRACE_RECORDS";
            case AWSConnectInstanceStorageResourceTypeAgentEvents:
                return @"AGENT_EVENTS";
            case AWSConnectInstanceStorageResourceTypeRealTimeContactAnalysisSegments:
                return @"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS";
            case AWSConnectInstanceStorageResourceTypeAttachments:
                return @"ATTACHMENTS";
            case AWSConnectInstanceStorageResourceTypeContactEvaluations:
                return @"CONTACT_EVALUATIONS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectInstanceStorageConfig class]];
}

@end

@implementation AWSConnectAssociateInstanceStorageConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             };
}

@end

@implementation AWSConnectAssociateLambdaFunctionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionArn" : @"FunctionArn",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectAssociateLexBotRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"lexBot" : @"LexBot",
             };
}

+ (NSValueTransformer *)lexBotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectLexBot class]];
}

@end

@implementation AWSConnectAssociatePhoneNumberContactFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowId" : @"ContactFlowId",
             @"instanceId" : @"InstanceId",
             @"phoneNumberId" : @"PhoneNumberId",
             };
}

@end

@implementation AWSConnectAssociateQueueQuickConnectsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"queueId" : @"QueueId",
             @"quickConnectIds" : @"QuickConnectIds",
             };
}

@end

@implementation AWSConnectAssociateRoutingProfileQueuesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"queueConfigs" : @"QueueConfigs",
             @"routingProfileId" : @"RoutingProfileId",
             };
}

+ (NSValueTransformer *)queueConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRoutingProfileQueueConfig class]];
}

@end

@implementation AWSConnectAssociateSecurityKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"key" : @"Key",
             };
}

@end

@implementation AWSConnectAssociateSecurityKeyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             };
}

@end

@implementation AWSConnectAttachmentReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"status" : @"Status",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APPROVED"] == NSOrderedSame) {
            return @(AWSConnectReferenceStatusApproved);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSConnectReferenceStatusRejected);
        }
        return @(AWSConnectReferenceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectReferenceStatusApproved:
                return @"APPROVED";
            case AWSConnectReferenceStatusRejected:
                return @"REJECTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectAttribute

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeType" : @"AttributeType",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)attributeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INBOUND_CALLS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeInboundCalls);
        }
        if ([value caseInsensitiveCompare:@"OUTBOUND_CALLS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeOutboundCalls);
        }
        if ([value caseInsensitiveCompare:@"CONTACTFLOW_LOGS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeContactflowLogs);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_LENS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeContactLens);
        }
        if ([value caseInsensitiveCompare:@"AUTO_RESOLVE_BEST_VOICES"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeAutoResolveBestVoices);
        }
        if ([value caseInsensitiveCompare:@"USE_CUSTOM_TTS_VOICES"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeUseCustomTtsVoices);
        }
        if ([value caseInsensitiveCompare:@"EARLY_MEDIA"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeEarlyMedia);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PARTY_CONFERENCE"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeMultiPartyConference);
        }
        if ([value caseInsensitiveCompare:@"HIGH_VOLUME_OUTBOUND"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeHighVolumeOutbound);
        }
        if ([value caseInsensitiveCompare:@"ENHANCED_CONTACT_MONITORING"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeEnhancedContactMonitoring);
        }
        return @(AWSConnectInstanceAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectInstanceAttributeTypeInboundCalls:
                return @"INBOUND_CALLS";
            case AWSConnectInstanceAttributeTypeOutboundCalls:
                return @"OUTBOUND_CALLS";
            case AWSConnectInstanceAttributeTypeContactflowLogs:
                return @"CONTACTFLOW_LOGS";
            case AWSConnectInstanceAttributeTypeContactLens:
                return @"CONTACT_LENS";
            case AWSConnectInstanceAttributeTypeAutoResolveBestVoices:
                return @"AUTO_RESOLVE_BEST_VOICES";
            case AWSConnectInstanceAttributeTypeUseCustomTtsVoices:
                return @"USE_CUSTOM_TTS_VOICES";
            case AWSConnectInstanceAttributeTypeEarlyMedia:
                return @"EARLY_MEDIA";
            case AWSConnectInstanceAttributeTypeMultiPartyConference:
                return @"MULTI_PARTY_CONFERENCE";
            case AWSConnectInstanceAttributeTypeHighVolumeOutbound:
                return @"HIGH_VOLUME_OUTBOUND";
            case AWSConnectInstanceAttributeTypeEnhancedContactMonitoring:
                return @"ENHANCED_CONTACT_MONITORING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectAvailableNumberSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"PhoneNumber",
             @"phoneNumberCountryCode" : @"PhoneNumberCountryCode",
             @"phoneNumberType" : @"PhoneNumberType",
             };
}

+ (NSValueTransformer *)phoneNumberCountryCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAf);
        }
        if ([value caseInsensitiveCompare:@"AL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAl);
        }
        if ([value caseInsensitiveCompare:@"DZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDz);
        }
        if ([value caseInsensitiveCompare:@"AS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAs);
        }
        if ([value caseInsensitiveCompare:@"AD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAd);
        }
        if ([value caseInsensitiveCompare:@"AO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAo);
        }
        if ([value caseInsensitiveCompare:@"AI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAi);
        }
        if ([value caseInsensitiveCompare:@"AQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAq);
        }
        if ([value caseInsensitiveCompare:@"AG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAg);
        }
        if ([value caseInsensitiveCompare:@"AR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAr);
        }
        if ([value caseInsensitiveCompare:@"AM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAm);
        }
        if ([value caseInsensitiveCompare:@"AW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAw);
        }
        if ([value caseInsensitiveCompare:@"AU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAu);
        }
        if ([value caseInsensitiveCompare:@"AT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAt);
        }
        if ([value caseInsensitiveCompare:@"AZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAz);
        }
        if ([value caseInsensitiveCompare:@"BS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBs);
        }
        if ([value caseInsensitiveCompare:@"BH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBh);
        }
        if ([value caseInsensitiveCompare:@"BD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBd);
        }
        if ([value caseInsensitiveCompare:@"BB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBb);
        }
        if ([value caseInsensitiveCompare:@"BY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBy);
        }
        if ([value caseInsensitiveCompare:@"BE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBe);
        }
        if ([value caseInsensitiveCompare:@"BZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBz);
        }
        if ([value caseInsensitiveCompare:@"BJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBj);
        }
        if ([value caseInsensitiveCompare:@"BM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBm);
        }
        if ([value caseInsensitiveCompare:@"BT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBt);
        }
        if ([value caseInsensitiveCompare:@"BO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBo);
        }
        if ([value caseInsensitiveCompare:@"BA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBa);
        }
        if ([value caseInsensitiveCompare:@"BW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBw);
        }
        if ([value caseInsensitiveCompare:@"BR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBr);
        }
        if ([value caseInsensitiveCompare:@"IO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIo);
        }
        if ([value caseInsensitiveCompare:@"VG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVg);
        }
        if ([value caseInsensitiveCompare:@"BN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBn);
        }
        if ([value caseInsensitiveCompare:@"BG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBg);
        }
        if ([value caseInsensitiveCompare:@"BF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBf);
        }
        if ([value caseInsensitiveCompare:@"BI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBi);
        }
        if ([value caseInsensitiveCompare:@"KH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKh);
        }
        if ([value caseInsensitiveCompare:@"CM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCm);
        }
        if ([value caseInsensitiveCompare:@"CA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCa);
        }
        if ([value caseInsensitiveCompare:@"CV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCv);
        }
        if ([value caseInsensitiveCompare:@"KY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKy);
        }
        if ([value caseInsensitiveCompare:@"CF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCf);
        }
        if ([value caseInsensitiveCompare:@"TD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTd);
        }
        if ([value caseInsensitiveCompare:@"CL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCl);
        }
        if ([value caseInsensitiveCompare:@"CN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCn);
        }
        if ([value caseInsensitiveCompare:@"CX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCx);
        }
        if ([value caseInsensitiveCompare:@"CC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCc);
        }
        if ([value caseInsensitiveCompare:@"CO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCo);
        }
        if ([value caseInsensitiveCompare:@"KM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKm);
        }
        if ([value caseInsensitiveCompare:@"CK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCk);
        }
        if ([value caseInsensitiveCompare:@"CR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCr);
        }
        if ([value caseInsensitiveCompare:@"HR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHr);
        }
        if ([value caseInsensitiveCompare:@"CU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCu);
        }
        if ([value caseInsensitiveCompare:@"CW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCw);
        }
        if ([value caseInsensitiveCompare:@"CY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCy);
        }
        if ([value caseInsensitiveCompare:@"CZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCz);
        }
        if ([value caseInsensitiveCompare:@"CD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCd);
        }
        if ([value caseInsensitiveCompare:@"DK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDk);
        }
        if ([value caseInsensitiveCompare:@"DJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDj);
        }
        if ([value caseInsensitiveCompare:@"DM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDm);
        }
        if ([value caseInsensitiveCompare:@"DO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDo);
        }
        if ([value caseInsensitiveCompare:@"TL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTl);
        }
        if ([value caseInsensitiveCompare:@"EC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEc);
        }
        if ([value caseInsensitiveCompare:@"EG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEg);
        }
        if ([value caseInsensitiveCompare:@"SV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSv);
        }
        if ([value caseInsensitiveCompare:@"GQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGq);
        }
        if ([value caseInsensitiveCompare:@"ER"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEr);
        }
        if ([value caseInsensitiveCompare:@"EE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEe);
        }
        if ([value caseInsensitiveCompare:@"ET"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEt);
        }
        if ([value caseInsensitiveCompare:@"FK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFk);
        }
        if ([value caseInsensitiveCompare:@"FO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFo);
        }
        if ([value caseInsensitiveCompare:@"FJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFj);
        }
        if ([value caseInsensitiveCompare:@"FI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFi);
        }
        if ([value caseInsensitiveCompare:@"FR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFr);
        }
        if ([value caseInsensitiveCompare:@"PF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePf);
        }
        if ([value caseInsensitiveCompare:@"GA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGa);
        }
        if ([value caseInsensitiveCompare:@"GM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGm);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGE);
        }
        if ([value caseInsensitiveCompare:@"DE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDe);
        }
        if ([value caseInsensitiveCompare:@"GH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGh);
        }
        if ([value caseInsensitiveCompare:@"GI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGi);
        }
        if ([value caseInsensitiveCompare:@"GR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGr);
        }
        if ([value caseInsensitiveCompare:@"GL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGl);
        }
        if ([value caseInsensitiveCompare:@"GD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGd);
        }
        if ([value caseInsensitiveCompare:@"GU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGu);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGT);
        }
        if ([value caseInsensitiveCompare:@"GG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGg);
        }
        if ([value caseInsensitiveCompare:@"GN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGn);
        }
        if ([value caseInsensitiveCompare:@"GW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGw);
        }
        if ([value caseInsensitiveCompare:@"GY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGy);
        }
        if ([value caseInsensitiveCompare:@"HT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHt);
        }
        if ([value caseInsensitiveCompare:@"HN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHn);
        }
        if ([value caseInsensitiveCompare:@"HK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHk);
        }
        if ([value caseInsensitiveCompare:@"HU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHu);
        }
        if ([value caseInsensitiveCompare:@"IS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIs);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIN);
        }
        if ([value caseInsensitiveCompare:@"ID"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeId);
        }
        if ([value caseInsensitiveCompare:@"IR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIr);
        }
        if ([value caseInsensitiveCompare:@"IQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIq);
        }
        if ([value caseInsensitiveCompare:@"IE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIe);
        }
        if ([value caseInsensitiveCompare:@"IM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIm);
        }
        if ([value caseInsensitiveCompare:@"IL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIl);
        }
        if ([value caseInsensitiveCompare:@"IT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIt);
        }
        if ([value caseInsensitiveCompare:@"CI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCi);
        }
        if ([value caseInsensitiveCompare:@"JM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJm);
        }
        if ([value caseInsensitiveCompare:@"JP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJp);
        }
        if ([value caseInsensitiveCompare:@"JE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJe);
        }
        if ([value caseInsensitiveCompare:@"JO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJo);
        }
        if ([value caseInsensitiveCompare:@"KZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKz);
        }
        if ([value caseInsensitiveCompare:@"KE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKe);
        }
        if ([value caseInsensitiveCompare:@"KI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKi);
        }
        if ([value caseInsensitiveCompare:@"KW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKw);
        }
        if ([value caseInsensitiveCompare:@"KG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKg);
        }
        if ([value caseInsensitiveCompare:@"LA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLa);
        }
        if ([value caseInsensitiveCompare:@"LV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLv);
        }
        if ([value caseInsensitiveCompare:@"LB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLb);
        }
        if ([value caseInsensitiveCompare:@"LS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLs);
        }
        if ([value caseInsensitiveCompare:@"LR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLr);
        }
        if ([value caseInsensitiveCompare:@"LY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLy);
        }
        if ([value caseInsensitiveCompare:@"LI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLi);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLT);
        }
        if ([value caseInsensitiveCompare:@"LU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLu);
        }
        if ([value caseInsensitiveCompare:@"MO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMo);
        }
        if ([value caseInsensitiveCompare:@"MK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMk);
        }
        if ([value caseInsensitiveCompare:@"MG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMg);
        }
        if ([value caseInsensitiveCompare:@"MW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMw);
        }
        if ([value caseInsensitiveCompare:@"MY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMy);
        }
        if ([value caseInsensitiveCompare:@"MV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMv);
        }
        if ([value caseInsensitiveCompare:@"ML"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMl);
        }
        if ([value caseInsensitiveCompare:@"MT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMt);
        }
        if ([value caseInsensitiveCompare:@"MH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMh);
        }
        if ([value caseInsensitiveCompare:@"MR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMr);
        }
        if ([value caseInsensitiveCompare:@"MU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMu);
        }
        if ([value caseInsensitiveCompare:@"YT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeYt);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMx);
        }
        if ([value caseInsensitiveCompare:@"FM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFm);
        }
        if ([value caseInsensitiveCompare:@"MD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMd);
        }
        if ([value caseInsensitiveCompare:@"MC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMc);
        }
        if ([value caseInsensitiveCompare:@"MN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMn);
        }
        if ([value caseInsensitiveCompare:@"ME"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMe);
        }
        if ([value caseInsensitiveCompare:@"MS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMs);
        }
        if ([value caseInsensitiveCompare:@"MA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMa);
        }
        if ([value caseInsensitiveCompare:@"MZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMz);
        }
        if ([value caseInsensitiveCompare:@"MM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMm);
        }
        if ([value caseInsensitiveCompare:@"NA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNa);
        }
        if ([value caseInsensitiveCompare:@"NR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNr);
        }
        if ([value caseInsensitiveCompare:@"NP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNp);
        }
        if ([value caseInsensitiveCompare:@"NL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNl);
        }
        if ([value caseInsensitiveCompare:@"AN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAn);
        }
        if ([value caseInsensitiveCompare:@"NC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNc);
        }
        if ([value caseInsensitiveCompare:@"NZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNz);
        }
        if ([value caseInsensitiveCompare:@"NI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNi);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNE);
        }
        if ([value caseInsensitiveCompare:@"NG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNg);
        }
        if ([value caseInsensitiveCompare:@"NU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNu);
        }
        if ([value caseInsensitiveCompare:@"KP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKp);
        }
        if ([value caseInsensitiveCompare:@"MP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMp);
        }
        if ([value caseInsensitiveCompare:@"NO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNo);
        }
        if ([value caseInsensitiveCompare:@"OM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeOm);
        }
        if ([value caseInsensitiveCompare:@"PK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePk);
        }
        if ([value caseInsensitiveCompare:@"PW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePw);
        }
        if ([value caseInsensitiveCompare:@"PA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePa);
        }
        if ([value caseInsensitiveCompare:@"PG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePg);
        }
        if ([value caseInsensitiveCompare:@"PY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePy);
        }
        if ([value caseInsensitiveCompare:@"PE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePe);
        }
        if ([value caseInsensitiveCompare:@"PH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePh);
        }
        if ([value caseInsensitiveCompare:@"PN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePn);
        }
        if ([value caseInsensitiveCompare:@"PL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePl);
        }
        if ([value caseInsensitiveCompare:@"PT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePt);
        }
        if ([value caseInsensitiveCompare:@"PR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePr);
        }
        if ([value caseInsensitiveCompare:@"QA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeQa);
        }
        if ([value caseInsensitiveCompare:@"CG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCg);
        }
        if ([value caseInsensitiveCompare:@"RE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRe);
        }
        if ([value caseInsensitiveCompare:@"RO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRo);
        }
        if ([value caseInsensitiveCompare:@"RU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRu);
        }
        if ([value caseInsensitiveCompare:@"RW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRw);
        }
        if ([value caseInsensitiveCompare:@"BL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBl);
        }
        if ([value caseInsensitiveCompare:@"SH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSh);
        }
        if ([value caseInsensitiveCompare:@"KN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKn);
        }
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLc);
        }
        if ([value caseInsensitiveCompare:@"MF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMf);
        }
        if ([value caseInsensitiveCompare:@"PM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePm);
        }
        if ([value caseInsensitiveCompare:@"VC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVc);
        }
        if ([value caseInsensitiveCompare:@"WS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeWs);
        }
        if ([value caseInsensitiveCompare:@"SM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSm);
        }
        if ([value caseInsensitiveCompare:@"ST"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSt);
        }
        if ([value caseInsensitiveCompare:@"SA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSa);
        }
        if ([value caseInsensitiveCompare:@"SN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSn);
        }
        if ([value caseInsensitiveCompare:@"RS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRs);
        }
        if ([value caseInsensitiveCompare:@"SC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSc);
        }
        if ([value caseInsensitiveCompare:@"SL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSl);
        }
        if ([value caseInsensitiveCompare:@"SG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSg);
        }
        if ([value caseInsensitiveCompare:@"SX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSx);
        }
        if ([value caseInsensitiveCompare:@"SK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSk);
        }
        if ([value caseInsensitiveCompare:@"SI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSi);
        }
        if ([value caseInsensitiveCompare:@"SB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSb);
        }
        if ([value caseInsensitiveCompare:@"SO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSo);
        }
        if ([value caseInsensitiveCompare:@"ZA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZa);
        }
        if ([value caseInsensitiveCompare:@"KR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKr);
        }
        if ([value caseInsensitiveCompare:@"ES"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEs);
        }
        if ([value caseInsensitiveCompare:@"LK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLk);
        }
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSd);
        }
        if ([value caseInsensitiveCompare:@"SR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSr);
        }
        if ([value caseInsensitiveCompare:@"SJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSj);
        }
        if ([value caseInsensitiveCompare:@"SZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSz);
        }
        if ([value caseInsensitiveCompare:@"SE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSe);
        }
        if ([value caseInsensitiveCompare:@"CH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCh);
        }
        if ([value caseInsensitiveCompare:@"SY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSy);
        }
        if ([value caseInsensitiveCompare:@"TW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTw);
        }
        if ([value caseInsensitiveCompare:@"TJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTj);
        }
        if ([value caseInsensitiveCompare:@"TZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTz);
        }
        if ([value caseInsensitiveCompare:@"TH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTh);
        }
        if ([value caseInsensitiveCompare:@"TG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTg);
        }
        if ([value caseInsensitiveCompare:@"TK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTk);
        }
        if ([value caseInsensitiveCompare:@"TO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTo);
        }
        if ([value caseInsensitiveCompare:@"TT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTt);
        }
        if ([value caseInsensitiveCompare:@"TN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTn);
        }
        if ([value caseInsensitiveCompare:@"TR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTr);
        }
        if ([value caseInsensitiveCompare:@"TM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTm);
        }
        if ([value caseInsensitiveCompare:@"TC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTc);
        }
        if ([value caseInsensitiveCompare:@"TV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTv);
        }
        if ([value caseInsensitiveCompare:@"VI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVi);
        }
        if ([value caseInsensitiveCompare:@"UG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUg);
        }
        if ([value caseInsensitiveCompare:@"UA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUa);
        }
        if ([value caseInsensitiveCompare:@"AE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAe);
        }
        if ([value caseInsensitiveCompare:@"GB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGb);
        }
        if ([value caseInsensitiveCompare:@"US"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUs);
        }
        if ([value caseInsensitiveCompare:@"UY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUy);
        }
        if ([value caseInsensitiveCompare:@"UZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUz);
        }
        if ([value caseInsensitiveCompare:@"VU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVu);
        }
        if ([value caseInsensitiveCompare:@"VA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVa);
        }
        if ([value caseInsensitiveCompare:@"VE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVe);
        }
        if ([value caseInsensitiveCompare:@"VN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVn);
        }
        if ([value caseInsensitiveCompare:@"WF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeWf);
        }
        if ([value caseInsensitiveCompare:@"EH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEh);
        }
        if ([value caseInsensitiveCompare:@"YE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeYe);
        }
        if ([value caseInsensitiveCompare:@"ZM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZm);
        }
        if ([value caseInsensitiveCompare:@"ZW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZw);
        }
        return @(AWSConnectPhoneNumberCountryCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneNumberCountryCodeAf:
                return @"AF";
            case AWSConnectPhoneNumberCountryCodeAl:
                return @"AL";
            case AWSConnectPhoneNumberCountryCodeDz:
                return @"DZ";
            case AWSConnectPhoneNumberCountryCodeAs:
                return @"AS";
            case AWSConnectPhoneNumberCountryCodeAd:
                return @"AD";
            case AWSConnectPhoneNumberCountryCodeAo:
                return @"AO";
            case AWSConnectPhoneNumberCountryCodeAi:
                return @"AI";
            case AWSConnectPhoneNumberCountryCodeAq:
                return @"AQ";
            case AWSConnectPhoneNumberCountryCodeAg:
                return @"AG";
            case AWSConnectPhoneNumberCountryCodeAr:
                return @"AR";
            case AWSConnectPhoneNumberCountryCodeAm:
                return @"AM";
            case AWSConnectPhoneNumberCountryCodeAw:
                return @"AW";
            case AWSConnectPhoneNumberCountryCodeAu:
                return @"AU";
            case AWSConnectPhoneNumberCountryCodeAt:
                return @"AT";
            case AWSConnectPhoneNumberCountryCodeAz:
                return @"AZ";
            case AWSConnectPhoneNumberCountryCodeBs:
                return @"BS";
            case AWSConnectPhoneNumberCountryCodeBh:
                return @"BH";
            case AWSConnectPhoneNumberCountryCodeBd:
                return @"BD";
            case AWSConnectPhoneNumberCountryCodeBb:
                return @"BB";
            case AWSConnectPhoneNumberCountryCodeBy:
                return @"BY";
            case AWSConnectPhoneNumberCountryCodeBe:
                return @"BE";
            case AWSConnectPhoneNumberCountryCodeBz:
                return @"BZ";
            case AWSConnectPhoneNumberCountryCodeBj:
                return @"BJ";
            case AWSConnectPhoneNumberCountryCodeBm:
                return @"BM";
            case AWSConnectPhoneNumberCountryCodeBt:
                return @"BT";
            case AWSConnectPhoneNumberCountryCodeBo:
                return @"BO";
            case AWSConnectPhoneNumberCountryCodeBa:
                return @"BA";
            case AWSConnectPhoneNumberCountryCodeBw:
                return @"BW";
            case AWSConnectPhoneNumberCountryCodeBr:
                return @"BR";
            case AWSConnectPhoneNumberCountryCodeIo:
                return @"IO";
            case AWSConnectPhoneNumberCountryCodeVg:
                return @"VG";
            case AWSConnectPhoneNumberCountryCodeBn:
                return @"BN";
            case AWSConnectPhoneNumberCountryCodeBg:
                return @"BG";
            case AWSConnectPhoneNumberCountryCodeBf:
                return @"BF";
            case AWSConnectPhoneNumberCountryCodeBi:
                return @"BI";
            case AWSConnectPhoneNumberCountryCodeKh:
                return @"KH";
            case AWSConnectPhoneNumberCountryCodeCm:
                return @"CM";
            case AWSConnectPhoneNumberCountryCodeCa:
                return @"CA";
            case AWSConnectPhoneNumberCountryCodeCv:
                return @"CV";
            case AWSConnectPhoneNumberCountryCodeKy:
                return @"KY";
            case AWSConnectPhoneNumberCountryCodeCf:
                return @"CF";
            case AWSConnectPhoneNumberCountryCodeTd:
                return @"TD";
            case AWSConnectPhoneNumberCountryCodeCl:
                return @"CL";
            case AWSConnectPhoneNumberCountryCodeCn:
                return @"CN";
            case AWSConnectPhoneNumberCountryCodeCx:
                return @"CX";
            case AWSConnectPhoneNumberCountryCodeCc:
                return @"CC";
            case AWSConnectPhoneNumberCountryCodeCo:
                return @"CO";
            case AWSConnectPhoneNumberCountryCodeKm:
                return @"KM";
            case AWSConnectPhoneNumberCountryCodeCk:
                return @"CK";
            case AWSConnectPhoneNumberCountryCodeCr:
                return @"CR";
            case AWSConnectPhoneNumberCountryCodeHr:
                return @"HR";
            case AWSConnectPhoneNumberCountryCodeCu:
                return @"CU";
            case AWSConnectPhoneNumberCountryCodeCw:
                return @"CW";
            case AWSConnectPhoneNumberCountryCodeCy:
                return @"CY";
            case AWSConnectPhoneNumberCountryCodeCz:
                return @"CZ";
            case AWSConnectPhoneNumberCountryCodeCd:
                return @"CD";
            case AWSConnectPhoneNumberCountryCodeDk:
                return @"DK";
            case AWSConnectPhoneNumberCountryCodeDj:
                return @"DJ";
            case AWSConnectPhoneNumberCountryCodeDm:
                return @"DM";
            case AWSConnectPhoneNumberCountryCodeDo:
                return @"DO";
            case AWSConnectPhoneNumberCountryCodeTl:
                return @"TL";
            case AWSConnectPhoneNumberCountryCodeEc:
                return @"EC";
            case AWSConnectPhoneNumberCountryCodeEg:
                return @"EG";
            case AWSConnectPhoneNumberCountryCodeSv:
                return @"SV";
            case AWSConnectPhoneNumberCountryCodeGq:
                return @"GQ";
            case AWSConnectPhoneNumberCountryCodeEr:
                return @"ER";
            case AWSConnectPhoneNumberCountryCodeEe:
                return @"EE";
            case AWSConnectPhoneNumberCountryCodeEt:
                return @"ET";
            case AWSConnectPhoneNumberCountryCodeFk:
                return @"FK";
            case AWSConnectPhoneNumberCountryCodeFo:
                return @"FO";
            case AWSConnectPhoneNumberCountryCodeFj:
                return @"FJ";
            case AWSConnectPhoneNumberCountryCodeFi:
                return @"FI";
            case AWSConnectPhoneNumberCountryCodeFr:
                return @"FR";
            case AWSConnectPhoneNumberCountryCodePf:
                return @"PF";
            case AWSConnectPhoneNumberCountryCodeGa:
                return @"GA";
            case AWSConnectPhoneNumberCountryCodeGm:
                return @"GM";
            case AWSConnectPhoneNumberCountryCodeGE:
                return @"GE";
            case AWSConnectPhoneNumberCountryCodeDe:
                return @"DE";
            case AWSConnectPhoneNumberCountryCodeGh:
                return @"GH";
            case AWSConnectPhoneNumberCountryCodeGi:
                return @"GI";
            case AWSConnectPhoneNumberCountryCodeGr:
                return @"GR";
            case AWSConnectPhoneNumberCountryCodeGl:
                return @"GL";
            case AWSConnectPhoneNumberCountryCodeGd:
                return @"GD";
            case AWSConnectPhoneNumberCountryCodeGu:
                return @"GU";
            case AWSConnectPhoneNumberCountryCodeGT:
                return @"GT";
            case AWSConnectPhoneNumberCountryCodeGg:
                return @"GG";
            case AWSConnectPhoneNumberCountryCodeGn:
                return @"GN";
            case AWSConnectPhoneNumberCountryCodeGw:
                return @"GW";
            case AWSConnectPhoneNumberCountryCodeGy:
                return @"GY";
            case AWSConnectPhoneNumberCountryCodeHt:
                return @"HT";
            case AWSConnectPhoneNumberCountryCodeHn:
                return @"HN";
            case AWSConnectPhoneNumberCountryCodeHk:
                return @"HK";
            case AWSConnectPhoneNumberCountryCodeHu:
                return @"HU";
            case AWSConnectPhoneNumberCountryCodeIs:
                return @"IS";
            case AWSConnectPhoneNumberCountryCodeIN:
                return @"IN";
            case AWSConnectPhoneNumberCountryCodeId:
                return @"ID";
            case AWSConnectPhoneNumberCountryCodeIr:
                return @"IR";
            case AWSConnectPhoneNumberCountryCodeIq:
                return @"IQ";
            case AWSConnectPhoneNumberCountryCodeIe:
                return @"IE";
            case AWSConnectPhoneNumberCountryCodeIm:
                return @"IM";
            case AWSConnectPhoneNumberCountryCodeIl:
                return @"IL";
            case AWSConnectPhoneNumberCountryCodeIt:
                return @"IT";
            case AWSConnectPhoneNumberCountryCodeCi:
                return @"CI";
            case AWSConnectPhoneNumberCountryCodeJm:
                return @"JM";
            case AWSConnectPhoneNumberCountryCodeJp:
                return @"JP";
            case AWSConnectPhoneNumberCountryCodeJe:
                return @"JE";
            case AWSConnectPhoneNumberCountryCodeJo:
                return @"JO";
            case AWSConnectPhoneNumberCountryCodeKz:
                return @"KZ";
            case AWSConnectPhoneNumberCountryCodeKe:
                return @"KE";
            case AWSConnectPhoneNumberCountryCodeKi:
                return @"KI";
            case AWSConnectPhoneNumberCountryCodeKw:
                return @"KW";
            case AWSConnectPhoneNumberCountryCodeKg:
                return @"KG";
            case AWSConnectPhoneNumberCountryCodeLa:
                return @"LA";
            case AWSConnectPhoneNumberCountryCodeLv:
                return @"LV";
            case AWSConnectPhoneNumberCountryCodeLb:
                return @"LB";
            case AWSConnectPhoneNumberCountryCodeLs:
                return @"LS";
            case AWSConnectPhoneNumberCountryCodeLr:
                return @"LR";
            case AWSConnectPhoneNumberCountryCodeLy:
                return @"LY";
            case AWSConnectPhoneNumberCountryCodeLi:
                return @"LI";
            case AWSConnectPhoneNumberCountryCodeLT:
                return @"LT";
            case AWSConnectPhoneNumberCountryCodeLu:
                return @"LU";
            case AWSConnectPhoneNumberCountryCodeMo:
                return @"MO";
            case AWSConnectPhoneNumberCountryCodeMk:
                return @"MK";
            case AWSConnectPhoneNumberCountryCodeMg:
                return @"MG";
            case AWSConnectPhoneNumberCountryCodeMw:
                return @"MW";
            case AWSConnectPhoneNumberCountryCodeMy:
                return @"MY";
            case AWSConnectPhoneNumberCountryCodeMv:
                return @"MV";
            case AWSConnectPhoneNumberCountryCodeMl:
                return @"ML";
            case AWSConnectPhoneNumberCountryCodeMt:
                return @"MT";
            case AWSConnectPhoneNumberCountryCodeMh:
                return @"MH";
            case AWSConnectPhoneNumberCountryCodeMr:
                return @"MR";
            case AWSConnectPhoneNumberCountryCodeMu:
                return @"MU";
            case AWSConnectPhoneNumberCountryCodeYt:
                return @"YT";
            case AWSConnectPhoneNumberCountryCodeMx:
                return @"MX";
            case AWSConnectPhoneNumberCountryCodeFm:
                return @"FM";
            case AWSConnectPhoneNumberCountryCodeMd:
                return @"MD";
            case AWSConnectPhoneNumberCountryCodeMc:
                return @"MC";
            case AWSConnectPhoneNumberCountryCodeMn:
                return @"MN";
            case AWSConnectPhoneNumberCountryCodeMe:
                return @"ME";
            case AWSConnectPhoneNumberCountryCodeMs:
                return @"MS";
            case AWSConnectPhoneNumberCountryCodeMa:
                return @"MA";
            case AWSConnectPhoneNumberCountryCodeMz:
                return @"MZ";
            case AWSConnectPhoneNumberCountryCodeMm:
                return @"MM";
            case AWSConnectPhoneNumberCountryCodeNa:
                return @"NA";
            case AWSConnectPhoneNumberCountryCodeNr:
                return @"NR";
            case AWSConnectPhoneNumberCountryCodeNp:
                return @"NP";
            case AWSConnectPhoneNumberCountryCodeNl:
                return @"NL";
            case AWSConnectPhoneNumberCountryCodeAn:
                return @"AN";
            case AWSConnectPhoneNumberCountryCodeNc:
                return @"NC";
            case AWSConnectPhoneNumberCountryCodeNz:
                return @"NZ";
            case AWSConnectPhoneNumberCountryCodeNi:
                return @"NI";
            case AWSConnectPhoneNumberCountryCodeNE:
                return @"NE";
            case AWSConnectPhoneNumberCountryCodeNg:
                return @"NG";
            case AWSConnectPhoneNumberCountryCodeNu:
                return @"NU";
            case AWSConnectPhoneNumberCountryCodeKp:
                return @"KP";
            case AWSConnectPhoneNumberCountryCodeMp:
                return @"MP";
            case AWSConnectPhoneNumberCountryCodeNo:
                return @"NO";
            case AWSConnectPhoneNumberCountryCodeOm:
                return @"OM";
            case AWSConnectPhoneNumberCountryCodePk:
                return @"PK";
            case AWSConnectPhoneNumberCountryCodePw:
                return @"PW";
            case AWSConnectPhoneNumberCountryCodePa:
                return @"PA";
            case AWSConnectPhoneNumberCountryCodePg:
                return @"PG";
            case AWSConnectPhoneNumberCountryCodePy:
                return @"PY";
            case AWSConnectPhoneNumberCountryCodePe:
                return @"PE";
            case AWSConnectPhoneNumberCountryCodePh:
                return @"PH";
            case AWSConnectPhoneNumberCountryCodePn:
                return @"PN";
            case AWSConnectPhoneNumberCountryCodePl:
                return @"PL";
            case AWSConnectPhoneNumberCountryCodePt:
                return @"PT";
            case AWSConnectPhoneNumberCountryCodePr:
                return @"PR";
            case AWSConnectPhoneNumberCountryCodeQa:
                return @"QA";
            case AWSConnectPhoneNumberCountryCodeCg:
                return @"CG";
            case AWSConnectPhoneNumberCountryCodeRe:
                return @"RE";
            case AWSConnectPhoneNumberCountryCodeRo:
                return @"RO";
            case AWSConnectPhoneNumberCountryCodeRu:
                return @"RU";
            case AWSConnectPhoneNumberCountryCodeRw:
                return @"RW";
            case AWSConnectPhoneNumberCountryCodeBl:
                return @"BL";
            case AWSConnectPhoneNumberCountryCodeSh:
                return @"SH";
            case AWSConnectPhoneNumberCountryCodeKn:
                return @"KN";
            case AWSConnectPhoneNumberCountryCodeLc:
                return @"LC";
            case AWSConnectPhoneNumberCountryCodeMf:
                return @"MF";
            case AWSConnectPhoneNumberCountryCodePm:
                return @"PM";
            case AWSConnectPhoneNumberCountryCodeVc:
                return @"VC";
            case AWSConnectPhoneNumberCountryCodeWs:
                return @"WS";
            case AWSConnectPhoneNumberCountryCodeSm:
                return @"SM";
            case AWSConnectPhoneNumberCountryCodeSt:
                return @"ST";
            case AWSConnectPhoneNumberCountryCodeSa:
                return @"SA";
            case AWSConnectPhoneNumberCountryCodeSn:
                return @"SN";
            case AWSConnectPhoneNumberCountryCodeRs:
                return @"RS";
            case AWSConnectPhoneNumberCountryCodeSc:
                return @"SC";
            case AWSConnectPhoneNumberCountryCodeSl:
                return @"SL";
            case AWSConnectPhoneNumberCountryCodeSg:
                return @"SG";
            case AWSConnectPhoneNumberCountryCodeSx:
                return @"SX";
            case AWSConnectPhoneNumberCountryCodeSk:
                return @"SK";
            case AWSConnectPhoneNumberCountryCodeSi:
                return @"SI";
            case AWSConnectPhoneNumberCountryCodeSb:
                return @"SB";
            case AWSConnectPhoneNumberCountryCodeSo:
                return @"SO";
            case AWSConnectPhoneNumberCountryCodeZa:
                return @"ZA";
            case AWSConnectPhoneNumberCountryCodeKr:
                return @"KR";
            case AWSConnectPhoneNumberCountryCodeEs:
                return @"ES";
            case AWSConnectPhoneNumberCountryCodeLk:
                return @"LK";
            case AWSConnectPhoneNumberCountryCodeSd:
                return @"SD";
            case AWSConnectPhoneNumberCountryCodeSr:
                return @"SR";
            case AWSConnectPhoneNumberCountryCodeSj:
                return @"SJ";
            case AWSConnectPhoneNumberCountryCodeSz:
                return @"SZ";
            case AWSConnectPhoneNumberCountryCodeSe:
                return @"SE";
            case AWSConnectPhoneNumberCountryCodeCh:
                return @"CH";
            case AWSConnectPhoneNumberCountryCodeSy:
                return @"SY";
            case AWSConnectPhoneNumberCountryCodeTw:
                return @"TW";
            case AWSConnectPhoneNumberCountryCodeTj:
                return @"TJ";
            case AWSConnectPhoneNumberCountryCodeTz:
                return @"TZ";
            case AWSConnectPhoneNumberCountryCodeTh:
                return @"TH";
            case AWSConnectPhoneNumberCountryCodeTg:
                return @"TG";
            case AWSConnectPhoneNumberCountryCodeTk:
                return @"TK";
            case AWSConnectPhoneNumberCountryCodeTo:
                return @"TO";
            case AWSConnectPhoneNumberCountryCodeTt:
                return @"TT";
            case AWSConnectPhoneNumberCountryCodeTn:
                return @"TN";
            case AWSConnectPhoneNumberCountryCodeTr:
                return @"TR";
            case AWSConnectPhoneNumberCountryCodeTm:
                return @"TM";
            case AWSConnectPhoneNumberCountryCodeTc:
                return @"TC";
            case AWSConnectPhoneNumberCountryCodeTv:
                return @"TV";
            case AWSConnectPhoneNumberCountryCodeVi:
                return @"VI";
            case AWSConnectPhoneNumberCountryCodeUg:
                return @"UG";
            case AWSConnectPhoneNumberCountryCodeUa:
                return @"UA";
            case AWSConnectPhoneNumberCountryCodeAe:
                return @"AE";
            case AWSConnectPhoneNumberCountryCodeGb:
                return @"GB";
            case AWSConnectPhoneNumberCountryCodeUs:
                return @"US";
            case AWSConnectPhoneNumberCountryCodeUy:
                return @"UY";
            case AWSConnectPhoneNumberCountryCodeUz:
                return @"UZ";
            case AWSConnectPhoneNumberCountryCodeVu:
                return @"VU";
            case AWSConnectPhoneNumberCountryCodeVa:
                return @"VA";
            case AWSConnectPhoneNumberCountryCodeVe:
                return @"VE";
            case AWSConnectPhoneNumberCountryCodeVn:
                return @"VN";
            case AWSConnectPhoneNumberCountryCodeWf:
                return @"WF";
            case AWSConnectPhoneNumberCountryCodeEh:
                return @"EH";
            case AWSConnectPhoneNumberCountryCodeYe:
                return @"YE";
            case AWSConnectPhoneNumberCountryCodeZm:
                return @"ZM";
            case AWSConnectPhoneNumberCountryCodeZw:
                return @"ZW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)phoneNumberTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TOLL_FREE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberTypeTollFree);
        }
        if ([value caseInsensitiveCompare:@"DID"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberTypeDid);
        }
        return @(AWSConnectPhoneNumberTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneNumberTypeTollFree:
                return @"TOLL_FREE";
            case AWSConnectPhoneNumberTypeDid:
                return @"DID";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectChatMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSConnectChatParticipantRoleConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"participantTimerConfigList" : @"ParticipantTimerConfigList",
             };
}

+ (NSValueTransformer *)participantTimerConfigListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectParticipantTimerConfiguration class]];
}

@end

@implementation AWSConnectChatStreamingConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamingEndpointArn" : @"StreamingEndpointArn",
             };
}

@end

@implementation AWSConnectClaimPhoneNumberRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"phoneNumber" : @"PhoneNumber",
             @"phoneNumberDescription" : @"PhoneNumberDescription",
             @"tags" : @"Tags",
             @"targetArn" : @"TargetArn",
             };
}

@end

@implementation AWSConnectClaimPhoneNumberResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberArn" : @"PhoneNumberArn",
             @"phoneNumberId" : @"PhoneNumberId",
             };
}

@end

@implementation AWSConnectClaimedPhoneNumberSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"PhoneNumber",
             @"phoneNumberArn" : @"PhoneNumberArn",
             @"phoneNumberCountryCode" : @"PhoneNumberCountryCode",
             @"phoneNumberDescription" : @"PhoneNumberDescription",
             @"phoneNumberId" : @"PhoneNumberId",
             @"phoneNumberStatus" : @"PhoneNumberStatus",
             @"phoneNumberType" : @"PhoneNumberType",
             @"tags" : @"Tags",
             @"targetArn" : @"TargetArn",
             };
}

+ (NSValueTransformer *)phoneNumberCountryCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAf);
        }
        if ([value caseInsensitiveCompare:@"AL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAl);
        }
        if ([value caseInsensitiveCompare:@"DZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDz);
        }
        if ([value caseInsensitiveCompare:@"AS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAs);
        }
        if ([value caseInsensitiveCompare:@"AD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAd);
        }
        if ([value caseInsensitiveCompare:@"AO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAo);
        }
        if ([value caseInsensitiveCompare:@"AI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAi);
        }
        if ([value caseInsensitiveCompare:@"AQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAq);
        }
        if ([value caseInsensitiveCompare:@"AG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAg);
        }
        if ([value caseInsensitiveCompare:@"AR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAr);
        }
        if ([value caseInsensitiveCompare:@"AM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAm);
        }
        if ([value caseInsensitiveCompare:@"AW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAw);
        }
        if ([value caseInsensitiveCompare:@"AU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAu);
        }
        if ([value caseInsensitiveCompare:@"AT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAt);
        }
        if ([value caseInsensitiveCompare:@"AZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAz);
        }
        if ([value caseInsensitiveCompare:@"BS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBs);
        }
        if ([value caseInsensitiveCompare:@"BH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBh);
        }
        if ([value caseInsensitiveCompare:@"BD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBd);
        }
        if ([value caseInsensitiveCompare:@"BB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBb);
        }
        if ([value caseInsensitiveCompare:@"BY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBy);
        }
        if ([value caseInsensitiveCompare:@"BE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBe);
        }
        if ([value caseInsensitiveCompare:@"BZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBz);
        }
        if ([value caseInsensitiveCompare:@"BJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBj);
        }
        if ([value caseInsensitiveCompare:@"BM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBm);
        }
        if ([value caseInsensitiveCompare:@"BT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBt);
        }
        if ([value caseInsensitiveCompare:@"BO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBo);
        }
        if ([value caseInsensitiveCompare:@"BA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBa);
        }
        if ([value caseInsensitiveCompare:@"BW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBw);
        }
        if ([value caseInsensitiveCompare:@"BR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBr);
        }
        if ([value caseInsensitiveCompare:@"IO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIo);
        }
        if ([value caseInsensitiveCompare:@"VG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVg);
        }
        if ([value caseInsensitiveCompare:@"BN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBn);
        }
        if ([value caseInsensitiveCompare:@"BG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBg);
        }
        if ([value caseInsensitiveCompare:@"BF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBf);
        }
        if ([value caseInsensitiveCompare:@"BI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBi);
        }
        if ([value caseInsensitiveCompare:@"KH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKh);
        }
        if ([value caseInsensitiveCompare:@"CM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCm);
        }
        if ([value caseInsensitiveCompare:@"CA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCa);
        }
        if ([value caseInsensitiveCompare:@"CV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCv);
        }
        if ([value caseInsensitiveCompare:@"KY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKy);
        }
        if ([value caseInsensitiveCompare:@"CF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCf);
        }
        if ([value caseInsensitiveCompare:@"TD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTd);
        }
        if ([value caseInsensitiveCompare:@"CL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCl);
        }
        if ([value caseInsensitiveCompare:@"CN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCn);
        }
        if ([value caseInsensitiveCompare:@"CX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCx);
        }
        if ([value caseInsensitiveCompare:@"CC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCc);
        }
        if ([value caseInsensitiveCompare:@"CO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCo);
        }
        if ([value caseInsensitiveCompare:@"KM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKm);
        }
        if ([value caseInsensitiveCompare:@"CK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCk);
        }
        if ([value caseInsensitiveCompare:@"CR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCr);
        }
        if ([value caseInsensitiveCompare:@"HR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHr);
        }
        if ([value caseInsensitiveCompare:@"CU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCu);
        }
        if ([value caseInsensitiveCompare:@"CW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCw);
        }
        if ([value caseInsensitiveCompare:@"CY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCy);
        }
        if ([value caseInsensitiveCompare:@"CZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCz);
        }
        if ([value caseInsensitiveCompare:@"CD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCd);
        }
        if ([value caseInsensitiveCompare:@"DK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDk);
        }
        if ([value caseInsensitiveCompare:@"DJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDj);
        }
        if ([value caseInsensitiveCompare:@"DM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDm);
        }
        if ([value caseInsensitiveCompare:@"DO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDo);
        }
        if ([value caseInsensitiveCompare:@"TL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTl);
        }
        if ([value caseInsensitiveCompare:@"EC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEc);
        }
        if ([value caseInsensitiveCompare:@"EG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEg);
        }
        if ([value caseInsensitiveCompare:@"SV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSv);
        }
        if ([value caseInsensitiveCompare:@"GQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGq);
        }
        if ([value caseInsensitiveCompare:@"ER"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEr);
        }
        if ([value caseInsensitiveCompare:@"EE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEe);
        }
        if ([value caseInsensitiveCompare:@"ET"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEt);
        }
        if ([value caseInsensitiveCompare:@"FK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFk);
        }
        if ([value caseInsensitiveCompare:@"FO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFo);
        }
        if ([value caseInsensitiveCompare:@"FJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFj);
        }
        if ([value caseInsensitiveCompare:@"FI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFi);
        }
        if ([value caseInsensitiveCompare:@"FR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFr);
        }
        if ([value caseInsensitiveCompare:@"PF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePf);
        }
        if ([value caseInsensitiveCompare:@"GA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGa);
        }
        if ([value caseInsensitiveCompare:@"GM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGm);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGE);
        }
        if ([value caseInsensitiveCompare:@"DE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDe);
        }
        if ([value caseInsensitiveCompare:@"GH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGh);
        }
        if ([value caseInsensitiveCompare:@"GI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGi);
        }
        if ([value caseInsensitiveCompare:@"GR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGr);
        }
        if ([value caseInsensitiveCompare:@"GL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGl);
        }
        if ([value caseInsensitiveCompare:@"GD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGd);
        }
        if ([value caseInsensitiveCompare:@"GU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGu);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGT);
        }
        if ([value caseInsensitiveCompare:@"GG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGg);
        }
        if ([value caseInsensitiveCompare:@"GN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGn);
        }
        if ([value caseInsensitiveCompare:@"GW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGw);
        }
        if ([value caseInsensitiveCompare:@"GY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGy);
        }
        if ([value caseInsensitiveCompare:@"HT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHt);
        }
        if ([value caseInsensitiveCompare:@"HN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHn);
        }
        if ([value caseInsensitiveCompare:@"HK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHk);
        }
        if ([value caseInsensitiveCompare:@"HU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHu);
        }
        if ([value caseInsensitiveCompare:@"IS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIs);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIN);
        }
        if ([value caseInsensitiveCompare:@"ID"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeId);
        }
        if ([value caseInsensitiveCompare:@"IR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIr);
        }
        if ([value caseInsensitiveCompare:@"IQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIq);
        }
        if ([value caseInsensitiveCompare:@"IE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIe);
        }
        if ([value caseInsensitiveCompare:@"IM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIm);
        }
        if ([value caseInsensitiveCompare:@"IL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIl);
        }
        if ([value caseInsensitiveCompare:@"IT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIt);
        }
        if ([value caseInsensitiveCompare:@"CI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCi);
        }
        if ([value caseInsensitiveCompare:@"JM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJm);
        }
        if ([value caseInsensitiveCompare:@"JP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJp);
        }
        if ([value caseInsensitiveCompare:@"JE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJe);
        }
        if ([value caseInsensitiveCompare:@"JO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJo);
        }
        if ([value caseInsensitiveCompare:@"KZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKz);
        }
        if ([value caseInsensitiveCompare:@"KE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKe);
        }
        if ([value caseInsensitiveCompare:@"KI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKi);
        }
        if ([value caseInsensitiveCompare:@"KW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKw);
        }
        if ([value caseInsensitiveCompare:@"KG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKg);
        }
        if ([value caseInsensitiveCompare:@"LA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLa);
        }
        if ([value caseInsensitiveCompare:@"LV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLv);
        }
        if ([value caseInsensitiveCompare:@"LB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLb);
        }
        if ([value caseInsensitiveCompare:@"LS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLs);
        }
        if ([value caseInsensitiveCompare:@"LR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLr);
        }
        if ([value caseInsensitiveCompare:@"LY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLy);
        }
        if ([value caseInsensitiveCompare:@"LI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLi);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLT);
        }
        if ([value caseInsensitiveCompare:@"LU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLu);
        }
        if ([value caseInsensitiveCompare:@"MO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMo);
        }
        if ([value caseInsensitiveCompare:@"MK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMk);
        }
        if ([value caseInsensitiveCompare:@"MG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMg);
        }
        if ([value caseInsensitiveCompare:@"MW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMw);
        }
        if ([value caseInsensitiveCompare:@"MY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMy);
        }
        if ([value caseInsensitiveCompare:@"MV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMv);
        }
        if ([value caseInsensitiveCompare:@"ML"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMl);
        }
        if ([value caseInsensitiveCompare:@"MT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMt);
        }
        if ([value caseInsensitiveCompare:@"MH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMh);
        }
        if ([value caseInsensitiveCompare:@"MR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMr);
        }
        if ([value caseInsensitiveCompare:@"MU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMu);
        }
        if ([value caseInsensitiveCompare:@"YT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeYt);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMx);
        }
        if ([value caseInsensitiveCompare:@"FM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFm);
        }
        if ([value caseInsensitiveCompare:@"MD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMd);
        }
        if ([value caseInsensitiveCompare:@"MC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMc);
        }
        if ([value caseInsensitiveCompare:@"MN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMn);
        }
        if ([value caseInsensitiveCompare:@"ME"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMe);
        }
        if ([value caseInsensitiveCompare:@"MS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMs);
        }
        if ([value caseInsensitiveCompare:@"MA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMa);
        }
        if ([value caseInsensitiveCompare:@"MZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMz);
        }
        if ([value caseInsensitiveCompare:@"MM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMm);
        }
        if ([value caseInsensitiveCompare:@"NA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNa);
        }
        if ([value caseInsensitiveCompare:@"NR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNr);
        }
        if ([value caseInsensitiveCompare:@"NP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNp);
        }
        if ([value caseInsensitiveCompare:@"NL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNl);
        }
        if ([value caseInsensitiveCompare:@"AN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAn);
        }
        if ([value caseInsensitiveCompare:@"NC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNc);
        }
        if ([value caseInsensitiveCompare:@"NZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNz);
        }
        if ([value caseInsensitiveCompare:@"NI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNi);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNE);
        }
        if ([value caseInsensitiveCompare:@"NG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNg);
        }
        if ([value caseInsensitiveCompare:@"NU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNu);
        }
        if ([value caseInsensitiveCompare:@"KP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKp);
        }
        if ([value caseInsensitiveCompare:@"MP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMp);
        }
        if ([value caseInsensitiveCompare:@"NO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNo);
        }
        if ([value caseInsensitiveCompare:@"OM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeOm);
        }
        if ([value caseInsensitiveCompare:@"PK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePk);
        }
        if ([value caseInsensitiveCompare:@"PW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePw);
        }
        if ([value caseInsensitiveCompare:@"PA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePa);
        }
        if ([value caseInsensitiveCompare:@"PG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePg);
        }
        if ([value caseInsensitiveCompare:@"PY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePy);
        }
        if ([value caseInsensitiveCompare:@"PE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePe);
        }
        if ([value caseInsensitiveCompare:@"PH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePh);
        }
        if ([value caseInsensitiveCompare:@"PN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePn);
        }
        if ([value caseInsensitiveCompare:@"PL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePl);
        }
        if ([value caseInsensitiveCompare:@"PT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePt);
        }
        if ([value caseInsensitiveCompare:@"PR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePr);
        }
        if ([value caseInsensitiveCompare:@"QA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeQa);
        }
        if ([value caseInsensitiveCompare:@"CG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCg);
        }
        if ([value caseInsensitiveCompare:@"RE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRe);
        }
        if ([value caseInsensitiveCompare:@"RO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRo);
        }
        if ([value caseInsensitiveCompare:@"RU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRu);
        }
        if ([value caseInsensitiveCompare:@"RW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRw);
        }
        if ([value caseInsensitiveCompare:@"BL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBl);
        }
        if ([value caseInsensitiveCompare:@"SH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSh);
        }
        if ([value caseInsensitiveCompare:@"KN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKn);
        }
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLc);
        }
        if ([value caseInsensitiveCompare:@"MF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMf);
        }
        if ([value caseInsensitiveCompare:@"PM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePm);
        }
        if ([value caseInsensitiveCompare:@"VC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVc);
        }
        if ([value caseInsensitiveCompare:@"WS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeWs);
        }
        if ([value caseInsensitiveCompare:@"SM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSm);
        }
        if ([value caseInsensitiveCompare:@"ST"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSt);
        }
        if ([value caseInsensitiveCompare:@"SA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSa);
        }
        if ([value caseInsensitiveCompare:@"SN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSn);
        }
        if ([value caseInsensitiveCompare:@"RS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRs);
        }
        if ([value caseInsensitiveCompare:@"SC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSc);
        }
        if ([value caseInsensitiveCompare:@"SL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSl);
        }
        if ([value caseInsensitiveCompare:@"SG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSg);
        }
        if ([value caseInsensitiveCompare:@"SX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSx);
        }
        if ([value caseInsensitiveCompare:@"SK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSk);
        }
        if ([value caseInsensitiveCompare:@"SI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSi);
        }
        if ([value caseInsensitiveCompare:@"SB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSb);
        }
        if ([value caseInsensitiveCompare:@"SO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSo);
        }
        if ([value caseInsensitiveCompare:@"ZA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZa);
        }
        if ([value caseInsensitiveCompare:@"KR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKr);
        }
        if ([value caseInsensitiveCompare:@"ES"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEs);
        }
        if ([value caseInsensitiveCompare:@"LK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLk);
        }
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSd);
        }
        if ([value caseInsensitiveCompare:@"SR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSr);
        }
        if ([value caseInsensitiveCompare:@"SJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSj);
        }
        if ([value caseInsensitiveCompare:@"SZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSz);
        }
        if ([value caseInsensitiveCompare:@"SE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSe);
        }
        if ([value caseInsensitiveCompare:@"CH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCh);
        }
        if ([value caseInsensitiveCompare:@"SY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSy);
        }
        if ([value caseInsensitiveCompare:@"TW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTw);
        }
        if ([value caseInsensitiveCompare:@"TJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTj);
        }
        if ([value caseInsensitiveCompare:@"TZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTz);
        }
        if ([value caseInsensitiveCompare:@"TH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTh);
        }
        if ([value caseInsensitiveCompare:@"TG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTg);
        }
        if ([value caseInsensitiveCompare:@"TK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTk);
        }
        if ([value caseInsensitiveCompare:@"TO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTo);
        }
        if ([value caseInsensitiveCompare:@"TT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTt);
        }
        if ([value caseInsensitiveCompare:@"TN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTn);
        }
        if ([value caseInsensitiveCompare:@"TR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTr);
        }
        if ([value caseInsensitiveCompare:@"TM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTm);
        }
        if ([value caseInsensitiveCompare:@"TC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTc);
        }
        if ([value caseInsensitiveCompare:@"TV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTv);
        }
        if ([value caseInsensitiveCompare:@"VI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVi);
        }
        if ([value caseInsensitiveCompare:@"UG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUg);
        }
        if ([value caseInsensitiveCompare:@"UA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUa);
        }
        if ([value caseInsensitiveCompare:@"AE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAe);
        }
        if ([value caseInsensitiveCompare:@"GB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGb);
        }
        if ([value caseInsensitiveCompare:@"US"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUs);
        }
        if ([value caseInsensitiveCompare:@"UY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUy);
        }
        if ([value caseInsensitiveCompare:@"UZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUz);
        }
        if ([value caseInsensitiveCompare:@"VU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVu);
        }
        if ([value caseInsensitiveCompare:@"VA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVa);
        }
        if ([value caseInsensitiveCompare:@"VE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVe);
        }
        if ([value caseInsensitiveCompare:@"VN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVn);
        }
        if ([value caseInsensitiveCompare:@"WF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeWf);
        }
        if ([value caseInsensitiveCompare:@"EH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEh);
        }
        if ([value caseInsensitiveCompare:@"YE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeYe);
        }
        if ([value caseInsensitiveCompare:@"ZM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZm);
        }
        if ([value caseInsensitiveCompare:@"ZW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZw);
        }
        return @(AWSConnectPhoneNumberCountryCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneNumberCountryCodeAf:
                return @"AF";
            case AWSConnectPhoneNumberCountryCodeAl:
                return @"AL";
            case AWSConnectPhoneNumberCountryCodeDz:
                return @"DZ";
            case AWSConnectPhoneNumberCountryCodeAs:
                return @"AS";
            case AWSConnectPhoneNumberCountryCodeAd:
                return @"AD";
            case AWSConnectPhoneNumberCountryCodeAo:
                return @"AO";
            case AWSConnectPhoneNumberCountryCodeAi:
                return @"AI";
            case AWSConnectPhoneNumberCountryCodeAq:
                return @"AQ";
            case AWSConnectPhoneNumberCountryCodeAg:
                return @"AG";
            case AWSConnectPhoneNumberCountryCodeAr:
                return @"AR";
            case AWSConnectPhoneNumberCountryCodeAm:
                return @"AM";
            case AWSConnectPhoneNumberCountryCodeAw:
                return @"AW";
            case AWSConnectPhoneNumberCountryCodeAu:
                return @"AU";
            case AWSConnectPhoneNumberCountryCodeAt:
                return @"AT";
            case AWSConnectPhoneNumberCountryCodeAz:
                return @"AZ";
            case AWSConnectPhoneNumberCountryCodeBs:
                return @"BS";
            case AWSConnectPhoneNumberCountryCodeBh:
                return @"BH";
            case AWSConnectPhoneNumberCountryCodeBd:
                return @"BD";
            case AWSConnectPhoneNumberCountryCodeBb:
                return @"BB";
            case AWSConnectPhoneNumberCountryCodeBy:
                return @"BY";
            case AWSConnectPhoneNumberCountryCodeBe:
                return @"BE";
            case AWSConnectPhoneNumberCountryCodeBz:
                return @"BZ";
            case AWSConnectPhoneNumberCountryCodeBj:
                return @"BJ";
            case AWSConnectPhoneNumberCountryCodeBm:
                return @"BM";
            case AWSConnectPhoneNumberCountryCodeBt:
                return @"BT";
            case AWSConnectPhoneNumberCountryCodeBo:
                return @"BO";
            case AWSConnectPhoneNumberCountryCodeBa:
                return @"BA";
            case AWSConnectPhoneNumberCountryCodeBw:
                return @"BW";
            case AWSConnectPhoneNumberCountryCodeBr:
                return @"BR";
            case AWSConnectPhoneNumberCountryCodeIo:
                return @"IO";
            case AWSConnectPhoneNumberCountryCodeVg:
                return @"VG";
            case AWSConnectPhoneNumberCountryCodeBn:
                return @"BN";
            case AWSConnectPhoneNumberCountryCodeBg:
                return @"BG";
            case AWSConnectPhoneNumberCountryCodeBf:
                return @"BF";
            case AWSConnectPhoneNumberCountryCodeBi:
                return @"BI";
            case AWSConnectPhoneNumberCountryCodeKh:
                return @"KH";
            case AWSConnectPhoneNumberCountryCodeCm:
                return @"CM";
            case AWSConnectPhoneNumberCountryCodeCa:
                return @"CA";
            case AWSConnectPhoneNumberCountryCodeCv:
                return @"CV";
            case AWSConnectPhoneNumberCountryCodeKy:
                return @"KY";
            case AWSConnectPhoneNumberCountryCodeCf:
                return @"CF";
            case AWSConnectPhoneNumberCountryCodeTd:
                return @"TD";
            case AWSConnectPhoneNumberCountryCodeCl:
                return @"CL";
            case AWSConnectPhoneNumberCountryCodeCn:
                return @"CN";
            case AWSConnectPhoneNumberCountryCodeCx:
                return @"CX";
            case AWSConnectPhoneNumberCountryCodeCc:
                return @"CC";
            case AWSConnectPhoneNumberCountryCodeCo:
                return @"CO";
            case AWSConnectPhoneNumberCountryCodeKm:
                return @"KM";
            case AWSConnectPhoneNumberCountryCodeCk:
                return @"CK";
            case AWSConnectPhoneNumberCountryCodeCr:
                return @"CR";
            case AWSConnectPhoneNumberCountryCodeHr:
                return @"HR";
            case AWSConnectPhoneNumberCountryCodeCu:
                return @"CU";
            case AWSConnectPhoneNumberCountryCodeCw:
                return @"CW";
            case AWSConnectPhoneNumberCountryCodeCy:
                return @"CY";
            case AWSConnectPhoneNumberCountryCodeCz:
                return @"CZ";
            case AWSConnectPhoneNumberCountryCodeCd:
                return @"CD";
            case AWSConnectPhoneNumberCountryCodeDk:
                return @"DK";
            case AWSConnectPhoneNumberCountryCodeDj:
                return @"DJ";
            case AWSConnectPhoneNumberCountryCodeDm:
                return @"DM";
            case AWSConnectPhoneNumberCountryCodeDo:
                return @"DO";
            case AWSConnectPhoneNumberCountryCodeTl:
                return @"TL";
            case AWSConnectPhoneNumberCountryCodeEc:
                return @"EC";
            case AWSConnectPhoneNumberCountryCodeEg:
                return @"EG";
            case AWSConnectPhoneNumberCountryCodeSv:
                return @"SV";
            case AWSConnectPhoneNumberCountryCodeGq:
                return @"GQ";
            case AWSConnectPhoneNumberCountryCodeEr:
                return @"ER";
            case AWSConnectPhoneNumberCountryCodeEe:
                return @"EE";
            case AWSConnectPhoneNumberCountryCodeEt:
                return @"ET";
            case AWSConnectPhoneNumberCountryCodeFk:
                return @"FK";
            case AWSConnectPhoneNumberCountryCodeFo:
                return @"FO";
            case AWSConnectPhoneNumberCountryCodeFj:
                return @"FJ";
            case AWSConnectPhoneNumberCountryCodeFi:
                return @"FI";
            case AWSConnectPhoneNumberCountryCodeFr:
                return @"FR";
            case AWSConnectPhoneNumberCountryCodePf:
                return @"PF";
            case AWSConnectPhoneNumberCountryCodeGa:
                return @"GA";
            case AWSConnectPhoneNumberCountryCodeGm:
                return @"GM";
            case AWSConnectPhoneNumberCountryCodeGE:
                return @"GE";
            case AWSConnectPhoneNumberCountryCodeDe:
                return @"DE";
            case AWSConnectPhoneNumberCountryCodeGh:
                return @"GH";
            case AWSConnectPhoneNumberCountryCodeGi:
                return @"GI";
            case AWSConnectPhoneNumberCountryCodeGr:
                return @"GR";
            case AWSConnectPhoneNumberCountryCodeGl:
                return @"GL";
            case AWSConnectPhoneNumberCountryCodeGd:
                return @"GD";
            case AWSConnectPhoneNumberCountryCodeGu:
                return @"GU";
            case AWSConnectPhoneNumberCountryCodeGT:
                return @"GT";
            case AWSConnectPhoneNumberCountryCodeGg:
                return @"GG";
            case AWSConnectPhoneNumberCountryCodeGn:
                return @"GN";
            case AWSConnectPhoneNumberCountryCodeGw:
                return @"GW";
            case AWSConnectPhoneNumberCountryCodeGy:
                return @"GY";
            case AWSConnectPhoneNumberCountryCodeHt:
                return @"HT";
            case AWSConnectPhoneNumberCountryCodeHn:
                return @"HN";
            case AWSConnectPhoneNumberCountryCodeHk:
                return @"HK";
            case AWSConnectPhoneNumberCountryCodeHu:
                return @"HU";
            case AWSConnectPhoneNumberCountryCodeIs:
                return @"IS";
            case AWSConnectPhoneNumberCountryCodeIN:
                return @"IN";
            case AWSConnectPhoneNumberCountryCodeId:
                return @"ID";
            case AWSConnectPhoneNumberCountryCodeIr:
                return @"IR";
            case AWSConnectPhoneNumberCountryCodeIq:
                return @"IQ";
            case AWSConnectPhoneNumberCountryCodeIe:
                return @"IE";
            case AWSConnectPhoneNumberCountryCodeIm:
                return @"IM";
            case AWSConnectPhoneNumberCountryCodeIl:
                return @"IL";
            case AWSConnectPhoneNumberCountryCodeIt:
                return @"IT";
            case AWSConnectPhoneNumberCountryCodeCi:
                return @"CI";
            case AWSConnectPhoneNumberCountryCodeJm:
                return @"JM";
            case AWSConnectPhoneNumberCountryCodeJp:
                return @"JP";
            case AWSConnectPhoneNumberCountryCodeJe:
                return @"JE";
            case AWSConnectPhoneNumberCountryCodeJo:
                return @"JO";
            case AWSConnectPhoneNumberCountryCodeKz:
                return @"KZ";
            case AWSConnectPhoneNumberCountryCodeKe:
                return @"KE";
            case AWSConnectPhoneNumberCountryCodeKi:
                return @"KI";
            case AWSConnectPhoneNumberCountryCodeKw:
                return @"KW";
            case AWSConnectPhoneNumberCountryCodeKg:
                return @"KG";
            case AWSConnectPhoneNumberCountryCodeLa:
                return @"LA";
            case AWSConnectPhoneNumberCountryCodeLv:
                return @"LV";
            case AWSConnectPhoneNumberCountryCodeLb:
                return @"LB";
            case AWSConnectPhoneNumberCountryCodeLs:
                return @"LS";
            case AWSConnectPhoneNumberCountryCodeLr:
                return @"LR";
            case AWSConnectPhoneNumberCountryCodeLy:
                return @"LY";
            case AWSConnectPhoneNumberCountryCodeLi:
                return @"LI";
            case AWSConnectPhoneNumberCountryCodeLT:
                return @"LT";
            case AWSConnectPhoneNumberCountryCodeLu:
                return @"LU";
            case AWSConnectPhoneNumberCountryCodeMo:
                return @"MO";
            case AWSConnectPhoneNumberCountryCodeMk:
                return @"MK";
            case AWSConnectPhoneNumberCountryCodeMg:
                return @"MG";
            case AWSConnectPhoneNumberCountryCodeMw:
                return @"MW";
            case AWSConnectPhoneNumberCountryCodeMy:
                return @"MY";
            case AWSConnectPhoneNumberCountryCodeMv:
                return @"MV";
            case AWSConnectPhoneNumberCountryCodeMl:
                return @"ML";
            case AWSConnectPhoneNumberCountryCodeMt:
                return @"MT";
            case AWSConnectPhoneNumberCountryCodeMh:
                return @"MH";
            case AWSConnectPhoneNumberCountryCodeMr:
                return @"MR";
            case AWSConnectPhoneNumberCountryCodeMu:
                return @"MU";
            case AWSConnectPhoneNumberCountryCodeYt:
                return @"YT";
            case AWSConnectPhoneNumberCountryCodeMx:
                return @"MX";
            case AWSConnectPhoneNumberCountryCodeFm:
                return @"FM";
            case AWSConnectPhoneNumberCountryCodeMd:
                return @"MD";
            case AWSConnectPhoneNumberCountryCodeMc:
                return @"MC";
            case AWSConnectPhoneNumberCountryCodeMn:
                return @"MN";
            case AWSConnectPhoneNumberCountryCodeMe:
                return @"ME";
            case AWSConnectPhoneNumberCountryCodeMs:
                return @"MS";
            case AWSConnectPhoneNumberCountryCodeMa:
                return @"MA";
            case AWSConnectPhoneNumberCountryCodeMz:
                return @"MZ";
            case AWSConnectPhoneNumberCountryCodeMm:
                return @"MM";
            case AWSConnectPhoneNumberCountryCodeNa:
                return @"NA";
            case AWSConnectPhoneNumberCountryCodeNr:
                return @"NR";
            case AWSConnectPhoneNumberCountryCodeNp:
                return @"NP";
            case AWSConnectPhoneNumberCountryCodeNl:
                return @"NL";
            case AWSConnectPhoneNumberCountryCodeAn:
                return @"AN";
            case AWSConnectPhoneNumberCountryCodeNc:
                return @"NC";
            case AWSConnectPhoneNumberCountryCodeNz:
                return @"NZ";
            case AWSConnectPhoneNumberCountryCodeNi:
                return @"NI";
            case AWSConnectPhoneNumberCountryCodeNE:
                return @"NE";
            case AWSConnectPhoneNumberCountryCodeNg:
                return @"NG";
            case AWSConnectPhoneNumberCountryCodeNu:
                return @"NU";
            case AWSConnectPhoneNumberCountryCodeKp:
                return @"KP";
            case AWSConnectPhoneNumberCountryCodeMp:
                return @"MP";
            case AWSConnectPhoneNumberCountryCodeNo:
                return @"NO";
            case AWSConnectPhoneNumberCountryCodeOm:
                return @"OM";
            case AWSConnectPhoneNumberCountryCodePk:
                return @"PK";
            case AWSConnectPhoneNumberCountryCodePw:
                return @"PW";
            case AWSConnectPhoneNumberCountryCodePa:
                return @"PA";
            case AWSConnectPhoneNumberCountryCodePg:
                return @"PG";
            case AWSConnectPhoneNumberCountryCodePy:
                return @"PY";
            case AWSConnectPhoneNumberCountryCodePe:
                return @"PE";
            case AWSConnectPhoneNumberCountryCodePh:
                return @"PH";
            case AWSConnectPhoneNumberCountryCodePn:
                return @"PN";
            case AWSConnectPhoneNumberCountryCodePl:
                return @"PL";
            case AWSConnectPhoneNumberCountryCodePt:
                return @"PT";
            case AWSConnectPhoneNumberCountryCodePr:
                return @"PR";
            case AWSConnectPhoneNumberCountryCodeQa:
                return @"QA";
            case AWSConnectPhoneNumberCountryCodeCg:
                return @"CG";
            case AWSConnectPhoneNumberCountryCodeRe:
                return @"RE";
            case AWSConnectPhoneNumberCountryCodeRo:
                return @"RO";
            case AWSConnectPhoneNumberCountryCodeRu:
                return @"RU";
            case AWSConnectPhoneNumberCountryCodeRw:
                return @"RW";
            case AWSConnectPhoneNumberCountryCodeBl:
                return @"BL";
            case AWSConnectPhoneNumberCountryCodeSh:
                return @"SH";
            case AWSConnectPhoneNumberCountryCodeKn:
                return @"KN";
            case AWSConnectPhoneNumberCountryCodeLc:
                return @"LC";
            case AWSConnectPhoneNumberCountryCodeMf:
                return @"MF";
            case AWSConnectPhoneNumberCountryCodePm:
                return @"PM";
            case AWSConnectPhoneNumberCountryCodeVc:
                return @"VC";
            case AWSConnectPhoneNumberCountryCodeWs:
                return @"WS";
            case AWSConnectPhoneNumberCountryCodeSm:
                return @"SM";
            case AWSConnectPhoneNumberCountryCodeSt:
                return @"ST";
            case AWSConnectPhoneNumberCountryCodeSa:
                return @"SA";
            case AWSConnectPhoneNumberCountryCodeSn:
                return @"SN";
            case AWSConnectPhoneNumberCountryCodeRs:
                return @"RS";
            case AWSConnectPhoneNumberCountryCodeSc:
                return @"SC";
            case AWSConnectPhoneNumberCountryCodeSl:
                return @"SL";
            case AWSConnectPhoneNumberCountryCodeSg:
                return @"SG";
            case AWSConnectPhoneNumberCountryCodeSx:
                return @"SX";
            case AWSConnectPhoneNumberCountryCodeSk:
                return @"SK";
            case AWSConnectPhoneNumberCountryCodeSi:
                return @"SI";
            case AWSConnectPhoneNumberCountryCodeSb:
                return @"SB";
            case AWSConnectPhoneNumberCountryCodeSo:
                return @"SO";
            case AWSConnectPhoneNumberCountryCodeZa:
                return @"ZA";
            case AWSConnectPhoneNumberCountryCodeKr:
                return @"KR";
            case AWSConnectPhoneNumberCountryCodeEs:
                return @"ES";
            case AWSConnectPhoneNumberCountryCodeLk:
                return @"LK";
            case AWSConnectPhoneNumberCountryCodeSd:
                return @"SD";
            case AWSConnectPhoneNumberCountryCodeSr:
                return @"SR";
            case AWSConnectPhoneNumberCountryCodeSj:
                return @"SJ";
            case AWSConnectPhoneNumberCountryCodeSz:
                return @"SZ";
            case AWSConnectPhoneNumberCountryCodeSe:
                return @"SE";
            case AWSConnectPhoneNumberCountryCodeCh:
                return @"CH";
            case AWSConnectPhoneNumberCountryCodeSy:
                return @"SY";
            case AWSConnectPhoneNumberCountryCodeTw:
                return @"TW";
            case AWSConnectPhoneNumberCountryCodeTj:
                return @"TJ";
            case AWSConnectPhoneNumberCountryCodeTz:
                return @"TZ";
            case AWSConnectPhoneNumberCountryCodeTh:
                return @"TH";
            case AWSConnectPhoneNumberCountryCodeTg:
                return @"TG";
            case AWSConnectPhoneNumberCountryCodeTk:
                return @"TK";
            case AWSConnectPhoneNumberCountryCodeTo:
                return @"TO";
            case AWSConnectPhoneNumberCountryCodeTt:
                return @"TT";
            case AWSConnectPhoneNumberCountryCodeTn:
                return @"TN";
            case AWSConnectPhoneNumberCountryCodeTr:
                return @"TR";
            case AWSConnectPhoneNumberCountryCodeTm:
                return @"TM";
            case AWSConnectPhoneNumberCountryCodeTc:
                return @"TC";
            case AWSConnectPhoneNumberCountryCodeTv:
                return @"TV";
            case AWSConnectPhoneNumberCountryCodeVi:
                return @"VI";
            case AWSConnectPhoneNumberCountryCodeUg:
                return @"UG";
            case AWSConnectPhoneNumberCountryCodeUa:
                return @"UA";
            case AWSConnectPhoneNumberCountryCodeAe:
                return @"AE";
            case AWSConnectPhoneNumberCountryCodeGb:
                return @"GB";
            case AWSConnectPhoneNumberCountryCodeUs:
                return @"US";
            case AWSConnectPhoneNumberCountryCodeUy:
                return @"UY";
            case AWSConnectPhoneNumberCountryCodeUz:
                return @"UZ";
            case AWSConnectPhoneNumberCountryCodeVu:
                return @"VU";
            case AWSConnectPhoneNumberCountryCodeVa:
                return @"VA";
            case AWSConnectPhoneNumberCountryCodeVe:
                return @"VE";
            case AWSConnectPhoneNumberCountryCodeVn:
                return @"VN";
            case AWSConnectPhoneNumberCountryCodeWf:
                return @"WF";
            case AWSConnectPhoneNumberCountryCodeEh:
                return @"EH";
            case AWSConnectPhoneNumberCountryCodeYe:
                return @"YE";
            case AWSConnectPhoneNumberCountryCodeZm:
                return @"ZM";
            case AWSConnectPhoneNumberCountryCodeZw:
                return @"ZW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)phoneNumberStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectPhoneNumberStatus class]];
}

+ (NSValueTransformer *)phoneNumberTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TOLL_FREE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberTypeTollFree);
        }
        if ([value caseInsensitiveCompare:@"DID"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberTypeDid);
        }
        return @(AWSConnectPhoneNumberTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneNumberTypeTollFree:
                return @"TOLL_FREE";
            case AWSConnectPhoneNumberTypeDid:
                return @"DID";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectContact

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"agentInfo" : @"AgentInfo",
             @"arn" : @"Arn",
             @"channel" : @"Channel",
             @"detail" : @"Description",
             @"disconnectTimestamp" : @"DisconnectTimestamp",
             @"identifier" : @"Id",
             @"initialContactId" : @"InitialContactId",
             @"initiationMethod" : @"InitiationMethod",
             @"initiationTimestamp" : @"InitiationTimestamp",
             @"lastUpdateTimestamp" : @"LastUpdateTimestamp",
             @"name" : @"Name",
             @"previousContactId" : @"PreviousContactId",
             @"queueInfo" : @"QueueInfo",
             @"relatedContactId" : @"RelatedContactId",
             @"scheduledTimestamp" : @"ScheduledTimestamp",
             @"wisdomInfo" : @"WisdomInfo",
             };
}

+ (NSValueTransformer *)agentInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectAgentInfo class]];
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSConnectChannelVoice);
        }
        if ([value caseInsensitiveCompare:@"CHAT"] == NSOrderedSame) {
            return @(AWSConnectChannelChat);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSConnectChannelTask);
        }
        return @(AWSConnectChannelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectChannelVoice:
                return @"VOICE";
            case AWSConnectChannelChat:
                return @"CHAT";
            case AWSConnectChannelTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)disconnectTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)initiationMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INBOUND"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodInbound);
        }
        if ([value caseInsensitiveCompare:@"OUTBOUND"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodOutbound);
        }
        if ([value caseInsensitiveCompare:@"TRANSFER"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodTransfer);
        }
        if ([value caseInsensitiveCompare:@"QUEUE_TRANSFER"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodQueueTransfer);
        }
        if ([value caseInsensitiveCompare:@"CALLBACK"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodCallback);
        }
        if ([value caseInsensitiveCompare:@"API"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodApi);
        }
        if ([value caseInsensitiveCompare:@"DISCONNECT"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodDisconnect);
        }
        if ([value caseInsensitiveCompare:@"MONITOR"] == NSOrderedSame) {
            return @(AWSConnectContactInitiationMethodMonitor);
        }
        return @(AWSConnectContactInitiationMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactInitiationMethodInbound:
                return @"INBOUND";
            case AWSConnectContactInitiationMethodOutbound:
                return @"OUTBOUND";
            case AWSConnectContactInitiationMethodTransfer:
                return @"TRANSFER";
            case AWSConnectContactInitiationMethodQueueTransfer:
                return @"QUEUE_TRANSFER";
            case AWSConnectContactInitiationMethodCallback:
                return @"CALLBACK";
            case AWSConnectContactInitiationMethodApi:
                return @"API";
            case AWSConnectContactInitiationMethodDisconnect:
                return @"DISCONNECT";
            case AWSConnectContactInitiationMethodMonitor:
                return @"MONITOR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)initiationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdateTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)queueInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQueueInfo class]];
}

+ (NSValueTransformer *)scheduledTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)wisdomInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectWisdomInfo class]];
}

@end

@implementation AWSConnectContactFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactStates" : @"ContactStates",
             };
}

@end

@implementation AWSConnectContactFlow

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"content" : @"Content",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectContactFlowStateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSConnectContactFlowStateArchived);
        }
        return @(AWSConnectContactFlowStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactFlowStateActive:
                return @"ACTIVE";
            case AWSConnectContactFlowStateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTACT_FLOW"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeContactFlow);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_QUEUE"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeCustomerQueue);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_HOLD"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeCustomerHold);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_WHISPER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeCustomerWhisper);
        }
        if ([value caseInsensitiveCompare:@"AGENT_HOLD"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeAgentHold);
        }
        if ([value caseInsensitiveCompare:@"AGENT_WHISPER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeAgentWhisper);
        }
        if ([value caseInsensitiveCompare:@"OUTBOUND_WHISPER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeOutboundWhisper);
        }
        if ([value caseInsensitiveCompare:@"AGENT_TRANSFER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeAgentTransfer);
        }
        if ([value caseInsensitiveCompare:@"QUEUE_TRANSFER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeQueueTransfer);
        }
        return @(AWSConnectContactFlowTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactFlowTypeContactFlow:
                return @"CONTACT_FLOW";
            case AWSConnectContactFlowTypeCustomerQueue:
                return @"CUSTOMER_QUEUE";
            case AWSConnectContactFlowTypeCustomerHold:
                return @"CUSTOMER_HOLD";
            case AWSConnectContactFlowTypeCustomerWhisper:
                return @"CUSTOMER_WHISPER";
            case AWSConnectContactFlowTypeAgentHold:
                return @"AGENT_HOLD";
            case AWSConnectContactFlowTypeAgentWhisper:
                return @"AGENT_WHISPER";
            case AWSConnectContactFlowTypeOutboundWhisper:
                return @"OUTBOUND_WHISPER";
            case AWSConnectContactFlowTypeAgentTransfer:
                return @"AGENT_TRANSFER";
            case AWSConnectContactFlowTypeQueueTransfer:
                return @"QUEUE_TRANSFER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectContactFlowModule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"content" : @"Content",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"state" : @"State",
             @"status" : @"Status",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectContactFlowModuleStateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSConnectContactFlowModuleStateArchived);
        }
        return @(AWSConnectContactFlowModuleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactFlowModuleStateActive:
                return @"ACTIVE";
            case AWSConnectContactFlowModuleStateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLISHED"] == NSOrderedSame) {
            return @(AWSConnectContactFlowModuleStatusPublished);
        }
        if ([value caseInsensitiveCompare:@"SAVED"] == NSOrderedSame) {
            return @(AWSConnectContactFlowModuleStatusSaved);
        }
        return @(AWSConnectContactFlowModuleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactFlowModuleStatusPublished:
                return @"PUBLISHED";
            case AWSConnectContactFlowModuleStatusSaved:
                return @"SAVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectContactFlowModuleSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectContactFlowModuleStateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSConnectContactFlowModuleStateArchived);
        }
        return @(AWSConnectContactFlowModuleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactFlowModuleStateActive:
                return @"ACTIVE";
            case AWSConnectContactFlowModuleStateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectContactFlowSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"contactFlowState" : @"ContactFlowState",
             @"contactFlowType" : @"ContactFlowType",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)contactFlowStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectContactFlowStateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSConnectContactFlowStateArchived);
        }
        return @(AWSConnectContactFlowStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactFlowStateActive:
                return @"ACTIVE";
            case AWSConnectContactFlowStateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)contactFlowTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTACT_FLOW"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeContactFlow);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_QUEUE"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeCustomerQueue);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_HOLD"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeCustomerHold);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_WHISPER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeCustomerWhisper);
        }
        if ([value caseInsensitiveCompare:@"AGENT_HOLD"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeAgentHold);
        }
        if ([value caseInsensitiveCompare:@"AGENT_WHISPER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeAgentWhisper);
        }
        if ([value caseInsensitiveCompare:@"OUTBOUND_WHISPER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeOutboundWhisper);
        }
        if ([value caseInsensitiveCompare:@"AGENT_TRANSFER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeAgentTransfer);
        }
        if ([value caseInsensitiveCompare:@"QUEUE_TRANSFER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeQueueTransfer);
        }
        return @(AWSConnectContactFlowTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactFlowTypeContactFlow:
                return @"CONTACT_FLOW";
            case AWSConnectContactFlowTypeCustomerQueue:
                return @"CUSTOMER_QUEUE";
            case AWSConnectContactFlowTypeCustomerHold:
                return @"CUSTOMER_HOLD";
            case AWSConnectContactFlowTypeCustomerWhisper:
                return @"CUSTOMER_WHISPER";
            case AWSConnectContactFlowTypeAgentHold:
                return @"AGENT_HOLD";
            case AWSConnectContactFlowTypeAgentWhisper:
                return @"AGENT_WHISPER";
            case AWSConnectContactFlowTypeOutboundWhisper:
                return @"OUTBOUND_WHISPER";
            case AWSConnectContactFlowTypeAgentTransfer:
                return @"AGENT_TRANSFER";
            case AWSConnectContactFlowTypeQueueTransfer:
                return @"QUEUE_TRANSFER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectControlPlaneTagFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"andConditions" : @"AndConditions",
             @"orConditions" : @"OrConditions",
             @"tagCondition" : @"TagCondition",
             };
}

+ (NSValueTransformer *)andConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectTagCondition class]];
}

+ (NSValueTransformer *)tagConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTagCondition class]];
}

@end

@implementation AWSConnectCreateAgentStatusRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"displayOrder" : @"DisplayOrder",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusStateDisabled);
        }
        return @(AWSConnectAgentStatusStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectAgentStatusStateEnabled:
                return @"ENABLED";
            case AWSConnectAgentStatusStateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectCreateAgentStatusResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"agentStatusARN" : @"AgentStatusARN",
             @"agentStatusId" : @"AgentStatusId",
             };
}

@end

@implementation AWSConnectCreateContactFlowModuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"content" : @"Content",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSConnectCreateContactFlowModuleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectCreateContactFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTACT_FLOW"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeContactFlow);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_QUEUE"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeCustomerQueue);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_HOLD"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeCustomerHold);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_WHISPER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeCustomerWhisper);
        }
        if ([value caseInsensitiveCompare:@"AGENT_HOLD"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeAgentHold);
        }
        if ([value caseInsensitiveCompare:@"AGENT_WHISPER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeAgentWhisper);
        }
        if ([value caseInsensitiveCompare:@"OUTBOUND_WHISPER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeOutboundWhisper);
        }
        if ([value caseInsensitiveCompare:@"AGENT_TRANSFER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeAgentTransfer);
        }
        if ([value caseInsensitiveCompare:@"QUEUE_TRANSFER"] == NSOrderedSame) {
            return @(AWSConnectContactFlowTypeQueueTransfer);
        }
        return @(AWSConnectContactFlowTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactFlowTypeContactFlow:
                return @"CONTACT_FLOW";
            case AWSConnectContactFlowTypeCustomerQueue:
                return @"CUSTOMER_QUEUE";
            case AWSConnectContactFlowTypeCustomerHold:
                return @"CUSTOMER_HOLD";
            case AWSConnectContactFlowTypeCustomerWhisper:
                return @"CUSTOMER_WHISPER";
            case AWSConnectContactFlowTypeAgentHold:
                return @"AGENT_HOLD";
            case AWSConnectContactFlowTypeAgentWhisper:
                return @"AGENT_WHISPER";
            case AWSConnectContactFlowTypeOutboundWhisper:
                return @"OUTBOUND_WHISPER";
            case AWSConnectContactFlowTypeAgentTransfer:
                return @"AGENT_TRANSFER";
            case AWSConnectContactFlowTypeQueueTransfer:
                return @"QUEUE_TRANSFER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectCreateContactFlowResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowArn" : @"ContactFlowArn",
             @"contactFlowId" : @"ContactFlowId",
             };
}

@end

@implementation AWSConnectCreateHoursOfOperationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"config" : @"Config",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"tags" : @"Tags",
             @"timeZone" : @"TimeZone",
             };
}

+ (NSValueTransformer *)configJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectHoursOfOperationConfig class]];
}

@end

@implementation AWSConnectCreateHoursOfOperationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hoursOfOperationArn" : @"HoursOfOperationArn",
             @"hoursOfOperationId" : @"HoursOfOperationId",
             };
}

@end

@implementation AWSConnectCreateInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"directoryId" : @"DirectoryId",
             @"identityManagementType" : @"IdentityManagementType",
             @"inboundCallsEnabled" : @"InboundCallsEnabled",
             @"instanceAlias" : @"InstanceAlias",
             @"outboundCallsEnabled" : @"OutboundCallsEnabled",
             };
}

+ (NSValueTransformer *)identityManagementTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAML"] == NSOrderedSame) {
            return @(AWSConnectDirectoryTypeSaml);
        }
        if ([value caseInsensitiveCompare:@"CONNECT_MANAGED"] == NSOrderedSame) {
            return @(AWSConnectDirectoryTypeConnectManaged);
        }
        if ([value caseInsensitiveCompare:@"EXISTING_DIRECTORY"] == NSOrderedSame) {
            return @(AWSConnectDirectoryTypeExistingDirectory);
        }
        return @(AWSConnectDirectoryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectDirectoryTypeSaml:
                return @"SAML";
            case AWSConnectDirectoryTypeConnectManaged:
                return @"CONNECT_MANAGED";
            case AWSConnectDirectoryTypeExistingDirectory:
                return @"EXISTING_DIRECTORY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectCreateInstanceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectCreateIntegrationAssociationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"integrationArn" : @"IntegrationArn",
             @"integrationType" : @"IntegrationType",
             @"sourceApplicationName" : @"SourceApplicationName",
             @"sourceApplicationUrl" : @"SourceApplicationUrl",
             @"sourceType" : @"SourceType",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeEvent);
        }
        if ([value caseInsensitiveCompare:@"VOICE_ID"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeVoiceId);
        }
        if ([value caseInsensitiveCompare:@"PINPOINT_APP"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypePinpointApp);
        }
        if ([value caseInsensitiveCompare:@"WISDOM_ASSISTANT"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeWisdomAssistant);
        }
        if ([value caseInsensitiveCompare:@"WISDOM_KNOWLEDGE_BASE"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeWisdomKnowledgeBase);
        }
        if ([value caseInsensitiveCompare:@"CASES_DOMAIN"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeCasesDomain);
        }
        return @(AWSConnectIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectIntegrationTypeEvent:
                return @"EVENT";
            case AWSConnectIntegrationTypeVoiceId:
                return @"VOICE_ID";
            case AWSConnectIntegrationTypePinpointApp:
                return @"PINPOINT_APP";
            case AWSConnectIntegrationTypeWisdomAssistant:
                return @"WISDOM_ASSISTANT";
            case AWSConnectIntegrationTypeWisdomKnowledgeBase:
                return @"WISDOM_KNOWLEDGE_BASE";
            case AWSConnectIntegrationTypeCasesDomain:
                return @"CASES_DOMAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SALESFORCE"] == NSOrderedSame) {
            return @(AWSConnectSourceTypeSalesforce);
        }
        if ([value caseInsensitiveCompare:@"ZENDESK"] == NSOrderedSame) {
            return @(AWSConnectSourceTypeZendesk);
        }
        return @(AWSConnectSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectSourceTypeSalesforce:
                return @"SALESFORCE";
            case AWSConnectSourceTypeZendesk:
                return @"ZENDESK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectCreateIntegrationAssociationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"integrationAssociationArn" : @"IntegrationAssociationArn",
             @"integrationAssociationId" : @"IntegrationAssociationId",
             };
}

@end

@implementation AWSConnectCreateParticipantRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             @"participantDetails" : @"ParticipantDetails",
             };
}

+ (NSValueTransformer *)participantDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectParticipantDetailsToAdd class]];
}

@end

@implementation AWSConnectCreateParticipantResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"participantCredentials" : @"ParticipantCredentials",
             @"participantId" : @"ParticipantId",
             };
}

+ (NSValueTransformer *)participantCredentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectParticipantTokenCredentials class]];
}

@end

@implementation AWSConnectCreateQueueRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"hoursOfOperationId" : @"HoursOfOperationId",
             @"instanceId" : @"InstanceId",
             @"maxContacts" : @"MaxContacts",
             @"name" : @"Name",
             @"outboundCallerConfig" : @"OutboundCallerConfig",
             @"quickConnectIds" : @"QuickConnectIds",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)outboundCallerConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectOutboundCallerConfig class]];
}

@end

@implementation AWSConnectCreateQueueResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueArn" : @"QueueArn",
             @"queueId" : @"QueueId",
             };
}

@end

@implementation AWSConnectCreateQuickConnectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"quickConnectConfig" : @"QuickConnectConfig",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)quickConnectConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQuickConnectConfig class]];
}

@end

@implementation AWSConnectCreateQuickConnectResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"quickConnectARN" : @"QuickConnectARN",
             @"quickConnectId" : @"QuickConnectId",
             };
}

@end

@implementation AWSConnectCreateRoutingProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultOutboundQueueId" : @"DefaultOutboundQueueId",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"mediaConcurrencies" : @"MediaConcurrencies",
             @"name" : @"Name",
             @"queueConfigs" : @"QueueConfigs",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)mediaConcurrenciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectMediaConcurrency class]];
}

+ (NSValueTransformer *)queueConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRoutingProfileQueueConfig class]];
}

@end

@implementation AWSConnectCreateRoutingProfileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"routingProfileArn" : @"RoutingProfileArn",
             @"routingProfileId" : @"RoutingProfileId",
             };
}

@end

@implementation AWSConnectCreateRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"clientToken" : @"ClientToken",
             @"function" : @"Function",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"publishStatus" : @"PublishStatus",
             @"triggerEventSource" : @"TriggerEventSource",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRuleAction class]];
}

+ (NSValueTransformer *)publishStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSConnectRulePublishStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"PUBLISHED"] == NSOrderedSame) {
            return @(AWSConnectRulePublishStatusPublished);
        }
        return @(AWSConnectRulePublishStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectRulePublishStatusDraft:
                return @"DRAFT";
            case AWSConnectRulePublishStatusPublished:
                return @"PUBLISHED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)triggerEventSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectRuleTriggerEventSource class]];
}

@end

@implementation AWSConnectCreateRuleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleArn" : @"RuleArn",
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSConnectCreateSecurityProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedAccessControlTags" : @"AllowedAccessControlTags",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"permissions" : @"Permissions",
             @"securityProfileName" : @"SecurityProfileName",
             @"tagRestrictedResources" : @"TagRestrictedResources",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSConnectCreateSecurityProfileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityProfileArn" : @"SecurityProfileArn",
             @"securityProfileId" : @"SecurityProfileId",
             };
}

@end

@implementation AWSConnectCreateTaskTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"constraints" : @"Constraints",
             @"contactFlowId" : @"ContactFlowId",
             @"defaults" : @"Defaults",
             @"detail" : @"Description",
             @"fields" : @"Fields",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)constraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateConstraints class]];
}

+ (NSValueTransformer *)defaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateDefaults class]];
}

+ (NSValueTransformer *)fieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectTaskTemplateField class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusInactive);
        }
        return @(AWSConnectTaskTemplateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectTaskTemplateStatusActive:
                return @"ACTIVE";
            case AWSConnectTaskTemplateStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectCreateTaskTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectCreateTrafficDistributionGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSConnectCreateTrafficDistributionGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectCreateUseCaseRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"integrationAssociationId" : @"IntegrationAssociationId",
             @"tags" : @"Tags",
             @"useCaseType" : @"UseCaseType",
             };
}

+ (NSValueTransformer *)useCaseTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RULES_EVALUATION"] == NSOrderedSame) {
            return @(AWSConnectUseCaseTypeRulesEvaluation);
        }
        if ([value caseInsensitiveCompare:@"CONNECT_CAMPAIGNS"] == NSOrderedSame) {
            return @(AWSConnectUseCaseTypeConnectCampaigns);
        }
        return @(AWSConnectUseCaseTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectUseCaseTypeRulesEvaluation:
                return @"RULES_EVALUATION";
            case AWSConnectUseCaseTypeConnectCampaigns:
                return @"CONNECT_CAMPAIGNS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectCreateUseCaseResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"useCaseArn" : @"UseCaseArn",
             @"useCaseId" : @"UseCaseId",
             };
}

@end

@implementation AWSConnectCreateUserHierarchyGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"parentGroupId" : @"ParentGroupId",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSConnectCreateUserHierarchyGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyGroupArn" : @"HierarchyGroupArn",
             @"hierarchyGroupId" : @"HierarchyGroupId",
             };
}

@end

@implementation AWSConnectCreateUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directoryUserId" : @"DirectoryUserId",
             @"hierarchyGroupId" : @"HierarchyGroupId",
             @"identityInfo" : @"IdentityInfo",
             @"instanceId" : @"InstanceId",
             @"password" : @"Password",
             @"phoneConfig" : @"PhoneConfig",
             @"routingProfileId" : @"RoutingProfileId",
             @"securityProfileIds" : @"SecurityProfileIds",
             @"tags" : @"Tags",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)identityInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserIdentityInfo class]];
}

+ (NSValueTransformer *)phoneConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserPhoneConfig class]];
}

@end

@implementation AWSConnectCreateUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userArn" : @"UserArn",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectCreateVocabularyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"content" : @"Content",
             @"instanceId" : @"InstanceId",
             @"languageCode" : @"LanguageCode",
             @"tags" : @"Tags",
             @"vocabularyName" : @"VocabularyName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"en-NZ"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnNZ);
        }
        if ([value caseInsensitiveCompare:@"en-ZA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnZA);
        }
        return @(AWSConnectVocabularyLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyLanguageCodeArAE:
                return @"ar-AE";
            case AWSConnectVocabularyLanguageCodeDeCH:
                return @"de-CH";
            case AWSConnectVocabularyLanguageCodeDeDE:
                return @"de-DE";
            case AWSConnectVocabularyLanguageCodeEnAB:
                return @"en-AB";
            case AWSConnectVocabularyLanguageCodeEnAU:
                return @"en-AU";
            case AWSConnectVocabularyLanguageCodeEnGB:
                return @"en-GB";
            case AWSConnectVocabularyLanguageCodeEnIE:
                return @"en-IE";
            case AWSConnectVocabularyLanguageCodeEnIN:
                return @"en-IN";
            case AWSConnectVocabularyLanguageCodeEnUS:
                return @"en-US";
            case AWSConnectVocabularyLanguageCodeEnWL:
                return @"en-WL";
            case AWSConnectVocabularyLanguageCodeEsES:
                return @"es-ES";
            case AWSConnectVocabularyLanguageCodeEsUS:
                return @"es-US";
            case AWSConnectVocabularyLanguageCodeFrCA:
                return @"fr-CA";
            case AWSConnectVocabularyLanguageCodeFrFR:
                return @"fr-FR";
            case AWSConnectVocabularyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSConnectVocabularyLanguageCodeItIT:
                return @"it-IT";
            case AWSConnectVocabularyLanguageCodeJaJP:
                return @"ja-JP";
            case AWSConnectVocabularyLanguageCodeKoKR:
                return @"ko-KR";
            case AWSConnectVocabularyLanguageCodePtBR:
                return @"pt-BR";
            case AWSConnectVocabularyLanguageCodePtPT:
                return @"pt-PT";
            case AWSConnectVocabularyLanguageCodeZhCN:
                return @"zh-CN";
            case AWSConnectVocabularyLanguageCodeEnNZ:
                return @"en-NZ";
            case AWSConnectVocabularyLanguageCodeEnZA:
                return @"en-ZA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectCreateVocabularyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"vocabularyArn" : @"VocabularyArn",
             @"vocabularyId" : @"VocabularyId",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateActive);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateDeleteInProgress);
        }
        return @(AWSConnectVocabularyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyStateCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSConnectVocabularyStateActive:
                return @"ACTIVE";
            case AWSConnectVocabularyStateCreationFailed:
                return @"CREATION_FAILED";
            case AWSConnectVocabularyStateDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectCredentials

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"accessTokenExpiration" : @"AccessTokenExpiration",
             @"refreshToken" : @"RefreshToken",
             @"refreshTokenExpiration" : @"RefreshTokenExpiration",
             };
}

+ (NSValueTransformer *)accessTokenExpirationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)refreshTokenExpirationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSConnectCrossChannelBehavior

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behaviorType" : @"BehaviorType",
             };
}

+ (NSValueTransformer *)behaviorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ROUTE_CURRENT_CHANNEL_ONLY"] == NSOrderedSame) {
            return @(AWSConnectBehaviorTypeRouteCurrentChannelOnly);
        }
        if ([value caseInsensitiveCompare:@"ROUTE_ANY_CHANNEL"] == NSOrderedSame) {
            return @(AWSConnectBehaviorTypeRouteAnyChannel);
        }
        return @(AWSConnectBehaviorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectBehaviorTypeRouteCurrentChannelOnly:
                return @"ROUTE_CURRENT_CHANNEL_ONLY";
            case AWSConnectBehaviorTypeRouteAnyChannel:
                return @"ROUTE_ANY_CHANNEL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectCurrentMetric

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AGENTS_ONLINE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsOnline);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_AVAILABLE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsAvailable);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_ON_CALL"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsOnCall);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_NON_PRODUCTIVE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsNonProductive);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_AFTER_CONTACT_WORK"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsAfterContactWork);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_ERROR"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsError);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_STAFFED"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsStaffed);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_IN_QUEUE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameContactsInQueue);
        }
        if ([value caseInsensitiveCompare:@"OLDEST_CONTACT_AGE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameOldestContactAge);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_SCHEDULED"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameContactsScheduled);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_ON_CONTACT"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsOnContact);
        }
        if ([value caseInsensitiveCompare:@"SLOTS_ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameSlotsActive);
        }
        if ([value caseInsensitiveCompare:@"SLOTS_AVAILABLE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameSlotsAvailable);
        }
        return @(AWSConnectCurrentMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectCurrentMetricNameAgentsOnline:
                return @"AGENTS_ONLINE";
            case AWSConnectCurrentMetricNameAgentsAvailable:
                return @"AGENTS_AVAILABLE";
            case AWSConnectCurrentMetricNameAgentsOnCall:
                return @"AGENTS_ON_CALL";
            case AWSConnectCurrentMetricNameAgentsNonProductive:
                return @"AGENTS_NON_PRODUCTIVE";
            case AWSConnectCurrentMetricNameAgentsAfterContactWork:
                return @"AGENTS_AFTER_CONTACT_WORK";
            case AWSConnectCurrentMetricNameAgentsError:
                return @"AGENTS_ERROR";
            case AWSConnectCurrentMetricNameAgentsStaffed:
                return @"AGENTS_STAFFED";
            case AWSConnectCurrentMetricNameContactsInQueue:
                return @"CONTACTS_IN_QUEUE";
            case AWSConnectCurrentMetricNameOldestContactAge:
                return @"OLDEST_CONTACT_AGE";
            case AWSConnectCurrentMetricNameContactsScheduled:
                return @"CONTACTS_SCHEDULED";
            case AWSConnectCurrentMetricNameAgentsOnContact:
                return @"AGENTS_ON_CONTACT";
            case AWSConnectCurrentMetricNameSlotsActive:
                return @"SLOTS_ACTIVE";
            case AWSConnectCurrentMetricNameSlotsAvailable:
                return @"SLOTS_AVAILABLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSConnectUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSConnectUnitCount);
        }
        if ([value caseInsensitiveCompare:@"PERCENT"] == NSOrderedSame) {
            return @(AWSConnectUnitPercent);
        }
        return @(AWSConnectUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectUnitSeconds:
                return @"SECONDS";
            case AWSConnectUnitCount:
                return @"COUNT";
            case AWSConnectUnitPercent:
                return @"PERCENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectCurrentMetricData

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metric" : @"Metric",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)metricJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectCurrentMetric class]];
}

@end

@implementation AWSConnectCurrentMetricResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collections" : @"Collections",
             @"dimensions" : @"Dimensions",
             };
}

+ (NSValueTransformer *)collectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectCurrentMetricData class]];
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectDimensions class]];
}

@end

@implementation AWSConnectCurrentMetricSortCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sortByMetric" : @"SortByMetric",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)sortByMetricJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AGENTS_ONLINE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsOnline);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_AVAILABLE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsAvailable);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_ON_CALL"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsOnCall);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_NON_PRODUCTIVE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsNonProductive);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_AFTER_CONTACT_WORK"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsAfterContactWork);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_ERROR"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsError);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_STAFFED"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsStaffed);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_IN_QUEUE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameContactsInQueue);
        }
        if ([value caseInsensitiveCompare:@"OLDEST_CONTACT_AGE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameOldestContactAge);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_SCHEDULED"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameContactsScheduled);
        }
        if ([value caseInsensitiveCompare:@"AGENTS_ON_CONTACT"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameAgentsOnContact);
        }
        if ([value caseInsensitiveCompare:@"SLOTS_ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameSlotsActive);
        }
        if ([value caseInsensitiveCompare:@"SLOTS_AVAILABLE"] == NSOrderedSame) {
            return @(AWSConnectCurrentMetricNameSlotsAvailable);
        }
        return @(AWSConnectCurrentMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectCurrentMetricNameAgentsOnline:
                return @"AGENTS_ONLINE";
            case AWSConnectCurrentMetricNameAgentsAvailable:
                return @"AGENTS_AVAILABLE";
            case AWSConnectCurrentMetricNameAgentsOnCall:
                return @"AGENTS_ON_CALL";
            case AWSConnectCurrentMetricNameAgentsNonProductive:
                return @"AGENTS_NON_PRODUCTIVE";
            case AWSConnectCurrentMetricNameAgentsAfterContactWork:
                return @"AGENTS_AFTER_CONTACT_WORK";
            case AWSConnectCurrentMetricNameAgentsError:
                return @"AGENTS_ERROR";
            case AWSConnectCurrentMetricNameAgentsStaffed:
                return @"AGENTS_STAFFED";
            case AWSConnectCurrentMetricNameContactsInQueue:
                return @"CONTACTS_IN_QUEUE";
            case AWSConnectCurrentMetricNameOldestContactAge:
                return @"OLDEST_CONTACT_AGE";
            case AWSConnectCurrentMetricNameContactsScheduled:
                return @"CONTACTS_SCHEDULED";
            case AWSConnectCurrentMetricNameAgentsOnContact:
                return @"AGENTS_ON_CONTACT";
            case AWSConnectCurrentMetricNameSlotsActive:
                return @"SLOTS_ACTIVE";
            case AWSConnectCurrentMetricNameSlotsAvailable:
                return @"SLOTS_AVAILABLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSConnectSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSConnectSortOrderDescending);
        }
        return @(AWSConnectSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectSortOrderAscending:
                return @"ASCENDING";
            case AWSConnectSortOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectDateReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSConnectDefaultVocabulary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"languageCode" : @"LanguageCode",
             @"vocabularyId" : @"VocabularyId",
             @"vocabularyName" : @"VocabularyName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"en-NZ"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnNZ);
        }
        if ([value caseInsensitiveCompare:@"en-ZA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnZA);
        }
        return @(AWSConnectVocabularyLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyLanguageCodeArAE:
                return @"ar-AE";
            case AWSConnectVocabularyLanguageCodeDeCH:
                return @"de-CH";
            case AWSConnectVocabularyLanguageCodeDeDE:
                return @"de-DE";
            case AWSConnectVocabularyLanguageCodeEnAB:
                return @"en-AB";
            case AWSConnectVocabularyLanguageCodeEnAU:
                return @"en-AU";
            case AWSConnectVocabularyLanguageCodeEnGB:
                return @"en-GB";
            case AWSConnectVocabularyLanguageCodeEnIE:
                return @"en-IE";
            case AWSConnectVocabularyLanguageCodeEnIN:
                return @"en-IN";
            case AWSConnectVocabularyLanguageCodeEnUS:
                return @"en-US";
            case AWSConnectVocabularyLanguageCodeEnWL:
                return @"en-WL";
            case AWSConnectVocabularyLanguageCodeEsES:
                return @"es-ES";
            case AWSConnectVocabularyLanguageCodeEsUS:
                return @"es-US";
            case AWSConnectVocabularyLanguageCodeFrCA:
                return @"fr-CA";
            case AWSConnectVocabularyLanguageCodeFrFR:
                return @"fr-FR";
            case AWSConnectVocabularyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSConnectVocabularyLanguageCodeItIT:
                return @"it-IT";
            case AWSConnectVocabularyLanguageCodeJaJP:
                return @"ja-JP";
            case AWSConnectVocabularyLanguageCodeKoKR:
                return @"ko-KR";
            case AWSConnectVocabularyLanguageCodePtBR:
                return @"pt-BR";
            case AWSConnectVocabularyLanguageCodePtPT:
                return @"pt-PT";
            case AWSConnectVocabularyLanguageCodeZhCN:
                return @"zh-CN";
            case AWSConnectVocabularyLanguageCodeEnNZ:
                return @"en-NZ";
            case AWSConnectVocabularyLanguageCodeEnZA:
                return @"en-ZA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectDeleteContactFlowModuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowModuleId" : @"ContactFlowModuleId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDeleteContactFlowModuleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectDeleteContactFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowId" : @"ContactFlowId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDeleteContactFlowResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectDeleteHoursOfOperationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hoursOfOperationId" : @"HoursOfOperationId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDeleteInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDeleteIntegrationAssociationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"integrationAssociationId" : @"IntegrationAssociationId",
             };
}

@end

@implementation AWSConnectDeleteQuickConnectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"quickConnectId" : @"QuickConnectId",
             };
}

@end

@implementation AWSConnectDeleteRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSConnectDeleteSecurityProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"securityProfileId" : @"SecurityProfileId",
             };
}

@end

@implementation AWSConnectDeleteTaskTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"taskTemplateId" : @"TaskTemplateId",
             };
}

@end

@implementation AWSConnectDeleteTaskTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectDeleteTrafficDistributionGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficDistributionGroupId" : @"TrafficDistributionGroupId",
             };
}

@end

@implementation AWSConnectDeleteTrafficDistributionGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectDeleteUseCaseRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"integrationAssociationId" : @"IntegrationAssociationId",
             @"useCaseId" : @"UseCaseId",
             };
}

@end

@implementation AWSConnectDeleteUserHierarchyGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyGroupId" : @"HierarchyGroupId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDeleteUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectDeleteVocabularyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"vocabularyId" : @"VocabularyId",
             };
}

@end

@implementation AWSConnectDeleteVocabularyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"vocabularyArn" : @"VocabularyArn",
             @"vocabularyId" : @"VocabularyId",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateActive);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateDeleteInProgress);
        }
        return @(AWSConnectVocabularyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyStateCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSConnectVocabularyStateActive:
                return @"ACTIVE";
            case AWSConnectVocabularyStateCreationFailed:
                return @"CREATION_FAILED";
            case AWSConnectVocabularyStateDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectDescribeAgentStatusRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"agentStatusId" : @"AgentStatusId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDescribeAgentStatusResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"agentStatus" : @"AgentStatus",
             };
}

+ (NSValueTransformer *)agentStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectAgentStatus class]];
}

@end

@implementation AWSConnectDescribeContactFlowModuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowModuleId" : @"ContactFlowModuleId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDescribeContactFlowModuleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowModule" : @"ContactFlowModule",
             };
}

+ (NSValueTransformer *)contactFlowModuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectContactFlowModule class]];
}

@end

@implementation AWSConnectDescribeContactFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowId" : @"ContactFlowId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDescribeContactFlowResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlow" : @"ContactFlow",
             };
}

+ (NSValueTransformer *)contactFlowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectContactFlow class]];
}

@end

@implementation AWSConnectDescribeContactRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDescribeContactResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contact" : @"Contact",
             };
}

+ (NSValueTransformer *)contactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectContact class]];
}

@end

@implementation AWSConnectDescribeHoursOfOperationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hoursOfOperationId" : @"HoursOfOperationId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDescribeHoursOfOperationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hoursOfOperation" : @"HoursOfOperation",
             };
}

+ (NSValueTransformer *)hoursOfOperationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHoursOfOperation class]];
}

@end

@implementation AWSConnectDescribeInstanceAttributeRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeType" : @"AttributeType",
             @"instanceId" : @"InstanceId",
             };
}

+ (NSValueTransformer *)attributeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INBOUND_CALLS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeInboundCalls);
        }
        if ([value caseInsensitiveCompare:@"OUTBOUND_CALLS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeOutboundCalls);
        }
        if ([value caseInsensitiveCompare:@"CONTACTFLOW_LOGS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeContactflowLogs);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_LENS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeContactLens);
        }
        if ([value caseInsensitiveCompare:@"AUTO_RESOLVE_BEST_VOICES"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeAutoResolveBestVoices);
        }
        if ([value caseInsensitiveCompare:@"USE_CUSTOM_TTS_VOICES"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeUseCustomTtsVoices);
        }
        if ([value caseInsensitiveCompare:@"EARLY_MEDIA"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeEarlyMedia);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PARTY_CONFERENCE"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeMultiPartyConference);
        }
        if ([value caseInsensitiveCompare:@"HIGH_VOLUME_OUTBOUND"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeHighVolumeOutbound);
        }
        if ([value caseInsensitiveCompare:@"ENHANCED_CONTACT_MONITORING"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeEnhancedContactMonitoring);
        }
        return @(AWSConnectInstanceAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectInstanceAttributeTypeInboundCalls:
                return @"INBOUND_CALLS";
            case AWSConnectInstanceAttributeTypeOutboundCalls:
                return @"OUTBOUND_CALLS";
            case AWSConnectInstanceAttributeTypeContactflowLogs:
                return @"CONTACTFLOW_LOGS";
            case AWSConnectInstanceAttributeTypeContactLens:
                return @"CONTACT_LENS";
            case AWSConnectInstanceAttributeTypeAutoResolveBestVoices:
                return @"AUTO_RESOLVE_BEST_VOICES";
            case AWSConnectInstanceAttributeTypeUseCustomTtsVoices:
                return @"USE_CUSTOM_TTS_VOICES";
            case AWSConnectInstanceAttributeTypeEarlyMedia:
                return @"EARLY_MEDIA";
            case AWSConnectInstanceAttributeTypeMultiPartyConference:
                return @"MULTI_PARTY_CONFERENCE";
            case AWSConnectInstanceAttributeTypeHighVolumeOutbound:
                return @"HIGH_VOLUME_OUTBOUND";
            case AWSConnectInstanceAttributeTypeEnhancedContactMonitoring:
                return @"ENHANCED_CONTACT_MONITORING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectDescribeInstanceAttributeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectAttribute class]];
}

@end

@implementation AWSConnectDescribeInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDescribeInstanceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instance" : @"Instance",
             };
}

+ (NSValueTransformer *)instanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectInstance class]];
}

@end

@implementation AWSConnectDescribeInstanceStorageConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"instanceId" : @"InstanceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHAT_TRANSCRIPTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeChatTranscripts);
        }
        if ([value caseInsensitiveCompare:@"CALL_RECORDINGS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeCallRecordings);
        }
        if ([value caseInsensitiveCompare:@"SCHEDULED_REPORTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeScheduledReports);
        }
        if ([value caseInsensitiveCompare:@"MEDIA_STREAMS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeMediaStreams);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_TRACE_RECORDS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeContactTraceRecords);
        }
        if ([value caseInsensitiveCompare:@"AGENT_EVENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeAgentEvents);
        }
        if ([value caseInsensitiveCompare:@"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeRealTimeContactAnalysisSegments);
        }
        if ([value caseInsensitiveCompare:@"ATTACHMENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeAttachments);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_EVALUATIONS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeContactEvaluations);
        }
        return @(AWSConnectInstanceStorageResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectInstanceStorageResourceTypeChatTranscripts:
                return @"CHAT_TRANSCRIPTS";
            case AWSConnectInstanceStorageResourceTypeCallRecordings:
                return @"CALL_RECORDINGS";
            case AWSConnectInstanceStorageResourceTypeScheduledReports:
                return @"SCHEDULED_REPORTS";
            case AWSConnectInstanceStorageResourceTypeMediaStreams:
                return @"MEDIA_STREAMS";
            case AWSConnectInstanceStorageResourceTypeContactTraceRecords:
                return @"CONTACT_TRACE_RECORDS";
            case AWSConnectInstanceStorageResourceTypeAgentEvents:
                return @"AGENT_EVENTS";
            case AWSConnectInstanceStorageResourceTypeRealTimeContactAnalysisSegments:
                return @"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS";
            case AWSConnectInstanceStorageResourceTypeAttachments:
                return @"ATTACHMENTS";
            case AWSConnectInstanceStorageResourceTypeContactEvaluations:
                return @"CONTACT_EVALUATIONS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectDescribeInstanceStorageConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"storageConfig" : @"StorageConfig",
             };
}

+ (NSValueTransformer *)storageConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectInstanceStorageConfig class]];
}

@end

@implementation AWSConnectDescribePhoneNumberRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberId" : @"PhoneNumberId",
             };
}

@end

@implementation AWSConnectDescribePhoneNumberResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"claimedPhoneNumberSummary" : @"ClaimedPhoneNumberSummary",
             };
}

+ (NSValueTransformer *)claimedPhoneNumberSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectClaimedPhoneNumberSummary class]];
}

@end

@implementation AWSConnectDescribeQueueRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"queueId" : @"QueueId",
             };
}

@end

@implementation AWSConnectDescribeQueueResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queue" : @"Queue",
             };
}

+ (NSValueTransformer *)queueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQueue class]];
}

@end

@implementation AWSConnectDescribeQuickConnectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"quickConnectId" : @"QuickConnectId",
             };
}

@end

@implementation AWSConnectDescribeQuickConnectResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"quickConnect" : @"QuickConnect",
             };
}

+ (NSValueTransformer *)quickConnectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQuickConnect class]];
}

@end

@implementation AWSConnectDescribeRoutingProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"routingProfileId" : @"RoutingProfileId",
             };
}

@end

@implementation AWSConnectDescribeRoutingProfileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"routingProfile" : @"RoutingProfile",
             };
}

+ (NSValueTransformer *)routingProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectRoutingProfile class]];
}

@end

@implementation AWSConnectDescribeRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSConnectDescribeRuleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rule" : @"Rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectRule class]];
}

@end

@implementation AWSConnectDescribeSecurityProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"securityProfileId" : @"SecurityProfileId",
             };
}

@end

@implementation AWSConnectDescribeSecurityProfileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityProfile" : @"SecurityProfile",
             };
}

+ (NSValueTransformer *)securityProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectSecurityProfile class]];
}

@end

@implementation AWSConnectDescribeTrafficDistributionGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficDistributionGroupId" : @"TrafficDistributionGroupId",
             };
}

@end

@implementation AWSConnectDescribeTrafficDistributionGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficDistributionGroup" : @"TrafficDistributionGroup",
             };
}

+ (NSValueTransformer *)trafficDistributionGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTrafficDistributionGroup class]];
}

@end

@implementation AWSConnectDescribeUserHierarchyGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyGroupId" : @"HierarchyGroupId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDescribeUserHierarchyGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyGroup" : @"HierarchyGroup",
             };
}

+ (NSValueTransformer *)hierarchyGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroup class]];
}

@end

@implementation AWSConnectDescribeUserHierarchyStructureRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDescribeUserHierarchyStructureResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyStructure" : @"HierarchyStructure",
             };
}

+ (NSValueTransformer *)hierarchyStructureJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyStructure class]];
}

@end

@implementation AWSConnectDescribeUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectDescribeUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUser class]];
}

@end

@implementation AWSConnectDescribeVocabularyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"vocabularyId" : @"VocabularyId",
             };
}

@end

@implementation AWSConnectDescribeVocabularyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabulary" : @"Vocabulary",
             };
}

+ (NSValueTransformer *)vocabularyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectVocabulary class]];
}

@end

@implementation AWSConnectDimensions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             @"queue" : @"Queue",
             @"routingProfile" : @"RoutingProfile",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSConnectChannelVoice);
        }
        if ([value caseInsensitiveCompare:@"CHAT"] == NSOrderedSame) {
            return @(AWSConnectChannelChat);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSConnectChannelTask);
        }
        return @(AWSConnectChannelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectChannelVoice:
                return @"VOICE";
            case AWSConnectChannelChat:
                return @"CHAT";
            case AWSConnectChannelTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)queueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQueueReference class]];
}

+ (NSValueTransformer *)routingProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectRoutingProfileReference class]];
}

@end

@implementation AWSConnectDisassociateApprovedOriginRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"origin" : @"Origin",
             };
}

@end

@implementation AWSConnectDisassociateBotRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"lexBot" : @"LexBot",
             @"lexV2Bot" : @"LexV2Bot",
             };
}

+ (NSValueTransformer *)lexBotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectLexBot class]];
}

+ (NSValueTransformer *)lexV2BotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectLexV2Bot class]];
}

@end

@implementation AWSConnectDisassociateInstanceStorageConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"instanceId" : @"InstanceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHAT_TRANSCRIPTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeChatTranscripts);
        }
        if ([value caseInsensitiveCompare:@"CALL_RECORDINGS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeCallRecordings);
        }
        if ([value caseInsensitiveCompare:@"SCHEDULED_REPORTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeScheduledReports);
        }
        if ([value caseInsensitiveCompare:@"MEDIA_STREAMS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeMediaStreams);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_TRACE_RECORDS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeContactTraceRecords);
        }
        if ([value caseInsensitiveCompare:@"AGENT_EVENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeAgentEvents);
        }
        if ([value caseInsensitiveCompare:@"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeRealTimeContactAnalysisSegments);
        }
        if ([value caseInsensitiveCompare:@"ATTACHMENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeAttachments);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_EVALUATIONS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeContactEvaluations);
        }
        return @(AWSConnectInstanceStorageResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectInstanceStorageResourceTypeChatTranscripts:
                return @"CHAT_TRANSCRIPTS";
            case AWSConnectInstanceStorageResourceTypeCallRecordings:
                return @"CALL_RECORDINGS";
            case AWSConnectInstanceStorageResourceTypeScheduledReports:
                return @"SCHEDULED_REPORTS";
            case AWSConnectInstanceStorageResourceTypeMediaStreams:
                return @"MEDIA_STREAMS";
            case AWSConnectInstanceStorageResourceTypeContactTraceRecords:
                return @"CONTACT_TRACE_RECORDS";
            case AWSConnectInstanceStorageResourceTypeAgentEvents:
                return @"AGENT_EVENTS";
            case AWSConnectInstanceStorageResourceTypeRealTimeContactAnalysisSegments:
                return @"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS";
            case AWSConnectInstanceStorageResourceTypeAttachments:
                return @"ATTACHMENTS";
            case AWSConnectInstanceStorageResourceTypeContactEvaluations:
                return @"CONTACT_EVALUATIONS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectDisassociateLambdaFunctionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionArn" : @"FunctionArn",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDisassociateLexBotRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botName" : @"BotName",
             @"instanceId" : @"InstanceId",
             @"lexRegion" : @"LexRegion",
             };
}

@end

@implementation AWSConnectDisassociatePhoneNumberContactFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"phoneNumberId" : @"PhoneNumberId",
             };
}

@end

@implementation AWSConnectDisassociateQueueQuickConnectsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"queueId" : @"QueueId",
             @"quickConnectIds" : @"QuickConnectIds",
             };
}

@end

@implementation AWSConnectDisassociateRoutingProfileQueuesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"queueReferences" : @"QueueReferences",
             @"routingProfileId" : @"RoutingProfileId",
             };
}

+ (NSValueTransformer *)queueReferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRoutingProfileQueueReference class]];
}

@end

@implementation AWSConnectDisassociateSecurityKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDismissUserContactRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectDismissUserContactResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectDistribution

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"percentage" : @"Percentage",
             @"region" : @"Region",
             };
}

@end

@implementation AWSConnectEmailReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSConnectEncryptionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionType" : @"EncryptionType",
             @"keyId" : @"KeyId",
             };
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSConnectEncryptionTypeKms);
        }
        return @(AWSConnectEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectEncryptionTypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectEventBridgeActionDefinition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectFilterV2

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterKey" : @"FilterKey",
             @"filterValues" : @"FilterValues",
             };
}

@end

@implementation AWSConnectFilters

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"queues" : @"Queues",
             @"routingProfiles" : @"RoutingProfiles",
             };
}

@end

@implementation AWSConnectGetContactAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initialContactId" : @"InitialContactId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectGetContactAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSConnectGetCurrentMetricDataRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentMetrics" : @"CurrentMetrics",
             @"filters" : @"Filters",
             @"groupings" : @"Groupings",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)currentMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectCurrentMetric class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectFilters class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectCurrentMetricSortCriteria class]];
}

@end

@implementation AWSConnectGetCurrentMetricDataResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateTotalCount" : @"ApproximateTotalCount",
             @"dataSnapshotTime" : @"DataSnapshotTime",
             @"metricResults" : @"MetricResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)dataSnapshotTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectCurrentMetricResult class]];
}

@end

@implementation AWSConnectGetCurrentUserDataRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserDataFilters class]];
}

@end

@implementation AWSConnectGetCurrentUserDataResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateTotalCount" : @"ApproximateTotalCount",
             @"nextToken" : @"NextToken",
             @"userDataList" : @"UserDataList",
             };
}

+ (NSValueTransformer *)userDataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectUserData class]];
}

@end

@implementation AWSConnectGetFederationTokenRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectGetFederationTokenResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credentials" : @"Credentials",
             @"signInUrl" : @"SignInUrl",
             @"userArn" : @"UserArn",
             @"userId" : @"UserId",
             };
}

+ (NSValueTransformer *)credentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectCredentials class]];
}

@end

@implementation AWSConnectGetMetricDataRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"filters" : @"Filters",
             @"groupings" : @"Groupings",
             @"historicalMetrics" : @"HistoricalMetrics",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectFilters class]];
}

+ (NSValueTransformer *)historicalMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectHistoricalMetric class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSConnectGetMetricDataResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricResults" : @"MetricResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)metricResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectHistoricalMetricResult class]];
}

@end

@implementation AWSConnectGetMetricDataV2Request

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"filters" : @"Filters",
             @"groupings" : @"Groupings",
             @"maxResults" : @"MaxResults",
             @"metrics" : @"Metrics",
             @"nextToken" : @"NextToken",
             @"resourceArn" : @"ResourceArn",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectFilterV2 class]];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectMetricV2 class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSConnectGetMetricDataV2Response

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricResults" : @"MetricResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)metricResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectMetricResultV2 class]];
}

@end

@implementation AWSConnectGetTaskTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"snapshotVersion" : @"SnapshotVersion",
             @"taskTemplateId" : @"TaskTemplateId",
             };
}

@end

@implementation AWSConnectGetTaskTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"constraints" : @"Constraints",
             @"contactFlowId" : @"ContactFlowId",
             @"createdTime" : @"CreatedTime",
             @"defaults" : @"Defaults",
             @"detail" : @"Description",
             @"fields" : @"Fields",
             @"identifier" : @"Id",
             @"instanceId" : @"InstanceId",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"name" : @"Name",
             @"status" : @"Status",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)constraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateConstraints class]];
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)defaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateDefaults class]];
}

+ (NSValueTransformer *)fieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectTaskTemplateField class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusInactive);
        }
        return @(AWSConnectTaskTemplateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectTaskTemplateStatusActive:
                return @"ACTIVE";
            case AWSConnectTaskTemplateStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectGetTrafficDistributionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectGetTrafficDistributionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"telephonyConfig" : @"TelephonyConfig",
             };
}

+ (NSValueTransformer *)telephonyConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTelephonyConfig class]];
}

@end

@implementation AWSConnectHierarchyGroup

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"hierarchyPath" : @"HierarchyPath",
             @"identifier" : @"Id",
             @"levelId" : @"LevelId",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)hierarchyPathJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyPath class]];
}

@end

@implementation AWSConnectHierarchyGroupCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyGroupMatchType" : @"HierarchyGroupMatchType",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)hierarchyGroupMatchTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXACT"] == NSOrderedSame) {
            return @(AWSConnectHierarchyGroupMatchTypeExact);
        }
        if ([value caseInsensitiveCompare:@"WITH_CHILD_GROUPS"] == NSOrderedSame) {
            return @(AWSConnectHierarchyGroupMatchTypeWithChildGroups);
        }
        return @(AWSConnectHierarchyGroupMatchTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectHierarchyGroupMatchTypeExact:
                return @"EXACT";
            case AWSConnectHierarchyGroupMatchTypeWithChildGroups:
                return @"WITH_CHILD_GROUPS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectHierarchyGroupSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectHierarchyGroupSummaryReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectHierarchyLevel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectHierarchyLevelUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectHierarchyPath

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"levelFive" : @"LevelFive",
             @"levelFour" : @"LevelFour",
             @"levelOne" : @"LevelOne",
             @"levelThree" : @"LevelThree",
             @"levelTwo" : @"LevelTwo",
             };
}

+ (NSValueTransformer *)levelFiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroupSummary class]];
}

+ (NSValueTransformer *)levelFourJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroupSummary class]];
}

+ (NSValueTransformer *)levelOneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroupSummary class]];
}

+ (NSValueTransformer *)levelThreeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroupSummary class]];
}

+ (NSValueTransformer *)levelTwoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroupSummary class]];
}

@end

@implementation AWSConnectHierarchyPathReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"levelFive" : @"LevelFive",
             @"levelFour" : @"LevelFour",
             @"levelOne" : @"LevelOne",
             @"levelThree" : @"LevelThree",
             @"levelTwo" : @"LevelTwo",
             };
}

+ (NSValueTransformer *)levelFiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroupSummaryReference class]];
}

+ (NSValueTransformer *)levelFourJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroupSummaryReference class]];
}

+ (NSValueTransformer *)levelOneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroupSummaryReference class]];
}

+ (NSValueTransformer *)levelThreeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroupSummaryReference class]];
}

+ (NSValueTransformer *)levelTwoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroupSummaryReference class]];
}

@end

@implementation AWSConnectHierarchyStructure

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"levelFive" : @"LevelFive",
             @"levelFour" : @"LevelFour",
             @"levelOne" : @"LevelOne",
             @"levelThree" : @"LevelThree",
             @"levelTwo" : @"LevelTwo",
             };
}

+ (NSValueTransformer *)levelFiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyLevel class]];
}

+ (NSValueTransformer *)levelFourJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyLevel class]];
}

+ (NSValueTransformer *)levelOneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyLevel class]];
}

+ (NSValueTransformer *)levelThreeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyLevel class]];
}

+ (NSValueTransformer *)levelTwoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyLevel class]];
}

@end

@implementation AWSConnectHierarchyStructureUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"levelFive" : @"LevelFive",
             @"levelFour" : @"LevelFour",
             @"levelOne" : @"LevelOne",
             @"levelThree" : @"LevelThree",
             @"levelTwo" : @"LevelTwo",
             };
}

+ (NSValueTransformer *)levelFiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyLevelUpdate class]];
}

+ (NSValueTransformer *)levelFourJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyLevelUpdate class]];
}

+ (NSValueTransformer *)levelOneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyLevelUpdate class]];
}

+ (NSValueTransformer *)levelThreeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyLevelUpdate class]];
}

+ (NSValueTransformer *)levelTwoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyLevelUpdate class]];
}

@end

@implementation AWSConnectHistoricalMetric

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"statistic" : @"Statistic",
             @"threshold" : @"Threshold",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTACTS_QUEUED"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsQueued);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_HANDLED"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsHandled);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_ABANDONED"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsAbandoned);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_CONSULTED"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsConsulted);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_AGENT_HUNG_UP_FIRST"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsAgentHungUpFirst);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_HANDLED_INCOMING"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsHandledIncoming);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_HANDLED_OUTBOUND"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsHandledOutbound);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_HOLD_ABANDONS"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsHoldAbandons);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_TRANSFERRED_IN"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsTransferredIn);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_TRANSFERRED_OUT"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsTransferredOut);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_TRANSFERRED_IN_FROM_QUEUE"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsTransferredInFromQueue);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_TRANSFERRED_OUT_FROM_QUEUE"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsTransferredOutFromQueue);
        }
        if ([value caseInsensitiveCompare:@"CONTACTS_MISSED"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameContactsMissed);
        }
        if ([value caseInsensitiveCompare:@"CALLBACK_CONTACTS_HANDLED"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameCallbackContactsHandled);
        }
        if ([value caseInsensitiveCompare:@"API_CONTACTS_HANDLED"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameApiContactsHandled);
        }
        if ([value caseInsensitiveCompare:@"OCCUPANCY"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameOccupancy);
        }
        if ([value caseInsensitiveCompare:@"HANDLE_TIME"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameHandleTime);
        }
        if ([value caseInsensitiveCompare:@"AFTER_CONTACT_WORK_TIME"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameAfterContactWorkTime);
        }
        if ([value caseInsensitiveCompare:@"QUEUED_TIME"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameQueuedTime);
        }
        if ([value caseInsensitiveCompare:@"ABANDON_TIME"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameAbandonTime);
        }
        if ([value caseInsensitiveCompare:@"QUEUE_ANSWER_TIME"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameQueueAnswerTime);
        }
        if ([value caseInsensitiveCompare:@"HOLD_TIME"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameHoldTime);
        }
        if ([value caseInsensitiveCompare:@"INTERACTION_TIME"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameInteractionTime);
        }
        if ([value caseInsensitiveCompare:@"INTERACTION_AND_HOLD_TIME"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameInteractionAndHoldTime);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_LEVEL"] == NSOrderedSame) {
            return @(AWSConnectHistoricalMetricNameServiceLevel);
        }
        return @(AWSConnectHistoricalMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectHistoricalMetricNameContactsQueued:
                return @"CONTACTS_QUEUED";
            case AWSConnectHistoricalMetricNameContactsHandled:
                return @"CONTACTS_HANDLED";
            case AWSConnectHistoricalMetricNameContactsAbandoned:
                return @"CONTACTS_ABANDONED";
            case AWSConnectHistoricalMetricNameContactsConsulted:
                return @"CONTACTS_CONSULTED";
            case AWSConnectHistoricalMetricNameContactsAgentHungUpFirst:
                return @"CONTACTS_AGENT_HUNG_UP_FIRST";
            case AWSConnectHistoricalMetricNameContactsHandledIncoming:
                return @"CONTACTS_HANDLED_INCOMING";
            case AWSConnectHistoricalMetricNameContactsHandledOutbound:
                return @"CONTACTS_HANDLED_OUTBOUND";
            case AWSConnectHistoricalMetricNameContactsHoldAbandons:
                return @"CONTACTS_HOLD_ABANDONS";
            case AWSConnectHistoricalMetricNameContactsTransferredIn:
                return @"CONTACTS_TRANSFERRED_IN";
            case AWSConnectHistoricalMetricNameContactsTransferredOut:
                return @"CONTACTS_TRANSFERRED_OUT";
            case AWSConnectHistoricalMetricNameContactsTransferredInFromQueue:
                return @"CONTACTS_TRANSFERRED_IN_FROM_QUEUE";
            case AWSConnectHistoricalMetricNameContactsTransferredOutFromQueue:
                return @"CONTACTS_TRANSFERRED_OUT_FROM_QUEUE";
            case AWSConnectHistoricalMetricNameContactsMissed:
                return @"CONTACTS_MISSED";
            case AWSConnectHistoricalMetricNameCallbackContactsHandled:
                return @"CALLBACK_CONTACTS_HANDLED";
            case AWSConnectHistoricalMetricNameApiContactsHandled:
                return @"API_CONTACTS_HANDLED";
            case AWSConnectHistoricalMetricNameOccupancy:
                return @"OCCUPANCY";
            case AWSConnectHistoricalMetricNameHandleTime:
                return @"HANDLE_TIME";
            case AWSConnectHistoricalMetricNameAfterContactWorkTime:
                return @"AFTER_CONTACT_WORK_TIME";
            case AWSConnectHistoricalMetricNameQueuedTime:
                return @"QUEUED_TIME";
            case AWSConnectHistoricalMetricNameAbandonTime:
                return @"ABANDON_TIME";
            case AWSConnectHistoricalMetricNameQueueAnswerTime:
                return @"QUEUE_ANSWER_TIME";
            case AWSConnectHistoricalMetricNameHoldTime:
                return @"HOLD_TIME";
            case AWSConnectHistoricalMetricNameInteractionTime:
                return @"INTERACTION_TIME";
            case AWSConnectHistoricalMetricNameInteractionAndHoldTime:
                return @"INTERACTION_AND_HOLD_TIME";
            case AWSConnectHistoricalMetricNameServiceLevel:
                return @"SERVICE_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUM"] == NSOrderedSame) {
            return @(AWSConnectStatisticSum);
        }
        if ([value caseInsensitiveCompare:@"MAX"] == NSOrderedSame) {
            return @(AWSConnectStatisticMax);
        }
        if ([value caseInsensitiveCompare:@"AVG"] == NSOrderedSame) {
            return @(AWSConnectStatisticAvg);
        }
        return @(AWSConnectStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectStatisticSum:
                return @"SUM";
            case AWSConnectStatisticMax:
                return @"MAX";
            case AWSConnectStatisticAvg:
                return @"AVG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)thresholdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectThreshold class]];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSConnectUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSConnectUnitCount);
        }
        if ([value caseInsensitiveCompare:@"PERCENT"] == NSOrderedSame) {
            return @(AWSConnectUnitPercent);
        }
        return @(AWSConnectUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectUnitSeconds:
                return @"SECONDS";
            case AWSConnectUnitCount:
                return @"COUNT";
            case AWSConnectUnitPercent:
                return @"PERCENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectHistoricalMetricData

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metric" : @"Metric",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)metricJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHistoricalMetric class]];
}

@end

@implementation AWSConnectHistoricalMetricResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collections" : @"Collections",
             @"dimensions" : @"Dimensions",
             };
}

+ (NSValueTransformer *)collectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectHistoricalMetricData class]];
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectDimensions class]];
}

@end

@implementation AWSConnectHoursOfOperation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"config" : @"Config",
             @"detail" : @"Description",
             @"hoursOfOperationArn" : @"HoursOfOperationArn",
             @"hoursOfOperationId" : @"HoursOfOperationId",
             @"name" : @"Name",
             @"tags" : @"Tags",
             @"timeZone" : @"TimeZone",
             };
}

+ (NSValueTransformer *)configJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectHoursOfOperationConfig class]];
}

@end

@implementation AWSConnectHoursOfOperationConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"day" : @"Day",
             @"endTime" : @"EndTime",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)dayJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUNDAY"] == NSOrderedSame) {
            return @(AWSConnectHoursOfOperationDaysSunday);
        }
        if ([value caseInsensitiveCompare:@"MONDAY"] == NSOrderedSame) {
            return @(AWSConnectHoursOfOperationDaysMonday);
        }
        if ([value caseInsensitiveCompare:@"TUESDAY"] == NSOrderedSame) {
            return @(AWSConnectHoursOfOperationDaysTuesday);
        }
        if ([value caseInsensitiveCompare:@"WEDNESDAY"] == NSOrderedSame) {
            return @(AWSConnectHoursOfOperationDaysWednesday);
        }
        if ([value caseInsensitiveCompare:@"THURSDAY"] == NSOrderedSame) {
            return @(AWSConnectHoursOfOperationDaysThursday);
        }
        if ([value caseInsensitiveCompare:@"FRIDAY"] == NSOrderedSame) {
            return @(AWSConnectHoursOfOperationDaysFriday);
        }
        if ([value caseInsensitiveCompare:@"SATURDAY"] == NSOrderedSame) {
            return @(AWSConnectHoursOfOperationDaysSaturday);
        }
        return @(AWSConnectHoursOfOperationDaysUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectHoursOfOperationDaysSunday:
                return @"SUNDAY";
            case AWSConnectHoursOfOperationDaysMonday:
                return @"MONDAY";
            case AWSConnectHoursOfOperationDaysTuesday:
                return @"TUESDAY";
            case AWSConnectHoursOfOperationDaysWednesday:
                return @"WEDNESDAY";
            case AWSConnectHoursOfOperationDaysThursday:
                return @"THURSDAY";
            case AWSConnectHoursOfOperationDaysFriday:
                return @"FRIDAY";
            case AWSConnectHoursOfOperationDaysSaturday:
                return @"SATURDAY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHoursOfOperationTimeSlice class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHoursOfOperationTimeSlice class]];
}

@end

@implementation AWSConnectHoursOfOperationSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectHoursOfOperationTimeSlice

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hours" : @"Hours",
             @"minutes" : @"Minutes",
             };
}

@end

@implementation AWSConnectInstance

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"identifier" : @"Id",
             @"identityManagementType" : @"IdentityManagementType",
             @"inboundCallsEnabled" : @"InboundCallsEnabled",
             @"instanceAlias" : @"InstanceAlias",
             @"instanceStatus" : @"InstanceStatus",
             @"outboundCallsEnabled" : @"OutboundCallsEnabled",
             @"serviceRole" : @"ServiceRole",
             @"statusReason" : @"StatusReason",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)identityManagementTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAML"] == NSOrderedSame) {
            return @(AWSConnectDirectoryTypeSaml);
        }
        if ([value caseInsensitiveCompare:@"CONNECT_MANAGED"] == NSOrderedSame) {
            return @(AWSConnectDirectoryTypeConnectManaged);
        }
        if ([value caseInsensitiveCompare:@"EXISTING_DIRECTORY"] == NSOrderedSame) {
            return @(AWSConnectDirectoryTypeExistingDirectory);
        }
        return @(AWSConnectDirectoryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectDirectoryTypeSaml:
                return @"SAML";
            case AWSConnectDirectoryTypeConnectManaged:
                return @"CONNECT_MANAGED";
            case AWSConnectDirectoryTypeExistingDirectory:
                return @"EXISTING_DIRECTORY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectInstanceStatusActive);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSConnectInstanceStatusCreationFailed);
        }
        return @(AWSConnectInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectInstanceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSConnectInstanceStatusActive:
                return @"ACTIVE";
            case AWSConnectInstanceStatusCreationFailed:
                return @"CREATION_FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectInstanceStatusReason class]];
}

@end

@implementation AWSConnectInstanceStatusReason

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSConnectInstanceStorageConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"kinesisFirehoseConfig" : @"KinesisFirehoseConfig",
             @"kinesisStreamConfig" : @"KinesisStreamConfig",
             @"kinesisVideoStreamConfig" : @"KinesisVideoStreamConfig",
             @"s3Config" : @"S3Config",
             @"storageType" : @"StorageType",
             };
}

+ (NSValueTransformer *)kinesisFirehoseConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectKinesisFirehoseConfig class]];
}

+ (NSValueTransformer *)kinesisStreamConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectKinesisStreamConfig class]];
}

+ (NSValueTransformer *)kinesisVideoStreamConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectKinesisVideoStreamConfig class]];
}

+ (NSValueTransformer *)s3ConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectS3Config class]];
}

+ (NSValueTransformer *)storageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSConnectStorageTypeS3);
        }
        if ([value caseInsensitiveCompare:@"KINESIS_VIDEO_STREAM"] == NSOrderedSame) {
            return @(AWSConnectStorageTypeKinesisVideoStream);
        }
        if ([value caseInsensitiveCompare:@"KINESIS_STREAM"] == NSOrderedSame) {
            return @(AWSConnectStorageTypeKinesisStream);
        }
        if ([value caseInsensitiveCompare:@"KINESIS_FIREHOSE"] == NSOrderedSame) {
            return @(AWSConnectStorageTypeKinesisFirehose);
        }
        return @(AWSConnectStorageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectStorageTypeS3:
                return @"S3";
            case AWSConnectStorageTypeKinesisVideoStream:
                return @"KINESIS_VIDEO_STREAM";
            case AWSConnectStorageTypeKinesisStream:
                return @"KINESIS_STREAM";
            case AWSConnectStorageTypeKinesisFirehose:
                return @"KINESIS_FIREHOSE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectInstanceSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"identifier" : @"Id",
             @"identityManagementType" : @"IdentityManagementType",
             @"inboundCallsEnabled" : @"InboundCallsEnabled",
             @"instanceAlias" : @"InstanceAlias",
             @"instanceStatus" : @"InstanceStatus",
             @"outboundCallsEnabled" : @"OutboundCallsEnabled",
             @"serviceRole" : @"ServiceRole",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)identityManagementTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAML"] == NSOrderedSame) {
            return @(AWSConnectDirectoryTypeSaml);
        }
        if ([value caseInsensitiveCompare:@"CONNECT_MANAGED"] == NSOrderedSame) {
            return @(AWSConnectDirectoryTypeConnectManaged);
        }
        if ([value caseInsensitiveCompare:@"EXISTING_DIRECTORY"] == NSOrderedSame) {
            return @(AWSConnectDirectoryTypeExistingDirectory);
        }
        return @(AWSConnectDirectoryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectDirectoryTypeSaml:
                return @"SAML";
            case AWSConnectDirectoryTypeConnectManaged:
                return @"CONNECT_MANAGED";
            case AWSConnectDirectoryTypeExistingDirectory:
                return @"EXISTING_DIRECTORY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectInstanceStatusActive);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSConnectInstanceStatusCreationFailed);
        }
        return @(AWSConnectInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectInstanceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSConnectInstanceStatusActive:
                return @"ACTIVE";
            case AWSConnectInstanceStatusCreationFailed:
                return @"CREATION_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectIntegrationAssociationSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"integrationArn" : @"IntegrationArn",
             @"integrationAssociationArn" : @"IntegrationAssociationArn",
             @"integrationAssociationId" : @"IntegrationAssociationId",
             @"integrationType" : @"IntegrationType",
             @"sourceApplicationName" : @"SourceApplicationName",
             @"sourceApplicationUrl" : @"SourceApplicationUrl",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeEvent);
        }
        if ([value caseInsensitiveCompare:@"VOICE_ID"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeVoiceId);
        }
        if ([value caseInsensitiveCompare:@"PINPOINT_APP"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypePinpointApp);
        }
        if ([value caseInsensitiveCompare:@"WISDOM_ASSISTANT"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeWisdomAssistant);
        }
        if ([value caseInsensitiveCompare:@"WISDOM_KNOWLEDGE_BASE"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeWisdomKnowledgeBase);
        }
        if ([value caseInsensitiveCompare:@"CASES_DOMAIN"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeCasesDomain);
        }
        return @(AWSConnectIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectIntegrationTypeEvent:
                return @"EVENT";
            case AWSConnectIntegrationTypeVoiceId:
                return @"VOICE_ID";
            case AWSConnectIntegrationTypePinpointApp:
                return @"PINPOINT_APP";
            case AWSConnectIntegrationTypeWisdomAssistant:
                return @"WISDOM_ASSISTANT";
            case AWSConnectIntegrationTypeWisdomKnowledgeBase:
                return @"WISDOM_KNOWLEDGE_BASE";
            case AWSConnectIntegrationTypeCasesDomain:
                return @"CASES_DOMAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SALESFORCE"] == NSOrderedSame) {
            return @(AWSConnectSourceTypeSalesforce);
        }
        if ([value caseInsensitiveCompare:@"ZENDESK"] == NSOrderedSame) {
            return @(AWSConnectSourceTypeZendesk);
        }
        return @(AWSConnectSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectSourceTypeSalesforce:
                return @"SALESFORCE";
            case AWSConnectSourceTypeZendesk:
                return @"ZENDESK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectInvisibleFieldInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)identifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateFieldIdentifier class]];
}

@end

@implementation AWSConnectKinesisFirehoseConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"firehoseArn" : @"FirehoseArn",
             };
}

@end

@implementation AWSConnectKinesisStreamConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamArn" : @"StreamArn",
             };
}

@end

@implementation AWSConnectKinesisVideoStreamConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionConfig" : @"EncryptionConfig",
             @"prefix" : @"Prefix",
             @"retentionPeriodHours" : @"RetentionPeriodHours",
             };
}

+ (NSValueTransformer *)encryptionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectEncryptionConfig class]];
}

@end

@implementation AWSConnectLexBot

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lexRegion" : @"LexRegion",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectLexBotConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lexBot" : @"LexBot",
             @"lexV2Bot" : @"LexV2Bot",
             };
}

+ (NSValueTransformer *)lexBotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectLexBot class]];
}

+ (NSValueTransformer *)lexV2BotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectLexV2Bot class]];
}

@end

@implementation AWSConnectLexV2Bot

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasArn" : @"AliasArn",
             };
}

@end

@implementation AWSConnectListAgentStatusRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"agentStatusTypes" : @"AgentStatusTypes",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListAgentStatusResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"agentStatusSummaryList" : @"AgentStatusSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)agentStatusSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectAgentStatusSummary class]];
}

@end

@implementation AWSConnectListApprovedOriginsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListApprovedOriginsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"origins" : @"Origins",
             };
}

@end

@implementation AWSConnectListBotsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"lexVersion" : @"LexVersion",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)lexVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"V1"] == NSOrderedSame) {
            return @(AWSConnectLexVersionV1);
        }
        if ([value caseInsensitiveCompare:@"V2"] == NSOrderedSame) {
            return @(AWSConnectLexVersionV2);
        }
        return @(AWSConnectLexVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectLexVersionV1:
                return @"V1";
            case AWSConnectLexVersionV2:
                return @"V2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectListBotsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lexBots" : @"LexBots",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)lexBotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectLexBotConfig class]];
}

@end

@implementation AWSConnectListContactFlowModulesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowModuleState" : @"ContactFlowModuleState",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)contactFlowModuleStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectContactFlowModuleStateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSConnectContactFlowModuleStateArchived);
        }
        return @(AWSConnectContactFlowModuleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactFlowModuleStateActive:
                return @"ACTIVE";
            case AWSConnectContactFlowModuleStateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectListContactFlowModulesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowModulesSummaryList" : @"ContactFlowModulesSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)contactFlowModulesSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectContactFlowModuleSummary class]];
}

@end

@implementation AWSConnectListContactFlowsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowTypes" : @"ContactFlowTypes",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListContactFlowsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowSummaryList" : @"ContactFlowSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)contactFlowSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectContactFlowSummary class]];
}

@end

@implementation AWSConnectListContactReferencesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             @"nextToken" : @"NextToken",
             @"referenceTypes" : @"ReferenceTypes",
             };
}

@end

@implementation AWSConnectListContactReferencesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"referenceSummaryList" : @"ReferenceSummaryList",
             };
}

+ (NSValueTransformer *)referenceSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectReferenceSummary class]];
}

@end

@implementation AWSConnectListDefaultVocabulariesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"languageCode" : @"LanguageCode",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"en-NZ"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnNZ);
        }
        if ([value caseInsensitiveCompare:@"en-ZA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnZA);
        }
        return @(AWSConnectVocabularyLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyLanguageCodeArAE:
                return @"ar-AE";
            case AWSConnectVocabularyLanguageCodeDeCH:
                return @"de-CH";
            case AWSConnectVocabularyLanguageCodeDeDE:
                return @"de-DE";
            case AWSConnectVocabularyLanguageCodeEnAB:
                return @"en-AB";
            case AWSConnectVocabularyLanguageCodeEnAU:
                return @"en-AU";
            case AWSConnectVocabularyLanguageCodeEnGB:
                return @"en-GB";
            case AWSConnectVocabularyLanguageCodeEnIE:
                return @"en-IE";
            case AWSConnectVocabularyLanguageCodeEnIN:
                return @"en-IN";
            case AWSConnectVocabularyLanguageCodeEnUS:
                return @"en-US";
            case AWSConnectVocabularyLanguageCodeEnWL:
                return @"en-WL";
            case AWSConnectVocabularyLanguageCodeEsES:
                return @"es-ES";
            case AWSConnectVocabularyLanguageCodeEsUS:
                return @"es-US";
            case AWSConnectVocabularyLanguageCodeFrCA:
                return @"fr-CA";
            case AWSConnectVocabularyLanguageCodeFrFR:
                return @"fr-FR";
            case AWSConnectVocabularyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSConnectVocabularyLanguageCodeItIT:
                return @"it-IT";
            case AWSConnectVocabularyLanguageCodeJaJP:
                return @"ja-JP";
            case AWSConnectVocabularyLanguageCodeKoKR:
                return @"ko-KR";
            case AWSConnectVocabularyLanguageCodePtBR:
                return @"pt-BR";
            case AWSConnectVocabularyLanguageCodePtPT:
                return @"pt-PT";
            case AWSConnectVocabularyLanguageCodeZhCN:
                return @"zh-CN";
            case AWSConnectVocabularyLanguageCodeEnNZ:
                return @"en-NZ";
            case AWSConnectVocabularyLanguageCodeEnZA:
                return @"en-ZA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectListDefaultVocabulariesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultVocabularyList" : @"DefaultVocabularyList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)defaultVocabularyListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectDefaultVocabulary class]];
}

@end

@implementation AWSConnectListHoursOfOperationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListHoursOfOperationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hoursOfOperationSummaryList" : @"HoursOfOperationSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)hoursOfOperationSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectHoursOfOperationSummary class]];
}

@end

@implementation AWSConnectListInstanceAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListInstanceAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectAttribute class]];
}

@end

@implementation AWSConnectListInstanceStorageConfigsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHAT_TRANSCRIPTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeChatTranscripts);
        }
        if ([value caseInsensitiveCompare:@"CALL_RECORDINGS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeCallRecordings);
        }
        if ([value caseInsensitiveCompare:@"SCHEDULED_REPORTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeScheduledReports);
        }
        if ([value caseInsensitiveCompare:@"MEDIA_STREAMS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeMediaStreams);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_TRACE_RECORDS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeContactTraceRecords);
        }
        if ([value caseInsensitiveCompare:@"AGENT_EVENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeAgentEvents);
        }
        if ([value caseInsensitiveCompare:@"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeRealTimeContactAnalysisSegments);
        }
        if ([value caseInsensitiveCompare:@"ATTACHMENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeAttachments);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_EVALUATIONS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeContactEvaluations);
        }
        return @(AWSConnectInstanceStorageResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectInstanceStorageResourceTypeChatTranscripts:
                return @"CHAT_TRANSCRIPTS";
            case AWSConnectInstanceStorageResourceTypeCallRecordings:
                return @"CALL_RECORDINGS";
            case AWSConnectInstanceStorageResourceTypeScheduledReports:
                return @"SCHEDULED_REPORTS";
            case AWSConnectInstanceStorageResourceTypeMediaStreams:
                return @"MEDIA_STREAMS";
            case AWSConnectInstanceStorageResourceTypeContactTraceRecords:
                return @"CONTACT_TRACE_RECORDS";
            case AWSConnectInstanceStorageResourceTypeAgentEvents:
                return @"AGENT_EVENTS";
            case AWSConnectInstanceStorageResourceTypeRealTimeContactAnalysisSegments:
                return @"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS";
            case AWSConnectInstanceStorageResourceTypeAttachments:
                return @"ATTACHMENTS";
            case AWSConnectInstanceStorageResourceTypeContactEvaluations:
                return @"CONTACT_EVALUATIONS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectListInstanceStorageConfigsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"storageConfigs" : @"StorageConfigs",
             };
}

+ (NSValueTransformer *)storageConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectInstanceStorageConfig class]];
}

@end

@implementation AWSConnectListInstancesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListInstancesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceSummaryList" : @"InstanceSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instanceSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectInstanceSummary class]];
}

@end

@implementation AWSConnectListIntegrationAssociationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"integrationType" : @"IntegrationType",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeEvent);
        }
        if ([value caseInsensitiveCompare:@"VOICE_ID"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeVoiceId);
        }
        if ([value caseInsensitiveCompare:@"PINPOINT_APP"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypePinpointApp);
        }
        if ([value caseInsensitiveCompare:@"WISDOM_ASSISTANT"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeWisdomAssistant);
        }
        if ([value caseInsensitiveCompare:@"WISDOM_KNOWLEDGE_BASE"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeWisdomKnowledgeBase);
        }
        if ([value caseInsensitiveCompare:@"CASES_DOMAIN"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeCasesDomain);
        }
        return @(AWSConnectIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectIntegrationTypeEvent:
                return @"EVENT";
            case AWSConnectIntegrationTypeVoiceId:
                return @"VOICE_ID";
            case AWSConnectIntegrationTypePinpointApp:
                return @"PINPOINT_APP";
            case AWSConnectIntegrationTypeWisdomAssistant:
                return @"WISDOM_ASSISTANT";
            case AWSConnectIntegrationTypeWisdomKnowledgeBase:
                return @"WISDOM_KNOWLEDGE_BASE";
            case AWSConnectIntegrationTypeCasesDomain:
                return @"CASES_DOMAIN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectListIntegrationAssociationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"integrationAssociationSummaryList" : @"IntegrationAssociationSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)integrationAssociationSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectIntegrationAssociationSummary class]];
}

@end

@implementation AWSConnectListLambdaFunctionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListLambdaFunctionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lambdaFunctions" : @"LambdaFunctions",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListLexBotsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListLexBotsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lexBots" : @"LexBots",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)lexBotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectLexBot class]];
}

@end

@implementation AWSConnectListPhoneNumbersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"phoneNumberCountryCodes" : @"PhoneNumberCountryCodes",
             @"phoneNumberTypes" : @"PhoneNumberTypes",
             };
}

@end

@implementation AWSConnectListPhoneNumbersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"phoneNumberSummaryList" : @"PhoneNumberSummaryList",
             };
}

+ (NSValueTransformer *)phoneNumberSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectPhoneNumberSummary class]];
}

@end

@implementation AWSConnectListPhoneNumbersSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"PhoneNumber",
             @"phoneNumberArn" : @"PhoneNumberArn",
             @"phoneNumberCountryCode" : @"PhoneNumberCountryCode",
             @"phoneNumberId" : @"PhoneNumberId",
             @"phoneNumberType" : @"PhoneNumberType",
             @"targetArn" : @"TargetArn",
             };
}

+ (NSValueTransformer *)phoneNumberCountryCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAf);
        }
        if ([value caseInsensitiveCompare:@"AL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAl);
        }
        if ([value caseInsensitiveCompare:@"DZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDz);
        }
        if ([value caseInsensitiveCompare:@"AS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAs);
        }
        if ([value caseInsensitiveCompare:@"AD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAd);
        }
        if ([value caseInsensitiveCompare:@"AO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAo);
        }
        if ([value caseInsensitiveCompare:@"AI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAi);
        }
        if ([value caseInsensitiveCompare:@"AQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAq);
        }
        if ([value caseInsensitiveCompare:@"AG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAg);
        }
        if ([value caseInsensitiveCompare:@"AR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAr);
        }
        if ([value caseInsensitiveCompare:@"AM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAm);
        }
        if ([value caseInsensitiveCompare:@"AW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAw);
        }
        if ([value caseInsensitiveCompare:@"AU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAu);
        }
        if ([value caseInsensitiveCompare:@"AT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAt);
        }
        if ([value caseInsensitiveCompare:@"AZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAz);
        }
        if ([value caseInsensitiveCompare:@"BS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBs);
        }
        if ([value caseInsensitiveCompare:@"BH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBh);
        }
        if ([value caseInsensitiveCompare:@"BD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBd);
        }
        if ([value caseInsensitiveCompare:@"BB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBb);
        }
        if ([value caseInsensitiveCompare:@"BY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBy);
        }
        if ([value caseInsensitiveCompare:@"BE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBe);
        }
        if ([value caseInsensitiveCompare:@"BZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBz);
        }
        if ([value caseInsensitiveCompare:@"BJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBj);
        }
        if ([value caseInsensitiveCompare:@"BM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBm);
        }
        if ([value caseInsensitiveCompare:@"BT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBt);
        }
        if ([value caseInsensitiveCompare:@"BO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBo);
        }
        if ([value caseInsensitiveCompare:@"BA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBa);
        }
        if ([value caseInsensitiveCompare:@"BW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBw);
        }
        if ([value caseInsensitiveCompare:@"BR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBr);
        }
        if ([value caseInsensitiveCompare:@"IO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIo);
        }
        if ([value caseInsensitiveCompare:@"VG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVg);
        }
        if ([value caseInsensitiveCompare:@"BN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBn);
        }
        if ([value caseInsensitiveCompare:@"BG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBg);
        }
        if ([value caseInsensitiveCompare:@"BF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBf);
        }
        if ([value caseInsensitiveCompare:@"BI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBi);
        }
        if ([value caseInsensitiveCompare:@"KH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKh);
        }
        if ([value caseInsensitiveCompare:@"CM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCm);
        }
        if ([value caseInsensitiveCompare:@"CA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCa);
        }
        if ([value caseInsensitiveCompare:@"CV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCv);
        }
        if ([value caseInsensitiveCompare:@"KY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKy);
        }
        if ([value caseInsensitiveCompare:@"CF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCf);
        }
        if ([value caseInsensitiveCompare:@"TD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTd);
        }
        if ([value caseInsensitiveCompare:@"CL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCl);
        }
        if ([value caseInsensitiveCompare:@"CN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCn);
        }
        if ([value caseInsensitiveCompare:@"CX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCx);
        }
        if ([value caseInsensitiveCompare:@"CC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCc);
        }
        if ([value caseInsensitiveCompare:@"CO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCo);
        }
        if ([value caseInsensitiveCompare:@"KM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKm);
        }
        if ([value caseInsensitiveCompare:@"CK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCk);
        }
        if ([value caseInsensitiveCompare:@"CR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCr);
        }
        if ([value caseInsensitiveCompare:@"HR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHr);
        }
        if ([value caseInsensitiveCompare:@"CU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCu);
        }
        if ([value caseInsensitiveCompare:@"CW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCw);
        }
        if ([value caseInsensitiveCompare:@"CY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCy);
        }
        if ([value caseInsensitiveCompare:@"CZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCz);
        }
        if ([value caseInsensitiveCompare:@"CD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCd);
        }
        if ([value caseInsensitiveCompare:@"DK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDk);
        }
        if ([value caseInsensitiveCompare:@"DJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDj);
        }
        if ([value caseInsensitiveCompare:@"DM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDm);
        }
        if ([value caseInsensitiveCompare:@"DO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDo);
        }
        if ([value caseInsensitiveCompare:@"TL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTl);
        }
        if ([value caseInsensitiveCompare:@"EC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEc);
        }
        if ([value caseInsensitiveCompare:@"EG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEg);
        }
        if ([value caseInsensitiveCompare:@"SV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSv);
        }
        if ([value caseInsensitiveCompare:@"GQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGq);
        }
        if ([value caseInsensitiveCompare:@"ER"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEr);
        }
        if ([value caseInsensitiveCompare:@"EE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEe);
        }
        if ([value caseInsensitiveCompare:@"ET"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEt);
        }
        if ([value caseInsensitiveCompare:@"FK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFk);
        }
        if ([value caseInsensitiveCompare:@"FO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFo);
        }
        if ([value caseInsensitiveCompare:@"FJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFj);
        }
        if ([value caseInsensitiveCompare:@"FI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFi);
        }
        if ([value caseInsensitiveCompare:@"FR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFr);
        }
        if ([value caseInsensitiveCompare:@"PF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePf);
        }
        if ([value caseInsensitiveCompare:@"GA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGa);
        }
        if ([value caseInsensitiveCompare:@"GM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGm);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGE);
        }
        if ([value caseInsensitiveCompare:@"DE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDe);
        }
        if ([value caseInsensitiveCompare:@"GH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGh);
        }
        if ([value caseInsensitiveCompare:@"GI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGi);
        }
        if ([value caseInsensitiveCompare:@"GR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGr);
        }
        if ([value caseInsensitiveCompare:@"GL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGl);
        }
        if ([value caseInsensitiveCompare:@"GD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGd);
        }
        if ([value caseInsensitiveCompare:@"GU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGu);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGT);
        }
        if ([value caseInsensitiveCompare:@"GG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGg);
        }
        if ([value caseInsensitiveCompare:@"GN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGn);
        }
        if ([value caseInsensitiveCompare:@"GW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGw);
        }
        if ([value caseInsensitiveCompare:@"GY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGy);
        }
        if ([value caseInsensitiveCompare:@"HT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHt);
        }
        if ([value caseInsensitiveCompare:@"HN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHn);
        }
        if ([value caseInsensitiveCompare:@"HK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHk);
        }
        if ([value caseInsensitiveCompare:@"HU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHu);
        }
        if ([value caseInsensitiveCompare:@"IS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIs);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIN);
        }
        if ([value caseInsensitiveCompare:@"ID"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeId);
        }
        if ([value caseInsensitiveCompare:@"IR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIr);
        }
        if ([value caseInsensitiveCompare:@"IQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIq);
        }
        if ([value caseInsensitiveCompare:@"IE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIe);
        }
        if ([value caseInsensitiveCompare:@"IM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIm);
        }
        if ([value caseInsensitiveCompare:@"IL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIl);
        }
        if ([value caseInsensitiveCompare:@"IT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIt);
        }
        if ([value caseInsensitiveCompare:@"CI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCi);
        }
        if ([value caseInsensitiveCompare:@"JM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJm);
        }
        if ([value caseInsensitiveCompare:@"JP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJp);
        }
        if ([value caseInsensitiveCompare:@"JE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJe);
        }
        if ([value caseInsensitiveCompare:@"JO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJo);
        }
        if ([value caseInsensitiveCompare:@"KZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKz);
        }
        if ([value caseInsensitiveCompare:@"KE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKe);
        }
        if ([value caseInsensitiveCompare:@"KI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKi);
        }
        if ([value caseInsensitiveCompare:@"KW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKw);
        }
        if ([value caseInsensitiveCompare:@"KG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKg);
        }
        if ([value caseInsensitiveCompare:@"LA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLa);
        }
        if ([value caseInsensitiveCompare:@"LV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLv);
        }
        if ([value caseInsensitiveCompare:@"LB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLb);
        }
        if ([value caseInsensitiveCompare:@"LS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLs);
        }
        if ([value caseInsensitiveCompare:@"LR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLr);
        }
        if ([value caseInsensitiveCompare:@"LY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLy);
        }
        if ([value caseInsensitiveCompare:@"LI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLi);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLT);
        }
        if ([value caseInsensitiveCompare:@"LU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLu);
        }
        if ([value caseInsensitiveCompare:@"MO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMo);
        }
        if ([value caseInsensitiveCompare:@"MK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMk);
        }
        if ([value caseInsensitiveCompare:@"MG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMg);
        }
        if ([value caseInsensitiveCompare:@"MW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMw);
        }
        if ([value caseInsensitiveCompare:@"MY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMy);
        }
        if ([value caseInsensitiveCompare:@"MV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMv);
        }
        if ([value caseInsensitiveCompare:@"ML"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMl);
        }
        if ([value caseInsensitiveCompare:@"MT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMt);
        }
        if ([value caseInsensitiveCompare:@"MH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMh);
        }
        if ([value caseInsensitiveCompare:@"MR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMr);
        }
        if ([value caseInsensitiveCompare:@"MU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMu);
        }
        if ([value caseInsensitiveCompare:@"YT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeYt);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMx);
        }
        if ([value caseInsensitiveCompare:@"FM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFm);
        }
        if ([value caseInsensitiveCompare:@"MD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMd);
        }
        if ([value caseInsensitiveCompare:@"MC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMc);
        }
        if ([value caseInsensitiveCompare:@"MN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMn);
        }
        if ([value caseInsensitiveCompare:@"ME"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMe);
        }
        if ([value caseInsensitiveCompare:@"MS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMs);
        }
        if ([value caseInsensitiveCompare:@"MA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMa);
        }
        if ([value caseInsensitiveCompare:@"MZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMz);
        }
        if ([value caseInsensitiveCompare:@"MM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMm);
        }
        if ([value caseInsensitiveCompare:@"NA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNa);
        }
        if ([value caseInsensitiveCompare:@"NR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNr);
        }
        if ([value caseInsensitiveCompare:@"NP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNp);
        }
        if ([value caseInsensitiveCompare:@"NL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNl);
        }
        if ([value caseInsensitiveCompare:@"AN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAn);
        }
        if ([value caseInsensitiveCompare:@"NC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNc);
        }
        if ([value caseInsensitiveCompare:@"NZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNz);
        }
        if ([value caseInsensitiveCompare:@"NI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNi);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNE);
        }
        if ([value caseInsensitiveCompare:@"NG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNg);
        }
        if ([value caseInsensitiveCompare:@"NU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNu);
        }
        if ([value caseInsensitiveCompare:@"KP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKp);
        }
        if ([value caseInsensitiveCompare:@"MP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMp);
        }
        if ([value caseInsensitiveCompare:@"NO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNo);
        }
        if ([value caseInsensitiveCompare:@"OM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeOm);
        }
        if ([value caseInsensitiveCompare:@"PK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePk);
        }
        if ([value caseInsensitiveCompare:@"PW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePw);
        }
        if ([value caseInsensitiveCompare:@"PA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePa);
        }
        if ([value caseInsensitiveCompare:@"PG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePg);
        }
        if ([value caseInsensitiveCompare:@"PY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePy);
        }
        if ([value caseInsensitiveCompare:@"PE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePe);
        }
        if ([value caseInsensitiveCompare:@"PH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePh);
        }
        if ([value caseInsensitiveCompare:@"PN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePn);
        }
        if ([value caseInsensitiveCompare:@"PL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePl);
        }
        if ([value caseInsensitiveCompare:@"PT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePt);
        }
        if ([value caseInsensitiveCompare:@"PR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePr);
        }
        if ([value caseInsensitiveCompare:@"QA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeQa);
        }
        if ([value caseInsensitiveCompare:@"CG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCg);
        }
        if ([value caseInsensitiveCompare:@"RE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRe);
        }
        if ([value caseInsensitiveCompare:@"RO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRo);
        }
        if ([value caseInsensitiveCompare:@"RU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRu);
        }
        if ([value caseInsensitiveCompare:@"RW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRw);
        }
        if ([value caseInsensitiveCompare:@"BL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBl);
        }
        if ([value caseInsensitiveCompare:@"SH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSh);
        }
        if ([value caseInsensitiveCompare:@"KN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKn);
        }
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLc);
        }
        if ([value caseInsensitiveCompare:@"MF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMf);
        }
        if ([value caseInsensitiveCompare:@"PM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePm);
        }
        if ([value caseInsensitiveCompare:@"VC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVc);
        }
        if ([value caseInsensitiveCompare:@"WS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeWs);
        }
        if ([value caseInsensitiveCompare:@"SM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSm);
        }
        if ([value caseInsensitiveCompare:@"ST"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSt);
        }
        if ([value caseInsensitiveCompare:@"SA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSa);
        }
        if ([value caseInsensitiveCompare:@"SN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSn);
        }
        if ([value caseInsensitiveCompare:@"RS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRs);
        }
        if ([value caseInsensitiveCompare:@"SC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSc);
        }
        if ([value caseInsensitiveCompare:@"SL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSl);
        }
        if ([value caseInsensitiveCompare:@"SG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSg);
        }
        if ([value caseInsensitiveCompare:@"SX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSx);
        }
        if ([value caseInsensitiveCompare:@"SK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSk);
        }
        if ([value caseInsensitiveCompare:@"SI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSi);
        }
        if ([value caseInsensitiveCompare:@"SB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSb);
        }
        if ([value caseInsensitiveCompare:@"SO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSo);
        }
        if ([value caseInsensitiveCompare:@"ZA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZa);
        }
        if ([value caseInsensitiveCompare:@"KR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKr);
        }
        if ([value caseInsensitiveCompare:@"ES"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEs);
        }
        if ([value caseInsensitiveCompare:@"LK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLk);
        }
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSd);
        }
        if ([value caseInsensitiveCompare:@"SR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSr);
        }
        if ([value caseInsensitiveCompare:@"SJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSj);
        }
        if ([value caseInsensitiveCompare:@"SZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSz);
        }
        if ([value caseInsensitiveCompare:@"SE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSe);
        }
        if ([value caseInsensitiveCompare:@"CH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCh);
        }
        if ([value caseInsensitiveCompare:@"SY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSy);
        }
        if ([value caseInsensitiveCompare:@"TW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTw);
        }
        if ([value caseInsensitiveCompare:@"TJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTj);
        }
        if ([value caseInsensitiveCompare:@"TZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTz);
        }
        if ([value caseInsensitiveCompare:@"TH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTh);
        }
        if ([value caseInsensitiveCompare:@"TG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTg);
        }
        if ([value caseInsensitiveCompare:@"TK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTk);
        }
        if ([value caseInsensitiveCompare:@"TO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTo);
        }
        if ([value caseInsensitiveCompare:@"TT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTt);
        }
        if ([value caseInsensitiveCompare:@"TN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTn);
        }
        if ([value caseInsensitiveCompare:@"TR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTr);
        }
        if ([value caseInsensitiveCompare:@"TM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTm);
        }
        if ([value caseInsensitiveCompare:@"TC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTc);
        }
        if ([value caseInsensitiveCompare:@"TV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTv);
        }
        if ([value caseInsensitiveCompare:@"VI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVi);
        }
        if ([value caseInsensitiveCompare:@"UG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUg);
        }
        if ([value caseInsensitiveCompare:@"UA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUa);
        }
        if ([value caseInsensitiveCompare:@"AE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAe);
        }
        if ([value caseInsensitiveCompare:@"GB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGb);
        }
        if ([value caseInsensitiveCompare:@"US"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUs);
        }
        if ([value caseInsensitiveCompare:@"UY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUy);
        }
        if ([value caseInsensitiveCompare:@"UZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUz);
        }
        if ([value caseInsensitiveCompare:@"VU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVu);
        }
        if ([value caseInsensitiveCompare:@"VA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVa);
        }
        if ([value caseInsensitiveCompare:@"VE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVe);
        }
        if ([value caseInsensitiveCompare:@"VN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVn);
        }
        if ([value caseInsensitiveCompare:@"WF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeWf);
        }
        if ([value caseInsensitiveCompare:@"EH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEh);
        }
        if ([value caseInsensitiveCompare:@"YE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeYe);
        }
        if ([value caseInsensitiveCompare:@"ZM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZm);
        }
        if ([value caseInsensitiveCompare:@"ZW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZw);
        }
        return @(AWSConnectPhoneNumberCountryCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneNumberCountryCodeAf:
                return @"AF";
            case AWSConnectPhoneNumberCountryCodeAl:
                return @"AL";
            case AWSConnectPhoneNumberCountryCodeDz:
                return @"DZ";
            case AWSConnectPhoneNumberCountryCodeAs:
                return @"AS";
            case AWSConnectPhoneNumberCountryCodeAd:
                return @"AD";
            case AWSConnectPhoneNumberCountryCodeAo:
                return @"AO";
            case AWSConnectPhoneNumberCountryCodeAi:
                return @"AI";
            case AWSConnectPhoneNumberCountryCodeAq:
                return @"AQ";
            case AWSConnectPhoneNumberCountryCodeAg:
                return @"AG";
            case AWSConnectPhoneNumberCountryCodeAr:
                return @"AR";
            case AWSConnectPhoneNumberCountryCodeAm:
                return @"AM";
            case AWSConnectPhoneNumberCountryCodeAw:
                return @"AW";
            case AWSConnectPhoneNumberCountryCodeAu:
                return @"AU";
            case AWSConnectPhoneNumberCountryCodeAt:
                return @"AT";
            case AWSConnectPhoneNumberCountryCodeAz:
                return @"AZ";
            case AWSConnectPhoneNumberCountryCodeBs:
                return @"BS";
            case AWSConnectPhoneNumberCountryCodeBh:
                return @"BH";
            case AWSConnectPhoneNumberCountryCodeBd:
                return @"BD";
            case AWSConnectPhoneNumberCountryCodeBb:
                return @"BB";
            case AWSConnectPhoneNumberCountryCodeBy:
                return @"BY";
            case AWSConnectPhoneNumberCountryCodeBe:
                return @"BE";
            case AWSConnectPhoneNumberCountryCodeBz:
                return @"BZ";
            case AWSConnectPhoneNumberCountryCodeBj:
                return @"BJ";
            case AWSConnectPhoneNumberCountryCodeBm:
                return @"BM";
            case AWSConnectPhoneNumberCountryCodeBt:
                return @"BT";
            case AWSConnectPhoneNumberCountryCodeBo:
                return @"BO";
            case AWSConnectPhoneNumberCountryCodeBa:
                return @"BA";
            case AWSConnectPhoneNumberCountryCodeBw:
                return @"BW";
            case AWSConnectPhoneNumberCountryCodeBr:
                return @"BR";
            case AWSConnectPhoneNumberCountryCodeIo:
                return @"IO";
            case AWSConnectPhoneNumberCountryCodeVg:
                return @"VG";
            case AWSConnectPhoneNumberCountryCodeBn:
                return @"BN";
            case AWSConnectPhoneNumberCountryCodeBg:
                return @"BG";
            case AWSConnectPhoneNumberCountryCodeBf:
                return @"BF";
            case AWSConnectPhoneNumberCountryCodeBi:
                return @"BI";
            case AWSConnectPhoneNumberCountryCodeKh:
                return @"KH";
            case AWSConnectPhoneNumberCountryCodeCm:
                return @"CM";
            case AWSConnectPhoneNumberCountryCodeCa:
                return @"CA";
            case AWSConnectPhoneNumberCountryCodeCv:
                return @"CV";
            case AWSConnectPhoneNumberCountryCodeKy:
                return @"KY";
            case AWSConnectPhoneNumberCountryCodeCf:
                return @"CF";
            case AWSConnectPhoneNumberCountryCodeTd:
                return @"TD";
            case AWSConnectPhoneNumberCountryCodeCl:
                return @"CL";
            case AWSConnectPhoneNumberCountryCodeCn:
                return @"CN";
            case AWSConnectPhoneNumberCountryCodeCx:
                return @"CX";
            case AWSConnectPhoneNumberCountryCodeCc:
                return @"CC";
            case AWSConnectPhoneNumberCountryCodeCo:
                return @"CO";
            case AWSConnectPhoneNumberCountryCodeKm:
                return @"KM";
            case AWSConnectPhoneNumberCountryCodeCk:
                return @"CK";
            case AWSConnectPhoneNumberCountryCodeCr:
                return @"CR";
            case AWSConnectPhoneNumberCountryCodeHr:
                return @"HR";
            case AWSConnectPhoneNumberCountryCodeCu:
                return @"CU";
            case AWSConnectPhoneNumberCountryCodeCw:
                return @"CW";
            case AWSConnectPhoneNumberCountryCodeCy:
                return @"CY";
            case AWSConnectPhoneNumberCountryCodeCz:
                return @"CZ";
            case AWSConnectPhoneNumberCountryCodeCd:
                return @"CD";
            case AWSConnectPhoneNumberCountryCodeDk:
                return @"DK";
            case AWSConnectPhoneNumberCountryCodeDj:
                return @"DJ";
            case AWSConnectPhoneNumberCountryCodeDm:
                return @"DM";
            case AWSConnectPhoneNumberCountryCodeDo:
                return @"DO";
            case AWSConnectPhoneNumberCountryCodeTl:
                return @"TL";
            case AWSConnectPhoneNumberCountryCodeEc:
                return @"EC";
            case AWSConnectPhoneNumberCountryCodeEg:
                return @"EG";
            case AWSConnectPhoneNumberCountryCodeSv:
                return @"SV";
            case AWSConnectPhoneNumberCountryCodeGq:
                return @"GQ";
            case AWSConnectPhoneNumberCountryCodeEr:
                return @"ER";
            case AWSConnectPhoneNumberCountryCodeEe:
                return @"EE";
            case AWSConnectPhoneNumberCountryCodeEt:
                return @"ET";
            case AWSConnectPhoneNumberCountryCodeFk:
                return @"FK";
            case AWSConnectPhoneNumberCountryCodeFo:
                return @"FO";
            case AWSConnectPhoneNumberCountryCodeFj:
                return @"FJ";
            case AWSConnectPhoneNumberCountryCodeFi:
                return @"FI";
            case AWSConnectPhoneNumberCountryCodeFr:
                return @"FR";
            case AWSConnectPhoneNumberCountryCodePf:
                return @"PF";
            case AWSConnectPhoneNumberCountryCodeGa:
                return @"GA";
            case AWSConnectPhoneNumberCountryCodeGm:
                return @"GM";
            case AWSConnectPhoneNumberCountryCodeGE:
                return @"GE";
            case AWSConnectPhoneNumberCountryCodeDe:
                return @"DE";
            case AWSConnectPhoneNumberCountryCodeGh:
                return @"GH";
            case AWSConnectPhoneNumberCountryCodeGi:
                return @"GI";
            case AWSConnectPhoneNumberCountryCodeGr:
                return @"GR";
            case AWSConnectPhoneNumberCountryCodeGl:
                return @"GL";
            case AWSConnectPhoneNumberCountryCodeGd:
                return @"GD";
            case AWSConnectPhoneNumberCountryCodeGu:
                return @"GU";
            case AWSConnectPhoneNumberCountryCodeGT:
                return @"GT";
            case AWSConnectPhoneNumberCountryCodeGg:
                return @"GG";
            case AWSConnectPhoneNumberCountryCodeGn:
                return @"GN";
            case AWSConnectPhoneNumberCountryCodeGw:
                return @"GW";
            case AWSConnectPhoneNumberCountryCodeGy:
                return @"GY";
            case AWSConnectPhoneNumberCountryCodeHt:
                return @"HT";
            case AWSConnectPhoneNumberCountryCodeHn:
                return @"HN";
            case AWSConnectPhoneNumberCountryCodeHk:
                return @"HK";
            case AWSConnectPhoneNumberCountryCodeHu:
                return @"HU";
            case AWSConnectPhoneNumberCountryCodeIs:
                return @"IS";
            case AWSConnectPhoneNumberCountryCodeIN:
                return @"IN";
            case AWSConnectPhoneNumberCountryCodeId:
                return @"ID";
            case AWSConnectPhoneNumberCountryCodeIr:
                return @"IR";
            case AWSConnectPhoneNumberCountryCodeIq:
                return @"IQ";
            case AWSConnectPhoneNumberCountryCodeIe:
                return @"IE";
            case AWSConnectPhoneNumberCountryCodeIm:
                return @"IM";
            case AWSConnectPhoneNumberCountryCodeIl:
                return @"IL";
            case AWSConnectPhoneNumberCountryCodeIt:
                return @"IT";
            case AWSConnectPhoneNumberCountryCodeCi:
                return @"CI";
            case AWSConnectPhoneNumberCountryCodeJm:
                return @"JM";
            case AWSConnectPhoneNumberCountryCodeJp:
                return @"JP";
            case AWSConnectPhoneNumberCountryCodeJe:
                return @"JE";
            case AWSConnectPhoneNumberCountryCodeJo:
                return @"JO";
            case AWSConnectPhoneNumberCountryCodeKz:
                return @"KZ";
            case AWSConnectPhoneNumberCountryCodeKe:
                return @"KE";
            case AWSConnectPhoneNumberCountryCodeKi:
                return @"KI";
            case AWSConnectPhoneNumberCountryCodeKw:
                return @"KW";
            case AWSConnectPhoneNumberCountryCodeKg:
                return @"KG";
            case AWSConnectPhoneNumberCountryCodeLa:
                return @"LA";
            case AWSConnectPhoneNumberCountryCodeLv:
                return @"LV";
            case AWSConnectPhoneNumberCountryCodeLb:
                return @"LB";
            case AWSConnectPhoneNumberCountryCodeLs:
                return @"LS";
            case AWSConnectPhoneNumberCountryCodeLr:
                return @"LR";
            case AWSConnectPhoneNumberCountryCodeLy:
                return @"LY";
            case AWSConnectPhoneNumberCountryCodeLi:
                return @"LI";
            case AWSConnectPhoneNumberCountryCodeLT:
                return @"LT";
            case AWSConnectPhoneNumberCountryCodeLu:
                return @"LU";
            case AWSConnectPhoneNumberCountryCodeMo:
                return @"MO";
            case AWSConnectPhoneNumberCountryCodeMk:
                return @"MK";
            case AWSConnectPhoneNumberCountryCodeMg:
                return @"MG";
            case AWSConnectPhoneNumberCountryCodeMw:
                return @"MW";
            case AWSConnectPhoneNumberCountryCodeMy:
                return @"MY";
            case AWSConnectPhoneNumberCountryCodeMv:
                return @"MV";
            case AWSConnectPhoneNumberCountryCodeMl:
                return @"ML";
            case AWSConnectPhoneNumberCountryCodeMt:
                return @"MT";
            case AWSConnectPhoneNumberCountryCodeMh:
                return @"MH";
            case AWSConnectPhoneNumberCountryCodeMr:
                return @"MR";
            case AWSConnectPhoneNumberCountryCodeMu:
                return @"MU";
            case AWSConnectPhoneNumberCountryCodeYt:
                return @"YT";
            case AWSConnectPhoneNumberCountryCodeMx:
                return @"MX";
            case AWSConnectPhoneNumberCountryCodeFm:
                return @"FM";
            case AWSConnectPhoneNumberCountryCodeMd:
                return @"MD";
            case AWSConnectPhoneNumberCountryCodeMc:
                return @"MC";
            case AWSConnectPhoneNumberCountryCodeMn:
                return @"MN";
            case AWSConnectPhoneNumberCountryCodeMe:
                return @"ME";
            case AWSConnectPhoneNumberCountryCodeMs:
                return @"MS";
            case AWSConnectPhoneNumberCountryCodeMa:
                return @"MA";
            case AWSConnectPhoneNumberCountryCodeMz:
                return @"MZ";
            case AWSConnectPhoneNumberCountryCodeMm:
                return @"MM";
            case AWSConnectPhoneNumberCountryCodeNa:
                return @"NA";
            case AWSConnectPhoneNumberCountryCodeNr:
                return @"NR";
            case AWSConnectPhoneNumberCountryCodeNp:
                return @"NP";
            case AWSConnectPhoneNumberCountryCodeNl:
                return @"NL";
            case AWSConnectPhoneNumberCountryCodeAn:
                return @"AN";
            case AWSConnectPhoneNumberCountryCodeNc:
                return @"NC";
            case AWSConnectPhoneNumberCountryCodeNz:
                return @"NZ";
            case AWSConnectPhoneNumberCountryCodeNi:
                return @"NI";
            case AWSConnectPhoneNumberCountryCodeNE:
                return @"NE";
            case AWSConnectPhoneNumberCountryCodeNg:
                return @"NG";
            case AWSConnectPhoneNumberCountryCodeNu:
                return @"NU";
            case AWSConnectPhoneNumberCountryCodeKp:
                return @"KP";
            case AWSConnectPhoneNumberCountryCodeMp:
                return @"MP";
            case AWSConnectPhoneNumberCountryCodeNo:
                return @"NO";
            case AWSConnectPhoneNumberCountryCodeOm:
                return @"OM";
            case AWSConnectPhoneNumberCountryCodePk:
                return @"PK";
            case AWSConnectPhoneNumberCountryCodePw:
                return @"PW";
            case AWSConnectPhoneNumberCountryCodePa:
                return @"PA";
            case AWSConnectPhoneNumberCountryCodePg:
                return @"PG";
            case AWSConnectPhoneNumberCountryCodePy:
                return @"PY";
            case AWSConnectPhoneNumberCountryCodePe:
                return @"PE";
            case AWSConnectPhoneNumberCountryCodePh:
                return @"PH";
            case AWSConnectPhoneNumberCountryCodePn:
                return @"PN";
            case AWSConnectPhoneNumberCountryCodePl:
                return @"PL";
            case AWSConnectPhoneNumberCountryCodePt:
                return @"PT";
            case AWSConnectPhoneNumberCountryCodePr:
                return @"PR";
            case AWSConnectPhoneNumberCountryCodeQa:
                return @"QA";
            case AWSConnectPhoneNumberCountryCodeCg:
                return @"CG";
            case AWSConnectPhoneNumberCountryCodeRe:
                return @"RE";
            case AWSConnectPhoneNumberCountryCodeRo:
                return @"RO";
            case AWSConnectPhoneNumberCountryCodeRu:
                return @"RU";
            case AWSConnectPhoneNumberCountryCodeRw:
                return @"RW";
            case AWSConnectPhoneNumberCountryCodeBl:
                return @"BL";
            case AWSConnectPhoneNumberCountryCodeSh:
                return @"SH";
            case AWSConnectPhoneNumberCountryCodeKn:
                return @"KN";
            case AWSConnectPhoneNumberCountryCodeLc:
                return @"LC";
            case AWSConnectPhoneNumberCountryCodeMf:
                return @"MF";
            case AWSConnectPhoneNumberCountryCodePm:
                return @"PM";
            case AWSConnectPhoneNumberCountryCodeVc:
                return @"VC";
            case AWSConnectPhoneNumberCountryCodeWs:
                return @"WS";
            case AWSConnectPhoneNumberCountryCodeSm:
                return @"SM";
            case AWSConnectPhoneNumberCountryCodeSt:
                return @"ST";
            case AWSConnectPhoneNumberCountryCodeSa:
                return @"SA";
            case AWSConnectPhoneNumberCountryCodeSn:
                return @"SN";
            case AWSConnectPhoneNumberCountryCodeRs:
                return @"RS";
            case AWSConnectPhoneNumberCountryCodeSc:
                return @"SC";
            case AWSConnectPhoneNumberCountryCodeSl:
                return @"SL";
            case AWSConnectPhoneNumberCountryCodeSg:
                return @"SG";
            case AWSConnectPhoneNumberCountryCodeSx:
                return @"SX";
            case AWSConnectPhoneNumberCountryCodeSk:
                return @"SK";
            case AWSConnectPhoneNumberCountryCodeSi:
                return @"SI";
            case AWSConnectPhoneNumberCountryCodeSb:
                return @"SB";
            case AWSConnectPhoneNumberCountryCodeSo:
                return @"SO";
            case AWSConnectPhoneNumberCountryCodeZa:
                return @"ZA";
            case AWSConnectPhoneNumberCountryCodeKr:
                return @"KR";
            case AWSConnectPhoneNumberCountryCodeEs:
                return @"ES";
            case AWSConnectPhoneNumberCountryCodeLk:
                return @"LK";
            case AWSConnectPhoneNumberCountryCodeSd:
                return @"SD";
            case AWSConnectPhoneNumberCountryCodeSr:
                return @"SR";
            case AWSConnectPhoneNumberCountryCodeSj:
                return @"SJ";
            case AWSConnectPhoneNumberCountryCodeSz:
                return @"SZ";
            case AWSConnectPhoneNumberCountryCodeSe:
                return @"SE";
            case AWSConnectPhoneNumberCountryCodeCh:
                return @"CH";
            case AWSConnectPhoneNumberCountryCodeSy:
                return @"SY";
            case AWSConnectPhoneNumberCountryCodeTw:
                return @"TW";
            case AWSConnectPhoneNumberCountryCodeTj:
                return @"TJ";
            case AWSConnectPhoneNumberCountryCodeTz:
                return @"TZ";
            case AWSConnectPhoneNumberCountryCodeTh:
                return @"TH";
            case AWSConnectPhoneNumberCountryCodeTg:
                return @"TG";
            case AWSConnectPhoneNumberCountryCodeTk:
                return @"TK";
            case AWSConnectPhoneNumberCountryCodeTo:
                return @"TO";
            case AWSConnectPhoneNumberCountryCodeTt:
                return @"TT";
            case AWSConnectPhoneNumberCountryCodeTn:
                return @"TN";
            case AWSConnectPhoneNumberCountryCodeTr:
                return @"TR";
            case AWSConnectPhoneNumberCountryCodeTm:
                return @"TM";
            case AWSConnectPhoneNumberCountryCodeTc:
                return @"TC";
            case AWSConnectPhoneNumberCountryCodeTv:
                return @"TV";
            case AWSConnectPhoneNumberCountryCodeVi:
                return @"VI";
            case AWSConnectPhoneNumberCountryCodeUg:
                return @"UG";
            case AWSConnectPhoneNumberCountryCodeUa:
                return @"UA";
            case AWSConnectPhoneNumberCountryCodeAe:
                return @"AE";
            case AWSConnectPhoneNumberCountryCodeGb:
                return @"GB";
            case AWSConnectPhoneNumberCountryCodeUs:
                return @"US";
            case AWSConnectPhoneNumberCountryCodeUy:
                return @"UY";
            case AWSConnectPhoneNumberCountryCodeUz:
                return @"UZ";
            case AWSConnectPhoneNumberCountryCodeVu:
                return @"VU";
            case AWSConnectPhoneNumberCountryCodeVa:
                return @"VA";
            case AWSConnectPhoneNumberCountryCodeVe:
                return @"VE";
            case AWSConnectPhoneNumberCountryCodeVn:
                return @"VN";
            case AWSConnectPhoneNumberCountryCodeWf:
                return @"WF";
            case AWSConnectPhoneNumberCountryCodeEh:
                return @"EH";
            case AWSConnectPhoneNumberCountryCodeYe:
                return @"YE";
            case AWSConnectPhoneNumberCountryCodeZm:
                return @"ZM";
            case AWSConnectPhoneNumberCountryCodeZw:
                return @"ZW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)phoneNumberTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TOLL_FREE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberTypeTollFree);
        }
        if ([value caseInsensitiveCompare:@"DID"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberTypeDid);
        }
        return @(AWSConnectPhoneNumberTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneNumberTypeTollFree:
                return @"TOLL_FREE";
            case AWSConnectPhoneNumberTypeDid:
                return @"DID";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectListPhoneNumbersV2Request

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"phoneNumberCountryCodes" : @"PhoneNumberCountryCodes",
             @"phoneNumberPrefix" : @"PhoneNumberPrefix",
             @"phoneNumberTypes" : @"PhoneNumberTypes",
             @"targetArn" : @"TargetArn",
             };
}

@end

@implementation AWSConnectListPhoneNumbersV2Response

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listPhoneNumbersSummaryList" : @"ListPhoneNumbersSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)listPhoneNumbersSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectListPhoneNumbersSummary class]];
}

@end

@implementation AWSConnectListPromptsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListPromptsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"promptSummaryList" : @"PromptSummaryList",
             };
}

+ (NSValueTransformer *)promptSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectPromptSummary class]];
}

@end

@implementation AWSConnectListQueueQuickConnectsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"queueId" : @"QueueId",
             };
}

@end

@implementation AWSConnectListQueueQuickConnectsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"quickConnectSummaryList" : @"QuickConnectSummaryList",
             };
}

+ (NSValueTransformer *)quickConnectSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectQuickConnectSummary class]];
}

@end

@implementation AWSConnectListQueuesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"queueTypes" : @"QueueTypes",
             };
}

@end

@implementation AWSConnectListQueuesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"queueSummaryList" : @"QueueSummaryList",
             };
}

+ (NSValueTransformer *)queueSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectQueueSummary class]];
}

@end

@implementation AWSConnectListQuickConnectsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"quickConnectTypes" : @"QuickConnectTypes",
             };
}

@end

@implementation AWSConnectListQuickConnectsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"quickConnectSummaryList" : @"QuickConnectSummaryList",
             };
}

+ (NSValueTransformer *)quickConnectSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectQuickConnectSummary class]];
}

@end

@implementation AWSConnectListRoutingProfileQueuesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"routingProfileId" : @"RoutingProfileId",
             };
}

@end

@implementation AWSConnectListRoutingProfileQueuesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"routingProfileQueueConfigSummaryList" : @"RoutingProfileQueueConfigSummaryList",
             };
}

+ (NSValueTransformer *)routingProfileQueueConfigSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRoutingProfileQueueConfigSummary class]];
}

@end

@implementation AWSConnectListRoutingProfilesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListRoutingProfilesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"routingProfileSummaryList" : @"RoutingProfileSummaryList",
             };
}

+ (NSValueTransformer *)routingProfileSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRoutingProfileSummary class]];
}

@end

@implementation AWSConnectListRulesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSourceName" : @"EventSourceName",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"publishStatus" : @"PublishStatus",
             };
}

+ (NSValueTransformer *)eventSourceNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OnPostCallAnalysisAvailable"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnPostCallAnalysisAvailable);
        }
        if ([value caseInsensitiveCompare:@"OnRealTimeCallAnalysisAvailable"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnRealTimeCallAnalysisAvailable);
        }
        if ([value caseInsensitiveCompare:@"OnPostChatAnalysisAvailable"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnPostChatAnalysisAvailable);
        }
        if ([value caseInsensitiveCompare:@"OnZendeskTicketCreate"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnZendeskTicketCreate);
        }
        if ([value caseInsensitiveCompare:@"OnZendeskTicketStatusUpdate"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnZendeskTicketStatusUpdate);
        }
        if ([value caseInsensitiveCompare:@"OnSalesforceCaseCreate"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnSalesforceCaseCreate);
        }
        return @(AWSConnectEventSourceNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectEventSourceNameOnPostCallAnalysisAvailable:
                return @"OnPostCallAnalysisAvailable";
            case AWSConnectEventSourceNameOnRealTimeCallAnalysisAvailable:
                return @"OnRealTimeCallAnalysisAvailable";
            case AWSConnectEventSourceNameOnPostChatAnalysisAvailable:
                return @"OnPostChatAnalysisAvailable";
            case AWSConnectEventSourceNameOnZendeskTicketCreate:
                return @"OnZendeskTicketCreate";
            case AWSConnectEventSourceNameOnZendeskTicketStatusUpdate:
                return @"OnZendeskTicketStatusUpdate";
            case AWSConnectEventSourceNameOnSalesforceCaseCreate:
                return @"OnSalesforceCaseCreate";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)publishStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSConnectRulePublishStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"PUBLISHED"] == NSOrderedSame) {
            return @(AWSConnectRulePublishStatusPublished);
        }
        return @(AWSConnectRulePublishStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectRulePublishStatusDraft:
                return @"DRAFT";
            case AWSConnectRulePublishStatusPublished:
                return @"PUBLISHED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectListRulesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"ruleSummaryList" : @"RuleSummaryList",
             };
}

+ (NSValueTransformer *)ruleSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRuleSummary class]];
}

@end

@implementation AWSConnectListSecurityKeysRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListSecurityKeysResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"securityKeys" : @"SecurityKeys",
             };
}

+ (NSValueTransformer *)securityKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectSecurityKey class]];
}

@end

@implementation AWSConnectListSecurityProfilePermissionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"securityProfileId" : @"SecurityProfileId",
             };
}

@end

@implementation AWSConnectListSecurityProfilePermissionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"permissions" : @"Permissions",
             };
}

@end

@implementation AWSConnectListSecurityProfilesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListSecurityProfilesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"securityProfileSummaryList" : @"SecurityProfileSummaryList",
             };
}

+ (NSValueTransformer *)securityProfileSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectSecurityProfileSummary class]];
}

@end

@implementation AWSConnectListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSConnectListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSConnectListTaskTemplatesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusInactive);
        }
        return @(AWSConnectTaskTemplateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectTaskTemplateStatusActive:
                return @"ACTIVE";
            case AWSConnectTaskTemplateStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectListTaskTemplatesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"taskTemplates" : @"TaskTemplates",
             };
}

+ (NSValueTransformer *)taskTemplatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectTaskTemplateMetadata class]];
}

@end

@implementation AWSConnectListTrafficDistributionGroupsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListTrafficDistributionGroupsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trafficDistributionGroupSummaryList" : @"TrafficDistributionGroupSummaryList",
             };
}

+ (NSValueTransformer *)trafficDistributionGroupSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectTrafficDistributionGroupSummary class]];
}

@end

@implementation AWSConnectListUseCasesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"integrationAssociationId" : @"IntegrationAssociationId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListUseCasesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"useCaseSummaryList" : @"UseCaseSummaryList",
             };
}

+ (NSValueTransformer *)useCaseSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectUseCase class]];
}

@end

@implementation AWSConnectListUserHierarchyGroupsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListUserHierarchyGroupsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"userHierarchyGroupSummaryList" : @"UserHierarchyGroupSummaryList",
             };
}

+ (NSValueTransformer *)userHierarchyGroupSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectHierarchyGroupSummary class]];
}

@end

@implementation AWSConnectListUsersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListUsersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"userSummaryList" : @"UserSummaryList",
             };
}

+ (NSValueTransformer *)userSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectUserSummary class]];
}

@end

@implementation AWSConnectMediaConcurrency

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             @"concurrency" : @"Concurrency",
             @"crossChannelBehavior" : @"CrossChannelBehavior",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSConnectChannelVoice);
        }
        if ([value caseInsensitiveCompare:@"CHAT"] == NSOrderedSame) {
            return @(AWSConnectChannelChat);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSConnectChannelTask);
        }
        return @(AWSConnectChannelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectChannelVoice:
                return @"VOICE";
            case AWSConnectChannelChat:
                return @"CHAT";
            case AWSConnectChannelTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)crossChannelBehaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectCrossChannelBehavior class]];
}

@end

@implementation AWSConnectMetricDataV2

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metric" : @"Metric",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)metricJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectMetricV2 class]];
}

@end

@implementation AWSConnectMetricFilterV2

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricFilterKey" : @"MetricFilterKey",
             @"metricFilterValues" : @"MetricFilterValues",
             };
}

@end

@implementation AWSConnectMetricResultV2

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collections" : @"Collections",
             @"dimensions" : @"Dimensions",
             };
}

+ (NSValueTransformer *)collectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectMetricDataV2 class]];
}

@end

@implementation AWSConnectMetricV2

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricFilters" : @"MetricFilters",
             @"name" : @"Name",
             @"threshold" : @"Threshold",
             };
}

+ (NSValueTransformer *)metricFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectMetricFilterV2 class]];
}

+ (NSValueTransformer *)thresholdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectThresholdV2 class]];
}

@end

@implementation AWSConnectMonitorContactRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedMonitorCapabilities" : @"AllowedMonitorCapabilities",
             @"clientToken" : @"ClientToken",
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectMonitorContactResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactArn" : @"ContactArn",
             @"contactId" : @"ContactId",
             };
}

@end

@implementation AWSConnectNotificationRecipientType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userIds" : @"UserIds",
             @"userTags" : @"UserTags",
             };
}

@end

@implementation AWSConnectNumberReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSConnectOutboundCallerConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outboundCallerIdName" : @"OutboundCallerIdName",
             @"outboundCallerIdNumberId" : @"OutboundCallerIdNumberId",
             @"outboundFlowId" : @"OutboundFlowId",
             };
}

@end

@implementation AWSConnectParticipantDetails

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             };
}

@end

@implementation AWSConnectParticipantDetailsToAdd

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"participantRole" : @"ParticipantRole",
             };
}

+ (NSValueTransformer *)participantRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AGENT"] == NSOrderedSame) {
            return @(AWSConnectParticipantRoleAgent);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER"] == NSOrderedSame) {
            return @(AWSConnectParticipantRoleCustomer);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSConnectParticipantRoleSystem);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_BOT"] == NSOrderedSame) {
            return @(AWSConnectParticipantRoleCustomBot);
        }
        return @(AWSConnectParticipantRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectParticipantRoleAgent:
                return @"AGENT";
            case AWSConnectParticipantRoleCustomer:
                return @"CUSTOMER";
            case AWSConnectParticipantRoleSystem:
                return @"SYSTEM";
            case AWSConnectParticipantRoleCustomBot:
                return @"CUSTOM_BOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectParticipantTimerConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"participantRole" : @"ParticipantRole",
             @"timerType" : @"TimerType",
             @"timerValue" : @"TimerValue",
             };
}

+ (NSValueTransformer *)participantRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CUSTOMER"] == NSOrderedSame) {
            return @(AWSConnectTimerEligibleParticipantRolesCustomer);
        }
        if ([value caseInsensitiveCompare:@"AGENT"] == NSOrderedSame) {
            return @(AWSConnectTimerEligibleParticipantRolesAgent);
        }
        return @(AWSConnectTimerEligibleParticipantRolesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectTimerEligibleParticipantRolesCustomer:
                return @"CUSTOMER";
            case AWSConnectTimerEligibleParticipantRolesAgent:
                return @"AGENT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSConnectParticipantTimerTypeIdle);
        }
        if ([value caseInsensitiveCompare:@"DISCONNECT_NONCUSTOMER"] == NSOrderedSame) {
            return @(AWSConnectParticipantTimerTypeDisconnectNoncustomer);
        }
        return @(AWSConnectParticipantTimerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectParticipantTimerTypeIdle:
                return @"IDLE";
            case AWSConnectParticipantTimerTypeDisconnectNoncustomer:
                return @"DISCONNECT_NONCUSTOMER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timerValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectParticipantTimerValue class]];
}

@end

@implementation AWSConnectParticipantTimerValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"participantTimerAction" : @"ParticipantTimerAction",
             @"participantTimerDurationInMinutes" : @"ParticipantTimerDurationInMinutes",
             };
}

+ (NSValueTransformer *)participantTimerActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Unset"] == NSOrderedSame) {
            return @(AWSConnectParticipantTimerActionUnset);
        }
        return @(AWSConnectParticipantTimerActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectParticipantTimerActionUnset:
                return @"Unset";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectParticipantTokenCredentials

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expiry" : @"Expiry",
             @"participantToken" : @"ParticipantToken",
             };
}

@end

@implementation AWSConnectPersistentChat

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rehydrationType" : @"RehydrationType",
             @"sourceContactId" : @"SourceContactId",
             };
}

+ (NSValueTransformer *)rehydrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENTIRE_PAST_SESSION"] == NSOrderedSame) {
            return @(AWSConnectRehydrationTypeEntirePastSession);
        }
        if ([value caseInsensitiveCompare:@"FROM_SEGMENT"] == NSOrderedSame) {
            return @(AWSConnectRehydrationTypeFromSegment);
        }
        return @(AWSConnectRehydrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectRehydrationTypeEntirePastSession:
                return @"ENTIRE_PAST_SESSION";
            case AWSConnectRehydrationTypeFromSegment:
                return @"FROM_SEGMENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectPhoneNumberQuickConnectConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"PhoneNumber",
             };
}

@end

@implementation AWSConnectPhoneNumberStatus

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLAIMED"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberWorkflowStatusClaimed);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberWorkflowStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberWorkflowStatusFailed);
        }
        return @(AWSConnectPhoneNumberWorkflowStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneNumberWorkflowStatusClaimed:
                return @"CLAIMED";
            case AWSConnectPhoneNumberWorkflowStatusInProgress:
                return @"IN_PROGRESS";
            case AWSConnectPhoneNumberWorkflowStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectPhoneNumberSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"phoneNumber" : @"PhoneNumber",
             @"phoneNumberCountryCode" : @"PhoneNumberCountryCode",
             @"phoneNumberType" : @"PhoneNumberType",
             };
}

+ (NSValueTransformer *)phoneNumberCountryCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAf);
        }
        if ([value caseInsensitiveCompare:@"AL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAl);
        }
        if ([value caseInsensitiveCompare:@"DZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDz);
        }
        if ([value caseInsensitiveCompare:@"AS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAs);
        }
        if ([value caseInsensitiveCompare:@"AD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAd);
        }
        if ([value caseInsensitiveCompare:@"AO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAo);
        }
        if ([value caseInsensitiveCompare:@"AI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAi);
        }
        if ([value caseInsensitiveCompare:@"AQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAq);
        }
        if ([value caseInsensitiveCompare:@"AG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAg);
        }
        if ([value caseInsensitiveCompare:@"AR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAr);
        }
        if ([value caseInsensitiveCompare:@"AM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAm);
        }
        if ([value caseInsensitiveCompare:@"AW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAw);
        }
        if ([value caseInsensitiveCompare:@"AU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAu);
        }
        if ([value caseInsensitiveCompare:@"AT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAt);
        }
        if ([value caseInsensitiveCompare:@"AZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAz);
        }
        if ([value caseInsensitiveCompare:@"BS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBs);
        }
        if ([value caseInsensitiveCompare:@"BH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBh);
        }
        if ([value caseInsensitiveCompare:@"BD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBd);
        }
        if ([value caseInsensitiveCompare:@"BB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBb);
        }
        if ([value caseInsensitiveCompare:@"BY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBy);
        }
        if ([value caseInsensitiveCompare:@"BE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBe);
        }
        if ([value caseInsensitiveCompare:@"BZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBz);
        }
        if ([value caseInsensitiveCompare:@"BJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBj);
        }
        if ([value caseInsensitiveCompare:@"BM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBm);
        }
        if ([value caseInsensitiveCompare:@"BT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBt);
        }
        if ([value caseInsensitiveCompare:@"BO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBo);
        }
        if ([value caseInsensitiveCompare:@"BA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBa);
        }
        if ([value caseInsensitiveCompare:@"BW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBw);
        }
        if ([value caseInsensitiveCompare:@"BR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBr);
        }
        if ([value caseInsensitiveCompare:@"IO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIo);
        }
        if ([value caseInsensitiveCompare:@"VG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVg);
        }
        if ([value caseInsensitiveCompare:@"BN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBn);
        }
        if ([value caseInsensitiveCompare:@"BG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBg);
        }
        if ([value caseInsensitiveCompare:@"BF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBf);
        }
        if ([value caseInsensitiveCompare:@"BI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBi);
        }
        if ([value caseInsensitiveCompare:@"KH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKh);
        }
        if ([value caseInsensitiveCompare:@"CM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCm);
        }
        if ([value caseInsensitiveCompare:@"CA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCa);
        }
        if ([value caseInsensitiveCompare:@"CV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCv);
        }
        if ([value caseInsensitiveCompare:@"KY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKy);
        }
        if ([value caseInsensitiveCompare:@"CF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCf);
        }
        if ([value caseInsensitiveCompare:@"TD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTd);
        }
        if ([value caseInsensitiveCompare:@"CL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCl);
        }
        if ([value caseInsensitiveCompare:@"CN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCn);
        }
        if ([value caseInsensitiveCompare:@"CX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCx);
        }
        if ([value caseInsensitiveCompare:@"CC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCc);
        }
        if ([value caseInsensitiveCompare:@"CO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCo);
        }
        if ([value caseInsensitiveCompare:@"KM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKm);
        }
        if ([value caseInsensitiveCompare:@"CK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCk);
        }
        if ([value caseInsensitiveCompare:@"CR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCr);
        }
        if ([value caseInsensitiveCompare:@"HR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHr);
        }
        if ([value caseInsensitiveCompare:@"CU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCu);
        }
        if ([value caseInsensitiveCompare:@"CW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCw);
        }
        if ([value caseInsensitiveCompare:@"CY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCy);
        }
        if ([value caseInsensitiveCompare:@"CZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCz);
        }
        if ([value caseInsensitiveCompare:@"CD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCd);
        }
        if ([value caseInsensitiveCompare:@"DK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDk);
        }
        if ([value caseInsensitiveCompare:@"DJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDj);
        }
        if ([value caseInsensitiveCompare:@"DM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDm);
        }
        if ([value caseInsensitiveCompare:@"DO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDo);
        }
        if ([value caseInsensitiveCompare:@"TL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTl);
        }
        if ([value caseInsensitiveCompare:@"EC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEc);
        }
        if ([value caseInsensitiveCompare:@"EG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEg);
        }
        if ([value caseInsensitiveCompare:@"SV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSv);
        }
        if ([value caseInsensitiveCompare:@"GQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGq);
        }
        if ([value caseInsensitiveCompare:@"ER"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEr);
        }
        if ([value caseInsensitiveCompare:@"EE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEe);
        }
        if ([value caseInsensitiveCompare:@"ET"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEt);
        }
        if ([value caseInsensitiveCompare:@"FK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFk);
        }
        if ([value caseInsensitiveCompare:@"FO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFo);
        }
        if ([value caseInsensitiveCompare:@"FJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFj);
        }
        if ([value caseInsensitiveCompare:@"FI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFi);
        }
        if ([value caseInsensitiveCompare:@"FR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFr);
        }
        if ([value caseInsensitiveCompare:@"PF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePf);
        }
        if ([value caseInsensitiveCompare:@"GA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGa);
        }
        if ([value caseInsensitiveCompare:@"GM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGm);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGE);
        }
        if ([value caseInsensitiveCompare:@"DE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDe);
        }
        if ([value caseInsensitiveCompare:@"GH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGh);
        }
        if ([value caseInsensitiveCompare:@"GI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGi);
        }
        if ([value caseInsensitiveCompare:@"GR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGr);
        }
        if ([value caseInsensitiveCompare:@"GL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGl);
        }
        if ([value caseInsensitiveCompare:@"GD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGd);
        }
        if ([value caseInsensitiveCompare:@"GU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGu);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGT);
        }
        if ([value caseInsensitiveCompare:@"GG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGg);
        }
        if ([value caseInsensitiveCompare:@"GN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGn);
        }
        if ([value caseInsensitiveCompare:@"GW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGw);
        }
        if ([value caseInsensitiveCompare:@"GY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGy);
        }
        if ([value caseInsensitiveCompare:@"HT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHt);
        }
        if ([value caseInsensitiveCompare:@"HN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHn);
        }
        if ([value caseInsensitiveCompare:@"HK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHk);
        }
        if ([value caseInsensitiveCompare:@"HU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHu);
        }
        if ([value caseInsensitiveCompare:@"IS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIs);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIN);
        }
        if ([value caseInsensitiveCompare:@"ID"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeId);
        }
        if ([value caseInsensitiveCompare:@"IR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIr);
        }
        if ([value caseInsensitiveCompare:@"IQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIq);
        }
        if ([value caseInsensitiveCompare:@"IE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIe);
        }
        if ([value caseInsensitiveCompare:@"IM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIm);
        }
        if ([value caseInsensitiveCompare:@"IL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIl);
        }
        if ([value caseInsensitiveCompare:@"IT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIt);
        }
        if ([value caseInsensitiveCompare:@"CI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCi);
        }
        if ([value caseInsensitiveCompare:@"JM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJm);
        }
        if ([value caseInsensitiveCompare:@"JP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJp);
        }
        if ([value caseInsensitiveCompare:@"JE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJe);
        }
        if ([value caseInsensitiveCompare:@"JO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJo);
        }
        if ([value caseInsensitiveCompare:@"KZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKz);
        }
        if ([value caseInsensitiveCompare:@"KE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKe);
        }
        if ([value caseInsensitiveCompare:@"KI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKi);
        }
        if ([value caseInsensitiveCompare:@"KW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKw);
        }
        if ([value caseInsensitiveCompare:@"KG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKg);
        }
        if ([value caseInsensitiveCompare:@"LA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLa);
        }
        if ([value caseInsensitiveCompare:@"LV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLv);
        }
        if ([value caseInsensitiveCompare:@"LB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLb);
        }
        if ([value caseInsensitiveCompare:@"LS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLs);
        }
        if ([value caseInsensitiveCompare:@"LR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLr);
        }
        if ([value caseInsensitiveCompare:@"LY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLy);
        }
        if ([value caseInsensitiveCompare:@"LI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLi);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLT);
        }
        if ([value caseInsensitiveCompare:@"LU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLu);
        }
        if ([value caseInsensitiveCompare:@"MO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMo);
        }
        if ([value caseInsensitiveCompare:@"MK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMk);
        }
        if ([value caseInsensitiveCompare:@"MG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMg);
        }
        if ([value caseInsensitiveCompare:@"MW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMw);
        }
        if ([value caseInsensitiveCompare:@"MY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMy);
        }
        if ([value caseInsensitiveCompare:@"MV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMv);
        }
        if ([value caseInsensitiveCompare:@"ML"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMl);
        }
        if ([value caseInsensitiveCompare:@"MT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMt);
        }
        if ([value caseInsensitiveCompare:@"MH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMh);
        }
        if ([value caseInsensitiveCompare:@"MR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMr);
        }
        if ([value caseInsensitiveCompare:@"MU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMu);
        }
        if ([value caseInsensitiveCompare:@"YT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeYt);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMx);
        }
        if ([value caseInsensitiveCompare:@"FM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFm);
        }
        if ([value caseInsensitiveCompare:@"MD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMd);
        }
        if ([value caseInsensitiveCompare:@"MC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMc);
        }
        if ([value caseInsensitiveCompare:@"MN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMn);
        }
        if ([value caseInsensitiveCompare:@"ME"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMe);
        }
        if ([value caseInsensitiveCompare:@"MS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMs);
        }
        if ([value caseInsensitiveCompare:@"MA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMa);
        }
        if ([value caseInsensitiveCompare:@"MZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMz);
        }
        if ([value caseInsensitiveCompare:@"MM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMm);
        }
        if ([value caseInsensitiveCompare:@"NA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNa);
        }
        if ([value caseInsensitiveCompare:@"NR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNr);
        }
        if ([value caseInsensitiveCompare:@"NP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNp);
        }
        if ([value caseInsensitiveCompare:@"NL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNl);
        }
        if ([value caseInsensitiveCompare:@"AN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAn);
        }
        if ([value caseInsensitiveCompare:@"NC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNc);
        }
        if ([value caseInsensitiveCompare:@"NZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNz);
        }
        if ([value caseInsensitiveCompare:@"NI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNi);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNE);
        }
        if ([value caseInsensitiveCompare:@"NG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNg);
        }
        if ([value caseInsensitiveCompare:@"NU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNu);
        }
        if ([value caseInsensitiveCompare:@"KP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKp);
        }
        if ([value caseInsensitiveCompare:@"MP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMp);
        }
        if ([value caseInsensitiveCompare:@"NO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNo);
        }
        if ([value caseInsensitiveCompare:@"OM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeOm);
        }
        if ([value caseInsensitiveCompare:@"PK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePk);
        }
        if ([value caseInsensitiveCompare:@"PW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePw);
        }
        if ([value caseInsensitiveCompare:@"PA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePa);
        }
        if ([value caseInsensitiveCompare:@"PG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePg);
        }
        if ([value caseInsensitiveCompare:@"PY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePy);
        }
        if ([value caseInsensitiveCompare:@"PE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePe);
        }
        if ([value caseInsensitiveCompare:@"PH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePh);
        }
        if ([value caseInsensitiveCompare:@"PN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePn);
        }
        if ([value caseInsensitiveCompare:@"PL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePl);
        }
        if ([value caseInsensitiveCompare:@"PT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePt);
        }
        if ([value caseInsensitiveCompare:@"PR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePr);
        }
        if ([value caseInsensitiveCompare:@"QA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeQa);
        }
        if ([value caseInsensitiveCompare:@"CG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCg);
        }
        if ([value caseInsensitiveCompare:@"RE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRe);
        }
        if ([value caseInsensitiveCompare:@"RO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRo);
        }
        if ([value caseInsensitiveCompare:@"RU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRu);
        }
        if ([value caseInsensitiveCompare:@"RW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRw);
        }
        if ([value caseInsensitiveCompare:@"BL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBl);
        }
        if ([value caseInsensitiveCompare:@"SH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSh);
        }
        if ([value caseInsensitiveCompare:@"KN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKn);
        }
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLc);
        }
        if ([value caseInsensitiveCompare:@"MF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMf);
        }
        if ([value caseInsensitiveCompare:@"PM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePm);
        }
        if ([value caseInsensitiveCompare:@"VC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVc);
        }
        if ([value caseInsensitiveCompare:@"WS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeWs);
        }
        if ([value caseInsensitiveCompare:@"SM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSm);
        }
        if ([value caseInsensitiveCompare:@"ST"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSt);
        }
        if ([value caseInsensitiveCompare:@"SA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSa);
        }
        if ([value caseInsensitiveCompare:@"SN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSn);
        }
        if ([value caseInsensitiveCompare:@"RS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRs);
        }
        if ([value caseInsensitiveCompare:@"SC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSc);
        }
        if ([value caseInsensitiveCompare:@"SL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSl);
        }
        if ([value caseInsensitiveCompare:@"SG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSg);
        }
        if ([value caseInsensitiveCompare:@"SX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSx);
        }
        if ([value caseInsensitiveCompare:@"SK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSk);
        }
        if ([value caseInsensitiveCompare:@"SI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSi);
        }
        if ([value caseInsensitiveCompare:@"SB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSb);
        }
        if ([value caseInsensitiveCompare:@"SO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSo);
        }
        if ([value caseInsensitiveCompare:@"ZA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZa);
        }
        if ([value caseInsensitiveCompare:@"KR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKr);
        }
        if ([value caseInsensitiveCompare:@"ES"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEs);
        }
        if ([value caseInsensitiveCompare:@"LK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLk);
        }
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSd);
        }
        if ([value caseInsensitiveCompare:@"SR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSr);
        }
        if ([value caseInsensitiveCompare:@"SJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSj);
        }
        if ([value caseInsensitiveCompare:@"SZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSz);
        }
        if ([value caseInsensitiveCompare:@"SE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSe);
        }
        if ([value caseInsensitiveCompare:@"CH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCh);
        }
        if ([value caseInsensitiveCompare:@"SY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSy);
        }
        if ([value caseInsensitiveCompare:@"TW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTw);
        }
        if ([value caseInsensitiveCompare:@"TJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTj);
        }
        if ([value caseInsensitiveCompare:@"TZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTz);
        }
        if ([value caseInsensitiveCompare:@"TH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTh);
        }
        if ([value caseInsensitiveCompare:@"TG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTg);
        }
        if ([value caseInsensitiveCompare:@"TK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTk);
        }
        if ([value caseInsensitiveCompare:@"TO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTo);
        }
        if ([value caseInsensitiveCompare:@"TT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTt);
        }
        if ([value caseInsensitiveCompare:@"TN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTn);
        }
        if ([value caseInsensitiveCompare:@"TR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTr);
        }
        if ([value caseInsensitiveCompare:@"TM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTm);
        }
        if ([value caseInsensitiveCompare:@"TC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTc);
        }
        if ([value caseInsensitiveCompare:@"TV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTv);
        }
        if ([value caseInsensitiveCompare:@"VI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVi);
        }
        if ([value caseInsensitiveCompare:@"UG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUg);
        }
        if ([value caseInsensitiveCompare:@"UA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUa);
        }
        if ([value caseInsensitiveCompare:@"AE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAe);
        }
        if ([value caseInsensitiveCompare:@"GB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGb);
        }
        if ([value caseInsensitiveCompare:@"US"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUs);
        }
        if ([value caseInsensitiveCompare:@"UY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUy);
        }
        if ([value caseInsensitiveCompare:@"UZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUz);
        }
        if ([value caseInsensitiveCompare:@"VU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVu);
        }
        if ([value caseInsensitiveCompare:@"VA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVa);
        }
        if ([value caseInsensitiveCompare:@"VE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVe);
        }
        if ([value caseInsensitiveCompare:@"VN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVn);
        }
        if ([value caseInsensitiveCompare:@"WF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeWf);
        }
        if ([value caseInsensitiveCompare:@"EH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEh);
        }
        if ([value caseInsensitiveCompare:@"YE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeYe);
        }
        if ([value caseInsensitiveCompare:@"ZM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZm);
        }
        if ([value caseInsensitiveCompare:@"ZW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZw);
        }
        return @(AWSConnectPhoneNumberCountryCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneNumberCountryCodeAf:
                return @"AF";
            case AWSConnectPhoneNumberCountryCodeAl:
                return @"AL";
            case AWSConnectPhoneNumberCountryCodeDz:
                return @"DZ";
            case AWSConnectPhoneNumberCountryCodeAs:
                return @"AS";
            case AWSConnectPhoneNumberCountryCodeAd:
                return @"AD";
            case AWSConnectPhoneNumberCountryCodeAo:
                return @"AO";
            case AWSConnectPhoneNumberCountryCodeAi:
                return @"AI";
            case AWSConnectPhoneNumberCountryCodeAq:
                return @"AQ";
            case AWSConnectPhoneNumberCountryCodeAg:
                return @"AG";
            case AWSConnectPhoneNumberCountryCodeAr:
                return @"AR";
            case AWSConnectPhoneNumberCountryCodeAm:
                return @"AM";
            case AWSConnectPhoneNumberCountryCodeAw:
                return @"AW";
            case AWSConnectPhoneNumberCountryCodeAu:
                return @"AU";
            case AWSConnectPhoneNumberCountryCodeAt:
                return @"AT";
            case AWSConnectPhoneNumberCountryCodeAz:
                return @"AZ";
            case AWSConnectPhoneNumberCountryCodeBs:
                return @"BS";
            case AWSConnectPhoneNumberCountryCodeBh:
                return @"BH";
            case AWSConnectPhoneNumberCountryCodeBd:
                return @"BD";
            case AWSConnectPhoneNumberCountryCodeBb:
                return @"BB";
            case AWSConnectPhoneNumberCountryCodeBy:
                return @"BY";
            case AWSConnectPhoneNumberCountryCodeBe:
                return @"BE";
            case AWSConnectPhoneNumberCountryCodeBz:
                return @"BZ";
            case AWSConnectPhoneNumberCountryCodeBj:
                return @"BJ";
            case AWSConnectPhoneNumberCountryCodeBm:
                return @"BM";
            case AWSConnectPhoneNumberCountryCodeBt:
                return @"BT";
            case AWSConnectPhoneNumberCountryCodeBo:
                return @"BO";
            case AWSConnectPhoneNumberCountryCodeBa:
                return @"BA";
            case AWSConnectPhoneNumberCountryCodeBw:
                return @"BW";
            case AWSConnectPhoneNumberCountryCodeBr:
                return @"BR";
            case AWSConnectPhoneNumberCountryCodeIo:
                return @"IO";
            case AWSConnectPhoneNumberCountryCodeVg:
                return @"VG";
            case AWSConnectPhoneNumberCountryCodeBn:
                return @"BN";
            case AWSConnectPhoneNumberCountryCodeBg:
                return @"BG";
            case AWSConnectPhoneNumberCountryCodeBf:
                return @"BF";
            case AWSConnectPhoneNumberCountryCodeBi:
                return @"BI";
            case AWSConnectPhoneNumberCountryCodeKh:
                return @"KH";
            case AWSConnectPhoneNumberCountryCodeCm:
                return @"CM";
            case AWSConnectPhoneNumberCountryCodeCa:
                return @"CA";
            case AWSConnectPhoneNumberCountryCodeCv:
                return @"CV";
            case AWSConnectPhoneNumberCountryCodeKy:
                return @"KY";
            case AWSConnectPhoneNumberCountryCodeCf:
                return @"CF";
            case AWSConnectPhoneNumberCountryCodeTd:
                return @"TD";
            case AWSConnectPhoneNumberCountryCodeCl:
                return @"CL";
            case AWSConnectPhoneNumberCountryCodeCn:
                return @"CN";
            case AWSConnectPhoneNumberCountryCodeCx:
                return @"CX";
            case AWSConnectPhoneNumberCountryCodeCc:
                return @"CC";
            case AWSConnectPhoneNumberCountryCodeCo:
                return @"CO";
            case AWSConnectPhoneNumberCountryCodeKm:
                return @"KM";
            case AWSConnectPhoneNumberCountryCodeCk:
                return @"CK";
            case AWSConnectPhoneNumberCountryCodeCr:
                return @"CR";
            case AWSConnectPhoneNumberCountryCodeHr:
                return @"HR";
            case AWSConnectPhoneNumberCountryCodeCu:
                return @"CU";
            case AWSConnectPhoneNumberCountryCodeCw:
                return @"CW";
            case AWSConnectPhoneNumberCountryCodeCy:
                return @"CY";
            case AWSConnectPhoneNumberCountryCodeCz:
                return @"CZ";
            case AWSConnectPhoneNumberCountryCodeCd:
                return @"CD";
            case AWSConnectPhoneNumberCountryCodeDk:
                return @"DK";
            case AWSConnectPhoneNumberCountryCodeDj:
                return @"DJ";
            case AWSConnectPhoneNumberCountryCodeDm:
                return @"DM";
            case AWSConnectPhoneNumberCountryCodeDo:
                return @"DO";
            case AWSConnectPhoneNumberCountryCodeTl:
                return @"TL";
            case AWSConnectPhoneNumberCountryCodeEc:
                return @"EC";
            case AWSConnectPhoneNumberCountryCodeEg:
                return @"EG";
            case AWSConnectPhoneNumberCountryCodeSv:
                return @"SV";
            case AWSConnectPhoneNumberCountryCodeGq:
                return @"GQ";
            case AWSConnectPhoneNumberCountryCodeEr:
                return @"ER";
            case AWSConnectPhoneNumberCountryCodeEe:
                return @"EE";
            case AWSConnectPhoneNumberCountryCodeEt:
                return @"ET";
            case AWSConnectPhoneNumberCountryCodeFk:
                return @"FK";
            case AWSConnectPhoneNumberCountryCodeFo:
                return @"FO";
            case AWSConnectPhoneNumberCountryCodeFj:
                return @"FJ";
            case AWSConnectPhoneNumberCountryCodeFi:
                return @"FI";
            case AWSConnectPhoneNumberCountryCodeFr:
                return @"FR";
            case AWSConnectPhoneNumberCountryCodePf:
                return @"PF";
            case AWSConnectPhoneNumberCountryCodeGa:
                return @"GA";
            case AWSConnectPhoneNumberCountryCodeGm:
                return @"GM";
            case AWSConnectPhoneNumberCountryCodeGE:
                return @"GE";
            case AWSConnectPhoneNumberCountryCodeDe:
                return @"DE";
            case AWSConnectPhoneNumberCountryCodeGh:
                return @"GH";
            case AWSConnectPhoneNumberCountryCodeGi:
                return @"GI";
            case AWSConnectPhoneNumberCountryCodeGr:
                return @"GR";
            case AWSConnectPhoneNumberCountryCodeGl:
                return @"GL";
            case AWSConnectPhoneNumberCountryCodeGd:
                return @"GD";
            case AWSConnectPhoneNumberCountryCodeGu:
                return @"GU";
            case AWSConnectPhoneNumberCountryCodeGT:
                return @"GT";
            case AWSConnectPhoneNumberCountryCodeGg:
                return @"GG";
            case AWSConnectPhoneNumberCountryCodeGn:
                return @"GN";
            case AWSConnectPhoneNumberCountryCodeGw:
                return @"GW";
            case AWSConnectPhoneNumberCountryCodeGy:
                return @"GY";
            case AWSConnectPhoneNumberCountryCodeHt:
                return @"HT";
            case AWSConnectPhoneNumberCountryCodeHn:
                return @"HN";
            case AWSConnectPhoneNumberCountryCodeHk:
                return @"HK";
            case AWSConnectPhoneNumberCountryCodeHu:
                return @"HU";
            case AWSConnectPhoneNumberCountryCodeIs:
                return @"IS";
            case AWSConnectPhoneNumberCountryCodeIN:
                return @"IN";
            case AWSConnectPhoneNumberCountryCodeId:
                return @"ID";
            case AWSConnectPhoneNumberCountryCodeIr:
                return @"IR";
            case AWSConnectPhoneNumberCountryCodeIq:
                return @"IQ";
            case AWSConnectPhoneNumberCountryCodeIe:
                return @"IE";
            case AWSConnectPhoneNumberCountryCodeIm:
                return @"IM";
            case AWSConnectPhoneNumberCountryCodeIl:
                return @"IL";
            case AWSConnectPhoneNumberCountryCodeIt:
                return @"IT";
            case AWSConnectPhoneNumberCountryCodeCi:
                return @"CI";
            case AWSConnectPhoneNumberCountryCodeJm:
                return @"JM";
            case AWSConnectPhoneNumberCountryCodeJp:
                return @"JP";
            case AWSConnectPhoneNumberCountryCodeJe:
                return @"JE";
            case AWSConnectPhoneNumberCountryCodeJo:
                return @"JO";
            case AWSConnectPhoneNumberCountryCodeKz:
                return @"KZ";
            case AWSConnectPhoneNumberCountryCodeKe:
                return @"KE";
            case AWSConnectPhoneNumberCountryCodeKi:
                return @"KI";
            case AWSConnectPhoneNumberCountryCodeKw:
                return @"KW";
            case AWSConnectPhoneNumberCountryCodeKg:
                return @"KG";
            case AWSConnectPhoneNumberCountryCodeLa:
                return @"LA";
            case AWSConnectPhoneNumberCountryCodeLv:
                return @"LV";
            case AWSConnectPhoneNumberCountryCodeLb:
                return @"LB";
            case AWSConnectPhoneNumberCountryCodeLs:
                return @"LS";
            case AWSConnectPhoneNumberCountryCodeLr:
                return @"LR";
            case AWSConnectPhoneNumberCountryCodeLy:
                return @"LY";
            case AWSConnectPhoneNumberCountryCodeLi:
                return @"LI";
            case AWSConnectPhoneNumberCountryCodeLT:
                return @"LT";
            case AWSConnectPhoneNumberCountryCodeLu:
                return @"LU";
            case AWSConnectPhoneNumberCountryCodeMo:
                return @"MO";
            case AWSConnectPhoneNumberCountryCodeMk:
                return @"MK";
            case AWSConnectPhoneNumberCountryCodeMg:
                return @"MG";
            case AWSConnectPhoneNumberCountryCodeMw:
                return @"MW";
            case AWSConnectPhoneNumberCountryCodeMy:
                return @"MY";
            case AWSConnectPhoneNumberCountryCodeMv:
                return @"MV";
            case AWSConnectPhoneNumberCountryCodeMl:
                return @"ML";
            case AWSConnectPhoneNumberCountryCodeMt:
                return @"MT";
            case AWSConnectPhoneNumberCountryCodeMh:
                return @"MH";
            case AWSConnectPhoneNumberCountryCodeMr:
                return @"MR";
            case AWSConnectPhoneNumberCountryCodeMu:
                return @"MU";
            case AWSConnectPhoneNumberCountryCodeYt:
                return @"YT";
            case AWSConnectPhoneNumberCountryCodeMx:
                return @"MX";
            case AWSConnectPhoneNumberCountryCodeFm:
                return @"FM";
            case AWSConnectPhoneNumberCountryCodeMd:
                return @"MD";
            case AWSConnectPhoneNumberCountryCodeMc:
                return @"MC";
            case AWSConnectPhoneNumberCountryCodeMn:
                return @"MN";
            case AWSConnectPhoneNumberCountryCodeMe:
                return @"ME";
            case AWSConnectPhoneNumberCountryCodeMs:
                return @"MS";
            case AWSConnectPhoneNumberCountryCodeMa:
                return @"MA";
            case AWSConnectPhoneNumberCountryCodeMz:
                return @"MZ";
            case AWSConnectPhoneNumberCountryCodeMm:
                return @"MM";
            case AWSConnectPhoneNumberCountryCodeNa:
                return @"NA";
            case AWSConnectPhoneNumberCountryCodeNr:
                return @"NR";
            case AWSConnectPhoneNumberCountryCodeNp:
                return @"NP";
            case AWSConnectPhoneNumberCountryCodeNl:
                return @"NL";
            case AWSConnectPhoneNumberCountryCodeAn:
                return @"AN";
            case AWSConnectPhoneNumberCountryCodeNc:
                return @"NC";
            case AWSConnectPhoneNumberCountryCodeNz:
                return @"NZ";
            case AWSConnectPhoneNumberCountryCodeNi:
                return @"NI";
            case AWSConnectPhoneNumberCountryCodeNE:
                return @"NE";
            case AWSConnectPhoneNumberCountryCodeNg:
                return @"NG";
            case AWSConnectPhoneNumberCountryCodeNu:
                return @"NU";
            case AWSConnectPhoneNumberCountryCodeKp:
                return @"KP";
            case AWSConnectPhoneNumberCountryCodeMp:
                return @"MP";
            case AWSConnectPhoneNumberCountryCodeNo:
                return @"NO";
            case AWSConnectPhoneNumberCountryCodeOm:
                return @"OM";
            case AWSConnectPhoneNumberCountryCodePk:
                return @"PK";
            case AWSConnectPhoneNumberCountryCodePw:
                return @"PW";
            case AWSConnectPhoneNumberCountryCodePa:
                return @"PA";
            case AWSConnectPhoneNumberCountryCodePg:
                return @"PG";
            case AWSConnectPhoneNumberCountryCodePy:
                return @"PY";
            case AWSConnectPhoneNumberCountryCodePe:
                return @"PE";
            case AWSConnectPhoneNumberCountryCodePh:
                return @"PH";
            case AWSConnectPhoneNumberCountryCodePn:
                return @"PN";
            case AWSConnectPhoneNumberCountryCodePl:
                return @"PL";
            case AWSConnectPhoneNumberCountryCodePt:
                return @"PT";
            case AWSConnectPhoneNumberCountryCodePr:
                return @"PR";
            case AWSConnectPhoneNumberCountryCodeQa:
                return @"QA";
            case AWSConnectPhoneNumberCountryCodeCg:
                return @"CG";
            case AWSConnectPhoneNumberCountryCodeRe:
                return @"RE";
            case AWSConnectPhoneNumberCountryCodeRo:
                return @"RO";
            case AWSConnectPhoneNumberCountryCodeRu:
                return @"RU";
            case AWSConnectPhoneNumberCountryCodeRw:
                return @"RW";
            case AWSConnectPhoneNumberCountryCodeBl:
                return @"BL";
            case AWSConnectPhoneNumberCountryCodeSh:
                return @"SH";
            case AWSConnectPhoneNumberCountryCodeKn:
                return @"KN";
            case AWSConnectPhoneNumberCountryCodeLc:
                return @"LC";
            case AWSConnectPhoneNumberCountryCodeMf:
                return @"MF";
            case AWSConnectPhoneNumberCountryCodePm:
                return @"PM";
            case AWSConnectPhoneNumberCountryCodeVc:
                return @"VC";
            case AWSConnectPhoneNumberCountryCodeWs:
                return @"WS";
            case AWSConnectPhoneNumberCountryCodeSm:
                return @"SM";
            case AWSConnectPhoneNumberCountryCodeSt:
                return @"ST";
            case AWSConnectPhoneNumberCountryCodeSa:
                return @"SA";
            case AWSConnectPhoneNumberCountryCodeSn:
                return @"SN";
            case AWSConnectPhoneNumberCountryCodeRs:
                return @"RS";
            case AWSConnectPhoneNumberCountryCodeSc:
                return @"SC";
            case AWSConnectPhoneNumberCountryCodeSl:
                return @"SL";
            case AWSConnectPhoneNumberCountryCodeSg:
                return @"SG";
            case AWSConnectPhoneNumberCountryCodeSx:
                return @"SX";
            case AWSConnectPhoneNumberCountryCodeSk:
                return @"SK";
            case AWSConnectPhoneNumberCountryCodeSi:
                return @"SI";
            case AWSConnectPhoneNumberCountryCodeSb:
                return @"SB";
            case AWSConnectPhoneNumberCountryCodeSo:
                return @"SO";
            case AWSConnectPhoneNumberCountryCodeZa:
                return @"ZA";
            case AWSConnectPhoneNumberCountryCodeKr:
                return @"KR";
            case AWSConnectPhoneNumberCountryCodeEs:
                return @"ES";
            case AWSConnectPhoneNumberCountryCodeLk:
                return @"LK";
            case AWSConnectPhoneNumberCountryCodeSd:
                return @"SD";
            case AWSConnectPhoneNumberCountryCodeSr:
                return @"SR";
            case AWSConnectPhoneNumberCountryCodeSj:
                return @"SJ";
            case AWSConnectPhoneNumberCountryCodeSz:
                return @"SZ";
            case AWSConnectPhoneNumberCountryCodeSe:
                return @"SE";
            case AWSConnectPhoneNumberCountryCodeCh:
                return @"CH";
            case AWSConnectPhoneNumberCountryCodeSy:
                return @"SY";
            case AWSConnectPhoneNumberCountryCodeTw:
                return @"TW";
            case AWSConnectPhoneNumberCountryCodeTj:
                return @"TJ";
            case AWSConnectPhoneNumberCountryCodeTz:
                return @"TZ";
            case AWSConnectPhoneNumberCountryCodeTh:
                return @"TH";
            case AWSConnectPhoneNumberCountryCodeTg:
                return @"TG";
            case AWSConnectPhoneNumberCountryCodeTk:
                return @"TK";
            case AWSConnectPhoneNumberCountryCodeTo:
                return @"TO";
            case AWSConnectPhoneNumberCountryCodeTt:
                return @"TT";
            case AWSConnectPhoneNumberCountryCodeTn:
                return @"TN";
            case AWSConnectPhoneNumberCountryCodeTr:
                return @"TR";
            case AWSConnectPhoneNumberCountryCodeTm:
                return @"TM";
            case AWSConnectPhoneNumberCountryCodeTc:
                return @"TC";
            case AWSConnectPhoneNumberCountryCodeTv:
                return @"TV";
            case AWSConnectPhoneNumberCountryCodeVi:
                return @"VI";
            case AWSConnectPhoneNumberCountryCodeUg:
                return @"UG";
            case AWSConnectPhoneNumberCountryCodeUa:
                return @"UA";
            case AWSConnectPhoneNumberCountryCodeAe:
                return @"AE";
            case AWSConnectPhoneNumberCountryCodeGb:
                return @"GB";
            case AWSConnectPhoneNumberCountryCodeUs:
                return @"US";
            case AWSConnectPhoneNumberCountryCodeUy:
                return @"UY";
            case AWSConnectPhoneNumberCountryCodeUz:
                return @"UZ";
            case AWSConnectPhoneNumberCountryCodeVu:
                return @"VU";
            case AWSConnectPhoneNumberCountryCodeVa:
                return @"VA";
            case AWSConnectPhoneNumberCountryCodeVe:
                return @"VE";
            case AWSConnectPhoneNumberCountryCodeVn:
                return @"VN";
            case AWSConnectPhoneNumberCountryCodeWf:
                return @"WF";
            case AWSConnectPhoneNumberCountryCodeEh:
                return @"EH";
            case AWSConnectPhoneNumberCountryCodeYe:
                return @"YE";
            case AWSConnectPhoneNumberCountryCodeZm:
                return @"ZM";
            case AWSConnectPhoneNumberCountryCodeZw:
                return @"ZW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)phoneNumberTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TOLL_FREE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberTypeTollFree);
        }
        if ([value caseInsensitiveCompare:@"DID"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberTypeDid);
        }
        return @(AWSConnectPhoneNumberTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneNumberTypeTollFree:
                return @"TOLL_FREE";
            case AWSConnectPhoneNumberTypeDid:
                return @"DID";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectProblemDetail

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"message",
             };
}

@end

@implementation AWSConnectPromptSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectPropertyValidationExceptionProperty

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"propertyPath" : @"PropertyPath",
             @"reason" : @"Reason",
             };
}

+ (NSValueTransformer *)reasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INVALID_FORMAT"] == NSOrderedSame) {
            return @(AWSConnectPropertyValidationExceptionReasonInvalidFormat);
        }
        if ([value caseInsensitiveCompare:@"UNIQUE_CONSTRAINT_VIOLATED"] == NSOrderedSame) {
            return @(AWSConnectPropertyValidationExceptionReasonUniqueConstraintViolated);
        }
        if ([value caseInsensitiveCompare:@"REFERENCED_RESOURCE_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSConnectPropertyValidationExceptionReasonReferencedResourceNotFound);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_NAME_ALREADY_EXISTS"] == NSOrderedSame) {
            return @(AWSConnectPropertyValidationExceptionReasonResourceNameAlreadyExists);
        }
        if ([value caseInsensitiveCompare:@"REQUIRED_PROPERTY_MISSING"] == NSOrderedSame) {
            return @(AWSConnectPropertyValidationExceptionReasonRequiredPropertyMissing);
        }
        if ([value caseInsensitiveCompare:@"NOT_SUPPORTED"] == NSOrderedSame) {
            return @(AWSConnectPropertyValidationExceptionReasonNotSupported);
        }
        return @(AWSConnectPropertyValidationExceptionReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPropertyValidationExceptionReasonInvalidFormat:
                return @"INVALID_FORMAT";
            case AWSConnectPropertyValidationExceptionReasonUniqueConstraintViolated:
                return @"UNIQUE_CONSTRAINT_VIOLATED";
            case AWSConnectPropertyValidationExceptionReasonReferencedResourceNotFound:
                return @"REFERENCED_RESOURCE_NOT_FOUND";
            case AWSConnectPropertyValidationExceptionReasonResourceNameAlreadyExists:
                return @"RESOURCE_NAME_ALREADY_EXISTS";
            case AWSConnectPropertyValidationExceptionReasonRequiredPropertyMissing:
                return @"REQUIRED_PROPERTY_MISSING";
            case AWSConnectPropertyValidationExceptionReasonNotSupported:
                return @"NOT_SUPPORTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectPutUserStatusRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"agentStatusId" : @"AgentStatusId",
             @"instanceId" : @"InstanceId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectPutUserStatusResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectQueue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"hoursOfOperationId" : @"HoursOfOperationId",
             @"maxContacts" : @"MaxContacts",
             @"name" : @"Name",
             @"outboundCallerConfig" : @"OutboundCallerConfig",
             @"queueArn" : @"QueueArn",
             @"queueId" : @"QueueId",
             @"status" : @"Status",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)outboundCallerConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectOutboundCallerConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSConnectQueueStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSConnectQueueStatusDisabled);
        }
        return @(AWSConnectQueueStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectQueueStatusEnabled:
                return @"ENABLED";
            case AWSConnectQueueStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectQueueInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enqueueTimestamp" : @"EnqueueTimestamp",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)enqueueTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSConnectQueueQuickConnectConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowId" : @"ContactFlowId",
             @"queueId" : @"QueueId",
             };
}

@end

@implementation AWSConnectQueueReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectQueueSearchCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"andConditions" : @"AndConditions",
             @"orConditions" : @"OrConditions",
             @"queueTypeCondition" : @"QueueTypeCondition",
             @"stringCondition" : @"StringCondition",
             };
}

+ (NSValueTransformer *)andConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectQueueSearchCriteria class]];
}

+ (NSValueTransformer *)orConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectQueueSearchCriteria class]];
}

+ (NSValueTransformer *)queueTypeConditionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSConnectSearchableQueueTypeStandard);
        }
        return @(AWSConnectSearchableQueueTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectSearchableQueueTypeStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stringConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectStringCondition class]];
}

@end

@implementation AWSConnectQueueSearchFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagFilter" : @"TagFilter",
             };
}

+ (NSValueTransformer *)tagFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectControlPlaneTagFilter class]];
}

@end

@implementation AWSConnectQueueSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"queueType" : @"QueueType",
             };
}

+ (NSValueTransformer *)queueTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSConnectQueueTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"AGENT"] == NSOrderedSame) {
            return @(AWSConnectQueueTypeAgent);
        }
        return @(AWSConnectQueueTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectQueueTypeStandard:
                return @"STANDARD";
            case AWSConnectQueueTypeAgent:
                return @"AGENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectQuickConnect

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"quickConnectARN" : @"QuickConnectARN",
             @"quickConnectConfig" : @"QuickConnectConfig",
             @"quickConnectId" : @"QuickConnectId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)quickConnectConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQuickConnectConfig class]];
}

@end

@implementation AWSConnectQuickConnectConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneConfig" : @"PhoneConfig",
             @"queueConfig" : @"QueueConfig",
             @"quickConnectType" : @"QuickConnectType",
             @"userConfig" : @"UserConfig",
             };
}

+ (NSValueTransformer *)phoneConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectPhoneNumberQuickConnectConfig class]];
}

+ (NSValueTransformer *)queueConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQueueQuickConnectConfig class]];
}

+ (NSValueTransformer *)quickConnectTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSConnectQuickConnectTypeUser);
        }
        if ([value caseInsensitiveCompare:@"QUEUE"] == NSOrderedSame) {
            return @(AWSConnectQuickConnectTypeQueue);
        }
        if ([value caseInsensitiveCompare:@"PHONE_NUMBER"] == NSOrderedSame) {
            return @(AWSConnectQuickConnectTypePhoneNumber);
        }
        return @(AWSConnectQuickConnectTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectQuickConnectTypeUser:
                return @"USER";
            case AWSConnectQuickConnectTypeQueue:
                return @"QUEUE";
            case AWSConnectQuickConnectTypePhoneNumber:
                return @"PHONE_NUMBER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserQuickConnectConfig class]];
}

@end

@implementation AWSConnectQuickConnectSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"quickConnectType" : @"QuickConnectType",
             };
}

+ (NSValueTransformer *)quickConnectTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSConnectQuickConnectTypeUser);
        }
        if ([value caseInsensitiveCompare:@"QUEUE"] == NSOrderedSame) {
            return @(AWSConnectQuickConnectTypeQueue);
        }
        if ([value caseInsensitiveCompare:@"PHONE_NUMBER"] == NSOrderedSame) {
            return @(AWSConnectQuickConnectTypePhoneNumber);
        }
        return @(AWSConnectQuickConnectTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectQuickConnectTypeUser:
                return @"USER";
            case AWSConnectQuickConnectTypeQueue:
                return @"QUEUE";
            case AWSConnectQuickConnectTypePhoneNumber:
                return @"PHONE_NUMBER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectReadOnlyFieldInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)identifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateFieldIdentifier class]];
}

@end

@implementation AWSConnectReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSConnectReferenceTypeUrl);
        }
        if ([value caseInsensitiveCompare:@"ATTACHMENT"] == NSOrderedSame) {
            return @(AWSConnectReferenceTypeAttachment);
        }
        if ([value caseInsensitiveCompare:@"NUMBER"] == NSOrderedSame) {
            return @(AWSConnectReferenceTypeNumber);
        }
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSConnectReferenceTypeString);
        }
        if ([value caseInsensitiveCompare:@"DATE"] == NSOrderedSame) {
            return @(AWSConnectReferenceTypeDate);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSConnectReferenceTypeEmail);
        }
        return @(AWSConnectReferenceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectReferenceTypeUrl:
                return @"URL";
            case AWSConnectReferenceTypeAttachment:
                return @"ATTACHMENT";
            case AWSConnectReferenceTypeNumber:
                return @"NUMBER";
            case AWSConnectReferenceTypeString:
                return @"STRING";
            case AWSConnectReferenceTypeDate:
                return @"DATE";
            case AWSConnectReferenceTypeEmail:
                return @"EMAIL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectReferenceSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachment" : @"Attachment",
             @"date" : @"Date",
             @"email" : @"Email",
             @"number" : @"Number",
             @"string" : @"String",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)attachmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectAttachmentReference class]];
}

+ (NSValueTransformer *)dateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectDateReference class]];
}

+ (NSValueTransformer *)emailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectEmailReference class]];
}

+ (NSValueTransformer *)numberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectNumberReference class]];
}

+ (NSValueTransformer *)stringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectStringReference class]];
}

+ (NSValueTransformer *)urlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUrlReference class]];
}

@end

@implementation AWSConnectReleasePhoneNumberRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"phoneNumberId" : @"PhoneNumberId",
             };
}

@end

@implementation AWSConnectReplicateInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"instanceId" : @"InstanceId",
             @"replicaAlias" : @"ReplicaAlias",
             @"replicaRegion" : @"ReplicaRegion",
             };
}

@end

@implementation AWSConnectReplicateInstanceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectRequiredFieldInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)identifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateFieldIdentifier class]];
}

@end

@implementation AWSConnectResumeContactRecordingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"initialContactId" : @"InitialContactId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectResumeContactRecordingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectRoutingProfile

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultOutboundQueueId" : @"DefaultOutboundQueueId",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"mediaConcurrencies" : @"MediaConcurrencies",
             @"name" : @"Name",
             @"numberOfAssociatedQueues" : @"NumberOfAssociatedQueues",
             @"numberOfAssociatedUsers" : @"NumberOfAssociatedUsers",
             @"routingProfileArn" : @"RoutingProfileArn",
             @"routingProfileId" : @"RoutingProfileId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)mediaConcurrenciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectMediaConcurrency class]];
}

@end

@implementation AWSConnectRoutingProfileQueueConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delay" : @"Delay",
             @"priority" : @"Priority",
             @"queueReference" : @"QueueReference",
             };
}

+ (NSValueTransformer *)queueReferenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectRoutingProfileQueueReference class]];
}

@end

@implementation AWSConnectRoutingProfileQueueConfigSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             @"delay" : @"Delay",
             @"priority" : @"Priority",
             @"queueArn" : @"QueueArn",
             @"queueId" : @"QueueId",
             @"queueName" : @"QueueName",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSConnectChannelVoice);
        }
        if ([value caseInsensitiveCompare:@"CHAT"] == NSOrderedSame) {
            return @(AWSConnectChannelChat);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSConnectChannelTask);
        }
        return @(AWSConnectChannelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectChannelVoice:
                return @"VOICE";
            case AWSConnectChannelChat:
                return @"CHAT";
            case AWSConnectChannelTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectRoutingProfileQueueReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             @"queueId" : @"QueueId",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSConnectChannelVoice);
        }
        if ([value caseInsensitiveCompare:@"CHAT"] == NSOrderedSame) {
            return @(AWSConnectChannelChat);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSConnectChannelTask);
        }
        return @(AWSConnectChannelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectChannelVoice:
                return @"VOICE";
            case AWSConnectChannelChat:
                return @"CHAT";
            case AWSConnectChannelTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectRoutingProfileReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectRoutingProfileSearchCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"andConditions" : @"AndConditions",
             @"orConditions" : @"OrConditions",
             @"stringCondition" : @"StringCondition",
             };
}

+ (NSValueTransformer *)andConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRoutingProfileSearchCriteria class]];
}

+ (NSValueTransformer *)orConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRoutingProfileSearchCriteria class]];
}

+ (NSValueTransformer *)stringConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectStringCondition class]];
}

@end

@implementation AWSConnectRoutingProfileSearchFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagFilter" : @"TagFilter",
             };
}

+ (NSValueTransformer *)tagFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectControlPlaneTagFilter class]];
}

@end

@implementation AWSConnectRoutingProfileSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"createdTime" : @"CreatedTime",
             @"function" : @"Function",
             @"lastUpdatedBy" : @"LastUpdatedBy",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"name" : @"Name",
             @"publishStatus" : @"PublishStatus",
             @"ruleArn" : @"RuleArn",
             @"ruleId" : @"RuleId",
             @"tags" : @"Tags",
             @"triggerEventSource" : @"TriggerEventSource",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRuleAction class]];
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)publishStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSConnectRulePublishStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"PUBLISHED"] == NSOrderedSame) {
            return @(AWSConnectRulePublishStatusPublished);
        }
        return @(AWSConnectRulePublishStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectRulePublishStatusDraft:
                return @"DRAFT";
            case AWSConnectRulePublishStatusPublished:
                return @"PUBLISHED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)triggerEventSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectRuleTriggerEventSource class]];
}

@end

@implementation AWSConnectRuleAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionType" : @"ActionType",
             @"assignContactCategoryAction" : @"AssignContactCategoryAction",
             @"eventBridgeAction" : @"EventBridgeAction",
             @"sendNotificationAction" : @"SendNotificationAction",
             @"taskAction" : @"TaskAction",
             };
}

+ (NSValueTransformer *)actionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_TASK"] == NSOrderedSame) {
            return @(AWSConnectActionTypeCreateTask);
        }
        if ([value caseInsensitiveCompare:@"ASSIGN_CONTACT_CATEGORY"] == NSOrderedSame) {
            return @(AWSConnectActionTypeAssignContactCategory);
        }
        if ([value caseInsensitiveCompare:@"GENERATE_EVENTBRIDGE_EVENT"] == NSOrderedSame) {
            return @(AWSConnectActionTypeGenerateEventbridgeEvent);
        }
        if ([value caseInsensitiveCompare:@"SEND_NOTIFICATION"] == NSOrderedSame) {
            return @(AWSConnectActionTypeSendNotification);
        }
        return @(AWSConnectActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectActionTypeCreateTask:
                return @"CREATE_TASK";
            case AWSConnectActionTypeAssignContactCategory:
                return @"ASSIGN_CONTACT_CATEGORY";
            case AWSConnectActionTypeGenerateEventbridgeEvent:
                return @"GENERATE_EVENTBRIDGE_EVENT";
            case AWSConnectActionTypeSendNotification:
                return @"SEND_NOTIFICATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)assignContactCategoryActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectAssignContactCategoryActionDefinition class]];
}

+ (NSValueTransformer *)eventBridgeActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectEventBridgeActionDefinition class]];
}

+ (NSValueTransformer *)sendNotificationActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectSendNotificationActionDefinition class]];
}

+ (NSValueTransformer *)taskActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskActionDefinition class]];
}

@end

@implementation AWSConnectRuleSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionSummaries" : @"ActionSummaries",
             @"createdTime" : @"CreatedTime",
             @"eventSourceName" : @"EventSourceName",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"name" : @"Name",
             @"publishStatus" : @"PublishStatus",
             @"ruleArn" : @"RuleArn",
             @"ruleId" : @"RuleId",
             };
}

+ (NSValueTransformer *)actionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectActionSummary class]];
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)eventSourceNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OnPostCallAnalysisAvailable"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnPostCallAnalysisAvailable);
        }
        if ([value caseInsensitiveCompare:@"OnRealTimeCallAnalysisAvailable"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnRealTimeCallAnalysisAvailable);
        }
        if ([value caseInsensitiveCompare:@"OnPostChatAnalysisAvailable"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnPostChatAnalysisAvailable);
        }
        if ([value caseInsensitiveCompare:@"OnZendeskTicketCreate"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnZendeskTicketCreate);
        }
        if ([value caseInsensitiveCompare:@"OnZendeskTicketStatusUpdate"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnZendeskTicketStatusUpdate);
        }
        if ([value caseInsensitiveCompare:@"OnSalesforceCaseCreate"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnSalesforceCaseCreate);
        }
        return @(AWSConnectEventSourceNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectEventSourceNameOnPostCallAnalysisAvailable:
                return @"OnPostCallAnalysisAvailable";
            case AWSConnectEventSourceNameOnRealTimeCallAnalysisAvailable:
                return @"OnRealTimeCallAnalysisAvailable";
            case AWSConnectEventSourceNameOnPostChatAnalysisAvailable:
                return @"OnPostChatAnalysisAvailable";
            case AWSConnectEventSourceNameOnZendeskTicketCreate:
                return @"OnZendeskTicketCreate";
            case AWSConnectEventSourceNameOnZendeskTicketStatusUpdate:
                return @"OnZendeskTicketStatusUpdate";
            case AWSConnectEventSourceNameOnSalesforceCaseCreate:
                return @"OnSalesforceCaseCreate";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)publishStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSConnectRulePublishStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"PUBLISHED"] == NSOrderedSame) {
            return @(AWSConnectRulePublishStatusPublished);
        }
        return @(AWSConnectRulePublishStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectRulePublishStatusDraft:
                return @"DRAFT";
            case AWSConnectRulePublishStatusPublished:
                return @"PUBLISHED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectRuleTriggerEventSource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSourceName" : @"EventSourceName",
             @"integrationAssociationId" : @"IntegrationAssociationId",
             };
}

+ (NSValueTransformer *)eventSourceNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OnPostCallAnalysisAvailable"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnPostCallAnalysisAvailable);
        }
        if ([value caseInsensitiveCompare:@"OnRealTimeCallAnalysisAvailable"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnRealTimeCallAnalysisAvailable);
        }
        if ([value caseInsensitiveCompare:@"OnPostChatAnalysisAvailable"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnPostChatAnalysisAvailable);
        }
        if ([value caseInsensitiveCompare:@"OnZendeskTicketCreate"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnZendeskTicketCreate);
        }
        if ([value caseInsensitiveCompare:@"OnZendeskTicketStatusUpdate"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnZendeskTicketStatusUpdate);
        }
        if ([value caseInsensitiveCompare:@"OnSalesforceCaseCreate"] == NSOrderedSame) {
            return @(AWSConnectEventSourceNameOnSalesforceCaseCreate);
        }
        return @(AWSConnectEventSourceNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectEventSourceNameOnPostCallAnalysisAvailable:
                return @"OnPostCallAnalysisAvailable";
            case AWSConnectEventSourceNameOnRealTimeCallAnalysisAvailable:
                return @"OnRealTimeCallAnalysisAvailable";
            case AWSConnectEventSourceNameOnPostChatAnalysisAvailable:
                return @"OnPostChatAnalysisAvailable";
            case AWSConnectEventSourceNameOnZendeskTicketCreate:
                return @"OnZendeskTicketCreate";
            case AWSConnectEventSourceNameOnZendeskTicketStatusUpdate:
                return @"OnZendeskTicketStatusUpdate";
            case AWSConnectEventSourceNameOnSalesforceCaseCreate:
                return @"OnSalesforceCaseCreate";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectS3Config

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"BucketName",
             @"bucketPrefix" : @"BucketPrefix",
             @"encryptionConfig" : @"EncryptionConfig",
             };
}

+ (NSValueTransformer *)encryptionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectEncryptionConfig class]];
}

@end

@implementation AWSConnectSearchAvailablePhoneNumbersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"phoneNumberCountryCode" : @"PhoneNumberCountryCode",
             @"phoneNumberPrefix" : @"PhoneNumberPrefix",
             @"phoneNumberType" : @"PhoneNumberType",
             @"targetArn" : @"TargetArn",
             };
}

+ (NSValueTransformer *)phoneNumberCountryCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAf);
        }
        if ([value caseInsensitiveCompare:@"AL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAl);
        }
        if ([value caseInsensitiveCompare:@"DZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDz);
        }
        if ([value caseInsensitiveCompare:@"AS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAs);
        }
        if ([value caseInsensitiveCompare:@"AD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAd);
        }
        if ([value caseInsensitiveCompare:@"AO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAo);
        }
        if ([value caseInsensitiveCompare:@"AI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAi);
        }
        if ([value caseInsensitiveCompare:@"AQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAq);
        }
        if ([value caseInsensitiveCompare:@"AG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAg);
        }
        if ([value caseInsensitiveCompare:@"AR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAr);
        }
        if ([value caseInsensitiveCompare:@"AM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAm);
        }
        if ([value caseInsensitiveCompare:@"AW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAw);
        }
        if ([value caseInsensitiveCompare:@"AU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAu);
        }
        if ([value caseInsensitiveCompare:@"AT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAt);
        }
        if ([value caseInsensitiveCompare:@"AZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAz);
        }
        if ([value caseInsensitiveCompare:@"BS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBs);
        }
        if ([value caseInsensitiveCompare:@"BH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBh);
        }
        if ([value caseInsensitiveCompare:@"BD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBd);
        }
        if ([value caseInsensitiveCompare:@"BB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBb);
        }
        if ([value caseInsensitiveCompare:@"BY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBy);
        }
        if ([value caseInsensitiveCompare:@"BE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBe);
        }
        if ([value caseInsensitiveCompare:@"BZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBz);
        }
        if ([value caseInsensitiveCompare:@"BJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBj);
        }
        if ([value caseInsensitiveCompare:@"BM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBm);
        }
        if ([value caseInsensitiveCompare:@"BT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBt);
        }
        if ([value caseInsensitiveCompare:@"BO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBo);
        }
        if ([value caseInsensitiveCompare:@"BA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBa);
        }
        if ([value caseInsensitiveCompare:@"BW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBw);
        }
        if ([value caseInsensitiveCompare:@"BR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBr);
        }
        if ([value caseInsensitiveCompare:@"IO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIo);
        }
        if ([value caseInsensitiveCompare:@"VG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVg);
        }
        if ([value caseInsensitiveCompare:@"BN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBn);
        }
        if ([value caseInsensitiveCompare:@"BG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBg);
        }
        if ([value caseInsensitiveCompare:@"BF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBf);
        }
        if ([value caseInsensitiveCompare:@"BI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBi);
        }
        if ([value caseInsensitiveCompare:@"KH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKh);
        }
        if ([value caseInsensitiveCompare:@"CM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCm);
        }
        if ([value caseInsensitiveCompare:@"CA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCa);
        }
        if ([value caseInsensitiveCompare:@"CV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCv);
        }
        if ([value caseInsensitiveCompare:@"KY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKy);
        }
        if ([value caseInsensitiveCompare:@"CF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCf);
        }
        if ([value caseInsensitiveCompare:@"TD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTd);
        }
        if ([value caseInsensitiveCompare:@"CL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCl);
        }
        if ([value caseInsensitiveCompare:@"CN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCn);
        }
        if ([value caseInsensitiveCompare:@"CX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCx);
        }
        if ([value caseInsensitiveCompare:@"CC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCc);
        }
        if ([value caseInsensitiveCompare:@"CO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCo);
        }
        if ([value caseInsensitiveCompare:@"KM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKm);
        }
        if ([value caseInsensitiveCompare:@"CK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCk);
        }
        if ([value caseInsensitiveCompare:@"CR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCr);
        }
        if ([value caseInsensitiveCompare:@"HR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHr);
        }
        if ([value caseInsensitiveCompare:@"CU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCu);
        }
        if ([value caseInsensitiveCompare:@"CW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCw);
        }
        if ([value caseInsensitiveCompare:@"CY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCy);
        }
        if ([value caseInsensitiveCompare:@"CZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCz);
        }
        if ([value caseInsensitiveCompare:@"CD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCd);
        }
        if ([value caseInsensitiveCompare:@"DK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDk);
        }
        if ([value caseInsensitiveCompare:@"DJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDj);
        }
        if ([value caseInsensitiveCompare:@"DM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDm);
        }
        if ([value caseInsensitiveCompare:@"DO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDo);
        }
        if ([value caseInsensitiveCompare:@"TL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTl);
        }
        if ([value caseInsensitiveCompare:@"EC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEc);
        }
        if ([value caseInsensitiveCompare:@"EG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEg);
        }
        if ([value caseInsensitiveCompare:@"SV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSv);
        }
        if ([value caseInsensitiveCompare:@"GQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGq);
        }
        if ([value caseInsensitiveCompare:@"ER"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEr);
        }
        if ([value caseInsensitiveCompare:@"EE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEe);
        }
        if ([value caseInsensitiveCompare:@"ET"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEt);
        }
        if ([value caseInsensitiveCompare:@"FK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFk);
        }
        if ([value caseInsensitiveCompare:@"FO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFo);
        }
        if ([value caseInsensitiveCompare:@"FJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFj);
        }
        if ([value caseInsensitiveCompare:@"FI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFi);
        }
        if ([value caseInsensitiveCompare:@"FR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFr);
        }
        if ([value caseInsensitiveCompare:@"PF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePf);
        }
        if ([value caseInsensitiveCompare:@"GA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGa);
        }
        if ([value caseInsensitiveCompare:@"GM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGm);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGE);
        }
        if ([value caseInsensitiveCompare:@"DE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeDe);
        }
        if ([value caseInsensitiveCompare:@"GH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGh);
        }
        if ([value caseInsensitiveCompare:@"GI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGi);
        }
        if ([value caseInsensitiveCompare:@"GR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGr);
        }
        if ([value caseInsensitiveCompare:@"GL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGl);
        }
        if ([value caseInsensitiveCompare:@"GD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGd);
        }
        if ([value caseInsensitiveCompare:@"GU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGu);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGT);
        }
        if ([value caseInsensitiveCompare:@"GG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGg);
        }
        if ([value caseInsensitiveCompare:@"GN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGn);
        }
        if ([value caseInsensitiveCompare:@"GW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGw);
        }
        if ([value caseInsensitiveCompare:@"GY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGy);
        }
        if ([value caseInsensitiveCompare:@"HT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHt);
        }
        if ([value caseInsensitiveCompare:@"HN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHn);
        }
        if ([value caseInsensitiveCompare:@"HK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHk);
        }
        if ([value caseInsensitiveCompare:@"HU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeHu);
        }
        if ([value caseInsensitiveCompare:@"IS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIs);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIN);
        }
        if ([value caseInsensitiveCompare:@"ID"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeId);
        }
        if ([value caseInsensitiveCompare:@"IR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIr);
        }
        if ([value caseInsensitiveCompare:@"IQ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIq);
        }
        if ([value caseInsensitiveCompare:@"IE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIe);
        }
        if ([value caseInsensitiveCompare:@"IM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIm);
        }
        if ([value caseInsensitiveCompare:@"IL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIl);
        }
        if ([value caseInsensitiveCompare:@"IT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeIt);
        }
        if ([value caseInsensitiveCompare:@"CI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCi);
        }
        if ([value caseInsensitiveCompare:@"JM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJm);
        }
        if ([value caseInsensitiveCompare:@"JP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJp);
        }
        if ([value caseInsensitiveCompare:@"JE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJe);
        }
        if ([value caseInsensitiveCompare:@"JO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeJo);
        }
        if ([value caseInsensitiveCompare:@"KZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKz);
        }
        if ([value caseInsensitiveCompare:@"KE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKe);
        }
        if ([value caseInsensitiveCompare:@"KI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKi);
        }
        if ([value caseInsensitiveCompare:@"KW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKw);
        }
        if ([value caseInsensitiveCompare:@"KG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKg);
        }
        if ([value caseInsensitiveCompare:@"LA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLa);
        }
        if ([value caseInsensitiveCompare:@"LV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLv);
        }
        if ([value caseInsensitiveCompare:@"LB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLb);
        }
        if ([value caseInsensitiveCompare:@"LS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLs);
        }
        if ([value caseInsensitiveCompare:@"LR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLr);
        }
        if ([value caseInsensitiveCompare:@"LY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLy);
        }
        if ([value caseInsensitiveCompare:@"LI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLi);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLT);
        }
        if ([value caseInsensitiveCompare:@"LU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLu);
        }
        if ([value caseInsensitiveCompare:@"MO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMo);
        }
        if ([value caseInsensitiveCompare:@"MK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMk);
        }
        if ([value caseInsensitiveCompare:@"MG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMg);
        }
        if ([value caseInsensitiveCompare:@"MW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMw);
        }
        if ([value caseInsensitiveCompare:@"MY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMy);
        }
        if ([value caseInsensitiveCompare:@"MV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMv);
        }
        if ([value caseInsensitiveCompare:@"ML"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMl);
        }
        if ([value caseInsensitiveCompare:@"MT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMt);
        }
        if ([value caseInsensitiveCompare:@"MH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMh);
        }
        if ([value caseInsensitiveCompare:@"MR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMr);
        }
        if ([value caseInsensitiveCompare:@"MU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMu);
        }
        if ([value caseInsensitiveCompare:@"YT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeYt);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMx);
        }
        if ([value caseInsensitiveCompare:@"FM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeFm);
        }
        if ([value caseInsensitiveCompare:@"MD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMd);
        }
        if ([value caseInsensitiveCompare:@"MC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMc);
        }
        if ([value caseInsensitiveCompare:@"MN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMn);
        }
        if ([value caseInsensitiveCompare:@"ME"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMe);
        }
        if ([value caseInsensitiveCompare:@"MS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMs);
        }
        if ([value caseInsensitiveCompare:@"MA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMa);
        }
        if ([value caseInsensitiveCompare:@"MZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMz);
        }
        if ([value caseInsensitiveCompare:@"MM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMm);
        }
        if ([value caseInsensitiveCompare:@"NA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNa);
        }
        if ([value caseInsensitiveCompare:@"NR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNr);
        }
        if ([value caseInsensitiveCompare:@"NP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNp);
        }
        if ([value caseInsensitiveCompare:@"NL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNl);
        }
        if ([value caseInsensitiveCompare:@"AN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAn);
        }
        if ([value caseInsensitiveCompare:@"NC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNc);
        }
        if ([value caseInsensitiveCompare:@"NZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNz);
        }
        if ([value caseInsensitiveCompare:@"NI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNi);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNE);
        }
        if ([value caseInsensitiveCompare:@"NG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNg);
        }
        if ([value caseInsensitiveCompare:@"NU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNu);
        }
        if ([value caseInsensitiveCompare:@"KP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKp);
        }
        if ([value caseInsensitiveCompare:@"MP"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMp);
        }
        if ([value caseInsensitiveCompare:@"NO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeNo);
        }
        if ([value caseInsensitiveCompare:@"OM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeOm);
        }
        if ([value caseInsensitiveCompare:@"PK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePk);
        }
        if ([value caseInsensitiveCompare:@"PW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePw);
        }
        if ([value caseInsensitiveCompare:@"PA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePa);
        }
        if ([value caseInsensitiveCompare:@"PG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePg);
        }
        if ([value caseInsensitiveCompare:@"PY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePy);
        }
        if ([value caseInsensitiveCompare:@"PE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePe);
        }
        if ([value caseInsensitiveCompare:@"PH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePh);
        }
        if ([value caseInsensitiveCompare:@"PN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePn);
        }
        if ([value caseInsensitiveCompare:@"PL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePl);
        }
        if ([value caseInsensitiveCompare:@"PT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePt);
        }
        if ([value caseInsensitiveCompare:@"PR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePr);
        }
        if ([value caseInsensitiveCompare:@"QA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeQa);
        }
        if ([value caseInsensitiveCompare:@"CG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCg);
        }
        if ([value caseInsensitiveCompare:@"RE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRe);
        }
        if ([value caseInsensitiveCompare:@"RO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRo);
        }
        if ([value caseInsensitiveCompare:@"RU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRu);
        }
        if ([value caseInsensitiveCompare:@"RW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRw);
        }
        if ([value caseInsensitiveCompare:@"BL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeBl);
        }
        if ([value caseInsensitiveCompare:@"SH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSh);
        }
        if ([value caseInsensitiveCompare:@"KN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKn);
        }
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLc);
        }
        if ([value caseInsensitiveCompare:@"MF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeMf);
        }
        if ([value caseInsensitiveCompare:@"PM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodePm);
        }
        if ([value caseInsensitiveCompare:@"VC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVc);
        }
        if ([value caseInsensitiveCompare:@"WS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeWs);
        }
        if ([value caseInsensitiveCompare:@"SM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSm);
        }
        if ([value caseInsensitiveCompare:@"ST"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSt);
        }
        if ([value caseInsensitiveCompare:@"SA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSa);
        }
        if ([value caseInsensitiveCompare:@"SN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSn);
        }
        if ([value caseInsensitiveCompare:@"RS"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeRs);
        }
        if ([value caseInsensitiveCompare:@"SC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSc);
        }
        if ([value caseInsensitiveCompare:@"SL"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSl);
        }
        if ([value caseInsensitiveCompare:@"SG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSg);
        }
        if ([value caseInsensitiveCompare:@"SX"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSx);
        }
        if ([value caseInsensitiveCompare:@"SK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSk);
        }
        if ([value caseInsensitiveCompare:@"SI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSi);
        }
        if ([value caseInsensitiveCompare:@"SB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSb);
        }
        if ([value caseInsensitiveCompare:@"SO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSo);
        }
        if ([value caseInsensitiveCompare:@"ZA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZa);
        }
        if ([value caseInsensitiveCompare:@"KR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeKr);
        }
        if ([value caseInsensitiveCompare:@"ES"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEs);
        }
        if ([value caseInsensitiveCompare:@"LK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeLk);
        }
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSd);
        }
        if ([value caseInsensitiveCompare:@"SR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSr);
        }
        if ([value caseInsensitiveCompare:@"SJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSj);
        }
        if ([value caseInsensitiveCompare:@"SZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSz);
        }
        if ([value caseInsensitiveCompare:@"SE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSe);
        }
        if ([value caseInsensitiveCompare:@"CH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeCh);
        }
        if ([value caseInsensitiveCompare:@"SY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeSy);
        }
        if ([value caseInsensitiveCompare:@"TW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTw);
        }
        if ([value caseInsensitiveCompare:@"TJ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTj);
        }
        if ([value caseInsensitiveCompare:@"TZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTz);
        }
        if ([value caseInsensitiveCompare:@"TH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTh);
        }
        if ([value caseInsensitiveCompare:@"TG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTg);
        }
        if ([value caseInsensitiveCompare:@"TK"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTk);
        }
        if ([value caseInsensitiveCompare:@"TO"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTo);
        }
        if ([value caseInsensitiveCompare:@"TT"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTt);
        }
        if ([value caseInsensitiveCompare:@"TN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTn);
        }
        if ([value caseInsensitiveCompare:@"TR"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTr);
        }
        if ([value caseInsensitiveCompare:@"TM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTm);
        }
        if ([value caseInsensitiveCompare:@"TC"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTc);
        }
        if ([value caseInsensitiveCompare:@"TV"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeTv);
        }
        if ([value caseInsensitiveCompare:@"VI"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVi);
        }
        if ([value caseInsensitiveCompare:@"UG"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUg);
        }
        if ([value caseInsensitiveCompare:@"UA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUa);
        }
        if ([value caseInsensitiveCompare:@"AE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeAe);
        }
        if ([value caseInsensitiveCompare:@"GB"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeGb);
        }
        if ([value caseInsensitiveCompare:@"US"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUs);
        }
        if ([value caseInsensitiveCompare:@"UY"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUy);
        }
        if ([value caseInsensitiveCompare:@"UZ"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeUz);
        }
        if ([value caseInsensitiveCompare:@"VU"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVu);
        }
        if ([value caseInsensitiveCompare:@"VA"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVa);
        }
        if ([value caseInsensitiveCompare:@"VE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVe);
        }
        if ([value caseInsensitiveCompare:@"VN"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeVn);
        }
        if ([value caseInsensitiveCompare:@"WF"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeWf);
        }
        if ([value caseInsensitiveCompare:@"EH"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeEh);
        }
        if ([value caseInsensitiveCompare:@"YE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeYe);
        }
        if ([value caseInsensitiveCompare:@"ZM"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZm);
        }
        if ([value caseInsensitiveCompare:@"ZW"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberCountryCodeZw);
        }
        return @(AWSConnectPhoneNumberCountryCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneNumberCountryCodeAf:
                return @"AF";
            case AWSConnectPhoneNumberCountryCodeAl:
                return @"AL";
            case AWSConnectPhoneNumberCountryCodeDz:
                return @"DZ";
            case AWSConnectPhoneNumberCountryCodeAs:
                return @"AS";
            case AWSConnectPhoneNumberCountryCodeAd:
                return @"AD";
            case AWSConnectPhoneNumberCountryCodeAo:
                return @"AO";
            case AWSConnectPhoneNumberCountryCodeAi:
                return @"AI";
            case AWSConnectPhoneNumberCountryCodeAq:
                return @"AQ";
            case AWSConnectPhoneNumberCountryCodeAg:
                return @"AG";
            case AWSConnectPhoneNumberCountryCodeAr:
                return @"AR";
            case AWSConnectPhoneNumberCountryCodeAm:
                return @"AM";
            case AWSConnectPhoneNumberCountryCodeAw:
                return @"AW";
            case AWSConnectPhoneNumberCountryCodeAu:
                return @"AU";
            case AWSConnectPhoneNumberCountryCodeAt:
                return @"AT";
            case AWSConnectPhoneNumberCountryCodeAz:
                return @"AZ";
            case AWSConnectPhoneNumberCountryCodeBs:
                return @"BS";
            case AWSConnectPhoneNumberCountryCodeBh:
                return @"BH";
            case AWSConnectPhoneNumberCountryCodeBd:
                return @"BD";
            case AWSConnectPhoneNumberCountryCodeBb:
                return @"BB";
            case AWSConnectPhoneNumberCountryCodeBy:
                return @"BY";
            case AWSConnectPhoneNumberCountryCodeBe:
                return @"BE";
            case AWSConnectPhoneNumberCountryCodeBz:
                return @"BZ";
            case AWSConnectPhoneNumberCountryCodeBj:
                return @"BJ";
            case AWSConnectPhoneNumberCountryCodeBm:
                return @"BM";
            case AWSConnectPhoneNumberCountryCodeBt:
                return @"BT";
            case AWSConnectPhoneNumberCountryCodeBo:
                return @"BO";
            case AWSConnectPhoneNumberCountryCodeBa:
                return @"BA";
            case AWSConnectPhoneNumberCountryCodeBw:
                return @"BW";
            case AWSConnectPhoneNumberCountryCodeBr:
                return @"BR";
            case AWSConnectPhoneNumberCountryCodeIo:
                return @"IO";
            case AWSConnectPhoneNumberCountryCodeVg:
                return @"VG";
            case AWSConnectPhoneNumberCountryCodeBn:
                return @"BN";
            case AWSConnectPhoneNumberCountryCodeBg:
                return @"BG";
            case AWSConnectPhoneNumberCountryCodeBf:
                return @"BF";
            case AWSConnectPhoneNumberCountryCodeBi:
                return @"BI";
            case AWSConnectPhoneNumberCountryCodeKh:
                return @"KH";
            case AWSConnectPhoneNumberCountryCodeCm:
                return @"CM";
            case AWSConnectPhoneNumberCountryCodeCa:
                return @"CA";
            case AWSConnectPhoneNumberCountryCodeCv:
                return @"CV";
            case AWSConnectPhoneNumberCountryCodeKy:
                return @"KY";
            case AWSConnectPhoneNumberCountryCodeCf:
                return @"CF";
            case AWSConnectPhoneNumberCountryCodeTd:
                return @"TD";
            case AWSConnectPhoneNumberCountryCodeCl:
                return @"CL";
            case AWSConnectPhoneNumberCountryCodeCn:
                return @"CN";
            case AWSConnectPhoneNumberCountryCodeCx:
                return @"CX";
            case AWSConnectPhoneNumberCountryCodeCc:
                return @"CC";
            case AWSConnectPhoneNumberCountryCodeCo:
                return @"CO";
            case AWSConnectPhoneNumberCountryCodeKm:
                return @"KM";
            case AWSConnectPhoneNumberCountryCodeCk:
                return @"CK";
            case AWSConnectPhoneNumberCountryCodeCr:
                return @"CR";
            case AWSConnectPhoneNumberCountryCodeHr:
                return @"HR";
            case AWSConnectPhoneNumberCountryCodeCu:
                return @"CU";
            case AWSConnectPhoneNumberCountryCodeCw:
                return @"CW";
            case AWSConnectPhoneNumberCountryCodeCy:
                return @"CY";
            case AWSConnectPhoneNumberCountryCodeCz:
                return @"CZ";
            case AWSConnectPhoneNumberCountryCodeCd:
                return @"CD";
            case AWSConnectPhoneNumberCountryCodeDk:
                return @"DK";
            case AWSConnectPhoneNumberCountryCodeDj:
                return @"DJ";
            case AWSConnectPhoneNumberCountryCodeDm:
                return @"DM";
            case AWSConnectPhoneNumberCountryCodeDo:
                return @"DO";
            case AWSConnectPhoneNumberCountryCodeTl:
                return @"TL";
            case AWSConnectPhoneNumberCountryCodeEc:
                return @"EC";
            case AWSConnectPhoneNumberCountryCodeEg:
                return @"EG";
            case AWSConnectPhoneNumberCountryCodeSv:
                return @"SV";
            case AWSConnectPhoneNumberCountryCodeGq:
                return @"GQ";
            case AWSConnectPhoneNumberCountryCodeEr:
                return @"ER";
            case AWSConnectPhoneNumberCountryCodeEe:
                return @"EE";
            case AWSConnectPhoneNumberCountryCodeEt:
                return @"ET";
            case AWSConnectPhoneNumberCountryCodeFk:
                return @"FK";
            case AWSConnectPhoneNumberCountryCodeFo:
                return @"FO";
            case AWSConnectPhoneNumberCountryCodeFj:
                return @"FJ";
            case AWSConnectPhoneNumberCountryCodeFi:
                return @"FI";
            case AWSConnectPhoneNumberCountryCodeFr:
                return @"FR";
            case AWSConnectPhoneNumberCountryCodePf:
                return @"PF";
            case AWSConnectPhoneNumberCountryCodeGa:
                return @"GA";
            case AWSConnectPhoneNumberCountryCodeGm:
                return @"GM";
            case AWSConnectPhoneNumberCountryCodeGE:
                return @"GE";
            case AWSConnectPhoneNumberCountryCodeDe:
                return @"DE";
            case AWSConnectPhoneNumberCountryCodeGh:
                return @"GH";
            case AWSConnectPhoneNumberCountryCodeGi:
                return @"GI";
            case AWSConnectPhoneNumberCountryCodeGr:
                return @"GR";
            case AWSConnectPhoneNumberCountryCodeGl:
                return @"GL";
            case AWSConnectPhoneNumberCountryCodeGd:
                return @"GD";
            case AWSConnectPhoneNumberCountryCodeGu:
                return @"GU";
            case AWSConnectPhoneNumberCountryCodeGT:
                return @"GT";
            case AWSConnectPhoneNumberCountryCodeGg:
                return @"GG";
            case AWSConnectPhoneNumberCountryCodeGn:
                return @"GN";
            case AWSConnectPhoneNumberCountryCodeGw:
                return @"GW";
            case AWSConnectPhoneNumberCountryCodeGy:
                return @"GY";
            case AWSConnectPhoneNumberCountryCodeHt:
                return @"HT";
            case AWSConnectPhoneNumberCountryCodeHn:
                return @"HN";
            case AWSConnectPhoneNumberCountryCodeHk:
                return @"HK";
            case AWSConnectPhoneNumberCountryCodeHu:
                return @"HU";
            case AWSConnectPhoneNumberCountryCodeIs:
                return @"IS";
            case AWSConnectPhoneNumberCountryCodeIN:
                return @"IN";
            case AWSConnectPhoneNumberCountryCodeId:
                return @"ID";
            case AWSConnectPhoneNumberCountryCodeIr:
                return @"IR";
            case AWSConnectPhoneNumberCountryCodeIq:
                return @"IQ";
            case AWSConnectPhoneNumberCountryCodeIe:
                return @"IE";
            case AWSConnectPhoneNumberCountryCodeIm:
                return @"IM";
            case AWSConnectPhoneNumberCountryCodeIl:
                return @"IL";
            case AWSConnectPhoneNumberCountryCodeIt:
                return @"IT";
            case AWSConnectPhoneNumberCountryCodeCi:
                return @"CI";
            case AWSConnectPhoneNumberCountryCodeJm:
                return @"JM";
            case AWSConnectPhoneNumberCountryCodeJp:
                return @"JP";
            case AWSConnectPhoneNumberCountryCodeJe:
                return @"JE";
            case AWSConnectPhoneNumberCountryCodeJo:
                return @"JO";
            case AWSConnectPhoneNumberCountryCodeKz:
                return @"KZ";
            case AWSConnectPhoneNumberCountryCodeKe:
                return @"KE";
            case AWSConnectPhoneNumberCountryCodeKi:
                return @"KI";
            case AWSConnectPhoneNumberCountryCodeKw:
                return @"KW";
            case AWSConnectPhoneNumberCountryCodeKg:
                return @"KG";
            case AWSConnectPhoneNumberCountryCodeLa:
                return @"LA";
            case AWSConnectPhoneNumberCountryCodeLv:
                return @"LV";
            case AWSConnectPhoneNumberCountryCodeLb:
                return @"LB";
            case AWSConnectPhoneNumberCountryCodeLs:
                return @"LS";
            case AWSConnectPhoneNumberCountryCodeLr:
                return @"LR";
            case AWSConnectPhoneNumberCountryCodeLy:
                return @"LY";
            case AWSConnectPhoneNumberCountryCodeLi:
                return @"LI";
            case AWSConnectPhoneNumberCountryCodeLT:
                return @"LT";
            case AWSConnectPhoneNumberCountryCodeLu:
                return @"LU";
            case AWSConnectPhoneNumberCountryCodeMo:
                return @"MO";
            case AWSConnectPhoneNumberCountryCodeMk:
                return @"MK";
            case AWSConnectPhoneNumberCountryCodeMg:
                return @"MG";
            case AWSConnectPhoneNumberCountryCodeMw:
                return @"MW";
            case AWSConnectPhoneNumberCountryCodeMy:
                return @"MY";
            case AWSConnectPhoneNumberCountryCodeMv:
                return @"MV";
            case AWSConnectPhoneNumberCountryCodeMl:
                return @"ML";
            case AWSConnectPhoneNumberCountryCodeMt:
                return @"MT";
            case AWSConnectPhoneNumberCountryCodeMh:
                return @"MH";
            case AWSConnectPhoneNumberCountryCodeMr:
                return @"MR";
            case AWSConnectPhoneNumberCountryCodeMu:
                return @"MU";
            case AWSConnectPhoneNumberCountryCodeYt:
                return @"YT";
            case AWSConnectPhoneNumberCountryCodeMx:
                return @"MX";
            case AWSConnectPhoneNumberCountryCodeFm:
                return @"FM";
            case AWSConnectPhoneNumberCountryCodeMd:
                return @"MD";
            case AWSConnectPhoneNumberCountryCodeMc:
                return @"MC";
            case AWSConnectPhoneNumberCountryCodeMn:
                return @"MN";
            case AWSConnectPhoneNumberCountryCodeMe:
                return @"ME";
            case AWSConnectPhoneNumberCountryCodeMs:
                return @"MS";
            case AWSConnectPhoneNumberCountryCodeMa:
                return @"MA";
            case AWSConnectPhoneNumberCountryCodeMz:
                return @"MZ";
            case AWSConnectPhoneNumberCountryCodeMm:
                return @"MM";
            case AWSConnectPhoneNumberCountryCodeNa:
                return @"NA";
            case AWSConnectPhoneNumberCountryCodeNr:
                return @"NR";
            case AWSConnectPhoneNumberCountryCodeNp:
                return @"NP";
            case AWSConnectPhoneNumberCountryCodeNl:
                return @"NL";
            case AWSConnectPhoneNumberCountryCodeAn:
                return @"AN";
            case AWSConnectPhoneNumberCountryCodeNc:
                return @"NC";
            case AWSConnectPhoneNumberCountryCodeNz:
                return @"NZ";
            case AWSConnectPhoneNumberCountryCodeNi:
                return @"NI";
            case AWSConnectPhoneNumberCountryCodeNE:
                return @"NE";
            case AWSConnectPhoneNumberCountryCodeNg:
                return @"NG";
            case AWSConnectPhoneNumberCountryCodeNu:
                return @"NU";
            case AWSConnectPhoneNumberCountryCodeKp:
                return @"KP";
            case AWSConnectPhoneNumberCountryCodeMp:
                return @"MP";
            case AWSConnectPhoneNumberCountryCodeNo:
                return @"NO";
            case AWSConnectPhoneNumberCountryCodeOm:
                return @"OM";
            case AWSConnectPhoneNumberCountryCodePk:
                return @"PK";
            case AWSConnectPhoneNumberCountryCodePw:
                return @"PW";
            case AWSConnectPhoneNumberCountryCodePa:
                return @"PA";
            case AWSConnectPhoneNumberCountryCodePg:
                return @"PG";
            case AWSConnectPhoneNumberCountryCodePy:
                return @"PY";
            case AWSConnectPhoneNumberCountryCodePe:
                return @"PE";
            case AWSConnectPhoneNumberCountryCodePh:
                return @"PH";
            case AWSConnectPhoneNumberCountryCodePn:
                return @"PN";
            case AWSConnectPhoneNumberCountryCodePl:
                return @"PL";
            case AWSConnectPhoneNumberCountryCodePt:
                return @"PT";
            case AWSConnectPhoneNumberCountryCodePr:
                return @"PR";
            case AWSConnectPhoneNumberCountryCodeQa:
                return @"QA";
            case AWSConnectPhoneNumberCountryCodeCg:
                return @"CG";
            case AWSConnectPhoneNumberCountryCodeRe:
                return @"RE";
            case AWSConnectPhoneNumberCountryCodeRo:
                return @"RO";
            case AWSConnectPhoneNumberCountryCodeRu:
                return @"RU";
            case AWSConnectPhoneNumberCountryCodeRw:
                return @"RW";
            case AWSConnectPhoneNumberCountryCodeBl:
                return @"BL";
            case AWSConnectPhoneNumberCountryCodeSh:
                return @"SH";
            case AWSConnectPhoneNumberCountryCodeKn:
                return @"KN";
            case AWSConnectPhoneNumberCountryCodeLc:
                return @"LC";
            case AWSConnectPhoneNumberCountryCodeMf:
                return @"MF";
            case AWSConnectPhoneNumberCountryCodePm:
                return @"PM";
            case AWSConnectPhoneNumberCountryCodeVc:
                return @"VC";
            case AWSConnectPhoneNumberCountryCodeWs:
                return @"WS";
            case AWSConnectPhoneNumberCountryCodeSm:
                return @"SM";
            case AWSConnectPhoneNumberCountryCodeSt:
                return @"ST";
            case AWSConnectPhoneNumberCountryCodeSa:
                return @"SA";
            case AWSConnectPhoneNumberCountryCodeSn:
                return @"SN";
            case AWSConnectPhoneNumberCountryCodeRs:
                return @"RS";
            case AWSConnectPhoneNumberCountryCodeSc:
                return @"SC";
            case AWSConnectPhoneNumberCountryCodeSl:
                return @"SL";
            case AWSConnectPhoneNumberCountryCodeSg:
                return @"SG";
            case AWSConnectPhoneNumberCountryCodeSx:
                return @"SX";
            case AWSConnectPhoneNumberCountryCodeSk:
                return @"SK";
            case AWSConnectPhoneNumberCountryCodeSi:
                return @"SI";
            case AWSConnectPhoneNumberCountryCodeSb:
                return @"SB";
            case AWSConnectPhoneNumberCountryCodeSo:
                return @"SO";
            case AWSConnectPhoneNumberCountryCodeZa:
                return @"ZA";
            case AWSConnectPhoneNumberCountryCodeKr:
                return @"KR";
            case AWSConnectPhoneNumberCountryCodeEs:
                return @"ES";
            case AWSConnectPhoneNumberCountryCodeLk:
                return @"LK";
            case AWSConnectPhoneNumberCountryCodeSd:
                return @"SD";
            case AWSConnectPhoneNumberCountryCodeSr:
                return @"SR";
            case AWSConnectPhoneNumberCountryCodeSj:
                return @"SJ";
            case AWSConnectPhoneNumberCountryCodeSz:
                return @"SZ";
            case AWSConnectPhoneNumberCountryCodeSe:
                return @"SE";
            case AWSConnectPhoneNumberCountryCodeCh:
                return @"CH";
            case AWSConnectPhoneNumberCountryCodeSy:
                return @"SY";
            case AWSConnectPhoneNumberCountryCodeTw:
                return @"TW";
            case AWSConnectPhoneNumberCountryCodeTj:
                return @"TJ";
            case AWSConnectPhoneNumberCountryCodeTz:
                return @"TZ";
            case AWSConnectPhoneNumberCountryCodeTh:
                return @"TH";
            case AWSConnectPhoneNumberCountryCodeTg:
                return @"TG";
            case AWSConnectPhoneNumberCountryCodeTk:
                return @"TK";
            case AWSConnectPhoneNumberCountryCodeTo:
                return @"TO";
            case AWSConnectPhoneNumberCountryCodeTt:
                return @"TT";
            case AWSConnectPhoneNumberCountryCodeTn:
                return @"TN";
            case AWSConnectPhoneNumberCountryCodeTr:
                return @"TR";
            case AWSConnectPhoneNumberCountryCodeTm:
                return @"TM";
            case AWSConnectPhoneNumberCountryCodeTc:
                return @"TC";
            case AWSConnectPhoneNumberCountryCodeTv:
                return @"TV";
            case AWSConnectPhoneNumberCountryCodeVi:
                return @"VI";
            case AWSConnectPhoneNumberCountryCodeUg:
                return @"UG";
            case AWSConnectPhoneNumberCountryCodeUa:
                return @"UA";
            case AWSConnectPhoneNumberCountryCodeAe:
                return @"AE";
            case AWSConnectPhoneNumberCountryCodeGb:
                return @"GB";
            case AWSConnectPhoneNumberCountryCodeUs:
                return @"US";
            case AWSConnectPhoneNumberCountryCodeUy:
                return @"UY";
            case AWSConnectPhoneNumberCountryCodeUz:
                return @"UZ";
            case AWSConnectPhoneNumberCountryCodeVu:
                return @"VU";
            case AWSConnectPhoneNumberCountryCodeVa:
                return @"VA";
            case AWSConnectPhoneNumberCountryCodeVe:
                return @"VE";
            case AWSConnectPhoneNumberCountryCodeVn:
                return @"VN";
            case AWSConnectPhoneNumberCountryCodeWf:
                return @"WF";
            case AWSConnectPhoneNumberCountryCodeEh:
                return @"EH";
            case AWSConnectPhoneNumberCountryCodeYe:
                return @"YE";
            case AWSConnectPhoneNumberCountryCodeZm:
                return @"ZM";
            case AWSConnectPhoneNumberCountryCodeZw:
                return @"ZW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)phoneNumberTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TOLL_FREE"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberTypeTollFree);
        }
        if ([value caseInsensitiveCompare:@"DID"] == NSOrderedSame) {
            return @(AWSConnectPhoneNumberTypeDid);
        }
        return @(AWSConnectPhoneNumberTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneNumberTypeTollFree:
                return @"TOLL_FREE";
            case AWSConnectPhoneNumberTypeDid:
                return @"DID";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectSearchAvailablePhoneNumbersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availableNumbersList" : @"AvailableNumbersList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)availableNumbersListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectAvailableNumberSummary class]];
}

@end

@implementation AWSConnectSearchQueuesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"searchCriteria" : @"SearchCriteria",
             @"searchFilter" : @"SearchFilter",
             };
}

+ (NSValueTransformer *)searchCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQueueSearchCriteria class]];
}

+ (NSValueTransformer *)searchFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQueueSearchFilter class]];
}

@end

@implementation AWSConnectSearchQueuesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateTotalCount" : @"ApproximateTotalCount",
             @"nextToken" : @"NextToken",
             @"queues" : @"Queues",
             };
}

+ (NSValueTransformer *)queuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectQueue class]];
}

@end

@implementation AWSConnectSearchRoutingProfilesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"searchCriteria" : @"SearchCriteria",
             @"searchFilter" : @"SearchFilter",
             };
}

+ (NSValueTransformer *)searchCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectRoutingProfileSearchCriteria class]];
}

+ (NSValueTransformer *)searchFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectRoutingProfileSearchFilter class]];
}

@end

@implementation AWSConnectSearchRoutingProfilesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateTotalCount" : @"ApproximateTotalCount",
             @"nextToken" : @"NextToken",
             @"routingProfiles" : @"RoutingProfiles",
             };
}

+ (NSValueTransformer *)routingProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRoutingProfile class]];
}

@end

@implementation AWSConnectSearchSecurityProfilesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"searchCriteria" : @"SearchCriteria",
             @"searchFilter" : @"SearchFilter",
             };
}

+ (NSValueTransformer *)searchCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectSecurityProfileSearchCriteria class]];
}

+ (NSValueTransformer *)searchFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectSecurityProfilesSearchFilter class]];
}

@end

@implementation AWSConnectSearchSecurityProfilesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateTotalCount" : @"ApproximateTotalCount",
             @"nextToken" : @"NextToken",
             @"securityProfiles" : @"SecurityProfiles",
             };
}

+ (NSValueTransformer *)securityProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectSecurityProfileSearchSummary class]];
}

@end

@implementation AWSConnectSearchUsersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"searchCriteria" : @"SearchCriteria",
             @"searchFilter" : @"SearchFilter",
             };
}

+ (NSValueTransformer *)searchCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserSearchCriteria class]];
}

+ (NSValueTransformer *)searchFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserSearchFilter class]];
}

@end

@implementation AWSConnectSearchUsersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateTotalCount" : @"ApproximateTotalCount",
             @"nextToken" : @"NextToken",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectUserSearchSummary class]];
}

@end

@implementation AWSConnectSearchVocabulariesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"languageCode" : @"LanguageCode",
             @"maxResults" : @"MaxResults",
             @"nameStartsWith" : @"NameStartsWith",
             @"nextToken" : @"NextToken",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"en-NZ"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnNZ);
        }
        if ([value caseInsensitiveCompare:@"en-ZA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnZA);
        }
        return @(AWSConnectVocabularyLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyLanguageCodeArAE:
                return @"ar-AE";
            case AWSConnectVocabularyLanguageCodeDeCH:
                return @"de-CH";
            case AWSConnectVocabularyLanguageCodeDeDE:
                return @"de-DE";
            case AWSConnectVocabularyLanguageCodeEnAB:
                return @"en-AB";
            case AWSConnectVocabularyLanguageCodeEnAU:
                return @"en-AU";
            case AWSConnectVocabularyLanguageCodeEnGB:
                return @"en-GB";
            case AWSConnectVocabularyLanguageCodeEnIE:
                return @"en-IE";
            case AWSConnectVocabularyLanguageCodeEnIN:
                return @"en-IN";
            case AWSConnectVocabularyLanguageCodeEnUS:
                return @"en-US";
            case AWSConnectVocabularyLanguageCodeEnWL:
                return @"en-WL";
            case AWSConnectVocabularyLanguageCodeEsES:
                return @"es-ES";
            case AWSConnectVocabularyLanguageCodeEsUS:
                return @"es-US";
            case AWSConnectVocabularyLanguageCodeFrCA:
                return @"fr-CA";
            case AWSConnectVocabularyLanguageCodeFrFR:
                return @"fr-FR";
            case AWSConnectVocabularyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSConnectVocabularyLanguageCodeItIT:
                return @"it-IT";
            case AWSConnectVocabularyLanguageCodeJaJP:
                return @"ja-JP";
            case AWSConnectVocabularyLanguageCodeKoKR:
                return @"ko-KR";
            case AWSConnectVocabularyLanguageCodePtBR:
                return @"pt-BR";
            case AWSConnectVocabularyLanguageCodePtPT:
                return @"pt-PT";
            case AWSConnectVocabularyLanguageCodeZhCN:
                return @"zh-CN";
            case AWSConnectVocabularyLanguageCodeEnNZ:
                return @"en-NZ";
            case AWSConnectVocabularyLanguageCodeEnZA:
                return @"en-ZA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateActive);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateDeleteInProgress);
        }
        return @(AWSConnectVocabularyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyStateCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSConnectVocabularyStateActive:
                return @"ACTIVE";
            case AWSConnectVocabularyStateCreationFailed:
                return @"CREATION_FAILED";
            case AWSConnectVocabularyStateDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectSearchVocabulariesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"vocabularySummaryList" : @"VocabularySummaryList",
             };
}

+ (NSValueTransformer *)vocabularySummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectVocabularySummary class]];
}

@end

@implementation AWSConnectSecurityKey

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"creationTime" : @"CreationTime",
             @"key" : @"Key",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSConnectSecurityProfile

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedAccessControlTags" : @"AllowedAccessControlTags",
             @"arn" : @"Arn",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"organizationResourceId" : @"OrganizationResourceId",
             @"securityProfileName" : @"SecurityProfileName",
             @"tagRestrictedResources" : @"TagRestrictedResources",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSConnectSecurityProfileSearchCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"andConditions" : @"AndConditions",
             @"orConditions" : @"OrConditions",
             @"stringCondition" : @"StringCondition",
             };
}

+ (NSValueTransformer *)andConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectSecurityProfileSearchCriteria class]];
}

+ (NSValueTransformer *)orConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectSecurityProfileSearchCriteria class]];
}

+ (NSValueTransformer *)stringConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectStringCondition class]];
}

@end

@implementation AWSConnectSecurityProfileSearchSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"organizationResourceId" : @"OrganizationResourceId",
             @"securityProfileName" : @"SecurityProfileName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSConnectSecurityProfileSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectSecurityProfilesSearchFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagFilter" : @"TagFilter",
             };
}

+ (NSValueTransformer *)tagFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectControlPlaneTagFilter class]];
}

@end

@implementation AWSConnectSendNotificationActionDefinition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             @"deliveryMethod" : @"DeliveryMethod",
             @"recipient" : @"Recipient",
             @"subject" : @"Subject",
             };
}

+ (NSValueTransformer *)contentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PLAIN_TEXT"] == NSOrderedSame) {
            return @(AWSConnectNotificationContentTypePlainText);
        }
        return @(AWSConnectNotificationContentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectNotificationContentTypePlainText:
                return @"PLAIN_TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deliveryMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSConnectNotificationDeliveryTypeEmail);
        }
        return @(AWSConnectNotificationDeliveryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectNotificationDeliveryTypeEmail:
                return @"EMAIL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recipientJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectNotificationRecipientType class]];
}

@end

@implementation AWSConnectStartChatContactRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"chatDurationInMinutes" : @"ChatDurationInMinutes",
             @"clientToken" : @"ClientToken",
             @"contactFlowId" : @"ContactFlowId",
             @"initialMessage" : @"InitialMessage",
             @"instanceId" : @"InstanceId",
             @"participantDetails" : @"ParticipantDetails",
             @"persistentChat" : @"PersistentChat",
             @"relatedContactId" : @"RelatedContactId",
             @"supportedMessagingContentTypes" : @"SupportedMessagingContentTypes",
             };
}

+ (NSValueTransformer *)initialMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectChatMessage class]];
}

+ (NSValueTransformer *)participantDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectParticipantDetails class]];
}

+ (NSValueTransformer *)persistentChatJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectPersistentChat class]];
}

@end

@implementation AWSConnectStartChatContactResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"continuedFromContactId" : @"ContinuedFromContactId",
             @"participantId" : @"ParticipantId",
             @"participantToken" : @"ParticipantToken",
             };
}

@end

@implementation AWSConnectStartContactRecordingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"initialContactId" : @"InitialContactId",
             @"instanceId" : @"InstanceId",
             @"voiceRecordingConfiguration" : @"VoiceRecordingConfiguration",
             };
}

+ (NSValueTransformer *)voiceRecordingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectVoiceRecordingConfiguration class]];
}

@end

@implementation AWSConnectStartContactRecordingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectStartContactStreamingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"chatStreamingConfiguration" : @"ChatStreamingConfiguration",
             @"clientToken" : @"ClientToken",
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             };
}

+ (NSValueTransformer *)chatStreamingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectChatStreamingConfiguration class]];
}

@end

@implementation AWSConnectStartContactStreamingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamingId" : @"StreamingId",
             };
}

@end

@implementation AWSConnectStartOutboundVoiceContactRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"answerMachineDetectionConfig" : @"AnswerMachineDetectionConfig",
             @"attributes" : @"Attributes",
             @"campaignId" : @"CampaignId",
             @"clientToken" : @"ClientToken",
             @"contactFlowId" : @"ContactFlowId",
             @"destinationPhoneNumber" : @"DestinationPhoneNumber",
             @"instanceId" : @"InstanceId",
             @"queueId" : @"QueueId",
             @"sourcePhoneNumber" : @"SourcePhoneNumber",
             @"trafficType" : @"TrafficType",
             };
}

+ (NSValueTransformer *)answerMachineDetectionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectAnswerMachineDetectionConfig class]];
}

+ (NSValueTransformer *)trafficTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GENERAL"] == NSOrderedSame) {
            return @(AWSConnectTrafficTypeGeneral);
        }
        if ([value caseInsensitiveCompare:@"CAMPAIGN"] == NSOrderedSame) {
            return @(AWSConnectTrafficTypeCampaign);
        }
        return @(AWSConnectTrafficTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectTrafficTypeGeneral:
                return @"GENERAL";
            case AWSConnectTrafficTypeCampaign:
                return @"CAMPAIGN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectStartOutboundVoiceContactResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             };
}

@end

@implementation AWSConnectStartTaskContactRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"clientToken" : @"ClientToken",
             @"contactFlowId" : @"ContactFlowId",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"previousContactId" : @"PreviousContactId",
             @"quickConnectId" : @"QuickConnectId",
             @"references" : @"References",
             @"relatedContactId" : @"RelatedContactId",
             @"scheduledTime" : @"ScheduledTime",
             @"taskTemplateId" : @"TaskTemplateId",
             };
}

+ (NSValueTransformer *)referencesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSConnectReference class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)scheduledTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSConnectStartTaskContactResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             };
}

@end

@implementation AWSConnectStopContactRecordingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"initialContactId" : @"InitialContactId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectStopContactRecordingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectStopContactRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectStopContactResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectStopContactStreamingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             @"streamingId" : @"StreamingId",
             };
}

@end

@implementation AWSConnectStopContactStreamingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectStringCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonType" : @"ComparisonType",
             @"fieldName" : @"FieldName",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)comparisonTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTS_WITH"] == NSOrderedSame) {
            return @(AWSConnectStringComparisonTypeStartsWith);
        }
        if ([value caseInsensitiveCompare:@"CONTAINS"] == NSOrderedSame) {
            return @(AWSConnectStringComparisonTypeContains);
        }
        if ([value caseInsensitiveCompare:@"EXACT"] == NSOrderedSame) {
            return @(AWSConnectStringComparisonTypeExact);
        }
        return @(AWSConnectStringComparisonTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectStringComparisonTypeStartsWith:
                return @"STARTS_WITH";
            case AWSConnectStringComparisonTypeContains:
                return @"CONTAINS";
            case AWSConnectStringComparisonTypeExact:
                return @"EXACT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectStringReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSConnectSuspendContactRecordingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"initialContactId" : @"InitialContactId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectSuspendContactRecordingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectTagCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagKey" : @"TagKey",
             @"tagValue" : @"TagValue",
             };
}

@end

@implementation AWSConnectTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSConnectTaskActionDefinition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowId" : @"ContactFlowId",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"references" : @"References",
             };
}

+ (NSValueTransformer *)referencesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSConnectReference class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSConnectTaskTemplateConstraints

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invisibleFields" : @"InvisibleFields",
             @"readOnlyFields" : @"ReadOnlyFields",
             @"requiredFields" : @"RequiredFields",
             };
}

+ (NSValueTransformer *)invisibleFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectInvisibleFieldInfo class]];
}

+ (NSValueTransformer *)readOnlyFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectReadOnlyFieldInfo class]];
}

+ (NSValueTransformer *)requiredFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRequiredFieldInfo class]];
}

@end

@implementation AWSConnectTaskTemplateDefaultFieldValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"DefaultValue",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)identifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateFieldIdentifier class]];
}

@end

@implementation AWSConnectTaskTemplateDefaults

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultFieldValues" : @"DefaultFieldValues",
             };
}

+ (NSValueTransformer *)defaultFieldValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectTaskTemplateDefaultFieldValue class]];
}

@end

@implementation AWSConnectTaskTemplateField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"singleSelectOptions" : @"SingleSelectOptions",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)identifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateFieldIdentifier class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeName);
        }
        if ([value caseInsensitiveCompare:@"DESCRIPTION"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeDescription);
        }
        if ([value caseInsensitiveCompare:@"SCHEDULED_TIME"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeScheduledTime);
        }
        if ([value caseInsensitiveCompare:@"QUICK_CONNECT"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeQuickConnect);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeUrl);
        }
        if ([value caseInsensitiveCompare:@"NUMBER"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeNumber);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeText);
        }
        if ([value caseInsensitiveCompare:@"TEXT_AREA"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeTextArea);
        }
        if ([value caseInsensitiveCompare:@"DATE_TIME"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeDateTime);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeBoolean);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_SELECT"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeSingleSelect);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateFieldTypeEmail);
        }
        return @(AWSConnectTaskTemplateFieldTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectTaskTemplateFieldTypeName:
                return @"NAME";
            case AWSConnectTaskTemplateFieldTypeDescription:
                return @"DESCRIPTION";
            case AWSConnectTaskTemplateFieldTypeScheduledTime:
                return @"SCHEDULED_TIME";
            case AWSConnectTaskTemplateFieldTypeQuickConnect:
                return @"QUICK_CONNECT";
            case AWSConnectTaskTemplateFieldTypeUrl:
                return @"URL";
            case AWSConnectTaskTemplateFieldTypeNumber:
                return @"NUMBER";
            case AWSConnectTaskTemplateFieldTypeText:
                return @"TEXT";
            case AWSConnectTaskTemplateFieldTypeTextArea:
                return @"TEXT_AREA";
            case AWSConnectTaskTemplateFieldTypeDateTime:
                return @"DATE_TIME";
            case AWSConnectTaskTemplateFieldTypeBoolean:
                return @"BOOLEAN";
            case AWSConnectTaskTemplateFieldTypeSingleSelect:
                return @"SINGLE_SELECT";
            case AWSConnectTaskTemplateFieldTypeEmail:
                return @"EMAIL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectTaskTemplateFieldIdentifier

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectTaskTemplateMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusInactive);
        }
        return @(AWSConnectTaskTemplateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectTaskTemplateStatusActive:
                return @"ACTIVE";
            case AWSConnectTaskTemplateStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectTelephonyConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributions" : @"Distributions",
             };
}

+ (NSValueTransformer *)distributionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectDistribution class]];
}

@end

@implementation AWSConnectThreshold

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparison" : @"Comparison",
             @"thresholdValue" : @"ThresholdValue",
             };
}

+ (NSValueTransformer *)comparisonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSConnectComparisonLT);
        }
        return @(AWSConnectComparisonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectComparisonLT:
                return @"LT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectThresholdV2

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparison" : @"Comparison",
             @"thresholdValue" : @"ThresholdValue",
             };
}

@end

@implementation AWSConnectTrafficDistributionGroup

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"instanceArn" : @"InstanceArn",
             @"name" : @"Name",
             @"status" : @"Status",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusActive);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"PENDING_DELETION"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusPendingDeletion);
        }
        if ([value caseInsensitiveCompare:@"DELETION_FAILED"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusDeletionFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusUpdateInProgress);
        }
        return @(AWSConnectTrafficDistributionGroupStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectTrafficDistributionGroupStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSConnectTrafficDistributionGroupStatusActive:
                return @"ACTIVE";
            case AWSConnectTrafficDistributionGroupStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSConnectTrafficDistributionGroupStatusPendingDeletion:
                return @"PENDING_DELETION";
            case AWSConnectTrafficDistributionGroupStatusDeletionFailed:
                return @"DELETION_FAILED";
            case AWSConnectTrafficDistributionGroupStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectTrafficDistributionGroupSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"instanceArn" : @"InstanceArn",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusActive);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"PENDING_DELETION"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusPendingDeletion);
        }
        if ([value caseInsensitiveCompare:@"DELETION_FAILED"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusDeletionFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectTrafficDistributionGroupStatusUpdateInProgress);
        }
        return @(AWSConnectTrafficDistributionGroupStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectTrafficDistributionGroupStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSConnectTrafficDistributionGroupStatusActive:
                return @"ACTIVE";
            case AWSConnectTrafficDistributionGroupStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSConnectTrafficDistributionGroupStatusPendingDeletion:
                return @"PENDING_DELETION";
            case AWSConnectTrafficDistributionGroupStatusDeletionFailed:
                return @"DELETION_FAILED";
            case AWSConnectTrafficDistributionGroupStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectTransferContactRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"contactFlowId" : @"ContactFlowId",
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             @"queueId" : @"QueueId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectTransferContactResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactArn" : @"ContactArn",
             @"contactId" : @"ContactId",
             };
}

@end

@implementation AWSConnectUntagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSConnectUpdateAgentStatusRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"agentStatusId" : @"AgentStatusId",
             @"detail" : @"Description",
             @"displayOrder" : @"DisplayOrder",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"resetOrderNumber" : @"ResetOrderNumber",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSConnectAgentStatusStateDisabled);
        }
        return @(AWSConnectAgentStatusStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectAgentStatusStateEnabled:
                return @"ENABLED";
            case AWSConnectAgentStatusStateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectUpdateContactAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"initialContactId" : @"InitialContactId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectUpdateContactAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectUpdateContactFlowContentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowId" : @"ContactFlowId",
             @"content" : @"Content",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectUpdateContactFlowContentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectUpdateContactFlowMetadataRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowId" : @"ContactFlowId",
             @"contactFlowState" : @"ContactFlowState",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)contactFlowStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectContactFlowStateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSConnectContactFlowStateArchived);
        }
        return @(AWSConnectContactFlowStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactFlowStateActive:
                return @"ACTIVE";
            case AWSConnectContactFlowStateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectUpdateContactFlowMetadataResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectUpdateContactFlowModuleContentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowModuleId" : @"ContactFlowModuleId",
             @"content" : @"Content",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectUpdateContactFlowModuleContentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectUpdateContactFlowModuleMetadataRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowModuleId" : @"ContactFlowModuleId",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectContactFlowModuleStateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSConnectContactFlowModuleStateArchived);
        }
        return @(AWSConnectContactFlowModuleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectContactFlowModuleStateActive:
                return @"ACTIVE";
            case AWSConnectContactFlowModuleStateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectUpdateContactFlowModuleMetadataResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectUpdateContactFlowNameRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowId" : @"ContactFlowId",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectUpdateContactFlowNameResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectUpdateContactRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"references" : @"References",
             };
}

+ (NSValueTransformer *)referencesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSConnectReference class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSConnectUpdateContactResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectUpdateContactScheduleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             @"scheduledTime" : @"ScheduledTime",
             };
}

+ (NSValueTransformer *)scheduledTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSConnectUpdateContactScheduleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectUpdateHoursOfOperationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"config" : @"Config",
             @"detail" : @"Description",
             @"hoursOfOperationId" : @"HoursOfOperationId",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"timeZone" : @"TimeZone",
             };
}

+ (NSValueTransformer *)configJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectHoursOfOperationConfig class]];
}

@end

@implementation AWSConnectUpdateInstanceAttributeRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeType" : @"AttributeType",
             @"instanceId" : @"InstanceId",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)attributeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INBOUND_CALLS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeInboundCalls);
        }
        if ([value caseInsensitiveCompare:@"OUTBOUND_CALLS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeOutboundCalls);
        }
        if ([value caseInsensitiveCompare:@"CONTACTFLOW_LOGS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeContactflowLogs);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_LENS"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeContactLens);
        }
        if ([value caseInsensitiveCompare:@"AUTO_RESOLVE_BEST_VOICES"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeAutoResolveBestVoices);
        }
        if ([value caseInsensitiveCompare:@"USE_CUSTOM_TTS_VOICES"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeUseCustomTtsVoices);
        }
        if ([value caseInsensitiveCompare:@"EARLY_MEDIA"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeEarlyMedia);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PARTY_CONFERENCE"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeMultiPartyConference);
        }
        if ([value caseInsensitiveCompare:@"HIGH_VOLUME_OUTBOUND"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeHighVolumeOutbound);
        }
        if ([value caseInsensitiveCompare:@"ENHANCED_CONTACT_MONITORING"] == NSOrderedSame) {
            return @(AWSConnectInstanceAttributeTypeEnhancedContactMonitoring);
        }
        return @(AWSConnectInstanceAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectInstanceAttributeTypeInboundCalls:
                return @"INBOUND_CALLS";
            case AWSConnectInstanceAttributeTypeOutboundCalls:
                return @"OUTBOUND_CALLS";
            case AWSConnectInstanceAttributeTypeContactflowLogs:
                return @"CONTACTFLOW_LOGS";
            case AWSConnectInstanceAttributeTypeContactLens:
                return @"CONTACT_LENS";
            case AWSConnectInstanceAttributeTypeAutoResolveBestVoices:
                return @"AUTO_RESOLVE_BEST_VOICES";
            case AWSConnectInstanceAttributeTypeUseCustomTtsVoices:
                return @"USE_CUSTOM_TTS_VOICES";
            case AWSConnectInstanceAttributeTypeEarlyMedia:
                return @"EARLY_MEDIA";
            case AWSConnectInstanceAttributeTypeMultiPartyConference:
                return @"MULTI_PARTY_CONFERENCE";
            case AWSConnectInstanceAttributeTypeHighVolumeOutbound:
                return @"HIGH_VOLUME_OUTBOUND";
            case AWSConnectInstanceAttributeTypeEnhancedContactMonitoring:
                return @"ENHANCED_CONTACT_MONITORING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectUpdateInstanceStorageConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"instanceId" : @"InstanceId",
             @"resourceType" : @"ResourceType",
             @"storageConfig" : @"StorageConfig",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHAT_TRANSCRIPTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeChatTranscripts);
        }
        if ([value caseInsensitiveCompare:@"CALL_RECORDINGS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeCallRecordings);
        }
        if ([value caseInsensitiveCompare:@"SCHEDULED_REPORTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeScheduledReports);
        }
        if ([value caseInsensitiveCompare:@"MEDIA_STREAMS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeMediaStreams);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_TRACE_RECORDS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeContactTraceRecords);
        }
        if ([value caseInsensitiveCompare:@"AGENT_EVENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeAgentEvents);
        }
        if ([value caseInsensitiveCompare:@"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeRealTimeContactAnalysisSegments);
        }
        if ([value caseInsensitiveCompare:@"ATTACHMENTS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeAttachments);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_EVALUATIONS"] == NSOrderedSame) {
            return @(AWSConnectInstanceStorageResourceTypeContactEvaluations);
        }
        return @(AWSConnectInstanceStorageResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectInstanceStorageResourceTypeChatTranscripts:
                return @"CHAT_TRANSCRIPTS";
            case AWSConnectInstanceStorageResourceTypeCallRecordings:
                return @"CALL_RECORDINGS";
            case AWSConnectInstanceStorageResourceTypeScheduledReports:
                return @"SCHEDULED_REPORTS";
            case AWSConnectInstanceStorageResourceTypeMediaStreams:
                return @"MEDIA_STREAMS";
            case AWSConnectInstanceStorageResourceTypeContactTraceRecords:
                return @"CONTACT_TRACE_RECORDS";
            case AWSConnectInstanceStorageResourceTypeAgentEvents:
                return @"AGENT_EVENTS";
            case AWSConnectInstanceStorageResourceTypeRealTimeContactAnalysisSegments:
                return @"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS";
            case AWSConnectInstanceStorageResourceTypeAttachments:
                return @"ATTACHMENTS";
            case AWSConnectInstanceStorageResourceTypeContactEvaluations:
                return @"CONTACT_EVALUATIONS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectInstanceStorageConfig class]];
}

@end

@implementation AWSConnectUpdateParticipantRoleConfigChannelInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"chat" : @"Chat",
             };
}

+ (NSValueTransformer *)chatJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectChatParticipantRoleConfig class]];
}

@end

@implementation AWSConnectUpdateParticipantRoleConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelConfiguration" : @"ChannelConfiguration",
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             };
}

+ (NSValueTransformer *)channelConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUpdateParticipantRoleConfigChannelInfo class]];
}

@end

@implementation AWSConnectUpdateParticipantRoleConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectUpdatePhoneNumberRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"phoneNumberId" : @"PhoneNumberId",
             @"targetArn" : @"TargetArn",
             };
}

@end

@implementation AWSConnectUpdatePhoneNumberResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberArn" : @"PhoneNumberArn",
             @"phoneNumberId" : @"PhoneNumberId",
             };
}

@end

@implementation AWSConnectUpdateQueueHoursOfOperationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hoursOfOperationId" : @"HoursOfOperationId",
             @"instanceId" : @"InstanceId",
             @"queueId" : @"QueueId",
             };
}

@end

@implementation AWSConnectUpdateQueueMaxContactsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxContacts" : @"MaxContacts",
             @"queueId" : @"QueueId",
             };
}

@end

@implementation AWSConnectUpdateQueueNameRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"queueId" : @"QueueId",
             };
}

@end

@implementation AWSConnectUpdateQueueOutboundCallerConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"outboundCallerConfig" : @"OutboundCallerConfig",
             @"queueId" : @"QueueId",
             };
}

+ (NSValueTransformer *)outboundCallerConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectOutboundCallerConfig class]];
}

@end

@implementation AWSConnectUpdateQueueStatusRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"queueId" : @"QueueId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSConnectQueueStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSConnectQueueStatusDisabled);
        }
        return @(AWSConnectQueueStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectQueueStatusEnabled:
                return @"ENABLED";
            case AWSConnectQueueStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectUpdateQuickConnectConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"quickConnectConfig" : @"QuickConnectConfig",
             @"quickConnectId" : @"QuickConnectId",
             };
}

+ (NSValueTransformer *)quickConnectConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQuickConnectConfig class]];
}

@end

@implementation AWSConnectUpdateQuickConnectNameRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"quickConnectId" : @"QuickConnectId",
             };
}

@end

@implementation AWSConnectUpdateRoutingProfileConcurrencyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"mediaConcurrencies" : @"MediaConcurrencies",
             @"routingProfileId" : @"RoutingProfileId",
             };
}

+ (NSValueTransformer *)mediaConcurrenciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectMediaConcurrency class]];
}

@end

@implementation AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultOutboundQueueId" : @"DefaultOutboundQueueId",
             @"instanceId" : @"InstanceId",
             @"routingProfileId" : @"RoutingProfileId",
             };
}

@end

@implementation AWSConnectUpdateRoutingProfileNameRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"routingProfileId" : @"RoutingProfileId",
             };
}

@end

@implementation AWSConnectUpdateRoutingProfileQueuesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"queueConfigs" : @"QueueConfigs",
             @"routingProfileId" : @"RoutingProfileId",
             };
}

+ (NSValueTransformer *)queueConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRoutingProfileQueueConfig class]];
}

@end

@implementation AWSConnectUpdateRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"function" : @"Function",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"publishStatus" : @"PublishStatus",
             @"ruleId" : @"RuleId",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectRuleAction class]];
}

+ (NSValueTransformer *)publishStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSConnectRulePublishStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"PUBLISHED"] == NSOrderedSame) {
            return @(AWSConnectRulePublishStatusPublished);
        }
        return @(AWSConnectRulePublishStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectRulePublishStatusDraft:
                return @"DRAFT";
            case AWSConnectRulePublishStatusPublished:
                return @"PUBLISHED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectUpdateSecurityProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedAccessControlTags" : @"AllowedAccessControlTags",
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"permissions" : @"Permissions",
             @"securityProfileId" : @"SecurityProfileId",
             @"tagRestrictedResources" : @"TagRestrictedResources",
             };
}

@end

@implementation AWSConnectUpdateTaskTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraints" : @"Constraints",
             @"contactFlowId" : @"ContactFlowId",
             @"defaults" : @"Defaults",
             @"detail" : @"Description",
             @"fields" : @"Fields",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"status" : @"Status",
             @"taskTemplateId" : @"TaskTemplateId",
             };
}

+ (NSValueTransformer *)constraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateConstraints class]];
}

+ (NSValueTransformer *)defaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateDefaults class]];
}

+ (NSValueTransformer *)fieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectTaskTemplateField class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusInactive);
        }
        return @(AWSConnectTaskTemplateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectTaskTemplateStatusActive:
                return @"ACTIVE";
            case AWSConnectTaskTemplateStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectUpdateTaskTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"constraints" : @"Constraints",
             @"contactFlowId" : @"ContactFlowId",
             @"createdTime" : @"CreatedTime",
             @"defaults" : @"Defaults",
             @"detail" : @"Description",
             @"fields" : @"Fields",
             @"identifier" : @"Id",
             @"instanceId" : @"InstanceId",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)constraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateConstraints class]];
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)defaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTaskTemplateDefaults class]];
}

+ (NSValueTransformer *)fieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectTaskTemplateField class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSConnectTaskTemplateStatusInactive);
        }
        return @(AWSConnectTaskTemplateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectTaskTemplateStatusActive:
                return @"ACTIVE";
            case AWSConnectTaskTemplateStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectUpdateTrafficDistributionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"telephonyConfig" : @"TelephonyConfig",
             };
}

+ (NSValueTransformer *)telephonyConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectTelephonyConfig class]];
}

@end

@implementation AWSConnectUpdateTrafficDistributionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectUpdateUserHierarchyGroupNameRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyGroupId" : @"HierarchyGroupId",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectUpdateUserHierarchyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyGroupId" : @"HierarchyGroupId",
             @"instanceId" : @"InstanceId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectUpdateUserHierarchyStructureRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyStructure" : @"HierarchyStructure",
             @"instanceId" : @"InstanceId",
             };
}

+ (NSValueTransformer *)hierarchyStructureJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyStructureUpdate class]];
}

@end

@implementation AWSConnectUpdateUserIdentityInfoRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityInfo" : @"IdentityInfo",
             @"instanceId" : @"InstanceId",
             @"userId" : @"UserId",
             };
}

+ (NSValueTransformer *)identityInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserIdentityInfo class]];
}

@end

@implementation AWSConnectUpdateUserPhoneConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"phoneConfig" : @"PhoneConfig",
             @"userId" : @"UserId",
             };
}

+ (NSValueTransformer *)phoneConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserPhoneConfig class]];
}

@end

@implementation AWSConnectUpdateUserRoutingProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"routingProfileId" : @"RoutingProfileId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectUpdateUserSecurityProfilesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"securityProfileIds" : @"SecurityProfileIds",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectUrlReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSConnectUseCase

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"useCaseArn" : @"UseCaseArn",
             @"useCaseId" : @"UseCaseId",
             @"useCaseType" : @"UseCaseType",
             };
}

+ (NSValueTransformer *)useCaseTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RULES_EVALUATION"] == NSOrderedSame) {
            return @(AWSConnectUseCaseTypeRulesEvaluation);
        }
        if ([value caseInsensitiveCompare:@"CONNECT_CAMPAIGNS"] == NSOrderedSame) {
            return @(AWSConnectUseCaseTypeConnectCampaigns);
        }
        return @(AWSConnectUseCaseTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectUseCaseTypeRulesEvaluation:
                return @"RULES_EVALUATION";
            case AWSConnectUseCaseTypeConnectCampaigns:
                return @"CONNECT_CAMPAIGNS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectUser

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"directoryUserId" : @"DirectoryUserId",
             @"hierarchyGroupId" : @"HierarchyGroupId",
             @"identifier" : @"Id",
             @"identityInfo" : @"IdentityInfo",
             @"phoneConfig" : @"PhoneConfig",
             @"routingProfileId" : @"RoutingProfileId",
             @"securityProfileIds" : @"SecurityProfileIds",
             @"tags" : @"Tags",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)identityInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserIdentityInfo class]];
}

+ (NSValueTransformer *)phoneConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserPhoneConfig class]];
}

@end

@implementation AWSConnectUserData

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeSlotsByChannel" : @"ActiveSlotsByChannel",
             @"availableSlotsByChannel" : @"AvailableSlotsByChannel",
             @"contacts" : @"Contacts",
             @"hierarchyPath" : @"HierarchyPath",
             @"maxSlotsByChannel" : @"MaxSlotsByChannel",
             @"nextStatus" : @"NextStatus",
             @"routingProfile" : @"RoutingProfile",
             @"status" : @"Status",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)contactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectAgentContactReference class]];
}

+ (NSValueTransformer *)hierarchyPathJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyPathReference class]];
}

+ (NSValueTransformer *)routingProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectRoutingProfileReference class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectAgentStatusReference class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserReference class]];
}

@end

@implementation AWSConnectUserDataFilters

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"agents" : @"Agents",
             @"contactFilter" : @"ContactFilter",
             @"queues" : @"Queues",
             @"routingProfiles" : @"RoutingProfiles",
             @"userHierarchyGroups" : @"UserHierarchyGroups",
             };
}

+ (NSValueTransformer *)contactFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectContactFilter class]];
}

@end

@implementation AWSConnectUserIdentityInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"email" : @"Email",
             @"firstName" : @"FirstName",
             @"lastName" : @"LastName",
             @"mobile" : @"Mobile",
             @"secondaryEmail" : @"SecondaryEmail",
             };
}

@end

@implementation AWSConnectUserIdentityInfoLite

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"firstName" : @"FirstName",
             @"lastName" : @"LastName",
             };
}

@end

@implementation AWSConnectUserPhoneConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterContactWorkTimeLimit" : @"AfterContactWorkTimeLimit",
             @"autoAccept" : @"AutoAccept",
             @"deskPhoneNumber" : @"DeskPhoneNumber",
             @"phoneType" : @"PhoneType",
             };
}

+ (NSValueTransformer *)phoneTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOFT_PHONE"] == NSOrderedSame) {
            return @(AWSConnectPhoneTypeSoftPhone);
        }
        if ([value caseInsensitiveCompare:@"DESK_PHONE"] == NSOrderedSame) {
            return @(AWSConnectPhoneTypeDeskPhone);
        }
        return @(AWSConnectPhoneTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectPhoneTypeSoftPhone:
                return @"SOFT_PHONE";
            case AWSConnectPhoneTypeDeskPhone:
                return @"DESK_PHONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectUserQuickConnectConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactFlowId" : @"ContactFlowId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectUserReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectUserSearchCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"andConditions" : @"AndConditions",
             @"hierarchyGroupCondition" : @"HierarchyGroupCondition",
             @"orConditions" : @"OrConditions",
             @"stringCondition" : @"StringCondition",
             };
}

+ (NSValueTransformer *)andConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectUserSearchCriteria class]];
}

+ (NSValueTransformer *)hierarchyGroupConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyGroupCondition class]];
}

+ (NSValueTransformer *)orConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectUserSearchCriteria class]];
}

+ (NSValueTransformer *)stringConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectStringCondition class]];
}

@end

@implementation AWSConnectUserSearchFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagFilter" : @"TagFilter",
             };
}

+ (NSValueTransformer *)tagFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectControlPlaneTagFilter class]];
}

@end

@implementation AWSConnectUserSearchSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"directoryUserId" : @"DirectoryUserId",
             @"hierarchyGroupId" : @"HierarchyGroupId",
             @"identifier" : @"Id",
             @"identityInfo" : @"IdentityInfo",
             @"phoneConfig" : @"PhoneConfig",
             @"routingProfileId" : @"RoutingProfileId",
             @"securityProfileIds" : @"SecurityProfileIds",
             @"tags" : @"Tags",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)identityInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserIdentityInfoLite class]];
}

+ (NSValueTransformer *)phoneConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectUserPhoneConfig class]];
}

@end

@implementation AWSConnectUserSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"username" : @"Username",
             };
}

@end

@implementation AWSConnectVocabulary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"content" : @"Content",
             @"failureReason" : @"FailureReason",
             @"identifier" : @"Id",
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"name" : @"Name",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"en-NZ"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnNZ);
        }
        if ([value caseInsensitiveCompare:@"en-ZA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnZA);
        }
        return @(AWSConnectVocabularyLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyLanguageCodeArAE:
                return @"ar-AE";
            case AWSConnectVocabularyLanguageCodeDeCH:
                return @"de-CH";
            case AWSConnectVocabularyLanguageCodeDeDE:
                return @"de-DE";
            case AWSConnectVocabularyLanguageCodeEnAB:
                return @"en-AB";
            case AWSConnectVocabularyLanguageCodeEnAU:
                return @"en-AU";
            case AWSConnectVocabularyLanguageCodeEnGB:
                return @"en-GB";
            case AWSConnectVocabularyLanguageCodeEnIE:
                return @"en-IE";
            case AWSConnectVocabularyLanguageCodeEnIN:
                return @"en-IN";
            case AWSConnectVocabularyLanguageCodeEnUS:
                return @"en-US";
            case AWSConnectVocabularyLanguageCodeEnWL:
                return @"en-WL";
            case AWSConnectVocabularyLanguageCodeEsES:
                return @"es-ES";
            case AWSConnectVocabularyLanguageCodeEsUS:
                return @"es-US";
            case AWSConnectVocabularyLanguageCodeFrCA:
                return @"fr-CA";
            case AWSConnectVocabularyLanguageCodeFrFR:
                return @"fr-FR";
            case AWSConnectVocabularyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSConnectVocabularyLanguageCodeItIT:
                return @"it-IT";
            case AWSConnectVocabularyLanguageCodeJaJP:
                return @"ja-JP";
            case AWSConnectVocabularyLanguageCodeKoKR:
                return @"ko-KR";
            case AWSConnectVocabularyLanguageCodePtBR:
                return @"pt-BR";
            case AWSConnectVocabularyLanguageCodePtPT:
                return @"pt-PT";
            case AWSConnectVocabularyLanguageCodeZhCN:
                return @"zh-CN";
            case AWSConnectVocabularyLanguageCodeEnNZ:
                return @"en-NZ";
            case AWSConnectVocabularyLanguageCodeEnZA:
                return @"en-ZA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateActive);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateDeleteInProgress);
        }
        return @(AWSConnectVocabularyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyStateCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSConnectVocabularyStateActive:
                return @"ACTIVE";
            case AWSConnectVocabularyStateCreationFailed:
                return @"CREATION_FAILED";
            case AWSConnectVocabularyStateDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectVocabularySummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"failureReason" : @"FailureReason",
             @"identifier" : @"Id",
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"en-NZ"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnNZ);
        }
        if ([value caseInsensitiveCompare:@"en-ZA"] == NSOrderedSame) {
            return @(AWSConnectVocabularyLanguageCodeEnZA);
        }
        return @(AWSConnectVocabularyLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyLanguageCodeArAE:
                return @"ar-AE";
            case AWSConnectVocabularyLanguageCodeDeCH:
                return @"de-CH";
            case AWSConnectVocabularyLanguageCodeDeDE:
                return @"de-DE";
            case AWSConnectVocabularyLanguageCodeEnAB:
                return @"en-AB";
            case AWSConnectVocabularyLanguageCodeEnAU:
                return @"en-AU";
            case AWSConnectVocabularyLanguageCodeEnGB:
                return @"en-GB";
            case AWSConnectVocabularyLanguageCodeEnIE:
                return @"en-IE";
            case AWSConnectVocabularyLanguageCodeEnIN:
                return @"en-IN";
            case AWSConnectVocabularyLanguageCodeEnUS:
                return @"en-US";
            case AWSConnectVocabularyLanguageCodeEnWL:
                return @"en-WL";
            case AWSConnectVocabularyLanguageCodeEsES:
                return @"es-ES";
            case AWSConnectVocabularyLanguageCodeEsUS:
                return @"es-US";
            case AWSConnectVocabularyLanguageCodeFrCA:
                return @"fr-CA";
            case AWSConnectVocabularyLanguageCodeFrFR:
                return @"fr-FR";
            case AWSConnectVocabularyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSConnectVocabularyLanguageCodeItIT:
                return @"it-IT";
            case AWSConnectVocabularyLanguageCodeJaJP:
                return @"ja-JP";
            case AWSConnectVocabularyLanguageCodeKoKR:
                return @"ko-KR";
            case AWSConnectVocabularyLanguageCodePtBR:
                return @"pt-BR";
            case AWSConnectVocabularyLanguageCodePtPT:
                return @"pt-PT";
            case AWSConnectVocabularyLanguageCodeZhCN:
                return @"zh-CN";
            case AWSConnectVocabularyLanguageCodeEnNZ:
                return @"en-NZ";
            case AWSConnectVocabularyLanguageCodeEnZA:
                return @"en-ZA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateActive);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectVocabularyStateDeleteInProgress);
        }
        return @(AWSConnectVocabularyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVocabularyStateCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSConnectVocabularyStateActive:
                return @"ACTIVE";
            case AWSConnectVocabularyStateCreationFailed:
                return @"CREATION_FAILED";
            case AWSConnectVocabularyStateDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectVoiceRecordingConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceRecordingTrack" : @"VoiceRecordingTrack",
             };
}

+ (NSValueTransformer *)voiceRecordingTrackJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FROM_AGENT"] == NSOrderedSame) {
            return @(AWSConnectVoiceRecordingTrackFromAgent);
        }
        if ([value caseInsensitiveCompare:@"TO_AGENT"] == NSOrderedSame) {
            return @(AWSConnectVoiceRecordingTrackToAgent);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSConnectVoiceRecordingTrackAll);
        }
        return @(AWSConnectVoiceRecordingTrackUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectVoiceRecordingTrackFromAgent:
                return @"FROM_AGENT";
            case AWSConnectVoiceRecordingTrackToAgent:
                return @"TO_AGENT";
            case AWSConnectVoiceRecordingTrackAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectWisdomInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionArn" : @"SessionArn",
             };
}

@end
