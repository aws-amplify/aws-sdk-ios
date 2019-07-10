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

#import "AWSConnectModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSConnectErrorDomain = @"com.amazonaws.AWSConnectErrorDomain";

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
        return @(AWSConnectChannelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSConnectChannelVoice:
                return @"VOICE";
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

@implementation AWSConnectQueueReference

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
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
