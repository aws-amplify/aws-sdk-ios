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

#import "AWSRoute53Model.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSRoute53ErrorDomain = @"com.amazonaws.AWSRoute53ErrorDomain";

@implementation AWSRoute53AccountLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_HEALTH_CHECKS_BY_OWNER"] == NSOrderedSame) {
            return @(AWSRoute53AccountLimitTypeMaxHealthChecksByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_HOSTED_ZONES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSRoute53AccountLimitTypeMaxHostedZonesByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSRoute53AccountLimitTypeMaxTrafficPolicyInstancesByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_REUSABLE_DELEGATION_SETS_BY_OWNER"] == NSOrderedSame) {
            return @(AWSRoute53AccountLimitTypeMaxReusableDelegationSetsByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_TRAFFIC_POLICIES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSRoute53AccountLimitTypeMaxTrafficPoliciesByOwner);
        }
        return @(AWSRoute53AccountLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53AccountLimitTypeMaxHealthChecksByOwner:
                return @"MAX_HEALTH_CHECKS_BY_OWNER";
            case AWSRoute53AccountLimitTypeMaxHostedZonesByOwner:
                return @"MAX_HOSTED_ZONES_BY_OWNER";
            case AWSRoute53AccountLimitTypeMaxTrafficPolicyInstancesByOwner:
                return @"MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER";
            case AWSRoute53AccountLimitTypeMaxReusableDelegationSetsByOwner:
                return @"MAX_REUSABLE_DELEGATION_SETS_BY_OWNER";
            case AWSRoute53AccountLimitTypeMaxTrafficPoliciesByOwner:
                return @"MAX_TRAFFIC_POLICIES_BY_OWNER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53AlarmIdentifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"region" : @"Region",
             };
}

+ (NSValueTransformer *)regionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionUsEast2);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionUsWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionUsWest2);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionCaCentral1);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionEuCentral1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionEuWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionEuWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionEuWest3);
        }
        if ([value caseInsensitiveCompare:@"ap-east-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionApEast1);
        }
        if ([value caseInsensitiveCompare:@"me-south-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionMeSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionApSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionApSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionApSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionApNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionApNortheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-3"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionApNortheast3);
        }
        if ([value caseInsensitiveCompare:@"eu-north-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionEuNorth1);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionSaEast1);
        }
        if ([value caseInsensitiveCompare:@"cn-northwest-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionCnNorthwest1);
        }
        if ([value caseInsensitiveCompare:@"cn-north-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionCnNorth1);
        }
        if ([value caseInsensitiveCompare:@"af-south-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionAfSouth1);
        }
        if ([value caseInsensitiveCompare:@"eu-south-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionEuSouth1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-west-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionUsGovWest1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-east-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionUsGovEast1);
        }
        if ([value caseInsensitiveCompare:@"us-iso-east-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionUsIsoEast1);
        }
        if ([value caseInsensitiveCompare:@"us-isob-east-1"] == NSOrderedSame) {
            return @(AWSRoute53CloudWatchRegionUsIsobEast1);
        }
        return @(AWSRoute53CloudWatchRegionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53CloudWatchRegionUsEast1:
                return @"us-east-1";
            case AWSRoute53CloudWatchRegionUsEast2:
                return @"us-east-2";
            case AWSRoute53CloudWatchRegionUsWest1:
                return @"us-west-1";
            case AWSRoute53CloudWatchRegionUsWest2:
                return @"us-west-2";
            case AWSRoute53CloudWatchRegionCaCentral1:
                return @"ca-central-1";
            case AWSRoute53CloudWatchRegionEuCentral1:
                return @"eu-central-1";
            case AWSRoute53CloudWatchRegionEuWest1:
                return @"eu-west-1";
            case AWSRoute53CloudWatchRegionEuWest2:
                return @"eu-west-2";
            case AWSRoute53CloudWatchRegionEuWest3:
                return @"eu-west-3";
            case AWSRoute53CloudWatchRegionApEast1:
                return @"ap-east-1";
            case AWSRoute53CloudWatchRegionMeSouth1:
                return @"me-south-1";
            case AWSRoute53CloudWatchRegionApSouth1:
                return @"ap-south-1";
            case AWSRoute53CloudWatchRegionApSoutheast1:
                return @"ap-southeast-1";
            case AWSRoute53CloudWatchRegionApSoutheast2:
                return @"ap-southeast-2";
            case AWSRoute53CloudWatchRegionApNortheast1:
                return @"ap-northeast-1";
            case AWSRoute53CloudWatchRegionApNortheast2:
                return @"ap-northeast-2";
            case AWSRoute53CloudWatchRegionApNortheast3:
                return @"ap-northeast-3";
            case AWSRoute53CloudWatchRegionEuNorth1:
                return @"eu-north-1";
            case AWSRoute53CloudWatchRegionSaEast1:
                return @"sa-east-1";
            case AWSRoute53CloudWatchRegionCnNorthwest1:
                return @"cn-northwest-1";
            case AWSRoute53CloudWatchRegionCnNorth1:
                return @"cn-north-1";
            case AWSRoute53CloudWatchRegionAfSouth1:
                return @"af-south-1";
            case AWSRoute53CloudWatchRegionEuSouth1:
                return @"eu-south-1";
            case AWSRoute53CloudWatchRegionUsGovWest1:
                return @"us-gov-west-1";
            case AWSRoute53CloudWatchRegionUsGovEast1:
                return @"us-gov-east-1";
            case AWSRoute53CloudWatchRegionUsIsoEast1:
                return @"us-iso-east-1";
            case AWSRoute53CloudWatchRegionUsIsobEast1:
                return @"us-isob-east-1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53AliasTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DNSName" : @"DNSName",
             @"evaluateTargetHealth" : @"EvaluateTargetHealth",
             @"hostedZoneId" : @"HostedZoneId",
             };
}

@end

@implementation AWSRoute53AssociateVPCWithHostedZoneRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"hostedZoneId" : @"HostedZoneId",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53VPC class]];
}

@end

@implementation AWSRoute53AssociateVPCWithHostedZoneResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeInfo" : @"ChangeInfo",
             };
}

+ (NSValueTransformer *)changeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53ChangeInfo class]];
}

@end

@implementation AWSRoute53Change

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"resourceRecordSet" : @"ResourceRecordSet",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE"] == NSOrderedSame) {
            return @(AWSRoute53ChangeActionCreate);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSRoute53ChangeActionDelete);
        }
        if ([value caseInsensitiveCompare:@"UPSERT"] == NSOrderedSame) {
            return @(AWSRoute53ChangeActionUpsert);
        }
        return @(AWSRoute53ChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53ChangeActionCreate:
                return @"CREATE";
            case AWSRoute53ChangeActionDelete:
                return @"DELETE";
            case AWSRoute53ChangeActionUpsert:
                return @"UPSERT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceRecordSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53ResourceRecordSet class]];
}

@end

@implementation AWSRoute53ChangeBatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changes" : @"Changes",
             @"comment" : @"Comment",
             };
}

+ (NSValueTransformer *)changesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53Change class]];
}

@end

@implementation AWSRoute53ChangeInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"identifier" : @"Id",
             @"status" : @"Status",
             @"submittedAt" : @"SubmittedAt",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSRoute53ChangeStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INSYNC"] == NSOrderedSame) {
            return @(AWSRoute53ChangeStatusInsync);
        }
        return @(AWSRoute53ChangeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53ChangeStatusPending:
                return @"PENDING";
            case AWSRoute53ChangeStatusInsync:
                return @"INSYNC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submittedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSRoute53ChangeResourceRecordSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeBatch" : @"ChangeBatch",
             @"hostedZoneId" : @"HostedZoneId",
             };
}

+ (NSValueTransformer *)changeBatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53ChangeBatch class]];
}

@end

@implementation AWSRoute53ChangeResourceRecordSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeInfo" : @"ChangeInfo",
             };
}

+ (NSValueTransformer *)changeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53ChangeInfo class]];
}

@end

@implementation AWSRoute53ChangeTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addTags" : @"AddTags",
             @"removeTagKeys" : @"RemoveTagKeys",
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)addTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53Tag class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"healthcheck"] == NSOrderedSame) {
            return @(AWSRoute53TagResourceTypeHealthcheck);
        }
        if ([value caseInsensitiveCompare:@"hostedzone"] == NSOrderedSame) {
            return @(AWSRoute53TagResourceTypeHostedzone);
        }
        return @(AWSRoute53TagResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53TagResourceTypeHealthcheck:
                return @"healthcheck";
            case AWSRoute53TagResourceTypeHostedzone:
                return @"hostedzone";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53ChangeTagsForResourceResponse

@end

@implementation AWSRoute53CloudWatchAlarmConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonOperator" : @"ComparisonOperator",
             @"dimensions" : @"Dimensions",
             @"evaluationPeriods" : @"EvaluationPeriods",
             @"metricName" : @"MetricName",
             @"namespace" : @"Namespace",
             @"period" : @"Period",
             @"statistic" : @"Statistic",
             @"threshold" : @"Threshold",
             };
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GreaterThanOrEqualToThreshold"] == NSOrderedSame) {
            return @(AWSRoute53ComparisonOperatorGreaterThanOrEqualToThreshold);
        }
        if ([value caseInsensitiveCompare:@"GreaterThanThreshold"] == NSOrderedSame) {
            return @(AWSRoute53ComparisonOperatorGreaterThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanThreshold"] == NSOrderedSame) {
            return @(AWSRoute53ComparisonOperatorLessThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanOrEqualToThreshold"] == NSOrderedSame) {
            return @(AWSRoute53ComparisonOperatorLessThanOrEqualToThreshold);
        }
        return @(AWSRoute53ComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53ComparisonOperatorGreaterThanOrEqualToThreshold:
                return @"GreaterThanOrEqualToThreshold";
            case AWSRoute53ComparisonOperatorGreaterThanThreshold:
                return @"GreaterThanThreshold";
            case AWSRoute53ComparisonOperatorLessThanThreshold:
                return @"LessThanThreshold";
            case AWSRoute53ComparisonOperatorLessThanOrEqualToThreshold:
                return @"LessThanOrEqualToThreshold";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53Dimension class]];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSRoute53StatisticAverage);
        }
        if ([value caseInsensitiveCompare:@"Sum"] == NSOrderedSame) {
            return @(AWSRoute53StatisticSum);
        }
        if ([value caseInsensitiveCompare:@"SampleCount"] == NSOrderedSame) {
            return @(AWSRoute53StatisticSampleCount);
        }
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
            return @(AWSRoute53StatisticMaximum);
        }
        if ([value caseInsensitiveCompare:@"Minimum"] == NSOrderedSame) {
            return @(AWSRoute53StatisticMinimum);
        }
        return @(AWSRoute53StatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53StatisticAverage:
                return @"Average";
            case AWSRoute53StatisticSum:
                return @"Sum";
            case AWSRoute53StatisticSampleCount:
                return @"SampleCount";
            case AWSRoute53StatisticMaximum:
                return @"Maximum";
            case AWSRoute53StatisticMinimum:
                return @"Minimum";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53CreateHealthCheckRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"healthCheckConfig" : @"HealthCheckConfig",
             };
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53HealthCheckConfig class]];
}

@end

@implementation AWSRoute53CreateHealthCheckResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheck" : @"HealthCheck",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)healthCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53HealthCheck class]];
}

@end

@implementation AWSRoute53CreateHostedZoneRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"delegationSetId" : @"DelegationSetId",
             @"hostedZoneConfig" : @"HostedZoneConfig",
             @"name" : @"Name",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)hostedZoneConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53HostedZoneConfig class]];
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53VPC class]];
}

@end

@implementation AWSRoute53CreateHostedZoneResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeInfo" : @"ChangeInfo",
             @"delegationSet" : @"DelegationSet",
             @"hostedZone" : @"HostedZone",
             @"location" : @"Location",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)changeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53ChangeInfo class]];
}

+ (NSValueTransformer *)delegationSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53DelegationSet class]];
}

+ (NSValueTransformer *)hostedZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53HostedZone class]];
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53VPC class]];
}

@end

@implementation AWSRoute53CreateQueryLoggingConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogsLogGroupArn" : @"CloudWatchLogsLogGroupArn",
             @"hostedZoneId" : @"HostedZoneId",
             };
}

@end

@implementation AWSRoute53CreateQueryLoggingConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"queryLoggingConfig" : @"QueryLoggingConfig",
             };
}

+ (NSValueTransformer *)queryLoggingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53QueryLoggingConfig class]];
}

@end

@implementation AWSRoute53CreateReusableDelegationSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"hostedZoneId" : @"HostedZoneId",
             };
}

@end

@implementation AWSRoute53CreateReusableDelegationSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationSet" : @"DelegationSet",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)delegationSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53DelegationSet class]];
}

@end

@implementation AWSRoute53CreateTrafficPolicyInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"name" : @"Name",
             @"TTL" : @"TTL",
             @"trafficPolicyId" : @"TrafficPolicyId",
             @"trafficPolicyVersion" : @"TrafficPolicyVersion",
             };
}

@end

@implementation AWSRoute53CreateTrafficPolicyInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"trafficPolicyInstance" : @"TrafficPolicyInstance",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53TrafficPolicyInstance class]];
}

@end

@implementation AWSRoute53CreateTrafficPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"document" : @"Document",
             @"name" : @"Name",
             };
}

@end

@implementation AWSRoute53CreateTrafficPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"trafficPolicy" : @"TrafficPolicy",
             };
}

+ (NSValueTransformer *)trafficPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53TrafficPolicy class]];
}

@end

@implementation AWSRoute53CreateTrafficPolicyVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"document" : @"Document",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53CreateTrafficPolicyVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"trafficPolicy" : @"TrafficPolicy",
             };
}

+ (NSValueTransformer *)trafficPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53TrafficPolicy class]];
}

@end

@implementation AWSRoute53CreateVPCAssociationAuthorizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53VPC class]];
}

@end

@implementation AWSRoute53CreateVPCAssociationAuthorizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53VPC class]];
}

@end

@implementation AWSRoute53DelegationSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"identifier" : @"Id",
             @"nameServers" : @"NameServers",
             };
}

@end

@implementation AWSRoute53DeleteHealthCheckRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckId" : @"HealthCheckId",
             };
}

@end

@implementation AWSRoute53DeleteHealthCheckResponse

@end

@implementation AWSRoute53DeleteHostedZoneRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53DeleteHostedZoneResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeInfo" : @"ChangeInfo",
             };
}

+ (NSValueTransformer *)changeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53ChangeInfo class]];
}

@end

@implementation AWSRoute53DeleteQueryLoggingConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53DeleteQueryLoggingConfigResponse

@end

@implementation AWSRoute53DeleteReusableDelegationSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53DeleteReusableDelegationSetResponse

@end

@implementation AWSRoute53DeleteTrafficPolicyInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53DeleteTrafficPolicyInstanceResponse

@end

@implementation AWSRoute53DeleteTrafficPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"version" : @"Version",
             };
}

@end

@implementation AWSRoute53DeleteTrafficPolicyResponse

@end

@implementation AWSRoute53DeleteVPCAssociationAuthorizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53VPC class]];
}

@end

@implementation AWSRoute53DeleteVPCAssociationAuthorizationResponse

@end

@implementation AWSRoute53Dimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRoute53DisassociateVPCFromHostedZoneRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"hostedZoneId" : @"HostedZoneId",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53VPC class]];
}

@end

@implementation AWSRoute53DisassociateVPCFromHostedZoneResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeInfo" : @"ChangeInfo",
             };
}

+ (NSValueTransformer *)changeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53ChangeInfo class]];
}

@end

@implementation AWSRoute53GeoLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continentCode" : @"ContinentCode",
             @"countryCode" : @"CountryCode",
             @"subdivisionCode" : @"SubdivisionCode",
             };
}

@end

@implementation AWSRoute53GeoLocationDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continentCode" : @"ContinentCode",
             @"continentName" : @"ContinentName",
             @"countryCode" : @"CountryCode",
             @"countryName" : @"CountryName",
             @"subdivisionCode" : @"SubdivisionCode",
             @"subdivisionName" : @"SubdivisionName",
             };
}

@end

@implementation AWSRoute53GetAccountLimitRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_HEALTH_CHECKS_BY_OWNER"] == NSOrderedSame) {
            return @(AWSRoute53AccountLimitTypeMaxHealthChecksByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_HOSTED_ZONES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSRoute53AccountLimitTypeMaxHostedZonesByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSRoute53AccountLimitTypeMaxTrafficPolicyInstancesByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_REUSABLE_DELEGATION_SETS_BY_OWNER"] == NSOrderedSame) {
            return @(AWSRoute53AccountLimitTypeMaxReusableDelegationSetsByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_TRAFFIC_POLICIES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSRoute53AccountLimitTypeMaxTrafficPoliciesByOwner);
        }
        return @(AWSRoute53AccountLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53AccountLimitTypeMaxHealthChecksByOwner:
                return @"MAX_HEALTH_CHECKS_BY_OWNER";
            case AWSRoute53AccountLimitTypeMaxHostedZonesByOwner:
                return @"MAX_HOSTED_ZONES_BY_OWNER";
            case AWSRoute53AccountLimitTypeMaxTrafficPolicyInstancesByOwner:
                return @"MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER";
            case AWSRoute53AccountLimitTypeMaxReusableDelegationSetsByOwner:
                return @"MAX_REUSABLE_DELEGATION_SETS_BY_OWNER";
            case AWSRoute53AccountLimitTypeMaxTrafficPoliciesByOwner:
                return @"MAX_TRAFFIC_POLICIES_BY_OWNER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53GetAccountLimitResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"limit" : @"Limit",
             };
}

+ (NSValueTransformer *)limitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53AccountLimit class]];
}

@end

@implementation AWSRoute53GetChangeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53GetChangeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeInfo" : @"ChangeInfo",
             };
}

+ (NSValueTransformer *)changeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53ChangeInfo class]];
}

@end

@implementation AWSRoute53GetCheckerIpRangesRequest

@end

@implementation AWSRoute53GetCheckerIpRangesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkerIpRanges" : @"CheckerIpRanges",
             };
}

@end

@implementation AWSRoute53GetGeoLocationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continentCode" : @"ContinentCode",
             @"countryCode" : @"CountryCode",
             @"subdivisionCode" : @"SubdivisionCode",
             };
}

@end

@implementation AWSRoute53GetGeoLocationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoLocationDetails" : @"GeoLocationDetails",
             };
}

+ (NSValueTransformer *)geoLocationDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53GeoLocationDetails class]];
}

@end

@implementation AWSRoute53GetHealthCheckCountRequest

@end

@implementation AWSRoute53GetHealthCheckCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckCount" : @"HealthCheckCount",
             };
}

@end

@implementation AWSRoute53GetHealthCheckLastFailureReasonRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckId" : @"HealthCheckId",
             };
}

@end

@implementation AWSRoute53GetHealthCheckLastFailureReasonResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckObservations" : @"HealthCheckObservations",
             };
}

+ (NSValueTransformer *)healthCheckObservationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53HealthCheckObservation class]];
}

@end

@implementation AWSRoute53GetHealthCheckRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckId" : @"HealthCheckId",
             };
}

@end

@implementation AWSRoute53GetHealthCheckResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheck" : @"HealthCheck",
             };
}

+ (NSValueTransformer *)healthCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53HealthCheck class]];
}

@end

@implementation AWSRoute53GetHealthCheckStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckId" : @"HealthCheckId",
             };
}

@end

@implementation AWSRoute53GetHealthCheckStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckObservations" : @"HealthCheckObservations",
             };
}

+ (NSValueTransformer *)healthCheckObservationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53HealthCheckObservation class]];
}

@end

@implementation AWSRoute53GetHostedZoneCountRequest

@end

@implementation AWSRoute53GetHostedZoneCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneCount" : @"HostedZoneCount",
             };
}

@end

@implementation AWSRoute53GetHostedZoneLimitRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_RRSETS_BY_ZONE"] == NSOrderedSame) {
            return @(AWSRoute53HostedZoneLimitTypeMaxRrsetsByZone);
        }
        if ([value caseInsensitiveCompare:@"MAX_VPCS_ASSOCIATED_BY_ZONE"] == NSOrderedSame) {
            return @(AWSRoute53HostedZoneLimitTypeMaxVpcsAssociatedByZone);
        }
        return @(AWSRoute53HostedZoneLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53HostedZoneLimitTypeMaxRrsetsByZone:
                return @"MAX_RRSETS_BY_ZONE";
            case AWSRoute53HostedZoneLimitTypeMaxVpcsAssociatedByZone:
                return @"MAX_VPCS_ASSOCIATED_BY_ZONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53GetHostedZoneLimitResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"limit" : @"Limit",
             };
}

+ (NSValueTransformer *)limitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53HostedZoneLimit class]];
}

@end

@implementation AWSRoute53GetHostedZoneRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53GetHostedZoneResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationSet" : @"DelegationSet",
             @"hostedZone" : @"HostedZone",
             @"VPCs" : @"VPCs",
             };
}

+ (NSValueTransformer *)delegationSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53DelegationSet class]];
}

+ (NSValueTransformer *)hostedZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53HostedZone class]];
}

+ (NSValueTransformer *)VPCsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53VPC class]];
}

@end

@implementation AWSRoute53GetQueryLoggingConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53GetQueryLoggingConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryLoggingConfig" : @"QueryLoggingConfig",
             };
}

+ (NSValueTransformer *)queryLoggingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53QueryLoggingConfig class]];
}

@end

@implementation AWSRoute53GetReusableDelegationSetLimitRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationSetId" : @"DelegationSetId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_ZONES_BY_REUSABLE_DELEGATION_SET"] == NSOrderedSame) {
            return @(AWSRoute53ReusableDelegationSetLimitTypeMaxZonesByReusableDelegationSet);
        }
        return @(AWSRoute53ReusableDelegationSetLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53ReusableDelegationSetLimitTypeMaxZonesByReusableDelegationSet:
                return @"MAX_ZONES_BY_REUSABLE_DELEGATION_SET";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53GetReusableDelegationSetLimitResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"limit" : @"Limit",
             };
}

+ (NSValueTransformer *)limitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53ReusableDelegationSetLimit class]];
}

@end

@implementation AWSRoute53GetReusableDelegationSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53GetReusableDelegationSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationSet" : @"DelegationSet",
             };
}

+ (NSValueTransformer *)delegationSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53DelegationSet class]];
}

@end

@implementation AWSRoute53GetTrafficPolicyInstanceCountRequest

@end

@implementation AWSRoute53GetTrafficPolicyInstanceCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficPolicyInstanceCount" : @"TrafficPolicyInstanceCount",
             };
}

@end

@implementation AWSRoute53GetTrafficPolicyInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53GetTrafficPolicyInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficPolicyInstance" : @"TrafficPolicyInstance",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53TrafficPolicyInstance class]];
}

@end

@implementation AWSRoute53GetTrafficPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"version" : @"Version",
             };
}

@end

@implementation AWSRoute53GetTrafficPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficPolicy" : @"TrafficPolicy",
             };
}

+ (NSValueTransformer *)trafficPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53TrafficPolicy class]];
}

@end

@implementation AWSRoute53HealthCheck

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"cloudWatchAlarmConfiguration" : @"CloudWatchAlarmConfiguration",
             @"healthCheckConfig" : @"HealthCheckConfig",
             @"healthCheckVersion" : @"HealthCheckVersion",
             @"identifier" : @"Id",
             @"linkedService" : @"LinkedService",
             };
}

+ (NSValueTransformer *)cloudWatchAlarmConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53CloudWatchAlarmConfiguration class]];
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53HealthCheckConfig class]];
}

+ (NSValueTransformer *)linkedServiceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53LinkedService class]];
}

@end

@implementation AWSRoute53HealthCheckConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmIdentifier" : @"AlarmIdentifier",
             @"childHealthChecks" : @"ChildHealthChecks",
             @"disabled" : @"Disabled",
             @"enableSNI" : @"EnableSNI",
             @"failureThreshold" : @"FailureThreshold",
             @"fullyQualifiedDomainName" : @"FullyQualifiedDomainName",
             @"healthThreshold" : @"HealthThreshold",
             @"IPAddress" : @"IPAddress",
             @"insufficientDataHealthStatus" : @"InsufficientDataHealthStatus",
             @"inverted" : @"Inverted",
             @"measureLatency" : @"MeasureLatency",
             @"port" : @"Port",
             @"regions" : @"Regions",
             @"requestInterval" : @"RequestInterval",
             @"resourcePath" : @"ResourcePath",
             @"searchString" : @"SearchString",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)alarmIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53AlarmIdentifier class]];
}

+ (NSValueTransformer *)insufficientDataHealthStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Healthy"] == NSOrderedSame) {
            return @(AWSRoute53InsufficientDataHealthStatusHealthy);
        }
        if ([value caseInsensitiveCompare:@"Unhealthy"] == NSOrderedSame) {
            return @(AWSRoute53InsufficientDataHealthStatusUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"LastKnownStatus"] == NSOrderedSame) {
            return @(AWSRoute53InsufficientDataHealthStatusLastKnownStatus);
        }
        return @(AWSRoute53InsufficientDataHealthStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53InsufficientDataHealthStatusHealthy:
                return @"Healthy";
            case AWSRoute53InsufficientDataHealthStatusUnhealthy:
                return @"Unhealthy";
            case AWSRoute53InsufficientDataHealthStatusLastKnownStatus:
                return @"LastKnownStatus";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckTypeHttps);
        }
        if ([value caseInsensitiveCompare:@"HTTP_STR_MATCH"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckTypeHttpStrMatch);
        }
        if ([value caseInsensitiveCompare:@"HTTPS_STR_MATCH"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckTypeHttpsStrMatch);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckTypeTcp);
        }
        if ([value caseInsensitiveCompare:@"CALCULATED"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckTypeCalculated);
        }
        if ([value caseInsensitiveCompare:@"CLOUDWATCH_METRIC"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckTypeCloudwatchMetric);
        }
        return @(AWSRoute53HealthCheckTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53HealthCheckTypeHttp:
                return @"HTTP";
            case AWSRoute53HealthCheckTypeHttps:
                return @"HTTPS";
            case AWSRoute53HealthCheckTypeHttpStrMatch:
                return @"HTTP_STR_MATCH";
            case AWSRoute53HealthCheckTypeHttpsStrMatch:
                return @"HTTPS_STR_MATCH";
            case AWSRoute53HealthCheckTypeTcp:
                return @"TCP";
            case AWSRoute53HealthCheckTypeCalculated:
                return @"CALCULATED";
            case AWSRoute53HealthCheckTypeCloudwatchMetric:
                return @"CLOUDWATCH_METRIC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53HealthCheckObservation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IPAddress" : @"IPAddress",
             @"region" : @"Region",
             @"statusReport" : @"StatusReport",
             };
}

+ (NSValueTransformer *)regionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckRegionUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckRegionUsWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckRegionUsWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckRegionEuWest1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckRegionApSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckRegionApSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckRegionApNortheast1);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSRoute53HealthCheckRegionSaEast1);
        }
        return @(AWSRoute53HealthCheckRegionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53HealthCheckRegionUsEast1:
                return @"us-east-1";
            case AWSRoute53HealthCheckRegionUsWest1:
                return @"us-west-1";
            case AWSRoute53HealthCheckRegionUsWest2:
                return @"us-west-2";
            case AWSRoute53HealthCheckRegionEuWest1:
                return @"eu-west-1";
            case AWSRoute53HealthCheckRegionApSoutheast1:
                return @"ap-southeast-1";
            case AWSRoute53HealthCheckRegionApSoutheast2:
                return @"ap-southeast-2";
            case AWSRoute53HealthCheckRegionApNortheast1:
                return @"ap-northeast-1";
            case AWSRoute53HealthCheckRegionSaEast1:
                return @"sa-east-1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusReportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53StatusReport class]];
}

@end

@implementation AWSRoute53HostedZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"config" : @"Config",
             @"identifier" : @"Id",
             @"linkedService" : @"LinkedService",
             @"name" : @"Name",
             @"resourceRecordSetCount" : @"ResourceRecordSetCount",
             };
}

+ (NSValueTransformer *)configJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53HostedZoneConfig class]];
}

+ (NSValueTransformer *)linkedServiceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53LinkedService class]];
}

@end

@implementation AWSRoute53HostedZoneConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"privateZone" : @"PrivateZone",
             };
}

@end

@implementation AWSRoute53HostedZoneLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_RRSETS_BY_ZONE"] == NSOrderedSame) {
            return @(AWSRoute53HostedZoneLimitTypeMaxRrsetsByZone);
        }
        if ([value caseInsensitiveCompare:@"MAX_VPCS_ASSOCIATED_BY_ZONE"] == NSOrderedSame) {
            return @(AWSRoute53HostedZoneLimitTypeMaxVpcsAssociatedByZone);
        }
        return @(AWSRoute53HostedZoneLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53HostedZoneLimitTypeMaxRrsetsByZone:
                return @"MAX_RRSETS_BY_ZONE";
            case AWSRoute53HostedZoneLimitTypeMaxVpcsAssociatedByZone:
                return @"MAX_VPCS_ASSOCIATED_BY_ZONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53LinkedService

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"servicePrincipal" : @"ServicePrincipal",
             };
}

@end

@implementation AWSRoute53ListGeoLocationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxItems" : @"MaxItems",
             @"startContinentCode" : @"StartContinentCode",
             @"startCountryCode" : @"StartCountryCode",
             @"startSubdivisionCode" : @"StartSubdivisionCode",
             };
}

@end

@implementation AWSRoute53ListGeoLocationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoLocationDetailsList" : @"GeoLocationDetailsList",
             @"isTruncated" : @"IsTruncated",
             @"maxItems" : @"MaxItems",
             @"nextContinentCode" : @"NextContinentCode",
             @"nextCountryCode" : @"NextCountryCode",
             @"nextSubdivisionCode" : @"NextSubdivisionCode",
             };
}

+ (NSValueTransformer *)geoLocationDetailsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53GeoLocationDetails class]];
}

@end

@implementation AWSRoute53ListHealthChecksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSRoute53ListHealthChecksResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthChecks" : @"HealthChecks",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)healthChecksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53HealthCheck class]];
}

@end

@implementation AWSRoute53ListHostedZonesByNameRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DNSName" : @"DNSName",
             @"hostedZoneId" : @"HostedZoneId",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSRoute53ListHostedZonesByNameResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DNSName" : @"DNSName",
             @"hostedZoneId" : @"HostedZoneId",
             @"hostedZones" : @"HostedZones",
             @"isTruncated" : @"IsTruncated",
             @"maxItems" : @"MaxItems",
             @"nextDNSName" : @"NextDNSName",
             @"nextHostedZoneId" : @"NextHostedZoneId",
             };
}

+ (NSValueTransformer *)hostedZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53HostedZone class]];
}

@end

@implementation AWSRoute53ListHostedZonesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationSetId" : @"DelegationSetId",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSRoute53ListHostedZonesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZones" : @"HostedZones",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)hostedZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53HostedZone class]];
}

@end

@implementation AWSRoute53ListQueryLoggingConfigsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRoute53ListQueryLoggingConfigsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"queryLoggingConfigs" : @"QueryLoggingConfigs",
             };
}

+ (NSValueTransformer *)queryLoggingConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53QueryLoggingConfig class]];
}

@end

@implementation AWSRoute53ListResourceRecordSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"maxItems" : @"MaxItems",
             @"startRecordIdentifier" : @"StartRecordIdentifier",
             @"startRecordName" : @"StartRecordName",
             @"startRecordType" : @"StartRecordType",
             };
}

+ (NSValueTransformer *)startRecordTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53ListResourceRecordSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"maxItems" : @"MaxItems",
             @"nextRecordIdentifier" : @"NextRecordIdentifier",
             @"nextRecordName" : @"NextRecordName",
             @"nextRecordType" : @"NextRecordType",
             @"resourceRecordSets" : @"ResourceRecordSets",
             };
}

+ (NSValueTransformer *)nextRecordTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceRecordSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53ResourceRecordSet class]];
}

@end

@implementation AWSRoute53ListReusableDelegationSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSRoute53ListReusableDelegationSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationSets" : @"DelegationSets",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)delegationSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53DelegationSet class]];
}

@end

@implementation AWSRoute53ListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"healthcheck"] == NSOrderedSame) {
            return @(AWSRoute53TagResourceTypeHealthcheck);
        }
        if ([value caseInsensitiveCompare:@"hostedzone"] == NSOrderedSame) {
            return @(AWSRoute53TagResourceTypeHostedzone);
        }
        return @(AWSRoute53TagResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53TagResourceTypeHealthcheck:
                return @"healthcheck";
            case AWSRoute53TagResourceTypeHostedzone:
                return @"hostedzone";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53ListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceTagSet" : @"ResourceTagSet",
             };
}

+ (NSValueTransformer *)resourceTagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53ResourceTagSet class]];
}

@end

@implementation AWSRoute53ListTagsForResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceIds" : @"ResourceIds",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"healthcheck"] == NSOrderedSame) {
            return @(AWSRoute53TagResourceTypeHealthcheck);
        }
        if ([value caseInsensitiveCompare:@"hostedzone"] == NSOrderedSame) {
            return @(AWSRoute53TagResourceTypeHostedzone);
        }
        return @(AWSRoute53TagResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53TagResourceTypeHealthcheck:
                return @"healthcheck";
            case AWSRoute53TagResourceTypeHostedzone:
                return @"hostedzone";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53ListTagsForResourcesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceTagSets" : @"ResourceTagSets",
             };
}

+ (NSValueTransformer *)resourceTagSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53ResourceTagSet class]];
}

@end

@implementation AWSRoute53ListTrafficPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxItems" : @"MaxItems",
             @"trafficPolicyIdMarker" : @"TrafficPolicyIdMarker",
             };
}

@end

@implementation AWSRoute53ListTrafficPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"maxItems" : @"MaxItems",
             @"trafficPolicyIdMarker" : @"TrafficPolicyIdMarker",
             @"trafficPolicySummaries" : @"TrafficPolicySummaries",
             };
}

+ (NSValueTransformer *)trafficPolicySummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53TrafficPolicySummary class]];
}

@end

@implementation AWSRoute53ListTrafficPolicyInstancesByHostedZoneRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"maxItems" : @"MaxItems",
             @"trafficPolicyInstanceNameMarker" : @"TrafficPolicyInstanceNameMarker",
             @"trafficPolicyInstanceTypeMarker" : @"TrafficPolicyInstanceTypeMarker",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceTypeMarkerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53ListTrafficPolicyInstancesByHostedZoneResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"maxItems" : @"MaxItems",
             @"trafficPolicyInstanceNameMarker" : @"TrafficPolicyInstanceNameMarker",
             @"trafficPolicyInstanceTypeMarker" : @"TrafficPolicyInstanceTypeMarker",
             @"trafficPolicyInstances" : @"TrafficPolicyInstances",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceTypeMarkerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trafficPolicyInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53TrafficPolicyInstance class]];
}

@end

@implementation AWSRoute53ListTrafficPolicyInstancesByPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneIdMarker" : @"HostedZoneIdMarker",
             @"maxItems" : @"MaxItems",
             @"trafficPolicyId" : @"TrafficPolicyId",
             @"trafficPolicyInstanceNameMarker" : @"TrafficPolicyInstanceNameMarker",
             @"trafficPolicyInstanceTypeMarker" : @"TrafficPolicyInstanceTypeMarker",
             @"trafficPolicyVersion" : @"TrafficPolicyVersion",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceTypeMarkerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53ListTrafficPolicyInstancesByPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneIdMarker" : @"HostedZoneIdMarker",
             @"isTruncated" : @"IsTruncated",
             @"maxItems" : @"MaxItems",
             @"trafficPolicyInstanceNameMarker" : @"TrafficPolicyInstanceNameMarker",
             @"trafficPolicyInstanceTypeMarker" : @"TrafficPolicyInstanceTypeMarker",
             @"trafficPolicyInstances" : @"TrafficPolicyInstances",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceTypeMarkerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trafficPolicyInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53TrafficPolicyInstance class]];
}

@end

@implementation AWSRoute53ListTrafficPolicyInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneIdMarker" : @"HostedZoneIdMarker",
             @"maxItems" : @"MaxItems",
             @"trafficPolicyInstanceNameMarker" : @"TrafficPolicyInstanceNameMarker",
             @"trafficPolicyInstanceTypeMarker" : @"TrafficPolicyInstanceTypeMarker",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceTypeMarkerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53ListTrafficPolicyInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneIdMarker" : @"HostedZoneIdMarker",
             @"isTruncated" : @"IsTruncated",
             @"maxItems" : @"MaxItems",
             @"trafficPolicyInstanceNameMarker" : @"TrafficPolicyInstanceNameMarker",
             @"trafficPolicyInstanceTypeMarker" : @"TrafficPolicyInstanceTypeMarker",
             @"trafficPolicyInstances" : @"TrafficPolicyInstances",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceTypeMarkerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trafficPolicyInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53TrafficPolicyInstance class]];
}

@end

@implementation AWSRoute53ListTrafficPolicyVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"maxItems" : @"MaxItems",
             @"trafficPolicyVersionMarker" : @"TrafficPolicyVersionMarker",
             };
}

@end

@implementation AWSRoute53ListTrafficPolicyVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"maxItems" : @"MaxItems",
             @"trafficPolicies" : @"TrafficPolicies",
             @"trafficPolicyVersionMarker" : @"TrafficPolicyVersionMarker",
             };
}

+ (NSValueTransformer *)trafficPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53TrafficPolicy class]];
}

@end

@implementation AWSRoute53ListVPCAssociationAuthorizationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRoute53ListVPCAssociationAuthorizationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"nextToken" : @"NextToken",
             @"VPCs" : @"VPCs",
             };
}

+ (NSValueTransformer *)VPCsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53VPC class]];
}

@end

@implementation AWSRoute53QueryLoggingConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogsLogGroupArn" : @"CloudWatchLogsLogGroupArn",
             @"hostedZoneId" : @"HostedZoneId",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53ResourceRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"value" : @"Value",
             };
}

@end

@implementation AWSRoute53ResourceRecordSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasTarget" : @"AliasTarget",
             @"failover" : @"Failover",
             @"geoLocation" : @"GeoLocation",
             @"healthCheckId" : @"HealthCheckId",
             @"multiValueAnswer" : @"MultiValueAnswer",
             @"name" : @"Name",
             @"region" : @"Region",
             @"resourceRecords" : @"ResourceRecords",
             @"setIdentifier" : @"SetIdentifier",
             @"TTL" : @"TTL",
             @"trafficPolicyInstanceId" : @"TrafficPolicyInstanceId",
             @"types" : @"Type",
             @"weight" : @"Weight",
             };
}

+ (NSValueTransformer *)aliasTargetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53AliasTarget class]];
}

+ (NSValueTransformer *)failoverJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRIMARY"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetFailoverPrimary);
        }
        if ([value caseInsensitiveCompare:@"SECONDARY"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetFailoverSecondary);
        }
        return @(AWSRoute53ResourceRecordSetFailoverUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53ResourceRecordSetFailoverPrimary:
                return @"PRIMARY";
            case AWSRoute53ResourceRecordSetFailoverSecondary:
                return @"SECONDARY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)geoLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53GeoLocation class]];
}

+ (NSValueTransformer *)regionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionUsEast2);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionUsWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionUsWest2);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionCaCentral1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionEuWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionEuWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionEuWest3);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionEuCentral1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionApSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionApSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionApNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionApNortheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-3"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionApNortheast3);
        }
        if ([value caseInsensitiveCompare:@"eu-north-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionEuNorth1);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionSaEast1);
        }
        if ([value caseInsensitiveCompare:@"cn-north-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionCnNorth1);
        }
        if ([value caseInsensitiveCompare:@"cn-northwest-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionCnNorthwest1);
        }
        if ([value caseInsensitiveCompare:@"ap-east-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionApEast1);
        }
        if ([value caseInsensitiveCompare:@"me-south-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionMeSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionApSouth1);
        }
        if ([value caseInsensitiveCompare:@"af-south-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionAfSouth1);
        }
        if ([value caseInsensitiveCompare:@"eu-south-1"] == NSOrderedSame) {
            return @(AWSRoute53ResourceRecordSetRegionEuSouth1);
        }
        return @(AWSRoute53ResourceRecordSetRegionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53ResourceRecordSetRegionUsEast1:
                return @"us-east-1";
            case AWSRoute53ResourceRecordSetRegionUsEast2:
                return @"us-east-2";
            case AWSRoute53ResourceRecordSetRegionUsWest1:
                return @"us-west-1";
            case AWSRoute53ResourceRecordSetRegionUsWest2:
                return @"us-west-2";
            case AWSRoute53ResourceRecordSetRegionCaCentral1:
                return @"ca-central-1";
            case AWSRoute53ResourceRecordSetRegionEuWest1:
                return @"eu-west-1";
            case AWSRoute53ResourceRecordSetRegionEuWest2:
                return @"eu-west-2";
            case AWSRoute53ResourceRecordSetRegionEuWest3:
                return @"eu-west-3";
            case AWSRoute53ResourceRecordSetRegionEuCentral1:
                return @"eu-central-1";
            case AWSRoute53ResourceRecordSetRegionApSoutheast1:
                return @"ap-southeast-1";
            case AWSRoute53ResourceRecordSetRegionApSoutheast2:
                return @"ap-southeast-2";
            case AWSRoute53ResourceRecordSetRegionApNortheast1:
                return @"ap-northeast-1";
            case AWSRoute53ResourceRecordSetRegionApNortheast2:
                return @"ap-northeast-2";
            case AWSRoute53ResourceRecordSetRegionApNortheast3:
                return @"ap-northeast-3";
            case AWSRoute53ResourceRecordSetRegionEuNorth1:
                return @"eu-north-1";
            case AWSRoute53ResourceRecordSetRegionSaEast1:
                return @"sa-east-1";
            case AWSRoute53ResourceRecordSetRegionCnNorth1:
                return @"cn-north-1";
            case AWSRoute53ResourceRecordSetRegionCnNorthwest1:
                return @"cn-northwest-1";
            case AWSRoute53ResourceRecordSetRegionApEast1:
                return @"ap-east-1";
            case AWSRoute53ResourceRecordSetRegionMeSouth1:
                return @"me-south-1";
            case AWSRoute53ResourceRecordSetRegionApSouth1:
                return @"ap-south-1";
            case AWSRoute53ResourceRecordSetRegionAfSouth1:
                return @"af-south-1";
            case AWSRoute53ResourceRecordSetRegionEuSouth1:
                return @"eu-south-1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53ResourceRecord class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53ResourceTagSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"healthcheck"] == NSOrderedSame) {
            return @(AWSRoute53TagResourceTypeHealthcheck);
        }
        if ([value caseInsensitiveCompare:@"hostedzone"] == NSOrderedSame) {
            return @(AWSRoute53TagResourceTypeHostedzone);
        }
        return @(AWSRoute53TagResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53TagResourceTypeHealthcheck:
                return @"healthcheck";
            case AWSRoute53TagResourceTypeHostedzone:
                return @"hostedzone";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRoute53Tag class]];
}

@end

@implementation AWSRoute53ReusableDelegationSetLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_ZONES_BY_REUSABLE_DELEGATION_SET"] == NSOrderedSame) {
            return @(AWSRoute53ReusableDelegationSetLimitTypeMaxZonesByReusableDelegationSet);
        }
        return @(AWSRoute53ReusableDelegationSetLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53ReusableDelegationSetLimitTypeMaxZonesByReusableDelegationSet:
                return @"MAX_ZONES_BY_REUSABLE_DELEGATION_SET";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53StatusReport

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkedTime" : @"CheckedTime",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)checkedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSRoute53Tag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRoute53TestDNSAnswerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EDNS0ClientSubnetIP" : @"EDNS0ClientSubnetIP",
             @"EDNS0ClientSubnetMask" : @"EDNS0ClientSubnetMask",
             @"hostedZoneId" : @"HostedZoneId",
             @"recordName" : @"RecordName",
             @"recordType" : @"RecordType",
             @"resolverIP" : @"ResolverIP",
             };
}

+ (NSValueTransformer *)recordTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53TestDNSAnswerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nameserver" : @"Nameserver",
             @"protocols" : @"Protocol",
             @"recordData" : @"RecordData",
             @"recordName" : @"RecordName",
             @"recordType" : @"RecordType",
             @"responseCode" : @"ResponseCode",
             };
}

+ (NSValueTransformer *)recordTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53TrafficPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"document" : @"Document",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"types" : @"Type",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53TrafficPolicyInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"identifier" : @"Id",
             @"message" : @"Message",
             @"name" : @"Name",
             @"state" : @"State",
             @"TTL" : @"TTL",
             @"trafficPolicyId" : @"TrafficPolicyId",
             @"trafficPolicyType" : @"TrafficPolicyType",
             @"trafficPolicyVersion" : @"TrafficPolicyVersion",
             };
}

+ (NSValueTransformer *)trafficPolicyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53TrafficPolicySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"latestVersion" : @"LatestVersion",
             @"name" : @"Name",
             @"trafficPolicyCount" : @"TrafficPolicyCount",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSRoute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSRoute53RRTypeCaa);
        }
        return @(AWSRoute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53RRTypeSoa:
                return @"SOA";
            case AWSRoute53RRTypeA:
                return @"A";
            case AWSRoute53RRTypeTxt:
                return @"TXT";
            case AWSRoute53RRTypeNs:
                return @"NS";
            case AWSRoute53RRTypeCname:
                return @"CNAME";
            case AWSRoute53RRTypeMx:
                return @"MX";
            case AWSRoute53RRTypeNaptr:
                return @"NAPTR";
            case AWSRoute53RRTypePtr:
                return @"PTR";
            case AWSRoute53RRTypeSrv:
                return @"SRV";
            case AWSRoute53RRTypeSpf:
                return @"SPF";
            case AWSRoute53RRTypeAaaa:
                return @"AAAA";
            case AWSRoute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53UpdateHealthCheckRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmIdentifier" : @"AlarmIdentifier",
             @"childHealthChecks" : @"ChildHealthChecks",
             @"disabled" : @"Disabled",
             @"enableSNI" : @"EnableSNI",
             @"failureThreshold" : @"FailureThreshold",
             @"fullyQualifiedDomainName" : @"FullyQualifiedDomainName",
             @"healthCheckId" : @"HealthCheckId",
             @"healthCheckVersion" : @"HealthCheckVersion",
             @"healthThreshold" : @"HealthThreshold",
             @"IPAddress" : @"IPAddress",
             @"insufficientDataHealthStatus" : @"InsufficientDataHealthStatus",
             @"inverted" : @"Inverted",
             @"port" : @"Port",
             @"regions" : @"Regions",
             @"resetElements" : @"ResetElements",
             @"resourcePath" : @"ResourcePath",
             @"searchString" : @"SearchString",
             };
}

+ (NSValueTransformer *)alarmIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53AlarmIdentifier class]];
}

+ (NSValueTransformer *)insufficientDataHealthStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Healthy"] == NSOrderedSame) {
            return @(AWSRoute53InsufficientDataHealthStatusHealthy);
        }
        if ([value caseInsensitiveCompare:@"Unhealthy"] == NSOrderedSame) {
            return @(AWSRoute53InsufficientDataHealthStatusUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"LastKnownStatus"] == NSOrderedSame) {
            return @(AWSRoute53InsufficientDataHealthStatusLastKnownStatus);
        }
        return @(AWSRoute53InsufficientDataHealthStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53InsufficientDataHealthStatusHealthy:
                return @"Healthy";
            case AWSRoute53InsufficientDataHealthStatusUnhealthy:
                return @"Unhealthy";
            case AWSRoute53InsufficientDataHealthStatusLastKnownStatus:
                return @"LastKnownStatus";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRoute53UpdateHealthCheckResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheck" : @"HealthCheck",
             };
}

+ (NSValueTransformer *)healthCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53HealthCheck class]];
}

@end

@implementation AWSRoute53UpdateHostedZoneCommentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRoute53UpdateHostedZoneCommentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZone" : @"HostedZone",
             };
}

+ (NSValueTransformer *)hostedZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53HostedZone class]];
}

@end

@implementation AWSRoute53UpdateTrafficPolicyCommentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"identifier" : @"Id",
             @"version" : @"Version",
             };
}

@end

@implementation AWSRoute53UpdateTrafficPolicyCommentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficPolicy" : @"TrafficPolicy",
             };
}

+ (NSValueTransformer *)trafficPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53TrafficPolicy class]];
}

@end

@implementation AWSRoute53UpdateTrafficPolicyInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"TTL" : @"TTL",
             @"trafficPolicyId" : @"TrafficPolicyId",
             @"trafficPolicyVersion" : @"TrafficPolicyVersion",
             };
}

@end

@implementation AWSRoute53UpdateTrafficPolicyInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficPolicyInstance" : @"TrafficPolicyInstance",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRoute53TrafficPolicyInstance class]];
}

@end

@implementation AWSRoute53VPC

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"VPCId" : @"VPCId",
             @"VPCRegion" : @"VPCRegion",
             };
}

+ (NSValueTransformer *)VPCRegionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionUsEast2);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionUsWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionUsWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionEuWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionEuWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionEuWest3);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionEuCentral1);
        }
        if ([value caseInsensitiveCompare:@"ap-east-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionApEast1);
        }
        if ([value caseInsensitiveCompare:@"me-south-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionMeSouth1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-west-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionUsGovWest1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-east-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionUsGovEast1);
        }
        if ([value caseInsensitiveCompare:@"us-iso-east-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionUsIsoEast1);
        }
        if ([value caseInsensitiveCompare:@"us-isob-east-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionUsIsobEast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionApSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionApSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionApSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionApNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionApNortheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-3"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionApNortheast3);
        }
        if ([value caseInsensitiveCompare:@"eu-north-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionEuNorth1);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionSaEast1);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionCaCentral1);
        }
        if ([value caseInsensitiveCompare:@"cn-north-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionCnNorth1);
        }
        if ([value caseInsensitiveCompare:@"af-south-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionAfSouth1);
        }
        if ([value caseInsensitiveCompare:@"eu-south-1"] == NSOrderedSame) {
            return @(AWSRoute53VPCRegionEuSouth1);
        }
        return @(AWSRoute53VPCRegionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRoute53VPCRegionUsEast1:
                return @"us-east-1";
            case AWSRoute53VPCRegionUsEast2:
                return @"us-east-2";
            case AWSRoute53VPCRegionUsWest1:
                return @"us-west-1";
            case AWSRoute53VPCRegionUsWest2:
                return @"us-west-2";
            case AWSRoute53VPCRegionEuWest1:
                return @"eu-west-1";
            case AWSRoute53VPCRegionEuWest2:
                return @"eu-west-2";
            case AWSRoute53VPCRegionEuWest3:
                return @"eu-west-3";
            case AWSRoute53VPCRegionEuCentral1:
                return @"eu-central-1";
            case AWSRoute53VPCRegionApEast1:
                return @"ap-east-1";
            case AWSRoute53VPCRegionMeSouth1:
                return @"me-south-1";
            case AWSRoute53VPCRegionUsGovWest1:
                return @"us-gov-west-1";
            case AWSRoute53VPCRegionUsGovEast1:
                return @"us-gov-east-1";
            case AWSRoute53VPCRegionUsIsoEast1:
                return @"us-iso-east-1";
            case AWSRoute53VPCRegionUsIsobEast1:
                return @"us-isob-east-1";
            case AWSRoute53VPCRegionApSoutheast1:
                return @"ap-southeast-1";
            case AWSRoute53VPCRegionApSoutheast2:
                return @"ap-southeast-2";
            case AWSRoute53VPCRegionApSouth1:
                return @"ap-south-1";
            case AWSRoute53VPCRegionApNortheast1:
                return @"ap-northeast-1";
            case AWSRoute53VPCRegionApNortheast2:
                return @"ap-northeast-2";
            case AWSRoute53VPCRegionApNortheast3:
                return @"ap-northeast-3";
            case AWSRoute53VPCRegionEuNorth1:
                return @"eu-north-1";
            case AWSRoute53VPCRegionSaEast1:
                return @"sa-east-1";
            case AWSRoute53VPCRegionCaCentral1:
                return @"ca-central-1";
            case AWSRoute53VPCRegionCnNorth1:
                return @"cn-north-1";
            case AWSRoute53VPCRegionAfSouth1:
                return @"af-south-1";
            case AWSRoute53VPCRegionEuSouth1:
                return @"eu-south-1";
            default:
                return nil;
        }
    }];
}

@end
