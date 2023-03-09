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

#import "AWSConnectParticipantModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSConnectParticipantErrorDomain = @"com.amazonaws.AWSConnectParticipantErrorDomain";

@implementation AWSConnectParticipantAttachmentItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentId" : @"AttachmentId",
             @"attachmentName" : @"AttachmentName",
             @"contentType" : @"ContentType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APPROVED"] == NSOrderedSame) {
            return @(AWSConnectParticipantArtifactStatusApproved);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSConnectParticipantArtifactStatusRejected);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSConnectParticipantArtifactStatusInProgress);
        }
        return @(AWSConnectParticipantArtifactStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectParticipantArtifactStatusApproved:
                return @"APPROVED";
            case AWSConnectParticipantArtifactStatusRejected:
                return @"REJECTED";
            case AWSConnectParticipantArtifactStatusInProgress:
                return @"IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectParticipantCompleteAttachmentUploadRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentIds" : @"AttachmentIds",
             @"clientToken" : @"ClientToken",
             @"connectionToken" : @"ConnectionToken",
             };
}

@end

@implementation AWSConnectParticipantCompleteAttachmentUploadResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectParticipantConnectionCredentials

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionToken" : @"ConnectionToken",
             @"expiry" : @"Expiry",
             };
}

@end

@implementation AWSConnectParticipantCreateParticipantConnectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectParticipant" : @"ConnectParticipant",
             @"participantToken" : @"ParticipantToken",
             @"types" : @"Type",
             };
}

@end

@implementation AWSConnectParticipantCreateParticipantConnectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionCredentials" : @"ConnectionCredentials",
             @"websocket" : @"Websocket",
             };
}

+ (NSValueTransformer *)connectionCredentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectParticipantConnectionCredentials class]];
}

+ (NSValueTransformer *)websocketJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectParticipantWebsocket class]];
}

@end

@implementation AWSConnectParticipantDisconnectParticipantRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"connectionToken" : @"ConnectionToken",
             };
}

@end

@implementation AWSConnectParticipantDisconnectParticipantResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSConnectParticipantGetAttachmentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentId" : @"AttachmentId",
             @"connectionToken" : @"ConnectionToken",
             };
}

@end

@implementation AWSConnectParticipantGetAttachmentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"url" : @"Url",
             @"urlExpiry" : @"UrlExpiry",
             };
}

@end

@implementation AWSConnectParticipantGetTranscriptRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionToken" : @"ConnectionToken",
             @"contactId" : @"ContactId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"scanDirection" : @"ScanDirection",
             @"sortOrder" : @"SortOrder",
             @"startPosition" : @"StartPosition",
             };
}

+ (NSValueTransformer *)scanDirectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FORWARD"] == NSOrderedSame) {
            return @(AWSConnectParticipantScanDirectionForward);
        }
        if ([value caseInsensitiveCompare:@"BACKWARD"] == NSOrderedSame) {
            return @(AWSConnectParticipantScanDirectionBackward);
        }
        return @(AWSConnectParticipantScanDirectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectParticipantScanDirectionForward:
                return @"FORWARD";
            case AWSConnectParticipantScanDirectionBackward:
                return @"BACKWARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSConnectParticipantSortKeyDescending);
        }
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSConnectParticipantSortKeyAscending);
        }
        return @(AWSConnectParticipantSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectParticipantSortKeyDescending:
                return @"DESCENDING";
            case AWSConnectParticipantSortKeyAscending:
                return @"ASCENDING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startPositionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectParticipantStartPosition class]];
}

@end

@implementation AWSConnectParticipantGetTranscriptResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initialContactId" : @"InitialContactId",
             @"nextToken" : @"NextToken",
             @"transcript" : @"Transcript",
             };
}

+ (NSValueTransformer *)transcriptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectParticipantItem class]];
}

@end

@implementation AWSConnectParticipantItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absoluteTime" : @"AbsoluteTime",
             @"attachments" : @"Attachments",
             @"contactId" : @"ContactId",
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             @"displayName" : @"DisplayName",
             @"identifier" : @"Id",
             @"messageMetadata" : @"MessageMetadata",
             @"participantId" : @"ParticipantId",
             @"participantRole" : @"ParticipantRole",
             @"relatedContactId" : @"RelatedContactId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)attachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectParticipantAttachmentItem class]];
}

+ (NSValueTransformer *)messageMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectParticipantMessageMetadata class]];
}

+ (NSValueTransformer *)participantRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AGENT"] == NSOrderedSame) {
            return @(AWSConnectParticipantParticipantRoleAgent);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER"] == NSOrderedSame) {
            return @(AWSConnectParticipantParticipantRoleCustomer);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSConnectParticipantParticipantRoleSystem);
        }
        return @(AWSConnectParticipantParticipantRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectParticipantParticipantRoleAgent:
                return @"AGENT";
            case AWSConnectParticipantParticipantRoleCustomer:
                return @"CUSTOMER";
            case AWSConnectParticipantParticipantRoleSystem:
                return @"SYSTEM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TYPING"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeTyping);
        }
        if ([value caseInsensitiveCompare:@"PARTICIPANT_JOINED"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeParticipantJoined);
        }
        if ([value caseInsensitiveCompare:@"PARTICIPANT_LEFT"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeParticipantLeft);
        }
        if ([value caseInsensitiveCompare:@"CHAT_ENDED"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeChatEnded);
        }
        if ([value caseInsensitiveCompare:@"TRANSFER_SUCCEEDED"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeTransferSucceeded);
        }
        if ([value caseInsensitiveCompare:@"TRANSFER_FAILED"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeTransferFailed);
        }
        if ([value caseInsensitiveCompare:@"MESSAGE"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeMessage);
        }
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeEvent);
        }
        if ([value caseInsensitiveCompare:@"ATTACHMENT"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeAttachment);
        }
        if ([value caseInsensitiveCompare:@"CONNECTION_ACK"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeConnectionAck);
        }
        if ([value caseInsensitiveCompare:@"MESSAGE_DELIVERED"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeMessageDelivered);
        }
        if ([value caseInsensitiveCompare:@"MESSAGE_READ"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeMessageRead);
        }
        return @(AWSConnectParticipantChatItemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectParticipantChatItemTypeTyping:
                return @"TYPING";
            case AWSConnectParticipantChatItemTypeParticipantJoined:
                return @"PARTICIPANT_JOINED";
            case AWSConnectParticipantChatItemTypeParticipantLeft:
                return @"PARTICIPANT_LEFT";
            case AWSConnectParticipantChatItemTypeChatEnded:
                return @"CHAT_ENDED";
            case AWSConnectParticipantChatItemTypeTransferSucceeded:
                return @"TRANSFER_SUCCEEDED";
            case AWSConnectParticipantChatItemTypeTransferFailed:
                return @"TRANSFER_FAILED";
            case AWSConnectParticipantChatItemTypeMessage:
                return @"MESSAGE";
            case AWSConnectParticipantChatItemTypeEvent:
                return @"EVENT";
            case AWSConnectParticipantChatItemTypeAttachment:
                return @"ATTACHMENT";
            case AWSConnectParticipantChatItemTypeConnectionAck:
                return @"CONNECTION_ACK";
            case AWSConnectParticipantChatItemTypeMessageDelivered:
                return @"MESSAGE_DELIVERED";
            case AWSConnectParticipantChatItemTypeMessageRead:
                return @"MESSAGE_READ";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectParticipantMessageMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             @"receipts" : @"Receipts",
             };
}

+ (NSValueTransformer *)receiptsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSConnectParticipantReceipt class]];
}

@end

@implementation AWSConnectParticipantReceipt

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveredTimestamp" : @"DeliveredTimestamp",
             @"readTimestamp" : @"ReadTimestamp",
             @"recipientParticipantId" : @"RecipientParticipantId",
             };
}

@end

@implementation AWSConnectParticipantSendEventRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"connectionToken" : @"ConnectionToken",
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSConnectParticipantSendEventResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absoluteTime" : @"AbsoluteTime",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectParticipantSendMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"connectionToken" : @"ConnectionToken",
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSConnectParticipantSendMessageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absoluteTime" : @"AbsoluteTime",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectParticipantStartAttachmentUploadRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentName" : @"AttachmentName",
             @"attachmentSizeInBytes" : @"AttachmentSizeInBytes",
             @"clientToken" : @"ClientToken",
             @"connectionToken" : @"ConnectionToken",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSConnectParticipantStartAttachmentUploadResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentId" : @"AttachmentId",
             @"uploadMetadata" : @"UploadMetadata",
             };
}

+ (NSValueTransformer *)uploadMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectParticipantUploadMetadata class]];
}

@end

@implementation AWSConnectParticipantStartPosition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absoluteTime" : @"AbsoluteTime",
             @"identifier" : @"Id",
             @"mostRecent" : @"MostRecent",
             };
}

@end

@implementation AWSConnectParticipantUploadMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"headersToInclude" : @"HeadersToInclude",
             @"url" : @"Url",
             @"urlExpiry" : @"UrlExpiry",
             };
}

@end

@implementation AWSConnectParticipantWebsocket

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionExpiry" : @"ConnectionExpiry",
             @"url" : @"Url",
             };
}

@end
