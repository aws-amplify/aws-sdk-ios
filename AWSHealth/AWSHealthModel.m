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

#import "AWSHealthModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSHealthErrorDomain = @"com.amazonaws.AWSHealthErrorDomain";

@implementation AWSHealthAffectedEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"awsAccountId",
             @"entityArn" : @"entityArn",
             @"entityUrl" : @"entityUrl",
             @"entityValue" : @"entityValue",
             @"eventArn" : @"eventArn",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"statusCode" : @"statusCode",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPAIRED"] == NSOrderedSame) {
            return @(AWSHealthentityStatusCodeImpaired);
        }
        if ([value caseInsensitiveCompare:@"UNIMPAIRED"] == NSOrderedSame) {
            return @(AWSHealthentityStatusCodeUnimpaired);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSHealthentityStatusCodeUnknown);
        }
        return @(AWSHealthentityStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHealthentityStatusCodeImpaired:
                return @"IMPAIRED";
            case AWSHealthentityStatusCodeUnimpaired:
                return @"UNIMPAIRED";
            case AWSHealthentityStatusCodeUnknown:
                return @"UNKNOWN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSHealthDateTimeRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"from" : @"from",
             @"to" : @"to",
             };
}

+ (NSValueTransformer *)fromJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)toJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSHealthDescribeAffectedAccountsForOrganizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventArn" : @"eventArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSHealthDescribeAffectedAccountsForOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"affectedAccounts" : @"affectedAccounts",
             @"eventScopeCode" : @"eventScopeCode",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)eventScopeCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSHealtheventScopeCodePublic);
        }
        if ([value caseInsensitiveCompare:@"ACCOUNT_SPECIFIC"] == NSOrderedSame) {
            return @(AWSHealtheventScopeCodeAccountSpecific);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSHealtheventScopeCodeNone);
        }
        return @(AWSHealtheventScopeCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHealtheventScopeCodePublic:
                return @"PUBLIC";
            case AWSHealtheventScopeCodeAccountSpecific:
                return @"ACCOUNT_SPECIFIC";
            case AWSHealtheventScopeCodeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSHealthDescribeAffectedEntitiesForOrganizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"locale" : @"locale",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"organizationEntityFilters" : @"organizationEntityFilters",
             };
}

+ (NSValueTransformer *)organizationEntityFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthEventAccountFilter class]];
}

@end

@implementation AWSHealthDescribeAffectedEntitiesForOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"entities",
             @"failedSet" : @"failedSet",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthAffectedEntity class]];
}

+ (NSValueTransformer *)failedSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthOrganizationAffectedEntitiesErrorItem class]];
}

@end

@implementation AWSHealthDescribeAffectedEntitiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"locale" : @"locale",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthEntityFilter class]];
}

@end

@implementation AWSHealthDescribeAffectedEntitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"entities",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthAffectedEntity class]];
}

@end

@implementation AWSHealthDescribeEntityAggregatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventArns" : @"eventArns",
             };
}

@end

@implementation AWSHealthDescribeEntityAggregatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityAggregates" : @"entityAggregates",
             };
}

+ (NSValueTransformer *)entityAggregatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthEntityAggregate class]];
}

@end

@implementation AWSHealthDescribeEventAggregatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregateField" : @"aggregateField",
             @"filter" : @"filter",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)aggregateFieldJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"eventTypeCategory"] == NSOrderedSame) {
            return @(AWSHealtheventAggregateFieldEventTypeCategory);
        }
        return @(AWSHealtheventAggregateFieldUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHealtheventAggregateFieldEventTypeCategory:
                return @"eventTypeCategory";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthEventFilter class]];
}

@end

@implementation AWSHealthDescribeEventAggregatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventAggregates" : @"eventAggregates",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)eventAggregatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthEventAggregate class]];
}

@end

@implementation AWSHealthDescribeEventDetailsForOrganizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"locale" : @"locale",
             @"organizationEventDetailFilters" : @"organizationEventDetailFilters",
             };
}

+ (NSValueTransformer *)organizationEventDetailFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthEventAccountFilter class]];
}

@end

@implementation AWSHealthDescribeEventDetailsForOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedSet" : @"failedSet",
             @"successfulSet" : @"successfulSet",
             };
}

+ (NSValueTransformer *)failedSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthOrganizationEventDetailsErrorItem class]];
}

+ (NSValueTransformer *)successfulSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthOrganizationEventDetails class]];
}

@end

@implementation AWSHealthDescribeEventDetailsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventArns" : @"eventArns",
             @"locale" : @"locale",
             };
}

@end

@implementation AWSHealthDescribeEventDetailsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedSet" : @"failedSet",
             @"successfulSet" : @"successfulSet",
             };
}

+ (NSValueTransformer *)failedSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthEventDetailsErrorItem class]];
}

+ (NSValueTransformer *)successfulSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthEventDetails class]];
}

@end

@implementation AWSHealthDescribeEventTypesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"locale" : @"locale",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthEventTypeFilter class]];
}

@end

@implementation AWSHealthDescribeEventTypesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventTypes" : @"eventTypes",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)eventTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthEventType class]];
}

@end

@implementation AWSHealthDescribeEventsForOrganizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"locale" : @"locale",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthOrganizationEventFilter class]];
}

@end

@implementation AWSHealthDescribeEventsForOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"events",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthOrganizationEvent class]];
}

@end

@implementation AWSHealthDescribeEventsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"locale" : @"locale",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthEventFilter class]];
}

@end

@implementation AWSHealthDescribeEventsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"events",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthEvent class]];
}

@end

@implementation AWSHealthDescribeHealthServiceStatusForOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthServiceAccessStatusForOrganization" : @"healthServiceAccessStatusForOrganization",
             };
}

@end

@implementation AWSHealthEntityAggregate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"count",
             @"eventArn" : @"eventArn",
             };
}

@end

@implementation AWSHealthEntityFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityArns" : @"entityArns",
             @"entityValues" : @"entityValues",
             @"eventArns" : @"eventArns",
             @"lastUpdatedTimes" : @"lastUpdatedTimes",
             @"statusCodes" : @"statusCodes",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)lastUpdatedTimesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthDateTimeRange class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[NSString class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

@end

@implementation AWSHealthEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"availabilityZone" : @"availabilityZone",
             @"endTime" : @"endTime",
             @"eventScopeCode" : @"eventScopeCode",
             @"eventTypeCategory" : @"eventTypeCategory",
             @"eventTypeCode" : @"eventTypeCode",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"region" : @"region",
             @"service" : @"service",
             @"startTime" : @"startTime",
             @"statusCode" : @"statusCode",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)eventScopeCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSHealtheventScopeCodePublic);
        }
        if ([value caseInsensitiveCompare:@"ACCOUNT_SPECIFIC"] == NSOrderedSame) {
            return @(AWSHealtheventScopeCodeAccountSpecific);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSHealtheventScopeCodeNone);
        }
        return @(AWSHealtheventScopeCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHealtheventScopeCodePublic:
                return @"PUBLIC";
            case AWSHealtheventScopeCodeAccountSpecific:
                return @"ACCOUNT_SPECIFIC";
            case AWSHealtheventScopeCodeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)eventTypeCategoryJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"issue"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryIssue);
        }
        if ([value caseInsensitiveCompare:@"accountNotification"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryAccountNotification);
        }
        if ([value caseInsensitiveCompare:@"scheduledChange"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryScheduledChange);
        }
        if ([value caseInsensitiveCompare:@"investigation"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryInvestigation);
        }
        return @(AWSHealtheventTypeCategoryUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHealtheventTypeCategoryIssue:
                return @"issue";
            case AWSHealtheventTypeCategoryAccountNotification:
                return @"accountNotification";
            case AWSHealtheventTypeCategoryScheduledChange:
                return @"scheduledChange";
            case AWSHealtheventTypeCategoryInvestigation:
                return @"investigation";
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

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"open"] == NSOrderedSame) {
            return @(AWSHealtheventStatusCodeOpen);
        }
        if ([value caseInsensitiveCompare:@"closed"] == NSOrderedSame) {
            return @(AWSHealtheventStatusCodeClosed);
        }
        if ([value caseInsensitiveCompare:@"upcoming"] == NSOrderedSame) {
            return @(AWSHealtheventStatusCodeUpcoming);
        }
        return @(AWSHealtheventStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHealtheventStatusCodeOpen:
                return @"open";
            case AWSHealtheventStatusCodeClosed:
                return @"closed";
            case AWSHealtheventStatusCodeUpcoming:
                return @"upcoming";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSHealthEventAccountFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"awsAccountId",
             @"eventArn" : @"eventArn",
             };
}

@end

@implementation AWSHealthEventAggregate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregateValue" : @"aggregateValue",
             @"count" : @"count",
             };
}

@end

@implementation AWSHealthEventDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestDescription" : @"latestDescription",
             };
}

@end

@implementation AWSHealthEventDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"event" : @"event",
             @"eventDescription" : @"eventDescription",
             @"eventMetadata" : @"eventMetadata",
             };
}

+ (NSValueTransformer *)eventJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthEvent class]];
}

+ (NSValueTransformer *)eventDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthEventDescription class]];
}

@end

@implementation AWSHealthEventDetailsErrorItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorMessage" : @"errorMessage",
             @"errorName" : @"errorName",
             @"eventArn" : @"eventArn",
             };
}

@end

@implementation AWSHealthEventFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"availabilityZones",
             @"endTimes" : @"endTimes",
             @"entityArns" : @"entityArns",
             @"entityValues" : @"entityValues",
             @"eventArns" : @"eventArns",
             @"eventStatusCodes" : @"eventStatusCodes",
             @"eventTypeCategories" : @"eventTypeCategories",
             @"eventTypeCodes" : @"eventTypeCodes",
             @"lastUpdatedTimes" : @"lastUpdatedTimes",
             @"regions" : @"regions",
             @"services" : @"services",
             @"startTimes" : @"startTimes",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)endTimesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthDateTimeRange class]];
}

+ (NSValueTransformer *)lastUpdatedTimesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthDateTimeRange class]];
}

+ (NSValueTransformer *)startTimesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHealthDateTimeRange class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[NSString class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

@end

@implementation AWSHealthEventType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"category",
             @"code" : @"code",
             @"service" : @"service",
             };
}

+ (NSValueTransformer *)categoryJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"issue"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryIssue);
        }
        if ([value caseInsensitiveCompare:@"accountNotification"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryAccountNotification);
        }
        if ([value caseInsensitiveCompare:@"scheduledChange"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryScheduledChange);
        }
        if ([value caseInsensitiveCompare:@"investigation"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryInvestigation);
        }
        return @(AWSHealtheventTypeCategoryUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHealtheventTypeCategoryIssue:
                return @"issue";
            case AWSHealtheventTypeCategoryAccountNotification:
                return @"accountNotification";
            case AWSHealtheventTypeCategoryScheduledChange:
                return @"scheduledChange";
            case AWSHealtheventTypeCategoryInvestigation:
                return @"investigation";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSHealthEventTypeFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventTypeCategories" : @"eventTypeCategories",
             @"eventTypeCodes" : @"eventTypeCodes",
             @"services" : @"services",
             };
}

@end

@implementation AWSHealthOrganizationAffectedEntitiesErrorItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"awsAccountId",
             @"errorMessage" : @"errorMessage",
             @"errorName" : @"errorName",
             @"eventArn" : @"eventArn",
             };
}

@end

@implementation AWSHealthOrganizationEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"endTime" : @"endTime",
             @"eventScopeCode" : @"eventScopeCode",
             @"eventTypeCategory" : @"eventTypeCategory",
             @"eventTypeCode" : @"eventTypeCode",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"region" : @"region",
             @"service" : @"service",
             @"startTime" : @"startTime",
             @"statusCode" : @"statusCode",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)eventScopeCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSHealtheventScopeCodePublic);
        }
        if ([value caseInsensitiveCompare:@"ACCOUNT_SPECIFIC"] == NSOrderedSame) {
            return @(AWSHealtheventScopeCodeAccountSpecific);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSHealtheventScopeCodeNone);
        }
        return @(AWSHealtheventScopeCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHealtheventScopeCodePublic:
                return @"PUBLIC";
            case AWSHealtheventScopeCodeAccountSpecific:
                return @"ACCOUNT_SPECIFIC";
            case AWSHealtheventScopeCodeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)eventTypeCategoryJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"issue"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryIssue);
        }
        if ([value caseInsensitiveCompare:@"accountNotification"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryAccountNotification);
        }
        if ([value caseInsensitiveCompare:@"scheduledChange"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryScheduledChange);
        }
        if ([value caseInsensitiveCompare:@"investigation"] == NSOrderedSame) {
            return @(AWSHealtheventTypeCategoryInvestigation);
        }
        return @(AWSHealtheventTypeCategoryUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHealtheventTypeCategoryIssue:
                return @"issue";
            case AWSHealtheventTypeCategoryAccountNotification:
                return @"accountNotification";
            case AWSHealtheventTypeCategoryScheduledChange:
                return @"scheduledChange";
            case AWSHealtheventTypeCategoryInvestigation:
                return @"investigation";
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

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"open"] == NSOrderedSame) {
            return @(AWSHealtheventStatusCodeOpen);
        }
        if ([value caseInsensitiveCompare:@"closed"] == NSOrderedSame) {
            return @(AWSHealtheventStatusCodeClosed);
        }
        if ([value caseInsensitiveCompare:@"upcoming"] == NSOrderedSame) {
            return @(AWSHealtheventStatusCodeUpcoming);
        }
        return @(AWSHealtheventStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHealtheventStatusCodeOpen:
                return @"open";
            case AWSHealtheventStatusCodeClosed:
                return @"closed";
            case AWSHealtheventStatusCodeUpcoming:
                return @"upcoming";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSHealthOrganizationEventDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"awsAccountId",
             @"event" : @"event",
             @"eventDescription" : @"eventDescription",
             @"eventMetadata" : @"eventMetadata",
             };
}

+ (NSValueTransformer *)eventJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthEvent class]];
}

+ (NSValueTransformer *)eventDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthEventDescription class]];
}

@end

@implementation AWSHealthOrganizationEventDetailsErrorItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"awsAccountId",
             @"errorMessage" : @"errorMessage",
             @"errorName" : @"errorName",
             @"eventArn" : @"eventArn",
             };
}

@end

@implementation AWSHealthOrganizationEventFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountIds" : @"awsAccountIds",
             @"endTime" : @"endTime",
             @"entityArns" : @"entityArns",
             @"entityValues" : @"entityValues",
             @"eventStatusCodes" : @"eventStatusCodes",
             @"eventTypeCategories" : @"eventTypeCategories",
             @"eventTypeCodes" : @"eventTypeCodes",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"regions" : @"regions",
             @"services" : @"services",
             @"startTime" : @"startTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthDateTimeRange class]];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthDateTimeRange class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSHealthDateTimeRange class]];
}

@end
