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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSceErrorDomain;

typedef NS_ENUM(NSInteger, AWSceErrorType) {
    AWSceErrorUnknown,
    AWSceErrorBillExpiration,
    AWSceErrorDataUnavailable,
    AWSceErrorInvalidNextToken,
    AWSceErrorLimitExceeded,
    AWSceErrorRequestChanged,
    AWSceErrorResourceNotFound,
    AWSceErrorServiceQuotaExceeded,
    AWSceErrorUnresolvableUsageUnit,
};

typedef NS_ENUM(NSInteger, AWSceAccountScope) {
    AWSceAccountScopeUnknown,
    AWSceAccountScopePayer,
    AWSceAccountScopeLinked,
};

typedef NS_ENUM(NSInteger, AWSceContext) {
    AWSceContextUnknown,
    AWSceContextCostAndUsage,
    AWSceContextReservations,
    AWSceContextSavingsPlans,
};

typedef NS_ENUM(NSInteger, AWSceCostCategoryRuleVersion) {
    AWSceCostCategoryRuleVersionUnknown,
    AWSceCostCategoryRuleVersionCostCategoryExpressionV1,
};

typedef NS_ENUM(NSInteger, AWSceDimension) {
    AWSceDimensionUnknown,
    AWSceDimensionAz,
    AWSceDimensionInstanceType,
    AWSceDimensionLinkedAccount,
    AWSceDimensionLinkedAccountName,
    AWSceDimensionOperation,
    AWSceDimensionPurchaseType,
    AWSceDimensionRegion,
    AWSceDimensionService,
    AWSceDimensionServiceCode,
    AWSceDimensionUsageType,
    AWSceDimensionUsageTypeGroup,
    AWSceDimensionRecordType,
    AWSceDimensionOperatingSystem,
    AWSceDimensionTenancy,
    AWSceDimensionScope,
    AWSceDimensionPlatform,
    AWSceDimensionSubscriptionId,
    AWSceDimensionLegalEntityName,
    AWSceDimensionDeploymentOption,
    AWSceDimensionDatabaseEngine,
    AWSceDimensionCacheEngine,
    AWSceDimensionInstanceTypeFamily,
    AWSceDimensionBillingEntity,
    AWSceDimensionReservationId,
    AWSceDimensionResourceId,
    AWSceDimensionRightsizingType,
    AWSceDimensionSavingsPlansType,
    AWSceDimensionSavingsPlanArn,
    AWSceDimensionPaymentOption,
};

typedef NS_ENUM(NSInteger, AWSceGranularity) {
    AWSceGranularityUnknown,
    AWSceGranularityDaily,
    AWSceGranularityMonthly,
    AWSceGranularityHourly,
};

typedef NS_ENUM(NSInteger, AWSceGroupDefinitionType) {
    AWSceGroupDefinitionTypeUnknown,
    AWSceGroupDefinitionTypeDimension,
    AWSceGroupDefinitionTypeTag,
    AWSceGroupDefinitionTypeCostCategory,
};

typedef NS_ENUM(NSInteger, AWSceLookbackPeriodInDays) {
    AWSceLookbackPeriodInDaysUnknown,
    AWSceLookbackPeriodInDaysSevenDays,
    AWSceLookbackPeriodInDaysThirtyDays,
    AWSceLookbackPeriodInDaysSixtyDays,
};

typedef NS_ENUM(NSInteger, AWSceMatchOption) {
    AWSceMatchOptionUnknown,
    AWSceMatchOptionEquals,
    AWSceMatchOptionStartsWith,
    AWSceMatchOptionEndsWith,
    AWSceMatchOptionContains,
    AWSceMatchOptionCaseSensitive,
    AWSceMatchOptionCaseInsensitive,
};

typedef NS_ENUM(NSInteger, AWSceMetric) {
    AWSceMetricUnknown,
    AWSceMetricBlendedCost,
    AWSceMetricUnblendedCost,
    AWSceMetricAmortizedCost,
    AWSceMetricNetUnblendedCost,
    AWSceMetricNetAmortizedCost,
    AWSceMetricUsageQuantity,
    AWSceMetricNormalizedUsageAmount,
};

typedef NS_ENUM(NSInteger, AWSceOfferingClass) {
    AWSceOfferingClassUnknown,
    AWSceOfferingClassStandard,
    AWSceOfferingClassConvertible,
};

typedef NS_ENUM(NSInteger, AWScePaymentOption) {
    AWScePaymentOptionUnknown,
    AWScePaymentOptionNoUpfront,
    AWScePaymentOptionPartialUpfront,
    AWScePaymentOptionAllUpfront,
    AWScePaymentOptionLightUtilization,
    AWScePaymentOptionMediumUtilization,
    AWScePaymentOptionHeavyUtilization,
};

typedef NS_ENUM(NSInteger, AWSceRecommendationTarget) {
    AWSceRecommendationTargetUnknown,
    AWSceRecommendationTargetSameInstanceFamily,
    AWSceRecommendationTargetCrossInstanceFamily,
};

typedef NS_ENUM(NSInteger, AWSceRightsizingType) {
    AWSceRightsizingTypeUnknown,
    AWSceRightsizingTypeTerminate,
    AWSceRightsizingTypeModify,
};

typedef NS_ENUM(NSInteger, AWSceSupportedSavingsPlansType) {
    AWSceSupportedSavingsPlansTypeUnknown,
    AWSceSupportedSavingsPlansTypeComputeSp,
    AWSceSupportedSavingsPlansTypeEc2InstanceSp,
};

typedef NS_ENUM(NSInteger, AWSceTermInYears) {
    AWSceTermInYearsUnknown,
    AWSceTermInYearsOneYear,
    AWSceTermInYearsThreeYears,
};

@class AWSceCostCategory;
@class AWSceCostCategoryReference;
@class AWSceCostCategoryRule;
@class AWSceCostCategoryValues;
@class AWSceCoverage;
@class AWSceCoverageByTime;
@class AWSceCoverageCost;
@class AWSceCoverageHours;
@class AWSceCoverageNormalizedUnits;
@class AWSceCreateCostCategoryDefinitionRequest;
@class AWSceCreateCostCategoryDefinitionResponse;
@class AWSceCurrentInstance;
@class AWSceDateInterval;
@class AWSceDeleteCostCategoryDefinitionRequest;
@class AWSceDeleteCostCategoryDefinitionResponse;
@class AWSceDescribeCostCategoryDefinitionRequest;
@class AWSceDescribeCostCategoryDefinitionResponse;
@class AWSceDimensionValues;
@class AWSceDimensionValuesWithAttributes;
@class AWSceEC2InstanceDetails;
@class AWSceEC2ResourceDetails;
@class AWSceEC2ResourceUtilization;
@class AWSceEC2Specification;
@class AWSceESInstanceDetails;
@class AWSceElastiCacheInstanceDetails;
@class AWSceExpression;
@class AWSceForecastResult;
@class AWSceGetCostAndUsageRequest;
@class AWSceGetCostAndUsageResponse;
@class AWSceGetCostAndUsageWithResourcesRequest;
@class AWSceGetCostAndUsageWithResourcesResponse;
@class AWSceGetCostForecastRequest;
@class AWSceGetCostForecastResponse;
@class AWSceGetDimensionValuesRequest;
@class AWSceGetDimensionValuesResponse;
@class AWSceGetReservationCoverageRequest;
@class AWSceGetReservationCoverageResponse;
@class AWSceGetReservationPurchaseRecommendationRequest;
@class AWSceGetReservationPurchaseRecommendationResponse;
@class AWSceGetReservationUtilizationRequest;
@class AWSceGetReservationUtilizationResponse;
@class AWSceGetRightsizingRecommendationRequest;
@class AWSceGetRightsizingRecommendationResponse;
@class AWSceGetSavingsPlansCoverageRequest;
@class AWSceGetSavingsPlansCoverageResponse;
@class AWSceGetSavingsPlansPurchaseRecommendationRequest;
@class AWSceGetSavingsPlansPurchaseRecommendationResponse;
@class AWSceGetSavingsPlansUtilizationDetailsRequest;
@class AWSceGetSavingsPlansUtilizationDetailsResponse;
@class AWSceGetSavingsPlansUtilizationRequest;
@class AWSceGetSavingsPlansUtilizationResponse;
@class AWSceGetTagsRequest;
@class AWSceGetTagsResponse;
@class AWSceGetUsageForecastRequest;
@class AWSceGetUsageForecastResponse;
@class AWSceGroup;
@class AWSceGroupDefinition;
@class AWSceInstanceDetails;
@class AWSceListCostCategoryDefinitionsRequest;
@class AWSceListCostCategoryDefinitionsResponse;
@class AWSceMetricValue;
@class AWSceModifyRecommendationDetail;
@class AWSceRDSInstanceDetails;
@class AWSceRedshiftInstanceDetails;
@class AWSceReservationAggregates;
@class AWSceReservationCoverageGroup;
@class AWSceReservationPurchaseRecommendation;
@class AWSceReservationPurchaseRecommendationDetail;
@class AWSceReservationPurchaseRecommendationMetadata;
@class AWSceReservationPurchaseRecommendationSummary;
@class AWSceReservationUtilizationGroup;
@class AWSceResourceDetails;
@class AWSceResourceUtilization;
@class AWSceResultByTime;
@class AWSceRightsizingRecommendation;
@class AWSceRightsizingRecommendationConfiguration;
@class AWSceRightsizingRecommendationMetadata;
@class AWSceRightsizingRecommendationSummary;
@class AWSceSavingsPlansAmortizedCommitment;
@class AWSceSavingsPlansCoverage;
@class AWSceSavingsPlansCoverageData;
@class AWSceSavingsPlansDetails;
@class AWSceSavingsPlansPurchaseRecommendation;
@class AWSceSavingsPlansPurchaseRecommendationDetail;
@class AWSceSavingsPlansPurchaseRecommendationMetadata;
@class AWSceSavingsPlansPurchaseRecommendationSummary;
@class AWSceSavingsPlansSavings;
@class AWSceSavingsPlansUtilization;
@class AWSceSavingsPlansUtilizationAggregates;
@class AWSceSavingsPlansUtilizationByTime;
@class AWSceSavingsPlansUtilizationDetail;
@class AWSceServiceSpecification;
@class AWSceTagValues;
@class AWSceTargetInstance;
@class AWSceTerminateRecommendationDetail;
@class AWSceUpdateCostCategoryDefinitionRequest;
@class AWSceUpdateCostCategoryDefinitionResponse;
@class AWSceUtilizationByTime;

/**
 <p>The structure of Cost Categories. This includes detailed metadata and the set of rules for the <code>CostCategory</code> object.</p>
 Required parameters: [CostCategoryArn, EffectiveStart, Name, RuleVersion, Rules]
 */
@interface AWSceCostCategory : AWSModel


/**
 <p> The unique identifier for your Cost Category. </p>
 */
@property (nonatomic, strong) NSString * _Nullable costCategoryArn;

/**
 <p> The Cost Category's effective end date.</p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveEnd;

/**
 <p> The Cost Category's effective start date.</p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveStart;

/**
 <p>The unique name of the Cost Category.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The rule schema version in this particular Cost Category.</p>
 */
@property (nonatomic, assign) AWSceCostCategoryRuleVersion ruleVersion;

/**
 <p> Rules are processed in order. If there are multiple rules that match the line item, then the first rule to match is used to determine that Cost Category value. </p>
 */
@property (nonatomic, strong) NSArray<AWSceCostCategoryRule *> * _Nullable rules;

@end

/**
 <p>A reference to a Cost Category containing only enough information to identify the Cost Category.</p><p>You can use this information to retrieve the full Cost Category information using <code>DescribeCostCategory</code>.</p>
 */
@interface AWSceCostCategoryReference : AWSModel


/**
 <p> The unique identifier for your Cost Category. </p>
 */
@property (nonatomic, strong) NSString * _Nullable costCategoryArn;

/**
 <p> The Cost Category's effective end date.</p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveEnd;

/**
 <p> The Cost Category's effective start date.</p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveStart;

/**
 <p>The unique name of the Cost Category.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The number of rules associated with a specific Cost Category. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfRules;

@end

/**
 <p>Rules are processed in order. If there are multiple rules that match the line item, then the first rule to match is used to determine that Cost Category value.</p>
 Required parameters: [Value, Rule]
 */
@interface AWSceCostCategoryRule : AWSModel


/**
 <p>An <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a> object used to categorize costs. This supports dimensions, Tags, and nested expressions. Currently the only dimensions supported are <code>LINKED_ACCOUNT</code>, <code>SERVICE_CODE</code>, <code>RECORD_TYPE</code>, and <code>LINKED_ACCOUNT_NAME</code>.</p><p>Root level <code>OR</code> is not supported. We recommend that you create a separate rule instead.</p><p><code>RECORD_TYPE</code> is a dimension used for Cost Explorer APIs, and is also supported for Cost Category expressions. This dimension uses different terms, depending on whether you're using the console or API/JSON editor. For a detailed comparison, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/manage-cost-categories.html#cost-categories-terms">Term Comparisons</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable rule;

/**
 <p>The value a line item will be categorized as, if it matches the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The Cost Categories values used for filtering the costs.</p>
 */
@interface AWSceCostCategoryValues : AWSModel


/**
 <p>The unique name of the Cost Category.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The specific value of the Cost Category.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>The amount of instance usage that a reservation covered.</p>
 */
@interface AWSceCoverage : AWSModel


/**
 <p>The amount of cost that the reservation covered.</p>
 */
@property (nonatomic, strong) AWSceCoverageCost * _Nullable coverageCost;

/**
 <p>The amount of instance usage that the reservation covered, in hours.</p>
 */
@property (nonatomic, strong) AWSceCoverageHours * _Nullable coverageHours;

/**
 <p>The amount of instance usage that the reservation covered, in normalized units.</p>
 */
@property (nonatomic, strong) AWSceCoverageNormalizedUnits * _Nullable coverageNormalizedUnits;

@end

/**
 <p>Reservation coverage for a specified period, in hours.</p>
 */
@interface AWSceCoverageByTime : AWSModel


/**
 <p>The groups of instances that the reservation covered.</p>
 */
@property (nonatomic, strong) NSArray<AWSceReservationCoverageGroup *> * _Nullable groups;

/**
 <p>The period that this coverage was used over.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

/**
 <p>The total reservation coverage, in hours.</p>
 */
@property (nonatomic, strong) AWSceCoverage * _Nullable total;

@end

/**
 <p>How much it costs to run an instance.</p>
 */
@interface AWSceCoverageCost : AWSModel


/**
 <p>How much an On-Demand Instance costs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable onDemandCost;

@end

/**
 <p>How long a running instance either used a reservation or was On-Demand.</p>
 */
@interface AWSceCoverageHours : AWSModel


/**
 <p>The percentage of instance hours that a reservation covered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable coverageHoursPercentage;

/**
 <p>The number of instance running hours that On-Demand Instances covered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable onDemandHours;

/**
 <p>The number of instance running hours that reservations covered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedHours;

/**
 <p>The total instance usage, in hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalRunningHours;

@end

/**
 <p>The amount of instance usage, in normalized units. Normalized units enable you to see your EC2 usage for multiple sizes of instances in a uniform way. For example, suppose you run an xlarge instance and a 2xlarge instance. If you run both instances for the same amount of time, the 2xlarge instance uses twice as much of your reservation as the xlarge instance, even though both instances show only one instance-hour. Using normalized units instead of instance-hours, the xlarge instance used 8 normalized units, and the 2xlarge instance used 16 normalized units.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying Reserved Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux Instances</i>.</p>
 */
@interface AWSceCoverageNormalizedUnits : AWSModel


/**
 <p>The percentage of your used instance normalized units that a reservation covers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable coverageNormalizedUnitsPercentage;

/**
 <p>The number of normalized units that are covered by On-Demand Instances instead of a reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable onDemandNormalizedUnits;

/**
 <p>The number of normalized units that a reservation covers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedNormalizedUnits;

/**
 <p>The total number of normalized units that you used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalRunningNormalizedUnits;

@end

/**
 
 */
@interface AWSceCreateCostCategoryDefinitionRequest : AWSRequest


/**
 <p>The unique name of the Cost Category.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The rule schema version in this particular Cost Category.</p>
 */
@property (nonatomic, assign) AWSceCostCategoryRuleVersion ruleVersion;

/**
 <p>The Cost Category rules used to categorize costs. For more information, see <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategoryRule.html">CostCategoryRule</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSceCostCategoryRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSceCreateCostCategoryDefinitionResponse : AWSModel


/**
 <p> The unique identifier for your newly created Cost Category. </p>
 */
@property (nonatomic, strong) NSString * _Nullable costCategoryArn;

/**
 <p> The Cost Category's effective start date. </p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveStart;

@end

/**
 <p>Context about the current instance.</p>
 */
@interface AWSceCurrentInstance : AWSModel


/**
 <p> The currency code that Amazon Web Services used to calculate the costs for this instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p> Current On Demand cost of operating this instance on a monthly basis.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monthlyCost;

/**
 <p> Number of hours during the lookback period billed at On Demand rates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable onDemandHoursInLookbackPeriod;

/**
 <p> Number of hours during the lookback period covered by reservations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservationCoveredHoursInLookbackPeriod;

/**
 <p> Details about the resource and utilization.</p>
 */
@property (nonatomic, strong) AWSceResourceDetails * _Nullable resourceDetails;

/**
 <p>Resource ID of the current instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p> Utilization information of the current instance during the lookback period.</p>
 */
@property (nonatomic, strong) AWSceResourceUtilization * _Nullable resourceUtilization;

/**
 <p>Number of hours during the lookback period covered by Savings Plans.</p>
 */
@property (nonatomic, strong) NSString * _Nullable savingsPlansCoveredHoursInLookbackPeriod;

/**
 <p>Cost allocation resource tags applied to the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSceTagValues *> * _Nullable tags;

/**
 <p> The total number of hours the instance ran during the lookback period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalRunningHoursInLookbackPeriod;

@end

/**
 <p>The time period that you want the usage and costs for. </p>
 Required parameters: [Start, End]
 */
@interface AWSceDateInterval : AWSModel


/**
 <p>The end of the time period that you want the usage and costs for. The end date is exclusive. For example, if <code>end</code> is <code>2017-05-01</code>, AWS retrieves cost and usage data from the start date up to, but not including, <code>2017-05-01</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable end;

/**
 <p>The beginning of the time period that you want the usage and costs for. The start date is inclusive. For example, if <code>start</code> is <code>2017-01-01</code>, AWS retrieves cost and usage data starting at <code>2017-01-01</code> up to the end date.</p>
 */
@property (nonatomic, strong) NSString * _Nullable start;

@end

/**
 
 */
@interface AWSceDeleteCostCategoryDefinitionRequest : AWSRequest


/**
 <p> The unique identifier for your Cost Category. </p>
 */
@property (nonatomic, strong) NSString * _Nullable costCategoryArn;

@end

/**
 
 */
@interface AWSceDeleteCostCategoryDefinitionResponse : AWSModel


/**
 <p> The unique identifier for your Cost Category. </p>
 */
@property (nonatomic, strong) NSString * _Nullable costCategoryArn;

/**
 <p> The effective end date of the Cost Category as a result of deleting it. No costs after this date will be categorized by the deleted Cost Category. </p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveEnd;

@end

/**
 
 */
@interface AWSceDescribeCostCategoryDefinitionRequest : AWSRequest


/**
 <p> The unique identifier for your Cost Category. </p>
 */
@property (nonatomic, strong) NSString * _Nullable costCategoryArn;

/**
 <p> The date when the Cost Category was effective. </p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveOn;

@end

/**
 
 */
@interface AWSceDescribeCostCategoryDefinitionResponse : AWSModel


/**
 <p>The structure of Cost Categories. This includes detailed metadata and the set of rules for the <code>CostCategory</code> object.</p>
 */
@property (nonatomic, strong) AWSceCostCategory * _Nullable costCategory;

@end

/**
 <p>The metadata that you can use to filter and group your results. You can use <code>GetDimensionValues</code> to find specific values.</p>
 */
@interface AWSceDimensionValues : AWSModel


/**
 <p>The names of the metadata types that you can use to filter and group your results. For example, <code>AZ</code> returns a list of Availability Zones.</p>
 */
@property (nonatomic, assign) AWSceDimension key;

/**
 <p>The match options that you can use to filter your results. <code>MatchOptions</code> is only applicable for actions related to Cost Category. The default values for <code>MatchOptions</code> is <code>EQUALS</code> and <code>CASE_SENSITIVE</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable matchOptions;

/**
 <p>The metadata values that you can use to filter and group your results. You can use <code>GetDimensionValues</code> to find specific values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>The metadata of a specific type that you can use to filter and group your results. You can use <code>GetDimensionValues</code> to find specific values.</p>
 */
@interface AWSceDimensionValuesWithAttributes : AWSModel


/**
 <p>The attribute that applies to a specific <code>Dimension</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The value of a dimension with a specific attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Details about the Amazon EC2 instances that AWS recommends that you purchase.</p>
 */
@interface AWSceEC2InstanceDetails : AWSModel


/**
 <p>The Availability Zone of the recommended reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>Whether the recommendation is for a current-generation instance. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentGeneration;

/**
 <p>The instance family of the recommended reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable family;

/**
 <p>The type of instance that AWS recommends.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The platform of the recommended reservation. The platform is the specific combination of operating system, license model, and software on an instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The AWS Region of the recommended reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>Whether the recommended reservation is size flexible.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeFlexEligible;

/**
 <p>Whether the recommended reservation is dedicated or shared.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tenancy;

@end

/**
 <p> Details on the Amazon EC2 Resource.</p>
 */
@interface AWSceEC2ResourceDetails : AWSModel


/**
 <p> Hourly public On Demand rate for the instance type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hourlyOnDemandRate;

/**
 <p> The type of Amazon Web Services instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p> Memory capacity of Amazon Web Services instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memory;

/**
 <p> Network performance capacity of the Amazon Web Services instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkPerformance;

/**
 <p> The platform of the Amazon Web Services instance. The platform is the specific combination of operating system, license model, and software on an instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p> The Amazon Web Services Region of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p> The SKU of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sku;

/**
 <p> The disk storage of the Amazon Web Services instance (Not EBS storage).</p>
 */
@property (nonatomic, strong) NSString * _Nullable storage;

/**
 <p> Number of VCPU cores in the Amazon Web Services instance type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vcpu;

@end

/**
 <p> Utilization metrics of the instance. </p>
 */
@interface AWSceEC2ResourceUtilization : AWSModel


/**
 <p> Maximum observed or expected CPU utilization of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxCpuUtilizationPercentage;

/**
 <p> Maximum observed or expected memory utilization of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxMemoryUtilizationPercentage;

/**
 <p> Maximum observed or expected storage utilization of the instance (does not measure EBS storage).</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxStorageUtilizationPercentage;

@end

/**
 <p>The Amazon EC2 hardware specifications that you want AWS to provide recommendations for.</p>
 */
@interface AWSceEC2Specification : AWSModel


/**
 <p>Whether you want a recommendation for standard or convertible reservations.</p>
 */
@property (nonatomic, assign) AWSceOfferingClass offeringClass;

@end

/**
 <p>Details about the Amazon ES instances that AWS recommends that you purchase.</p>
 */
@interface AWSceESInstanceDetails : AWSModel


/**
 <p>Whether the recommendation is for a current-generation instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentGeneration;

/**
 <p>The class of instance that AWS recommends.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceClass;

/**
 <p>The size of instance that AWS recommends.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceSize;

/**
 <p>The AWS Region of the recommended reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>Whether the recommended reservation is size flexible.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeFlexEligible;

@end

/**
 <p>Details about the Amazon ElastiCache instances that AWS recommends that you purchase.</p>
 */
@interface AWSceElastiCacheInstanceDetails : AWSModel


/**
 <p>Whether the recommendation is for a current generation instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentGeneration;

/**
 <p>The instance family of the recommended reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable family;

/**
 <p>The type of node that AWS recommends.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The description of the recommended reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productDescription;

/**
 <p>The AWS Region of the recommended reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>Whether the recommended reservation is size flexible.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeFlexEligible;

@end

/**
 <p>Use <code>Expression</code> to filter by cost or by usage. There are two patterns: </p><ul><li><p>Simple dimension values - You can set the dimension name and values for the filters that you plan to use. For example, you can filter for <code>REGION==us-east-1 OR REGION==us-west-1</code>. The <code>Expression</code> for that looks like this:</p><p><code>{ "Dimensions": { "Key": "REGION", "Values": [ "us-east-1", “us-west-1” ] } }</code></p><p>The list of dimension values are OR'd together to retrieve cost or usage data. You can create <code>Expression</code> and <code>DimensionValues</code> objects using either <code>with*</code> methods or <code>set*</code> methods in multiple lines. </p></li><li><p>Compound dimension values with logical operations - You can use multiple <code>Expression</code> types and the logical operators <code>AND/OR/NOT</code> to create a list of one or more <code>Expression</code> objects. This allows you to filter on more advanced options. For example, you can filter on <code>((REGION == us-east-1 OR REGION == us-west-1) OR (TAG.Type == Type1)) AND (USAGE_TYPE != DataTransfer)</code>. The <code>Expression</code> for that looks like this:</p><p><code>{ "And": [ {"Or": [ {"Dimensions": { "Key": "REGION", "Values": [ "us-east-1", "us-west-1" ] }}, {"Tags": { "Key": "TagName", "Values": ["Value1"] } } ]}, {"Not": {"Dimensions": { "Key": "USAGE_TYPE", "Values": ["DataTransfer"] }}} ] } </code></p><note><p>Because each <code>Expression</code> can have only one operator, the service returns an error if more than one is specified. The following example shows an <code>Expression</code> object that creates an error.</p></note><p><code> { "And": [ ... ], "DimensionValues": { "Dimension": "USAGE_TYPE", "Values": [ "DataTransfer" ] } } </code></p></li></ul><note><p>For <code>GetRightsizingRecommendation</code> action, a combination of OR and NOT is not supported. OR is not supported between different dimensions, or dimensions and tags. NOT operators aren't supported. Dimensions are also limited to <code>LINKED_ACCOUNT</code>, <code>REGION</code>, or <code>RIGHTSIZING_TYPE</code>.</p></note>
 */
@interface AWSceExpression : AWSModel


/**
 <p>Return results that match both <code>Dimension</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSceExpression *> * _Nullable AND;

/**
 <p>The filter based on <code>CostCategory</code> values.</p>
 */
@property (nonatomic, strong) AWSceCostCategoryValues * _Nullable costCategories;

/**
 <p>The specific <code>Dimension</code> to use for <code>Expression</code>.</p>
 */
@property (nonatomic, strong) AWSceDimensionValues * _Nullable dimensions;

/**
 <p>Return results that don't match a <code>Dimension</code> object.</p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable not;

/**
 <p>Return results that match either <code>Dimension</code> object.</p>
 */
@property (nonatomic, strong) NSArray<AWSceExpression *> * _Nullable or;

/**
 <p>The specific <code>Tag</code> to use for <code>Expression</code>.</p>
 */
@property (nonatomic, strong) AWSceTagValues * _Nullable tags;

@end

/**
 <p>The forecast created for your query.</p>
 */
@interface AWSceForecastResult : AWSModel


/**
 <p>The mean value of the forecast.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meanValue;

/**
 <p>The lower limit for the prediction interval. </p>
 */
@property (nonatomic, strong) NSString * _Nullable predictionIntervalLowerBound;

/**
 <p>The upper limit for the prediction interval. </p>
 */
@property (nonatomic, strong) NSString * _Nullable predictionIntervalUpperBound;

/**
 <p>The period of time that the forecast covers.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetCostAndUsageRequest : AWSRequest


/**
 <p>Filters AWS costs by different dimensions. For example, you can specify <code>SERVICE</code> and <code>LINKED_ACCOUNT</code> and get the costs that are associated with that account's usage of that service. You can nest <code>Expression</code> objects to define any combination of dimension filters. For more information, see <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>. </p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable filter;

/**
 <p>Sets the AWS cost granularity to <code>MONTHLY</code> or <code>DAILY</code>, or <code>HOURLY</code>. If <code>Granularity</code> isn't set, the response object doesn't include the <code>Granularity</code>, either <code>MONTHLY</code> or <code>DAILY</code>, or <code>HOURLY</code>. </p>
 */
@property (nonatomic, assign) AWSceGranularity granularity;

/**
 <p>You can group AWS costs using up to two different groups, either dimensions, tag keys, or both.</p><p>When you group by tag key, you get all tag values, including empty strings.</p><p>Valid values are <code>AZ</code>, <code>INSTANCE_TYPE</code>, <code>LEGAL_ENTITY_NAME</code>, <code>LINKED_ACCOUNT</code>, <code>OPERATION</code>, <code>PLATFORM</code>, <code>PURCHASE_TYPE</code>, <code>SERVICE</code>, <code>TAGS</code>, <code>TENANCY</code>, <code>RECORD_TYPE</code>, and <code>USAGE_TYPE</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSceGroupDefinition *> * _Nullable groupBy;

/**
 <p>Which metrics are returned in the query. For more information about blended and unblended rates, see <a href="http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/">Why does the "blended" annotation appear on some line items in my bill?</a>. </p><p>Valid values are <code>AmortizedCost</code>, <code>BlendedCost</code>, <code>NetAmortizedCost</code>, <code>NetUnblendedCost</code>, <code>NormalizedUsageAmount</code>, <code>UnblendedCost</code>, and <code>UsageQuantity</code>. </p><note><p>If you return the <code>UsageQuantity</code> metric, the service aggregates all usage numbers without taking into account the units. For example, if you aggregate <code>usageQuantity</code> across all of Amazon EC2, the results aren't meaningful because Amazon EC2 compute hours and data transfer are measured in different units (for example, hours vs. GB). To get more meaningful <code>UsageQuantity</code> metrics, filter by <code>UsageType</code> or <code>UsageTypeGroups</code>. </p></note><p><code>Metrics</code> is required for <code>GetCostAndUsage</code> requests.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable metrics;

/**
 <p>The token to retrieve the next set of results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Sets the start and end dates for retrieving AWS costs. The start date is inclusive, but the end date is exclusive. For example, if <code>start</code> is <code>2017-01-01</code> and <code>end</code> is <code>2017-05-01</code>, then the cost and usage data is retrieved from <code>2017-01-01</code> up to and including <code>2017-04-30</code> but not including <code>2017-05-01</code>.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetCostAndUsageResponse : AWSModel


/**
 <p>The groups that are specified by the <code>Filter</code> or <code>GroupBy</code> parameters in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSceGroupDefinition *> * _Nullable groupDefinitions;

/**
 <p>The token for the next set of retrievable results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The time period that is covered by the results in the response.</p>
 */
@property (nonatomic, strong) NSArray<AWSceResultByTime *> * _Nullable resultsByTime;

@end

/**
 
 */
@interface AWSceGetCostAndUsageWithResourcesRequest : AWSRequest


/**
 <p>Filters Amazon Web Services costs by different dimensions. For example, you can specify <code>SERVICE</code> and <code>LINKED_ACCOUNT</code> and get the costs that are associated with that account's usage of that service. You can nest <code>Expression</code> objects to define any combination of dimension filters. For more information, see <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>. </p><p>The <code>GetCostAndUsageWithResources</code> operation requires that you either group by or filter by a <code>ResourceId</code>.</p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable filter;

/**
 <p>Sets the AWS cost granularity to <code>MONTHLY</code>, <code>DAILY</code>, or <code>HOURLY</code>. If <code>Granularity</code> isn't set, the response object doesn't include the <code>Granularity</code>, <code>MONTHLY</code>, <code>DAILY</code>, or <code>HOURLY</code>. </p>
 */
@property (nonatomic, assign) AWSceGranularity granularity;

/**
 <p>You can group Amazon Web Services costs using up to two different groups: either dimensions, tag keys, or both.</p>
 */
@property (nonatomic, strong) NSArray<AWSceGroupDefinition *> * _Nullable groupBy;

/**
 <p>Which metrics are returned in the query. For more information about blended and unblended rates, see <a href="http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/">Why does the "blended" annotation appear on some line items in my bill?</a>. </p><p>Valid values are <code>AmortizedCost</code>, <code>BlendedCost</code>, <code>NetAmortizedCost</code>, <code>NetUnblendedCost</code>, <code>NormalizedUsageAmount</code>, <code>UnblendedCost</code>, and <code>UsageQuantity</code>. </p><note><p>If you return the <code>UsageQuantity</code> metric, the service aggregates all usage numbers without taking the units into account. For example, if you aggregate <code>usageQuantity</code> across all of Amazon EC2, the results aren't meaningful because Amazon EC2 compute hours and data transfer are measured in different units (for example, hours vs. GB). To get more meaningful <code>UsageQuantity</code> metrics, filter by <code>UsageType</code> or <code>UsageTypeGroups</code>. </p></note><p><code>Metrics</code> is required for <code>GetCostAndUsageWithResources</code> requests.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable metrics;

/**
 <p>The token to retrieve the next set of results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Sets the start and end dates for retrieving Amazon Web Services costs. The range must be within the last 14 days (the start date cannot be earlier than 14 days ago). The start date is inclusive, but the end date is exclusive. For example, if <code>start</code> is <code>2017-01-01</code> and <code>end</code> is <code>2017-05-01</code>, then the cost and usage data is retrieved from <code>2017-01-01</code> up to and including <code>2017-04-30</code> but not including <code>2017-05-01</code>.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetCostAndUsageWithResourcesResponse : AWSModel


/**
 <p>The groups that are specified by the <code>Filter</code> or <code>GroupBy</code> parameters in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSceGroupDefinition *> * _Nullable groupDefinitions;

/**
 <p>The token for the next set of retrievable results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The time period that is covered by the results in the response.</p>
 */
@property (nonatomic, strong) NSArray<AWSceResultByTime *> * _Nullable resultsByTime;

@end

/**
 
 */
@interface AWSceGetCostForecastRequest : AWSRequest


/**
 <p>The filters that you want to use to filter your forecast. Cost Explorer API supports all of the Cost Explorer filters.</p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable filter;

/**
 <p>How granular you want the forecast to be. You can get 3 months of <code>DAILY</code> forecasts or 12 months of <code>MONTHLY</code> forecasts.</p><p>The <code>GetCostForecast</code> operation supports only <code>DAILY</code> and <code>MONTHLY</code> granularities.</p>
 */
@property (nonatomic, assign) AWSceGranularity granularity;

/**
 <p>Which metric Cost Explorer uses to create your forecast. For more information about blended and unblended rates, see <a href="http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/">Why does the "blended" annotation appear on some line items in my bill?</a>. </p><p>Valid values for a <code>GetCostForecast</code> call are the following:</p><ul><li><p>AMORTIZED_COST</p></li><li><p>BLENDED_COST</p></li><li><p>NET_AMORTIZED_COST</p></li><li><p>NET_UNBLENDED_COST</p></li><li><p>UNBLENDED_COST</p></li></ul>
 */
@property (nonatomic, assign) AWSceMetric metric;

/**
 <p>Cost Explorer always returns the mean forecast as a single point. You can request a prediction interval around the mean by specifying a confidence level. The higher the confidence level, the more confident Cost Explorer is about the actual value falling in the prediction interval. Higher confidence levels result in wider prediction intervals.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable predictionIntervalLevel;

/**
 <p>The period of time that you want the forecast to cover.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetCostForecastResponse : AWSModel


/**
 <p>The forecasts for your query, in order. For <code>DAILY</code> forecasts, this is a list of days. For <code>MONTHLY</code> forecasts, this is a list of months.</p>
 */
@property (nonatomic, strong) NSArray<AWSceForecastResult *> * _Nullable forecastResultsByTime;

/**
 <p>How much you are forecasted to spend over the forecast period, in <code>USD</code>.</p>
 */
@property (nonatomic, strong) AWSceMetricValue * _Nullable total;

@end

/**
 
 */
@interface AWSceGetDimensionValuesRequest : AWSRequest


/**
 <p>The context for the call to <code>GetDimensionValues</code>. This can be <code>RESERVATIONS</code> or <code>COST_AND_USAGE</code>. The default value is <code>COST_AND_USAGE</code>. If the context is set to <code>RESERVATIONS</code>, the resulting dimension values can be used in the <code>GetReservationUtilization</code> operation. If the context is set to <code>COST_AND_USAGE</code>, the resulting dimension values can be used in the <code>GetCostAndUsage</code> operation.</p><p>If you set the context to <code>COST_AND_USAGE</code>, you can use the following dimensions for searching:</p><ul><li><p>AZ - The Availability Zone. An example is <code>us-east-1a</code>.</p></li><li><p>DATABASE_ENGINE - The Amazon Relational Database Service database. Examples are Aurora or MySQL.</p></li><li><p>INSTANCE_TYPE - The type of Amazon EC2 instance. An example is <code>m4.xlarge</code>.</p></li><li><p>LEGAL_ENTITY_NAME - The name of the organization that sells you AWS services, such as Amazon Web Services.</p></li><li><p>LINKED_ACCOUNT - The description in the attribute map that includes the full name of the member account. The value field contains the AWS ID of the member account.</p></li><li><p>OPERATING_SYSTEM - The operating system. Examples are Windows or Linux.</p></li><li><p>OPERATION - The action performed. Examples include <code>RunInstance</code> and <code>CreateBucket</code>.</p></li><li><p>PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.</p></li><li><p>PURCHASE_TYPE - The reservation type of the purchase to which this usage is related. Examples include On-Demand Instances and Standard Reserved Instances.</p></li><li><p>SERVICE - The AWS service such as Amazon DynamoDB.</p></li><li><p>USAGE_TYPE - The type of usage. An example is DataTransfer-In-Bytes. The response for the <code>GetDimensionValues</code> operation includes a unit attribute. Examples include GB and Hrs.</p></li><li><p>USAGE_TYPE_GROUP - The grouping of common usage types. An example is Amazon EC2: CloudWatch – Alarms. The response for this operation includes a unit attribute.</p></li><li><p>RECORD_TYPE - The different types of charges such as RI fees, usage costs, tax refunds, and credits.</p></li><li><p>RESOURCE_ID - The unique identifier of the resource. ResourceId is an opt-in feature only available for last 14 days for EC2-Compute Service.</p></li></ul><p>If you set the context to <code>RESERVATIONS</code>, you can use the following dimensions for searching:</p><ul><li><p>AZ - The Availability Zone. An example is <code>us-east-1a</code>.</p></li><li><p>CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are Windows or Linux.</p></li><li><p>DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service deployments. Valid values are <code>SingleAZ</code> and <code>MultiAZ</code>.</p></li><li><p>INSTANCE_TYPE - The type of Amazon EC2 instance. An example is <code>m4.xlarge</code>.</p></li><li><p>LINKED_ACCOUNT - The description in the attribute map that includes the full name of the member account. The value field contains the AWS ID of the member account.</p></li><li><p>PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.</p></li><li><p>REGION - The AWS Region.</p></li><li><p>SCOPE (Utilization only) - The scope of a Reserved Instance (RI). Values are regional or a single Availability Zone.</p></li><li><p>TAG (Coverage only) - The tags that are associated with a Reserved Instance (RI).</p></li><li><p>TENANCY - The tenancy of a resource. Examples are shared or dedicated.</p></li></ul><p>If you set the context to <code>SAVINGS_PLANS</code>, you can use the following dimensions for searching:</p><ul><li><p>SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or Compute)</p></li><li><p>PAYMENT_OPTION - Payment option for the given Savings Plans (for example, All Upfront)</p></li><li><p>REGION - The AWS Region.</p></li><li><p>INSTANCE_TYPE_FAMILY - The family of instances (For example, <code>m5</code>)</p></li><li><p>LINKED_ACCOUNT - The description in the attribute map that includes the full name of the member account. The value field contains the AWS ID of the member account.</p></li><li><p>SAVINGS_PLAN_ARN - The unique identifier for your Savings Plan</p></li></ul>
 */
@property (nonatomic, assign) AWSceContext context;

/**
 <p>The name of the dimension. Each <code>Dimension</code> is available for a different <code>Context</code>. For more information, see <code>Context</code>. </p>
 */
@property (nonatomic, assign) AWSceDimension dimension;

/**
 <p>The token to retrieve the next set of results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The value that you want to search the filter values for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable searchString;

/**
 <p>The start and end dates for retrieving the dimension values. The start date is inclusive, but the end date is exclusive. For example, if <code>start</code> is <code>2017-01-01</code> and <code>end</code> is <code>2017-05-01</code>, then the cost and usage data is retrieved from <code>2017-01-01</code> up to and including <code>2017-04-30</code> but not including <code>2017-05-01</code>.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetDimensionValuesResponse : AWSModel


/**
 <p>The filters that you used to filter your request. Some dimensions are available only for a specific context.</p><p>If you set the context to <code>COST_AND_USAGE</code>, you can use the following dimensions for searching:</p><ul><li><p>AZ - The Availability Zone. An example is <code>us-east-1a</code>.</p></li><li><p>DATABASE_ENGINE - The Amazon Relational Database Service database. Examples are Aurora or MySQL.</p></li><li><p>INSTANCE_TYPE - The type of Amazon EC2 instance. An example is <code>m4.xlarge</code>.</p></li><li><p>LEGAL_ENTITY_NAME - The name of the organization that sells you AWS services, such as Amazon Web Services.</p></li><li><p>LINKED_ACCOUNT - The description in the attribute map that includes the full name of the member account. The value field contains the AWS ID of the member account.</p></li><li><p>OPERATING_SYSTEM - The operating system. Examples are Windows or Linux.</p></li><li><p>OPERATION - The action performed. Examples include <code>RunInstance</code> and <code>CreateBucket</code>.</p></li><li><p>PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.</p></li><li><p>PURCHASE_TYPE - The reservation type of the purchase to which this usage is related. Examples include On-Demand Instances and Standard Reserved Instances.</p></li><li><p>SERVICE - The AWS service such as Amazon DynamoDB.</p></li><li><p>USAGE_TYPE - The type of usage. An example is DataTransfer-In-Bytes. The response for the <code>GetDimensionValues</code> operation includes a unit attribute. Examples include GB and Hrs.</p></li><li><p>USAGE_TYPE_GROUP - The grouping of common usage types. An example is Amazon EC2: CloudWatch – Alarms. The response for this operation includes a unit attribute.</p></li><li><p>RECORD_TYPE - The different types of charges such as RI fees, usage costs, tax refunds, and credits.</p></li><li><p>RESOURCE_ID - The unique identifier of the resource. ResourceId is an opt-in feature only available for last 14 days for EC2-Compute Service.</p></li></ul><p>If you set the context to <code>RESERVATIONS</code>, you can use the following dimensions for searching:</p><ul><li><p>AZ - The Availability Zone. An example is <code>us-east-1a</code>.</p></li><li><p>CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are Windows or Linux.</p></li><li><p>DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service deployments. Valid values are <code>SingleAZ</code> and <code>MultiAZ</code>.</p></li><li><p>INSTANCE_TYPE - The type of Amazon EC2 instance. An example is <code>m4.xlarge</code>.</p></li><li><p>LINKED_ACCOUNT - The description in the attribute map that includes the full name of the member account. The value field contains the AWS ID of the member account.</p></li><li><p>PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.</p></li><li><p>REGION - The AWS Region.</p></li><li><p>SCOPE (Utilization only) - The scope of a Reserved Instance (RI). Values are regional or a single Availability Zone.</p></li><li><p>TAG (Coverage only) - The tags that are associated with a Reserved Instance (RI).</p></li><li><p>TENANCY - The tenancy of a resource. Examples are shared or dedicated.</p></li></ul><p>If you set the context to <code>SAVINGS_PLANS</code>, you can use the following dimensions for searching:</p><ul><li><p>SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or Compute)</p></li><li><p>PAYMENT_OPTION - Payment option for the given Savings Plans (for example, All Upfront)</p></li><li><p>REGION - The AWS Region.</p></li><li><p>INSTANCE_TYPE_FAMILY - The family of instances (For example, <code>m5</code>)</p></li><li><p>LINKED_ACCOUNT - The description in the attribute map that includes the full name of the member account. The value field contains the AWS ID of the member account.</p></li><li><p>SAVINGS_PLAN_ARN - The unique identifier for your Savings Plan</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSceDimensionValuesWithAttributes *> * _Nullable dimensionValues;

/**
 <p>The token for the next set of retrievable results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The number of results that AWS returned at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returnSize;

/**
 <p>The total number of search results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalSize;

@end

/**
 <p>You can use the following request parameters to query for how much of your instance usage a reservation covered.</p>
 Required parameters: [TimePeriod]
 */
@interface AWSceGetReservationCoverageRequest : AWSRequest


/**
 <p>Filters utilization data by dimensions. You can filter by the following dimensions:</p><ul><li><p>AZ</p></li><li><p>CACHE_ENGINE</p></li><li><p>DATABASE_ENGINE</p></li><li><p>DEPLOYMENT_OPTION</p></li><li><p>INSTANCE_TYPE</p></li><li><p>LINKED_ACCOUNT</p></li><li><p>OPERATING_SYSTEM</p></li><li><p>PLATFORM</p></li><li><p>REGION</p></li><li><p>SERVICE</p></li><li><p>TAG</p></li><li><p>TENANCY</p></li></ul><p><code>GetReservationCoverage</code> uses the same <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a> object as the other operations, but only <code>AND</code> is supported among each dimension. You can nest only one level deep. If there are multiple values for a dimension, they are OR'd together.</p><p>If you don't provide a <code>SERVICE</code> filter, Cost Explorer defaults to EC2.</p><p>Cost category is also supported.</p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable filter;

/**
 <p>The granularity of the AWS cost data for the reservation. Valid values are <code>MONTHLY</code> and <code>DAILY</code>.</p><p>If <code>GroupBy</code> is set, <code>Granularity</code> can't be set. If <code>Granularity</code> isn't set, the response object doesn't include <code>Granularity</code>, either <code>MONTHLY</code> or <code>DAILY</code>.</p><p>The <code>GetReservationCoverage</code> operation supports only <code>DAILY</code> and <code>MONTHLY</code> granularities.</p>
 */
@property (nonatomic, assign) AWSceGranularity granularity;

/**
 <p>You can group the data by the following attributes:</p><ul><li><p>AZ</p></li><li><p>CACHE_ENGINE</p></li><li><p>DATABASE_ENGINE</p></li><li><p>DEPLOYMENT_OPTION</p></li><li><p>INSTANCE_TYPE</p></li><li><p>LINKED_ACCOUNT</p></li><li><p>OPERATING_SYSTEM</p></li><li><p>PLATFORM</p></li><li><p>REGION</p></li><li><p>TENANCY</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSceGroupDefinition *> * _Nullable groupBy;

/**
 <p>The measurement that you want your reservation coverage reported in.</p><p>Valid values are <code>Hour</code>, <code>Unit</code>, and <code>Cost</code>. You can use multiple values in a request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable metrics;

/**
 <p>The token to retrieve the next set of results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The start and end dates of the period that you want to retrieve data about reservation coverage for. You can retrieve data for a maximum of 13 months: the last 12 months and the current month. The start date is inclusive, but the end date is exclusive. For example, if <code>start</code> is <code>2017-01-01</code> and <code>end</code> is <code>2017-05-01</code>, then the cost and usage data is retrieved from <code>2017-01-01</code> up to and including <code>2017-04-30</code> but not including <code>2017-05-01</code>. </p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetReservationCoverageResponse : AWSModel


/**
 <p>The amount of time that your reservations covered.</p>
 */
@property (nonatomic, strong) NSArray<AWSceCoverageByTime *> * _Nullable coveragesByTime;

/**
 <p>The token for the next set of retrievable results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The total amount of instance usage that a reservation covered.</p>
 */
@property (nonatomic, strong) AWSceCoverage * _Nullable total;

@end

/**
 
 */
@interface AWSceGetReservationPurchaseRecommendationRequest : AWSRequest


/**
 <p>The account ID that is associated with the recommendation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The account scope that you want your recommendations for. Amazon Web Services calculates recommendations including the payer account and linked accounts if the value is set to <code>PAYER</code>. If the value is <code>LINKED</code>, recommendations are calculated for individual linked accounts only.</p>
 */
@property (nonatomic, assign) AWSceAccountScope accountScope;

/**
 <p>The number of previous days that you want AWS to consider when it calculates your recommendations.</p>
 */
@property (nonatomic, assign) AWSceLookbackPeriodInDays lookbackPeriodInDays;

/**
 <p>The pagination token that indicates the next set of results that you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The number of recommendations that you want returned in a single response object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The reservation purchase option that you want recommendations for.</p>
 */
@property (nonatomic, assign) AWScePaymentOption paymentOption;

/**
 <p>The specific service that you want recommendations for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable service;

/**
 <p>The hardware specifications for the service instances that you want recommendations for, such as standard or convertible Amazon EC2 instances.</p>
 */
@property (nonatomic, strong) AWSceServiceSpecification * _Nullable serviceSpecification;

/**
 <p>The reservation term that you want recommendations for.</p>
 */
@property (nonatomic, assign) AWSceTermInYears termInYears;

@end

/**
 
 */
@interface AWSceGetReservationPurchaseRecommendationResponse : AWSModel


/**
 <p>Information about this specific recommendation call, such as the time stamp for when Cost Explorer generated this recommendation.</p>
 */
@property (nonatomic, strong) AWSceReservationPurchaseRecommendationMetadata * _Nullable metadata;

/**
 <p>The pagination token for the next set of retrievable results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Recommendations for reservations to purchase.</p>
 */
@property (nonatomic, strong) NSArray<AWSceReservationPurchaseRecommendation *> * _Nullable recommendations;

@end

/**
 
 */
@interface AWSceGetReservationUtilizationRequest : AWSRequest


/**
 <p>Filters utilization data by dimensions. You can filter by the following dimensions:</p><ul><li><p>AZ</p></li><li><p>CACHE_ENGINE</p></li><li><p>DEPLOYMENT_OPTION</p></li><li><p>INSTANCE_TYPE</p></li><li><p>LINKED_ACCOUNT</p></li><li><p>OPERATING_SYSTEM</p></li><li><p>PLATFORM</p></li><li><p>REGION</p></li><li><p>SERVICE</p></li><li><p>SCOPE</p></li><li><p>TENANCY</p></li></ul><p><code>GetReservationUtilization</code> uses the same <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a> object as the other operations, but only <code>AND</code> is supported among each dimension, and nesting is supported up to only one level deep. If there are multiple values for a dimension, they are OR'd together.</p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable filter;

/**
 <p>If <code>GroupBy</code> is set, <code>Granularity</code> can't be set. If <code>Granularity</code> isn't set, the response object doesn't include <code>Granularity</code>, either <code>MONTHLY</code> or <code>DAILY</code>. If both <code>GroupBy</code> and <code>Granularity</code> aren't set, <code>GetReservationUtilization</code> defaults to <code>DAILY</code>.</p><p>The <code>GetReservationUtilization</code> operation supports only <code>DAILY</code> and <code>MONTHLY</code> granularities.</p>
 */
@property (nonatomic, assign) AWSceGranularity granularity;

/**
 <p>Groups only by <code>SUBSCRIPTION_ID</code>. Metadata is included.</p>
 */
@property (nonatomic, strong) NSArray<AWSceGroupDefinition *> * _Nullable groupBy;

/**
 <p>The token to retrieve the next set of results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Sets the start and end dates for retrieving RI utilization. The start date is inclusive, but the end date is exclusive. For example, if <code>start</code> is <code>2017-01-01</code> and <code>end</code> is <code>2017-05-01</code>, then the cost and usage data is retrieved from <code>2017-01-01</code> up to and including <code>2017-04-30</code> but not including <code>2017-05-01</code>. </p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetReservationUtilizationResponse : AWSModel


/**
 <p>The token for the next set of retrievable results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The total amount of time that you used your RIs.</p>
 */
@property (nonatomic, strong) AWSceReservationAggregates * _Nullable total;

/**
 <p>The amount of time that you used your RIs.</p>
 */
@property (nonatomic, strong) NSArray<AWSceUtilizationByTime *> * _Nullable utilizationsByTime;

@end

/**
 
 */
@interface AWSceGetRightsizingRecommendationRequest : AWSRequest


/**
 <p> Enables you to customize recommendations across two attributes. You can choose to view recommendations for instances within the same instance families or across different instance families. You can also choose to view your estimated savings associated with recommendations with consideration of existing Savings Plans or RI benefits, or niether. </p>
 */
@property (nonatomic, strong) AWSceRightsizingRecommendationConfiguration * _Nullable configuration;

/**
 <p>Use <code>Expression</code> to filter by cost or by usage. There are two patterns: </p><ul><li><p>Simple dimension values - You can set the dimension name and values for the filters that you plan to use. For example, you can filter for <code>REGION==us-east-1 OR REGION==us-west-1</code>. The <code>Expression</code> for that looks like this:</p><p><code>{ "Dimensions": { "Key": "REGION", "Values": [ "us-east-1", “us-west-1” ] } }</code></p><p>The list of dimension values are OR'd together to retrieve cost or usage data. You can create <code>Expression</code> and <code>DimensionValues</code> objects using either <code>with*</code> methods or <code>set*</code> methods in multiple lines. </p></li><li><p>Compound dimension values with logical operations - You can use multiple <code>Expression</code> types and the logical operators <code>AND/OR/NOT</code> to create a list of one or more <code>Expression</code> objects. This allows you to filter on more advanced options. For example, you can filter on <code>((REGION == us-east-1 OR REGION == us-west-1) OR (TAG.Type == Type1)) AND (USAGE_TYPE != DataTransfer)</code>. The <code>Expression</code> for that looks like this:</p><p><code>{ "And": [ {"Or": [ {"Dimensions": { "Key": "REGION", "Values": [ "us-east-1", "us-west-1" ] }}, {"Tags": { "Key": "TagName", "Values": ["Value1"] } } ]}, {"Not": {"Dimensions": { "Key": "USAGE_TYPE", "Values": ["DataTransfer"] }}} ] } </code></p><note><p>Because each <code>Expression</code> can have only one operator, the service returns an error if more than one is specified. The following example shows an <code>Expression</code> object that creates an error.</p></note><p><code> { "And": [ ... ], "DimensionValues": { "Dimension": "USAGE_TYPE", "Values": [ "DataTransfer" ] } } </code></p></li></ul><note><p>For <code>GetRightsizingRecommendation</code> action, a combination of OR and NOT is not supported. OR is not supported between different dimensions, or dimensions and tags. NOT operators aren't supported. Dimensions are also limited to <code>LINKED_ACCOUNT</code>, <code>REGION</code>, or <code>RIGHTSIZING_TYPE</code>.</p></note>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable filter;

/**
 <p>The pagination token that indicates the next set of results that you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The number of recommendations that you want returned in a single response object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The specific service that you want recommendations for. The only valid value for <code>GetRightsizingRecommendation</code> is "<code>AmazonEC2</code>".</p>
 */
@property (nonatomic, strong) NSString * _Nullable service;

@end

/**
 
 */
@interface AWSceGetRightsizingRecommendationResponse : AWSModel


/**
 <p>Enables you to customize recommendations across two attributes. You can choose to view recommendations for instances within the same instance families or across different instance families. You can also choose to view your estimated savings associated with recommendations with consideration of existing Savings Plans or RI benefits, or niether. </p>
 */
@property (nonatomic, strong) AWSceRightsizingRecommendationConfiguration * _Nullable configuration;

/**
 <p>Information regarding this specific recommendation set.</p>
 */
@property (nonatomic, strong) AWSceRightsizingRecommendationMetadata * _Nullable metadata;

/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Recommendations to rightsize resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSceRightsizingRecommendation *> * _Nullable rightsizingRecommendations;

/**
 <p>Summary of this recommendation set.</p>
 */
@property (nonatomic, strong) AWSceRightsizingRecommendationSummary * _Nullable summary;

@end

/**
 
 */
@interface AWSceGetSavingsPlansCoverageRequest : AWSRequest


/**
 <p>Filters Savings Plans coverage data by dimensions. You can filter data for Savings Plans usage with the following dimensions:</p><ul><li><p><code>LINKED_ACCOUNT</code></p></li><li><p><code>REGION</code></p></li><li><p><code>SERVICE</code></p></li><li><p><code>INSTANCE_FAMILY</code></p></li></ul><p><code>GetSavingsPlansCoverage</code> uses the same <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a> object as the other operations, but only <code>AND</code> is supported among each dimension. If there are multiple values for a dimension, they are OR'd together.</p><p>Cost category is also supported.</p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable filter;

/**
 <p>The granularity of the Amazon Web Services cost data for your Savings Plans. <code>Granularity</code> can't be set if <code>GroupBy</code> is set.</p><p>The <code>GetSavingsPlansCoverage</code> operation supports only <code>DAILY</code> and <code>MONTHLY</code> granularities.</p>
 */
@property (nonatomic, assign) AWSceGranularity granularity;

/**
 <p>You can group the data using the attributes <code>INSTANCE_FAMILY</code>, <code>REGION</code>, or <code>SERVICE</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSceGroupDefinition *> * _Nullable groupBy;

/**
 <p>The number of items to be returned in a response. The default is <code>20</code>, with a minimum value of <code>1</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The measurement that you want your Savings Plans coverage reported in. The only valid value is <code>SpendCoveredBySavingsPlans</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable metrics;

/**
 <p>The token to retrieve the next set of results. Amazon Web Services provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The time period that you want the usage and costs for. The <code>Start</code> date must be within 13 months. The <code>End</code> date must be after the <code>Start</code> date, and before the current date. Future dates can't be used as an <code>End</code> date.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetSavingsPlansCoverageResponse : AWSModel


/**
 <p>The token to retrieve the next set of results. Amazon Web Services provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The amount of spend that your Savings Plans covered.</p>
 */
@property (nonatomic, strong) NSArray<AWSceSavingsPlansCoverage *> * _Nullable savingsPlansCoverages;

@end

/**
 
 */
@interface AWSceGetSavingsPlansPurchaseRecommendationRequest : AWSRequest


/**
 <p>The account scope that you want your recommendations for. Amazon Web Services calculates recommendations including the payer account and linked accounts if the value is set to <code>PAYER</code>. If the value is <code>LINKED</code>, recommendations are calculated for individual linked accounts only.</p>
 */
@property (nonatomic, assign) AWSceAccountScope accountScope;

/**
 <p>You can filter your recommendations by Account ID with the <code>LINKED_ACCOUNT</code> dimension. To filter your recommendations by Account ID, specify <code>Key</code> as <code>LINKED_ACCOUNT</code> and <code>Value</code> as the comma-separated Acount ID(s) for which you want to see Savings Plans purchase recommendations.</p><p>For GetSavingsPlansPurchaseRecommendation, the <code>Filter</code> does not include <code>CostCategories</code> or <code>Tags</code>. It only includes <code>Dimensions</code>. With <code>Dimensions</code>, <code>Key</code> must be <code>LINKED_ACCOUNT</code> and <code>Value</code> can be a single Account ID or multiple comma-separated Account IDs for which you want to see Savings Plans Purchase Recommendations. <code>AND</code> and <code>OR</code> operators are not supported.</p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable filter;

/**
 <p>The lookback period used to generate the recommendation.</p>
 */
@property (nonatomic, assign) AWSceLookbackPeriodInDays lookbackPeriodInDays;

/**
 <p>The token to retrieve the next set of results. Amazon Web Services provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The number of recommendations that you want returned in a single response object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The payment option used to generate these recommendations.</p>
 */
@property (nonatomic, assign) AWScePaymentOption paymentOption;

/**
 <p>The Savings Plans recommendation type requested.</p>
 */
@property (nonatomic, assign) AWSceSupportedSavingsPlansType savingsPlansType;

/**
 <p>The savings plan recommendation term used to generated these recommendations.</p>
 */
@property (nonatomic, assign) AWSceTermInYears termInYears;

@end

/**
 
 */
@interface AWSceGetSavingsPlansPurchaseRecommendationResponse : AWSModel


/**
 <p>Information regarding this specific recommendation set.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansPurchaseRecommendationMetadata * _Nullable metadata;

/**
 <p>The token for the next set of retrievable results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Contains your request parameters, Savings Plan Recommendations Summary, and Details.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansPurchaseRecommendation * _Nullable savingsPlansPurchaseRecommendation;

@end

/**
 
 */
@interface AWSceGetSavingsPlansUtilizationDetailsRequest : AWSRequest


/**
 <p>Filters Savings Plans utilization coverage data for active Savings Plans dimensions. You can filter data with the following dimensions:</p><ul><li><p><code>LINKED_ACCOUNT</code></p></li><li><p><code>SAVINGS_PLAN_ARN</code></p></li><li><p><code>REGION</code></p></li><li><p><code>PAYMENT_OPTION</code></p></li><li><p><code>INSTANCE_TYPE_FAMILY</code></p></li></ul><p><code>GetSavingsPlansUtilizationDetails</code> uses the same <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a> object as the other operations, but only <code>AND</code> is supported among each dimension.</p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable filter;

/**
 <p>The number of items to be returned in a response. The default is <code>20</code>, with a minimum value of <code>1</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next set of results. Amazon Web Services provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The time period that you want the usage and costs for. The <code>Start</code> date must be within 13 months. The <code>End</code> date must be after the <code>Start</code> date, and before the current date. Future dates can't be used as an <code>End</code> date.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetSavingsPlansUtilizationDetailsResponse : AWSModel


/**
 <p>The token to retrieve the next set of results. Amazon Web Services provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Retrieves a single daily or monthly Savings Plans utilization rate and details for your account.</p>
 */
@property (nonatomic, strong) NSArray<AWSceSavingsPlansUtilizationDetail *> * _Nullable savingsPlansUtilizationDetails;

/**
 <p>The time period that you want the usage and costs for. </p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

/**
 <p>The total Savings Plans utilization, regardless of time period.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansUtilizationAggregates * _Nullable total;

@end

/**
 
 */
@interface AWSceGetSavingsPlansUtilizationRequest : AWSRequest


/**
 <p>Filters Savings Plans utilization coverage data for active Savings Plans dimensions. You can filter data with the following dimensions:</p><ul><li><p><code>LINKED_ACCOUNT</code></p></li><li><p><code>SAVINGS_PLAN_ARN</code></p></li><li><p><code>SAVINGS_PLANS_TYPE</code></p></li><li><p><code>REGION</code></p></li><li><p><code>PAYMENT_OPTION</code></p></li><li><p><code>INSTANCE_TYPE_FAMILY</code></p></li></ul><p><code>GetSavingsPlansUtilization</code> uses the same <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a> object as the other operations, but only <code>AND</code> is supported among each dimension.</p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable filter;

/**
 <p>The granularity of the Amazon Web Services utillization data for your Savings Plans.</p><p>The <code>GetSavingsPlansUtilization</code> operation supports only <code>DAILY</code> and <code>MONTHLY</code> granularities.</p>
 */
@property (nonatomic, assign) AWSceGranularity granularity;

/**
 <p>The time period that you want the usage and costs for. The <code>Start</code> date must be within 13 months. The <code>End</code> date must be after the <code>Start</code> date, and before the current date. Future dates can't be used as an <code>End</code> date.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetSavingsPlansUtilizationResponse : AWSModel


/**
 <p>The amount of cost/commitment you used your Savings Plans. This allows you to specify date ranges.</p>
 */
@property (nonatomic, strong) NSArray<AWSceSavingsPlansUtilizationByTime *> * _Nullable savingsPlansUtilizationsByTime;

/**
 <p>The total amount of cost/commitment that you used your Savings Plans, regardless of date ranges.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansUtilizationAggregates * _Nullable total;

@end

/**
 
 */
@interface AWSceGetTagsRequest : AWSRequest


/**
 <p>The token to retrieve the next set of results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The value that you want to search for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable searchString;

/**
 <p>The key of the tag that you want to return values for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagKey;

/**
 <p>The start and end dates for retrieving the dimension values. The start date is inclusive, but the end date is exclusive. For example, if <code>start</code> is <code>2017-01-01</code> and <code>end</code> is <code>2017-05-01</code>, then the cost and usage data is retrieved from <code>2017-01-01</code> up to and including <code>2017-04-30</code> but not including <code>2017-05-01</code>.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetTagsResponse : AWSModel


/**
 <p>The token for the next set of retrievable results. AWS provides the token when the response from a previous call has more results than the maximum page size.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The number of query results that AWS returns at a time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returnSize;

/**
 <p>The tags that match your request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tags;

/**
 <p>The total number of query results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalSize;

@end

/**
 
 */
@interface AWSceGetUsageForecastRequest : AWSRequest


/**
 <p>The filters that you want to use to filter your forecast. Cost Explorer API supports all of the Cost Explorer filters.</p>
 */
@property (nonatomic, strong) AWSceExpression * _Nullable filter;

/**
 <p>How granular you want the forecast to be. You can get 3 months of <code>DAILY</code> forecasts or 12 months of <code>MONTHLY</code> forecasts.</p><p>The <code>GetUsageForecast</code> operation supports only <code>DAILY</code> and <code>MONTHLY</code> granularities.</p>
 */
@property (nonatomic, assign) AWSceGranularity granularity;

/**
 <p>Which metric Cost Explorer uses to create your forecast.</p><p>Valid values for a <code>GetUsageForecast</code> call are the following:</p><ul><li><p>USAGE_QUANTITY</p></li><li><p>NORMALIZED_USAGE_AMOUNT</p></li></ul>
 */
@property (nonatomic, assign) AWSceMetric metric;

/**
 <p>Cost Explorer always returns the mean forecast as a single point. You can request a prediction interval around the mean by specifying a confidence level. The higher the confidence level, the more confident Cost Explorer is about the actual value falling in the prediction interval. Higher confidence levels result in wider prediction intervals.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable predictionIntervalLevel;

/**
 <p>The start and end dates of the period that you want to retrieve usage forecast for. The start date is inclusive, but the end date is exclusive. For example, if <code>start</code> is <code>2017-01-01</code> and <code>end</code> is <code>2017-05-01</code>, then the cost and usage data is retrieved from <code>2017-01-01</code> up to and including <code>2017-04-30</code> but not including <code>2017-05-01</code>.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 
 */
@interface AWSceGetUsageForecastResponse : AWSModel


/**
 <p>The forecasts for your query, in order. For <code>DAILY</code> forecasts, this is a list of days. For <code>MONTHLY</code> forecasts, this is a list of months.</p>
 */
@property (nonatomic, strong) NSArray<AWSceForecastResult *> * _Nullable forecastResultsByTime;

/**
 <p>How much you're forecasted to use over the forecast period.</p>
 */
@property (nonatomic, strong) AWSceMetricValue * _Nullable total;

@end

/**
 <p>One level of grouped data in the results.</p>
 */
@interface AWSceGroup : AWSModel


/**
 <p>The keys that are included in this group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable keys;

/**
 <p>The metrics that are included in this group.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSceMetricValue *> * _Nullable metrics;

@end

/**
 <p>Represents a group when you specify a group by criteria or in the response to a query with a specific grouping.</p>
 */
@interface AWSceGroupDefinition : AWSModel


/**
 <p>The string that represents a key for a specified group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The string that represents the type of group.</p>
 */
@property (nonatomic, assign) AWSceGroupDefinitionType types;

@end

/**
 <p>Details about the instances that AWS recommends that you purchase.</p>
 */
@interface AWSceInstanceDetails : AWSModel


/**
 <p>The Amazon EC2 instances that AWS recommends that you purchase.</p>
 */
@property (nonatomic, strong) AWSceEC2InstanceDetails * _Nullable EC2InstanceDetails;

/**
 <p>The Amazon ES instances that AWS recommends that you purchase.</p>
 */
@property (nonatomic, strong) AWSceESInstanceDetails * _Nullable ESInstanceDetails;

/**
 <p>The ElastiCache instances that AWS recommends that you purchase.</p>
 */
@property (nonatomic, strong) AWSceElastiCacheInstanceDetails * _Nullable elastiCacheInstanceDetails;

/**
 <p>The Amazon RDS instances that AWS recommends that you purchase.</p>
 */
@property (nonatomic, strong) AWSceRDSInstanceDetails * _Nullable RDSInstanceDetails;

/**
 <p>The Amazon Redshift instances that AWS recommends that you purchase.</p>
 */
@property (nonatomic, strong) AWSceRedshiftInstanceDetails * _Nullable redshiftInstanceDetails;

@end

/**
 
 */
@interface AWSceListCostCategoryDefinitionsRequest : AWSRequest


/**
 <p> The date when the Cost Category was effective. </p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveOn;

/**
 <p> The number of entries a paginated response contains. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> The token to retrieve the next set of results. Amazon Web Services provides the token when the response from a previous call has more results than the maximum page size. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSceListCostCategoryDefinitionsResponse : AWSModel


/**
 <p> A reference to a Cost Category containing enough information to identify the Cost Category. </p>
 */
@property (nonatomic, strong) NSArray<AWSceCostCategoryReference *> * _Nullable costCategoryReferences;

/**
 <p> The token to retrieve the next set of results. Amazon Web Services provides the token when the response from a previous call has more results than the maximum page size. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The aggregated value for a metric.</p>
 */
@interface AWSceMetricValue : AWSModel


/**
 <p>The actual number that represents the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amount;

/**
 <p>The unit that the metric is given in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 <p> Details on the modification recommendation.</p>
 */
@interface AWSceModifyRecommendationDetail : AWSModel


/**
 <p>Identifies whether this instance type is the Amazon Web Services default recommendation.</p>
 */
@property (nonatomic, strong) NSArray<AWSceTargetInstance *> * _Nullable targetInstances;

@end

/**
 <p>Details about the Amazon RDS instances that AWS recommends that you purchase.</p>
 */
@interface AWSceRDSInstanceDetails : AWSModel


/**
 <p>Whether the recommendation is for a current-generation instance. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentGeneration;

/**
 <p>The database edition that the recommended reservation supports.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseEdition;

/**
 <p>The database engine that the recommended reservation supports.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseEngine;

/**
 <p>Whether the recommendation is for a reservation in a single Availability Zone or a reservation with a backup in a second Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentOption;

/**
 <p>The instance family of the recommended reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable family;

/**
 <p>The type of instance that AWS recommends.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The license model that the recommended reservation supports.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>The AWS Region of the recommended reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>Whether the recommended reservation is size flexible.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeFlexEligible;

@end

/**
 <p>Details about the Amazon Redshift instances that AWS recommends that you purchase.</p>
 */
@interface AWSceRedshiftInstanceDetails : AWSModel


/**
 <p>Whether the recommendation is for a current-generation instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentGeneration;

/**
 <p>The instance family of the recommended reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable family;

/**
 <p>The type of node that AWS recommends.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The AWS Region of the recommended reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>Whether the recommended reservation is size flexible.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeFlexEligible;

@end

/**
 <p>The aggregated numbers for your reservation usage.</p>
 */
@interface AWSceReservationAggregates : AWSModel


/**
 <p>The monthly cost of your reservation, amortized over the reservation period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amortizedRecurringFee;

/**
 <p>The upfront cost of your reservation, amortized over the reservation period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amortizedUpfrontFee;

/**
 <p>How much you saved due to purchasing and utilizing reservation. AWS calculates this by subtracting <code>TotalAmortizedFee</code> from <code>OnDemandCostOfRIHoursUsed</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable netRISavings;

/**
 <p>How much your reservation would cost if charged On-Demand rates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable onDemandCostOfRIHoursUsed;

/**
 <p>How many reservation hours that you purchased.</p>
 */
@property (nonatomic, strong) NSString * _Nullable purchasedHours;

/**
 <p>How many Amazon EC2 reservation hours that you purchased, converted to normalized units. Normalized units are available only for Amazon EC2 usage after November 11, 2017.</p>
 */
@property (nonatomic, strong) NSString * _Nullable purchasedUnits;

/**
 <p>The total number of reservation hours that you used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalActualHours;

/**
 <p>The total number of Amazon EC2 reservation hours that you used, converted to normalized units. Normalized units are available only for Amazon EC2 usage after November 11, 2017.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalActualUnits;

/**
 <p>The total cost of your reservation, amortized over the reservation period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalAmortizedFee;

/**
 <p>How much you could save if you use your entire reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalPotentialRISavings;

/**
 <p>The number of reservation hours that you didn't use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unusedHours;

/**
 <p>The number of Amazon EC2 reservation hours that you didn't use, converted to normalized units. Normalized units are available only for Amazon EC2 usage after November 11, 2017.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unusedUnits;

/**
 <p>The percentage of reservation time that you used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable utilizationPercentage;

/**
 <p>The percentage of Amazon EC2 reservation time that you used, converted to normalized units. Normalized units are available only for Amazon EC2 usage after November 11, 2017.</p>
 */
@property (nonatomic, strong) NSString * _Nullable utilizationPercentageInUnits;

@end

/**
 <p>A group of reservations that share a set of attributes.</p>
 */
@interface AWSceReservationCoverageGroup : AWSModel


/**
 <p>The attributes for this group of reservations.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>How much instance usage this group of reservations covered.</p>
 */
@property (nonatomic, strong) AWSceCoverage * _Nullable coverage;

@end

/**
 <p>A specific reservation that AWS recommends for purchase.</p>
 */
@interface AWSceReservationPurchaseRecommendation : AWSModel


/**
 <p>The account scope that AWS recommends that you purchase this instance for. For example, you can purchase this reservation for an entire organization in AWS Organizations.</p>
 */
@property (nonatomic, assign) AWSceAccountScope accountScope;

/**
 <p>How many days of previous usage that AWS considers when making this recommendation.</p>
 */
@property (nonatomic, assign) AWSceLookbackPeriodInDays lookbackPeriodInDays;

/**
 <p>The payment option for the reservation. For example, <code>AllUpfront</code> or <code>NoUpfront</code>.</p>
 */
@property (nonatomic, assign) AWScePaymentOption paymentOption;

/**
 <p>Details about the recommended purchases.</p>
 */
@property (nonatomic, strong) NSArray<AWSceReservationPurchaseRecommendationDetail *> * _Nullable recommendationDetails;

/**
 <p>A summary about the recommended purchase.</p>
 */
@property (nonatomic, strong) AWSceReservationPurchaseRecommendationSummary * _Nullable recommendationSummary;

/**
 <p>Hardware specifications for the service that you want recommendations for.</p>
 */
@property (nonatomic, strong) AWSceServiceSpecification * _Nullable serviceSpecification;

/**
 <p>The term of the reservation that you want recommendations for, in years.</p>
 */
@property (nonatomic, assign) AWSceTermInYears termInYears;

@end

/**
 <p>Details about your recommended reservation purchase.</p>
 */
@interface AWSceReservationPurchaseRecommendationDetail : AWSModel


/**
 <p>The account that this RI recommendation is for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The average number of normalized units that you used in an hour during the historical period. AWS uses this to calculate your recommended reservation purchases.</p>
 */
@property (nonatomic, strong) NSString * _Nullable averageNormalizedUnitsUsedPerHour;

/**
 <p>The average number of instances that you used in an hour during the historical period. AWS uses this to calculate your recommended reservation purchases.</p>
 */
@property (nonatomic, strong) NSString * _Nullable averageNumberOfInstancesUsedPerHour;

/**
 <p>The average utilization of your instances. AWS uses this to calculate your recommended reservation purchases.</p>
 */
@property (nonatomic, strong) NSString * _Nullable averageUtilization;

/**
 <p>The currency code that AWS used to calculate the costs for this instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p>How long AWS estimates that it takes for this instance to start saving you money, in months.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedBreakEvenInMonths;

/**
 <p>How much AWS estimates that you spend on On-Demand Instances in a month.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedMonthlyOnDemandCost;

/**
 <p>How much AWS estimates that this specific recommendation could save you in a month.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedMonthlySavingsAmount;

/**
 <p>How much AWS estimates that this specific recommendation could save you in a month, as a percentage of your overall costs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedMonthlySavingsPercentage;

/**
 <p>How much AWS estimates that you would have spent for all usage during the specified historical period if you had a reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedReservationCostForLookbackPeriod;

/**
 <p>Details about the instances that AWS recommends that you purchase.</p>
 */
@property (nonatomic, strong) AWSceInstanceDetails * _Nullable instanceDetails;

/**
 <p>The maximum number of normalized units that you used in an hour during the historical period. AWS uses this to calculate your recommended reservation purchases.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maximumNormalizedUnitsUsedPerHour;

/**
 <p>The maximum number of instances that you used in an hour during the historical period. AWS uses this to calculate your recommended reservation purchases.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maximumNumberOfInstancesUsedPerHour;

/**
 <p>The minimum number of normalized units that you used in an hour during the historical period. AWS uses this to calculate your recommended reservation purchases.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minimumNormalizedUnitsUsedPerHour;

/**
 <p>The minimum number of instances that you used in an hour during the historical period. AWS uses this to calculate your recommended reservation purchases.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minimumNumberOfInstancesUsedPerHour;

/**
 <p>The number of normalized units that AWS recommends that you purchase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendedNormalizedUnitsToPurchase;

/**
 <p>The number of instances that AWS recommends that you purchase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendedNumberOfInstancesToPurchase;

/**
 <p>How much purchasing this instance costs you on a monthly basis.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recurringStandardMonthlyCost;

/**
 <p>How much purchasing this instance costs you upfront.</p>
 */
@property (nonatomic, strong) NSString * _Nullable upfrontCost;

@end

/**
 <p>Information about this specific recommendation, such as the timestamp for when AWS made a specific recommendation.</p>
 */
@interface AWSceReservationPurchaseRecommendationMetadata : AWSModel


/**
 <p>The timestamp for when AWS made this recommendation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable generationTimestamp;

/**
 <p>The ID for this specific recommendation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationId;

@end

/**
 <p>A summary about this recommendation, such as the currency code, the amount that AWS estimates that you could save, and the total amount of reservation to purchase.</p>
 */
@interface AWSceReservationPurchaseRecommendationSummary : AWSModel


/**
 <p>The currency code used for this recommendation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p>The total amount that AWS estimates that this recommendation could save you in a month.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalEstimatedMonthlySavingsAmount;

/**
 <p>The total amount that AWS estimates that this recommendation could save you in a month, as a percentage of your costs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalEstimatedMonthlySavingsPercentage;

@end

/**
 <p>A group of reservations that share a set of attributes.</p>
 */
@interface AWSceReservationUtilizationGroup : AWSModel


/**
 <p>The attributes for this group of reservations.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The key for a specific reservation attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>How much you used this group of reservations.</p>
 */
@property (nonatomic, strong) AWSceReservationAggregates * _Nullable utilization;

/**
 <p>The value of a specific reservation attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Details on the resource.</p>
 */
@interface AWSceResourceDetails : AWSModel


/**
 <p>Details on the Amazon EC2 resource.</p>
 */
@property (nonatomic, strong) AWSceEC2ResourceDetails * _Nullable EC2ResourceDetails;

@end

/**
 <p>Resource utilization of current resource. </p>
 */
@interface AWSceResourceUtilization : AWSModel


/**
 <p>Utilization of current Amazon EC2 Instance </p>
 */
@property (nonatomic, strong) AWSceEC2ResourceUtilization * _Nullable EC2ResourceUtilization;

@end

/**
 <p>The result that is associated with a time period.</p>
 */
@interface AWSceResultByTime : AWSModel


/**
 <p>Whether the result is estimated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimated;

/**
 <p>The groups that this time period includes.</p>
 */
@property (nonatomic, strong) NSArray<AWSceGroup *> * _Nullable groups;

/**
 <p>The time period that the result covers.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

/**
 <p>The total amount of cost or usage accrued during the time period.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSceMetricValue *> * _Nullable total;

@end

/**
 <p>Recommendations to rightsize resources.</p>
 */
@interface AWSceRightsizingRecommendation : AWSModel


/**
 <p>The account that this recommendation is for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p> Context regarding the current instance.</p>
 */
@property (nonatomic, strong) AWSceCurrentInstance * _Nullable currentInstance;

/**
 <p> Details for modification recommendations. </p>
 */
@property (nonatomic, strong) AWSceModifyRecommendationDetail * _Nullable modifyRecommendationDetail;

/**
 <p>Recommendation to either terminate or modify the resource.</p>
 */
@property (nonatomic, assign) AWSceRightsizingType rightsizingType;

/**
 <p>Details for termination recommendations.</p>
 */
@property (nonatomic, strong) AWSceTerminateRecommendationDetail * _Nullable terminateRecommendationDetail;

@end

/**
 <p> Enables you to customize recommendations across two attributes. You can choose to view recommendations for instances within the same instance families or across different instance families. You can also choose to view your estimated savings associated with recommendations with consideration of existing Savings Plans or RI benefits, or niether. </p>
 Required parameters: [RecommendationTarget, BenefitsConsidered]
 */
@interface AWSceRightsizingRecommendationConfiguration : AWSModel


/**
 <p> The option to consider RI or Savings Plans discount benefits in your savings calculation. The default value is <code>TRUE</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable benefitsConsidered;

/**
 <p> The option to see recommendations within the same instance family, or recommendations for instances across other families. The default value is <code>SAME_INSTANCE_FAMILY</code>. </p>
 */
@property (nonatomic, assign) AWSceRecommendationTarget recommendationTarget;

@end

/**
 <p>Metadata for this recommendation set.</p>
 */
@interface AWSceRightsizingRecommendationMetadata : AWSModel


/**
 <p> The time stamp for when Amazon Web Services made this recommendation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable generationTimestamp;

/**
 <p> How many days of previous usage that Amazon Web Services considers when making this recommendation.</p>
 */
@property (nonatomic, assign) AWSceLookbackPeriodInDays lookbackPeriodInDays;

/**
 <p> The ID for this specific recommendation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationId;

@end

/**
 <p> Summary of rightsizing recommendations </p>
 */
@interface AWSceRightsizingRecommendationSummary : AWSModel


/**
 <p> Estimated total savings resulting from modifications, on a monthly basis.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedTotalMonthlySavingsAmount;

/**
 <p> The currency code that Amazon Web Services used to calculate the savings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable savingsCurrencyCode;

/**
 <p> Savings percentage based on the recommended modifications, relative to the total On Demand costs associated with these instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable savingsPercentage;

/**
 <p> Total number of instance recommendations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalRecommendationCount;

@end

/**
 <p>The amortized amount of Savings Plans purchased in a specific account during a specific time interval.</p>
 */
@interface AWSceSavingsPlansAmortizedCommitment : AWSModel


/**
 <p>The amortized amount of your Savings Plans commitment that was purchased with either a <code>Partial</code> or a <code>NoUpfront</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amortizedRecurringCommitment;

/**
 <p>The amortized amount of your Savings Plans commitment that was purchased with an <code>Upfront</code> or <code>PartialUpfront</code> Savings Plans.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amortizedUpfrontCommitment;

/**
 <p>The total amortized amount of your Savings Plans commitment, regardless of your Savings Plans purchase method. </p>
 */
@property (nonatomic, strong) NSString * _Nullable totalAmortizedCommitment;

@end

/**
 <p>The amount of Savings Plans eligible usage that is covered by Savings Plans. All calculations consider the On-Demand equivalent of your Savings Plans usage.</p>
 */
@interface AWSceSavingsPlansCoverage : AWSModel


/**
 <p>The attribute that applies to a specific <code>Dimension</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The amount of Savings Plans eligible usage that the Savings Plans covered.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansCoverageData * _Nullable coverage;

/**
 <p>The time period that you want the usage and costs for. </p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

@end

/**
 <p>Specific coverage percentage, On-Demand costs, and spend covered by Savings Plans, and total Savings Plans costs for an account.</p>
 */
@interface AWSceSavingsPlansCoverageData : AWSModel


/**
 <p>The percentage of your existing Savings Plans covered usage, divided by all of your eligible Savings Plans usage in an account(or set of accounts).</p>
 */
@property (nonatomic, strong) NSString * _Nullable coveragePercentage;

/**
 <p>The cost of your Amazon Web Services usage at the public On-Demand rate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable onDemandCost;

/**
 <p>The amount of your Amazon Web Services usage that is covered by a Savings Plans.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spendCoveredBySavingsPlans;

/**
 <p>The total cost of your Amazon Web Services usage, regardless of your purchase option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalCost;

@end

/**
 <p>Attribute details on a specific Savings Plan.</p>
 */
@interface AWSceSavingsPlansDetails : AWSModel


/**
 <p>A group of instance types that Savings Plans applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceFamily;

/**
 <p>The unique ID used to distinguish Savings Plans from one another.</p>
 */
@property (nonatomic, strong) NSString * _Nullable offeringId;

/**
 <p>A collection of AWS resources in a geographic area. Each AWS Region is isolated and independent of the other Regions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

@end

/**
 <p>Contains your request parameters, Savings Plan Recommendations Summary, and Details.</p>
 */
@interface AWSceSavingsPlansPurchaseRecommendation : AWSModel


/**
 <p>The account scope that you want your recommendations for. Amazon Web Services calculates recommendations including the payer account and linked accounts if the value is set to <code>PAYER</code>. If the value is <code>LINKED</code>, recommendations are calculated for individual linked accounts only.</p>
 */
@property (nonatomic, assign) AWSceAccountScope accountScope;

/**
 <p>The lookback period in days, used to generate the recommendation.</p>
 */
@property (nonatomic, assign) AWSceLookbackPeriodInDays lookbackPeriodInDays;

/**
 <p>The payment option used to generate the recommendation.</p>
 */
@property (nonatomic, assign) AWScePaymentOption paymentOption;

/**
 <p>Details for the Savings Plans we recommend that you purchase to cover existing Savings Plans eligible workloads.</p>
 */
@property (nonatomic, strong) NSArray<AWSceSavingsPlansPurchaseRecommendationDetail *> * _Nullable savingsPlansPurchaseRecommendationDetails;

/**
 <p>Summary metrics for your Savings Plans Recommendations. </p>
 */
@property (nonatomic, strong) AWSceSavingsPlansPurchaseRecommendationSummary * _Nullable savingsPlansPurchaseRecommendationSummary;

/**
 <p>The requested Savings Plans recommendation type.</p>
 */
@property (nonatomic, assign) AWSceSupportedSavingsPlansType savingsPlansType;

/**
 <p>The Savings Plans recommendation term in years, used to generate the recommendation.</p>
 */
@property (nonatomic, assign) AWSceTermInYears termInYears;

@end

/**
 <p>Details for your recommended Savings Plans.</p>
 */
@interface AWSceSavingsPlansPurchaseRecommendationDetail : AWSModel


/**
 <p>The <code>AccountID</code> the recommendation is generated for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The currency code Amazon Web Services used to generate the recommendations and present potential savings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p>The average value of hourly On-Demand spend over the lookback period of the applicable usage type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentAverageHourlyOnDemandSpend;

/**
 <p>The highest value of hourly On-Demand spend over the lookback period of the applicable usage type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentMaximumHourlyOnDemandSpend;

/**
 <p>The lowest value of hourly On-Demand spend over the lookback period of the applicable usage type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentMinimumHourlyOnDemandSpend;

/**
 <p>The estimated utilization of the recommended Savings Plans.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedAverageUtilization;

/**
 <p>The estimated monthly savings amount, based on the recommended Savings Plans.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedMonthlySavingsAmount;

/**
 <p>The remaining On-Demand cost estimated to not be covered by the recommended Savings Plans, over the length of the lookback period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedOnDemandCost;

/**
 <p> The estimated On-Demand costs you would expect with no additional commitment, based on your usage of the selected time period and the Savings Plans you own. </p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedOnDemandCostWithCurrentCommitment;

/**
 <p>The estimated return on investment based on the recommended Savings Plans purchased. This is calculated as <code>estimatedSavingsAmount</code>/ <code>estimatedSPCost</code>*100.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedROI;

/**
 <p>The cost of the recommended Savings Plans over the length of the lookback period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedSPCost;

/**
 <p>The estimated savings amount based on the recommended Savings Plans over the length of the lookback period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedSavingsAmount;

/**
 <p>The estimated savings percentage relative to the total cost of applicable On-Demand usage over the lookback period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedSavingsPercentage;

/**
 <p>The recommended hourly commitment level for the Savings Plans type, and configuration based on the usage during the lookback period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hourlyCommitmentToPurchase;

/**
 <p>Details for your recommended Savings Plans.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansDetails * _Nullable savingsPlansDetails;

/**
 <p>The upfront cost of the recommended Savings Plans, based on the selected payment option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable upfrontCost;

@end

/**
 <p>Metadata about your Savings Plans Purchase Recommendations.</p>
 */
@interface AWSceSavingsPlansPurchaseRecommendationMetadata : AWSModel


/**
 <p>The timestamp showing when the recommendations were generated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable generationTimestamp;

/**
 <p>The unique identifier for the recommendation set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationId;

@end

/**
 <p>Summary metrics for your Savings Plans Purchase Recommendations.</p>
 */
@interface AWSceSavingsPlansPurchaseRecommendationSummary : AWSModel


/**
 <p>The currency code Amazon Web Services used to generate the recommendations and present potential savings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p>The current total on demand spend of the applicable usage types over the lookback period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentOnDemandSpend;

/**
 <p>The recommended Savings Plans cost on a daily (24 hourly) basis.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dailyCommitmentToPurchase;

/**
 <p>The estimated monthly savings amount, based on the recommended Savings Plans purchase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedMonthlySavingsAmount;

/**
 <p> The estimated On-Demand costs you would expect with no additional commitment, based on your usage of the selected time period and the Savings Plans you own. </p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedOnDemandCostWithCurrentCommitment;

/**
 <p>The estimated return on investment based on the recommended Savings Plans and estimated savings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedROI;

/**
 <p>The estimated total savings over the lookback period, based on the purchase of the recommended Savings Plans.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedSavingsAmount;

/**
 <p>The estimated savings relative to the total cost of On-Demand usage, over the lookback period. This is calculated as <code>estimatedSavingsAmount</code>/ <code>CurrentOnDemandSpend</code>*100.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedSavingsPercentage;

/**
 <p>The estimated total cost of the usage after purchasing the recommended Savings Plans. This is a sum of the cost of Savings Plans during this term, and the remaining On-Demand usage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedTotalCost;

/**
 <p>The recommended hourly commitment based on the recommendation parameters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hourlyCommitmentToPurchase;

/**
 <p>The aggregate number of Savings Plans recommendations that exist for your account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalRecommendationCount;

@end

/**
 <p>The amount of savings you're accumulating, against the public On-Demand rate of the usage accrued in an account.</p>
 */
@interface AWSceSavingsPlansSavings : AWSModel


/**
 <p>The savings amount that you are accumulating for the usage that is covered by a Savings Plans, when compared to the On-Demand equivalent of the same usage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable netSavings;

/**
 <p>How much the amount that the usage would have cost if it was accrued at the On-Demand rate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable onDemandCostEquivalent;

@end

/**
 <p>The measurement of how well you are using your existing Savings Plans.</p>
 */
@interface AWSceSavingsPlansUtilization : AWSModel


/**
 <p>The total amount of Savings Plans commitment that's been purchased in an account (or set of accounts).</p>
 */
@property (nonatomic, strong) NSString * _Nullable totalCommitment;

/**
 <p>The amount of your Savings Plans commitment that was not consumed from Savings Plans eligible usage in a specific period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unusedCommitment;

/**
 <p>The amount of your Savings Plans commitment that was consumed from Savings Plans eligible usage in a specific period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable usedCommitment;

/**
 <p>The amount of <code>UsedCommitment</code> divided by the <code>TotalCommitment</code> for your Savings Plans.</p>
 */
@property (nonatomic, strong) NSString * _Nullable utilizationPercentage;

@end

/**
 <p>The aggregated utilization metrics for your Savings Plans usage.</p>
 Required parameters: [Utilization]
 */
@interface AWSceSavingsPlansUtilizationAggregates : AWSModel


/**
 <p>The total amortized commitment for a Savings Plans. This includes the sum of the upfront and recurring Savings Plans fees.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansAmortizedCommitment * _Nullable amortizedCommitment;

/**
 <p>The amount saved by using existing Savings Plans. Savings returns both net savings from Savings Plans, as well as the <code>onDemandCostEquivalent</code> of the Savings Plans when considering the utilization rate.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansSavings * _Nullable savings;

/**
 <p>A ratio of your effectiveness of using existing Savings Plans to apply to workloads that are Savings Plans eligible.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansUtilization * _Nullable utilization;

@end

/**
 <p>The amount of Savings Plans utilization, in hours.</p>
 Required parameters: [TimePeriod, Utilization]
 */
@interface AWSceSavingsPlansUtilizationByTime : AWSModel


/**
 <p>The total amortized commitment for a Savings Plans. This includes the sum of the upfront and recurring Savings Plans fees.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansAmortizedCommitment * _Nullable amortizedCommitment;

/**
 <p>The amount saved by using existing Savings Plans. Savings returns both net savings from Savings Plans as well as the <code>onDemandCostEquivalent</code> of the Savings Plans when considering the utilization rate.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansSavings * _Nullable savings;

/**
 <p>The time period that you want the usage and costs for. </p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

/**
 <p>A ratio of your effectiveness of using existing Savings Plans to apply to workloads that are Savings Plans eligible.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansUtilization * _Nullable utilization;

@end

/**
 <p>A single daily or monthly Savings Plans utilization rate, and details for your account. Master accounts in an organization have access to member accounts. You can use <code>GetDimensionValues</code> to determine the possible dimension values. </p>
 */
@interface AWSceSavingsPlansUtilizationDetail : AWSModel


/**
 <p>The total amortized commitment for a Savings Plans. Includes the sum of the upfront and recurring Savings Plans fees.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansAmortizedCommitment * _Nullable amortizedCommitment;

/**
 <p>The attribute that applies to a specific <code>Dimension</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The amount saved by using existing Savings Plans. Savings returns both net savings from savings plans as well as the <code>onDemandCostEquivalent</code> of the Savings Plans when considering the utilization rate.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansSavings * _Nullable savings;

/**
 <p>The unique Amazon Resource Name (ARN) for a particular Savings Plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable savingsPlanArn;

/**
 <p>A ratio of your effectiveness of using existing Savings Plans to apply to workloads that are Savings Plans eligible.</p>
 */
@property (nonatomic, strong) AWSceSavingsPlansUtilization * _Nullable utilization;

@end

/**
 <p>Hardware specifications for the service that you want recommendations for.</p>
 */
@interface AWSceServiceSpecification : AWSModel


/**
 <p>The Amazon EC2 hardware specifications that you want AWS to provide recommendations for.</p>
 */
@property (nonatomic, strong) AWSceEC2Specification * _Nullable EC2Specification;

@end

/**
 <p>The values that are available for a tag.</p>
 */
@interface AWSceTagValues : AWSModel


/**
 <p>The key for the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The match options that you can use to filter your results. <code>MatchOptions</code> is only applicable for only applicable for actions related to Cost Category. The default values for <code>MatchOptions</code> is <code>EQUALS</code> and <code>CASE_SENSITIVE</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable matchOptions;

/**
 <p>The specific value of the tag.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p> Details on recommended instance.</p>
 */
@interface AWSceTargetInstance : AWSModel


/**
 <p> The currency code that Amazon Web Services used to calculate the costs for this instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p> Indicates whether or not this recommendation is the defaulted Amazon Web Services recommendation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultTargetInstance;

/**
 <p> Expected cost to operate this instance type on a monthly basis.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedMonthlyCost;

/**
 <p> Estimated savings resulting from modification, on a monthly basis.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedMonthlySavings;

/**
 <p> Expected utilization metrics for target instance type.</p>
 */
@property (nonatomic, strong) AWSceResourceUtilization * _Nullable expectedResourceUtilization;

/**
 <p> Details on the target instance type. </p>
 */
@property (nonatomic, strong) AWSceResourceDetails * _Nullable resourceDetails;

@end

/**
 <p> Details on termination recommendation. </p>
 */
@interface AWSceTerminateRecommendationDetail : AWSModel


/**
 <p> The currency code that Amazon Web Services used to calculate the costs for this instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p> Estimated savings resulting from modification, on a monthly basis.</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedMonthlySavings;

@end

/**
 
 */
@interface AWSceUpdateCostCategoryDefinitionRequest : AWSRequest


/**
 <p>The unique identifier for your Cost Category.</p>
 */
@property (nonatomic, strong) NSString * _Nullable costCategoryArn;

/**
 <p>The rule schema version in this particular Cost Category.</p>
 */
@property (nonatomic, assign) AWSceCostCategoryRuleVersion ruleVersion;

/**
 <p>The <code>Expression</code> object used to categorize costs. For more information, see <a href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategoryRule.html">CostCategoryRule </a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSceCostCategoryRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSceUpdateCostCategoryDefinitionResponse : AWSModel


/**
 <p> The unique identifier for your Cost Category. </p>
 */
@property (nonatomic, strong) NSString * _Nullable costCategoryArn;

/**
 <p> The Cost Category's effective start date. </p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveStart;

@end

/**
 <p>The amount of utilization, in hours.</p>
 */
@interface AWSceUtilizationByTime : AWSModel


/**
 <p>The groups that this utilization result uses.</p>
 */
@property (nonatomic, strong) NSArray<AWSceReservationUtilizationGroup *> * _Nullable groups;

/**
 <p>The period of time that this utilization was used for.</p>
 */
@property (nonatomic, strong) AWSceDateInterval * _Nullable timePeriod;

/**
 <p>The total number of reservation hours that were used.</p>
 */
@property (nonatomic, strong) AWSceReservationAggregates * _Nullable total;

@end

NS_ASSUME_NONNULL_END
