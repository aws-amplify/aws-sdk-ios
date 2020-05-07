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

#import "AWSLightsailModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSLightsailErrorDomain = @"com.amazonaws.AWSLightsailErrorDomain";

@implementation AWSLightsailAddOn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"nextSnapshotTimeOfDay" : @"nextSnapshotTimeOfDay",
             @"snapshotTimeOfDay" : @"snapshotTimeOfDay",
             @"status" : @"status",
             };
}

@end

@implementation AWSLightsailAddOnRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addOnType" : @"addOnType",
             @"autoSnapshotAddOnRequest" : @"autoSnapshotAddOnRequest",
             };
}

+ (NSValueTransformer *)addOnTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AutoSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailAddOnTypeAutoSnapshot);
        }
        return @(AWSLightsailAddOnTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailAddOnTypeAutoSnapshot:
                return @"AutoSnapshot";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)autoSnapshotAddOnRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailAutoSnapshotAddOnRequest class]];
}

@end

@implementation AWSLightsailAlarm

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"comparisonOperator" : @"comparisonOperator",
             @"contactProtocols" : @"contactProtocols",
             @"createdAt" : @"createdAt",
             @"datapointsToAlarm" : @"datapointsToAlarm",
             @"evaluationPeriods" : @"evaluationPeriods",
             @"location" : @"location",
             @"metricName" : @"metricName",
             @"monitoredResourceInfo" : @"monitoredResourceInfo",
             @"name" : @"name",
             @"notificationEnabled" : @"notificationEnabled",
             @"notificationTriggers" : @"notificationTriggers",
             @"period" : @"period",
             @"resourceType" : @"resourceType",
             @"state" : @"state",
             @"statistic" : @"statistic",
             @"supportCode" : @"supportCode",
             @"threshold" : @"threshold",
             @"treatMissingData" : @"treatMissingData",
             @"unit" : @"unit",
             };
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GreaterThanOrEqualToThreshold"] == NSOrderedSame) {
            return @(AWSLightsailComparisonOperatorGreaterThanOrEqualToThreshold);
        }
        if ([value caseInsensitiveCompare:@"GreaterThanThreshold"] == NSOrderedSame) {
            return @(AWSLightsailComparisonOperatorGreaterThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanThreshold"] == NSOrderedSame) {
            return @(AWSLightsailComparisonOperatorLessThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanOrEqualToThreshold"] == NSOrderedSame) {
            return @(AWSLightsailComparisonOperatorLessThanOrEqualToThreshold);
        }
        return @(AWSLightsailComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailComparisonOperatorGreaterThanOrEqualToThreshold:
                return @"GreaterThanOrEqualToThreshold";
            case AWSLightsailComparisonOperatorGreaterThanThreshold:
                return @"GreaterThanThreshold";
            case AWSLightsailComparisonOperatorLessThanThreshold:
                return @"LessThanThreshold";
            case AWSLightsailComparisonOperatorLessThanOrEqualToThreshold:
                return @"LessThanOrEqualToThreshold";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CPUUtilization"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"NetworkIn"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameNetworkIn);
        }
        if ([value caseInsensitiveCompare:@"NetworkOut"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameNetworkOut);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameStatusCheckFailed);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed_Instance"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameStatusCheckFailedInstance);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed_System"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameStatusCheckFailedSystem);
        }
        if ([value caseInsensitiveCompare:@"ClientTLSNegotiationErrorCount"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameClientTLSNegotiationErrorCount);
        }
        if ([value caseInsensitiveCompare:@"HealthyHostCount"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHealthyHostCount);
        }
        if ([value caseInsensitiveCompare:@"UnhealthyHostCount"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameUnhealthyHostCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_LB_4XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeLB4XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_LB_5XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeLB5XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_2XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeInstance2XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_3XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeInstance3XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_4XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeInstance4XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_5XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeInstance5XXCount);
        }
        if ([value caseInsensitiveCompare:@"InstanceResponseTime"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameInstanceResponseTime);
        }
        if ([value caseInsensitiveCompare:@"RejectedConnectionCount"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameRejectedConnectionCount);
        }
        if ([value caseInsensitiveCompare:@"RequestCount"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameRequestCount);
        }
        if ([value caseInsensitiveCompare:@"DatabaseConnections"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameDatabaseConnections);
        }
        if ([value caseInsensitiveCompare:@"DiskQueueDepth"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameDiskQueueDepth);
        }
        if ([value caseInsensitiveCompare:@"FreeStorageSpace"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameFreeStorageSpace);
        }
        if ([value caseInsensitiveCompare:@"NetworkReceiveThroughput"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameNetworkReceiveThroughput);
        }
        if ([value caseInsensitiveCompare:@"NetworkTransmitThroughput"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameNetworkTransmitThroughput);
        }
        return @(AWSLightsailMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailMetricNameCPUUtilization:
                return @"CPUUtilization";
            case AWSLightsailMetricNameNetworkIn:
                return @"NetworkIn";
            case AWSLightsailMetricNameNetworkOut:
                return @"NetworkOut";
            case AWSLightsailMetricNameStatusCheckFailed:
                return @"StatusCheckFailed";
            case AWSLightsailMetricNameStatusCheckFailedInstance:
                return @"StatusCheckFailed_Instance";
            case AWSLightsailMetricNameStatusCheckFailedSystem:
                return @"StatusCheckFailed_System";
            case AWSLightsailMetricNameClientTLSNegotiationErrorCount:
                return @"ClientTLSNegotiationErrorCount";
            case AWSLightsailMetricNameHealthyHostCount:
                return @"HealthyHostCount";
            case AWSLightsailMetricNameUnhealthyHostCount:
                return @"UnhealthyHostCount";
            case AWSLightsailMetricNameHTTPCodeLB4XXCount:
                return @"HTTPCode_LB_4XX_Count";
            case AWSLightsailMetricNameHTTPCodeLB5XXCount:
                return @"HTTPCode_LB_5XX_Count";
            case AWSLightsailMetricNameHTTPCodeInstance2XXCount:
                return @"HTTPCode_Instance_2XX_Count";
            case AWSLightsailMetricNameHTTPCodeInstance3XXCount:
                return @"HTTPCode_Instance_3XX_Count";
            case AWSLightsailMetricNameHTTPCodeInstance4XXCount:
                return @"HTTPCode_Instance_4XX_Count";
            case AWSLightsailMetricNameHTTPCodeInstance5XXCount:
                return @"HTTPCode_Instance_5XX_Count";
            case AWSLightsailMetricNameInstanceResponseTime:
                return @"InstanceResponseTime";
            case AWSLightsailMetricNameRejectedConnectionCount:
                return @"RejectedConnectionCount";
            case AWSLightsailMetricNameRequestCount:
                return @"RequestCount";
            case AWSLightsailMetricNameDatabaseConnections:
                return @"DatabaseConnections";
            case AWSLightsailMetricNameDiskQueueDepth:
                return @"DiskQueueDepth";
            case AWSLightsailMetricNameFreeStorageSpace:
                return @"FreeStorageSpace";
            case AWSLightsailMetricNameNetworkReceiveThroughput:
                return @"NetworkReceiveThroughput";
            case AWSLightsailMetricNameNetworkTransmitThroughput:
                return @"NetworkTransmitThroughput";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)monitoredResourceInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailMonitoredResourceInfo class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OK"] == NSOrderedSame) {
            return @(AWSLightsailAlarmStateOK);
        }
        if ([value caseInsensitiveCompare:@"ALARM"] == NSOrderedSame) {
            return @(AWSLightsailAlarmStateAlarm);
        }
        if ([value caseInsensitiveCompare:@"INSUFFICIENT_DATA"] == NSOrderedSame) {
            return @(AWSLightsailAlarmStateInsufficientData);
        }
        return @(AWSLightsailAlarmStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailAlarmStateOK:
                return @"OK";
            case AWSLightsailAlarmStateAlarm:
                return @"ALARM";
            case AWSLightsailAlarmStateInsufficientData:
                return @"INSUFFICIENT_DATA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Minimum"] == NSOrderedSame) {
            return @(AWSLightsailMetricStatisticMinimum);
        }
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
            return @(AWSLightsailMetricStatisticMaximum);
        }
        if ([value caseInsensitiveCompare:@"Sum"] == NSOrderedSame) {
            return @(AWSLightsailMetricStatisticSum);
        }
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSLightsailMetricStatisticAverage);
        }
        if ([value caseInsensitiveCompare:@"SampleCount"] == NSOrderedSame) {
            return @(AWSLightsailMetricStatisticSampleCount);
        }
        return @(AWSLightsailMetricStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailMetricStatisticMinimum:
                return @"Minimum";
            case AWSLightsailMetricStatisticMaximum:
                return @"Maximum";
            case AWSLightsailMetricStatisticSum:
                return @"Sum";
            case AWSLightsailMetricStatisticAverage:
                return @"Average";
            case AWSLightsailMetricStatisticSampleCount:
                return @"SampleCount";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)treatMissingDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"breaching"] == NSOrderedSame) {
            return @(AWSLightsailTreatMissingDataBreaching);
        }
        if ([value caseInsensitiveCompare:@"notBreaching"] == NSOrderedSame) {
            return @(AWSLightsailTreatMissingDataNotBreaching);
        }
        if ([value caseInsensitiveCompare:@"ignore"] == NSOrderedSame) {
            return @(AWSLightsailTreatMissingDataIgnore);
        }
        if ([value caseInsensitiveCompare:@"missing"] == NSOrderedSame) {
            return @(AWSLightsailTreatMissingDataMissing);
        }
        return @(AWSLightsailTreatMissingDataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailTreatMissingDataBreaching:
                return @"breaching";
            case AWSLightsailTreatMissingDataNotBreaching:
                return @"notBreaching";
            case AWSLightsailTreatMissingDataIgnore:
                return @"ignore";
            case AWSLightsailTreatMissingDataMissing:
                return @"missing";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitNone);
        }
        return @(AWSLightsailMetricUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailMetricUnitSeconds:
                return @"Seconds";
            case AWSLightsailMetricUnitMicroseconds:
                return @"Microseconds";
            case AWSLightsailMetricUnitMilliseconds:
                return @"Milliseconds";
            case AWSLightsailMetricUnitBytes:
                return @"Bytes";
            case AWSLightsailMetricUnitKilobytes:
                return @"Kilobytes";
            case AWSLightsailMetricUnitMegabytes:
                return @"Megabytes";
            case AWSLightsailMetricUnitGigabytes:
                return @"Gigabytes";
            case AWSLightsailMetricUnitTerabytes:
                return @"Terabytes";
            case AWSLightsailMetricUnitBits:
                return @"Bits";
            case AWSLightsailMetricUnitKilobits:
                return @"Kilobits";
            case AWSLightsailMetricUnitMegabits:
                return @"Megabits";
            case AWSLightsailMetricUnitGigabits:
                return @"Gigabits";
            case AWSLightsailMetricUnitTerabits:
                return @"Terabits";
            case AWSLightsailMetricUnitPercent:
                return @"Percent";
            case AWSLightsailMetricUnitCount:
                return @"Count";
            case AWSLightsailMetricUnitBytesSecond:
                return @"Bytes/Second";
            case AWSLightsailMetricUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSLightsailMetricUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSLightsailMetricUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSLightsailMetricUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSLightsailMetricUnitBitsSecond:
                return @"Bits/Second";
            case AWSLightsailMetricUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSLightsailMetricUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSLightsailMetricUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSLightsailMetricUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSLightsailMetricUnitCountSecond:
                return @"Count/Second";
            case AWSLightsailMetricUnitNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailAllocateStaticIpRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"staticIpName" : @"staticIpName",
             };
}

@end

@implementation AWSLightsailAllocateStaticIpResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailAttachDiskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskName" : @"diskName",
             @"diskPath" : @"diskPath",
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSLightsailAttachDiskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailAttachInstancesToLoadBalancerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceNames" : @"instanceNames",
             @"loadBalancerName" : @"loadBalancerName",
             };
}

@end

@implementation AWSLightsailAttachInstancesToLoadBalancerResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailAttachLoadBalancerTlsCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateName" : @"certificateName",
             @"loadBalancerName" : @"loadBalancerName",
             };
}

@end

@implementation AWSLightsailAttachLoadBalancerTlsCertificateResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailAttachStaticIpRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             @"staticIpName" : @"staticIpName",
             };
}

@end

@implementation AWSLightsailAttachStaticIpResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailAttachedDisk

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"path" : @"path",
             @"sizeInGb" : @"sizeInGb",
             };
}

@end

@implementation AWSLightsailAutoSnapshotAddOnRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotTimeOfDay" : @"snapshotTimeOfDay",
             };
}

@end

@implementation AWSLightsailAutoSnapshotDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"createdAt",
             @"date" : @"date",
             @"fromAttachedDisks" : @"fromAttachedDisks",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)fromAttachedDisksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailAttachedDisk class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSLightsailAutoSnapshotStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLightsailAutoSnapshotStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSLightsailAutoSnapshotStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"NotFound"] == NSOrderedSame) {
            return @(AWSLightsailAutoSnapshotStatusNotFound);
        }
        return @(AWSLightsailAutoSnapshotStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailAutoSnapshotStatusSuccess:
                return @"Success";
            case AWSLightsailAutoSnapshotStatusFailed:
                return @"Failed";
            case AWSLightsailAutoSnapshotStatusInProgress:
                return @"InProgress";
            case AWSLightsailAutoSnapshotStatusNotFound:
                return @"NotFound";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailAvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"state",
             @"zoneName" : @"zoneName",
             };
}

@end

@implementation AWSLightsailBlueprint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blueprintId" : @"blueprintId",
             @"detail" : @"description",
             @"group" : @"group",
             @"isActive" : @"isActive",
             @"licenseUrl" : @"licenseUrl",
             @"minPower" : @"minPower",
             @"name" : @"name",
             @"platform" : @"platform",
             @"productUrl" : @"productUrl",
             @"types" : @"type",
             @"version" : @"version",
             @"versionCode" : @"versionCode",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LINUX_UNIX"] == NSOrderedSame) {
            return @(AWSLightsailInstancePlatformLinuxUnix);
        }
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSLightsailInstancePlatformWindows);
        }
        return @(AWSLightsailInstancePlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailInstancePlatformLinuxUnix:
                return @"LINUX_UNIX";
            case AWSLightsailInstancePlatformWindows:
                return @"WINDOWS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"os"] == NSOrderedSame) {
            return @(AWSLightsailBlueprintTypeOs);
        }
        if ([value caseInsensitiveCompare:@"app"] == NSOrderedSame) {
            return @(AWSLightsailBlueprintTypeApp);
        }
        return @(AWSLightsailBlueprintTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailBlueprintTypeOs:
                return @"os";
            case AWSLightsailBlueprintTypeApp:
                return @"app";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailBundle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"bundleId",
             @"cpuCount" : @"cpuCount",
             @"diskSizeInGb" : @"diskSizeInGb",
             @"instanceType" : @"instanceType",
             @"isActive" : @"isActive",
             @"name" : @"name",
             @"power" : @"power",
             @"price" : @"price",
             @"ramSizeInGb" : @"ramSizeInGb",
             @"supportedPlatforms" : @"supportedPlatforms",
             @"transferPerMonthInGb" : @"transferPerMonthInGb",
             };
}

@end

@implementation AWSLightsailCloseInstancePublicPortsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             @"portInfo" : @"portInfo",
             };
}

+ (NSValueTransformer *)portInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailPortInfo class]];
}

@end

@implementation AWSLightsailCloseInstancePublicPortsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCloudFormationStackRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"destinationInfo" : @"destinationInfo",
             @"location" : @"location",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             @"sourceInfo" : @"sourceInfo",
             @"state" : @"state",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)destinationInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailDestinationInfo class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailCloudFormationStackRecordSourceInfo class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Started"] == NSOrderedSame) {
            return @(AWSLightsailRecordStateStarted);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSLightsailRecordStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLightsailRecordStateFailed);
        }
        return @(AWSLightsailRecordStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailRecordStateStarted:
                return @"Started";
            case AWSLightsailRecordStateSucceeded:
                return @"Succeeded";
            case AWSLightsailRecordStateFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailCloudFormationStackRecordSourceInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailCloudFormationStackRecordSourceTypeExportSnapshotRecord);
        }
        return @(AWSLightsailCloudFormationStackRecordSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailCloudFormationStackRecordSourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailContactMethod

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"contactEndpoint" : @"contactEndpoint",
             @"createdAt" : @"createdAt",
             @"location" : @"location",
             @"name" : @"name",
             @"protocols" : @"protocol",
             @"resourceType" : @"resourceType",
             @"status" : @"status",
             @"supportCode" : @"supportCode",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Email"] == NSOrderedSame) {
            return @(AWSLightsailContactProtocolEmail);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSLightsailContactProtocolSms);
        }
        return @(AWSLightsailContactProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailContactProtocolEmail:
                return @"Email";
            case AWSLightsailContactProtocolSms:
                return @"SMS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PendingVerification"] == NSOrderedSame) {
            return @(AWSLightsailContactMethodStatusPendingVerification);
        }
        if ([value caseInsensitiveCompare:@"Valid"] == NSOrderedSame) {
            return @(AWSLightsailContactMethodStatusValid);
        }
        if ([value caseInsensitiveCompare:@"Invalid"] == NSOrderedSame) {
            return @(AWSLightsailContactMethodStatusInvalid);
        }
        return @(AWSLightsailContactMethodStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailContactMethodStatusPendingVerification:
                return @"PendingVerification";
            case AWSLightsailContactMethodStatusValid:
                return @"Valid";
            case AWSLightsailContactMethodStatusInvalid:
                return @"Invalid";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailReplicateSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"restoreDate" : @"restoreDate",
             @"sourceRegion" : @"sourceRegion",
             @"sourceResourceName" : @"sourceResourceName",
             @"sourceSnapshotName" : @"sourceSnapshotName",
             @"targetSnapshotName" : @"targetSnapshotName",
             @"useLatestRestorableAutoSnapshot" : @"useLatestRestorableAutoSnapshot",
             };
}

+ (NSValueTransformer *)sourceRegionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsEast2);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuWest3);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuCentral1);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameCaCentral1);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApNortheast2);
        }
        return @(AWSLightsailRegionNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailRegionNameUsEast1:
                return @"us-east-1";
            case AWSLightsailRegionNameUsEast2:
                return @"us-east-2";
            case AWSLightsailRegionNameUsWest1:
                return @"us-west-1";
            case AWSLightsailRegionNameUsWest2:
                return @"us-west-2";
            case AWSLightsailRegionNameEuWest1:
                return @"eu-west-1";
            case AWSLightsailRegionNameEuWest2:
                return @"eu-west-2";
            case AWSLightsailRegionNameEuWest3:
                return @"eu-west-3";
            case AWSLightsailRegionNameEuCentral1:
                return @"eu-central-1";
            case AWSLightsailRegionNameCaCentral1:
                return @"ca-central-1";
            case AWSLightsailRegionNameApSouth1:
                return @"ap-south-1";
            case AWSLightsailRegionNameApSoutheast1:
                return @"ap-southeast-1";
            case AWSLightsailRegionNameApSoutheast2:
                return @"ap-southeast-2";
            case AWSLightsailRegionNameApNortheast1:
                return @"ap-northeast-1";
            case AWSLightsailRegionNameApNortheast2:
                return @"ap-northeast-2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailReplicateSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateCloudFormationStackRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"instances",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailInstanceEntry class]];
}

@end

@implementation AWSLightsailCreateCloudFormationStackResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateContactMethodRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactEndpoint" : @"contactEndpoint",
             @"protocols" : @"protocol",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Email"] == NSOrderedSame) {
            return @(AWSLightsailContactProtocolEmail);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSLightsailContactProtocolSms);
        }
        return @(AWSLightsailContactProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailContactProtocolEmail:
                return @"Email";
            case AWSLightsailContactProtocolSms:
                return @"SMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailCreateContactMethodResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateDiskFromSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addOns" : @"addOns",
             @"availabilityZone" : @"availabilityZone",
             @"diskName" : @"diskName",
             @"diskSnapshotName" : @"diskSnapshotName",
             @"restoreDate" : @"restoreDate",
             @"sizeInGb" : @"sizeInGb",
             @"sourceDiskName" : @"sourceDiskName",
             @"tags" : @"tags",
             @"useLatestRestorableAutoSnapshot" : @"useLatestRestorableAutoSnapshot",
             };
}

+ (NSValueTransformer *)addOnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailAddOnRequest class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateDiskFromSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateDiskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addOns" : @"addOns",
             @"availabilityZone" : @"availabilityZone",
             @"diskName" : @"diskName",
             @"sizeInGb" : @"sizeInGb",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)addOnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailAddOnRequest class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateDiskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateDiskSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskName" : @"diskName",
             @"diskSnapshotName" : @"diskSnapshotName",
             @"instanceName" : @"instanceName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateDiskSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateDomainEntryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainEntry" : @"domainEntry",
             @"domainName" : @"domainName",
             };
}

+ (NSValueTransformer *)domainEntryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailDomainEntry class]];
}

@end

@implementation AWSLightsailCreateDomainEntryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"domainName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateDomainResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateInstanceSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             @"instanceSnapshotName" : @"instanceSnapshotName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateInstanceSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateInstancesFromSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addOns" : @"addOns",
             @"attachedDiskMapping" : @"attachedDiskMapping",
             @"availabilityZone" : @"availabilityZone",
             @"bundleId" : @"bundleId",
             @"instanceNames" : @"instanceNames",
             @"instanceSnapshotName" : @"instanceSnapshotName",
             @"keyPairName" : @"keyPairName",
             @"restoreDate" : @"restoreDate",
             @"sourceInstanceName" : @"sourceInstanceName",
             @"tags" : @"tags",
             @"useLatestRestorableAutoSnapshot" : @"useLatestRestorableAutoSnapshot",
             @"userData" : @"userData",
             };
}

+ (NSValueTransformer *)addOnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailAddOnRequest class]];
}

+ (NSValueTransformer *)attachedDiskMappingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"structure" withModelClass:[AWSLightsailDiskMap class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"structure"];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateInstancesFromSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addOns" : @"addOns",
             @"availabilityZone" : @"availabilityZone",
             @"blueprintId" : @"blueprintId",
             @"bundleId" : @"bundleId",
             @"customImageName" : @"customImageName",
             @"instanceNames" : @"instanceNames",
             @"keyPairName" : @"keyPairName",
             @"tags" : @"tags",
             @"userData" : @"userData",
             };
}

+ (NSValueTransformer *)addOnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailAddOnRequest class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateKeyPairRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPairName" : @"keyPairName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateKeyPairResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPair" : @"keyPair",
             @"operation" : @"operation",
             @"privateKeyBase64" : @"privateKeyBase64",
             @"publicKeyBase64" : @"publicKeyBase64",
             };
}

+ (NSValueTransformer *)keyPairJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailKeyPair class]];
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateLoadBalancerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateAlternativeNames" : @"certificateAlternativeNames",
             @"certificateDomainName" : @"certificateDomainName",
             @"certificateName" : @"certificateName",
             @"healthCheckPath" : @"healthCheckPath",
             @"instancePort" : @"instancePort",
             @"loadBalancerName" : @"loadBalancerName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateLoadBalancerResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateLoadBalancerTlsCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateAlternativeNames" : @"certificateAlternativeNames",
             @"certificateDomainName" : @"certificateDomainName",
             @"certificateName" : @"certificateName",
             @"loadBalancerName" : @"loadBalancerName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateLoadBalancerTlsCertificateResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateRelationalDatabaseFromSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"availabilityZone",
             @"publiclyAccessible" : @"publiclyAccessible",
             @"relationalDatabaseBundleId" : @"relationalDatabaseBundleId",
             @"relationalDatabaseName" : @"relationalDatabaseName",
             @"relationalDatabaseSnapshotName" : @"relationalDatabaseSnapshotName",
             @"restoreTime" : @"restoreTime",
             @"sourceRelationalDatabaseName" : @"sourceRelationalDatabaseName",
             @"tags" : @"tags",
             @"useLatestRestorableTime" : @"useLatestRestorableTime",
             };
}

+ (NSValueTransformer *)restoreTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateRelationalDatabaseFromSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateRelationalDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"availabilityZone",
             @"masterDatabaseName" : @"masterDatabaseName",
             @"masterUserPassword" : @"masterUserPassword",
             @"masterUsername" : @"masterUsername",
             @"preferredBackupWindow" : @"preferredBackupWindow",
             @"preferredMaintenanceWindow" : @"preferredMaintenanceWindow",
             @"publiclyAccessible" : @"publiclyAccessible",
             @"relationalDatabaseBlueprintId" : @"relationalDatabaseBlueprintId",
             @"relationalDatabaseBundleId" : @"relationalDatabaseBundleId",
             @"relationalDatabaseName" : @"relationalDatabaseName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateRelationalDatabaseResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailCreateRelationalDatabaseSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relationalDatabaseName" : @"relationalDatabaseName",
             @"relationalDatabaseSnapshotName" : @"relationalDatabaseSnapshotName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailCreateRelationalDatabaseSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteAlarmRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmName" : @"alarmName",
             };
}

@end

@implementation AWSLightsailDeleteAlarmResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteAutoSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"date" : @"date",
             @"resourceName" : @"resourceName",
             };
}

@end

@implementation AWSLightsailDeleteAutoSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteContactMethodRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"protocols" : @"protocol",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Email"] == NSOrderedSame) {
            return @(AWSLightsailContactProtocolEmail);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSLightsailContactProtocolSms);
        }
        return @(AWSLightsailContactProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailContactProtocolEmail:
                return @"Email";
            case AWSLightsailContactProtocolSms:
                return @"SMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailDeleteContactMethodResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteDiskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskName" : @"diskName",
             @"forceDeleteAddOns" : @"forceDeleteAddOns",
             };
}

@end

@implementation AWSLightsailDeleteDiskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteDiskSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskSnapshotName" : @"diskSnapshotName",
             };
}

@end

@implementation AWSLightsailDeleteDiskSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteDomainEntryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainEntry" : @"domainEntry",
             @"domainName" : @"domainName",
             };
}

+ (NSValueTransformer *)domainEntryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailDomainEntry class]];
}

@end

@implementation AWSLightsailDeleteDomainEntryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"domainName",
             };
}

@end

@implementation AWSLightsailDeleteDomainResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forceDeleteAddOns" : @"forceDeleteAddOns",
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSLightsailDeleteInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteInstanceSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceSnapshotName" : @"instanceSnapshotName",
             };
}

@end

@implementation AWSLightsailDeleteInstanceSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteKeyPairRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPairName" : @"keyPairName",
             };
}

@end

@implementation AWSLightsailDeleteKeyPairResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteKnownHostKeysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSLightsailDeleteKnownHostKeysResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteLoadBalancerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"loadBalancerName",
             };
}

@end

@implementation AWSLightsailDeleteLoadBalancerResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteLoadBalancerTlsCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateName" : @"certificateName",
             @"force" : @"force",
             @"loadBalancerName" : @"loadBalancerName",
             };
}

@end

@implementation AWSLightsailDeleteLoadBalancerTlsCertificateResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteRelationalDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finalRelationalDatabaseSnapshotName" : @"finalRelationalDatabaseSnapshotName",
             @"relationalDatabaseName" : @"relationalDatabaseName",
             @"skipFinalSnapshot" : @"skipFinalSnapshot",
             };
}

@end

@implementation AWSLightsailDeleteRelationalDatabaseResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDeleteRelationalDatabaseSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relationalDatabaseSnapshotName" : @"relationalDatabaseSnapshotName",
             };
}

@end

@implementation AWSLightsailDeleteRelationalDatabaseSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDestinationInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             @"service" : @"service",
             };
}

@end

@implementation AWSLightsailDetachDiskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskName" : @"diskName",
             };
}

@end

@implementation AWSLightsailDetachDiskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDetachInstancesFromLoadBalancerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceNames" : @"instanceNames",
             @"loadBalancerName" : @"loadBalancerName",
             };
}

@end

@implementation AWSLightsailDetachInstancesFromLoadBalancerResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDetachStaticIpRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"staticIpName" : @"staticIpName",
             };
}

@end

@implementation AWSLightsailDetachStaticIpResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDisableAddOnRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addOnType" : @"addOnType",
             @"resourceName" : @"resourceName",
             };
}

+ (NSValueTransformer *)addOnTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AutoSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailAddOnTypeAutoSnapshot);
        }
        return @(AWSLightsailAddOnTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailAddOnTypeAutoSnapshot:
                return @"AutoSnapshot";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailDisableAddOnResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailDisk

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addOns" : @"addOns",
             @"arn" : @"arn",
             @"attachedTo" : @"attachedTo",
             @"attachmentState" : @"attachmentState",
             @"createdAt" : @"createdAt",
             @"gbInUse" : @"gbInUse",
             @"iops" : @"iops",
             @"isAttached" : @"isAttached",
             @"isSystemDisk" : @"isSystemDisk",
             @"location" : @"location",
             @"name" : @"name",
             @"path" : @"path",
             @"resourceType" : @"resourceType",
             @"sizeInGb" : @"sizeInGb",
             @"state" : @"state",
             @"supportCode" : @"supportCode",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)addOnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailAddOn class]];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSLightsailDiskStatePending);
        }
        if ([value caseInsensitiveCompare:@"error"] == NSOrderedSame) {
            return @(AWSLightsailDiskStateError);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSLightsailDiskStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"in-use"] == NSOrderedSame) {
            return @(AWSLightsailDiskStateInUse);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSLightsailDiskStateUnknown);
        }
        return @(AWSLightsailDiskStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailDiskStatePending:
                return @"pending";
            case AWSLightsailDiskStateError:
                return @"error";
            case AWSLightsailDiskStateAvailable:
                return @"available";
            case AWSLightsailDiskStateInUse:
                return @"in-use";
            case AWSLightsailDiskStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailDiskInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isSystemDisk" : @"isSystemDisk",
             @"name" : @"name",
             @"path" : @"path",
             @"sizeInGb" : @"sizeInGb",
             };
}

@end

@implementation AWSLightsailDiskMap

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestDiskName" : @"newDiskName",
             @"originalDiskPath" : @"originalDiskPath",
             };
}

@end

@implementation AWSLightsailDiskSnapshot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"fromDiskArn" : @"fromDiskArn",
             @"fromDiskName" : @"fromDiskName",
             @"fromInstanceArn" : @"fromInstanceArn",
             @"fromInstanceName" : @"fromInstanceName",
             @"isFromAutoSnapshot" : @"isFromAutoSnapshot",
             @"location" : @"location",
             @"name" : @"name",
             @"progress" : @"progress",
             @"resourceType" : @"resourceType",
             @"sizeInGb" : @"sizeInGb",
             @"state" : @"state",
             @"supportCode" : @"supportCode",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSLightsailDiskSnapshotStatePending);
        }
        if ([value caseInsensitiveCompare:@"completed"] == NSOrderedSame) {
            return @(AWSLightsailDiskSnapshotStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"error"] == NSOrderedSame) {
            return @(AWSLightsailDiskSnapshotStateError);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSLightsailDiskSnapshotStateUnknown);
        }
        return @(AWSLightsailDiskSnapshotStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailDiskSnapshotStatePending:
                return @"pending";
            case AWSLightsailDiskSnapshotStateCompleted:
                return @"completed";
            case AWSLightsailDiskSnapshotStateError:
                return @"error";
            case AWSLightsailDiskSnapshotStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailDiskSnapshotInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sizeInGb" : @"sizeInGb",
             };
}

@end

@implementation AWSLightsailDomain

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"domainEntries" : @"domainEntries",
             @"location" : @"location",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             @"supportCode" : @"supportCode",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)domainEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailDomainEntry class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailDomainEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             @"isAlias" : @"isAlias",
             @"name" : @"name",
             @"options" : @"options",
             @"target" : @"target",
             @"types" : @"type",
             };
}

@end

@implementation AWSLightsailDownloadDefaultKeyPairRequest

@end

@implementation AWSLightsailDownloadDefaultKeyPairResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"privateKeyBase64" : @"privateKeyBase64",
             @"publicKeyBase64" : @"publicKeyBase64",
             };
}

@end

@implementation AWSLightsailEnableAddOnRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addOnRequest" : @"addOnRequest",
             @"resourceName" : @"resourceName",
             };
}

+ (NSValueTransformer *)addOnRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailAddOnRequest class]];
}

@end

@implementation AWSLightsailEnableAddOnResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailExportSnapshotRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"destinationInfo" : @"destinationInfo",
             @"location" : @"location",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             @"sourceInfo" : @"sourceInfo",
             @"state" : @"state",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)destinationInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailDestinationInfo class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailExportSnapshotRecordSourceInfo class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Started"] == NSOrderedSame) {
            return @(AWSLightsailRecordStateStarted);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSLightsailRecordStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLightsailRecordStateFailed);
        }
        return @(AWSLightsailRecordStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailRecordStateStarted:
                return @"Started";
            case AWSLightsailRecordStateSucceeded:
                return @"Succeeded";
            case AWSLightsailRecordStateFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailExportSnapshotRecordSourceInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"diskSnapshotInfo" : @"diskSnapshotInfo",
             @"fromResourceArn" : @"fromResourceArn",
             @"fromResourceName" : @"fromResourceName",
             @"instanceSnapshotInfo" : @"instanceSnapshotInfo",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)diskSnapshotInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailDiskSnapshotInfo class]];
}

+ (NSValueTransformer *)instanceSnapshotInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailInstanceSnapshotInfo class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailExportSnapshotRecordSourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailExportSnapshotRecordSourceTypeDiskSnapshot);
        }
        return @(AWSLightsailExportSnapshotRecordSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailExportSnapshotRecordSourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailExportSnapshotRecordSourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailExportSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceSnapshotName" : @"sourceSnapshotName",
             };
}

@end

@implementation AWSLightsailExportSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailGetActiveNamesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetActiveNamesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeNames" : @"activeNames",
             @"nextPageToken" : @"nextPageToken",
             };
}

@end

@implementation AWSLightsailGetAlarmsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmName" : @"alarmName",
             @"monitoredResourceName" : @"monitoredResourceName",
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetAlarmsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarms" : @"alarms",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)alarmsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailAlarm class]];
}

@end

@implementation AWSLightsailGetAutoSnapshotsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceName" : @"resourceName",
             };
}

@end

@implementation AWSLightsailGetAutoSnapshotsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoSnapshots" : @"autoSnapshots",
             @"resourceName" : @"resourceName",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)autoSnapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailAutoSnapshotDetails class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailGetBlueprintsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeInactive" : @"includeInactive",
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetBlueprintsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blueprints" : @"blueprints",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)blueprintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailBlueprint class]];
}

@end

@implementation AWSLightsailGetBundlesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeInactive" : @"includeInactive",
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetBundlesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundles" : @"bundles",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)bundlesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailBundle class]];
}

@end

@implementation AWSLightsailGetCloudFormationStackRecordsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetCloudFormationStackRecordsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFormationStackRecords" : @"cloudFormationStackRecords",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)cloudFormationStackRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailCloudFormationStackRecord class]];
}

@end

@implementation AWSLightsailGetContactMethodsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"protocols" : @"protocols",
             };
}

@end

@implementation AWSLightsailGetContactMethodsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactMethods" : @"contactMethods",
             };
}

+ (NSValueTransformer *)contactMethodsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailContactMethod class]];
}

@end

@implementation AWSLightsailGetDiskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskName" : @"diskName",
             };
}

@end

@implementation AWSLightsailGetDiskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disk" : @"disk",
             };
}

+ (NSValueTransformer *)diskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailDisk class]];
}

@end

@implementation AWSLightsailGetDiskSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskSnapshotName" : @"diskSnapshotName",
             };
}

@end

@implementation AWSLightsailGetDiskSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskSnapshot" : @"diskSnapshot",
             };
}

+ (NSValueTransformer *)diskSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailDiskSnapshot class]];
}

@end

@implementation AWSLightsailGetDiskSnapshotsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetDiskSnapshotsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskSnapshots" : @"diskSnapshots",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)diskSnapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailDiskSnapshot class]];
}

@end

@implementation AWSLightsailGetDisksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetDisksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disks" : @"disks",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)disksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailDisk class]];
}

@end

@implementation AWSLightsailGetDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"domainName",
             };
}

@end

@implementation AWSLightsailGetDomainResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"domain",
             };
}

+ (NSValueTransformer *)domainJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailDomain class]];
}

@end

@implementation AWSLightsailGetDomainsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetDomainsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domains" : @"domains",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)domainsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailDomain class]];
}

@end

@implementation AWSLightsailGetExportSnapshotRecordsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetExportSnapshotRecordsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportSnapshotRecords" : @"exportSnapshotRecords",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)exportSnapshotRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailExportSnapshotRecord class]];
}

@end

@implementation AWSLightsailGetInstanceAccessDetailsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             @"protocols" : @"protocol",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ssh"] == NSOrderedSame) {
            return @(AWSLightsailInstanceAccessProtocolSsh);
        }
        if ([value caseInsensitiveCompare:@"rdp"] == NSOrderedSame) {
            return @(AWSLightsailInstanceAccessProtocolRdp);
        }
        return @(AWSLightsailInstanceAccessProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailInstanceAccessProtocolSsh:
                return @"ssh";
            case AWSLightsailInstanceAccessProtocolRdp:
                return @"rdp";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailGetInstanceAccessDetailsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessDetails" : @"accessDetails",
             };
}

+ (NSValueTransformer *)accessDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailInstanceAccessDetails class]];
}

@end

@implementation AWSLightsailGetInstanceMetricDataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"instanceName" : @"instanceName",
             @"metricName" : @"metricName",
             @"period" : @"period",
             @"startTime" : @"startTime",
             @"statistics" : @"statistics",
             @"unit" : @"unit",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CPUUtilization"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"NetworkIn"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameNetworkIn);
        }
        if ([value caseInsensitiveCompare:@"NetworkOut"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameNetworkOut);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameStatusCheckFailed);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed_Instance"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameStatusCheckFailedInstance);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed_System"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameStatusCheckFailedSystem);
        }
        return @(AWSLightsailInstanceMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailInstanceMetricNameCPUUtilization:
                return @"CPUUtilization";
            case AWSLightsailInstanceMetricNameNetworkIn:
                return @"NetworkIn";
            case AWSLightsailInstanceMetricNameNetworkOut:
                return @"NetworkOut";
            case AWSLightsailInstanceMetricNameStatusCheckFailed:
                return @"StatusCheckFailed";
            case AWSLightsailInstanceMetricNameStatusCheckFailedInstance:
                return @"StatusCheckFailed_Instance";
            case AWSLightsailInstanceMetricNameStatusCheckFailedSystem:
                return @"StatusCheckFailed_System";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitNone);
        }
        return @(AWSLightsailMetricUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailMetricUnitSeconds:
                return @"Seconds";
            case AWSLightsailMetricUnitMicroseconds:
                return @"Microseconds";
            case AWSLightsailMetricUnitMilliseconds:
                return @"Milliseconds";
            case AWSLightsailMetricUnitBytes:
                return @"Bytes";
            case AWSLightsailMetricUnitKilobytes:
                return @"Kilobytes";
            case AWSLightsailMetricUnitMegabytes:
                return @"Megabytes";
            case AWSLightsailMetricUnitGigabytes:
                return @"Gigabytes";
            case AWSLightsailMetricUnitTerabytes:
                return @"Terabytes";
            case AWSLightsailMetricUnitBits:
                return @"Bits";
            case AWSLightsailMetricUnitKilobits:
                return @"Kilobits";
            case AWSLightsailMetricUnitMegabits:
                return @"Megabits";
            case AWSLightsailMetricUnitGigabits:
                return @"Gigabits";
            case AWSLightsailMetricUnitTerabits:
                return @"Terabits";
            case AWSLightsailMetricUnitPercent:
                return @"Percent";
            case AWSLightsailMetricUnitCount:
                return @"Count";
            case AWSLightsailMetricUnitBytesSecond:
                return @"Bytes/Second";
            case AWSLightsailMetricUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSLightsailMetricUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSLightsailMetricUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSLightsailMetricUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSLightsailMetricUnitBitsSecond:
                return @"Bits/Second";
            case AWSLightsailMetricUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSLightsailMetricUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSLightsailMetricUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSLightsailMetricUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSLightsailMetricUnitCountSecond:
                return @"Count/Second";
            case AWSLightsailMetricUnitNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailGetInstanceMetricDataResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricData" : @"metricData",
             @"metricName" : @"metricName",
             };
}

+ (NSValueTransformer *)metricDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailMetricDatapoint class]];
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CPUUtilization"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"NetworkIn"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameNetworkIn);
        }
        if ([value caseInsensitiveCompare:@"NetworkOut"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameNetworkOut);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameStatusCheckFailed);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed_Instance"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameStatusCheckFailedInstance);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed_System"] == NSOrderedSame) {
            return @(AWSLightsailInstanceMetricNameStatusCheckFailedSystem);
        }
        return @(AWSLightsailInstanceMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailInstanceMetricNameCPUUtilization:
                return @"CPUUtilization";
            case AWSLightsailInstanceMetricNameNetworkIn:
                return @"NetworkIn";
            case AWSLightsailInstanceMetricNameNetworkOut:
                return @"NetworkOut";
            case AWSLightsailInstanceMetricNameStatusCheckFailed:
                return @"StatusCheckFailed";
            case AWSLightsailInstanceMetricNameStatusCheckFailedInstance:
                return @"StatusCheckFailed_Instance";
            case AWSLightsailInstanceMetricNameStatusCheckFailedSystem:
                return @"StatusCheckFailed_System";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailGetInstancePortStatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSLightsailGetInstancePortStatesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portStates" : @"portStates",
             };
}

+ (NSValueTransformer *)portStatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailInstancePortState class]];
}

@end

@implementation AWSLightsailGetInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSLightsailGetInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instance" : @"instance",
             };
}

+ (NSValueTransformer *)instanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailInstance class]];
}

@end

@implementation AWSLightsailGetInstanceSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceSnapshotName" : @"instanceSnapshotName",
             };
}

@end

@implementation AWSLightsailGetInstanceSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceSnapshot" : @"instanceSnapshot",
             };
}

+ (NSValueTransformer *)instanceSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailInstanceSnapshot class]];
}

@end

@implementation AWSLightsailGetInstanceSnapshotsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetInstanceSnapshotsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceSnapshots" : @"instanceSnapshots",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)instanceSnapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailInstanceSnapshot class]];
}

@end

@implementation AWSLightsailGetInstanceStateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSLightsailGetInstanceStateResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"state",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailInstanceState class]];
}

@end

@implementation AWSLightsailGetInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"instances",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailInstance class]];
}

@end

@implementation AWSLightsailGetKeyPairRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPairName" : @"keyPairName",
             };
}

@end

@implementation AWSLightsailGetKeyPairResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPair" : @"keyPair",
             };
}

+ (NSValueTransformer *)keyPairJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailKeyPair class]];
}

@end

@implementation AWSLightsailGetKeyPairsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetKeyPairsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPairs" : @"keyPairs",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)keyPairsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailKeyPair class]];
}

@end

@implementation AWSLightsailGetLoadBalancerMetricDataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"loadBalancerName" : @"loadBalancerName",
             @"metricName" : @"metricName",
             @"period" : @"period",
             @"startTime" : @"startTime",
             @"statistics" : @"statistics",
             @"unit" : @"unit",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ClientTLSNegotiationErrorCount"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameClientTLSNegotiationErrorCount);
        }
        if ([value caseInsensitiveCompare:@"HealthyHostCount"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHealthyHostCount);
        }
        if ([value caseInsensitiveCompare:@"UnhealthyHostCount"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameUnhealthyHostCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_LB_4XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeLB4XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_LB_5XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeLB5XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_2XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeInstance2XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_3XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeInstance3XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_4XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeInstance4XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_5XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeInstance5XXCount);
        }
        if ([value caseInsensitiveCompare:@"InstanceResponseTime"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameInstanceResponseTime);
        }
        if ([value caseInsensitiveCompare:@"RejectedConnectionCount"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameRejectedConnectionCount);
        }
        if ([value caseInsensitiveCompare:@"RequestCount"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameRequestCount);
        }
        return @(AWSLightsailLoadBalancerMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailLoadBalancerMetricNameClientTLSNegotiationErrorCount:
                return @"ClientTLSNegotiationErrorCount";
            case AWSLightsailLoadBalancerMetricNameHealthyHostCount:
                return @"HealthyHostCount";
            case AWSLightsailLoadBalancerMetricNameUnhealthyHostCount:
                return @"UnhealthyHostCount";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeLB4XXCount:
                return @"HTTPCode_LB_4XX_Count";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeLB5XXCount:
                return @"HTTPCode_LB_5XX_Count";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeInstance2XXCount:
                return @"HTTPCode_Instance_2XX_Count";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeInstance3XXCount:
                return @"HTTPCode_Instance_3XX_Count";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeInstance4XXCount:
                return @"HTTPCode_Instance_4XX_Count";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeInstance5XXCount:
                return @"HTTPCode_Instance_5XX_Count";
            case AWSLightsailLoadBalancerMetricNameInstanceResponseTime:
                return @"InstanceResponseTime";
            case AWSLightsailLoadBalancerMetricNameRejectedConnectionCount:
                return @"RejectedConnectionCount";
            case AWSLightsailLoadBalancerMetricNameRequestCount:
                return @"RequestCount";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitNone);
        }
        return @(AWSLightsailMetricUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailMetricUnitSeconds:
                return @"Seconds";
            case AWSLightsailMetricUnitMicroseconds:
                return @"Microseconds";
            case AWSLightsailMetricUnitMilliseconds:
                return @"Milliseconds";
            case AWSLightsailMetricUnitBytes:
                return @"Bytes";
            case AWSLightsailMetricUnitKilobytes:
                return @"Kilobytes";
            case AWSLightsailMetricUnitMegabytes:
                return @"Megabytes";
            case AWSLightsailMetricUnitGigabytes:
                return @"Gigabytes";
            case AWSLightsailMetricUnitTerabytes:
                return @"Terabytes";
            case AWSLightsailMetricUnitBits:
                return @"Bits";
            case AWSLightsailMetricUnitKilobits:
                return @"Kilobits";
            case AWSLightsailMetricUnitMegabits:
                return @"Megabits";
            case AWSLightsailMetricUnitGigabits:
                return @"Gigabits";
            case AWSLightsailMetricUnitTerabits:
                return @"Terabits";
            case AWSLightsailMetricUnitPercent:
                return @"Percent";
            case AWSLightsailMetricUnitCount:
                return @"Count";
            case AWSLightsailMetricUnitBytesSecond:
                return @"Bytes/Second";
            case AWSLightsailMetricUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSLightsailMetricUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSLightsailMetricUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSLightsailMetricUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSLightsailMetricUnitBitsSecond:
                return @"Bits/Second";
            case AWSLightsailMetricUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSLightsailMetricUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSLightsailMetricUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSLightsailMetricUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSLightsailMetricUnitCountSecond:
                return @"Count/Second";
            case AWSLightsailMetricUnitNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailGetLoadBalancerMetricDataResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricData" : @"metricData",
             @"metricName" : @"metricName",
             };
}

+ (NSValueTransformer *)metricDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailMetricDatapoint class]];
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ClientTLSNegotiationErrorCount"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameClientTLSNegotiationErrorCount);
        }
        if ([value caseInsensitiveCompare:@"HealthyHostCount"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHealthyHostCount);
        }
        if ([value caseInsensitiveCompare:@"UnhealthyHostCount"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameUnhealthyHostCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_LB_4XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeLB4XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_LB_5XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeLB5XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_2XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeInstance2XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_3XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeInstance3XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_4XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeInstance4XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_5XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameHTTPCodeInstance5XXCount);
        }
        if ([value caseInsensitiveCompare:@"InstanceResponseTime"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameInstanceResponseTime);
        }
        if ([value caseInsensitiveCompare:@"RejectedConnectionCount"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameRejectedConnectionCount);
        }
        if ([value caseInsensitiveCompare:@"RequestCount"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerMetricNameRequestCount);
        }
        return @(AWSLightsailLoadBalancerMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailLoadBalancerMetricNameClientTLSNegotiationErrorCount:
                return @"ClientTLSNegotiationErrorCount";
            case AWSLightsailLoadBalancerMetricNameHealthyHostCount:
                return @"HealthyHostCount";
            case AWSLightsailLoadBalancerMetricNameUnhealthyHostCount:
                return @"UnhealthyHostCount";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeLB4XXCount:
                return @"HTTPCode_LB_4XX_Count";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeLB5XXCount:
                return @"HTTPCode_LB_5XX_Count";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeInstance2XXCount:
                return @"HTTPCode_Instance_2XX_Count";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeInstance3XXCount:
                return @"HTTPCode_Instance_3XX_Count";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeInstance4XXCount:
                return @"HTTPCode_Instance_4XX_Count";
            case AWSLightsailLoadBalancerMetricNameHTTPCodeInstance5XXCount:
                return @"HTTPCode_Instance_5XX_Count";
            case AWSLightsailLoadBalancerMetricNameInstanceResponseTime:
                return @"InstanceResponseTime";
            case AWSLightsailLoadBalancerMetricNameRejectedConnectionCount:
                return @"RejectedConnectionCount";
            case AWSLightsailLoadBalancerMetricNameRequestCount:
                return @"RequestCount";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailGetLoadBalancerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"loadBalancerName",
             };
}

@end

@implementation AWSLightsailGetLoadBalancerResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancer" : @"loadBalancer",
             };
}

+ (NSValueTransformer *)loadBalancerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailLoadBalancer class]];
}

@end

@implementation AWSLightsailGetLoadBalancerTlsCertificatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"loadBalancerName",
             };
}

@end

@implementation AWSLightsailGetLoadBalancerTlsCertificatesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tlsCertificates" : @"tlsCertificates",
             };
}

+ (NSValueTransformer *)tlsCertificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailLoadBalancerTlsCertificate class]];
}

@end

@implementation AWSLightsailGetLoadBalancersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetLoadBalancersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancers" : @"loadBalancers",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)loadBalancersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailLoadBalancer class]];
}

@end

@implementation AWSLightsailGetOperationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"operationId",
             };
}

@end

@implementation AWSLightsailGetOperationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailGetOperationsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             @"resourceName" : @"resourceName",
             };
}

@end

@implementation AWSLightsailGetOperationsForResourceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageCount" : @"nextPageCount",
             @"nextPageToken" : @"nextPageToken",
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailGetOperationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetOperationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"nextPageToken",
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailGetRegionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeAvailabilityZones" : @"includeAvailabilityZones",
             @"includeRelationalDatabaseAvailabilityZones" : @"includeRelationalDatabaseAvailabilityZones",
             };
}

@end

@implementation AWSLightsailGetRegionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regions" : @"regions",
             };
}

+ (NSValueTransformer *)regionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailRegion class]];
}

@end

@implementation AWSLightsailGetRelationalDatabaseBlueprintsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetRelationalDatabaseBlueprintsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blueprints" : @"blueprints",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)blueprintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailRelationalDatabaseBlueprint class]];
}

@end

@implementation AWSLightsailGetRelationalDatabaseBundlesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetRelationalDatabaseBundlesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundles" : @"bundles",
             @"nextPageToken" : @"nextPageToken",
             };
}

+ (NSValueTransformer *)bundlesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailRelationalDatabaseBundle class]];
}

@end

@implementation AWSLightsailGetRelationalDatabaseEventsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInMinutes" : @"durationInMinutes",
             @"pageToken" : @"pageToken",
             @"relationalDatabaseName" : @"relationalDatabaseName",
             };
}

@end

@implementation AWSLightsailGetRelationalDatabaseEventsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"nextPageToken",
             @"relationalDatabaseEvents" : @"relationalDatabaseEvents",
             };
}

+ (NSValueTransformer *)relationalDatabaseEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailRelationalDatabaseEvent class]];
}

@end

@implementation AWSLightsailGetRelationalDatabaseLogEventsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"logStreamName" : @"logStreamName",
             @"pageToken" : @"pageToken",
             @"relationalDatabaseName" : @"relationalDatabaseName",
             @"startFromHead" : @"startFromHead",
             @"startTime" : @"startTime",
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

@end

@implementation AWSLightsailGetRelationalDatabaseLogEventsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextBackwardToken" : @"nextBackwardToken",
             @"nextForwardToken" : @"nextForwardToken",
             @"resourceLogEvents" : @"resourceLogEvents",
             };
}

+ (NSValueTransformer *)resourceLogEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailLogEvent class]];
}

@end

@implementation AWSLightsailGetRelationalDatabaseLogStreamsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relationalDatabaseName" : @"relationalDatabaseName",
             };
}

@end

@implementation AWSLightsailGetRelationalDatabaseLogStreamsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logStreams" : @"logStreams",
             };
}

@end

@implementation AWSLightsailGetRelationalDatabaseMasterUserPasswordRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordVersion" : @"passwordVersion",
             @"relationalDatabaseName" : @"relationalDatabaseName",
             };
}

+ (NSValueTransformer *)passwordVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CURRENT"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabasePasswordVersionCurrent);
        }
        if ([value caseInsensitiveCompare:@"PREVIOUS"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabasePasswordVersionPrevious);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabasePasswordVersionPending);
        }
        return @(AWSLightsailRelationalDatabasePasswordVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailRelationalDatabasePasswordVersionCurrent:
                return @"CURRENT";
            case AWSLightsailRelationalDatabasePasswordVersionPrevious:
                return @"PREVIOUS";
            case AWSLightsailRelationalDatabasePasswordVersionPending:
                return @"PENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailGetRelationalDatabaseMasterUserPasswordResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"createdAt",
             @"masterUserPassword" : @"masterUserPassword",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLightsailGetRelationalDatabaseMetricDataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"metricName" : @"metricName",
             @"period" : @"period",
             @"relationalDatabaseName" : @"relationalDatabaseName",
             @"startTime" : @"startTime",
             @"statistics" : @"statistics",
             @"unit" : @"unit",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CPUUtilization"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"DatabaseConnections"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameDatabaseConnections);
        }
        if ([value caseInsensitiveCompare:@"DiskQueueDepth"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameDiskQueueDepth);
        }
        if ([value caseInsensitiveCompare:@"FreeStorageSpace"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameFreeStorageSpace);
        }
        if ([value caseInsensitiveCompare:@"NetworkReceiveThroughput"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameNetworkReceiveThroughput);
        }
        if ([value caseInsensitiveCompare:@"NetworkTransmitThroughput"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameNetworkTransmitThroughput);
        }
        return @(AWSLightsailRelationalDatabaseMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailRelationalDatabaseMetricNameCPUUtilization:
                return @"CPUUtilization";
            case AWSLightsailRelationalDatabaseMetricNameDatabaseConnections:
                return @"DatabaseConnections";
            case AWSLightsailRelationalDatabaseMetricNameDiskQueueDepth:
                return @"DiskQueueDepth";
            case AWSLightsailRelationalDatabaseMetricNameFreeStorageSpace:
                return @"FreeStorageSpace";
            case AWSLightsailRelationalDatabaseMetricNameNetworkReceiveThroughput:
                return @"NetworkReceiveThroughput";
            case AWSLightsailRelationalDatabaseMetricNameNetworkTransmitThroughput:
                return @"NetworkTransmitThroughput";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitNone);
        }
        return @(AWSLightsailMetricUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailMetricUnitSeconds:
                return @"Seconds";
            case AWSLightsailMetricUnitMicroseconds:
                return @"Microseconds";
            case AWSLightsailMetricUnitMilliseconds:
                return @"Milliseconds";
            case AWSLightsailMetricUnitBytes:
                return @"Bytes";
            case AWSLightsailMetricUnitKilobytes:
                return @"Kilobytes";
            case AWSLightsailMetricUnitMegabytes:
                return @"Megabytes";
            case AWSLightsailMetricUnitGigabytes:
                return @"Gigabytes";
            case AWSLightsailMetricUnitTerabytes:
                return @"Terabytes";
            case AWSLightsailMetricUnitBits:
                return @"Bits";
            case AWSLightsailMetricUnitKilobits:
                return @"Kilobits";
            case AWSLightsailMetricUnitMegabits:
                return @"Megabits";
            case AWSLightsailMetricUnitGigabits:
                return @"Gigabits";
            case AWSLightsailMetricUnitTerabits:
                return @"Terabits";
            case AWSLightsailMetricUnitPercent:
                return @"Percent";
            case AWSLightsailMetricUnitCount:
                return @"Count";
            case AWSLightsailMetricUnitBytesSecond:
                return @"Bytes/Second";
            case AWSLightsailMetricUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSLightsailMetricUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSLightsailMetricUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSLightsailMetricUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSLightsailMetricUnitBitsSecond:
                return @"Bits/Second";
            case AWSLightsailMetricUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSLightsailMetricUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSLightsailMetricUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSLightsailMetricUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSLightsailMetricUnitCountSecond:
                return @"Count/Second";
            case AWSLightsailMetricUnitNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailGetRelationalDatabaseMetricDataResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricData" : @"metricData",
             @"metricName" : @"metricName",
             };
}

+ (NSValueTransformer *)metricDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailMetricDatapoint class]];
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CPUUtilization"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"DatabaseConnections"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameDatabaseConnections);
        }
        if ([value caseInsensitiveCompare:@"DiskQueueDepth"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameDiskQueueDepth);
        }
        if ([value caseInsensitiveCompare:@"FreeStorageSpace"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameFreeStorageSpace);
        }
        if ([value caseInsensitiveCompare:@"NetworkReceiveThroughput"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameNetworkReceiveThroughput);
        }
        if ([value caseInsensitiveCompare:@"NetworkTransmitThroughput"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseMetricNameNetworkTransmitThroughput);
        }
        return @(AWSLightsailRelationalDatabaseMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailRelationalDatabaseMetricNameCPUUtilization:
                return @"CPUUtilization";
            case AWSLightsailRelationalDatabaseMetricNameDatabaseConnections:
                return @"DatabaseConnections";
            case AWSLightsailRelationalDatabaseMetricNameDiskQueueDepth:
                return @"DiskQueueDepth";
            case AWSLightsailRelationalDatabaseMetricNameFreeStorageSpace:
                return @"FreeStorageSpace";
            case AWSLightsailRelationalDatabaseMetricNameNetworkReceiveThroughput:
                return @"NetworkReceiveThroughput";
            case AWSLightsailRelationalDatabaseMetricNameNetworkTransmitThroughput:
                return @"NetworkTransmitThroughput";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailGetRelationalDatabaseParametersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             @"relationalDatabaseName" : @"relationalDatabaseName",
             };
}

@end

@implementation AWSLightsailGetRelationalDatabaseParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"nextPageToken",
             @"parameters" : @"parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailRelationalDatabaseParameter class]];
}

@end

@implementation AWSLightsailGetRelationalDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relationalDatabaseName" : @"relationalDatabaseName",
             };
}

@end

@implementation AWSLightsailGetRelationalDatabaseResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relationalDatabase" : @"relationalDatabase",
             };
}

+ (NSValueTransformer *)relationalDatabaseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailRelationalDatabase class]];
}

@end

@implementation AWSLightsailGetRelationalDatabaseSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relationalDatabaseSnapshotName" : @"relationalDatabaseSnapshotName",
             };
}

@end

@implementation AWSLightsailGetRelationalDatabaseSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relationalDatabaseSnapshot" : @"relationalDatabaseSnapshot",
             };
}

+ (NSValueTransformer *)relationalDatabaseSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailRelationalDatabaseSnapshot class]];
}

@end

@implementation AWSLightsailGetRelationalDatabaseSnapshotsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetRelationalDatabaseSnapshotsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"nextPageToken",
             @"relationalDatabaseSnapshots" : @"relationalDatabaseSnapshots",
             };
}

+ (NSValueTransformer *)relationalDatabaseSnapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailRelationalDatabaseSnapshot class]];
}

@end

@implementation AWSLightsailGetRelationalDatabasesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetRelationalDatabasesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"nextPageToken",
             @"relationalDatabases" : @"relationalDatabases",
             };
}

+ (NSValueTransformer *)relationalDatabasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailRelationalDatabase class]];
}

@end

@implementation AWSLightsailGetStaticIpRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"staticIpName" : @"staticIpName",
             };
}

@end

@implementation AWSLightsailGetStaticIpResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"staticIp" : @"staticIp",
             };
}

+ (NSValueTransformer *)staticIpJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailStaticIp class]];
}

@end

@implementation AWSLightsailGetStaticIpsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"pageToken",
             };
}

@end

@implementation AWSLightsailGetStaticIpsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"nextPageToken",
             @"staticIps" : @"staticIps",
             };
}

+ (NSValueTransformer *)staticIpsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailStaticIp class]];
}

@end

@implementation AWSLightsailHostKeyAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithm" : @"algorithm",
             @"fingerprintSHA1" : @"fingerprintSHA1",
             @"fingerprintSHA256" : @"fingerprintSHA256",
             @"notValidAfter" : @"notValidAfter",
             @"notValidBefore" : @"notValidBefore",
             @"publicKey" : @"publicKey",
             @"witnessedAt" : @"witnessedAt",
             };
}

+ (NSValueTransformer *)notValidAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notValidBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)witnessedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLightsailImportKeyPairRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPairName" : @"keyPairName",
             @"publicKeyBase64" : @"publicKeyBase64",
             };
}

@end

@implementation AWSLightsailImportKeyPairResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addOns" : @"addOns",
             @"arn" : @"arn",
             @"blueprintId" : @"blueprintId",
             @"blueprintName" : @"blueprintName",
             @"bundleId" : @"bundleId",
             @"createdAt" : @"createdAt",
             @"hardware" : @"hardware",
             @"ipv6Address" : @"ipv6Address",
             @"isStaticIp" : @"isStaticIp",
             @"location" : @"location",
             @"name" : @"name",
             @"networking" : @"networking",
             @"privateIpAddress" : @"privateIpAddress",
             @"publicIpAddress" : @"publicIpAddress",
             @"resourceType" : @"resourceType",
             @"sshKeyName" : @"sshKeyName",
             @"state" : @"state",
             @"supportCode" : @"supportCode",
             @"tags" : @"tags",
             @"username" : @"username",
             };
}

+ (NSValueTransformer *)addOnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailAddOn class]];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)hardwareJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailInstanceHardware class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)networkingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailInstanceNetworking class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailInstanceState class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailInstanceAccessDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certKey" : @"certKey",
             @"expiresAt" : @"expiresAt",
             @"hostKeys" : @"hostKeys",
             @"instanceName" : @"instanceName",
             @"ipAddress" : @"ipAddress",
             @"password" : @"password",
             @"passwordData" : @"passwordData",
             @"privateKey" : @"privateKey",
             @"protocols" : @"protocol",
             @"username" : @"username",
             };
}

+ (NSValueTransformer *)expiresAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)hostKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailHostKeyAttributes class]];
}

+ (NSValueTransformer *)passwordDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailPasswordData class]];
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ssh"] == NSOrderedSame) {
            return @(AWSLightsailInstanceAccessProtocolSsh);
        }
        if ([value caseInsensitiveCompare:@"rdp"] == NSOrderedSame) {
            return @(AWSLightsailInstanceAccessProtocolRdp);
        }
        return @(AWSLightsailInstanceAccessProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailInstanceAccessProtocolSsh:
                return @"ssh";
            case AWSLightsailInstanceAccessProtocolRdp:
                return @"rdp";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailInstanceEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"availabilityZone",
             @"instanceType" : @"instanceType",
             @"portInfoSource" : @"portInfoSource",
             @"sourceName" : @"sourceName",
             @"userData" : @"userData",
             };
}

+ (NSValueTransformer *)portInfoSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSLightsailPortInfoSourceTypeDefault);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE"] == NSOrderedSame) {
            return @(AWSLightsailPortInfoSourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSLightsailPortInfoSourceTypeNone);
        }
        if ([value caseInsensitiveCompare:@"CLOSED"] == NSOrderedSame) {
            return @(AWSLightsailPortInfoSourceTypeClosed);
        }
        return @(AWSLightsailPortInfoSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailPortInfoSourceTypeDefault:
                return @"DEFAULT";
            case AWSLightsailPortInfoSourceTypeInstance:
                return @"INSTANCE";
            case AWSLightsailPortInfoSourceTypeNone:
                return @"NONE";
            case AWSLightsailPortInfoSourceTypeClosed:
                return @"CLOSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailInstanceHardware

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cpuCount" : @"cpuCount",
             @"disks" : @"disks",
             @"ramSizeInGb" : @"ramSizeInGb",
             };
}

+ (NSValueTransformer *)disksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailDisk class]];
}

@end

@implementation AWSLightsailInstanceHealthSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceHealth" : @"instanceHealth",
             @"instanceHealthReason" : @"instanceHealthReason",
             @"instanceName" : @"instanceName",
             };
}

+ (NSValueTransformer *)instanceHealthJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"initial"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthStateInitial);
        }
        if ([value caseInsensitiveCompare:@"healthy"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthStateHealthy);
        }
        if ([value caseInsensitiveCompare:@"unhealthy"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthStateUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"unused"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthStateUnused);
        }
        if ([value caseInsensitiveCompare:@"draining"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthStateDraining);
        }
        if ([value caseInsensitiveCompare:@"unavailable"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthStateUnavailable);
        }
        return @(AWSLightsailInstanceHealthStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailInstanceHealthStateInitial:
                return @"initial";
            case AWSLightsailInstanceHealthStateHealthy:
                return @"healthy";
            case AWSLightsailInstanceHealthStateUnhealthy:
                return @"unhealthy";
            case AWSLightsailInstanceHealthStateUnused:
                return @"unused";
            case AWSLightsailInstanceHealthStateDraining:
                return @"draining";
            case AWSLightsailInstanceHealthStateUnavailable:
                return @"unavailable";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceHealthReasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Lb.RegistrationInProgress"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthReasonLbRegistrationInProgress);
        }
        if ([value caseInsensitiveCompare:@"Lb.InitialHealthChecking"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthReasonLbInitialHealthChecking);
        }
        if ([value caseInsensitiveCompare:@"Lb.InternalError"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthReasonLbInternalError);
        }
        if ([value caseInsensitiveCompare:@"Instance.ResponseCodeMismatch"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthReasonInstanceResponseCodeMismatch);
        }
        if ([value caseInsensitiveCompare:@"Instance.Timeout"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthReasonInstanceTimeout);
        }
        if ([value caseInsensitiveCompare:@"Instance.FailedHealthChecks"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthReasonInstanceFailedHealthChecks);
        }
        if ([value caseInsensitiveCompare:@"Instance.NotRegistered"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthReasonInstanceNotRegistered);
        }
        if ([value caseInsensitiveCompare:@"Instance.NotInUse"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthReasonInstanceNotInUse);
        }
        if ([value caseInsensitiveCompare:@"Instance.DeregistrationInProgress"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthReasonInstanceDeregistrationInProgress);
        }
        if ([value caseInsensitiveCompare:@"Instance.InvalidState"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthReasonInstanceInvalidState);
        }
        if ([value caseInsensitiveCompare:@"Instance.IpUnusable"] == NSOrderedSame) {
            return @(AWSLightsailInstanceHealthReasonInstanceIpUnusable);
        }
        return @(AWSLightsailInstanceHealthReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailInstanceHealthReasonLbRegistrationInProgress:
                return @"Lb.RegistrationInProgress";
            case AWSLightsailInstanceHealthReasonLbInitialHealthChecking:
                return @"Lb.InitialHealthChecking";
            case AWSLightsailInstanceHealthReasonLbInternalError:
                return @"Lb.InternalError";
            case AWSLightsailInstanceHealthReasonInstanceResponseCodeMismatch:
                return @"Instance.ResponseCodeMismatch";
            case AWSLightsailInstanceHealthReasonInstanceTimeout:
                return @"Instance.Timeout";
            case AWSLightsailInstanceHealthReasonInstanceFailedHealthChecks:
                return @"Instance.FailedHealthChecks";
            case AWSLightsailInstanceHealthReasonInstanceNotRegistered:
                return @"Instance.NotRegistered";
            case AWSLightsailInstanceHealthReasonInstanceNotInUse:
                return @"Instance.NotInUse";
            case AWSLightsailInstanceHealthReasonInstanceDeregistrationInProgress:
                return @"Instance.DeregistrationInProgress";
            case AWSLightsailInstanceHealthReasonInstanceInvalidState:
                return @"Instance.InvalidState";
            case AWSLightsailInstanceHealthReasonInstanceIpUnusable:
                return @"Instance.IpUnusable";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailInstanceNetworking

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monthlyTransfer" : @"monthlyTransfer",
             @"ports" : @"ports",
             };
}

+ (NSValueTransformer *)monthlyTransferJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailMonthlyTransfer class]];
}

+ (NSValueTransformer *)portsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailInstancePortInfo class]];
}

@end

@implementation AWSLightsailInstancePortInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessDirection" : @"accessDirection",
             @"accessFrom" : @"accessFrom",
             @"accessType" : @"accessType",
             @"cidrListAliases" : @"cidrListAliases",
             @"cidrs" : @"cidrs",
             @"commonName" : @"commonName",
             @"fromPort" : @"fromPort",
             @"protocols" : @"protocol",
             @"toPort" : @"toPort",
             };
}

+ (NSValueTransformer *)accessDirectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"inbound"] == NSOrderedSame) {
            return @(AWSLightsailAccessDirectionInbound);
        }
        if ([value caseInsensitiveCompare:@"outbound"] == NSOrderedSame) {
            return @(AWSLightsailAccessDirectionOutbound);
        }
        return @(AWSLightsailAccessDirectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailAccessDirectionInbound:
                return @"inbound";
            case AWSLightsailAccessDirectionOutbound:
                return @"outbound";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)accessTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Public"] == NSOrderedSame) {
            return @(AWSLightsailPortAccessTypePublic);
        }
        if ([value caseInsensitiveCompare:@"Private"] == NSOrderedSame) {
            return @(AWSLightsailPortAccessTypePrivate);
        }
        return @(AWSLightsailPortAccessTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailPortAccessTypePublic:
                return @"Public";
            case AWSLightsailPortAccessTypePrivate:
                return @"Private";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"tcp"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolTcp);
        }
        if ([value caseInsensitiveCompare:@"all"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolAll);
        }
        if ([value caseInsensitiveCompare:@"udp"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolUdp);
        }
        if ([value caseInsensitiveCompare:@"icmp"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolIcmp);
        }
        return @(AWSLightsailNetworkProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailNetworkProtocolTcp:
                return @"tcp";
            case AWSLightsailNetworkProtocolAll:
                return @"all";
            case AWSLightsailNetworkProtocolUdp:
                return @"udp";
            case AWSLightsailNetworkProtocolIcmp:
                return @"icmp";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailInstancePortState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrListAliases" : @"cidrListAliases",
             @"cidrs" : @"cidrs",
             @"fromPort" : @"fromPort",
             @"protocols" : @"protocol",
             @"state" : @"state",
             @"toPort" : @"toPort",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"tcp"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolTcp);
        }
        if ([value caseInsensitiveCompare:@"all"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolAll);
        }
        if ([value caseInsensitiveCompare:@"udp"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolUdp);
        }
        if ([value caseInsensitiveCompare:@"icmp"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolIcmp);
        }
        return @(AWSLightsailNetworkProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailNetworkProtocolTcp:
                return @"tcp";
            case AWSLightsailNetworkProtocolAll:
                return @"all";
            case AWSLightsailNetworkProtocolUdp:
                return @"udp";
            case AWSLightsailNetworkProtocolIcmp:
                return @"icmp";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"open"] == NSOrderedSame) {
            return @(AWSLightsailPortStateOpen);
        }
        if ([value caseInsensitiveCompare:@"closed"] == NSOrderedSame) {
            return @(AWSLightsailPortStateClosed);
        }
        return @(AWSLightsailPortStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailPortStateOpen:
                return @"open";
            case AWSLightsailPortStateClosed:
                return @"closed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailInstanceSnapshot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"fromAttachedDisks" : @"fromAttachedDisks",
             @"fromBlueprintId" : @"fromBlueprintId",
             @"fromBundleId" : @"fromBundleId",
             @"fromInstanceArn" : @"fromInstanceArn",
             @"fromInstanceName" : @"fromInstanceName",
             @"isFromAutoSnapshot" : @"isFromAutoSnapshot",
             @"location" : @"location",
             @"name" : @"name",
             @"progress" : @"progress",
             @"resourceType" : @"resourceType",
             @"sizeInGb" : @"sizeInGb",
             @"state" : @"state",
             @"supportCode" : @"supportCode",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)fromAttachedDisksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailDisk class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSLightsailInstanceSnapshotStatePending);
        }
        if ([value caseInsensitiveCompare:@"error"] == NSOrderedSame) {
            return @(AWSLightsailInstanceSnapshotStateError);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSLightsailInstanceSnapshotStateAvailable);
        }
        return @(AWSLightsailInstanceSnapshotStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailInstanceSnapshotStatePending:
                return @"pending";
            case AWSLightsailInstanceSnapshotStateError:
                return @"error";
            case AWSLightsailInstanceSnapshotStateAvailable:
                return @"available";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailInstanceSnapshotInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fromBlueprintId" : @"fromBlueprintId",
             @"fromBundleId" : @"fromBundleId",
             @"fromDiskInfo" : @"fromDiskInfo",
             };
}

+ (NSValueTransformer *)fromDiskInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailDiskInfo class]];
}

@end

@implementation AWSLightsailInstanceState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"name" : @"name",
             };
}

@end

@implementation AWSLightsailIsVpcPeeredRequest

@end

@implementation AWSLightsailIsVpcPeeredResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isPeered" : @"isPeered",
             };
}

@end

@implementation AWSLightsailKeyPair

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"fingerprint" : @"fingerprint",
             @"location" : @"location",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             @"supportCode" : @"supportCode",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailLoadBalancer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"configurationOptions" : @"configurationOptions",
             @"createdAt" : @"createdAt",
             @"dnsName" : @"dnsName",
             @"healthCheckPath" : @"healthCheckPath",
             @"instanceHealthSummary" : @"instanceHealthSummary",
             @"instancePort" : @"instancePort",
             @"location" : @"location",
             @"name" : @"name",
             @"protocols" : @"protocol",
             @"publicPorts" : @"publicPorts",
             @"resourceType" : @"resourceType",
             @"state" : @"state",
             @"supportCode" : @"supportCode",
             @"tags" : @"tags",
             @"tlsCertificateSummaries" : @"tlsCertificateSummaries",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)instanceHealthSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailInstanceHealthSummary class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP_HTTPS"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerProtocolHttpHttps);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerProtocolHttp);
        }
        return @(AWSLightsailLoadBalancerProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailLoadBalancerProtocolHttpHttps:
                return @"HTTP_HTTPS";
            case AWSLightsailLoadBalancerProtocolHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerStateActive);
        }
        if ([value caseInsensitiveCompare:@"provisioning"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerStateProvisioning);
        }
        if ([value caseInsensitiveCompare:@"active_impaired"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerStateActiveImpaired);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerStateFailed);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerStateUnknown);
        }
        return @(AWSLightsailLoadBalancerStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailLoadBalancerStateActive:
                return @"active";
            case AWSLightsailLoadBalancerStateProvisioning:
                return @"provisioning";
            case AWSLightsailLoadBalancerStateActiveImpaired:
                return @"active_impaired";
            case AWSLightsailLoadBalancerStateFailed:
                return @"failed";
            case AWSLightsailLoadBalancerStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

+ (NSValueTransformer *)tlsCertificateSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailLoadBalancerTlsCertificateSummary class]];
}

@end

@implementation AWSLightsailLoadBalancerTlsCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"domainName" : @"domainName",
             @"domainValidationRecords" : @"domainValidationRecords",
             @"failureReason" : @"failureReason",
             @"isAttached" : @"isAttached",
             @"issuedAt" : @"issuedAt",
             @"issuer" : @"issuer",
             @"keyAlgorithm" : @"keyAlgorithm",
             @"loadBalancerName" : @"loadBalancerName",
             @"location" : @"location",
             @"name" : @"name",
             @"notAfter" : @"notAfter",
             @"notBefore" : @"notBefore",
             @"renewalSummary" : @"renewalSummary",
             @"resourceType" : @"resourceType",
             @"revocationReason" : @"revocationReason",
             @"revokedAt" : @"revokedAt",
             @"serial" : @"serial",
             @"signatureAlgorithm" : @"signatureAlgorithm",
             @"status" : @"status",
             @"subject" : @"subject",
             @"subjectAlternativeNames" : @"subjectAlternativeNames",
             @"supportCode" : @"supportCode",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)domainValidationRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailLoadBalancerTlsCertificateDomainValidationRecord class]];
}

+ (NSValueTransformer *)failureReasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_AVAILABLE_CONTACTS"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateFailureReasonNoAvailableContacts);
        }
        if ([value caseInsensitiveCompare:@"ADDITIONAL_VERIFICATION_REQUIRED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateFailureReasonAdditionalVerificationRequired);
        }
        if ([value caseInsensitiveCompare:@"DOMAIN_NOT_ALLOWED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateFailureReasonDomainNotAllowed);
        }
        if ([value caseInsensitiveCompare:@"INVALID_PUBLIC_DOMAIN"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateFailureReasonInvalidPublicDomain);
        }
        if ([value caseInsensitiveCompare:@"OTHER"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateFailureReasonOther);
        }
        return @(AWSLightsailLoadBalancerTlsCertificateFailureReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailLoadBalancerTlsCertificateFailureReasonNoAvailableContacts:
                return @"NO_AVAILABLE_CONTACTS";
            case AWSLightsailLoadBalancerTlsCertificateFailureReasonAdditionalVerificationRequired:
                return @"ADDITIONAL_VERIFICATION_REQUIRED";
            case AWSLightsailLoadBalancerTlsCertificateFailureReasonDomainNotAllowed:
                return @"DOMAIN_NOT_ALLOWED";
            case AWSLightsailLoadBalancerTlsCertificateFailureReasonInvalidPublicDomain:
                return @"INVALID_PUBLIC_DOMAIN";
            case AWSLightsailLoadBalancerTlsCertificateFailureReasonOther:
                return @"OTHER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)issuedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)notAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)renewalSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailLoadBalancerTlsCertificateRenewalSummary class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)revocationReasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRevocationReasonUnspecified);
        }
        if ([value caseInsensitiveCompare:@"KEY_COMPROMISE"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRevocationReasonKeyCompromise);
        }
        if ([value caseInsensitiveCompare:@"CA_COMPROMISE"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRevocationReasonCaCompromise);
        }
        if ([value caseInsensitiveCompare:@"AFFILIATION_CHANGED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRevocationReasonAffiliationChanged);
        }
        if ([value caseInsensitiveCompare:@"SUPERCEDED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRevocationReasonSuperceded);
        }
        if ([value caseInsensitiveCompare:@"CESSATION_OF_OPERATION"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRevocationReasonCessationOfOperation);
        }
        if ([value caseInsensitiveCompare:@"CERTIFICATE_HOLD"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRevocationReasonCertificateHold);
        }
        if ([value caseInsensitiveCompare:@"REMOVE_FROM_CRL"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRevocationReasonRemoveFromCrl);
        }
        if ([value caseInsensitiveCompare:@"PRIVILEGE_WITHDRAWN"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRevocationReasonPrivilegeWithdrawn);
        }
        if ([value caseInsensitiveCompare:@"A_A_COMPROMISE"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRevocationReasonAACompromise);
        }
        return @(AWSLightsailLoadBalancerTlsCertificateRevocationReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailLoadBalancerTlsCertificateRevocationReasonUnspecified:
                return @"UNSPECIFIED";
            case AWSLightsailLoadBalancerTlsCertificateRevocationReasonKeyCompromise:
                return @"KEY_COMPROMISE";
            case AWSLightsailLoadBalancerTlsCertificateRevocationReasonCaCompromise:
                return @"CA_COMPROMISE";
            case AWSLightsailLoadBalancerTlsCertificateRevocationReasonAffiliationChanged:
                return @"AFFILIATION_CHANGED";
            case AWSLightsailLoadBalancerTlsCertificateRevocationReasonSuperceded:
                return @"SUPERCEDED";
            case AWSLightsailLoadBalancerTlsCertificateRevocationReasonCessationOfOperation:
                return @"CESSATION_OF_OPERATION";
            case AWSLightsailLoadBalancerTlsCertificateRevocationReasonCertificateHold:
                return @"CERTIFICATE_HOLD";
            case AWSLightsailLoadBalancerTlsCertificateRevocationReasonRemoveFromCrl:
                return @"REMOVE_FROM_CRL";
            case AWSLightsailLoadBalancerTlsCertificateRevocationReasonPrivilegeWithdrawn:
                return @"PRIVILEGE_WITHDRAWN";
            case AWSLightsailLoadBalancerTlsCertificateRevocationReasonAACompromise:
                return @"A_A_COMPROMISE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)revokedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VALIDATION"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateStatusPendingValidation);
        }
        if ([value caseInsensitiveCompare:@"ISSUED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateStatusIssued);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateStatusExpired);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_TIMED_OUT"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateStatusValidationTimedOut);
        }
        if ([value caseInsensitiveCompare:@"REVOKED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateStatusRevoked);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateStatusUnknown);
        }
        return @(AWSLightsailLoadBalancerTlsCertificateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailLoadBalancerTlsCertificateStatusPendingValidation:
                return @"PENDING_VALIDATION";
            case AWSLightsailLoadBalancerTlsCertificateStatusIssued:
                return @"ISSUED";
            case AWSLightsailLoadBalancerTlsCertificateStatusInactive:
                return @"INACTIVE";
            case AWSLightsailLoadBalancerTlsCertificateStatusExpired:
                return @"EXPIRED";
            case AWSLightsailLoadBalancerTlsCertificateStatusValidationTimedOut:
                return @"VALIDATION_TIMED_OUT";
            case AWSLightsailLoadBalancerTlsCertificateStatusRevoked:
                return @"REVOKED";
            case AWSLightsailLoadBalancerTlsCertificateStatusFailed:
                return @"FAILED";
            case AWSLightsailLoadBalancerTlsCertificateStatusUnknown:
                return @"UNKNOWN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailLoadBalancerTlsCertificateDomainValidationOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"domainName",
             @"validationStatus" : @"validationStatus",
             };
}

+ (NSValueTransformer *)validationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VALIDATION"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateDomainStatusPendingValidation);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateDomainStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateDomainStatusSuccess);
        }
        return @(AWSLightsailLoadBalancerTlsCertificateDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailLoadBalancerTlsCertificateDomainStatusPendingValidation:
                return @"PENDING_VALIDATION";
            case AWSLightsailLoadBalancerTlsCertificateDomainStatusFailed:
                return @"FAILED";
            case AWSLightsailLoadBalancerTlsCertificateDomainStatusSuccess:
                return @"SUCCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailLoadBalancerTlsCertificateDomainValidationRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"domainName",
             @"name" : @"name",
             @"types" : @"type",
             @"validationStatus" : @"validationStatus",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)validationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VALIDATION"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateDomainStatusPendingValidation);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateDomainStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateDomainStatusSuccess);
        }
        return @(AWSLightsailLoadBalancerTlsCertificateDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailLoadBalancerTlsCertificateDomainStatusPendingValidation:
                return @"PENDING_VALIDATION";
            case AWSLightsailLoadBalancerTlsCertificateDomainStatusFailed:
                return @"FAILED";
            case AWSLightsailLoadBalancerTlsCertificateDomainStatusSuccess:
                return @"SUCCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailLoadBalancerTlsCertificateRenewalSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainValidationOptions" : @"domainValidationOptions",
             @"renewalStatus" : @"renewalStatus",
             };
}

+ (NSValueTransformer *)domainValidationOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailLoadBalancerTlsCertificateDomainValidationOption class]];
}

+ (NSValueTransformer *)renewalStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_AUTO_RENEWAL"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRenewalStatusPendingAutoRenewal);
        }
        if ([value caseInsensitiveCompare:@"PENDING_VALIDATION"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRenewalStatusPendingValidation);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRenewalStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerTlsCertificateRenewalStatusFailed);
        }
        return @(AWSLightsailLoadBalancerTlsCertificateRenewalStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailLoadBalancerTlsCertificateRenewalStatusPendingAutoRenewal:
                return @"PENDING_AUTO_RENEWAL";
            case AWSLightsailLoadBalancerTlsCertificateRenewalStatusPendingValidation:
                return @"PENDING_VALIDATION";
            case AWSLightsailLoadBalancerTlsCertificateRenewalStatusSuccess:
                return @"SUCCESS";
            case AWSLightsailLoadBalancerTlsCertificateRenewalStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailLoadBalancerTlsCertificateSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isAttached" : @"isAttached",
             @"name" : @"name",
             };
}

@end

@implementation AWSLightsailLogEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"createdAt",
             @"message" : @"message",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLightsailMetricDatapoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"average" : @"average",
             @"maximum" : @"maximum",
             @"minimum" : @"minimum",
             @"sampleCount" : @"sampleCount",
             @"sum" : @"sum",
             @"timestamp" : @"timestamp",
             @"unit" : @"unit",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSLightsailMetricUnitNone);
        }
        return @(AWSLightsailMetricUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailMetricUnitSeconds:
                return @"Seconds";
            case AWSLightsailMetricUnitMicroseconds:
                return @"Microseconds";
            case AWSLightsailMetricUnitMilliseconds:
                return @"Milliseconds";
            case AWSLightsailMetricUnitBytes:
                return @"Bytes";
            case AWSLightsailMetricUnitKilobytes:
                return @"Kilobytes";
            case AWSLightsailMetricUnitMegabytes:
                return @"Megabytes";
            case AWSLightsailMetricUnitGigabytes:
                return @"Gigabytes";
            case AWSLightsailMetricUnitTerabytes:
                return @"Terabytes";
            case AWSLightsailMetricUnitBits:
                return @"Bits";
            case AWSLightsailMetricUnitKilobits:
                return @"Kilobits";
            case AWSLightsailMetricUnitMegabits:
                return @"Megabits";
            case AWSLightsailMetricUnitGigabits:
                return @"Gigabits";
            case AWSLightsailMetricUnitTerabits:
                return @"Terabits";
            case AWSLightsailMetricUnitPercent:
                return @"Percent";
            case AWSLightsailMetricUnitCount:
                return @"Count";
            case AWSLightsailMetricUnitBytesSecond:
                return @"Bytes/Second";
            case AWSLightsailMetricUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSLightsailMetricUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSLightsailMetricUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSLightsailMetricUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSLightsailMetricUnitBitsSecond:
                return @"Bits/Second";
            case AWSLightsailMetricUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSLightsailMetricUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSLightsailMetricUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSLightsailMetricUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSLightsailMetricUnitCountSecond:
                return @"Count/Second";
            case AWSLightsailMetricUnitNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailMonitoredResourceInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailMonthlyTransfer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gbPerMonthAllocated" : @"gbPerMonthAllocated",
             };
}

@end

@implementation AWSLightsailOpenInstancePublicPortsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             @"portInfo" : @"portInfo",
             };
}

+ (NSValueTransformer *)portInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailPortInfo class]];
}

@end

@implementation AWSLightsailOpenInstancePublicPortsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"createdAt",
             @"errorCode" : @"errorCode",
             @"errorDetails" : @"errorDetails",
             @"identifier" : @"id",
             @"isTerminal" : @"isTerminal",
             @"location" : @"location",
             @"operationDetails" : @"operationDetails",
             @"operationType" : @"operationType",
             @"resourceName" : @"resourceName",
             @"resourceType" : @"resourceType",
             @"status" : @"status",
             @"statusChangedAt" : @"statusChangedAt",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)operationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DeleteKnownHostKeys"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteKnownHostKeys);
        }
        if ([value caseInsensitiveCompare:@"DeleteInstance"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteInstance);
        }
        if ([value caseInsensitiveCompare:@"CreateInstance"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateInstance);
        }
        if ([value caseInsensitiveCompare:@"StopInstance"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeStopInstance);
        }
        if ([value caseInsensitiveCompare:@"StartInstance"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeStartInstance);
        }
        if ([value caseInsensitiveCompare:@"RebootInstance"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeRebootInstance);
        }
        if ([value caseInsensitiveCompare:@"OpenInstancePublicPorts"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeOpenInstancePublicPorts);
        }
        if ([value caseInsensitiveCompare:@"PutInstancePublicPorts"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypePutInstancePublicPorts);
        }
        if ([value caseInsensitiveCompare:@"CloseInstancePublicPorts"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCloseInstancePublicPorts);
        }
        if ([value caseInsensitiveCompare:@"AllocateStaticIp"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeAllocateStaticIp);
        }
        if ([value caseInsensitiveCompare:@"ReleaseStaticIp"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeReleaseStaticIp);
        }
        if ([value caseInsensitiveCompare:@"AttachStaticIp"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeAttachStaticIp);
        }
        if ([value caseInsensitiveCompare:@"DetachStaticIp"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDetachStaticIp);
        }
        if ([value caseInsensitiveCompare:@"UpdateDomainEntry"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeUpdateDomainEntry);
        }
        if ([value caseInsensitiveCompare:@"DeleteDomainEntry"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteDomainEntry);
        }
        if ([value caseInsensitiveCompare:@"CreateDomain"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateDomain);
        }
        if ([value caseInsensitiveCompare:@"DeleteDomain"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteDomain);
        }
        if ([value caseInsensitiveCompare:@"CreateInstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"DeleteInstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"CreateInstancesFromSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateInstancesFromSnapshot);
        }
        if ([value caseInsensitiveCompare:@"CreateLoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"DeleteLoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"AttachInstancesToLoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeAttachInstancesToLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"DetachInstancesFromLoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDetachInstancesFromLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"UpdateLoadBalancerAttribute"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeUpdateLoadBalancerAttribute);
        }
        if ([value caseInsensitiveCompare:@"CreateLoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"DeleteLoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"AttachLoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeAttachLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"CreateDisk"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateDisk);
        }
        if ([value caseInsensitiveCompare:@"DeleteDisk"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteDisk);
        }
        if ([value caseInsensitiveCompare:@"AttachDisk"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeAttachDisk);
        }
        if ([value caseInsensitiveCompare:@"DetachDisk"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDetachDisk);
        }
        if ([value caseInsensitiveCompare:@"CreateDiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"DeleteDiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"CreateDiskFromSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateDiskFromSnapshot);
        }
        if ([value caseInsensitiveCompare:@"CreateRelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"UpdateRelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeUpdateRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"DeleteRelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"CreateRelationalDatabaseFromSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateRelationalDatabaseFromSnapshot);
        }
        if ([value caseInsensitiveCompare:@"CreateRelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"DeleteRelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"UpdateRelationalDatabaseParameters"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeUpdateRelationalDatabaseParameters);
        }
        if ([value caseInsensitiveCompare:@"StartRelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeStartRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RebootRelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeRebootRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"StopRelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeStopRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"EnableAddOn"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeEnableAddOn);
        }
        if ([value caseInsensitiveCompare:@"DisableAddOn"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDisableAddOn);
        }
        if ([value caseInsensitiveCompare:@"PutAlarm"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypePutAlarm);
        }
        if ([value caseInsensitiveCompare:@"GetAlarms"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeGetAlarms);
        }
        if ([value caseInsensitiveCompare:@"DeleteAlarm"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteAlarm);
        }
        if ([value caseInsensitiveCompare:@"TestAlarm"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeTestAlarm);
        }
        if ([value caseInsensitiveCompare:@"CreateContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeCreateContactMethod);
        }
        if ([value caseInsensitiveCompare:@"GetContactMethods"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeGetContactMethods);
        }
        if ([value caseInsensitiveCompare:@"SendContactMethodVerification"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeSendContactMethodVerification);
        }
        if ([value caseInsensitiveCompare:@"DeleteContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailOperationTypeDeleteContactMethod);
        }
        return @(AWSLightsailOperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailOperationTypeDeleteKnownHostKeys:
                return @"DeleteKnownHostKeys";
            case AWSLightsailOperationTypeDeleteInstance:
                return @"DeleteInstance";
            case AWSLightsailOperationTypeCreateInstance:
                return @"CreateInstance";
            case AWSLightsailOperationTypeStopInstance:
                return @"StopInstance";
            case AWSLightsailOperationTypeStartInstance:
                return @"StartInstance";
            case AWSLightsailOperationTypeRebootInstance:
                return @"RebootInstance";
            case AWSLightsailOperationTypeOpenInstancePublicPorts:
                return @"OpenInstancePublicPorts";
            case AWSLightsailOperationTypePutInstancePublicPorts:
                return @"PutInstancePublicPorts";
            case AWSLightsailOperationTypeCloseInstancePublicPorts:
                return @"CloseInstancePublicPorts";
            case AWSLightsailOperationTypeAllocateStaticIp:
                return @"AllocateStaticIp";
            case AWSLightsailOperationTypeReleaseStaticIp:
                return @"ReleaseStaticIp";
            case AWSLightsailOperationTypeAttachStaticIp:
                return @"AttachStaticIp";
            case AWSLightsailOperationTypeDetachStaticIp:
                return @"DetachStaticIp";
            case AWSLightsailOperationTypeUpdateDomainEntry:
                return @"UpdateDomainEntry";
            case AWSLightsailOperationTypeDeleteDomainEntry:
                return @"DeleteDomainEntry";
            case AWSLightsailOperationTypeCreateDomain:
                return @"CreateDomain";
            case AWSLightsailOperationTypeDeleteDomain:
                return @"DeleteDomain";
            case AWSLightsailOperationTypeCreateInstanceSnapshot:
                return @"CreateInstanceSnapshot";
            case AWSLightsailOperationTypeDeleteInstanceSnapshot:
                return @"DeleteInstanceSnapshot";
            case AWSLightsailOperationTypeCreateInstancesFromSnapshot:
                return @"CreateInstancesFromSnapshot";
            case AWSLightsailOperationTypeCreateLoadBalancer:
                return @"CreateLoadBalancer";
            case AWSLightsailOperationTypeDeleteLoadBalancer:
                return @"DeleteLoadBalancer";
            case AWSLightsailOperationTypeAttachInstancesToLoadBalancer:
                return @"AttachInstancesToLoadBalancer";
            case AWSLightsailOperationTypeDetachInstancesFromLoadBalancer:
                return @"DetachInstancesFromLoadBalancer";
            case AWSLightsailOperationTypeUpdateLoadBalancerAttribute:
                return @"UpdateLoadBalancerAttribute";
            case AWSLightsailOperationTypeCreateLoadBalancerTlsCertificate:
                return @"CreateLoadBalancerTlsCertificate";
            case AWSLightsailOperationTypeDeleteLoadBalancerTlsCertificate:
                return @"DeleteLoadBalancerTlsCertificate";
            case AWSLightsailOperationTypeAttachLoadBalancerTlsCertificate:
                return @"AttachLoadBalancerTlsCertificate";
            case AWSLightsailOperationTypeCreateDisk:
                return @"CreateDisk";
            case AWSLightsailOperationTypeDeleteDisk:
                return @"DeleteDisk";
            case AWSLightsailOperationTypeAttachDisk:
                return @"AttachDisk";
            case AWSLightsailOperationTypeDetachDisk:
                return @"DetachDisk";
            case AWSLightsailOperationTypeCreateDiskSnapshot:
                return @"CreateDiskSnapshot";
            case AWSLightsailOperationTypeDeleteDiskSnapshot:
                return @"DeleteDiskSnapshot";
            case AWSLightsailOperationTypeCreateDiskFromSnapshot:
                return @"CreateDiskFromSnapshot";
            case AWSLightsailOperationTypeCreateRelationalDatabase:
                return @"CreateRelationalDatabase";
            case AWSLightsailOperationTypeUpdateRelationalDatabase:
                return @"UpdateRelationalDatabase";
            case AWSLightsailOperationTypeDeleteRelationalDatabase:
                return @"DeleteRelationalDatabase";
            case AWSLightsailOperationTypeCreateRelationalDatabaseFromSnapshot:
                return @"CreateRelationalDatabaseFromSnapshot";
            case AWSLightsailOperationTypeCreateRelationalDatabaseSnapshot:
                return @"CreateRelationalDatabaseSnapshot";
            case AWSLightsailOperationTypeDeleteRelationalDatabaseSnapshot:
                return @"DeleteRelationalDatabaseSnapshot";
            case AWSLightsailOperationTypeUpdateRelationalDatabaseParameters:
                return @"UpdateRelationalDatabaseParameters";
            case AWSLightsailOperationTypeStartRelationalDatabase:
                return @"StartRelationalDatabase";
            case AWSLightsailOperationTypeRebootRelationalDatabase:
                return @"RebootRelationalDatabase";
            case AWSLightsailOperationTypeStopRelationalDatabase:
                return @"StopRelationalDatabase";
            case AWSLightsailOperationTypeEnableAddOn:
                return @"EnableAddOn";
            case AWSLightsailOperationTypeDisableAddOn:
                return @"DisableAddOn";
            case AWSLightsailOperationTypePutAlarm:
                return @"PutAlarm";
            case AWSLightsailOperationTypeGetAlarms:
                return @"GetAlarms";
            case AWSLightsailOperationTypeDeleteAlarm:
                return @"DeleteAlarm";
            case AWSLightsailOperationTypeTestAlarm:
                return @"TestAlarm";
            case AWSLightsailOperationTypeCreateContactMethod:
                return @"CreateContactMethod";
            case AWSLightsailOperationTypeGetContactMethods:
                return @"GetContactMethods";
            case AWSLightsailOperationTypeSendContactMethodVerification:
                return @"SendContactMethodVerification";
            case AWSLightsailOperationTypeDeleteContactMethod:
                return @"DeleteContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NotStarted"] == NSOrderedSame) {
            return @(AWSLightsailOperationStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"Started"] == NSOrderedSame) {
            return @(AWSLightsailOperationStatusStarted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLightsailOperationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSLightsailOperationStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSLightsailOperationStatusSucceeded);
        }
        return @(AWSLightsailOperationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailOperationStatusNotStarted:
                return @"NotStarted";
            case AWSLightsailOperationStatusStarted:
                return @"Started";
            case AWSLightsailOperationStatusFailed:
                return @"Failed";
            case AWSLightsailOperationStatusCompleted:
                return @"Completed";
            case AWSLightsailOperationStatusSucceeded:
                return @"Succeeded";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusChangedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLightsailPasswordData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertext" : @"ciphertext",
             @"keyPairName" : @"keyPairName",
             };
}

@end

@implementation AWSLightsailPeerVpcRequest

@end

@implementation AWSLightsailPeerVpcResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailPendingMaintenanceAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             @"currentApplyDate" : @"currentApplyDate",
             @"detail" : @"description",
             };
}

+ (NSValueTransformer *)currentApplyDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLightsailPendingModifiedRelationalDatabaseValues

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupRetentionEnabled" : @"backupRetentionEnabled",
             @"engineVersion" : @"engineVersion",
             @"masterUserPassword" : @"masterUserPassword",
             };
}

@end

@implementation AWSLightsailPortInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrListAliases" : @"cidrListAliases",
             @"cidrs" : @"cidrs",
             @"fromPort" : @"fromPort",
             @"protocols" : @"protocol",
             @"toPort" : @"toPort",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"tcp"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolTcp);
        }
        if ([value caseInsensitiveCompare:@"all"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolAll);
        }
        if ([value caseInsensitiveCompare:@"udp"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolUdp);
        }
        if ([value caseInsensitiveCompare:@"icmp"] == NSOrderedSame) {
            return @(AWSLightsailNetworkProtocolIcmp);
        }
        return @(AWSLightsailNetworkProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailNetworkProtocolTcp:
                return @"tcp";
            case AWSLightsailNetworkProtocolAll:
                return @"all";
            case AWSLightsailNetworkProtocolUdp:
                return @"udp";
            case AWSLightsailNetworkProtocolIcmp:
                return @"icmp";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailPutAlarmRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmName" : @"alarmName",
             @"comparisonOperator" : @"comparisonOperator",
             @"contactProtocols" : @"contactProtocols",
             @"datapointsToAlarm" : @"datapointsToAlarm",
             @"evaluationPeriods" : @"evaluationPeriods",
             @"metricName" : @"metricName",
             @"monitoredResourceName" : @"monitoredResourceName",
             @"notificationEnabled" : @"notificationEnabled",
             @"notificationTriggers" : @"notificationTriggers",
             @"threshold" : @"threshold",
             @"treatMissingData" : @"treatMissingData",
             };
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GreaterThanOrEqualToThreshold"] == NSOrderedSame) {
            return @(AWSLightsailComparisonOperatorGreaterThanOrEqualToThreshold);
        }
        if ([value caseInsensitiveCompare:@"GreaterThanThreshold"] == NSOrderedSame) {
            return @(AWSLightsailComparisonOperatorGreaterThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanThreshold"] == NSOrderedSame) {
            return @(AWSLightsailComparisonOperatorLessThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanOrEqualToThreshold"] == NSOrderedSame) {
            return @(AWSLightsailComparisonOperatorLessThanOrEqualToThreshold);
        }
        return @(AWSLightsailComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailComparisonOperatorGreaterThanOrEqualToThreshold:
                return @"GreaterThanOrEqualToThreshold";
            case AWSLightsailComparisonOperatorGreaterThanThreshold:
                return @"GreaterThanThreshold";
            case AWSLightsailComparisonOperatorLessThanThreshold:
                return @"LessThanThreshold";
            case AWSLightsailComparisonOperatorLessThanOrEqualToThreshold:
                return @"LessThanOrEqualToThreshold";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CPUUtilization"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"NetworkIn"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameNetworkIn);
        }
        if ([value caseInsensitiveCompare:@"NetworkOut"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameNetworkOut);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameStatusCheckFailed);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed_Instance"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameStatusCheckFailedInstance);
        }
        if ([value caseInsensitiveCompare:@"StatusCheckFailed_System"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameStatusCheckFailedSystem);
        }
        if ([value caseInsensitiveCompare:@"ClientTLSNegotiationErrorCount"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameClientTLSNegotiationErrorCount);
        }
        if ([value caseInsensitiveCompare:@"HealthyHostCount"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHealthyHostCount);
        }
        if ([value caseInsensitiveCompare:@"UnhealthyHostCount"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameUnhealthyHostCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_LB_4XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeLB4XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_LB_5XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeLB5XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_2XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeInstance2XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_3XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeInstance3XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_4XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeInstance4XXCount);
        }
        if ([value caseInsensitiveCompare:@"HTTPCode_Instance_5XX_Count"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameHTTPCodeInstance5XXCount);
        }
        if ([value caseInsensitiveCompare:@"InstanceResponseTime"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameInstanceResponseTime);
        }
        if ([value caseInsensitiveCompare:@"RejectedConnectionCount"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameRejectedConnectionCount);
        }
        if ([value caseInsensitiveCompare:@"RequestCount"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameRequestCount);
        }
        if ([value caseInsensitiveCompare:@"DatabaseConnections"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameDatabaseConnections);
        }
        if ([value caseInsensitiveCompare:@"DiskQueueDepth"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameDiskQueueDepth);
        }
        if ([value caseInsensitiveCompare:@"FreeStorageSpace"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameFreeStorageSpace);
        }
        if ([value caseInsensitiveCompare:@"NetworkReceiveThroughput"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameNetworkReceiveThroughput);
        }
        if ([value caseInsensitiveCompare:@"NetworkTransmitThroughput"] == NSOrderedSame) {
            return @(AWSLightsailMetricNameNetworkTransmitThroughput);
        }
        return @(AWSLightsailMetricNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailMetricNameCPUUtilization:
                return @"CPUUtilization";
            case AWSLightsailMetricNameNetworkIn:
                return @"NetworkIn";
            case AWSLightsailMetricNameNetworkOut:
                return @"NetworkOut";
            case AWSLightsailMetricNameStatusCheckFailed:
                return @"StatusCheckFailed";
            case AWSLightsailMetricNameStatusCheckFailedInstance:
                return @"StatusCheckFailed_Instance";
            case AWSLightsailMetricNameStatusCheckFailedSystem:
                return @"StatusCheckFailed_System";
            case AWSLightsailMetricNameClientTLSNegotiationErrorCount:
                return @"ClientTLSNegotiationErrorCount";
            case AWSLightsailMetricNameHealthyHostCount:
                return @"HealthyHostCount";
            case AWSLightsailMetricNameUnhealthyHostCount:
                return @"UnhealthyHostCount";
            case AWSLightsailMetricNameHTTPCodeLB4XXCount:
                return @"HTTPCode_LB_4XX_Count";
            case AWSLightsailMetricNameHTTPCodeLB5XXCount:
                return @"HTTPCode_LB_5XX_Count";
            case AWSLightsailMetricNameHTTPCodeInstance2XXCount:
                return @"HTTPCode_Instance_2XX_Count";
            case AWSLightsailMetricNameHTTPCodeInstance3XXCount:
                return @"HTTPCode_Instance_3XX_Count";
            case AWSLightsailMetricNameHTTPCodeInstance4XXCount:
                return @"HTTPCode_Instance_4XX_Count";
            case AWSLightsailMetricNameHTTPCodeInstance5XXCount:
                return @"HTTPCode_Instance_5XX_Count";
            case AWSLightsailMetricNameInstanceResponseTime:
                return @"InstanceResponseTime";
            case AWSLightsailMetricNameRejectedConnectionCount:
                return @"RejectedConnectionCount";
            case AWSLightsailMetricNameRequestCount:
                return @"RequestCount";
            case AWSLightsailMetricNameDatabaseConnections:
                return @"DatabaseConnections";
            case AWSLightsailMetricNameDiskQueueDepth:
                return @"DiskQueueDepth";
            case AWSLightsailMetricNameFreeStorageSpace:
                return @"FreeStorageSpace";
            case AWSLightsailMetricNameNetworkReceiveThroughput:
                return @"NetworkReceiveThroughput";
            case AWSLightsailMetricNameNetworkTransmitThroughput:
                return @"NetworkTransmitThroughput";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)treatMissingDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"breaching"] == NSOrderedSame) {
            return @(AWSLightsailTreatMissingDataBreaching);
        }
        if ([value caseInsensitiveCompare:@"notBreaching"] == NSOrderedSame) {
            return @(AWSLightsailTreatMissingDataNotBreaching);
        }
        if ([value caseInsensitiveCompare:@"ignore"] == NSOrderedSame) {
            return @(AWSLightsailTreatMissingDataIgnore);
        }
        if ([value caseInsensitiveCompare:@"missing"] == NSOrderedSame) {
            return @(AWSLightsailTreatMissingDataMissing);
        }
        return @(AWSLightsailTreatMissingDataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailTreatMissingDataBreaching:
                return @"breaching";
            case AWSLightsailTreatMissingDataNotBreaching:
                return @"notBreaching";
            case AWSLightsailTreatMissingDataIgnore:
                return @"ignore";
            case AWSLightsailTreatMissingDataMissing:
                return @"missing";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailPutAlarmResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailPutInstancePublicPortsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             @"portInfos" : @"portInfos",
             };
}

+ (NSValueTransformer *)portInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailPortInfo class]];
}

@end

@implementation AWSLightsailPutInstancePublicPortsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailRebootInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSLightsailRebootInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailRebootRelationalDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relationalDatabaseName" : @"relationalDatabaseName",
             };
}

@end

@implementation AWSLightsailRebootRelationalDatabaseResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailRegion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"availabilityZones",
             @"continentCode" : @"continentCode",
             @"detail" : @"description",
             @"displayName" : @"displayName",
             @"name" : @"name",
             @"relationalDatabaseAvailabilityZones" : @"relationalDatabaseAvailabilityZones",
             };
}

+ (NSValueTransformer *)availabilityZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailAvailabilityZone class]];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsEast2);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuWest3);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuCentral1);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameCaCentral1);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApNortheast2);
        }
        return @(AWSLightsailRegionNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailRegionNameUsEast1:
                return @"us-east-1";
            case AWSLightsailRegionNameUsEast2:
                return @"us-east-2";
            case AWSLightsailRegionNameUsWest1:
                return @"us-west-1";
            case AWSLightsailRegionNameUsWest2:
                return @"us-west-2";
            case AWSLightsailRegionNameEuWest1:
                return @"eu-west-1";
            case AWSLightsailRegionNameEuWest2:
                return @"eu-west-2";
            case AWSLightsailRegionNameEuWest3:
                return @"eu-west-3";
            case AWSLightsailRegionNameEuCentral1:
                return @"eu-central-1";
            case AWSLightsailRegionNameCaCentral1:
                return @"ca-central-1";
            case AWSLightsailRegionNameApSouth1:
                return @"ap-south-1";
            case AWSLightsailRegionNameApSoutheast1:
                return @"ap-southeast-1";
            case AWSLightsailRegionNameApSoutheast2:
                return @"ap-southeast-2";
            case AWSLightsailRegionNameApNortheast1:
                return @"ap-northeast-1";
            case AWSLightsailRegionNameApNortheast2:
                return @"ap-northeast-2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)relationalDatabaseAvailabilityZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailAvailabilityZone class]];
}

@end

@implementation AWSLightsailRelationalDatabase

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"backupRetentionEnabled" : @"backupRetentionEnabled",
             @"caCertificateIdentifier" : @"caCertificateIdentifier",
             @"createdAt" : @"createdAt",
             @"engine" : @"engine",
             @"engineVersion" : @"engineVersion",
             @"hardware" : @"hardware",
             @"latestRestorableTime" : @"latestRestorableTime",
             @"location" : @"location",
             @"masterDatabaseName" : @"masterDatabaseName",
             @"masterEndpoint" : @"masterEndpoint",
             @"masterUsername" : @"masterUsername",
             @"name" : @"name",
             @"parameterApplyStatus" : @"parameterApplyStatus",
             @"pendingMaintenanceActions" : @"pendingMaintenanceActions",
             @"pendingModifiedValues" : @"pendingModifiedValues",
             @"preferredBackupWindow" : @"preferredBackupWindow",
             @"preferredMaintenanceWindow" : @"preferredMaintenanceWindow",
             @"publiclyAccessible" : @"publiclyAccessible",
             @"relationalDatabaseBlueprintId" : @"relationalDatabaseBlueprintId",
             @"relationalDatabaseBundleId" : @"relationalDatabaseBundleId",
             @"resourceType" : @"resourceType",
             @"secondaryAvailabilityZone" : @"secondaryAvailabilityZone",
             @"state" : @"state",
             @"supportCode" : @"supportCode",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)hardwareJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailRelationalDatabaseHardware class]];
}

+ (NSValueTransformer *)latestRestorableTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)masterEndpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailRelationalDatabaseEndpoint class]];
}

+ (NSValueTransformer *)pendingMaintenanceActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailPendingMaintenanceAction class]];
}

+ (NSValueTransformer *)pendingModifiedValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailPendingModifiedRelationalDatabaseValues class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailRelationalDatabaseBlueprint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blueprintId" : @"blueprintId",
             @"engine" : @"engine",
             @"engineDescription" : @"engineDescription",
             @"engineVersion" : @"engineVersion",
             @"engineVersionDescription" : @"engineVersionDescription",
             @"isEngineDefault" : @"isEngineDefault",
             };
}

+ (NSValueTransformer *)engineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"mysql"] == NSOrderedSame) {
            return @(AWSLightsailRelationalDatabaseEngineMysql);
        }
        return @(AWSLightsailRelationalDatabaseEngineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailRelationalDatabaseEngineMysql:
                return @"mysql";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailRelationalDatabaseBundle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"bundleId",
             @"cpuCount" : @"cpuCount",
             @"diskSizeInGb" : @"diskSizeInGb",
             @"isActive" : @"isActive",
             @"isEncrypted" : @"isEncrypted",
             @"name" : @"name",
             @"price" : @"price",
             @"ramSizeInGb" : @"ramSizeInGb",
             @"transferPerMonthInGb" : @"transferPerMonthInGb",
             };
}

@end

@implementation AWSLightsailRelationalDatabaseEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"address",
             @"port" : @"port",
             };
}

@end

@implementation AWSLightsailRelationalDatabaseEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"createdAt",
             @"eventCategories" : @"eventCategories",
             @"message" : @"message",
             @"resource" : @"resource",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLightsailRelationalDatabaseHardware

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cpuCount" : @"cpuCount",
             @"diskSizeInGb" : @"diskSizeInGb",
             @"ramSizeInGb" : @"ramSizeInGb",
             };
}

@end

@implementation AWSLightsailRelationalDatabaseParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValues" : @"allowedValues",
             @"applyMethod" : @"applyMethod",
             @"applyType" : @"applyType",
             @"dataType" : @"dataType",
             @"detail" : @"description",
             @"isModifiable" : @"isModifiable",
             @"parameterName" : @"parameterName",
             @"parameterValue" : @"parameterValue",
             };
}

@end

@implementation AWSLightsailRelationalDatabaseSnapshot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"engine" : @"engine",
             @"engineVersion" : @"engineVersion",
             @"fromRelationalDatabaseArn" : @"fromRelationalDatabaseArn",
             @"fromRelationalDatabaseBlueprintId" : @"fromRelationalDatabaseBlueprintId",
             @"fromRelationalDatabaseBundleId" : @"fromRelationalDatabaseBundleId",
             @"fromRelationalDatabaseName" : @"fromRelationalDatabaseName",
             @"location" : @"location",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             @"sizeInGb" : @"sizeInGb",
             @"state" : @"state",
             @"supportCode" : @"supportCode",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailReleaseStaticIpRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"staticIpName" : @"staticIpName",
             };
}

@end

@implementation AWSLightsailReleaseStaticIpResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailResourceLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"availabilityZone",
             @"regionName" : @"regionName",
             };
}

+ (NSValueTransformer *)regionNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsEast2);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameUsWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuWest3);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameEuCentral1);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameCaCentral1);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSLightsailRegionNameApNortheast2);
        }
        return @(AWSLightsailRegionNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailRegionNameUsEast1:
                return @"us-east-1";
            case AWSLightsailRegionNameUsEast2:
                return @"us-east-2";
            case AWSLightsailRegionNameUsWest1:
                return @"us-west-1";
            case AWSLightsailRegionNameUsWest2:
                return @"us-west-2";
            case AWSLightsailRegionNameEuWest1:
                return @"eu-west-1";
            case AWSLightsailRegionNameEuWest2:
                return @"eu-west-2";
            case AWSLightsailRegionNameEuWest3:
                return @"eu-west-3";
            case AWSLightsailRegionNameEuCentral1:
                return @"eu-central-1";
            case AWSLightsailRegionNameCaCentral1:
                return @"ca-central-1";
            case AWSLightsailRegionNameApSouth1:
                return @"ap-south-1";
            case AWSLightsailRegionNameApSoutheast1:
                return @"ap-southeast-1";
            case AWSLightsailRegionNameApSoutheast2:
                return @"ap-southeast-2";
            case AWSLightsailRegionNameApNortheast1:
                return @"ap-northeast-1";
            case AWSLightsailRegionNameApNortheast2:
                return @"ap-northeast-2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailSendContactMethodVerificationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"protocols" : @"protocol",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Email"] == NSOrderedSame) {
            return @(AWSLightsailContactMethodVerificationProtocolEmail);
        }
        return @(AWSLightsailContactMethodVerificationProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailContactMethodVerificationProtocolEmail:
                return @"Email";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailSendContactMethodVerificationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailStartInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSLightsailStartInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailStartRelationalDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relationalDatabaseName" : @"relationalDatabaseName",
             };
}

@end

@implementation AWSLightsailStartRelationalDatabaseResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailStaticIp

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"attachedTo" : @"attachedTo",
             @"createdAt" : @"createdAt",
             @"ipAddress" : @"ipAddress",
             @"isAttached" : @"isAttached",
             @"location" : @"location",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             @"supportCode" : @"supportCode",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailResourceLocation class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Instance"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"StaticIp"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeStaticIp);
        }
        if ([value caseInsensitiveCompare:@"KeyPair"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeKeyPair);
        }
        if ([value caseInsensitiveCompare:@"InstanceSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeInstanceSnapshot);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"PeeredVpc"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypePeeredVpc);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancer"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"LoadBalancerTlsCertificate"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeLoadBalancerTlsCertificate);
        }
        if ([value caseInsensitiveCompare:@"Disk"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDisk);
        }
        if ([value caseInsensitiveCompare:@"DiskSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeDiskSnapshot);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabase"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabase);
        }
        if ([value caseInsensitiveCompare:@"RelationalDatabaseSnapshot"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeRelationalDatabaseSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ExportSnapshotRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeExportSnapshotRecord);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationStackRecord"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeCloudFormationStackRecord);
        }
        if ([value caseInsensitiveCompare:@"Alarm"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeAlarm);
        }
        if ([value caseInsensitiveCompare:@"ContactMethod"] == NSOrderedSame) {
            return @(AWSLightsailResourceTypeContactMethod);
        }
        return @(AWSLightsailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailResourceTypeInstance:
                return @"Instance";
            case AWSLightsailResourceTypeStaticIp:
                return @"StaticIp";
            case AWSLightsailResourceTypeKeyPair:
                return @"KeyPair";
            case AWSLightsailResourceTypeInstanceSnapshot:
                return @"InstanceSnapshot";
            case AWSLightsailResourceTypeDomain:
                return @"Domain";
            case AWSLightsailResourceTypePeeredVpc:
                return @"PeeredVpc";
            case AWSLightsailResourceTypeLoadBalancer:
                return @"LoadBalancer";
            case AWSLightsailResourceTypeLoadBalancerTlsCertificate:
                return @"LoadBalancerTlsCertificate";
            case AWSLightsailResourceTypeDisk:
                return @"Disk";
            case AWSLightsailResourceTypeDiskSnapshot:
                return @"DiskSnapshot";
            case AWSLightsailResourceTypeRelationalDatabase:
                return @"RelationalDatabase";
            case AWSLightsailResourceTypeRelationalDatabaseSnapshot:
                return @"RelationalDatabaseSnapshot";
            case AWSLightsailResourceTypeExportSnapshotRecord:
                return @"ExportSnapshotRecord";
            case AWSLightsailResourceTypeCloudFormationStackRecord:
                return @"CloudFormationStackRecord";
            case AWSLightsailResourceTypeAlarm:
                return @"Alarm";
            case AWSLightsailResourceTypeContactMethod:
                return @"ContactMethod";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailStopInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"force" : @"force",
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSLightsailStopInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailStopRelationalDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relationalDatabaseName" : @"relationalDatabaseName",
             @"relationalDatabaseSnapshotName" : @"relationalDatabaseSnapshotName",
             };
}

@end

@implementation AWSLightsailStopRelationalDatabaseResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSLightsailTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"resourceName" : @"resourceName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailTag class]];
}

@end

@implementation AWSLightsailTagResourceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailTestAlarmRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmName" : @"alarmName",
             @"state" : @"state",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OK"] == NSOrderedSame) {
            return @(AWSLightsailAlarmStateOK);
        }
        if ([value caseInsensitiveCompare:@"ALARM"] == NSOrderedSame) {
            return @(AWSLightsailAlarmStateAlarm);
        }
        if ([value caseInsensitiveCompare:@"INSUFFICIENT_DATA"] == NSOrderedSame) {
            return @(AWSLightsailAlarmStateInsufficientData);
        }
        return @(AWSLightsailAlarmStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailAlarmStateOK:
                return @"OK";
            case AWSLightsailAlarmStateAlarm:
                return @"ALARM";
            case AWSLightsailAlarmStateInsufficientData:
                return @"INSUFFICIENT_DATA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailTestAlarmResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailUnpeerVpcRequest

@end

@implementation AWSLightsailUnpeerVpcResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"resourceName" : @"resourceName",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSLightsailUntagResourceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailUpdateDomainEntryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainEntry" : @"domainEntry",
             @"domainName" : @"domainName",
             };
}

+ (NSValueTransformer *)domainEntryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLightsailDomainEntry class]];
}

@end

@implementation AWSLightsailUpdateDomainEntryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailUpdateLoadBalancerAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"attributeName",
             @"attributeValue" : @"attributeValue",
             @"loadBalancerName" : @"loadBalancerName",
             };
}

+ (NSValueTransformer *)attributeNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HealthCheckPath"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerAttributeNameHealthCheckPath);
        }
        if ([value caseInsensitiveCompare:@"SessionStickinessEnabled"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerAttributeNameSessionStickinessEnabled);
        }
        if ([value caseInsensitiveCompare:@"SessionStickiness_LB_CookieDurationSeconds"] == NSOrderedSame) {
            return @(AWSLightsailLoadBalancerAttributeNameSessionStickinessLBCookieDurationSeconds);
        }
        return @(AWSLightsailLoadBalancerAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLightsailLoadBalancerAttributeNameHealthCheckPath:
                return @"HealthCheckPath";
            case AWSLightsailLoadBalancerAttributeNameSessionStickinessEnabled:
                return @"SessionStickinessEnabled";
            case AWSLightsailLoadBalancerAttributeNameSessionStickinessLBCookieDurationSeconds:
                return @"SessionStickiness_LB_CookieDurationSeconds";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLightsailUpdateLoadBalancerAttributeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailUpdateRelationalDatabaseParametersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameters" : @"parameters",
             @"relationalDatabaseName" : @"relationalDatabaseName",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailRelationalDatabaseParameter class]];
}

@end

@implementation AWSLightsailUpdateRelationalDatabaseParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end

@implementation AWSLightsailUpdateRelationalDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"applyImmediately",
             @"caCertificateIdentifier" : @"caCertificateIdentifier",
             @"disableBackupRetention" : @"disableBackupRetention",
             @"enableBackupRetention" : @"enableBackupRetention",
             @"masterUserPassword" : @"masterUserPassword",
             @"preferredBackupWindow" : @"preferredBackupWindow",
             @"preferredMaintenanceWindow" : @"preferredMaintenanceWindow",
             @"publiclyAccessible" : @"publiclyAccessible",
             @"relationalDatabaseName" : @"relationalDatabaseName",
             @"rotateMasterUserPassword" : @"rotateMasterUserPassword",
             };
}

@end

@implementation AWSLightsailUpdateRelationalDatabaseResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operations" : @"operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLightsailOperation class]];
}

@end
