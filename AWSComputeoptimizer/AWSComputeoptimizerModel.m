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

#import "AWSComputeoptimizerModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSComputeoptimizerErrorDomain = @"com.amazonaws.AWSComputeoptimizerErrorDomain";

@implementation AWSComputeoptimizerAutoScalingGroupConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredCapacity" : @"desiredCapacity",
             @"instanceType" : @"instanceType",
             @"maxSize" : @"maxSize",
             @"minSize" : @"minSize",
             };
}

@end

@implementation AWSComputeoptimizerAutoScalingGroupRecommendation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"accountId",
             @"autoScalingGroupArn" : @"autoScalingGroupArn",
             @"autoScalingGroupName" : @"autoScalingGroupName",
             @"currentConfiguration" : @"currentConfiguration",
             @"finding" : @"finding",
             @"lastRefreshTimestamp" : @"lastRefreshTimestamp",
             @"lookBackPeriodInDays" : @"lookBackPeriodInDays",
             @"recommendationOptions" : @"recommendationOptions",
             @"utilizationMetrics" : @"utilizationMetrics",
             };
}

+ (NSValueTransformer *)currentConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComputeoptimizerAutoScalingGroupConfiguration class]];
}

+ (NSValueTransformer *)findingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Underprovisioned"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingUnderprovisioned);
        }
        if ([value caseInsensitiveCompare:@"Overprovisioned"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingOverprovisioned);
        }
        if ([value caseInsensitiveCompare:@"Optimized"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingOptimized);
        }
        if ([value caseInsensitiveCompare:@"NotOptimized"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingNotOptimized);
        }
        return @(AWSComputeoptimizerFindingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerFindingUnderprovisioned:
                return @"Underprovisioned";
            case AWSComputeoptimizerFindingOverprovisioned:
                return @"Overprovisioned";
            case AWSComputeoptimizerFindingOptimized:
                return @"Optimized";
            case AWSComputeoptimizerFindingNotOptimized:
                return @"NotOptimized";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastRefreshTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)recommendationOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerAutoScalingGroupRecommendationOption class]];
}

+ (NSValueTransformer *)utilizationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerUtilizationMetric class]];
}

@end

@implementation AWSComputeoptimizerAutoScalingGroupRecommendationOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"configuration",
             @"performanceRisk" : @"performanceRisk",
             @"projectedUtilizationMetrics" : @"projectedUtilizationMetrics",
             @"rank" : @"rank",
             };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComputeoptimizerAutoScalingGroupConfiguration class]];
}

+ (NSValueTransformer *)projectedUtilizationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerUtilizationMetric class]];
}

@end

@implementation AWSComputeoptimizerDescribeRecommendationExportJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"jobIds" : @"jobIds",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerJobFilter class]];
}

@end

@implementation AWSComputeoptimizerDescribeRecommendationExportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"recommendationExportJobs" : @"recommendationExportJobs",
             };
}

+ (NSValueTransformer *)recommendationExportJobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerRecommendationExportJob class]];
}

@end

@implementation AWSComputeoptimizerExportAutoScalingGroupRecommendationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"accountIds",
             @"fieldsToExport" : @"fieldsToExport",
             @"fileFormat" : @"fileFormat",
             @"filters" : @"filters",
             @"includeMemberAccounts" : @"includeMemberAccounts",
             @"s3DestinationConfig" : @"s3DestinationConfig",
             };
}

+ (NSValueTransformer *)fileFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Csv"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFileFormatCsv);
        }
        return @(AWSComputeoptimizerFileFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerFileFormatCsv:
                return @"Csv";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerFilter class]];
}

+ (NSValueTransformer *)s3DestinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComputeoptimizerS3DestinationConfig class]];
}

@end

@implementation AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"jobId",
             @"s3Destination" : @"s3Destination",
             };
}

+ (NSValueTransformer *)s3DestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComputeoptimizerS3Destination class]];
}

@end

@implementation AWSComputeoptimizerExportDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3" : @"s3",
             };
}

+ (NSValueTransformer *)s3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComputeoptimizerS3Destination class]];
}

@end

@implementation AWSComputeoptimizerExportEC2InstanceRecommendationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"accountIds",
             @"fieldsToExport" : @"fieldsToExport",
             @"fileFormat" : @"fileFormat",
             @"filters" : @"filters",
             @"includeMemberAccounts" : @"includeMemberAccounts",
             @"s3DestinationConfig" : @"s3DestinationConfig",
             };
}

+ (NSValueTransformer *)fileFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Csv"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFileFormatCsv);
        }
        return @(AWSComputeoptimizerFileFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerFileFormatCsv:
                return @"Csv";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerFilter class]];
}

+ (NSValueTransformer *)s3DestinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComputeoptimizerS3DestinationConfig class]];
}

@end

@implementation AWSComputeoptimizerExportEC2InstanceRecommendationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"jobId",
             @"s3Destination" : @"s3Destination",
             };
}

+ (NSValueTransformer *)s3DestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComputeoptimizerS3Destination class]];
}

@end

@implementation AWSComputeoptimizerFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"values" : @"values",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Finding"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFilterNameFinding);
        }
        if ([value caseInsensitiveCompare:@"RecommendationSourceType"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFilterNameRecommendationSourceType);
        }
        return @(AWSComputeoptimizerFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerFilterNameFinding:
                return @"Finding";
            case AWSComputeoptimizerFilterNameRecommendationSourceType:
                return @"RecommendationSourceType";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComputeoptimizerGetAutoScalingGroupRecommendationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"accountIds",
             @"autoScalingGroupArns" : @"autoScalingGroupArns",
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerFilter class]];
}

@end

@implementation AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupRecommendations" : @"autoScalingGroupRecommendations",
             @"errors" : @"errors",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)autoScalingGroupRecommendationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerAutoScalingGroupRecommendation class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerGetRecommendationError class]];
}

@end

@implementation AWSComputeoptimizerGetEC2InstanceRecommendationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"accountIds",
             @"filters" : @"filters",
             @"instanceArns" : @"instanceArns",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerFilter class]];
}

@end

@implementation AWSComputeoptimizerGetEC2InstanceRecommendationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"errors",
             @"instanceRecommendations" : @"instanceRecommendations",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerGetRecommendationError class]];
}

+ (NSValueTransformer *)instanceRecommendationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerInstanceRecommendation class]];
}

@end

@implementation AWSComputeoptimizerGetEC2RecommendationProjectedMetricsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"instanceArn" : @"instanceArn",
             @"period" : @"period",
             @"startTime" : @"startTime",
             @"stat" : @"stat",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
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

+ (NSValueTransformer *)statJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
            return @(AWSComputeoptimizerMetricStatisticMaximum);
        }
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSComputeoptimizerMetricStatisticAverage);
        }
        return @(AWSComputeoptimizerMetricStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerMetricStatisticMaximum:
                return @"Maximum";
            case AWSComputeoptimizerMetricStatisticAverage:
                return @"Average";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommendedOptionProjectedMetrics" : @"recommendedOptionProjectedMetrics",
             };
}

+ (NSValueTransformer *)recommendedOptionProjectedMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerRecommendedOptionProjectedMetric class]];
}

@end

@implementation AWSComputeoptimizerGetEnrollmentStatusRequest

@end

@implementation AWSComputeoptimizerGetEnrollmentStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"memberAccountsEnrolled" : @"memberAccountsEnrolled",
             @"status" : @"status",
             @"statusReason" : @"statusReason",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusFailed);
        }
        return @(AWSComputeoptimizerStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerStatusActive:
                return @"Active";
            case AWSComputeoptimizerStatusInactive:
                return @"Inactive";
            case AWSComputeoptimizerStatusPending:
                return @"Pending";
            case AWSComputeoptimizerStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComputeoptimizerGetRecommendationError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"identifier" : @"identifier",
             @"message" : @"message",
             };
}

@end

@implementation AWSComputeoptimizerGetRecommendationSummariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"accountIds",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSComputeoptimizerGetRecommendationSummariesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"recommendationSummaries" : @"recommendationSummaries",
             };
}

+ (NSValueTransformer *)recommendationSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerRecommendationSummary class]];
}

@end

@implementation AWSComputeoptimizerInstanceRecommendation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"accountId",
             @"currentInstanceType" : @"currentInstanceType",
             @"finding" : @"finding",
             @"instanceArn" : @"instanceArn",
             @"instanceName" : @"instanceName",
             @"lastRefreshTimestamp" : @"lastRefreshTimestamp",
             @"lookBackPeriodInDays" : @"lookBackPeriodInDays",
             @"recommendationOptions" : @"recommendationOptions",
             @"recommendationSources" : @"recommendationSources",
             @"utilizationMetrics" : @"utilizationMetrics",
             };
}

+ (NSValueTransformer *)findingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Underprovisioned"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingUnderprovisioned);
        }
        if ([value caseInsensitiveCompare:@"Overprovisioned"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingOverprovisioned);
        }
        if ([value caseInsensitiveCompare:@"Optimized"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingOptimized);
        }
        if ([value caseInsensitiveCompare:@"NotOptimized"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingNotOptimized);
        }
        return @(AWSComputeoptimizerFindingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerFindingUnderprovisioned:
                return @"Underprovisioned";
            case AWSComputeoptimizerFindingOverprovisioned:
                return @"Overprovisioned";
            case AWSComputeoptimizerFindingOptimized:
                return @"Optimized";
            case AWSComputeoptimizerFindingNotOptimized:
                return @"NotOptimized";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastRefreshTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)recommendationOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerInstanceRecommendationOption class]];
}

+ (NSValueTransformer *)recommendationSourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerRecommendationSource class]];
}

+ (NSValueTransformer *)utilizationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerUtilizationMetric class]];
}

@end

@implementation AWSComputeoptimizerInstanceRecommendationOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceType" : @"instanceType",
             @"performanceRisk" : @"performanceRisk",
             @"projectedUtilizationMetrics" : @"projectedUtilizationMetrics",
             @"rank" : @"rank",
             };
}

+ (NSValueTransformer *)projectedUtilizationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerUtilizationMetric class]];
}

@end

@implementation AWSComputeoptimizerJobFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"values" : @"values",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ResourceType"] == NSOrderedSame) {
            return @(AWSComputeoptimizerJobFilterNameResourceType);
        }
        if ([value caseInsensitiveCompare:@"JobStatus"] == NSOrderedSame) {
            return @(AWSComputeoptimizerJobFilterNameJobStatus);
        }
        return @(AWSComputeoptimizerJobFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerJobFilterNameResourceType:
                return @"ResourceType";
            case AWSComputeoptimizerJobFilterNameJobStatus:
                return @"JobStatus";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComputeoptimizerProjectedMetric

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"timestamps" : @"timestamps",
             @"values" : @"values",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Cpu"] == NSOrderedSame) {
            return @(AWSComputeoptimizerMetricNameCpu);
        }
        if ([value caseInsensitiveCompare:@"Memory"] == NSOrderedSame) {
            return @(AWSComputeoptimizerMetricNameMemory);
        }
        return @(AWSComputeoptimizerMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerMetricNameCpu:
                return @"Cpu";
            case AWSComputeoptimizerMetricNameMemory:
                return @"Memory";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComputeoptimizerRecommendationExportJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimestamp" : @"creationTimestamp",
             @"destination" : @"destination",
             @"failureReason" : @"failureReason",
             @"jobId" : @"jobId",
             @"lastUpdatedTimestamp" : @"lastUpdatedTimestamp",
             @"resourceType" : @"resourceType",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComputeoptimizerExportDestination class]];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ec2Instance"] == NSOrderedSame) {
            return @(AWSComputeoptimizerResourceTypeEc2Instance);
        }
        if ([value caseInsensitiveCompare:@"AutoScalingGroup"] == NSOrderedSame) {
            return @(AWSComputeoptimizerResourceTypeAutoScalingGroup);
        }
        return @(AWSComputeoptimizerResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerResourceTypeEc2Instance:
                return @"Ec2Instance";
            case AWSComputeoptimizerResourceTypeAutoScalingGroup:
                return @"AutoScalingGroup";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Queued"] == NSOrderedSame) {
            return @(AWSComputeoptimizerJobStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSComputeoptimizerJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSComputeoptimizerJobStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSComputeoptimizerJobStatusFailed);
        }
        return @(AWSComputeoptimizerJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerJobStatusQueued:
                return @"Queued";
            case AWSComputeoptimizerJobStatusInProgress:
                return @"InProgress";
            case AWSComputeoptimizerJobStatusComplete:
                return @"Complete";
            case AWSComputeoptimizerJobStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComputeoptimizerRecommendationSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommendationSourceArn" : @"recommendationSourceArn",
             @"recommendationSourceType" : @"recommendationSourceType",
             };
}

+ (NSValueTransformer *)recommendationSourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ec2Instance"] == NSOrderedSame) {
            return @(AWSComputeoptimizerRecommendationSourceTypeEc2Instance);
        }
        if ([value caseInsensitiveCompare:@"AutoScalingGroup"] == NSOrderedSame) {
            return @(AWSComputeoptimizerRecommendationSourceTypeAutoScalingGroup);
        }
        return @(AWSComputeoptimizerRecommendationSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerRecommendationSourceTypeEc2Instance:
                return @"Ec2Instance";
            case AWSComputeoptimizerRecommendationSourceTypeAutoScalingGroup:
                return @"AutoScalingGroup";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComputeoptimizerRecommendationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"accountId",
             @"recommendationResourceType" : @"recommendationResourceType",
             @"summaries" : @"summaries",
             };
}

+ (NSValueTransformer *)recommendationResourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ec2Instance"] == NSOrderedSame) {
            return @(AWSComputeoptimizerRecommendationSourceTypeEc2Instance);
        }
        if ([value caseInsensitiveCompare:@"AutoScalingGroup"] == NSOrderedSame) {
            return @(AWSComputeoptimizerRecommendationSourceTypeAutoScalingGroup);
        }
        return @(AWSComputeoptimizerRecommendationSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerRecommendationSourceTypeEc2Instance:
                return @"Ec2Instance";
            case AWSComputeoptimizerRecommendationSourceTypeAutoScalingGroup:
                return @"AutoScalingGroup";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)summariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerSummary class]];
}

@end

@implementation AWSComputeoptimizerRecommendedOptionProjectedMetric

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectedMetrics" : @"projectedMetrics",
             @"rank" : @"rank",
             @"recommendedInstanceType" : @"recommendedInstanceType",
             };
}

+ (NSValueTransformer *)projectedMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComputeoptimizerProjectedMetric class]];
}

@end

@implementation AWSComputeoptimizerS3Destination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"bucket",
             @"key" : @"key",
             @"metadataKey" : @"metadataKey",
             };
}

@end

@implementation AWSComputeoptimizerS3DestinationConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"bucket",
             @"keyPrefix" : @"keyPrefix",
             };
}

@end

@implementation AWSComputeoptimizerSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Underprovisioned"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingUnderprovisioned);
        }
        if ([value caseInsensitiveCompare:@"Overprovisioned"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingOverprovisioned);
        }
        if ([value caseInsensitiveCompare:@"Optimized"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingOptimized);
        }
        if ([value caseInsensitiveCompare:@"NotOptimized"] == NSOrderedSame) {
            return @(AWSComputeoptimizerFindingNotOptimized);
        }
        return @(AWSComputeoptimizerFindingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerFindingUnderprovisioned:
                return @"Underprovisioned";
            case AWSComputeoptimizerFindingOverprovisioned:
                return @"Overprovisioned";
            case AWSComputeoptimizerFindingOptimized:
                return @"Optimized";
            case AWSComputeoptimizerFindingNotOptimized:
                return @"NotOptimized";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComputeoptimizerUpdateEnrollmentStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeMemberAccounts" : @"includeMemberAccounts",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusFailed);
        }
        return @(AWSComputeoptimizerStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerStatusActive:
                return @"Active";
            case AWSComputeoptimizerStatusInactive:
                return @"Inactive";
            case AWSComputeoptimizerStatusPending:
                return @"Pending";
            case AWSComputeoptimizerStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComputeoptimizerUpdateEnrollmentStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             @"statusReason" : @"statusReason",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSComputeoptimizerStatusFailed);
        }
        return @(AWSComputeoptimizerStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerStatusActive:
                return @"Active";
            case AWSComputeoptimizerStatusInactive:
                return @"Inactive";
            case AWSComputeoptimizerStatusPending:
                return @"Pending";
            case AWSComputeoptimizerStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComputeoptimizerUtilizationMetric

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"statistic" : @"statistic",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Cpu"] == NSOrderedSame) {
            return @(AWSComputeoptimizerMetricNameCpu);
        }
        if ([value caseInsensitiveCompare:@"Memory"] == NSOrderedSame) {
            return @(AWSComputeoptimizerMetricNameMemory);
        }
        return @(AWSComputeoptimizerMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerMetricNameCpu:
                return @"Cpu";
            case AWSComputeoptimizerMetricNameMemory:
                return @"Memory";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
            return @(AWSComputeoptimizerMetricStatisticMaximum);
        }
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSComputeoptimizerMetricStatisticAverage);
        }
        return @(AWSComputeoptimizerMetricStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComputeoptimizerMetricStatisticMaximum:
                return @"Maximum";
            case AWSComputeoptimizerMetricStatisticAverage:
                return @"Average";
            default:
                return nil;
        }
    }];
}

@end
