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

@implementation AWSConnectChatMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSConnectContactFlowSummary

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

@implementation AWSConnectCreateUserRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userArn" : @"UserArn",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectCredentials

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

@implementation AWSConnectDeleteUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectDescribeUserHierarchyGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyGroupId" : @"HierarchyGroupId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDescribeUserHierarchyGroupResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectDescribeUserHierarchyStructureResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectDescribeUserResponse

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
        return @(AWSConnectChannelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectChannelVoice:
                return @"VOICE";
            case AWSConnectChannelChat:
                return @"CHAT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)queueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSConnectQueueReference class]];
}

@end

@implementation AWSConnectFilters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"queues" : @"Queues",
             };
}

@end

@implementation AWSConnectGetContactAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initialContactId" : @"InitialContactId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectGetContactAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSConnectGetCurrentMetricDataRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectGetFederationTokenResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectHierarchyLevel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectHierarchyPath

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

@implementation AWSConnectHistoricalMetric

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectListContactFlowsRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListHoursOfOperationsResponse

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

@implementation AWSConnectListPhoneNumbersRequest

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

@implementation AWSConnectListQueuesRequest

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

@implementation AWSConnectListRoutingProfilesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListRoutingProfilesResponse

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

@implementation AWSConnectListSecurityProfilesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListSecurityProfilesResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSConnectListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSConnectListUserHierarchyGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListUserHierarchyGroupsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSConnectListUsersResponse

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

@implementation AWSConnectParticipantDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             };
}

@end

@implementation AWSConnectPhoneNumberSummary

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

@implementation AWSConnectQueueReference

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSConnectQueueSummary

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

@implementation AWSConnectRoutingProfileSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectSecurityProfileSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSConnectStartChatContactRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"participantId" : @"ParticipantId",
             @"participantToken" : @"ParticipantToken",
             };
}

@end

@implementation AWSConnectStartOutboundVoiceContactRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             };
}

@end

@implementation AWSConnectStopContactRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactId" : @"ContactId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectStopContactResponse

@end

@implementation AWSConnectTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSConnectThreshold

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSConnectUpdateContactAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"initialContactId" : @"InitialContactId",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSConnectUpdateContactAttributesResponse

@end

@implementation AWSConnectUpdateUserHierarchyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyGroupId" : @"HierarchyGroupId",
             @"instanceId" : @"InstanceId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectUpdateUserIdentityInfoRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"routingProfileId" : @"RoutingProfileId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectUpdateUserSecurityProfilesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"securityProfileIds" : @"SecurityProfileIds",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSConnectUser

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"email" : @"Email",
             @"firstName" : @"FirstName",
             @"lastName" : @"LastName",
             };
}

@end

@implementation AWSConnectUserPhoneConfig

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

@implementation AWSConnectUserSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"username" : @"Username",
             };
}

@end
