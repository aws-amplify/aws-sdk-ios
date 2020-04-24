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

#import "AWSdlmModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSdlmErrorDomain = @"com.amazonaws.AWSdlmErrorDomain";

@implementation AWSdlmCreateLifecyclePolicyRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdlmPolicyDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSdlmSettablePolicyStateValuesEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSdlmSettablePolicyStateValuesDisabled);
        }
        return @(AWSdlmSettablePolicyStateValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdlmSettablePolicyStateValuesEnabled:
                return @"ENABLED";
            case AWSdlmSettablePolicyStateValuesDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdlmCreateLifecyclePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSdlmCreateRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interval" : @"Interval",
             @"intervalUnit" : @"IntervalUnit",
             @"times" : @"Times",
             };
}

+ (NSValueTransformer *)intervalUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HOURS"] == NSOrderedSame) {
            return @(AWSdlmIntervalUnitValuesHours);
        }
        return @(AWSdlmIntervalUnitValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdlmIntervalUnitValuesHours:
                return @"HOURS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdlmCrossRegionCopyRetainRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interval" : @"Interval",
             @"intervalUnit" : @"IntervalUnit",
             };
}

+ (NSValueTransformer *)intervalUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAYS"] == NSOrderedSame) {
            return @(AWSdlmRetentionIntervalUnitValuesDays);
        }
        if ([value caseInsensitiveCompare:@"WEEKS"] == NSOrderedSame) {
            return @(AWSdlmRetentionIntervalUnitValuesWeeks);
        }
        if ([value caseInsensitiveCompare:@"MONTHS"] == NSOrderedSame) {
            return @(AWSdlmRetentionIntervalUnitValuesMonths);
        }
        if ([value caseInsensitiveCompare:@"YEARS"] == NSOrderedSame) {
            return @(AWSdlmRetentionIntervalUnitValuesYears);
        }
        return @(AWSdlmRetentionIntervalUnitValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdlmRetentionIntervalUnitValuesDays:
                return @"DAYS";
            case AWSdlmRetentionIntervalUnitValuesWeeks:
                return @"WEEKS";
            case AWSdlmRetentionIntervalUnitValuesMonths:
                return @"MONTHS";
            case AWSdlmRetentionIntervalUnitValuesYears:
                return @"YEARS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdlmCrossRegionCopyRule

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdlmCrossRegionCopyRetainRule class]];
}

@end

@implementation AWSdlmDeleteLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSdlmDeleteLifecyclePolicyResponse

@end

@implementation AWSdlmFastRestoreRule

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
            return @(AWSdlmRetentionIntervalUnitValuesDays);
        }
        if ([value caseInsensitiveCompare:@"WEEKS"] == NSOrderedSame) {
            return @(AWSdlmRetentionIntervalUnitValuesWeeks);
        }
        if ([value caseInsensitiveCompare:@"MONTHS"] == NSOrderedSame) {
            return @(AWSdlmRetentionIntervalUnitValuesMonths);
        }
        if ([value caseInsensitiveCompare:@"YEARS"] == NSOrderedSame) {
            return @(AWSdlmRetentionIntervalUnitValuesYears);
        }
        return @(AWSdlmRetentionIntervalUnitValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdlmRetentionIntervalUnitValuesDays:
                return @"DAYS";
            case AWSdlmRetentionIntervalUnitValuesWeeks:
                return @"WEEKS";
            case AWSdlmRetentionIntervalUnitValuesMonths:
                return @"MONTHS";
            case AWSdlmRetentionIntervalUnitValuesYears:
                return @"YEARS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdlmGetLifecyclePoliciesRequest

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
            return @(AWSdlmGettablePolicyStateValuesEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSdlmGettablePolicyStateValuesDisabled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSdlmGettablePolicyStateValuesError);
        }
        return @(AWSdlmGettablePolicyStateValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdlmGettablePolicyStateValuesEnabled:
                return @"ENABLED";
            case AWSdlmGettablePolicyStateValuesDisabled:
                return @"DISABLED";
            case AWSdlmGettablePolicyStateValuesError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdlmGetLifecyclePoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policies" : @"Policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdlmLifecyclePolicySummary class]];
}

@end

@implementation AWSdlmGetLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSdlmGetLifecyclePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdlmLifecyclePolicy class]];
}

@end

@implementation AWSdlmLifecyclePolicy

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdlmPolicyDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSdlmGettablePolicyStateValuesEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSdlmGettablePolicyStateValuesDisabled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSdlmGettablePolicyStateValuesError);
        }
        return @(AWSdlmGettablePolicyStateValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdlmGettablePolicyStateValuesEnabled:
                return @"ENABLED";
            case AWSdlmGettablePolicyStateValuesDisabled:
                return @"DISABLED";
            case AWSdlmGettablePolicyStateValuesError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdlmLifecyclePolicySummary

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
            return @(AWSdlmGettablePolicyStateValuesEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSdlmGettablePolicyStateValuesDisabled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSdlmGettablePolicyStateValuesError);
        }
        return @(AWSdlmGettablePolicyStateValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdlmGettablePolicyStateValuesEnabled:
                return @"ENABLED";
            case AWSdlmGettablePolicyStateValuesDisabled:
                return @"DISABLED";
            case AWSdlmGettablePolicyStateValuesError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdlmListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSdlmListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSdlmParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"excludeBootVolume" : @"ExcludeBootVolume",
             };
}

@end

@implementation AWSdlmPolicyDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdlmParameters class]];
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EBS_SNAPSHOT_MANAGEMENT"] == NSOrderedSame) {
            return @(AWSdlmPolicyTypeValuesEbsSnapshotManagement);
        }
        return @(AWSdlmPolicyTypeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdlmPolicyTypeValuesEbsSnapshotManagement:
                return @"EBS_SNAPSHOT_MANAGEMENT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)schedulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdlmSchedule class]];
}

+ (NSValueTransformer *)targetTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdlmTag class]];
}

@end

@implementation AWSdlmRetainRule

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
            return @(AWSdlmRetentionIntervalUnitValuesDays);
        }
        if ([value caseInsensitiveCompare:@"WEEKS"] == NSOrderedSame) {
            return @(AWSdlmRetentionIntervalUnitValuesWeeks);
        }
        if ([value caseInsensitiveCompare:@"MONTHS"] == NSOrderedSame) {
            return @(AWSdlmRetentionIntervalUnitValuesMonths);
        }
        if ([value caseInsensitiveCompare:@"YEARS"] == NSOrderedSame) {
            return @(AWSdlmRetentionIntervalUnitValuesYears);
        }
        return @(AWSdlmRetentionIntervalUnitValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdlmRetentionIntervalUnitValuesDays:
                return @"DAYS";
            case AWSdlmRetentionIntervalUnitValuesWeeks:
                return @"WEEKS";
            case AWSdlmRetentionIntervalUnitValuesMonths:
                return @"MONTHS";
            case AWSdlmRetentionIntervalUnitValuesYears:
                return @"YEARS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdlmSchedule

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdlmCreateRule class]];
}

+ (NSValueTransformer *)crossRegionCopyRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdlmCrossRegionCopyRule class]];
}

+ (NSValueTransformer *)fastRestoreRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdlmFastRestoreRule class]];
}

+ (NSValueTransformer *)retainRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdlmRetainRule class]];
}

+ (NSValueTransformer *)tagsToAddJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdlmTag class]];
}

+ (NSValueTransformer *)variableTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdlmTag class]];
}

@end

@implementation AWSdlmTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSdlmTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSdlmTagResourceResponse

@end

@implementation AWSdlmUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSdlmUntagResourceResponse

@end

@implementation AWSdlmUpdateLifecyclePolicyRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdlmPolicyDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSdlmSettablePolicyStateValuesEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSdlmSettablePolicyStateValuesDisabled);
        }
        return @(AWSdlmSettablePolicyStateValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdlmSettablePolicyStateValuesEnabled:
                return @"ENABLED";
            case AWSdlmSettablePolicyStateValuesDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdlmUpdateLifecyclePolicyResponse

@end
