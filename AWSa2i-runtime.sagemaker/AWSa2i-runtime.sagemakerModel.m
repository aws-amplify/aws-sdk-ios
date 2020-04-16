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

#import "AWSa2i-runtime.sagemakerModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSa2i-runtime.sagemakerErrorDomain = @"com.amazonaws.AWSa2i-runtime.sagemakerErrorDomain";

@implementation AWSa2i-runtime.sagemakerDeleteHumanLoopRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopName" : @"HumanLoopName",
             };
}

@end

@implementation AWSa2i-runtime.sagemakerDeleteHumanLoopResponse

@end

@implementation AWSa2i-runtime.sagemakerDescribeHumanLoopRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopName" : @"HumanLoopName",
             };
}

@end

@implementation AWSa2i-runtime.sagemakerDescribeHumanLoopResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"failureCode" : @"FailureCode",
             @"failureReason" : @"FailureReason",
             @"flowDefinitionArn" : @"FlowDefinitionArn",
             @"humanLoopArn" : @"HumanLoopArn",
             @"humanLoopName" : @"HumanLoopName",
             @"humanLoopOutput" : @"HumanLoopOutput",
             @"humanLoopStatus" : @"HumanLoopStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)humanLoopOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSa2i-runtime.sagemakerHumanLoopOutput class]];
}

+ (NSValueTransformer *)humanLoopStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerHumanLoopStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerHumanLoopStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerHumanLoopStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerHumanLoopStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerHumanLoopStatusStopping);
        }
        return @(AWSa2i-runtime.sagemakerHumanLoopStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSa2i-runtime.sagemakerHumanLoopStatusInProgress:
                return @"InProgress";
            case AWSa2i-runtime.sagemakerHumanLoopStatusFailed:
                return @"Failed";
            case AWSa2i-runtime.sagemakerHumanLoopStatusCompleted:
                return @"Completed";
            case AWSa2i-runtime.sagemakerHumanLoopStatusStopped:
                return @"Stopped";
            case AWSa2i-runtime.sagemakerHumanLoopStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSa2i-runtime.sagemakerHumanLoopDataAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentClassifiers" : @"ContentClassifiers",
             };
}

@end

@implementation AWSa2i-runtime.sagemakerHumanLoopInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputContent" : @"InputContent",
             };
}

@end

@implementation AWSa2i-runtime.sagemakerHumanLoopOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3Uri" : @"OutputS3Uri",
             };
}

@end

@implementation AWSa2i-runtime.sagemakerHumanLoopSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"flowDefinitionArn" : @"FlowDefinitionArn",
             @"humanLoopName" : @"HumanLoopName",
             @"humanLoopStatus" : @"HumanLoopStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)humanLoopStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerHumanLoopStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerHumanLoopStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerHumanLoopStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerHumanLoopStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerHumanLoopStatusStopping);
        }
        return @(AWSa2i-runtime.sagemakerHumanLoopStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSa2i-runtime.sagemakerHumanLoopStatusInProgress:
                return @"InProgress";
            case AWSa2i-runtime.sagemakerHumanLoopStatusFailed:
                return @"Failed";
            case AWSa2i-runtime.sagemakerHumanLoopStatusCompleted:
                return @"Completed";
            case AWSa2i-runtime.sagemakerHumanLoopStatusStopped:
                return @"Stopped";
            case AWSa2i-runtime.sagemakerHumanLoopStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSa2i-runtime.sagemakerListHumanLoopsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"flowDefinitionArn" : @"FlowDefinitionArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSa2i-runtime.sagemakerSortOrderDescending);
        }
        return @(AWSa2i-runtime.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSa2i-runtime.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSa2i-runtime.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSa2i-runtime.sagemakerListHumanLoopsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopSummaries" : @"HumanLoopSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)humanLoopSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSa2i-runtime.sagemakerHumanLoopSummary class]];
}

@end

@implementation AWSa2i-runtime.sagemakerStartHumanLoopRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAttributes" : @"DataAttributes",
             @"flowDefinitionArn" : @"FlowDefinitionArn",
             @"humanLoopInput" : @"HumanLoopInput",
             @"humanLoopName" : @"HumanLoopName",
             };
}

+ (NSValueTransformer *)dataAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSa2i-runtime.sagemakerHumanLoopDataAttributes class]];
}

+ (NSValueTransformer *)humanLoopInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSa2i-runtime.sagemakerHumanLoopInput class]];
}

@end

@implementation AWSa2i-runtime.sagemakerStartHumanLoopResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopArn" : @"HumanLoopArn",
             };
}

@end

@implementation AWSa2i-runtime.sagemakerStopHumanLoopRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopName" : @"HumanLoopName",
             };
}

@end

@implementation AWSa2i-runtime.sagemakerStopHumanLoopResponse

@end
