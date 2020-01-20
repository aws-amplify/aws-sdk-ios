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
        if ([value caseInsensitiveCompare:@"ConfigurationUpdate"] == NSOrderedSame) {
            return @(AWSCloudWatchHistoryItemTypeConfigurationUpdate);
        }
        if ([value caseInsensitiveCompare:@"StateUpdate"] == NSOrderedSame) {
            return @(AWSCloudWatchHistoryItemTypeStateUpdate);
        }
        if ([value caseInsensitiveCompare:@"Action"] == NSOrderedSame) {
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

@implementation AWSCloudWatchDashboardEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardArn" : @"DashboardArn",
             @"dashboardName" : @"DashboardName",
             @"lastModified" : @"LastModified",
             @"size" : @"Size",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudWatchDashboardValidationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataPath" : @"DataPath",
             @"message" : @"Message",
             };
}

@end

@implementation AWSCloudWatchDatapoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"average" : @"Average",
             @"extendedStatistics" : @"ExtendedStatistics",
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
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
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

@implementation AWSCloudWatchDeleteDashboardsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardNames" : @"DashboardNames",
             };
}

@end

@implementation AWSCloudWatchDeleteDashboardsOutput

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
        if ([value caseInsensitiveCompare:@"ConfigurationUpdate"] == NSOrderedSame) {
            return @(AWSCloudWatchHistoryItemTypeConfigurationUpdate);
        }
        if ([value caseInsensitiveCompare:@"StateUpdate"] == NSOrderedSame) {
            return @(AWSCloudWatchHistoryItemTypeStateUpdate);
        }
        if ([value caseInsensitiveCompare:@"Action"] == NSOrderedSame) {
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
             @"extendedStatistic" : @"ExtendedStatistic",
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
        if ([value caseInsensitiveCompare:@"SampleCount"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticSampleCount);
        }
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticAverage);
        }
        if ([value caseInsensitiveCompare:@"Sum"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticSum);
        }
        if ([value caseInsensitiveCompare:@"Minimum"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticMinimum);
        }
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
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
        if ([value caseInsensitiveCompare:@"OK"] == NSOrderedSame) {
            return @(AWSCloudWatchStateValueOK);
        }
        if ([value caseInsensitiveCompare:@"ALARM"] == NSOrderedSame) {
            return @(AWSCloudWatchStateValueAlarm);
        }
        if ([value caseInsensitiveCompare:@"INSUFFICIENT_DATA"] == NSOrderedSame) {
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

@implementation AWSCloudWatchGetDashboardInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardName" : @"DashboardName",
             };
}

@end

@implementation AWSCloudWatchGetDashboardOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardArn" : @"DashboardArn",
             @"dashboardBody" : @"DashboardBody",
             @"dashboardName" : @"DashboardName",
             };
}

@end

@implementation AWSCloudWatchGetMetricDataInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"maxDatapoints" : @"MaxDatapoints",
             @"metricDataQueries" : @"MetricDataQueries",
             @"nextToken" : @"NextToken",
             @"scanBy" : @"ScanBy",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)metricDataQueriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchMetricDataQuery class]];
}

+ (NSValueTransformer *)scanByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TimestampDescending"] == NSOrderedSame) {
            return @(AWSCloudWatchScanByTimestampDescending);
        }
        if ([value caseInsensitiveCompare:@"TimestampAscending"] == NSOrderedSame) {
            return @(AWSCloudWatchScanByTimestampAscending);
        }
        return @(AWSCloudWatchScanByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchScanByTimestampDescending:
                return @"TimestampDescending";
            case AWSCloudWatchScanByTimestampAscending:
                return @"TimestampAscending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudWatchGetMetricDataOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricDataResults" : @"MetricDataResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)metricDataResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchMetricDataResult class]];
}

@end

@implementation AWSCloudWatchGetMetricStatisticsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"endTime" : @"EndTime",
             @"extendedStatistics" : @"ExtendedStatistics",
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
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
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

@implementation AWSCloudWatchGetMetricWidgetImageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricWidget" : @"MetricWidget",
             @"outputFormat" : @"OutputFormat",
             };
}

@end

@implementation AWSCloudWatchGetMetricWidgetImageOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricWidgetImage" : @"MetricWidgetImage",
             };
}

@end

@implementation AWSCloudWatchListDashboardsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardNamePrefix" : @"DashboardNamePrefix",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCloudWatchListDashboardsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardEntries" : @"DashboardEntries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)dashboardEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDashboardEntry class]];
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

@implementation AWSCloudWatchMessageData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"value" : @"Value",
             };
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
             @"datapointsToAlarm" : @"DatapointsToAlarm",
             @"dimensions" : @"Dimensions",
             @"evaluateLowSampleCountPercentile" : @"EvaluateLowSampleCountPercentile",
             @"evaluationPeriods" : @"EvaluationPeriods",
             @"extendedStatistic" : @"ExtendedStatistic",
             @"insufficientDataActions" : @"InsufficientDataActions",
             @"metricName" : @"MetricName",
             @"metrics" : @"Metrics",
             @"namespace" : @"Namespace",
             @"OKActions" : @"OKActions",
             @"period" : @"Period",
             @"stateReason" : @"StateReason",
             @"stateReasonData" : @"StateReasonData",
             @"stateUpdatedTimestamp" : @"StateUpdatedTimestamp",
             @"stateValue" : @"StateValue",
             @"statistic" : @"Statistic",
             @"threshold" : @"Threshold",
             @"treatMissingData" : @"TreatMissingData",
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
        if ([value caseInsensitiveCompare:@"GreaterThanOrEqualToThreshold"] == NSOrderedSame) {
            return @(AWSCloudWatchComparisonOperatorGreaterThanOrEqualToThreshold);
        }
        if ([value caseInsensitiveCompare:@"GreaterThanThreshold"] == NSOrderedSame) {
            return @(AWSCloudWatchComparisonOperatorGreaterThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanThreshold"] == NSOrderedSame) {
            return @(AWSCloudWatchComparisonOperatorLessThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanOrEqualToThreshold"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDimension class]];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchMetricDataQuery class]];
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
        if ([value caseInsensitiveCompare:@"OK"] == NSOrderedSame) {
            return @(AWSCloudWatchStateValueOK);
        }
        if ([value caseInsensitiveCompare:@"ALARM"] == NSOrderedSame) {
            return @(AWSCloudWatchStateValueAlarm);
        }
        if ([value caseInsensitiveCompare:@"INSUFFICIENT_DATA"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SampleCount"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticSampleCount);
        }
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticAverage);
        }
        if ([value caseInsensitiveCompare:@"Sum"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticSum);
        }
        if ([value caseInsensitiveCompare:@"Minimum"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticMinimum);
        }
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchMetricDataQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expression" : @"Expression",
             @"identifier" : @"Id",
             @"label" : @"Label",
             @"metricStat" : @"MetricStat",
             @"returnData" : @"ReturnData",
             };
}

+ (NSValueTransformer *)metricStatJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudWatchMetricStat class]];
}

@end

@implementation AWSCloudWatchMetricDataResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"label" : @"Label",
             @"messages" : @"Messages",
             @"statusCode" : @"StatusCode",
             @"timestamps" : @"Timestamps",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)messagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchMessageData class]];
}

+ (NSValueTransformer *)statusCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSCloudWatchStatusCodeComplete);
        }
        if ([value caseInsensitiveCompare:@"InternalError"] == NSOrderedSame) {
            return @(AWSCloudWatchStatusCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"PartialData"] == NSOrderedSame) {
            return @(AWSCloudWatchStatusCodePartialData);
        }
        return @(AWSCloudWatchStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudWatchStatusCodeComplete:
                return @"Complete";
            case AWSCloudWatchStatusCodeInternalError:
                return @"InternalError";
            case AWSCloudWatchStatusCodePartialData:
                return @"PartialData";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchMetricDatum

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"counts" : @"Counts",
             @"dimensions" : @"Dimensions",
             @"metricName" : @"MetricName",
             @"statisticValues" : @"StatisticValues",
             @"storageResolution" : @"StorageResolution",
             @"timestamp" : @"Timestamp",
             @"unit" : @"Unit",
             @"value" : @"Value",
             @"values" : @"Values",
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
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchMetricStat

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metric" : @"Metric",
             @"period" : @"Period",
             @"stat" : @"Stat",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)metricJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudWatchMetric class]];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudWatchPutDashboardInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardBody" : @"DashboardBody",
             @"dashboardName" : @"DashboardName",
             };
}

@end

@implementation AWSCloudWatchPutDashboardOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardValidationMessages" : @"DashboardValidationMessages",
             };
}

+ (NSValueTransformer *)dashboardValidationMessagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDashboardValidationMessage class]];
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
             @"datapointsToAlarm" : @"DatapointsToAlarm",
             @"dimensions" : @"Dimensions",
             @"evaluateLowSampleCountPercentile" : @"EvaluateLowSampleCountPercentile",
             @"evaluationPeriods" : @"EvaluationPeriods",
             @"extendedStatistic" : @"ExtendedStatistic",
             @"insufficientDataActions" : @"InsufficientDataActions",
             @"metricName" : @"MetricName",
             @"metrics" : @"Metrics",
             @"namespace" : @"Namespace",
             @"OKActions" : @"OKActions",
             @"period" : @"Period",
             @"statistic" : @"Statistic",
             @"threshold" : @"Threshold",
             @"treatMissingData" : @"TreatMissingData",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GreaterThanOrEqualToThreshold"] == NSOrderedSame) {
            return @(AWSCloudWatchComparisonOperatorGreaterThanOrEqualToThreshold);
        }
        if ([value caseInsensitiveCompare:@"GreaterThanThreshold"] == NSOrderedSame) {
            return @(AWSCloudWatchComparisonOperatorGreaterThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanThreshold"] == NSOrderedSame) {
            return @(AWSCloudWatchComparisonOperatorLessThanThreshold);
        }
        if ([value caseInsensitiveCompare:@"LessThanOrEqualToThreshold"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchDimension class]];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudWatchMetricDataQuery class]];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SampleCount"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticSampleCount);
        }
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticAverage);
        }
        if ([value caseInsensitiveCompare:@"Sum"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticSum);
        }
        if ([value caseInsensitiveCompare:@"Minimum"] == NSOrderedSame) {
            return @(AWSCloudWatchStatisticMinimum);
        }
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSCloudWatchStandardUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
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
        if ([value caseInsensitiveCompare:@"OK"] == NSOrderedSame) {
            return @(AWSCloudWatchStateValueOK);
        }
        if ([value caseInsensitiveCompare:@"ALARM"] == NSOrderedSame) {
            return @(AWSCloudWatchStateValueAlarm);
        }
        if ([value caseInsensitiveCompare:@"INSUFFICIENT_DATA"] == NSOrderedSame) {
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
