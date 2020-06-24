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

#import "AWSHoneycodeModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSHoneycodeErrorDomain = @"com.amazonaws.AWSHoneycodeErrorDomain";

@implementation AWSHoneycodeColumnMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"format" : @"format",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatAuto);
        }
        if ([value caseInsensitiveCompare:@"NUMBER"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatNumber);
        }
        if ([value caseInsensitiveCompare:@"CURRENCY"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatCurrency);
        }
        if ([value caseInsensitiveCompare:@"DATE"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatDate);
        }
        if ([value caseInsensitiveCompare:@"TIME"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatTime);
        }
        if ([value caseInsensitiveCompare:@"DATE_TIME"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatDateTime);
        }
        if ([value caseInsensitiveCompare:@"PERCENTAGE"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatPercentage);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatText);
        }
        if ([value caseInsensitiveCompare:@"ACCOUNTING"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatAccounting);
        }
        if ([value caseInsensitiveCompare:@"CONTACT"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatContact);
        }
        if ([value caseInsensitiveCompare:@"ROWLINK"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatRowlink);
        }
        return @(AWSHoneycodeFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHoneycodeFormatAuto:
                return @"AUTO";
            case AWSHoneycodeFormatNumber:
                return @"NUMBER";
            case AWSHoneycodeFormatCurrency:
                return @"CURRENCY";
            case AWSHoneycodeFormatDate:
                return @"DATE";
            case AWSHoneycodeFormatTime:
                return @"TIME";
            case AWSHoneycodeFormatDateTime:
                return @"DATE_TIME";
            case AWSHoneycodeFormatPercentage:
                return @"PERCENTAGE";
            case AWSHoneycodeFormatText:
                return @"TEXT";
            case AWSHoneycodeFormatAccounting:
                return @"ACCOUNTING";
            case AWSHoneycodeFormatContact:
                return @"CONTACT";
            case AWSHoneycodeFormatRowlink:
                return @"ROWLINK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSHoneycodeDataItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"formattedValue" : @"formattedValue",
             @"overrideFormat" : @"overrideFormat",
             @"rawValue" : @"rawValue",
             };
}

+ (NSValueTransformer *)overrideFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatAuto);
        }
        if ([value caseInsensitiveCompare:@"NUMBER"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatNumber);
        }
        if ([value caseInsensitiveCompare:@"CURRENCY"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatCurrency);
        }
        if ([value caseInsensitiveCompare:@"DATE"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatDate);
        }
        if ([value caseInsensitiveCompare:@"TIME"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatTime);
        }
        if ([value caseInsensitiveCompare:@"DATE_TIME"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatDateTime);
        }
        if ([value caseInsensitiveCompare:@"PERCENTAGE"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatPercentage);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatText);
        }
        if ([value caseInsensitiveCompare:@"ACCOUNTING"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatAccounting);
        }
        if ([value caseInsensitiveCompare:@"CONTACT"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatContact);
        }
        if ([value caseInsensitiveCompare:@"ROWLINK"] == NSOrderedSame) {
            return @(AWSHoneycodeFormatRowlink);
        }
        return @(AWSHoneycodeFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSHoneycodeFormatAuto:
                return @"AUTO";
            case AWSHoneycodeFormatNumber:
                return @"NUMBER";
            case AWSHoneycodeFormatCurrency:
                return @"CURRENCY";
            case AWSHoneycodeFormatDate:
                return @"DATE";
            case AWSHoneycodeFormatTime:
                return @"TIME";
            case AWSHoneycodeFormatDateTime:
                return @"DATE_TIME";
            case AWSHoneycodeFormatPercentage:
                return @"PERCENTAGE";
            case AWSHoneycodeFormatText:
                return @"TEXT";
            case AWSHoneycodeFormatAccounting:
                return @"ACCOUNTING";
            case AWSHoneycodeFormatContact:
                return @"CONTACT";
            case AWSHoneycodeFormatRowlink:
                return @"ROWLINK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSHoneycodeGetScreenDataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"screenId" : @"screenId",
             @"variables" : @"variables",
             @"workbookId" : @"workbookId",
             };
}

+ (NSValueTransformer *)variablesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSHoneycodeVariableValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSHoneycodeGetScreenDataResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"results" : @"results",
             @"workbookCursor" : @"workbookCursor",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSHoneycodeResultSet class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSHoneycodeInvokeScreenAutomationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"clientRequestToken" : @"clientRequestToken",
             @"rowId" : @"rowId",
             @"screenAutomationId" : @"screenAutomationId",
             @"screenId" : @"screenId",
             @"variables" : @"variables",
             @"workbookId" : @"workbookId",
             };
}

+ (NSValueTransformer *)variablesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSHoneycodeVariableValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSHoneycodeInvokeScreenAutomationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workbookCursor" : @"workbookCursor",
             };
}

@end

@implementation AWSHoneycodeResultRow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataItems" : @"dataItems",
             @"rowId" : @"rowId",
             };
}

+ (NSValueTransformer *)dataItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHoneycodeDataItem class]];
}

@end

@implementation AWSHoneycodeResultSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"headers" : @"headers",
             @"rows" : @"rows",
             };
}

+ (NSValueTransformer *)headersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHoneycodeColumnMetadata class]];
}

+ (NSValueTransformer *)rowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSHoneycodeResultRow class]];
}

@end

@implementation AWSHoneycodeVariableValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rawValue" : @"rawValue",
             };
}

@end
