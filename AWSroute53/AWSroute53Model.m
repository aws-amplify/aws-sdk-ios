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

#import "AWSroute53Model.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSroute53ErrorDomain = @"com.amazonaws.AWSroute53ErrorDomain";

@implementation AWSroute53AccountLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_HEALTH_CHECKS_BY_OWNER"] == NSOrderedSame) {
            return @(AWSroute53AccountLimitTypeMaxHealthChecksByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_HOSTED_ZONES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSroute53AccountLimitTypeMaxHostedZonesByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSroute53AccountLimitTypeMaxTrafficPolicyInstancesByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_REUSABLE_DELEGATION_SETS_BY_OWNER"] == NSOrderedSame) {
            return @(AWSroute53AccountLimitTypeMaxReusableDelegationSetsByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_TRAFFIC_POLICIES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSroute53AccountLimitTypeMaxTrafficPoliciesByOwner);
        }
        return @(AWSroute53AccountLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53AccountLimitTypeMaxHealthChecksByOwner:
                return @"MAX_HEALTH_CHECKS_BY_OWNER";
            case AWSroute53AccountLimitTypeMaxHostedZonesByOwner:
                return @"MAX_HOSTED_ZONES_BY_OWNER";
            case AWSroute53AccountLimitTypeMaxTrafficPolicyInstancesByOwner:
                return @"MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER";
            case AWSroute53AccountLimitTypeMaxReusableDelegationSetsByOwner:
                return @"MAX_REUSABLE_DELEGATION_SETS_BY_OWNER";
            case AWSroute53AccountLimitTypeMaxTrafficPoliciesByOwner:
                return @"MAX_TRAFFIC_POLICIES_BY_OWNER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53AlarmIdentifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"region" : @"Region",
             };
}

+ (NSValueTransformer *)regionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionUsEast2);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionUsWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionUsWest2);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionCaCentral1);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionEuCentral1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionEuWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionEuWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionEuWest3);
        }
        if ([value caseInsensitiveCompare:@"ap-east-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionApEast1);
        }
        if ([value caseInsensitiveCompare:@"me-south-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionMeSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionApSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionApSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionApSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionApNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionApNortheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-3"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionApNortheast3);
        }
        if ([value caseInsensitiveCompare:@"eu-north-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionEuNorth1);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionSaEast1);
        }
        if ([value caseInsensitiveCompare:@"cn-northwest-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionCnNorthwest1);
        }
        if ([value caseInsensitiveCompare:@"cn-north-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionCnNorth1);
        }
        if ([value caseInsensitiveCompare:@"af-south-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionAfSouth1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-west-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionUsGovWest1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-east-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionUsGovEast1);
        }
        if ([value caseInsensitiveCompare:@"us-iso-east-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionUsIsoEast1);
        }
        if ([value caseInsensitiveCompare:@"us-isob-east-1"] == NSOrderedSame) {
            return @(AWSroute53CloudWatchRegionUsIsobEast1);
        }
        return @(AWSroute53CloudWatchRegionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53CloudWatchRegionUsEast1:
                return @"us-east-1";
            case AWSroute53CloudWatchRegionUsEast2:
                return @"us-east-2";
            case AWSroute53CloudWatchRegionUsWest1:
                return @"us-west-1";
            case AWSroute53CloudWatchRegionUsWest2:
                return @"us-west-2";
            case AWSroute53CloudWatchRegionCaCentral1:
                return @"ca-central-1";
            case AWSroute53CloudWatchRegionEuCentral1:
                return @"eu-central-1";
            case AWSroute53CloudWatchRegionEuWest1:
                return @"eu-west-1";
            case AWSroute53CloudWatchRegionEuWest2:
                return @"eu-west-2";
            case AWSroute53CloudWatchRegionEuWest3:
                return @"eu-west-3";
            case AWSroute53CloudWatchRegionApEast1:
                return @"ap-east-1";
            case AWSroute53CloudWatchRegionMeSouth1:
                return @"me-south-1";
            case AWSroute53CloudWatchRegionApSouth1:
                return @"ap-south-1";
            case AWSroute53CloudWatchRegionApSoutheast1:
                return @"ap-southeast-1";
            case AWSroute53CloudWatchRegionApSoutheast2:
                return @"ap-southeast-2";
            case AWSroute53CloudWatchRegionApNortheast1:
                return @"ap-northeast-1";
            case AWSroute53CloudWatchRegionApNortheast2:
                return @"ap-northeast-2";
            case AWSroute53CloudWatchRegionApNortheast3:
                return @"ap-northeast-3";
            case AWSroute53CloudWatchRegionEuNorth1:
                return @"eu-north-1";
            case AWSroute53CloudWatchRegionSaEast1:
                return @"sa-east-1";
            case AWSroute53CloudWatchRegionCnNorthwest1:
                return @"cn-northwest-1";
            case AWSroute53CloudWatchRegionCnNorth1:
                return @"cn-north-1";
            case AWSroute53CloudWatchRegionAfSouth1:
                return @"af-south-1";
            case AWSroute53CloudWatchRegionUsGovWest1:
                return @"us-gov-west-1";
            case AWSroute53CloudWatchRegionUsGovEast1:
                return @"us-gov-east-1";
            case AWSroute53CloudWatchRegionUsIsoEast1:
                return @"us-iso-east-1";
            case AWSroute53CloudWatchRegionUsIsobEast1:
                return @"us-isob-east-1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53AliasTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DNSName" : @"DNSName",
             @"evaluateTargetHealth" : @"EvaluateTargetHealth",
             @"hostedZoneId" : @"HostedZoneId",
             };
}

@end

@implementation AWSroute53AssociateVPCWithHostedZoneRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"hostedZoneId" : @"HostedZoneId",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53VPC class]];
}

@end

@implementation AWSroute53AssociateVPCWithHostedZoneResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeInfo" : @"ChangeInfo",
             };
}

+ (NSValueTransformer *)changeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53ChangeInfo class]];
}

@end

@implementation AWSroute53Change

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"resourceRecordSet" : @"ResourceRecordSet",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE"] == NSOrderedSame) {
            return @(AWSroute53ChangeActionCreate);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSroute53ChangeActionDelete);
        }
        if ([value caseInsensitiveCompare:@"UPSERT"] == NSOrderedSame) {
            return @(AWSroute53ChangeActionUpsert);
        }
        return @(AWSroute53ChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53ChangeActionCreate:
                return @"CREATE";
            case AWSroute53ChangeActionDelete:
                return @"DELETE";
            case AWSroute53ChangeActionUpsert:
                return @"UPSERT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceRecordSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53ResourceRecordSet class]];
}

@end

@implementation AWSroute53ChangeBatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changes" : @"Changes",
             @"comment" : @"Comment",
             };
}

+ (NSValueTransformer *)changesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53Change class]];
}

@end

@implementation AWSroute53ChangeInfo

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
            return @(AWSroute53ChangeStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INSYNC"] == NSOrderedSame) {
            return @(AWSroute53ChangeStatusInsync);
        }
        return @(AWSroute53ChangeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53ChangeStatusPending:
                return @"PENDING";
            case AWSroute53ChangeStatusInsync:
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

@implementation AWSroute53ChangeResourceRecordSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeBatch" : @"ChangeBatch",
             @"hostedZoneId" : @"HostedZoneId",
             };
}

+ (NSValueTransformer *)changeBatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53ChangeBatch class]];
}

@end

@implementation AWSroute53ChangeResourceRecordSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeInfo" : @"ChangeInfo",
             };
}

+ (NSValueTransformer *)changeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53ChangeInfo class]];
}

@end

@implementation AWSroute53ChangeTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addTags" : @"AddTags",
             @"removeTagKeys" : @"RemoveTagKeys",
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)addTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53Tag class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"healthcheck"] == NSOrderedSame) {
            return @(AWSroute53TagResourceTypeHealthcheck);
        }
        if ([value caseInsensitiveCompare:@"hostedzone"] == NSOrderedSame) {
            return @(AWSroute53TagResourceTypeHostedzone);
        }
        return @(AWSroute53TagResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53TagResourceTypeHealthcheck:
                return @"healthcheck";
            case AWSroute53TagResourceTypeHostedzone:
                return @"hostedzone";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53ChangeTagsForResourceResponse

@end

@implementation AWSroute53CloudWatchAlarmConfiguration

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
            return @(AWSroute53ComparisonOperatorGreaterThanOrEqualToThreshold);
        }
        if ([value caseInsensitiveCompare:@"GreaterThanThreshold"] == NSOrderedSame) {
            return @(AWSroute53ComparisonOperatorGreaterThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanThreshold"] == NSOrderedSame) {
            return @(AWSroute53ComparisonOperatorLessThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanOrEqualToThreshold"] == NSOrderedSame) {
            return @(AWSroute53ComparisonOperatorLessThanOrEqualToThreshold);
        }
        return @(AWSroute53ComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53ComparisonOperatorGreaterThanOrEqualToThreshold:
                return @"GreaterThanOrEqualToThreshold";
            case AWSroute53ComparisonOperatorGreaterThanThreshold:
                return @"GreaterThanThreshold";
            case AWSroute53ComparisonOperatorLessThanThreshold:
                return @"LessThanThreshold";
            case AWSroute53ComparisonOperatorLessThanOrEqualToThreshold:
                return @"LessThanOrEqualToThreshold";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53Dimension class]];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSroute53StatisticAverage);
        }
        if ([value caseInsensitiveCompare:@"Sum"] == NSOrderedSame) {
            return @(AWSroute53StatisticSum);
        }
        if ([value caseInsensitiveCompare:@"SampleCount"] == NSOrderedSame) {
            return @(AWSroute53StatisticSampleCount);
        }
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
            return @(AWSroute53StatisticMaximum);
        }
        if ([value caseInsensitiveCompare:@"Minimum"] == NSOrderedSame) {
            return @(AWSroute53StatisticMinimum);
        }
        return @(AWSroute53StatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53StatisticAverage:
                return @"Average";
            case AWSroute53StatisticSum:
                return @"Sum";
            case AWSroute53StatisticSampleCount:
                return @"SampleCount";
            case AWSroute53StatisticMaximum:
                return @"Maximum";
            case AWSroute53StatisticMinimum:
                return @"Minimum";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53CreateHealthCheckRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"healthCheckConfig" : @"HealthCheckConfig",
             };
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53HealthCheckConfig class]];
}

@end

@implementation AWSroute53CreateHealthCheckResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheck" : @"HealthCheck",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)healthCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53HealthCheck class]];
}

@end

@implementation AWSroute53CreateHostedZoneRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53HostedZoneConfig class]];
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53VPC class]];
}

@end

@implementation AWSroute53CreateHostedZoneResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53ChangeInfo class]];
}

+ (NSValueTransformer *)delegationSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53DelegationSet class]];
}

+ (NSValueTransformer *)hostedZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53HostedZone class]];
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53VPC class]];
}

@end

@implementation AWSroute53CreateQueryLoggingConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogsLogGroupArn" : @"CloudWatchLogsLogGroupArn",
             @"hostedZoneId" : @"HostedZoneId",
             };
}

@end

@implementation AWSroute53CreateQueryLoggingConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"queryLoggingConfig" : @"QueryLoggingConfig",
             };
}

+ (NSValueTransformer *)queryLoggingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53QueryLoggingConfig class]];
}

@end

@implementation AWSroute53CreateReusableDelegationSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"hostedZoneId" : @"HostedZoneId",
             };
}

@end

@implementation AWSroute53CreateReusableDelegationSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationSet" : @"DelegationSet",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)delegationSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53DelegationSet class]];
}

@end

@implementation AWSroute53CreateTrafficPolicyInstanceRequest

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

@implementation AWSroute53CreateTrafficPolicyInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"trafficPolicyInstance" : @"TrafficPolicyInstance",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53TrafficPolicyInstance class]];
}

@end

@implementation AWSroute53CreateTrafficPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"document" : @"Document",
             @"name" : @"Name",
             };
}

@end

@implementation AWSroute53CreateTrafficPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"trafficPolicy" : @"TrafficPolicy",
             };
}

+ (NSValueTransformer *)trafficPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53TrafficPolicy class]];
}

@end

@implementation AWSroute53CreateTrafficPolicyVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"document" : @"Document",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53CreateTrafficPolicyVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"trafficPolicy" : @"TrafficPolicy",
             };
}

+ (NSValueTransformer *)trafficPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53TrafficPolicy class]];
}

@end

@implementation AWSroute53CreateVPCAssociationAuthorizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53VPC class]];
}

@end

@implementation AWSroute53CreateVPCAssociationAuthorizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53VPC class]];
}

@end

@implementation AWSroute53DelegationSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"identifier" : @"Id",
             @"nameServers" : @"NameServers",
             };
}

@end

@implementation AWSroute53DeleteHealthCheckRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckId" : @"HealthCheckId",
             };
}

@end

@implementation AWSroute53DeleteHealthCheckResponse

@end

@implementation AWSroute53DeleteHostedZoneRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53DeleteHostedZoneResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeInfo" : @"ChangeInfo",
             };
}

+ (NSValueTransformer *)changeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53ChangeInfo class]];
}

@end

@implementation AWSroute53DeleteQueryLoggingConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53DeleteQueryLoggingConfigResponse

@end

@implementation AWSroute53DeleteReusableDelegationSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53DeleteReusableDelegationSetResponse

@end

@implementation AWSroute53DeleteTrafficPolicyInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53DeleteTrafficPolicyInstanceResponse

@end

@implementation AWSroute53DeleteTrafficPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"version" : @"Version",
             };
}

@end

@implementation AWSroute53DeleteTrafficPolicyResponse

@end

@implementation AWSroute53DeleteVPCAssociationAuthorizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53VPC class]];
}

@end

@implementation AWSroute53DeleteVPCAssociationAuthorizationResponse

@end

@implementation AWSroute53Dimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSroute53DisassociateVPCFromHostedZoneRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"hostedZoneId" : @"HostedZoneId",
             @"VPC" : @"VPC",
             };
}

+ (NSValueTransformer *)VPCJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53VPC class]];
}

@end

@implementation AWSroute53DisassociateVPCFromHostedZoneResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeInfo" : @"ChangeInfo",
             };
}

+ (NSValueTransformer *)changeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53ChangeInfo class]];
}

@end

@implementation AWSroute53GeoLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continentCode" : @"ContinentCode",
             @"countryCode" : @"CountryCode",
             @"subdivisionCode" : @"SubdivisionCode",
             };
}

@end

@implementation AWSroute53GeoLocationDetails

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

@implementation AWSroute53GetAccountLimitRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_HEALTH_CHECKS_BY_OWNER"] == NSOrderedSame) {
            return @(AWSroute53AccountLimitTypeMaxHealthChecksByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_HOSTED_ZONES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSroute53AccountLimitTypeMaxHostedZonesByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSroute53AccountLimitTypeMaxTrafficPolicyInstancesByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_REUSABLE_DELEGATION_SETS_BY_OWNER"] == NSOrderedSame) {
            return @(AWSroute53AccountLimitTypeMaxReusableDelegationSetsByOwner);
        }
        if ([value caseInsensitiveCompare:@"MAX_TRAFFIC_POLICIES_BY_OWNER"] == NSOrderedSame) {
            return @(AWSroute53AccountLimitTypeMaxTrafficPoliciesByOwner);
        }
        return @(AWSroute53AccountLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53AccountLimitTypeMaxHealthChecksByOwner:
                return @"MAX_HEALTH_CHECKS_BY_OWNER";
            case AWSroute53AccountLimitTypeMaxHostedZonesByOwner:
                return @"MAX_HOSTED_ZONES_BY_OWNER";
            case AWSroute53AccountLimitTypeMaxTrafficPolicyInstancesByOwner:
                return @"MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER";
            case AWSroute53AccountLimitTypeMaxReusableDelegationSetsByOwner:
                return @"MAX_REUSABLE_DELEGATION_SETS_BY_OWNER";
            case AWSroute53AccountLimitTypeMaxTrafficPoliciesByOwner:
                return @"MAX_TRAFFIC_POLICIES_BY_OWNER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53GetAccountLimitResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"limit" : @"Limit",
             };
}

+ (NSValueTransformer *)limitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53AccountLimit class]];
}

@end

@implementation AWSroute53GetChangeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53GetChangeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeInfo" : @"ChangeInfo",
             };
}

+ (NSValueTransformer *)changeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53ChangeInfo class]];
}

@end

@implementation AWSroute53GetCheckerIpRangesRequest

@end

@implementation AWSroute53GetCheckerIpRangesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkerIpRanges" : @"CheckerIpRanges",
             };
}

@end

@implementation AWSroute53GetGeoLocationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continentCode" : @"ContinentCode",
             @"countryCode" : @"CountryCode",
             @"subdivisionCode" : @"SubdivisionCode",
             };
}

@end

@implementation AWSroute53GetGeoLocationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoLocationDetails" : @"GeoLocationDetails",
             };
}

+ (NSValueTransformer *)geoLocationDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53GeoLocationDetails class]];
}

@end

@implementation AWSroute53GetHealthCheckCountRequest

@end

@implementation AWSroute53GetHealthCheckCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckCount" : @"HealthCheckCount",
             };
}

@end

@implementation AWSroute53GetHealthCheckLastFailureReasonRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckId" : @"HealthCheckId",
             };
}

@end

@implementation AWSroute53GetHealthCheckLastFailureReasonResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckObservations" : @"HealthCheckObservations",
             };
}

+ (NSValueTransformer *)healthCheckObservationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53HealthCheckObservation class]];
}

@end

@implementation AWSroute53GetHealthCheckRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckId" : @"HealthCheckId",
             };
}

@end

@implementation AWSroute53GetHealthCheckResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheck" : @"HealthCheck",
             };
}

+ (NSValueTransformer *)healthCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53HealthCheck class]];
}

@end

@implementation AWSroute53GetHealthCheckStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckId" : @"HealthCheckId",
             };
}

@end

@implementation AWSroute53GetHealthCheckStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckObservations" : @"HealthCheckObservations",
             };
}

+ (NSValueTransformer *)healthCheckObservationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53HealthCheckObservation class]];
}

@end

@implementation AWSroute53GetHostedZoneCountRequest

@end

@implementation AWSroute53GetHostedZoneCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneCount" : @"HostedZoneCount",
             };
}

@end

@implementation AWSroute53GetHostedZoneLimitRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_RRSETS_BY_ZONE"] == NSOrderedSame) {
            return @(AWSroute53HostedZoneLimitTypeMaxRrsetsByZone);
        }
        if ([value caseInsensitiveCompare:@"MAX_VPCS_ASSOCIATED_BY_ZONE"] == NSOrderedSame) {
            return @(AWSroute53HostedZoneLimitTypeMaxVpcsAssociatedByZone);
        }
        return @(AWSroute53HostedZoneLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53HostedZoneLimitTypeMaxRrsetsByZone:
                return @"MAX_RRSETS_BY_ZONE";
            case AWSroute53HostedZoneLimitTypeMaxVpcsAssociatedByZone:
                return @"MAX_VPCS_ASSOCIATED_BY_ZONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53GetHostedZoneLimitResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"limit" : @"Limit",
             };
}

+ (NSValueTransformer *)limitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53HostedZoneLimit class]];
}

@end

@implementation AWSroute53GetHostedZoneRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53GetHostedZoneResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationSet" : @"DelegationSet",
             @"hostedZone" : @"HostedZone",
             @"VPCs" : @"VPCs",
             };
}

+ (NSValueTransformer *)delegationSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53DelegationSet class]];
}

+ (NSValueTransformer *)hostedZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53HostedZone class]];
}

+ (NSValueTransformer *)VPCsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53VPC class]];
}

@end

@implementation AWSroute53GetQueryLoggingConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53GetQueryLoggingConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryLoggingConfig" : @"QueryLoggingConfig",
             };
}

+ (NSValueTransformer *)queryLoggingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53QueryLoggingConfig class]];
}

@end

@implementation AWSroute53GetReusableDelegationSetLimitRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationSetId" : @"DelegationSetId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_ZONES_BY_REUSABLE_DELEGATION_SET"] == NSOrderedSame) {
            return @(AWSroute53ReusableDelegationSetLimitTypeMaxZonesByReusableDelegationSet);
        }
        return @(AWSroute53ReusableDelegationSetLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53ReusableDelegationSetLimitTypeMaxZonesByReusableDelegationSet:
                return @"MAX_ZONES_BY_REUSABLE_DELEGATION_SET";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53GetReusableDelegationSetLimitResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"limit" : @"Limit",
             };
}

+ (NSValueTransformer *)limitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53ReusableDelegationSetLimit class]];
}

@end

@implementation AWSroute53GetReusableDelegationSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53GetReusableDelegationSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationSet" : @"DelegationSet",
             };
}

+ (NSValueTransformer *)delegationSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53DelegationSet class]];
}

@end

@implementation AWSroute53GetTrafficPolicyInstanceCountRequest

@end

@implementation AWSroute53GetTrafficPolicyInstanceCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficPolicyInstanceCount" : @"TrafficPolicyInstanceCount",
             };
}

@end

@implementation AWSroute53GetTrafficPolicyInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53GetTrafficPolicyInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficPolicyInstance" : @"TrafficPolicyInstance",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53TrafficPolicyInstance class]];
}

@end

@implementation AWSroute53GetTrafficPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"version" : @"Version",
             };
}

@end

@implementation AWSroute53GetTrafficPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficPolicy" : @"TrafficPolicy",
             };
}

+ (NSValueTransformer *)trafficPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53TrafficPolicy class]];
}

@end

@implementation AWSroute53HealthCheck

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53CloudWatchAlarmConfiguration class]];
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53HealthCheckConfig class]];
}

+ (NSValueTransformer *)linkedServiceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53LinkedService class]];
}

@end

@implementation AWSroute53HealthCheckConfig

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53AlarmIdentifier class]];
}

+ (NSValueTransformer *)insufficientDataHealthStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Healthy"] == NSOrderedSame) {
            return @(AWSroute53InsufficientDataHealthStatusHealthy);
        }
        if ([value caseInsensitiveCompare:@"Unhealthy"] == NSOrderedSame) {
            return @(AWSroute53InsufficientDataHealthStatusUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"LastKnownStatus"] == NSOrderedSame) {
            return @(AWSroute53InsufficientDataHealthStatusLastKnownStatus);
        }
        return @(AWSroute53InsufficientDataHealthStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53InsufficientDataHealthStatusHealthy:
                return @"Healthy";
            case AWSroute53InsufficientDataHealthStatusUnhealthy:
                return @"Unhealthy";
            case AWSroute53InsufficientDataHealthStatusLastKnownStatus:
                return @"LastKnownStatus";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckTypeHttps);
        }
        if ([value caseInsensitiveCompare:@"HTTP_STR_MATCH"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckTypeHttpStrMatch);
        }
        if ([value caseInsensitiveCompare:@"HTTPS_STR_MATCH"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckTypeHttpsStrMatch);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckTypeTcp);
        }
        if ([value caseInsensitiveCompare:@"CALCULATED"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckTypeCalculated);
        }
        if ([value caseInsensitiveCompare:@"CLOUDWATCH_METRIC"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckTypeCloudwatchMetric);
        }
        return @(AWSroute53HealthCheckTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53HealthCheckTypeHttp:
                return @"HTTP";
            case AWSroute53HealthCheckTypeHttps:
                return @"HTTPS";
            case AWSroute53HealthCheckTypeHttpStrMatch:
                return @"HTTP_STR_MATCH";
            case AWSroute53HealthCheckTypeHttpsStrMatch:
                return @"HTTPS_STR_MATCH";
            case AWSroute53HealthCheckTypeTcp:
                return @"TCP";
            case AWSroute53HealthCheckTypeCalculated:
                return @"CALCULATED";
            case AWSroute53HealthCheckTypeCloudwatchMetric:
                return @"CLOUDWATCH_METRIC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53HealthCheckObservation

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
            return @(AWSroute53HealthCheckRegionUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckRegionUsWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckRegionUsWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckRegionEuWest1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckRegionApSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckRegionApSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckRegionApNortheast1);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSroute53HealthCheckRegionSaEast1);
        }
        return @(AWSroute53HealthCheckRegionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53HealthCheckRegionUsEast1:
                return @"us-east-1";
            case AWSroute53HealthCheckRegionUsWest1:
                return @"us-west-1";
            case AWSroute53HealthCheckRegionUsWest2:
                return @"us-west-2";
            case AWSroute53HealthCheckRegionEuWest1:
                return @"eu-west-1";
            case AWSroute53HealthCheckRegionApSoutheast1:
                return @"ap-southeast-1";
            case AWSroute53HealthCheckRegionApSoutheast2:
                return @"ap-southeast-2";
            case AWSroute53HealthCheckRegionApNortheast1:
                return @"ap-northeast-1";
            case AWSroute53HealthCheckRegionSaEast1:
                return @"sa-east-1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusReportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53StatusReport class]];
}

@end

@implementation AWSroute53HostedZone

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53HostedZoneConfig class]];
}

+ (NSValueTransformer *)linkedServiceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53LinkedService class]];
}

@end

@implementation AWSroute53HostedZoneConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"privateZone" : @"PrivateZone",
             };
}

@end

@implementation AWSroute53HostedZoneLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_RRSETS_BY_ZONE"] == NSOrderedSame) {
            return @(AWSroute53HostedZoneLimitTypeMaxRrsetsByZone);
        }
        if ([value caseInsensitiveCompare:@"MAX_VPCS_ASSOCIATED_BY_ZONE"] == NSOrderedSame) {
            return @(AWSroute53HostedZoneLimitTypeMaxVpcsAssociatedByZone);
        }
        return @(AWSroute53HostedZoneLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53HostedZoneLimitTypeMaxRrsetsByZone:
                return @"MAX_RRSETS_BY_ZONE";
            case AWSroute53HostedZoneLimitTypeMaxVpcsAssociatedByZone:
                return @"MAX_VPCS_ASSOCIATED_BY_ZONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53LinkedService

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"servicePrincipal" : @"ServicePrincipal",
             };
}

@end

@implementation AWSroute53ListGeoLocationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxItems" : @"MaxItems",
             @"startContinentCode" : @"StartContinentCode",
             @"startCountryCode" : @"StartCountryCode",
             @"startSubdivisionCode" : @"StartSubdivisionCode",
             };
}

@end

@implementation AWSroute53ListGeoLocationsResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53GeoLocationDetails class]];
}

@end

@implementation AWSroute53ListHealthChecksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSroute53ListHealthChecksResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53HealthCheck class]];
}

@end

@implementation AWSroute53ListHostedZonesByNameRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DNSName" : @"DNSName",
             @"hostedZoneId" : @"HostedZoneId",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSroute53ListHostedZonesByNameResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53HostedZone class]];
}

@end

@implementation AWSroute53ListHostedZonesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationSetId" : @"DelegationSetId",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSroute53ListHostedZonesResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53HostedZone class]];
}

@end

@implementation AWSroute53ListQueryLoggingConfigsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSroute53ListQueryLoggingConfigsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"queryLoggingConfigs" : @"QueryLoggingConfigs",
             };
}

+ (NSValueTransformer *)queryLoggingConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53QueryLoggingConfig class]];
}

@end

@implementation AWSroute53ListResourceRecordSetsRequest

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53ListResourceRecordSetsResponse

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceRecordSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53ResourceRecordSet class]];
}

@end

@implementation AWSroute53ListReusableDelegationSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSroute53ListReusableDelegationSetsResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53DelegationSet class]];
}

@end

@implementation AWSroute53ListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"healthcheck"] == NSOrderedSame) {
            return @(AWSroute53TagResourceTypeHealthcheck);
        }
        if ([value caseInsensitiveCompare:@"hostedzone"] == NSOrderedSame) {
            return @(AWSroute53TagResourceTypeHostedzone);
        }
        return @(AWSroute53TagResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53TagResourceTypeHealthcheck:
                return @"healthcheck";
            case AWSroute53TagResourceTypeHostedzone:
                return @"hostedzone";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53ListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceTagSet" : @"ResourceTagSet",
             };
}

+ (NSValueTransformer *)resourceTagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53ResourceTagSet class]];
}

@end

@implementation AWSroute53ListTagsForResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceIds" : @"ResourceIds",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"healthcheck"] == NSOrderedSame) {
            return @(AWSroute53TagResourceTypeHealthcheck);
        }
        if ([value caseInsensitiveCompare:@"hostedzone"] == NSOrderedSame) {
            return @(AWSroute53TagResourceTypeHostedzone);
        }
        return @(AWSroute53TagResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53TagResourceTypeHealthcheck:
                return @"healthcheck";
            case AWSroute53TagResourceTypeHostedzone:
                return @"hostedzone";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53ListTagsForResourcesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceTagSets" : @"ResourceTagSets",
             };
}

+ (NSValueTransformer *)resourceTagSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53ResourceTagSet class]];
}

@end

@implementation AWSroute53ListTrafficPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxItems" : @"MaxItems",
             @"trafficPolicyIdMarker" : @"TrafficPolicyIdMarker",
             };
}

@end

@implementation AWSroute53ListTrafficPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"maxItems" : @"MaxItems",
             @"trafficPolicyIdMarker" : @"TrafficPolicyIdMarker",
             @"trafficPolicySummaries" : @"TrafficPolicySummaries",
             };
}

+ (NSValueTransformer *)trafficPolicySummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53TrafficPolicySummary class]];
}

@end

@implementation AWSroute53ListTrafficPolicyInstancesByHostedZoneRequest

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53ListTrafficPolicyInstancesByHostedZoneResponse

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trafficPolicyInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53TrafficPolicyInstance class]];
}

@end

@implementation AWSroute53ListTrafficPolicyInstancesByPolicyRequest

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53ListTrafficPolicyInstancesByPolicyResponse

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trafficPolicyInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53TrafficPolicyInstance class]];
}

@end

@implementation AWSroute53ListTrafficPolicyInstancesRequest

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53ListTrafficPolicyInstancesResponse

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trafficPolicyInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53TrafficPolicyInstance class]];
}

@end

@implementation AWSroute53ListTrafficPolicyVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"maxItems" : @"MaxItems",
             @"trafficPolicyVersionMarker" : @"TrafficPolicyVersionMarker",
             };
}

@end

@implementation AWSroute53ListTrafficPolicyVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"maxItems" : @"MaxItems",
             @"trafficPolicies" : @"TrafficPolicies",
             @"trafficPolicyVersionMarker" : @"TrafficPolicyVersionMarker",
             };
}

+ (NSValueTransformer *)trafficPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53TrafficPolicy class]];
}

@end

@implementation AWSroute53ListVPCAssociationAuthorizationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSroute53ListVPCAssociationAuthorizationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             @"nextToken" : @"NextToken",
             @"VPCs" : @"VPCs",
             };
}

+ (NSValueTransformer *)VPCsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53VPC class]];
}

@end

@implementation AWSroute53QueryLoggingConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogsLogGroupArn" : @"CloudWatchLogsLogGroupArn",
             @"hostedZoneId" : @"HostedZoneId",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53ResourceRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"value" : @"Value",
             };
}

@end

@implementation AWSroute53ResourceRecordSet

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53AliasTarget class]];
}

+ (NSValueTransformer *)failoverJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRIMARY"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetFailoverPrimary);
        }
        if ([value caseInsensitiveCompare:@"SECONDARY"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetFailoverSecondary);
        }
        return @(AWSroute53ResourceRecordSetFailoverUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53ResourceRecordSetFailoverPrimary:
                return @"PRIMARY";
            case AWSroute53ResourceRecordSetFailoverSecondary:
                return @"SECONDARY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)geoLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53GeoLocation class]];
}

+ (NSValueTransformer *)regionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionUsEast2);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionUsWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionUsWest2);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionCaCentral1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionEuWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionEuWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionEuWest3);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionEuCentral1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionApSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionApSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionApNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionApNortheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-3"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionApNortheast3);
        }
        if ([value caseInsensitiveCompare:@"eu-north-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionEuNorth1);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionSaEast1);
        }
        if ([value caseInsensitiveCompare:@"cn-north-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionCnNorth1);
        }
        if ([value caseInsensitiveCompare:@"cn-northwest-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionCnNorthwest1);
        }
        if ([value caseInsensitiveCompare:@"ap-east-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionApEast1);
        }
        if ([value caseInsensitiveCompare:@"me-south-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionMeSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionApSouth1);
        }
        if ([value caseInsensitiveCompare:@"af-south-1"] == NSOrderedSame) {
            return @(AWSroute53ResourceRecordSetRegionAfSouth1);
        }
        return @(AWSroute53ResourceRecordSetRegionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53ResourceRecordSetRegionUsEast1:
                return @"us-east-1";
            case AWSroute53ResourceRecordSetRegionUsEast2:
                return @"us-east-2";
            case AWSroute53ResourceRecordSetRegionUsWest1:
                return @"us-west-1";
            case AWSroute53ResourceRecordSetRegionUsWest2:
                return @"us-west-2";
            case AWSroute53ResourceRecordSetRegionCaCentral1:
                return @"ca-central-1";
            case AWSroute53ResourceRecordSetRegionEuWest1:
                return @"eu-west-1";
            case AWSroute53ResourceRecordSetRegionEuWest2:
                return @"eu-west-2";
            case AWSroute53ResourceRecordSetRegionEuWest3:
                return @"eu-west-3";
            case AWSroute53ResourceRecordSetRegionEuCentral1:
                return @"eu-central-1";
            case AWSroute53ResourceRecordSetRegionApSoutheast1:
                return @"ap-southeast-1";
            case AWSroute53ResourceRecordSetRegionApSoutheast2:
                return @"ap-southeast-2";
            case AWSroute53ResourceRecordSetRegionApNortheast1:
                return @"ap-northeast-1";
            case AWSroute53ResourceRecordSetRegionApNortheast2:
                return @"ap-northeast-2";
            case AWSroute53ResourceRecordSetRegionApNortheast3:
                return @"ap-northeast-3";
            case AWSroute53ResourceRecordSetRegionEuNorth1:
                return @"eu-north-1";
            case AWSroute53ResourceRecordSetRegionSaEast1:
                return @"sa-east-1";
            case AWSroute53ResourceRecordSetRegionCnNorth1:
                return @"cn-north-1";
            case AWSroute53ResourceRecordSetRegionCnNorthwest1:
                return @"cn-northwest-1";
            case AWSroute53ResourceRecordSetRegionApEast1:
                return @"ap-east-1";
            case AWSroute53ResourceRecordSetRegionMeSouth1:
                return @"me-south-1";
            case AWSroute53ResourceRecordSetRegionApSouth1:
                return @"ap-south-1";
            case AWSroute53ResourceRecordSetRegionAfSouth1:
                return @"af-south-1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53ResourceRecord class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53ResourceTagSet

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
            return @(AWSroute53TagResourceTypeHealthcheck);
        }
        if ([value caseInsensitiveCompare:@"hostedzone"] == NSOrderedSame) {
            return @(AWSroute53TagResourceTypeHostedzone);
        }
        return @(AWSroute53TagResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53TagResourceTypeHealthcheck:
                return @"healthcheck";
            case AWSroute53TagResourceTypeHostedzone:
                return @"hostedzone";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53Tag class]];
}

@end

@implementation AWSroute53ReusableDelegationSetLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_ZONES_BY_REUSABLE_DELEGATION_SET"] == NSOrderedSame) {
            return @(AWSroute53ReusableDelegationSetLimitTypeMaxZonesByReusableDelegationSet);
        }
        return @(AWSroute53ReusableDelegationSetLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53ReusableDelegationSetLimitTypeMaxZonesByReusableDelegationSet:
                return @"MAX_ZONES_BY_REUSABLE_DELEGATION_SET";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53StatusReport

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

@implementation AWSroute53Tag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSroute53TestDNSAnswerRequest

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53TestDNSAnswerResponse

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53TrafficPolicy

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53TrafficPolicyInstance

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53TrafficPolicySummary

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
            return @(AWSroute53RRTypeSoa);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSroute53RRTypeA);
        }
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSroute53RRTypeTxt);
        }
        if ([value caseInsensitiveCompare:@"NS"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNs);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCname);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53RRTypeMx);
        }
        if ([value caseInsensitiveCompare:@"NAPTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypeNaptr);
        }
        if ([value caseInsensitiveCompare:@"PTR"] == NSOrderedSame) {
            return @(AWSroute53RRTypePtr);
        }
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"SPF"] == NSOrderedSame) {
            return @(AWSroute53RRTypeSpf);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CAA"] == NSOrderedSame) {
            return @(AWSroute53RRTypeCaa);
        }
        return @(AWSroute53RRTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53RRTypeSoa:
                return @"SOA";
            case AWSroute53RRTypeA:
                return @"A";
            case AWSroute53RRTypeTxt:
                return @"TXT";
            case AWSroute53RRTypeNs:
                return @"NS";
            case AWSroute53RRTypeCname:
                return @"CNAME";
            case AWSroute53RRTypeMx:
                return @"MX";
            case AWSroute53RRTypeNaptr:
                return @"NAPTR";
            case AWSroute53RRTypePtr:
                return @"PTR";
            case AWSroute53RRTypeSrv:
                return @"SRV";
            case AWSroute53RRTypeSpf:
                return @"SPF";
            case AWSroute53RRTypeAaaa:
                return @"AAAA";
            case AWSroute53RRTypeCaa:
                return @"CAA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53UpdateHealthCheckRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53AlarmIdentifier class]];
}

+ (NSValueTransformer *)insufficientDataHealthStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Healthy"] == NSOrderedSame) {
            return @(AWSroute53InsufficientDataHealthStatusHealthy);
        }
        if ([value caseInsensitiveCompare:@"Unhealthy"] == NSOrderedSame) {
            return @(AWSroute53InsufficientDataHealthStatusUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"LastKnownStatus"] == NSOrderedSame) {
            return @(AWSroute53InsufficientDataHealthStatusLastKnownStatus);
        }
        return @(AWSroute53InsufficientDataHealthStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53InsufficientDataHealthStatusHealthy:
                return @"Healthy";
            case AWSroute53InsufficientDataHealthStatusUnhealthy:
                return @"Unhealthy";
            case AWSroute53InsufficientDataHealthStatusLastKnownStatus:
                return @"LastKnownStatus";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53UpdateHealthCheckResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheck" : @"HealthCheck",
             };
}

+ (NSValueTransformer *)healthCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53HealthCheck class]];
}

@end

@implementation AWSroute53UpdateHostedZoneCommentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSroute53UpdateHostedZoneCommentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZone" : @"HostedZone",
             };
}

+ (NSValueTransformer *)hostedZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53HostedZone class]];
}

@end

@implementation AWSroute53UpdateTrafficPolicyCommentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"identifier" : @"Id",
             @"version" : @"Version",
             };
}

@end

@implementation AWSroute53UpdateTrafficPolicyCommentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficPolicy" : @"TrafficPolicy",
             };
}

+ (NSValueTransformer *)trafficPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53TrafficPolicy class]];
}

@end

@implementation AWSroute53UpdateTrafficPolicyInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"TTL" : @"TTL",
             @"trafficPolicyId" : @"TrafficPolicyId",
             @"trafficPolicyVersion" : @"TrafficPolicyVersion",
             };
}

@end

@implementation AWSroute53UpdateTrafficPolicyInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trafficPolicyInstance" : @"TrafficPolicyInstance",
             };
}

+ (NSValueTransformer *)trafficPolicyInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53TrafficPolicyInstance class]];
}

@end

@implementation AWSroute53VPC

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"VPCId" : @"VPCId",
             @"VPCRegion" : @"VPCRegion",
             };
}

+ (NSValueTransformer *)VPCRegionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionUsEast2);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionUsWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionUsWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionEuWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionEuWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionEuWest3);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionEuCentral1);
        }
        if ([value caseInsensitiveCompare:@"ap-east-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionApEast1);
        }
        if ([value caseInsensitiveCompare:@"me-south-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionMeSouth1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-west-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionUsGovWest1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-east-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionUsGovEast1);
        }
        if ([value caseInsensitiveCompare:@"us-iso-east-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionUsIsoEast1);
        }
        if ([value caseInsensitiveCompare:@"us-isob-east-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionUsIsobEast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionApSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionApSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionApSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionApNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionApNortheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-3"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionApNortheast3);
        }
        if ([value caseInsensitiveCompare:@"eu-north-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionEuNorth1);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionSaEast1);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionCaCentral1);
        }
        if ([value caseInsensitiveCompare:@"cn-north-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionCnNorth1);
        }
        if ([value caseInsensitiveCompare:@"af-south-1"] == NSOrderedSame) {
            return @(AWSroute53VPCRegionAfSouth1);
        }
        return @(AWSroute53VPCRegionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53VPCRegionUsEast1:
                return @"us-east-1";
            case AWSroute53VPCRegionUsEast2:
                return @"us-east-2";
            case AWSroute53VPCRegionUsWest1:
                return @"us-west-1";
            case AWSroute53VPCRegionUsWest2:
                return @"us-west-2";
            case AWSroute53VPCRegionEuWest1:
                return @"eu-west-1";
            case AWSroute53VPCRegionEuWest2:
                return @"eu-west-2";
            case AWSroute53VPCRegionEuWest3:
                return @"eu-west-3";
            case AWSroute53VPCRegionEuCentral1:
                return @"eu-central-1";
            case AWSroute53VPCRegionApEast1:
                return @"ap-east-1";
            case AWSroute53VPCRegionMeSouth1:
                return @"me-south-1";
            case AWSroute53VPCRegionUsGovWest1:
                return @"us-gov-west-1";
            case AWSroute53VPCRegionUsGovEast1:
                return @"us-gov-east-1";
            case AWSroute53VPCRegionUsIsoEast1:
                return @"us-iso-east-1";
            case AWSroute53VPCRegionUsIsobEast1:
                return @"us-isob-east-1";
            case AWSroute53VPCRegionApSoutheast1:
                return @"ap-southeast-1";
            case AWSroute53VPCRegionApSoutheast2:
                return @"ap-southeast-2";
            case AWSroute53VPCRegionApSouth1:
                return @"ap-south-1";
            case AWSroute53VPCRegionApNortheast1:
                return @"ap-northeast-1";
            case AWSroute53VPCRegionApNortheast2:
                return @"ap-northeast-2";
            case AWSroute53VPCRegionApNortheast3:
                return @"ap-northeast-3";
            case AWSroute53VPCRegionEuNorth1:
                return @"eu-north-1";
            case AWSroute53VPCRegionSaEast1:
                return @"sa-east-1";
            case AWSroute53VPCRegionCaCentral1:
                return @"ca-central-1";
            case AWSroute53VPCRegionCnNorth1:
                return @"cn-north-1";
            case AWSroute53VPCRegionAfSouth1:
                return @"af-south-1";
            default:
                return nil;
        }
    }];
}

@end
