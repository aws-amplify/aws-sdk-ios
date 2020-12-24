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

#import "AWSConnectModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSConnectErrorDomain = @"com.amazonaws.AWSConnectErrorDomain";

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

@implementation AWSConnectContactFlowSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"contactFlowType" : @"ContactFlowType",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
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
             };
}

+ (NSValueTransformer *)integrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSConnectIntegrationTypeEvent);
        }
        return @(AWSConnectIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectIntegrationTypeEvent:
                return @"EVENT";
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

@implementation AWSConnectCreateUseCaseRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"integrationAssociationId" : @"IntegrationAssociationId",
             @"useCaseType" : @"UseCaseType",
             };
}

+ (NSValueTransformer *)useCaseTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RULES_EVALUATION"] == NSOrderedSame) {
            return @(AWSConnectUseCaseTypeRulesEvaluation);
        }
        return @(AWSConnectUseCaseTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectUseCaseTypeRulesEvaluation:
                return @"RULES_EVALUATION";
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

@implementation AWSConnectDimensions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             @"queue" : @"Queue",
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

@implementation AWSConnectFilters

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"queues" : @"Queues",
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
             };
}

+ (NSValueTransformer *)currentMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectCurrentMetric class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectFilters class]];
}

@end

@implementation AWSConnectGetCurrentMetricDataResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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
             };
}

+ (NSValueTransformer *)hierarchyPathJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectHierarchyPath class]];
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
        return @(AWSConnectIntegrationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectIntegrationTypeEvent:
                return @"EVENT";
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
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
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
        return @(AWSConnectReferenceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectReferenceTypeUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
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

@implementation AWSConnectStartChatContactRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"clientToken" : @"ClientToken",
             @"contactFlowId" : @"ContactFlowId",
             @"initialMessage" : @"InitialMessage",
             @"instanceId" : @"InstanceId",
             @"participantDetails" : @"ParticipantDetails",
             };
}

+ (NSValueTransformer *)initialMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectChatMessage class]];
}

+ (NSValueTransformer *)participantDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectParticipantDetails class]];
}

@end

@implementation AWSConnectStartChatContactResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
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

@implementation AWSConnectStartOutboundVoiceContactRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"clientToken" : @"ClientToken",
             @"contactFlowId" : @"ContactFlowId",
             @"destinationPhoneNumber" : @"DestinationPhoneNumber",
             @"instanceId" : @"InstanceId",
             @"queueId" : @"QueueId",
             @"sourcePhoneNumber" : @"SourcePhoneNumber",
             };
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectInstanceStorageConfig class]];
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
        return @(AWSConnectUseCaseTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectUseCaseTypeRulesEvaluation:
                return @"RULES_EVALUATION";
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

@implementation AWSConnectUserIdentityInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"email" : @"Email",
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
