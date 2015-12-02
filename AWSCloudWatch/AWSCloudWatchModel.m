/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSCloudWatchModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSCloudWatchErrorDomain = @"com.amazonaws.AWSCloudWatchErrorDomain";

@implementation AWSCloudWatchAlarmHistoryItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmName" : @"AlarmName",
             @"historyData" : @"HistoryData",
             @"historyItemType" : @"HistoryItemType",
             @"historySummary" : @"HistorySummary",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)historyItemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ConfigurationUpdate"]) {
            return @(AWSCloudWatchHistoryItemTypeConfigurationUpdate);
        }
        if ([value isEqualToString:@"StateUpdate"]) {
            return @(AWSCloudWatchHistoryItemTypeStateUpdate);
        }
        if ([value isEqualToString:@"Action"]) {
            return @(AWSCloudWatchHistoryItemTypeAction);
        }
        return @(AWSCloudWatchHistoryItemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchHistoryItemTypeConfigurationUpdate:
                return @"ConfigurationUpdate";
            case AWSCloudWatchHistoryItemTypeStateUpdate:
                return @"StateUpdate";
            case AWSCloudWatchHistoryItemTypeAction:
                return @"Action";
            case AWSCloudWatchHistoryItemTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudWatchDatapoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"average" : @"Average",
             @"maximum" : @"Maximum",
             @"minimum" : @"Minimum",
             @"sampleCount" : @"SampleCount",
             @"sum" : @"Sum",
             @"timestamp" : @"Timestamp",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Seconds"]) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value isEqualToString:@"Microseconds"]) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value isEqualToString:@"Milliseconds"]) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value isEqualToString:@"Bytes"]) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value isEqualToString:@"Kilobytes"]) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value isEqualToString:@"Megabytes"]) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value isEqualToString:@"Gigabytes"]) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value isEqualToString:@"Terabytes"]) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value isEqualToString:@"Bits"]) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value isEqualToString:@"Kilobits"]) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value isEqualToString:@"Megabits"]) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value isEqualToString:@"Gigabits"]) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value isEqualToString:@"Terabits"]) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value isEqualToString:@"Percent"]) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value isEqualToString:@"Count"]) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value isEqualToString:@"Bytes/Second"]) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value isEqualToString:@"Kilobytes/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value isEqualToString:@"Megabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value isEqualToString:@"Gigabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value isEqualToString:@"Terabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value isEqualToString:@"Bits/Second"]) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value isEqualToString:@"Kilobits/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value isEqualToString:@"Megabits/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value isEqualToString:@"Gigabits/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value isEqualToString:@"Terabits/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value isEqualToString:@"Count/Second"]) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value isEqualToString:@"None"]) {
            return @(AWSCloudWatchStandardUnitNone);
        }
        return @(AWSCloudWatchStandardUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStandardUnitSeconds:
                return @"Seconds";
            case AWSCloudWatchStandardUnitMicroseconds:
                return @"Microseconds";
            case AWSCloudWatchStandardUnitMilliseconds:
                return @"Milliseconds";
            case AWSCloudWatchStandardUnitBytes:
                return @"Bytes";
            case AWSCloudWatchStandardUnitKilobytes:
                return @"Kilobytes";
            case AWSCloudWatchStandardUnitMegabytes:
                return @"Megabytes";
            case AWSCloudWatchStandardUnitGigabytes:
                return @"Gigabytes";
            case AWSCloudWatchStandardUnitTerabytes:
                return @"Terabytes";
            case AWSCloudWatchStandardUnitBits:
                return @"Bits";
            case AWSCloudWatchStandardUnitKilobits:
                return @"Kilobits";
            case AWSCloudWatchStandardUnitMegabits:
                return @"Megabits";
            case AWSCloudWatchStandardUnitGigabits:
                return @"Gigabits";
            case AWSCloudWatchStandardUnitTerabits:
                return @"Terabits";
            case AWSCloudWatchStandardUnitPercent:
                return @"Percent";
            case AWSCloudWatchStandardUnitCount:
                return @"Count";
            case AWSCloudWatchStandardUnitBytesSecond:
                return @"Bytes/Second";
            case AWSCloudWatchStandardUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSCloudWatchStandardUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSCloudWatchStandardUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSCloudWatchStandardUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSCloudWatchStandardUnitBitsSecond:
                return @"Bits/Second";
            case AWSCloudWatchStandardUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSCloudWatchStandardUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSCloudWatchStandardUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSCloudWatchStandardUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSCloudWatchStandardUnitCountSecond:
                return @"Count/Second";
            case AWSCloudWatchStandardUnitNone:
                return @"None";
            case AWSCloudWatchStandardUnitUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchDeleteAlarmsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmNames" : @"AlarmNames",
             };
}

@end

@implementation AWSCloudWatchDescribeAlarmHistoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmName" : @"AlarmName",
             @"endDate" : @"EndDate",
             @"historyItemType" : @"HistoryItemType",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             @"startDate" : @"StartDate",
             };
}

+ (NSValueTransformer *)endDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)historyItemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ConfigurationUpdate"]) {
            return @(AWSCloudWatchHistoryItemTypeConfigurationUpdate);
        }
        if ([value isEqualToString:@"StateUpdate"]) {
            return @(AWSCloudWatchHistoryItemTypeStateUpdate);
        }
        if ([value isEqualToString:@"Action"]) {
            return @(AWSCloudWatchHistoryItemTypeAction);
        }
        return @(AWSCloudWatchHistoryItemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchHistoryItemTypeConfigurationUpdate:
                return @"ConfigurationUpdate";
            case AWSCloudWatchHistoryItemTypeStateUpdate:
                return @"StateUpdate";
            case AWSCloudWatchHistoryItemTypeAction:
                return @"Action";
            case AWSCloudWatchHistoryItemTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudWatchDescribeAlarmHistoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmHistoryItems" : @"AlarmHistoryItems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)alarmHistoryItemsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchAlarmHistoryItem class]];
}

@end

@implementation AWSCloudWatchDescribeAlarmsForMetricInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"metricName" : @"MetricName",
             @"namespace" : @"Namespace",
             @"period" : @"Period",
             @"statistic" : @"Statistic",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDimension class]];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"SampleCount"]) {
            return @(AWSCloudWatchStatisticSampleCount);
        }
        if ([value isEqualToString:@"Average"]) {
            return @(AWSCloudWatchStatisticAverage);
        }
        if ([value isEqualToString:@"Sum"]) {
            return @(AWSCloudWatchStatisticSum);
        }
        if ([value isEqualToString:@"Minimum"]) {
            return @(AWSCloudWatchStatisticMinimum);
        }
        if ([value isEqualToString:@"Maximum"]) {
            return @(AWSCloudWatchStatisticMaximum);
        }
        return @(AWSCloudWatchStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStatisticSampleCount:
                return @"SampleCount";
            case AWSCloudWatchStatisticAverage:
                return @"Average";
            case AWSCloudWatchStatisticSum:
                return @"Sum";
            case AWSCloudWatchStatisticMinimum:
                return @"Minimum";
            case AWSCloudWatchStatisticMaximum:
                return @"Maximum";
            case AWSCloudWatchStatisticUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Seconds"]) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value isEqualToString:@"Microseconds"]) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value isEqualToString:@"Milliseconds"]) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value isEqualToString:@"Bytes"]) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value isEqualToString:@"Kilobytes"]) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value isEqualToString:@"Megabytes"]) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value isEqualToString:@"Gigabytes"]) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value isEqualToString:@"Terabytes"]) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value isEqualToString:@"Bits"]) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value isEqualToString:@"Kilobits"]) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value isEqualToString:@"Megabits"]) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value isEqualToString:@"Gigabits"]) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value isEqualToString:@"Terabits"]) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value isEqualToString:@"Percent"]) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value isEqualToString:@"Count"]) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value isEqualToString:@"Bytes/Second"]) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value isEqualToString:@"Kilobytes/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value isEqualToString:@"Megabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value isEqualToString:@"Gigabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value isEqualToString:@"Terabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value isEqualToString:@"Bits/Second"]) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value isEqualToString:@"Kilobits/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value isEqualToString:@"Megabits/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value isEqualToString:@"Gigabits/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value isEqualToString:@"Terabits/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value isEqualToString:@"Count/Second"]) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value isEqualToString:@"None"]) {
            return @(AWSCloudWatchStandardUnitNone);
        }
        return @(AWSCloudWatchStandardUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStandardUnitSeconds:
                return @"Seconds";
            case AWSCloudWatchStandardUnitMicroseconds:
                return @"Microseconds";
            case AWSCloudWatchStandardUnitMilliseconds:
                return @"Milliseconds";
            case AWSCloudWatchStandardUnitBytes:
                return @"Bytes";
            case AWSCloudWatchStandardUnitKilobytes:
                return @"Kilobytes";
            case AWSCloudWatchStandardUnitMegabytes:
                return @"Megabytes";
            case AWSCloudWatchStandardUnitGigabytes:
                return @"Gigabytes";
            case AWSCloudWatchStandardUnitTerabytes:
                return @"Terabytes";
            case AWSCloudWatchStandardUnitBits:
                return @"Bits";
            case AWSCloudWatchStandardUnitKilobits:
                return @"Kilobits";
            case AWSCloudWatchStandardUnitMegabits:
                return @"Megabits";
            case AWSCloudWatchStandardUnitGigabits:
                return @"Gigabits";
            case AWSCloudWatchStandardUnitTerabits:
                return @"Terabits";
            case AWSCloudWatchStandardUnitPercent:
                return @"Percent";
            case AWSCloudWatchStandardUnitCount:
                return @"Count";
            case AWSCloudWatchStandardUnitBytesSecond:
                return @"Bytes/Second";
            case AWSCloudWatchStandardUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSCloudWatchStandardUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSCloudWatchStandardUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSCloudWatchStandardUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSCloudWatchStandardUnitBitsSecond:
                return @"Bits/Second";
            case AWSCloudWatchStandardUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSCloudWatchStandardUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSCloudWatchStandardUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSCloudWatchStandardUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSCloudWatchStandardUnitCountSecond:
                return @"Count/Second";
            case AWSCloudWatchStandardUnitNone:
                return @"None";
            case AWSCloudWatchStandardUnitUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchDescribeAlarmsForMetricOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricAlarms" : @"MetricAlarms",
             };
}

+ (NSValueTransformer *)metricAlarmsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchMetricAlarm class]];
}

@end

@implementation AWSCloudWatchDescribeAlarmsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionPrefix" : @"ActionPrefix",
             @"alarmNamePrefix" : @"AlarmNamePrefix",
             @"alarmNames" : @"AlarmNames",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             @"stateValue" : @"StateValue",
             };
}

+ (NSValueTransformer *)stateValueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"OK"]) {
            return @(AWSCloudWatchStateValueOK);
        }
        if ([value isEqualToString:@"ALARM"]) {
            return @(AWSCloudWatchStateValueAlarm);
        }
        if ([value isEqualToString:@"INSUFFICIENT_DATA"]) {
            return @(AWSCloudWatchStateValueInsufficientData);
        }
        return @(AWSCloudWatchStateValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStateValueOK:
                return @"OK";
            case AWSCloudWatchStateValueAlarm:
                return @"ALARM";
            case AWSCloudWatchStateValueInsufficientData:
                return @"INSUFFICIENT_DATA";
            case AWSCloudWatchStateValueUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchDescribeAlarmsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricAlarms" : @"MetricAlarms",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)metricAlarmsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchMetricAlarm class]];
}

@end

@implementation AWSCloudWatchDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSCloudWatchDimensionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSCloudWatchDisableAlarmActionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmNames" : @"AlarmNames",
             };
}

@end

@implementation AWSCloudWatchEnableAlarmActionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmNames" : @"AlarmNames",
             };
}

@end

@implementation AWSCloudWatchGetMetricStatisticsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"endTime" : @"EndTime",
             @"metricName" : @"MetricName",
             @"namespace" : @"Namespace",
             @"period" : @"Period",
             @"startTime" : @"StartTime",
             @"statistics" : @"Statistics",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDimension class]];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Seconds"]) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value isEqualToString:@"Microseconds"]) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value isEqualToString:@"Milliseconds"]) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value isEqualToString:@"Bytes"]) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value isEqualToString:@"Kilobytes"]) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value isEqualToString:@"Megabytes"]) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value isEqualToString:@"Gigabytes"]) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value isEqualToString:@"Terabytes"]) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value isEqualToString:@"Bits"]) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value isEqualToString:@"Kilobits"]) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value isEqualToString:@"Megabits"]) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value isEqualToString:@"Gigabits"]) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value isEqualToString:@"Terabits"]) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value isEqualToString:@"Percent"]) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value isEqualToString:@"Count"]) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value isEqualToString:@"Bytes/Second"]) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value isEqualToString:@"Kilobytes/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value isEqualToString:@"Megabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value isEqualToString:@"Gigabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value isEqualToString:@"Terabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value isEqualToString:@"Bits/Second"]) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value isEqualToString:@"Kilobits/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value isEqualToString:@"Megabits/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value isEqualToString:@"Gigabits/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value isEqualToString:@"Terabits/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value isEqualToString:@"Count/Second"]) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value isEqualToString:@"None"]) {
            return @(AWSCloudWatchStandardUnitNone);
        }
        return @(AWSCloudWatchStandardUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStandardUnitSeconds:
                return @"Seconds";
            case AWSCloudWatchStandardUnitMicroseconds:
                return @"Microseconds";
            case AWSCloudWatchStandardUnitMilliseconds:
                return @"Milliseconds";
            case AWSCloudWatchStandardUnitBytes:
                return @"Bytes";
            case AWSCloudWatchStandardUnitKilobytes:
                return @"Kilobytes";
            case AWSCloudWatchStandardUnitMegabytes:
                return @"Megabytes";
            case AWSCloudWatchStandardUnitGigabytes:
                return @"Gigabytes";
            case AWSCloudWatchStandardUnitTerabytes:
                return @"Terabytes";
            case AWSCloudWatchStandardUnitBits:
                return @"Bits";
            case AWSCloudWatchStandardUnitKilobits:
                return @"Kilobits";
            case AWSCloudWatchStandardUnitMegabits:
                return @"Megabits";
            case AWSCloudWatchStandardUnitGigabits:
                return @"Gigabits";
            case AWSCloudWatchStandardUnitTerabits:
                return @"Terabits";
            case AWSCloudWatchStandardUnitPercent:
                return @"Percent";
            case AWSCloudWatchStandardUnitCount:
                return @"Count";
            case AWSCloudWatchStandardUnitBytesSecond:
                return @"Bytes/Second";
            case AWSCloudWatchStandardUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSCloudWatchStandardUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSCloudWatchStandardUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSCloudWatchStandardUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSCloudWatchStandardUnitBitsSecond:
                return @"Bits/Second";
            case AWSCloudWatchStandardUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSCloudWatchStandardUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSCloudWatchStandardUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSCloudWatchStandardUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSCloudWatchStandardUnitCountSecond:
                return @"Count/Second";
            case AWSCloudWatchStandardUnitNone:
                return @"None";
            case AWSCloudWatchStandardUnitUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchGetMetricStatisticsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datapoints" : @"Datapoints",
             @"label" : @"Label",
             };
}

+ (NSValueTransformer *)datapointsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDatapoint class]];
}

@end

@implementation AWSCloudWatchListMetricsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"metricName" : @"MetricName",
             @"namespace" : @"Namespace",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDimensionFilter class]];
}

@end

@implementation AWSCloudWatchListMetricsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metrics" : @"Metrics",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)metricsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchMetric class]];
}

@end

@implementation AWSCloudWatchMetric

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"metricName" : @"MetricName",
             @"namespace" : @"Namespace",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDimension class]];
}

@end

@implementation AWSCloudWatchMetricAlarm

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionsEnabled" : @"ActionsEnabled",
             @"alarmActions" : @"AlarmActions",
             @"alarmArn" : @"AlarmArn",
             @"alarmConfigurationUpdatedTimestamp" : @"AlarmConfigurationUpdatedTimestamp",
             @"alarmDescription" : @"AlarmDescription",
             @"alarmName" : @"AlarmName",
             @"comparisonOperator" : @"ComparisonOperator",
             @"dimensions" : @"Dimensions",
             @"evaluationPeriods" : @"EvaluationPeriods",
             @"insufficientDataActions" : @"InsufficientDataActions",
             @"metricName" : @"MetricName",
             @"namespace" : @"Namespace",
             @"OKActions" : @"OKActions",
             @"period" : @"Period",
             @"stateReason" : @"StateReason",
             @"stateReasonData" : @"StateReasonData",
             @"stateUpdatedTimestamp" : @"StateUpdatedTimestamp",
             @"stateValue" : @"StateValue",
             @"statistic" : @"Statistic",
             @"threshold" : @"Threshold",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)alarmConfigurationUpdatedTimestampJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"GreaterThanOrEqualToThreshold"]) {
            return @(AWSCloudWatchComparisonOperatorGreaterThanOrEqualToThreshold);
        }
        if ([value isEqualToString:@"GreaterThanThreshold"]) {
            return @(AWSCloudWatchComparisonOperatorGreaterThanThreshold);
        }
        if ([value isEqualToString:@"LessThanThreshold"]) {
            return @(AWSCloudWatchComparisonOperatorLessThanThreshold);
        }
        if ([value isEqualToString:@"LessThanOrEqualToThreshold"]) {
            return @(AWSCloudWatchComparisonOperatorLessThanOrEqualToThreshold);
        }
        return @(AWSCloudWatchComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchComparisonOperatorGreaterThanOrEqualToThreshold:
                return @"GreaterThanOrEqualToThreshold";
            case AWSCloudWatchComparisonOperatorGreaterThanThreshold:
                return @"GreaterThanThreshold";
            case AWSCloudWatchComparisonOperatorLessThanThreshold:
                return @"LessThanThreshold";
            case AWSCloudWatchComparisonOperatorLessThanOrEqualToThreshold:
                return @"LessThanOrEqualToThreshold";
            case AWSCloudWatchComparisonOperatorUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDimension class]];
}

+ (NSValueTransformer *)stateUpdatedTimestampJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateValueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"OK"]) {
            return @(AWSCloudWatchStateValueOK);
        }
        if ([value isEqualToString:@"ALARM"]) {
            return @(AWSCloudWatchStateValueAlarm);
        }
        if ([value isEqualToString:@"INSUFFICIENT_DATA"]) {
            return @(AWSCloudWatchStateValueInsufficientData);
        }
        return @(AWSCloudWatchStateValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStateValueOK:
                return @"OK";
            case AWSCloudWatchStateValueAlarm:
                return @"ALARM";
            case AWSCloudWatchStateValueInsufficientData:
                return @"INSUFFICIENT_DATA";
            case AWSCloudWatchStateValueUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"SampleCount"]) {
            return @(AWSCloudWatchStatisticSampleCount);
        }
        if ([value isEqualToString:@"Average"]) {
            return @(AWSCloudWatchStatisticAverage);
        }
        if ([value isEqualToString:@"Sum"]) {
            return @(AWSCloudWatchStatisticSum);
        }
        if ([value isEqualToString:@"Minimum"]) {
            return @(AWSCloudWatchStatisticMinimum);
        }
        if ([value isEqualToString:@"Maximum"]) {
            return @(AWSCloudWatchStatisticMaximum);
        }
        return @(AWSCloudWatchStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStatisticSampleCount:
                return @"SampleCount";
            case AWSCloudWatchStatisticAverage:
                return @"Average";
            case AWSCloudWatchStatisticSum:
                return @"Sum";
            case AWSCloudWatchStatisticMinimum:
                return @"Minimum";
            case AWSCloudWatchStatisticMaximum:
                return @"Maximum";
            case AWSCloudWatchStatisticUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Seconds"]) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value isEqualToString:@"Microseconds"]) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value isEqualToString:@"Milliseconds"]) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value isEqualToString:@"Bytes"]) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value isEqualToString:@"Kilobytes"]) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value isEqualToString:@"Megabytes"]) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value isEqualToString:@"Gigabytes"]) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value isEqualToString:@"Terabytes"]) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value isEqualToString:@"Bits"]) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value isEqualToString:@"Kilobits"]) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value isEqualToString:@"Megabits"]) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value isEqualToString:@"Gigabits"]) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value isEqualToString:@"Terabits"]) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value isEqualToString:@"Percent"]) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value isEqualToString:@"Count"]) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value isEqualToString:@"Bytes/Second"]) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value isEqualToString:@"Kilobytes/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value isEqualToString:@"Megabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value isEqualToString:@"Gigabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value isEqualToString:@"Terabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value isEqualToString:@"Bits/Second"]) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value isEqualToString:@"Kilobits/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value isEqualToString:@"Megabits/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value isEqualToString:@"Gigabits/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value isEqualToString:@"Terabits/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value isEqualToString:@"Count/Second"]) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value isEqualToString:@"None"]) {
            return @(AWSCloudWatchStandardUnitNone);
        }
        return @(AWSCloudWatchStandardUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStandardUnitSeconds:
                return @"Seconds";
            case AWSCloudWatchStandardUnitMicroseconds:
                return @"Microseconds";
            case AWSCloudWatchStandardUnitMilliseconds:
                return @"Milliseconds";
            case AWSCloudWatchStandardUnitBytes:
                return @"Bytes";
            case AWSCloudWatchStandardUnitKilobytes:
                return @"Kilobytes";
            case AWSCloudWatchStandardUnitMegabytes:
                return @"Megabytes";
            case AWSCloudWatchStandardUnitGigabytes:
                return @"Gigabytes";
            case AWSCloudWatchStandardUnitTerabytes:
                return @"Terabytes";
            case AWSCloudWatchStandardUnitBits:
                return @"Bits";
            case AWSCloudWatchStandardUnitKilobits:
                return @"Kilobits";
            case AWSCloudWatchStandardUnitMegabits:
                return @"Megabits";
            case AWSCloudWatchStandardUnitGigabits:
                return @"Gigabits";
            case AWSCloudWatchStandardUnitTerabits:
                return @"Terabits";
            case AWSCloudWatchStandardUnitPercent:
                return @"Percent";
            case AWSCloudWatchStandardUnitCount:
                return @"Count";
            case AWSCloudWatchStandardUnitBytesSecond:
                return @"Bytes/Second";
            case AWSCloudWatchStandardUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSCloudWatchStandardUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSCloudWatchStandardUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSCloudWatchStandardUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSCloudWatchStandardUnitBitsSecond:
                return @"Bits/Second";
            case AWSCloudWatchStandardUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSCloudWatchStandardUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSCloudWatchStandardUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSCloudWatchStandardUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSCloudWatchStandardUnitCountSecond:
                return @"Count/Second";
            case AWSCloudWatchStandardUnitNone:
                return @"None";
            case AWSCloudWatchStandardUnitUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchMetricDatum

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"metricName" : @"MetricName",
             @"statisticValues" : @"StatisticValues",
             @"timestamp" : @"Timestamp",
             @"unit" : @"Unit",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDimension class]];
}

+ (NSValueTransformer *)statisticValuesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudWatchStatisticSet class]];
}

+ (NSValueTransformer *)timestampJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Seconds"]) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value isEqualToString:@"Microseconds"]) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value isEqualToString:@"Milliseconds"]) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value isEqualToString:@"Bytes"]) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value isEqualToString:@"Kilobytes"]) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value isEqualToString:@"Megabytes"]) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value isEqualToString:@"Gigabytes"]) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value isEqualToString:@"Terabytes"]) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value isEqualToString:@"Bits"]) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value isEqualToString:@"Kilobits"]) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value isEqualToString:@"Megabits"]) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value isEqualToString:@"Gigabits"]) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value isEqualToString:@"Terabits"]) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value isEqualToString:@"Percent"]) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value isEqualToString:@"Count"]) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value isEqualToString:@"Bytes/Second"]) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value isEqualToString:@"Kilobytes/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value isEqualToString:@"Megabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value isEqualToString:@"Gigabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value isEqualToString:@"Terabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value isEqualToString:@"Bits/Second"]) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value isEqualToString:@"Kilobits/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value isEqualToString:@"Megabits/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value isEqualToString:@"Gigabits/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value isEqualToString:@"Terabits/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value isEqualToString:@"Count/Second"]) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value isEqualToString:@"None"]) {
            return @(AWSCloudWatchStandardUnitNone);
        }
        return @(AWSCloudWatchStandardUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStandardUnitSeconds:
                return @"Seconds";
            case AWSCloudWatchStandardUnitMicroseconds:
                return @"Microseconds";
            case AWSCloudWatchStandardUnitMilliseconds:
                return @"Milliseconds";
            case AWSCloudWatchStandardUnitBytes:
                return @"Bytes";
            case AWSCloudWatchStandardUnitKilobytes:
                return @"Kilobytes";
            case AWSCloudWatchStandardUnitMegabytes:
                return @"Megabytes";
            case AWSCloudWatchStandardUnitGigabytes:
                return @"Gigabytes";
            case AWSCloudWatchStandardUnitTerabytes:
                return @"Terabytes";
            case AWSCloudWatchStandardUnitBits:
                return @"Bits";
            case AWSCloudWatchStandardUnitKilobits:
                return @"Kilobits";
            case AWSCloudWatchStandardUnitMegabits:
                return @"Megabits";
            case AWSCloudWatchStandardUnitGigabits:
                return @"Gigabits";
            case AWSCloudWatchStandardUnitTerabits:
                return @"Terabits";
            case AWSCloudWatchStandardUnitPercent:
                return @"Percent";
            case AWSCloudWatchStandardUnitCount:
                return @"Count";
            case AWSCloudWatchStandardUnitBytesSecond:
                return @"Bytes/Second";
            case AWSCloudWatchStandardUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSCloudWatchStandardUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSCloudWatchStandardUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSCloudWatchStandardUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSCloudWatchStandardUnitBitsSecond:
                return @"Bits/Second";
            case AWSCloudWatchStandardUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSCloudWatchStandardUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSCloudWatchStandardUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSCloudWatchStandardUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSCloudWatchStandardUnitCountSecond:
                return @"Count/Second";
            case AWSCloudWatchStandardUnitNone:
                return @"None";
            case AWSCloudWatchStandardUnitUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchPutMetricAlarmInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionsEnabled" : @"ActionsEnabled",
             @"alarmActions" : @"AlarmActions",
             @"alarmDescription" : @"AlarmDescription",
             @"alarmName" : @"AlarmName",
             @"comparisonOperator" : @"ComparisonOperator",
             @"dimensions" : @"Dimensions",
             @"evaluationPeriods" : @"EvaluationPeriods",
             @"insufficientDataActions" : @"InsufficientDataActions",
             @"metricName" : @"MetricName",
             @"namespace" : @"Namespace",
             @"OKActions" : @"OKActions",
             @"period" : @"Period",
             @"statistic" : @"Statistic",
             @"threshold" : @"Threshold",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"GreaterThanOrEqualToThreshold"]) {
            return @(AWSCloudWatchComparisonOperatorGreaterThanOrEqualToThreshold);
        }
        if ([value isEqualToString:@"GreaterThanThreshold"]) {
            return @(AWSCloudWatchComparisonOperatorGreaterThanThreshold);
        }
        if ([value isEqualToString:@"LessThanThreshold"]) {
            return @(AWSCloudWatchComparisonOperatorLessThanThreshold);
        }
        if ([value isEqualToString:@"LessThanOrEqualToThreshold"]) {
            return @(AWSCloudWatchComparisonOperatorLessThanOrEqualToThreshold);
        }
        return @(AWSCloudWatchComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchComparisonOperatorGreaterThanOrEqualToThreshold:
                return @"GreaterThanOrEqualToThreshold";
            case AWSCloudWatchComparisonOperatorGreaterThanThreshold:
                return @"GreaterThanThreshold";
            case AWSCloudWatchComparisonOperatorLessThanThreshold:
                return @"LessThanThreshold";
            case AWSCloudWatchComparisonOperatorLessThanOrEqualToThreshold:
                return @"LessThanOrEqualToThreshold";
            case AWSCloudWatchComparisonOperatorUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDimension class]];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"SampleCount"]) {
            return @(AWSCloudWatchStatisticSampleCount);
        }
        if ([value isEqualToString:@"Average"]) {
            return @(AWSCloudWatchStatisticAverage);
        }
        if ([value isEqualToString:@"Sum"]) {
            return @(AWSCloudWatchStatisticSum);
        }
        if ([value isEqualToString:@"Minimum"]) {
            return @(AWSCloudWatchStatisticMinimum);
        }
        if ([value isEqualToString:@"Maximum"]) {
            return @(AWSCloudWatchStatisticMaximum);
        }
        return @(AWSCloudWatchStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStatisticSampleCount:
                return @"SampleCount";
            case AWSCloudWatchStatisticAverage:
                return @"Average";
            case AWSCloudWatchStatisticSum:
                return @"Sum";
            case AWSCloudWatchStatisticMinimum:
                return @"Minimum";
            case AWSCloudWatchStatisticMaximum:
                return @"Maximum";
            case AWSCloudWatchStatisticUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Seconds"]) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value isEqualToString:@"Microseconds"]) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value isEqualToString:@"Milliseconds"]) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value isEqualToString:@"Bytes"]) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value isEqualToString:@"Kilobytes"]) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value isEqualToString:@"Megabytes"]) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value isEqualToString:@"Gigabytes"]) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value isEqualToString:@"Terabytes"]) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value isEqualToString:@"Bits"]) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value isEqualToString:@"Kilobits"]) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value isEqualToString:@"Megabits"]) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value isEqualToString:@"Gigabits"]) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value isEqualToString:@"Terabits"]) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value isEqualToString:@"Percent"]) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value isEqualToString:@"Count"]) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value isEqualToString:@"Bytes/Second"]) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value isEqualToString:@"Kilobytes/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value isEqualToString:@"Megabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value isEqualToString:@"Gigabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value isEqualToString:@"Terabytes/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value isEqualToString:@"Bits/Second"]) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value isEqualToString:@"Kilobits/Second"]) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value isEqualToString:@"Megabits/Second"]) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value isEqualToString:@"Gigabits/Second"]) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value isEqualToString:@"Terabits/Second"]) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value isEqualToString:@"Count/Second"]) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value isEqualToString:@"None"]) {
            return @(AWSCloudWatchStandardUnitNone);
        }
        return @(AWSCloudWatchStandardUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStandardUnitSeconds:
                return @"Seconds";
            case AWSCloudWatchStandardUnitMicroseconds:
                return @"Microseconds";
            case AWSCloudWatchStandardUnitMilliseconds:
                return @"Milliseconds";
            case AWSCloudWatchStandardUnitBytes:
                return @"Bytes";
            case AWSCloudWatchStandardUnitKilobytes:
                return @"Kilobytes";
            case AWSCloudWatchStandardUnitMegabytes:
                return @"Megabytes";
            case AWSCloudWatchStandardUnitGigabytes:
                return @"Gigabytes";
            case AWSCloudWatchStandardUnitTerabytes:
                return @"Terabytes";
            case AWSCloudWatchStandardUnitBits:
                return @"Bits";
            case AWSCloudWatchStandardUnitKilobits:
                return @"Kilobits";
            case AWSCloudWatchStandardUnitMegabits:
                return @"Megabits";
            case AWSCloudWatchStandardUnitGigabits:
                return @"Gigabits";
            case AWSCloudWatchStandardUnitTerabits:
                return @"Terabits";
            case AWSCloudWatchStandardUnitPercent:
                return @"Percent";
            case AWSCloudWatchStandardUnitCount:
                return @"Count";
            case AWSCloudWatchStandardUnitBytesSecond:
                return @"Bytes/Second";
            case AWSCloudWatchStandardUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSCloudWatchStandardUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSCloudWatchStandardUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSCloudWatchStandardUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSCloudWatchStandardUnitBitsSecond:
                return @"Bits/Second";
            case AWSCloudWatchStandardUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSCloudWatchStandardUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSCloudWatchStandardUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSCloudWatchStandardUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSCloudWatchStandardUnitCountSecond:
                return @"Count/Second";
            case AWSCloudWatchStandardUnitNone:
                return @"None";
            case AWSCloudWatchStandardUnitUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchPutMetricDataInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricData" : @"MetricData",
             @"namespace" : @"Namespace",
             };
}

+ (NSValueTransformer *)metricDataJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchMetricDatum class]];
}

@end

@implementation AWSCloudWatchSetAlarmStateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmName" : @"AlarmName",
             @"stateReason" : @"StateReason",
             @"stateReasonData" : @"StateReasonData",
             @"stateValue" : @"StateValue",
             };
}

+ (NSValueTransformer *)stateValueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"OK"]) {
            return @(AWSCloudWatchStateValueOK);
        }
        if ([value isEqualToString:@"ALARM"]) {
            return @(AWSCloudWatchStateValueAlarm);
        }
        if ([value isEqualToString:@"INSUFFICIENT_DATA"]) {
            return @(AWSCloudWatchStateValueInsufficientData);
        }
        return @(AWSCloudWatchStateValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStateValueOK:
                return @"OK";
            case AWSCloudWatchStateValueAlarm:
                return @"ALARM";
            case AWSCloudWatchStateValueInsufficientData:
                return @"INSUFFICIENT_DATA";
            case AWSCloudWatchStateValueUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchStatisticSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximum" : @"Maximum",
             @"minimum" : @"Minimum",
             @"sampleCount" : @"SampleCount",
             @"sum" : @"Sum",
             };
}

@end
