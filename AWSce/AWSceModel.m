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

#import "AWSceModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSceErrorDomain = @"com.amazonaws.AWSceErrorDomain";

@implementation AWSceCostCategory

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costCategoryArn" : @"CostCategoryArn",
             @"effectiveEnd" : @"EffectiveEnd",
             @"effectiveStart" : @"EffectiveStart",
             @"name" : @"Name",
             @"ruleVersion" : @"RuleVersion",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)ruleVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CostCategoryExpression.v1"] == NSOrderedSame) {
            return @(AWSceCostCategoryRuleVersionCostCategoryExpressionV1);
        }
        return @(AWSceCostCategoryRuleVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceCostCategoryRuleVersionCostCategoryExpressionV1:
                return @"CostCategoryExpression.v1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceCostCategoryRule class]];
}

@end

@implementation AWSceCostCategoryReference

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costCategoryArn" : @"CostCategoryArn",
             @"effectiveEnd" : @"EffectiveEnd",
             @"effectiveStart" : @"EffectiveStart",
             @"name" : @"Name",
             @"numberOfRules" : @"NumberOfRules",
             };
}

@end

@implementation AWSceCostCategoryRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rule" : @"Rule",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

@end

@implementation AWSceCostCategoryValues

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSceCoverage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"coverageCost" : @"CoverageCost",
             @"coverageHours" : @"CoverageHours",
             @"coverageNormalizedUnits" : @"CoverageNormalizedUnits",
             };
}

+ (NSValueTransformer *)coverageCostJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceCoverageCost class]];
}

+ (NSValueTransformer *)coverageHoursJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceCoverageHours class]];
}

+ (NSValueTransformer *)coverageNormalizedUnitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceCoverageNormalizedUnits class]];
}

@end

@implementation AWSceCoverageByTime

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groups" : @"Groups",
             @"timePeriod" : @"TimePeriod",
             @"total" : @"Total",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceReservationCoverageGroup class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

+ (NSValueTransformer *)totalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceCoverage class]];
}

@end

@implementation AWSceCoverageCost

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"onDemandCost" : @"OnDemandCost",
             };
}

@end

@implementation AWSceCoverageHours

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"coverageHoursPercentage" : @"CoverageHoursPercentage",
             @"onDemandHours" : @"OnDemandHours",
             @"reservedHours" : @"ReservedHours",
             @"totalRunningHours" : @"TotalRunningHours",
             };
}

@end

@implementation AWSceCoverageNormalizedUnits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"coverageNormalizedUnitsPercentage" : @"CoverageNormalizedUnitsPercentage",
             @"onDemandNormalizedUnits" : @"OnDemandNormalizedUnits",
             @"reservedNormalizedUnits" : @"ReservedNormalizedUnits",
             @"totalRunningNormalizedUnits" : @"TotalRunningNormalizedUnits",
             };
}

@end

@implementation AWSceCreateCostCategoryDefinitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"ruleVersion" : @"RuleVersion",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)ruleVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CostCategoryExpression.v1"] == NSOrderedSame) {
            return @(AWSceCostCategoryRuleVersionCostCategoryExpressionV1);
        }
        return @(AWSceCostCategoryRuleVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceCostCategoryRuleVersionCostCategoryExpressionV1:
                return @"CostCategoryExpression.v1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceCostCategoryRule class]];
}

@end

@implementation AWSceCreateCostCategoryDefinitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costCategoryArn" : @"CostCategoryArn",
             @"effectiveStart" : @"EffectiveStart",
             };
}

@end

@implementation AWSceCurrentInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"monthlyCost" : @"MonthlyCost",
             @"onDemandHoursInLookbackPeriod" : @"OnDemandHoursInLookbackPeriod",
             @"reservationCoveredHoursInLookbackPeriod" : @"ReservationCoveredHoursInLookbackPeriod",
             @"resourceDetails" : @"ResourceDetails",
             @"resourceId" : @"ResourceId",
             @"resourceUtilization" : @"ResourceUtilization",
             @"savingsPlansCoveredHoursInLookbackPeriod" : @"SavingsPlansCoveredHoursInLookbackPeriod",
             @"tags" : @"Tags",
             @"totalRunningHoursInLookbackPeriod" : @"TotalRunningHoursInLookbackPeriod",
             };
}

+ (NSValueTransformer *)resourceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceResourceDetails class]];
}

+ (NSValueTransformer *)resourceUtilizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceResourceUtilization class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceTagValues class]];
}

@end

@implementation AWSceDateInterval

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"end" : @"End",
             @"start" : @"Start",
             };
}

@end

@implementation AWSceDeleteCostCategoryDefinitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costCategoryArn" : @"CostCategoryArn",
             };
}

@end

@implementation AWSceDeleteCostCategoryDefinitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costCategoryArn" : @"CostCategoryArn",
             @"effectiveEnd" : @"EffectiveEnd",
             };
}

@end

@implementation AWSceDescribeCostCategoryDefinitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costCategoryArn" : @"CostCategoryArn",
             @"effectiveOn" : @"EffectiveOn",
             };
}

@end

@implementation AWSceDescribeCostCategoryDefinitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costCategory" : @"CostCategory",
             };
}

+ (NSValueTransformer *)costCategoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceCostCategory class]];
}

@end

@implementation AWSceDimensionValues

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"matchOptions" : @"MatchOptions",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AZ"] == NSOrderedSame) {
            return @(AWSceDimensionAz);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionInstanceType);
        }
        if ([value caseInsensitiveCompare:@"LINKED_ACCOUNT"] == NSOrderedSame) {
            return @(AWSceDimensionLinkedAccount);
        }
        if ([value caseInsensitiveCompare:@"LINKED_ACCOUNT_NAME"] == NSOrderedSame) {
            return @(AWSceDimensionLinkedAccountName);
        }
        if ([value caseInsensitiveCompare:@"OPERATION"] == NSOrderedSame) {
            return @(AWSceDimensionOperation);
        }
        if ([value caseInsensitiveCompare:@"PURCHASE_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionPurchaseType);
        }
        if ([value caseInsensitiveCompare:@"REGION"] == NSOrderedSame) {
            return @(AWSceDimensionRegion);
        }
        if ([value caseInsensitiveCompare:@"SERVICE"] == NSOrderedSame) {
            return @(AWSceDimensionService);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_CODE"] == NSOrderedSame) {
            return @(AWSceDimensionServiceCode);
        }
        if ([value caseInsensitiveCompare:@"USAGE_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionUsageType);
        }
        if ([value caseInsensitiveCompare:@"USAGE_TYPE_GROUP"] == NSOrderedSame) {
            return @(AWSceDimensionUsageTypeGroup);
        }
        if ([value caseInsensitiveCompare:@"RECORD_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionRecordType);
        }
        if ([value caseInsensitiveCompare:@"OPERATING_SYSTEM"] == NSOrderedSame) {
            return @(AWSceDimensionOperatingSystem);
        }
        if ([value caseInsensitiveCompare:@"TENANCY"] == NSOrderedSame) {
            return @(AWSceDimensionTenancy);
        }
        if ([value caseInsensitiveCompare:@"SCOPE"] == NSOrderedSame) {
            return @(AWSceDimensionScope);
        }
        if ([value caseInsensitiveCompare:@"PLATFORM"] == NSOrderedSame) {
            return @(AWSceDimensionPlatform);
        }
        if ([value caseInsensitiveCompare:@"SUBSCRIPTION_ID"] == NSOrderedSame) {
            return @(AWSceDimensionSubscriptionId);
        }
        if ([value caseInsensitiveCompare:@"LEGAL_ENTITY_NAME"] == NSOrderedSame) {
            return @(AWSceDimensionLegalEntityName);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYMENT_OPTION"] == NSOrderedSame) {
            return @(AWSceDimensionDeploymentOption);
        }
        if ([value caseInsensitiveCompare:@"DATABASE_ENGINE"] == NSOrderedSame) {
            return @(AWSceDimensionDatabaseEngine);
        }
        if ([value caseInsensitiveCompare:@"CACHE_ENGINE"] == NSOrderedSame) {
            return @(AWSceDimensionCacheEngine);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_TYPE_FAMILY"] == NSOrderedSame) {
            return @(AWSceDimensionInstanceTypeFamily);
        }
        if ([value caseInsensitiveCompare:@"BILLING_ENTITY"] == NSOrderedSame) {
            return @(AWSceDimensionBillingEntity);
        }
        if ([value caseInsensitiveCompare:@"RESERVATION_ID"] == NSOrderedSame) {
            return @(AWSceDimensionReservationId);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_ID"] == NSOrderedSame) {
            return @(AWSceDimensionResourceId);
        }
        if ([value caseInsensitiveCompare:@"RIGHTSIZING_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionRightsizingType);
        }
        if ([value caseInsensitiveCompare:@"SAVINGS_PLANS_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionSavingsPlansType);
        }
        if ([value caseInsensitiveCompare:@"SAVINGS_PLAN_ARN"] == NSOrderedSame) {
            return @(AWSceDimensionSavingsPlanArn);
        }
        if ([value caseInsensitiveCompare:@"PAYMENT_OPTION"] == NSOrderedSame) {
            return @(AWSceDimensionPaymentOption);
        }
        return @(AWSceDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceDimensionAz:
                return @"AZ";
            case AWSceDimensionInstanceType:
                return @"INSTANCE_TYPE";
            case AWSceDimensionLinkedAccount:
                return @"LINKED_ACCOUNT";
            case AWSceDimensionLinkedAccountName:
                return @"LINKED_ACCOUNT_NAME";
            case AWSceDimensionOperation:
                return @"OPERATION";
            case AWSceDimensionPurchaseType:
                return @"PURCHASE_TYPE";
            case AWSceDimensionRegion:
                return @"REGION";
            case AWSceDimensionService:
                return @"SERVICE";
            case AWSceDimensionServiceCode:
                return @"SERVICE_CODE";
            case AWSceDimensionUsageType:
                return @"USAGE_TYPE";
            case AWSceDimensionUsageTypeGroup:
                return @"USAGE_TYPE_GROUP";
            case AWSceDimensionRecordType:
                return @"RECORD_TYPE";
            case AWSceDimensionOperatingSystem:
                return @"OPERATING_SYSTEM";
            case AWSceDimensionTenancy:
                return @"TENANCY";
            case AWSceDimensionScope:
                return @"SCOPE";
            case AWSceDimensionPlatform:
                return @"PLATFORM";
            case AWSceDimensionSubscriptionId:
                return @"SUBSCRIPTION_ID";
            case AWSceDimensionLegalEntityName:
                return @"LEGAL_ENTITY_NAME";
            case AWSceDimensionDeploymentOption:
                return @"DEPLOYMENT_OPTION";
            case AWSceDimensionDatabaseEngine:
                return @"DATABASE_ENGINE";
            case AWSceDimensionCacheEngine:
                return @"CACHE_ENGINE";
            case AWSceDimensionInstanceTypeFamily:
                return @"INSTANCE_TYPE_FAMILY";
            case AWSceDimensionBillingEntity:
                return @"BILLING_ENTITY";
            case AWSceDimensionReservationId:
                return @"RESERVATION_ID";
            case AWSceDimensionResourceId:
                return @"RESOURCE_ID";
            case AWSceDimensionRightsizingType:
                return @"RIGHTSIZING_TYPE";
            case AWSceDimensionSavingsPlansType:
                return @"SAVINGS_PLANS_TYPE";
            case AWSceDimensionSavingsPlanArn:
                return @"SAVINGS_PLAN_ARN";
            case AWSceDimensionPaymentOption:
                return @"PAYMENT_OPTION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSceDimensionValuesWithAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"value" : @"Value",
             };
}

@end

@implementation AWSceEC2InstanceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"currentGeneration" : @"CurrentGeneration",
             @"family" : @"Family",
             @"instanceType" : @"InstanceType",
             @"platform" : @"Platform",
             @"region" : @"Region",
             @"sizeFlexEligible" : @"SizeFlexEligible",
             @"tenancy" : @"Tenancy",
             };
}

@end

@implementation AWSceEC2ResourceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hourlyOnDemandRate" : @"HourlyOnDemandRate",
             @"instanceType" : @"InstanceType",
             @"memory" : @"Memory",
             @"networkPerformance" : @"NetworkPerformance",
             @"platform" : @"Platform",
             @"region" : @"Region",
             @"sku" : @"Sku",
             @"storage" : @"Storage",
             @"vcpu" : @"Vcpu",
             };
}

@end

@implementation AWSceEC2ResourceUtilization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxCpuUtilizationPercentage" : @"MaxCpuUtilizationPercentage",
             @"maxMemoryUtilizationPercentage" : @"MaxMemoryUtilizationPercentage",
             @"maxStorageUtilizationPercentage" : @"MaxStorageUtilizationPercentage",
             };
}

@end

@implementation AWSceEC2Specification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"offeringClass" : @"OfferingClass",
             };
}

+ (NSValueTransformer *)offeringClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSceOfferingClassStandard);
        }
        if ([value caseInsensitiveCompare:@"CONVERTIBLE"] == NSOrderedSame) {
            return @(AWSceOfferingClassConvertible);
        }
        return @(AWSceOfferingClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceOfferingClassStandard:
                return @"STANDARD";
            case AWSceOfferingClassConvertible:
                return @"CONVERTIBLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSceESInstanceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentGeneration" : @"CurrentGeneration",
             @"instanceClass" : @"InstanceClass",
             @"instanceSize" : @"InstanceSize",
             @"region" : @"Region",
             @"sizeFlexEligible" : @"SizeFlexEligible",
             };
}

@end

@implementation AWSceElastiCacheInstanceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentGeneration" : @"CurrentGeneration",
             @"family" : @"Family",
             @"nodeType" : @"NodeType",
             @"productDescription" : @"ProductDescription",
             @"region" : @"Region",
             @"sizeFlexEligible" : @"SizeFlexEligible",
             };
}

@end

@implementation AWSceExpression

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AND" : @"And",
             @"costCategories" : @"CostCategories",
             @"dimensions" : @"Dimensions",
             @"not" : @"Not",
             @"or" : @"Or",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)ANDJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)costCategoriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceCostCategoryValues class]];
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDimensionValues class]];
}

+ (NSValueTransformer *)notJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)orJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceTagValues class]];
}

@end

@implementation AWSceForecastResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meanValue" : @"MeanValue",
             @"predictionIntervalLowerBound" : @"PredictionIntervalLowerBound",
             @"predictionIntervalUpperBound" : @"PredictionIntervalUpperBound",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetCostAndUsageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"granularity" : @"Granularity",
             @"groupBy" : @"GroupBy",
             @"metrics" : @"Metrics",
             @"nextPageToken" : @"NextPageToken",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)granularityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSceGranularityDaily);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSceGranularityMonthly);
        }
        if ([value caseInsensitiveCompare:@"HOURLY"] == NSOrderedSame) {
            return @(AWSceGranularityHourly);
        }
        return @(AWSceGranularityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceGranularityDaily:
                return @"DAILY";
            case AWSceGranularityMonthly:
                return @"MONTHLY";
            case AWSceGranularityHourly:
                return @"HOURLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)groupByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceGroupDefinition class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetCostAndUsageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupDefinitions" : @"GroupDefinitions",
             @"nextPageToken" : @"NextPageToken",
             @"resultsByTime" : @"ResultsByTime",
             };
}

+ (NSValueTransformer *)groupDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceGroupDefinition class]];
}

+ (NSValueTransformer *)resultsByTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceResultByTime class]];
}

@end

@implementation AWSceGetCostAndUsageWithResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"granularity" : @"Granularity",
             @"groupBy" : @"GroupBy",
             @"metrics" : @"Metrics",
             @"nextPageToken" : @"NextPageToken",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)granularityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSceGranularityDaily);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSceGranularityMonthly);
        }
        if ([value caseInsensitiveCompare:@"HOURLY"] == NSOrderedSame) {
            return @(AWSceGranularityHourly);
        }
        return @(AWSceGranularityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceGranularityDaily:
                return @"DAILY";
            case AWSceGranularityMonthly:
                return @"MONTHLY";
            case AWSceGranularityHourly:
                return @"HOURLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)groupByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceGroupDefinition class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetCostAndUsageWithResourcesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupDefinitions" : @"GroupDefinitions",
             @"nextPageToken" : @"NextPageToken",
             @"resultsByTime" : @"ResultsByTime",
             };
}

+ (NSValueTransformer *)groupDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceGroupDefinition class]];
}

+ (NSValueTransformer *)resultsByTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceResultByTime class]];
}

@end

@implementation AWSceGetCostForecastRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"granularity" : @"Granularity",
             @"metric" : @"Metric",
             @"predictionIntervalLevel" : @"PredictionIntervalLevel",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)granularityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSceGranularityDaily);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSceGranularityMonthly);
        }
        if ([value caseInsensitiveCompare:@"HOURLY"] == NSOrderedSame) {
            return @(AWSceGranularityHourly);
        }
        return @(AWSceGranularityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceGranularityDaily:
                return @"DAILY";
            case AWSceGranularityMonthly:
                return @"MONTHLY";
            case AWSceGranularityHourly:
                return @"HOURLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metricJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLENDED_COST"] == NSOrderedSame) {
            return @(AWSceMetricBlendedCost);
        }
        if ([value caseInsensitiveCompare:@"UNBLENDED_COST"] == NSOrderedSame) {
            return @(AWSceMetricUnblendedCost);
        }
        if ([value caseInsensitiveCompare:@"AMORTIZED_COST"] == NSOrderedSame) {
            return @(AWSceMetricAmortizedCost);
        }
        if ([value caseInsensitiveCompare:@"NET_UNBLENDED_COST"] == NSOrderedSame) {
            return @(AWSceMetricNetUnblendedCost);
        }
        if ([value caseInsensitiveCompare:@"NET_AMORTIZED_COST"] == NSOrderedSame) {
            return @(AWSceMetricNetAmortizedCost);
        }
        if ([value caseInsensitiveCompare:@"USAGE_QUANTITY"] == NSOrderedSame) {
            return @(AWSceMetricUsageQuantity);
        }
        if ([value caseInsensitiveCompare:@"NORMALIZED_USAGE_AMOUNT"] == NSOrderedSame) {
            return @(AWSceMetricNormalizedUsageAmount);
        }
        return @(AWSceMetricUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceMetricBlendedCost:
                return @"BLENDED_COST";
            case AWSceMetricUnblendedCost:
                return @"UNBLENDED_COST";
            case AWSceMetricAmortizedCost:
                return @"AMORTIZED_COST";
            case AWSceMetricNetUnblendedCost:
                return @"NET_UNBLENDED_COST";
            case AWSceMetricNetAmortizedCost:
                return @"NET_AMORTIZED_COST";
            case AWSceMetricUsageQuantity:
                return @"USAGE_QUANTITY";
            case AWSceMetricNormalizedUsageAmount:
                return @"NORMALIZED_USAGE_AMOUNT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetCostForecastResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forecastResultsByTime" : @"ForecastResultsByTime",
             @"total" : @"Total",
             };
}

+ (NSValueTransformer *)forecastResultsByTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceForecastResult class]];
}

+ (NSValueTransformer *)totalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceMetricValue class]];
}

@end

@implementation AWSceGetDimensionValuesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"context" : @"Context",
             @"dimension" : @"Dimension",
             @"nextPageToken" : @"NextPageToken",
             @"searchString" : @"SearchString",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)contextJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COST_AND_USAGE"] == NSOrderedSame) {
            return @(AWSceContextCostAndUsage);
        }
        if ([value caseInsensitiveCompare:@"RESERVATIONS"] == NSOrderedSame) {
            return @(AWSceContextReservations);
        }
        if ([value caseInsensitiveCompare:@"SAVINGS_PLANS"] == NSOrderedSame) {
            return @(AWSceContextSavingsPlans);
        }
        return @(AWSceContextUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceContextCostAndUsage:
                return @"COST_AND_USAGE";
            case AWSceContextReservations:
                return @"RESERVATIONS";
            case AWSceContextSavingsPlans:
                return @"SAVINGS_PLANS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AZ"] == NSOrderedSame) {
            return @(AWSceDimensionAz);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionInstanceType);
        }
        if ([value caseInsensitiveCompare:@"LINKED_ACCOUNT"] == NSOrderedSame) {
            return @(AWSceDimensionLinkedAccount);
        }
        if ([value caseInsensitiveCompare:@"LINKED_ACCOUNT_NAME"] == NSOrderedSame) {
            return @(AWSceDimensionLinkedAccountName);
        }
        if ([value caseInsensitiveCompare:@"OPERATION"] == NSOrderedSame) {
            return @(AWSceDimensionOperation);
        }
        if ([value caseInsensitiveCompare:@"PURCHASE_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionPurchaseType);
        }
        if ([value caseInsensitiveCompare:@"REGION"] == NSOrderedSame) {
            return @(AWSceDimensionRegion);
        }
        if ([value caseInsensitiveCompare:@"SERVICE"] == NSOrderedSame) {
            return @(AWSceDimensionService);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_CODE"] == NSOrderedSame) {
            return @(AWSceDimensionServiceCode);
        }
        if ([value caseInsensitiveCompare:@"USAGE_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionUsageType);
        }
        if ([value caseInsensitiveCompare:@"USAGE_TYPE_GROUP"] == NSOrderedSame) {
            return @(AWSceDimensionUsageTypeGroup);
        }
        if ([value caseInsensitiveCompare:@"RECORD_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionRecordType);
        }
        if ([value caseInsensitiveCompare:@"OPERATING_SYSTEM"] == NSOrderedSame) {
            return @(AWSceDimensionOperatingSystem);
        }
        if ([value caseInsensitiveCompare:@"TENANCY"] == NSOrderedSame) {
            return @(AWSceDimensionTenancy);
        }
        if ([value caseInsensitiveCompare:@"SCOPE"] == NSOrderedSame) {
            return @(AWSceDimensionScope);
        }
        if ([value caseInsensitiveCompare:@"PLATFORM"] == NSOrderedSame) {
            return @(AWSceDimensionPlatform);
        }
        if ([value caseInsensitiveCompare:@"SUBSCRIPTION_ID"] == NSOrderedSame) {
            return @(AWSceDimensionSubscriptionId);
        }
        if ([value caseInsensitiveCompare:@"LEGAL_ENTITY_NAME"] == NSOrderedSame) {
            return @(AWSceDimensionLegalEntityName);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYMENT_OPTION"] == NSOrderedSame) {
            return @(AWSceDimensionDeploymentOption);
        }
        if ([value caseInsensitiveCompare:@"DATABASE_ENGINE"] == NSOrderedSame) {
            return @(AWSceDimensionDatabaseEngine);
        }
        if ([value caseInsensitiveCompare:@"CACHE_ENGINE"] == NSOrderedSame) {
            return @(AWSceDimensionCacheEngine);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_TYPE_FAMILY"] == NSOrderedSame) {
            return @(AWSceDimensionInstanceTypeFamily);
        }
        if ([value caseInsensitiveCompare:@"BILLING_ENTITY"] == NSOrderedSame) {
            return @(AWSceDimensionBillingEntity);
        }
        if ([value caseInsensitiveCompare:@"RESERVATION_ID"] == NSOrderedSame) {
            return @(AWSceDimensionReservationId);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_ID"] == NSOrderedSame) {
            return @(AWSceDimensionResourceId);
        }
        if ([value caseInsensitiveCompare:@"RIGHTSIZING_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionRightsizingType);
        }
        if ([value caseInsensitiveCompare:@"SAVINGS_PLANS_TYPE"] == NSOrderedSame) {
            return @(AWSceDimensionSavingsPlansType);
        }
        if ([value caseInsensitiveCompare:@"SAVINGS_PLAN_ARN"] == NSOrderedSame) {
            return @(AWSceDimensionSavingsPlanArn);
        }
        if ([value caseInsensitiveCompare:@"PAYMENT_OPTION"] == NSOrderedSame) {
            return @(AWSceDimensionPaymentOption);
        }
        return @(AWSceDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceDimensionAz:
                return @"AZ";
            case AWSceDimensionInstanceType:
                return @"INSTANCE_TYPE";
            case AWSceDimensionLinkedAccount:
                return @"LINKED_ACCOUNT";
            case AWSceDimensionLinkedAccountName:
                return @"LINKED_ACCOUNT_NAME";
            case AWSceDimensionOperation:
                return @"OPERATION";
            case AWSceDimensionPurchaseType:
                return @"PURCHASE_TYPE";
            case AWSceDimensionRegion:
                return @"REGION";
            case AWSceDimensionService:
                return @"SERVICE";
            case AWSceDimensionServiceCode:
                return @"SERVICE_CODE";
            case AWSceDimensionUsageType:
                return @"USAGE_TYPE";
            case AWSceDimensionUsageTypeGroup:
                return @"USAGE_TYPE_GROUP";
            case AWSceDimensionRecordType:
                return @"RECORD_TYPE";
            case AWSceDimensionOperatingSystem:
                return @"OPERATING_SYSTEM";
            case AWSceDimensionTenancy:
                return @"TENANCY";
            case AWSceDimensionScope:
                return @"SCOPE";
            case AWSceDimensionPlatform:
                return @"PLATFORM";
            case AWSceDimensionSubscriptionId:
                return @"SUBSCRIPTION_ID";
            case AWSceDimensionLegalEntityName:
                return @"LEGAL_ENTITY_NAME";
            case AWSceDimensionDeploymentOption:
                return @"DEPLOYMENT_OPTION";
            case AWSceDimensionDatabaseEngine:
                return @"DATABASE_ENGINE";
            case AWSceDimensionCacheEngine:
                return @"CACHE_ENGINE";
            case AWSceDimensionInstanceTypeFamily:
                return @"INSTANCE_TYPE_FAMILY";
            case AWSceDimensionBillingEntity:
                return @"BILLING_ENTITY";
            case AWSceDimensionReservationId:
                return @"RESERVATION_ID";
            case AWSceDimensionResourceId:
                return @"RESOURCE_ID";
            case AWSceDimensionRightsizingType:
                return @"RIGHTSIZING_TYPE";
            case AWSceDimensionSavingsPlansType:
                return @"SAVINGS_PLANS_TYPE";
            case AWSceDimensionSavingsPlanArn:
                return @"SAVINGS_PLAN_ARN";
            case AWSceDimensionPaymentOption:
                return @"PAYMENT_OPTION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetDimensionValuesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensionValues" : @"DimensionValues",
             @"nextPageToken" : @"NextPageToken",
             @"returnSize" : @"ReturnSize",
             @"totalSize" : @"TotalSize",
             };
}

+ (NSValueTransformer *)dimensionValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceDimensionValuesWithAttributes class]];
}

@end

@implementation AWSceGetReservationCoverageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"granularity" : @"Granularity",
             @"groupBy" : @"GroupBy",
             @"metrics" : @"Metrics",
             @"nextPageToken" : @"NextPageToken",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)granularityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSceGranularityDaily);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSceGranularityMonthly);
        }
        if ([value caseInsensitiveCompare:@"HOURLY"] == NSOrderedSame) {
            return @(AWSceGranularityHourly);
        }
        return @(AWSceGranularityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceGranularityDaily:
                return @"DAILY";
            case AWSceGranularityMonthly:
                return @"MONTHLY";
            case AWSceGranularityHourly:
                return @"HOURLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)groupByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceGroupDefinition class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetReservationCoverageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"coveragesByTime" : @"CoveragesByTime",
             @"nextPageToken" : @"NextPageToken",
             @"total" : @"Total",
             };
}

+ (NSValueTransformer *)coveragesByTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceCoverageByTime class]];
}

+ (NSValueTransformer *)totalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceCoverage class]];
}

@end

@implementation AWSceGetReservationPurchaseRecommendationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"accountScope" : @"AccountScope",
             @"lookbackPeriodInDays" : @"LookbackPeriodInDays",
             @"nextPageToken" : @"NextPageToken",
             @"pageSize" : @"PageSize",
             @"paymentOption" : @"PaymentOption",
             @"service" : @"Service",
             @"serviceSpecification" : @"ServiceSpecification",
             @"termInYears" : @"TermInYears",
             };
}

+ (NSValueTransformer *)accountScopeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PAYER"] == NSOrderedSame) {
            return @(AWSceAccountScopePayer);
        }
        if ([value caseInsensitiveCompare:@"LINKED"] == NSOrderedSame) {
            return @(AWSceAccountScopeLinked);
        }
        return @(AWSceAccountScopeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceAccountScopePayer:
                return @"PAYER";
            case AWSceAccountScopeLinked:
                return @"LINKED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lookbackPeriodInDaysJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SEVEN_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysSevenDays);
        }
        if ([value caseInsensitiveCompare:@"THIRTY_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysThirtyDays);
        }
        if ([value caseInsensitiveCompare:@"SIXTY_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysSixtyDays);
        }
        return @(AWSceLookbackPeriodInDaysUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceLookbackPeriodInDaysSevenDays:
                return @"SEVEN_DAYS";
            case AWSceLookbackPeriodInDaysThirtyDays:
                return @"THIRTY_DAYS";
            case AWSceLookbackPeriodInDaysSixtyDays:
                return @"SIXTY_DAYS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)paymentOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionNoUpfront);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"ALL_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionAllUpfront);
        }
        if ([value caseInsensitiveCompare:@"LIGHT_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionLightUtilization);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionMediumUtilization);
        }
        if ([value caseInsensitiveCompare:@"HEAVY_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionHeavyUtilization);
        }
        return @(AWScePaymentOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScePaymentOptionNoUpfront:
                return @"NO_UPFRONT";
            case AWScePaymentOptionPartialUpfront:
                return @"PARTIAL_UPFRONT";
            case AWScePaymentOptionAllUpfront:
                return @"ALL_UPFRONT";
            case AWScePaymentOptionLightUtilization:
                return @"LIGHT_UTILIZATION";
            case AWScePaymentOptionMediumUtilization:
                return @"MEDIUM_UTILIZATION";
            case AWScePaymentOptionHeavyUtilization:
                return @"HEAVY_UTILIZATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceServiceSpecification class]];
}

+ (NSValueTransformer *)termInYearsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_YEAR"] == NSOrderedSame) {
            return @(AWSceTermInYearsOneYear);
        }
        if ([value caseInsensitiveCompare:@"THREE_YEARS"] == NSOrderedSame) {
            return @(AWSceTermInYearsThreeYears);
        }
        return @(AWSceTermInYearsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceTermInYearsOneYear:
                return @"ONE_YEAR";
            case AWSceTermInYearsThreeYears:
                return @"THREE_YEARS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSceGetReservationPurchaseRecommendationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metadata" : @"Metadata",
             @"nextPageToken" : @"NextPageToken",
             @"recommendations" : @"Recommendations",
             };
}

+ (NSValueTransformer *)metadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceReservationPurchaseRecommendationMetadata class]];
}

+ (NSValueTransformer *)recommendationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceReservationPurchaseRecommendation class]];
}

@end

@implementation AWSceGetReservationUtilizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"granularity" : @"Granularity",
             @"groupBy" : @"GroupBy",
             @"nextPageToken" : @"NextPageToken",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)granularityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSceGranularityDaily);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSceGranularityMonthly);
        }
        if ([value caseInsensitiveCompare:@"HOURLY"] == NSOrderedSame) {
            return @(AWSceGranularityHourly);
        }
        return @(AWSceGranularityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceGranularityDaily:
                return @"DAILY";
            case AWSceGranularityMonthly:
                return @"MONTHLY";
            case AWSceGranularityHourly:
                return @"HOURLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)groupByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceGroupDefinition class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetReservationUtilizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"total" : @"Total",
             @"utilizationsByTime" : @"UtilizationsByTime",
             };
}

+ (NSValueTransformer *)totalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceReservationAggregates class]];
}

+ (NSValueTransformer *)utilizationsByTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceUtilizationByTime class]];
}

@end

@implementation AWSceGetRightsizingRecommendationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"nextPageToken" : @"NextPageToken",
             @"pageSize" : @"PageSize",
             @"service" : @"Service",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

@end

@implementation AWSceGetRightsizingRecommendationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metadata" : @"Metadata",
             @"nextPageToken" : @"NextPageToken",
             @"rightsizingRecommendations" : @"RightsizingRecommendations",
             @"summary" : @"Summary",
             };
}

+ (NSValueTransformer *)metadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceRightsizingRecommendationMetadata class]];
}

+ (NSValueTransformer *)rightsizingRecommendationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceRightsizingRecommendation class]];
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceRightsizingRecommendationSummary class]];
}

@end

@implementation AWSceGetSavingsPlansCoverageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"granularity" : @"Granularity",
             @"groupBy" : @"GroupBy",
             @"maxResults" : @"MaxResults",
             @"metrics" : @"Metrics",
             @"nextToken" : @"NextToken",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)granularityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSceGranularityDaily);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSceGranularityMonthly);
        }
        if ([value caseInsensitiveCompare:@"HOURLY"] == NSOrderedSame) {
            return @(AWSceGranularityHourly);
        }
        return @(AWSceGranularityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceGranularityDaily:
                return @"DAILY";
            case AWSceGranularityMonthly:
                return @"MONTHLY";
            case AWSceGranularityHourly:
                return @"HOURLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)groupByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceGroupDefinition class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetSavingsPlansCoverageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"savingsPlansCoverages" : @"SavingsPlansCoverages",
             };
}

+ (NSValueTransformer *)savingsPlansCoveragesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceSavingsPlansCoverage class]];
}

@end

@implementation AWSceGetSavingsPlansPurchaseRecommendationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountScope" : @"AccountScope",
             @"filter" : @"Filter",
             @"lookbackPeriodInDays" : @"LookbackPeriodInDays",
             @"nextPageToken" : @"NextPageToken",
             @"pageSize" : @"PageSize",
             @"paymentOption" : @"PaymentOption",
             @"savingsPlansType" : @"SavingsPlansType",
             @"termInYears" : @"TermInYears",
             };
}

+ (NSValueTransformer *)accountScopeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PAYER"] == NSOrderedSame) {
            return @(AWSceAccountScopePayer);
        }
        if ([value caseInsensitiveCompare:@"LINKED"] == NSOrderedSame) {
            return @(AWSceAccountScopeLinked);
        }
        return @(AWSceAccountScopeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceAccountScopePayer:
                return @"PAYER";
            case AWSceAccountScopeLinked:
                return @"LINKED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)lookbackPeriodInDaysJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SEVEN_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysSevenDays);
        }
        if ([value caseInsensitiveCompare:@"THIRTY_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysThirtyDays);
        }
        if ([value caseInsensitiveCompare:@"SIXTY_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysSixtyDays);
        }
        return @(AWSceLookbackPeriodInDaysUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceLookbackPeriodInDaysSevenDays:
                return @"SEVEN_DAYS";
            case AWSceLookbackPeriodInDaysThirtyDays:
                return @"THIRTY_DAYS";
            case AWSceLookbackPeriodInDaysSixtyDays:
                return @"SIXTY_DAYS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)paymentOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionNoUpfront);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"ALL_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionAllUpfront);
        }
        if ([value caseInsensitiveCompare:@"LIGHT_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionLightUtilization);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionMediumUtilization);
        }
        if ([value caseInsensitiveCompare:@"HEAVY_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionHeavyUtilization);
        }
        return @(AWScePaymentOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScePaymentOptionNoUpfront:
                return @"NO_UPFRONT";
            case AWScePaymentOptionPartialUpfront:
                return @"PARTIAL_UPFRONT";
            case AWScePaymentOptionAllUpfront:
                return @"ALL_UPFRONT";
            case AWScePaymentOptionLightUtilization:
                return @"LIGHT_UTILIZATION";
            case AWScePaymentOptionMediumUtilization:
                return @"MEDIUM_UTILIZATION";
            case AWScePaymentOptionHeavyUtilization:
                return @"HEAVY_UTILIZATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)savingsPlansTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPUTE_SP"] == NSOrderedSame) {
            return @(AWSceSupportedSavingsPlansTypeComputeSp);
        }
        if ([value caseInsensitiveCompare:@"EC2_INSTANCE_SP"] == NSOrderedSame) {
            return @(AWSceSupportedSavingsPlansTypeEc2InstanceSp);
        }
        return @(AWSceSupportedSavingsPlansTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceSupportedSavingsPlansTypeComputeSp:
                return @"COMPUTE_SP";
            case AWSceSupportedSavingsPlansTypeEc2InstanceSp:
                return @"EC2_INSTANCE_SP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)termInYearsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_YEAR"] == NSOrderedSame) {
            return @(AWSceTermInYearsOneYear);
        }
        if ([value caseInsensitiveCompare:@"THREE_YEARS"] == NSOrderedSame) {
            return @(AWSceTermInYearsThreeYears);
        }
        return @(AWSceTermInYearsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceTermInYearsOneYear:
                return @"ONE_YEAR";
            case AWSceTermInYearsThreeYears:
                return @"THREE_YEARS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSceGetSavingsPlansPurchaseRecommendationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metadata" : @"Metadata",
             @"nextPageToken" : @"NextPageToken",
             @"savingsPlansPurchaseRecommendation" : @"SavingsPlansPurchaseRecommendation",
             };
}

+ (NSValueTransformer *)metadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansPurchaseRecommendationMetadata class]];
}

+ (NSValueTransformer *)savingsPlansPurchaseRecommendationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansPurchaseRecommendation class]];
}

@end

@implementation AWSceGetSavingsPlansUtilizationDetailsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetSavingsPlansUtilizationDetailsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"savingsPlansUtilizationDetails" : @"SavingsPlansUtilizationDetails",
             @"timePeriod" : @"TimePeriod",
             @"total" : @"Total",
             };
}

+ (NSValueTransformer *)savingsPlansUtilizationDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceSavingsPlansUtilizationDetail class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

+ (NSValueTransformer *)totalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansUtilizationAggregates class]];
}

@end

@implementation AWSceGetSavingsPlansUtilizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"granularity" : @"Granularity",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)granularityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSceGranularityDaily);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSceGranularityMonthly);
        }
        if ([value caseInsensitiveCompare:@"HOURLY"] == NSOrderedSame) {
            return @(AWSceGranularityHourly);
        }
        return @(AWSceGranularityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceGranularityDaily:
                return @"DAILY";
            case AWSceGranularityMonthly:
                return @"MONTHLY";
            case AWSceGranularityHourly:
                return @"HOURLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetSavingsPlansUtilizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"savingsPlansUtilizationsByTime" : @"SavingsPlansUtilizationsByTime",
             @"total" : @"Total",
             };
}

+ (NSValueTransformer *)savingsPlansUtilizationsByTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceSavingsPlansUtilizationByTime class]];
}

+ (NSValueTransformer *)totalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansUtilizationAggregates class]];
}

@end

@implementation AWSceGetTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"searchString" : @"SearchString",
             @"tagKey" : @"TagKey",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"returnSize" : @"ReturnSize",
             @"tags" : @"Tags",
             @"totalSize" : @"TotalSize",
             };
}

@end

@implementation AWSceGetUsageForecastRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"granularity" : @"Granularity",
             @"metric" : @"Metric",
             @"predictionIntervalLevel" : @"PredictionIntervalLevel",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceExpression class]];
}

+ (NSValueTransformer *)granularityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSceGranularityDaily);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSceGranularityMonthly);
        }
        if ([value caseInsensitiveCompare:@"HOURLY"] == NSOrderedSame) {
            return @(AWSceGranularityHourly);
        }
        return @(AWSceGranularityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceGranularityDaily:
                return @"DAILY";
            case AWSceGranularityMonthly:
                return @"MONTHLY";
            case AWSceGranularityHourly:
                return @"HOURLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metricJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLENDED_COST"] == NSOrderedSame) {
            return @(AWSceMetricBlendedCost);
        }
        if ([value caseInsensitiveCompare:@"UNBLENDED_COST"] == NSOrderedSame) {
            return @(AWSceMetricUnblendedCost);
        }
        if ([value caseInsensitiveCompare:@"AMORTIZED_COST"] == NSOrderedSame) {
            return @(AWSceMetricAmortizedCost);
        }
        if ([value caseInsensitiveCompare:@"NET_UNBLENDED_COST"] == NSOrderedSame) {
            return @(AWSceMetricNetUnblendedCost);
        }
        if ([value caseInsensitiveCompare:@"NET_AMORTIZED_COST"] == NSOrderedSame) {
            return @(AWSceMetricNetAmortizedCost);
        }
        if ([value caseInsensitiveCompare:@"USAGE_QUANTITY"] == NSOrderedSame) {
            return @(AWSceMetricUsageQuantity);
        }
        if ([value caseInsensitiveCompare:@"NORMALIZED_USAGE_AMOUNT"] == NSOrderedSame) {
            return @(AWSceMetricNormalizedUsageAmount);
        }
        return @(AWSceMetricUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceMetricBlendedCost:
                return @"BLENDED_COST";
            case AWSceMetricUnblendedCost:
                return @"UNBLENDED_COST";
            case AWSceMetricAmortizedCost:
                return @"AMORTIZED_COST";
            case AWSceMetricNetUnblendedCost:
                return @"NET_UNBLENDED_COST";
            case AWSceMetricNetAmortizedCost:
                return @"NET_AMORTIZED_COST";
            case AWSceMetricUsageQuantity:
                return @"USAGE_QUANTITY";
            case AWSceMetricNormalizedUsageAmount:
                return @"NORMALIZED_USAGE_AMOUNT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceGetUsageForecastResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forecastResultsByTime" : @"ForecastResultsByTime",
             @"total" : @"Total",
             };
}

+ (NSValueTransformer *)forecastResultsByTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceForecastResult class]];
}

+ (NSValueTransformer *)totalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceMetricValue class]];
}

@end

@implementation AWSceGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keys" : @"Keys",
             @"metrics" : @"Metrics",
             };
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSceMetricValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSceGroupDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DIMENSION"] == NSOrderedSame) {
            return @(AWSceGroupDefinitionTypeDimension);
        }
        if ([value caseInsensitiveCompare:@"TAG"] == NSOrderedSame) {
            return @(AWSceGroupDefinitionTypeTag);
        }
        if ([value caseInsensitiveCompare:@"COST_CATEGORY"] == NSOrderedSame) {
            return @(AWSceGroupDefinitionTypeCostCategory);
        }
        return @(AWSceGroupDefinitionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceGroupDefinitionTypeDimension:
                return @"DIMENSION";
            case AWSceGroupDefinitionTypeTag:
                return @"TAG";
            case AWSceGroupDefinitionTypeCostCategory:
                return @"COST_CATEGORY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSceInstanceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EC2InstanceDetails" : @"EC2InstanceDetails",
             @"ESInstanceDetails" : @"ESInstanceDetails",
             @"elastiCacheInstanceDetails" : @"ElastiCacheInstanceDetails",
             @"RDSInstanceDetails" : @"RDSInstanceDetails",
             @"redshiftInstanceDetails" : @"RedshiftInstanceDetails",
             };
}

+ (NSValueTransformer *)EC2InstanceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceEC2InstanceDetails class]];
}

+ (NSValueTransformer *)ESInstanceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceESInstanceDetails class]];
}

+ (NSValueTransformer *)elastiCacheInstanceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceElastiCacheInstanceDetails class]];
}

+ (NSValueTransformer *)RDSInstanceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceRDSInstanceDetails class]];
}

+ (NSValueTransformer *)redshiftInstanceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceRedshiftInstanceDetails class]];
}

@end

@implementation AWSceListCostCategoryDefinitionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"effectiveOn" : @"EffectiveOn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSceListCostCategoryDefinitionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costCategoryReferences" : @"CostCategoryReferences",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)costCategoryReferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceCostCategoryReference class]];
}

@end

@implementation AWSceMetricValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amount" : @"Amount",
             @"unit" : @"Unit",
             };
}

@end

@implementation AWSceModifyRecommendationDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetInstances" : @"TargetInstances",
             };
}

+ (NSValueTransformer *)targetInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceTargetInstance class]];
}

@end

@implementation AWSceRDSInstanceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentGeneration" : @"CurrentGeneration",
             @"databaseEdition" : @"DatabaseEdition",
             @"databaseEngine" : @"DatabaseEngine",
             @"deploymentOption" : @"DeploymentOption",
             @"family" : @"Family",
             @"instanceType" : @"InstanceType",
             @"licenseModel" : @"LicenseModel",
             @"region" : @"Region",
             @"sizeFlexEligible" : @"SizeFlexEligible",
             };
}

@end

@implementation AWSceRedshiftInstanceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentGeneration" : @"CurrentGeneration",
             @"family" : @"Family",
             @"nodeType" : @"NodeType",
             @"region" : @"Region",
             @"sizeFlexEligible" : @"SizeFlexEligible",
             };
}

@end

@implementation AWSceReservationAggregates

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amortizedRecurringFee" : @"AmortizedRecurringFee",
             @"amortizedUpfrontFee" : @"AmortizedUpfrontFee",
             @"netRISavings" : @"NetRISavings",
             @"onDemandCostOfRIHoursUsed" : @"OnDemandCostOfRIHoursUsed",
             @"purchasedHours" : @"PurchasedHours",
             @"purchasedUnits" : @"PurchasedUnits",
             @"totalActualHours" : @"TotalActualHours",
             @"totalActualUnits" : @"TotalActualUnits",
             @"totalAmortizedFee" : @"TotalAmortizedFee",
             @"totalPotentialRISavings" : @"TotalPotentialRISavings",
             @"unusedHours" : @"UnusedHours",
             @"unusedUnits" : @"UnusedUnits",
             @"utilizationPercentage" : @"UtilizationPercentage",
             @"utilizationPercentageInUnits" : @"UtilizationPercentageInUnits",
             };
}

@end

@implementation AWSceReservationCoverageGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"coverage" : @"Coverage",
             };
}

+ (NSValueTransformer *)coverageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceCoverage class]];
}

@end

@implementation AWSceReservationPurchaseRecommendation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountScope" : @"AccountScope",
             @"lookbackPeriodInDays" : @"LookbackPeriodInDays",
             @"paymentOption" : @"PaymentOption",
             @"recommendationDetails" : @"RecommendationDetails",
             @"recommendationSummary" : @"RecommendationSummary",
             @"serviceSpecification" : @"ServiceSpecification",
             @"termInYears" : @"TermInYears",
             };
}

+ (NSValueTransformer *)accountScopeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PAYER"] == NSOrderedSame) {
            return @(AWSceAccountScopePayer);
        }
        if ([value caseInsensitiveCompare:@"LINKED"] == NSOrderedSame) {
            return @(AWSceAccountScopeLinked);
        }
        return @(AWSceAccountScopeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceAccountScopePayer:
                return @"PAYER";
            case AWSceAccountScopeLinked:
                return @"LINKED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lookbackPeriodInDaysJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SEVEN_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysSevenDays);
        }
        if ([value caseInsensitiveCompare:@"THIRTY_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysThirtyDays);
        }
        if ([value caseInsensitiveCompare:@"SIXTY_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysSixtyDays);
        }
        return @(AWSceLookbackPeriodInDaysUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceLookbackPeriodInDaysSevenDays:
                return @"SEVEN_DAYS";
            case AWSceLookbackPeriodInDaysThirtyDays:
                return @"THIRTY_DAYS";
            case AWSceLookbackPeriodInDaysSixtyDays:
                return @"SIXTY_DAYS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)paymentOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionNoUpfront);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"ALL_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionAllUpfront);
        }
        if ([value caseInsensitiveCompare:@"LIGHT_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionLightUtilization);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionMediumUtilization);
        }
        if ([value caseInsensitiveCompare:@"HEAVY_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionHeavyUtilization);
        }
        return @(AWScePaymentOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScePaymentOptionNoUpfront:
                return @"NO_UPFRONT";
            case AWScePaymentOptionPartialUpfront:
                return @"PARTIAL_UPFRONT";
            case AWScePaymentOptionAllUpfront:
                return @"ALL_UPFRONT";
            case AWScePaymentOptionLightUtilization:
                return @"LIGHT_UTILIZATION";
            case AWScePaymentOptionMediumUtilization:
                return @"MEDIUM_UTILIZATION";
            case AWScePaymentOptionHeavyUtilization:
                return @"HEAVY_UTILIZATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recommendationDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceReservationPurchaseRecommendationDetail class]];
}

+ (NSValueTransformer *)recommendationSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceReservationPurchaseRecommendationSummary class]];
}

+ (NSValueTransformer *)serviceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceServiceSpecification class]];
}

+ (NSValueTransformer *)termInYearsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_YEAR"] == NSOrderedSame) {
            return @(AWSceTermInYearsOneYear);
        }
        if ([value caseInsensitiveCompare:@"THREE_YEARS"] == NSOrderedSame) {
            return @(AWSceTermInYearsThreeYears);
        }
        return @(AWSceTermInYearsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceTermInYearsOneYear:
                return @"ONE_YEAR";
            case AWSceTermInYearsThreeYears:
                return @"THREE_YEARS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSceReservationPurchaseRecommendationDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"averageNormalizedUnitsUsedPerHour" : @"AverageNormalizedUnitsUsedPerHour",
             @"averageNumberOfInstancesUsedPerHour" : @"AverageNumberOfInstancesUsedPerHour",
             @"averageUtilization" : @"AverageUtilization",
             @"currencyCode" : @"CurrencyCode",
             @"estimatedBreakEvenInMonths" : @"EstimatedBreakEvenInMonths",
             @"estimatedMonthlyOnDemandCost" : @"EstimatedMonthlyOnDemandCost",
             @"estimatedMonthlySavingsAmount" : @"EstimatedMonthlySavingsAmount",
             @"estimatedMonthlySavingsPercentage" : @"EstimatedMonthlySavingsPercentage",
             @"estimatedReservationCostForLookbackPeriod" : @"EstimatedReservationCostForLookbackPeriod",
             @"instanceDetails" : @"InstanceDetails",
             @"maximumNormalizedUnitsUsedPerHour" : @"MaximumNormalizedUnitsUsedPerHour",
             @"maximumNumberOfInstancesUsedPerHour" : @"MaximumNumberOfInstancesUsedPerHour",
             @"minimumNormalizedUnitsUsedPerHour" : @"MinimumNormalizedUnitsUsedPerHour",
             @"minimumNumberOfInstancesUsedPerHour" : @"MinimumNumberOfInstancesUsedPerHour",
             @"recommendedNormalizedUnitsToPurchase" : @"RecommendedNormalizedUnitsToPurchase",
             @"recommendedNumberOfInstancesToPurchase" : @"RecommendedNumberOfInstancesToPurchase",
             @"recurringStandardMonthlyCost" : @"RecurringStandardMonthlyCost",
             @"upfrontCost" : @"UpfrontCost",
             };
}

+ (NSValueTransformer *)instanceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceInstanceDetails class]];
}

@end

@implementation AWSceReservationPurchaseRecommendationMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"generationTimestamp" : @"GenerationTimestamp",
             @"recommendationId" : @"RecommendationId",
             };
}

@end

@implementation AWSceReservationPurchaseRecommendationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"totalEstimatedMonthlySavingsAmount" : @"TotalEstimatedMonthlySavingsAmount",
             @"totalEstimatedMonthlySavingsPercentage" : @"TotalEstimatedMonthlySavingsPercentage",
             };
}

@end

@implementation AWSceReservationUtilizationGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"key" : @"Key",
             @"utilization" : @"Utilization",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)utilizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceReservationAggregates class]];
}

@end

@implementation AWSceResourceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EC2ResourceDetails" : @"EC2ResourceDetails",
             };
}

+ (NSValueTransformer *)EC2ResourceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceEC2ResourceDetails class]];
}

@end

@implementation AWSceResourceUtilization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EC2ResourceUtilization" : @"EC2ResourceUtilization",
             };
}

+ (NSValueTransformer *)EC2ResourceUtilizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceEC2ResourceUtilization class]];
}

@end

@implementation AWSceResultByTime

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"estimated" : @"Estimated",
             @"groups" : @"Groups",
             @"timePeriod" : @"TimePeriod",
             @"total" : @"Total",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceGroup class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

+ (NSValueTransformer *)totalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSceMetricValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSceRightsizingRecommendation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"currentInstance" : @"CurrentInstance",
             @"modifyRecommendationDetail" : @"ModifyRecommendationDetail",
             @"rightsizingType" : @"RightsizingType",
             @"terminateRecommendationDetail" : @"TerminateRecommendationDetail",
             };
}

+ (NSValueTransformer *)currentInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceCurrentInstance class]];
}

+ (NSValueTransformer *)modifyRecommendationDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceModifyRecommendationDetail class]];
}

+ (NSValueTransformer *)rightsizingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TERMINATE"] == NSOrderedSame) {
            return @(AWSceRightsizingTypeTerminate);
        }
        if ([value caseInsensitiveCompare:@"MODIFY"] == NSOrderedSame) {
            return @(AWSceRightsizingTypeModify);
        }
        return @(AWSceRightsizingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceRightsizingTypeTerminate:
                return @"TERMINATE";
            case AWSceRightsizingTypeModify:
                return @"MODIFY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)terminateRecommendationDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceTerminateRecommendationDetail class]];
}

@end

@implementation AWSceRightsizingRecommendationMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"generationTimestamp" : @"GenerationTimestamp",
             @"lookbackPeriodInDays" : @"LookbackPeriodInDays",
             @"recommendationId" : @"RecommendationId",
             };
}

+ (NSValueTransformer *)lookbackPeriodInDaysJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SEVEN_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysSevenDays);
        }
        if ([value caseInsensitiveCompare:@"THIRTY_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysThirtyDays);
        }
        if ([value caseInsensitiveCompare:@"SIXTY_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysSixtyDays);
        }
        return @(AWSceLookbackPeriodInDaysUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceLookbackPeriodInDaysSevenDays:
                return @"SEVEN_DAYS";
            case AWSceLookbackPeriodInDaysThirtyDays:
                return @"THIRTY_DAYS";
            case AWSceLookbackPeriodInDaysSixtyDays:
                return @"SIXTY_DAYS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSceRightsizingRecommendationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"estimatedTotalMonthlySavingsAmount" : @"EstimatedTotalMonthlySavingsAmount",
             @"savingsCurrencyCode" : @"SavingsCurrencyCode",
             @"savingsPercentage" : @"SavingsPercentage",
             @"totalRecommendationCount" : @"TotalRecommendationCount",
             };
}

@end

@implementation AWSceSavingsPlansAmortizedCommitment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amortizedRecurringCommitment" : @"AmortizedRecurringCommitment",
             @"amortizedUpfrontCommitment" : @"AmortizedUpfrontCommitment",
             @"totalAmortizedCommitment" : @"TotalAmortizedCommitment",
             };
}

@end

@implementation AWSceSavingsPlansCoverage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"coverage" : @"Coverage",
             @"timePeriod" : @"TimePeriod",
             };
}

+ (NSValueTransformer *)coverageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansCoverageData class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

@end

@implementation AWSceSavingsPlansCoverageData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"coveragePercentage" : @"CoveragePercentage",
             @"onDemandCost" : @"OnDemandCost",
             @"spendCoveredBySavingsPlans" : @"SpendCoveredBySavingsPlans",
             @"totalCost" : @"TotalCost",
             };
}

@end

@implementation AWSceSavingsPlansDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceFamily" : @"InstanceFamily",
             @"offeringId" : @"OfferingId",
             @"region" : @"Region",
             };
}

@end

@implementation AWSceSavingsPlansPurchaseRecommendation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountScope" : @"AccountScope",
             @"lookbackPeriodInDays" : @"LookbackPeriodInDays",
             @"paymentOption" : @"PaymentOption",
             @"savingsPlansPurchaseRecommendationDetails" : @"SavingsPlansPurchaseRecommendationDetails",
             @"savingsPlansPurchaseRecommendationSummary" : @"SavingsPlansPurchaseRecommendationSummary",
             @"savingsPlansType" : @"SavingsPlansType",
             @"termInYears" : @"TermInYears",
             };
}

+ (NSValueTransformer *)accountScopeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PAYER"] == NSOrderedSame) {
            return @(AWSceAccountScopePayer);
        }
        if ([value caseInsensitiveCompare:@"LINKED"] == NSOrderedSame) {
            return @(AWSceAccountScopeLinked);
        }
        return @(AWSceAccountScopeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceAccountScopePayer:
                return @"PAYER";
            case AWSceAccountScopeLinked:
                return @"LINKED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lookbackPeriodInDaysJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SEVEN_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysSevenDays);
        }
        if ([value caseInsensitiveCompare:@"THIRTY_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysThirtyDays);
        }
        if ([value caseInsensitiveCompare:@"SIXTY_DAYS"] == NSOrderedSame) {
            return @(AWSceLookbackPeriodInDaysSixtyDays);
        }
        return @(AWSceLookbackPeriodInDaysUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceLookbackPeriodInDaysSevenDays:
                return @"SEVEN_DAYS";
            case AWSceLookbackPeriodInDaysThirtyDays:
                return @"THIRTY_DAYS";
            case AWSceLookbackPeriodInDaysSixtyDays:
                return @"SIXTY_DAYS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)paymentOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionNoUpfront);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"ALL_UPFRONT"] == NSOrderedSame) {
            return @(AWScePaymentOptionAllUpfront);
        }
        if ([value caseInsensitiveCompare:@"LIGHT_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionLightUtilization);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionMediumUtilization);
        }
        if ([value caseInsensitiveCompare:@"HEAVY_UTILIZATION"] == NSOrderedSame) {
            return @(AWScePaymentOptionHeavyUtilization);
        }
        return @(AWScePaymentOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScePaymentOptionNoUpfront:
                return @"NO_UPFRONT";
            case AWScePaymentOptionPartialUpfront:
                return @"PARTIAL_UPFRONT";
            case AWScePaymentOptionAllUpfront:
                return @"ALL_UPFRONT";
            case AWScePaymentOptionLightUtilization:
                return @"LIGHT_UTILIZATION";
            case AWScePaymentOptionMediumUtilization:
                return @"MEDIUM_UTILIZATION";
            case AWScePaymentOptionHeavyUtilization:
                return @"HEAVY_UTILIZATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)savingsPlansPurchaseRecommendationDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceSavingsPlansPurchaseRecommendationDetail class]];
}

+ (NSValueTransformer *)savingsPlansPurchaseRecommendationSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansPurchaseRecommendationSummary class]];
}

+ (NSValueTransformer *)savingsPlansTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPUTE_SP"] == NSOrderedSame) {
            return @(AWSceSupportedSavingsPlansTypeComputeSp);
        }
        if ([value caseInsensitiveCompare:@"EC2_INSTANCE_SP"] == NSOrderedSame) {
            return @(AWSceSupportedSavingsPlansTypeEc2InstanceSp);
        }
        return @(AWSceSupportedSavingsPlansTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceSupportedSavingsPlansTypeComputeSp:
                return @"COMPUTE_SP";
            case AWSceSupportedSavingsPlansTypeEc2InstanceSp:
                return @"EC2_INSTANCE_SP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)termInYearsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_YEAR"] == NSOrderedSame) {
            return @(AWSceTermInYearsOneYear);
        }
        if ([value caseInsensitiveCompare:@"THREE_YEARS"] == NSOrderedSame) {
            return @(AWSceTermInYearsThreeYears);
        }
        return @(AWSceTermInYearsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceTermInYearsOneYear:
                return @"ONE_YEAR";
            case AWSceTermInYearsThreeYears:
                return @"THREE_YEARS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSceSavingsPlansPurchaseRecommendationDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"currencyCode" : @"CurrencyCode",
             @"currentAverageHourlyOnDemandSpend" : @"CurrentAverageHourlyOnDemandSpend",
             @"currentMaximumHourlyOnDemandSpend" : @"CurrentMaximumHourlyOnDemandSpend",
             @"currentMinimumHourlyOnDemandSpend" : @"CurrentMinimumHourlyOnDemandSpend",
             @"estimatedAverageUtilization" : @"EstimatedAverageUtilization",
             @"estimatedMonthlySavingsAmount" : @"EstimatedMonthlySavingsAmount",
             @"estimatedOnDemandCost" : @"EstimatedOnDemandCost",
             @"estimatedOnDemandCostWithCurrentCommitment" : @"EstimatedOnDemandCostWithCurrentCommitment",
             @"estimatedROI" : @"EstimatedROI",
             @"estimatedSPCost" : @"EstimatedSPCost",
             @"estimatedSavingsAmount" : @"EstimatedSavingsAmount",
             @"estimatedSavingsPercentage" : @"EstimatedSavingsPercentage",
             @"hourlyCommitmentToPurchase" : @"HourlyCommitmentToPurchase",
             @"savingsPlansDetails" : @"SavingsPlansDetails",
             @"upfrontCost" : @"UpfrontCost",
             };
}

+ (NSValueTransformer *)savingsPlansDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansDetails class]];
}

@end

@implementation AWSceSavingsPlansPurchaseRecommendationMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"generationTimestamp" : @"GenerationTimestamp",
             @"recommendationId" : @"RecommendationId",
             };
}

@end

@implementation AWSceSavingsPlansPurchaseRecommendationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"currentOnDemandSpend" : @"CurrentOnDemandSpend",
             @"dailyCommitmentToPurchase" : @"DailyCommitmentToPurchase",
             @"estimatedMonthlySavingsAmount" : @"EstimatedMonthlySavingsAmount",
             @"estimatedOnDemandCostWithCurrentCommitment" : @"EstimatedOnDemandCostWithCurrentCommitment",
             @"estimatedROI" : @"EstimatedROI",
             @"estimatedSavingsAmount" : @"EstimatedSavingsAmount",
             @"estimatedSavingsPercentage" : @"EstimatedSavingsPercentage",
             @"estimatedTotalCost" : @"EstimatedTotalCost",
             @"hourlyCommitmentToPurchase" : @"HourlyCommitmentToPurchase",
             @"totalRecommendationCount" : @"TotalRecommendationCount",
             };
}

@end

@implementation AWSceSavingsPlansSavings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"netSavings" : @"NetSavings",
             @"onDemandCostEquivalent" : @"OnDemandCostEquivalent",
             };
}

@end

@implementation AWSceSavingsPlansUtilization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"totalCommitment" : @"TotalCommitment",
             @"unusedCommitment" : @"UnusedCommitment",
             @"usedCommitment" : @"UsedCommitment",
             @"utilizationPercentage" : @"UtilizationPercentage",
             };
}

@end

@implementation AWSceSavingsPlansUtilizationAggregates

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amortizedCommitment" : @"AmortizedCommitment",
             @"savings" : @"Savings",
             @"utilization" : @"Utilization",
             };
}

+ (NSValueTransformer *)amortizedCommitmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansAmortizedCommitment class]];
}

+ (NSValueTransformer *)savingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansSavings class]];
}

+ (NSValueTransformer *)utilizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansUtilization class]];
}

@end

@implementation AWSceSavingsPlansUtilizationByTime

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amortizedCommitment" : @"AmortizedCommitment",
             @"savings" : @"Savings",
             @"timePeriod" : @"TimePeriod",
             @"utilization" : @"Utilization",
             };
}

+ (NSValueTransformer *)amortizedCommitmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansAmortizedCommitment class]];
}

+ (NSValueTransformer *)savingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansSavings class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

+ (NSValueTransformer *)utilizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansUtilization class]];
}

@end

@implementation AWSceSavingsPlansUtilizationDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amortizedCommitment" : @"AmortizedCommitment",
             @"attributes" : @"Attributes",
             @"savings" : @"Savings",
             @"savingsPlanArn" : @"SavingsPlanArn",
             @"utilization" : @"Utilization",
             };
}

+ (NSValueTransformer *)amortizedCommitmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansAmortizedCommitment class]];
}

+ (NSValueTransformer *)savingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansSavings class]];
}

+ (NSValueTransformer *)utilizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceSavingsPlansUtilization class]];
}

@end

@implementation AWSceServiceSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EC2Specification" : @"EC2Specification",
             };
}

+ (NSValueTransformer *)EC2SpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceEC2Specification class]];
}

@end

@implementation AWSceTagValues

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"matchOptions" : @"MatchOptions",
             @"values" : @"Values",
             };
}

@end

@implementation AWSceTargetInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"defaultTargetInstance" : @"DefaultTargetInstance",
             @"estimatedMonthlyCost" : @"EstimatedMonthlyCost",
             @"estimatedMonthlySavings" : @"EstimatedMonthlySavings",
             @"expectedResourceUtilization" : @"ExpectedResourceUtilization",
             @"resourceDetails" : @"ResourceDetails",
             };
}

+ (NSValueTransformer *)expectedResourceUtilizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceResourceUtilization class]];
}

+ (NSValueTransformer *)resourceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceResourceDetails class]];
}

@end

@implementation AWSceTerminateRecommendationDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"estimatedMonthlySavings" : @"EstimatedMonthlySavings",
             };
}

@end

@implementation AWSceUpdateCostCategoryDefinitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costCategoryArn" : @"CostCategoryArn",
             @"ruleVersion" : @"RuleVersion",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)ruleVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CostCategoryExpression.v1"] == NSOrderedSame) {
            return @(AWSceCostCategoryRuleVersionCostCategoryExpressionV1);
        }
        return @(AWSceCostCategoryRuleVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSceCostCategoryRuleVersionCostCategoryExpressionV1:
                return @"CostCategoryExpression.v1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceCostCategoryRule class]];
}

@end

@implementation AWSceUpdateCostCategoryDefinitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costCategoryArn" : @"CostCategoryArn",
             @"effectiveStart" : @"EffectiveStart",
             };
}

@end

@implementation AWSceUtilizationByTime

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groups" : @"Groups",
             @"timePeriod" : @"TimePeriod",
             @"total" : @"Total",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSceReservationUtilizationGroup class]];
}

+ (NSValueTransformer *)timePeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceDateInterval class]];
}

+ (NSValueTransformer *)totalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSceReservationAggregates class]];
}

@end
