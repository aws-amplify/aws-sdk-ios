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

#import "AWSConnectParticipantModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSConnectParticipantErrorDomain = @"com.amazonaws.AWSConnectParticipantErrorDomain";

@implementation AWSConnectParticipantConnectionCredentials

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionToken" : @"ConnectionToken",
             @"expiry" : @"Expiry",
             };
}

@end

@implementation AWSConnectParticipantCreateParticipantConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"participantToken" : @"ParticipantToken",
             @"types" : @"Type",
             };
}

@end

@implementation AWSConnectParticipantCreateParticipantConnectionResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"connectionToken" : @"ConnectionToken",
             };
}

@end

@implementation AWSConnectParticipantDisconnectParticipantResponse

@end

@implementation AWSConnectParticipantGetTranscriptRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absoluteTime" : @"AbsoluteTime",
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             @"displayName" : @"DisplayName",
             @"identifier" : @"Id",
             @"participantId" : @"ParticipantId",
             @"participantRole" : @"ParticipantRole",
             @"types" : @"Type",
             };
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
        if ([value caseInsensitiveCompare:@"MESSAGE"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeMessage);
        }
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeEvent);
        }
        if ([value caseInsensitiveCompare:@"CONNECTION_ACK"] == NSOrderedSame) {
            return @(AWSConnectParticipantChatItemTypeConnectionAck);
        }
        return @(AWSConnectParticipantChatItemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectParticipantChatItemTypeMessage:
                return @"MESSAGE";
            case AWSConnectParticipantChatItemTypeEvent:
                return @"EVENT";
            case AWSConnectParticipantChatItemTypeConnectionAck:
                return @"CONNECTION_ACK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSConnectParticipantSendEventRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absoluteTime" : @"AbsoluteTime",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectParticipantSendMessageRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absoluteTime" : @"AbsoluteTime",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectParticipantStartPosition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absoluteTime" : @"AbsoluteTime",
             @"identifier" : @"Id",
             @"mostRecent" : @"MostRecent",
             };
}

@end

@implementation AWSConnectParticipantWebsocket

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionExpiry" : @"ConnectionExpiry",
             @"url" : @"Url",
             };
}

@end
