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

#import "AWSDlmModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSDlmErrorDomain = @"com.amazonaws.AWSDlmErrorDomain";

@implementation AWSDlmCreateLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"executionRoleArn" : @"ExecutionRoleArn",
             @"policyDetails" : @"PolicyDetails",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)policyDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDlmPolicyDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDlmSettablePolicyStateValuesEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDlmSettablePolicyStateValuesDisabled);
        }
        return @(AWSDlmSettablePolicyStateValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDlmSettablePolicyStateValuesEnabled:
                return @"ENABLED";
            case AWSDlmSettablePolicyStateValuesDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDlmCreateLifecyclePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSDlmCreateRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cronExpression" : @"CronExpression",
             @"interval" : @"Interval",
             @"intervalUnit" : @"IntervalUnit",
             @"times" : @"Times",
             };
}

+ (NSValueTransformer *)intervalUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HOURS"] == NSOrderedSame) {
            return @(AWSDlmIntervalUnitValuesHours);
        }
        return @(AWSDlmIntervalUnitValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDlmIntervalUnitValuesHours:
                return @"HOURS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDlmCrossRegionCopyRetainRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interval" : @"Interval",
             @"intervalUnit" : @"IntervalUnit",
             };
}

+ (NSValueTransformer *)intervalUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAYS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesDays);
        }
        if ([value caseInsensitiveCompare:@"WEEKS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesWeeks);
        }
        if ([value caseInsensitiveCompare:@"MONTHS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesMonths);
        }
        if ([value caseInsensitiveCompare:@"YEARS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesYears);
        }
        return @(AWSDlmRetentionIntervalUnitValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDlmRetentionIntervalUnitValuesDays:
                return @"DAYS";
            case AWSDlmRetentionIntervalUnitValuesWeeks:
                return @"WEEKS";
            case AWSDlmRetentionIntervalUnitValuesMonths:
                return @"MONTHS";
            case AWSDlmRetentionIntervalUnitValuesYears:
                return @"YEARS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDlmCrossRegionCopyRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cmkArn" : @"CmkArn",
             @"replicateTags" : @"CopyTags",
             @"encrypted" : @"Encrypted",
             @"retainRule" : @"RetainRule",
             @"targetRegion" : @"TargetRegion",
             };
}

+ (NSValueTransformer *)retainRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDlmCrossRegionCopyRetainRule class]];
}

@end

@implementation AWSDlmDeleteLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSDlmDeleteLifecyclePolicyResponse

@end

@implementation AWSDlmFastRestoreRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"count" : @"Count",
             @"interval" : @"Interval",
             @"intervalUnit" : @"IntervalUnit",
             };
}

+ (NSValueTransformer *)intervalUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAYS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesDays);
        }
        if ([value caseInsensitiveCompare:@"WEEKS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesWeeks);
        }
        if ([value caseInsensitiveCompare:@"MONTHS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesMonths);
        }
        if ([value caseInsensitiveCompare:@"YEARS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesYears);
        }
        return @(AWSDlmRetentionIntervalUnitValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDlmRetentionIntervalUnitValuesDays:
                return @"DAYS";
            case AWSDlmRetentionIntervalUnitValuesWeeks:
                return @"WEEKS";
            case AWSDlmRetentionIntervalUnitValuesMonths:
                return @"MONTHS";
            case AWSDlmRetentionIntervalUnitValuesYears:
                return @"YEARS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDlmGetLifecyclePoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyIds" : @"PolicyIds",
             @"resourceTypes" : @"ResourceTypes",
             @"state" : @"State",
             @"tagsToAdd" : @"TagsToAdd",
             @"targetTags" : @"TargetTags",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDlmGettablePolicyStateValuesEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDlmGettablePolicyStateValuesDisabled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSDlmGettablePolicyStateValuesError);
        }
        return @(AWSDlmGettablePolicyStateValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDlmGettablePolicyStateValuesEnabled:
                return @"ENABLED";
            case AWSDlmGettablePolicyStateValuesDisabled:
                return @"DISABLED";
            case AWSDlmGettablePolicyStateValuesError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDlmGetLifecyclePoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policies" : @"Policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDlmLifecyclePolicySummary class]];
}

@end

@implementation AWSDlmGetLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSDlmGetLifecyclePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDlmLifecyclePolicy class]];
}

@end

@implementation AWSDlmLifecyclePolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dateCreated" : @"DateCreated",
             @"dateModified" : @"DateModified",
             @"detail" : @"Description",
             @"executionRoleArn" : @"ExecutionRoleArn",
             @"policyArn" : @"PolicyArn",
             @"policyDetails" : @"PolicyDetails",
             @"policyId" : @"PolicyId",
             @"state" : @"State",
             @"statusMessage" : @"StatusMessage",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)dateCreatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dateModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)policyDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDlmPolicyDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDlmGettablePolicyStateValuesEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDlmGettablePolicyStateValuesDisabled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSDlmGettablePolicyStateValuesError);
        }
        return @(AWSDlmGettablePolicyStateValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDlmGettablePolicyStateValuesEnabled:
                return @"ENABLED";
            case AWSDlmGettablePolicyStateValuesDisabled:
                return @"DISABLED";
            case AWSDlmGettablePolicyStateValuesError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDlmLifecyclePolicySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"policyId" : @"PolicyId",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDlmGettablePolicyStateValuesEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDlmGettablePolicyStateValuesDisabled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSDlmGettablePolicyStateValuesError);
        }
        return @(AWSDlmGettablePolicyStateValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDlmGettablePolicyStateValuesEnabled:
                return @"ENABLED";
            case AWSDlmGettablePolicyStateValuesDisabled:
                return @"DISABLED";
            case AWSDlmGettablePolicyStateValuesError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDlmListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSDlmListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSDlmParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"excludeBootVolume" : @"ExcludeBootVolume",
             };
}

@end

@implementation AWSDlmPolicyDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameters" : @"Parameters",
             @"policyType" : @"PolicyType",
             @"resourceTypes" : @"ResourceTypes",
             @"schedules" : @"Schedules",
             @"targetTags" : @"TargetTags",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDlmParameters class]];
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EBS_SNAPSHOT_MANAGEMENT"] == NSOrderedSame) {
            return @(AWSDlmPolicyTypeValuesEbsSnapshotManagement);
        }
        return @(AWSDlmPolicyTypeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDlmPolicyTypeValuesEbsSnapshotManagement:
                return @"EBS_SNAPSHOT_MANAGEMENT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)schedulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDlmSchedule class]];
}

+ (NSValueTransformer *)targetTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDlmTag class]];
}

@end

@implementation AWSDlmRetainRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"interval" : @"Interval",
             @"intervalUnit" : @"IntervalUnit",
             };
}

+ (NSValueTransformer *)intervalUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAYS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesDays);
        }
        if ([value caseInsensitiveCompare:@"WEEKS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesWeeks);
        }
        if ([value caseInsensitiveCompare:@"MONTHS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesMonths);
        }
        if ([value caseInsensitiveCompare:@"YEARS"] == NSOrderedSame) {
            return @(AWSDlmRetentionIntervalUnitValuesYears);
        }
        return @(AWSDlmRetentionIntervalUnitValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDlmRetentionIntervalUnitValuesDays:
                return @"DAYS";
            case AWSDlmRetentionIntervalUnitValuesWeeks:
                return @"WEEKS";
            case AWSDlmRetentionIntervalUnitValuesMonths:
                return @"MONTHS";
            case AWSDlmRetentionIntervalUnitValuesYears:
                return @"YEARS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDlmSchedule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateTags" : @"CopyTags",
             @"createRule" : @"CreateRule",
             @"crossRegionCopyRules" : @"CrossRegionCopyRules",
             @"fastRestoreRule" : @"FastRestoreRule",
             @"name" : @"Name",
             @"retainRule" : @"RetainRule",
             @"tagsToAdd" : @"TagsToAdd",
             @"variableTags" : @"VariableTags",
             };
}

+ (NSValueTransformer *)createRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDlmCreateRule class]];
}

+ (NSValueTransformer *)crossRegionCopyRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDlmCrossRegionCopyRule class]];
}

+ (NSValueTransformer *)fastRestoreRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDlmFastRestoreRule class]];
}

+ (NSValueTransformer *)retainRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDlmRetainRule class]];
}

+ (NSValueTransformer *)tagsToAddJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDlmTag class]];
}

+ (NSValueTransformer *)variableTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDlmTag class]];
}

@end

@implementation AWSDlmTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSDlmTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSDlmTagResourceResponse

@end

@implementation AWSDlmUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSDlmUntagResourceResponse

@end

@implementation AWSDlmUpdateLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"executionRoleArn" : @"ExecutionRoleArn",
             @"policyDetails" : @"PolicyDetails",
             @"policyId" : @"PolicyId",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)policyDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDlmPolicyDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDlmSettablePolicyStateValuesEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDlmSettablePolicyStateValuesDisabled);
        }
        return @(AWSDlmSettablePolicyStateValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDlmSettablePolicyStateValuesEnabled:
                return @"ENABLED";
            case AWSDlmSettablePolicyStateValuesDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDlmUpdateLifecyclePolicyResponse

@end
